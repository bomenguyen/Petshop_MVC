using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Petshop.Areas.Administrator.Controllers
{
    public class CategoryController : Controller
    {
        Models.AdminContent dbCate = new Models.AdminContent();
        // GET: Administrator/Category
        [HandleError]
        public ActionResult Index(string error)
        {
            //if (Session["accname"] == null)
           // {
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
           // }
           // else
           // {
                ViewBag.CateError = error;
                var modelCate = dbCate.PHANLOAIs.ToList();
                return View(modelCate);
           // }
        }

        [HandleError]
        public ActionResult Create()
        {
            return View();
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                
            //}
        }

        [HandleError]
        [HttpPost]
        public ActionResult Create(Models.PHANLOAI createCate, HttpPostedFileBase file)
        {
            try
            {
                if (dbCate.PHANLOAIs.SingleOrDefault(cr => cr.TenPL.Equals(createCate.TenPL)) == null)
                {
                    dbCate.PHANLOAIs.Add(createCate);
                    dbCate.SaveChanges();
                    ViewBag.CreateCategory = "Thêm danh mục thành công.";
                }
                else
                {
                    ViewBag.CreateCategory = "Tên danh mục đã tồn tại.";
                }
            }
            catch (Exception)
            {
                ViewBag.CreateCategory = "Không thể thêm danh mục.";
            }

            return View();
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{

            //}
        }

        [HandleError]
        public ActionResult Edit(int id)
        {
            var model = dbCate.PHANLOAIs.SingleOrDefault(c => c.MaPL.Equals(id));
            return View(model);
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                
            //}
        }

        [HandleError]
        [HttpPost]
        public ActionResult Edit(Models.PHANLOAI editCate, HttpPostedFileBase file)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
               
                try
                {
                    if (ModelState.IsValid)
                    {
                        if (dbCate.PHANLOAIs.SingleOrDefault(cr => cr.TenPL.Equals(editCate.TenPL)) == null)
                        {
                            dbCate.Entry(editCate).State = System.Data.Entity.EntityState.Modified;
                            dbCate.SaveChanges();
                            ViewBag.EditCategory = "Cập nhật danh mục thành công.";
                        }
                        else
                        {
                            ViewBag.EditCategory = "Tên danh mục đã tồn tại.";
                        }
                    }
                }
                catch (Exception)
                {
                    ViewBag.EditCategory = "Không thể cập nhật danh mục.";
                }
                return View();
            //}
        }

        [HandleError]
        public ActionResult Delete(int id)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                var model = dbCate.PHANLOAIs.SingleOrDefault(h => h.MaPL.Equals(id));
                try
                {
                    if (model != null)
                    {
                        dbCate.PHANLOAIs.Remove(model);
                        dbCate.SaveChanges();
                        return RedirectToAction("Index", "Category", new { error = "Xoá danh mục thành công." });
                    }
                    else
                    {
                        return RedirectToAction("Index", "Category", new { error = "Danh mục không tồn tại." });
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Index", "Category", new { error = "Không thể xoá danh mục." });
                }
           // }
        }
    }
}
