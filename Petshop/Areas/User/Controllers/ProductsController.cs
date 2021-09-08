using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

namespace Petshop.Areas.User.Controllers
{
    public class ProductsController : Controller
    {
        Models.UserContent db = new Models.UserContent();
        // GET: Pet/Products
        //hiển thị sản phẩm theo id loại
        public ActionResult ProductsByProType(int id, int? page)
        {
            ViewBag.typeName = db.DANHMUCs.SingleOrDefault(t => t.MaDM == id).TenDM;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.THONGTIN_PET.Where(t => t.MaDM == id).OrderByDescending(x => x.MaDM).ToPagedList(pageNumber, pageSize));
        }
        
        //hiển thị sản phẩm theo tên sp
        public ActionResult SearchByName(string name, int? page)
        {
            ViewBag.search = name;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.THONGTIN_PET.Where(p => p.TenP.Contains(name)).OrderByDescending(x => x.TenP).ToPagedList(pageNumber, pageSize));
        }
        //hiển thị sản phẩm theo tên loại
        public ActionResult ProductsBytypeName(string name, int? page)
        {
            ViewBag.tName = name;
            int pageSize = 8;
            int pageNumber = (page ?? 1);
            return View(db.THONGTIN_PET.Where(p => p.MaDM == db.DANHMUCs.FirstOrDefault(t => t.TenDM.Equals(name)).MaDM).OrderByDescending(x => x.MaP).ToPagedList(pageNumber, pageSize));
        }
       
        //Hiển thị chi tiết sản phẩm
        public ActionResult ProductDetail(string id)
        {
            return View(db.THONGTIN_PET.SingleOrDefault(p => p.MaP.Equals(id)));
        }
    }
}