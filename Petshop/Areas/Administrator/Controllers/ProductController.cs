using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Petshop.Areas.Administrator.Controllers
{
    public class ProductController : Controller
    {
        Models.AdminContent dbPro = new Models.AdminContent();
        Petshop.Repository.PetDAO shopDAO = new Repository.PetDAO();
        //
        // GET: /Administrator/Product/
        [HandleError]
        public ActionResult Index(string error, string name)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                //ViewBag.ProError = error;
                var model = dbPro.THONGTIN_PET.ToList();
                if (!string.IsNullOrEmpty(name))
                {
                    model = model.Where(p => p.TenP.Contains(name)).ToList();
                }
                return View(model);
            //}
        }

        [HandleError]
        [HttpGet]
        public ActionResult Create()
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                ViewBag.pdcListCreate = new SelectList(dbPro.NCCs, "MaNCC", "TeNNCC");
                ViewBag.typeListCreate = new SelectList(dbPro.DANHMUCs, "MaDM", "TenDM");
                return View();
            //}
        }

        [HandleError]
        [HttpPost]
        public ActionResult Create(Models.THONGTIN_PET createPro, HttpPostedFileBase file)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                ViewBag.pdcListCreate = new SelectList(dbPro.NCCs, "MaNCC", "TeNNCC");
                ViewBag.typeListCreate = new SelectList(dbPro.DANHMUCs, "MaDM", "TenDM");
                var pro = dbPro.THONGTIN_PET.SingleOrDefault(c => c.MaP.Equals(createPro.MaP));
                if (file != null)
                {
                    if (file.ContentLength > 0)
                    {
                        try
                        {
                            string nameFile = Path.GetFileName(file.FileName);
                            file.SaveAs(Path.Combine(Server.MapPath("/Image"), nameFile));
                            createPro.ANH = "/Image/" + nameFile;
                        }
                        catch (Exception)
                        {
                            ViewBag.CreateProError = "Không thể chọn ảnh.";
                        }
                    }
                   
                    try
                    {
                        if (pro != null)
                        {
                            ViewBag.CreateProError = "Mã sản phẩm đã tồn tại.";
                        }
                        else
                        {
                            dbPro.THONGTIN_PET.Add(createPro);
                            dbPro.SaveChanges();
                            ViewBag.CreateProError = "Thêm sản phẩm thành công.";
                        }
                    }
                    catch (Exception)
                    {
                        ViewBag.CreateProError = "Không thể thêm sản phẩm.";
                    }
                }
                else
                {
                    ViewBag.HinhAnh = "Vui lòng chọn hình ảnh.";
                }
                return View();
            //}
        }

        [HandleError]
        [HttpGet]
        public ActionResult Edit(string id)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                ViewBag.pdcListEdit = new SelectList(dbPro.NCCs, "MaNCC", "TeNNCC");
                ViewBag.typeListEdit = new SelectList(dbPro.DANHMUCs, "MaDM", "TenDM");
                var model = dbPro.THONGTIN_PET.SingleOrDefault(p => p.MaP.Equals(id));
                return View(model);
            //}
        }

        [HandleError]
        [HttpPost]
        public ActionResult Edit(Models.THONGTIN_PET editPro, HttpPostedFileBase file)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                ViewBag.pdcListEdit = new SelectList(dbPro.NCCs, "MaNCC", "TeNNCC");
                ViewBag.typeListEdit = new SelectList(dbPro.DANHMUCs, "MaDM", "TenDM");
                if (file != null)
                {
                    if (file.ContentLength > 0)
                    {
                        try
                        {
                            string nameFile = Path.GetFileName(file.FileName);
                            file.SaveAs(Path.Combine(Server.MapPath("/Image"), nameFile));
                            editPro.ANH = "/Image/" + nameFile;
                    }
                        catch (Exception)
                        {
                            ViewBag.EditProError = "Không thể chọn ảnh.";
                        }
                    }
                }
               
                try
                {
                    dbPro.Entry(editPro).State = System.Data.Entity.EntityState.Modified;
                    dbPro.SaveChanges();
                    ViewBag.EditProError = "Cập nhật sản phẩm thành công.";
                }
                catch (Exception)
                {
                    ViewBag.EditProError = "Không thể cập nhật sản phẩm.";
                }
                return View();
            //}
        }

        [HandleError]
        public ActionResult Delete(string id)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                var model = dbPro.THONGTIN_PET.SingleOrDefault(h => h.MaP.Equals(id));
                try
                {
                    if (model != null)
                    {
                        dbPro.THONGTIN_PET.Remove(model);
                        dbPro.SaveChanges();
                        return RedirectToAction("Index", "Product", new { error = "Xoá sản phẩm thành công." });
                    }
                    else
                    {
                        return RedirectToAction("Index", "Product", new { error = "Sản phẩm không tồn tại." });
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Index", "Product", new { error = "Không thể xoá sản phẩm." });
                }
            //}
        }

        public ActionResult Details(string id)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                var model = dbPro.THONGTIN_PET.SingleOrDefault(p => p.MaP.Equals(id));
                return View(model);
            //}
        }
    }
}