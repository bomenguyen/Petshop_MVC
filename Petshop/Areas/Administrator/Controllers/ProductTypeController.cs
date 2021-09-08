using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Petshop.Areas.Administrator.Controllers
{
    public class ProductTypeController : Controller
    {Models.AdminContent dbType = new Models.AdminContent();
        //
        // GET: /Administrator/ProductType/
        [HandleError]
        public ActionResult Index(string error)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                ViewBag.TypeError = error;
                return View(dbType.DANHMUCs.ToList());
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
                ViewBag.cateListCreate = new SelectList(dbType.PHANLOAIs, "MaPL", "TenPL");
                return View();
            //}
        }

        [HandleError]
        [HttpPost]
        public ActionResult Create(Models.DANHMUC createType)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                ViewBag.cateListCreate = new SelectList(dbType.PHANLOAIs, "MaPL", "TenPL");
                try
                {
                    if (ModelState.IsValid)
                    {
                        dbType.DANHMUCs.Add(createType);
                        dbType.SaveChanges();
                        ViewBag.CreateTypeError = "Thêm loại sản phẩm thành công.";
                    }
                }
                catch (Exception)
                {
                    ViewBag.CreateTypeError = "Không thể thêm loại sản phẩm.";
                }
                return View();
            //}
        }

        [HandleError]
        [HttpGet]
        public ActionResult Edit(int id)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                ViewBag.cateListEdit = new SelectList(dbType.PHANLOAIs, "MaPL", "TenPL");
                return View(dbType.DANHMUCs.SingleOrDefault(e => e.MaDM.Equals(id)));
            //}
        }

        [HandleError]
        [HttpPost]
        public ActionResult Edit(Models.DANHMUC editType)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                ViewBag.cateListEdit = new SelectList(dbType.PHANLOAIs, "MaPL", "TenPL");
                try
                {
                    if (ModelState.IsValid)
                    {
                        dbType.Entry(editType).State = System.Data.Entity.EntityState.Modified;
                        dbType.SaveChanges();
                        ViewBag.EditTypeError = "Cập nhật loại sản phẩm thành công.";
                    }
                }
                catch (Exception)
                {
                    ViewBag.EditTypeError = "Không thể cập nhật loại sản phẩm.";
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
                var model = dbType.DANHMUCs.SingleOrDefault(h => h.MaDM.Equals(id));
                try
                {
                    if (model != null)
                    {
                        dbType.DANHMUCs.Remove(model);
                        dbType.SaveChanges();
                        return RedirectToAction("Index", "ProductType", new { error = "Xoá loại sản phẩm thành công." });
                    }
                    else
                    {
                        return RedirectToAction("Index", "ProductType", new { error = "Loại sản phẩm không tồn tại." });
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Index", "ProductType", new { error = "Không thể xoá loại sản phẩm." });
                }
            //}
        }
    }
}