using Petshop.Areas.User.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Petshop.Areas.User.Controllers
{
    public class ThanhToanController : Controller
    {
        UserContent db = new UserContent();
        // GET: Shopper/ThanhToan
        public ActionResult Index()
        {
            List<CartItem> giohang = Session["giohang"] as List<CartItem>;
            return View(giohang);
        }

        [HttpPost]
        public ActionResult StepEnd()
        {
            //Nhận reqest từ trang index
            string phone = Request.Form["phone"];
            string hoten = Request.Form["hoten"];
            string email = Request.Form["email"];
            string address = Request.Form["address"];
            
            //kiểm tra xem có customer chưa và cập nhật lại
            KHACHHANG newCus = new KHACHHANG();
            var cus = db.KHACHHANGs.FirstOrDefault(p => p.DienthoaiKH.Equals(phone));
            if (cus != null)
            {
                //nếu có phone trong db rồi
                //cập nhật thông tin và lưu
                cus.HoTen = hoten;
                cus.Email = email;
                cus.DiachiKH = address;
                db.Entry(cus).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            else
            {
                //nếu chưa có phone trong db
                //thêm thông tin và lưu
                newCus.DienthoaiKH = phone;
                newCus.HoTen = hoten;
                newCus.Email = email;
                newCus.DiachiKH = address;
                db.KHACHHANGs.Add(newCus);
                db.SaveChanges();
            }
            //Thêm thông tin vào order và orderdetail
            List<CartItem> giohang = Session["giohang"] as List<CartItem>;
            //thêm order mới
            DON_DAT_HANG newOrder = new DON_DAT_HANG();
            string newIDOrder = (Int32.Parse(db.DON_DAT_HANG.OrderByDescending(p => p.Ngaydat).FirstOrDefault().MaDH.Replace("HD", "")) + 1).ToString();
            newOrder.MaDH = "HD" + newIDOrder;
            newOrder.DienthoaiKH = phone;
            newOrder.Ngaydat = DateTime.Now.ToString();
            newOrder.Thanhtoan = "0";
            db.DON_DAT_HANG.Add(newOrder);
            db.SaveChanges();
            //thêm details
            for (int i = 0; i < giohang.Count; i++)
            {
                CT_DAT_HANG newOrdts = new CT_DAT_HANG();
                newOrdts.MaDH = newOrder.MaDH;
                newOrdts.MaP = giohang.ElementAtOrDefault(i).SanPhamID;
                newOrdts.SoLuong = giohang.ElementAtOrDefault(i).SoLuong.ToString();
                newOrdts.DonGia = giohang.ElementAtOrDefault(i).ThanhTien.ToString();
                db.CT_DAT_HANG.Add(newOrdts);
                db.SaveChanges();
            }
            Session["MHD"] = "HD" + newIDOrder;
            Session["Phone"] = phone;
            //xoá sạch giỏ hàng
            giohang.Clear();
            return RedirectToAction("HoaDon", "ThanhToan");
        }

        public ActionResult HoaDon()
        {
            return View();
        }
    }
}