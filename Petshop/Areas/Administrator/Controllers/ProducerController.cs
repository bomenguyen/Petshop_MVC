using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Petshop.Areas.Administrator.Controllers
{
    public class ProducerController : Controller
    {
        Models.AdminContent dbPdc = new Models.AdminContent();
        //
        // GET: /Administrator/Producer/
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
                ViewBag.PdcError = error;
                return View(dbPdc.NCCs.ToList());
            //}
        }

        [HandleError]
        [HttpGet]
        public ActionResult Create()
        { return View();
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
            //   
            //}
        }

        [HandleError]
        [HttpPost]
        public ActionResult Create(Models.NCC createPdc, HttpPostedFileBase file)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                if (file != null)
                {
                    
                    var pdc = dbPdc.NCCs.SingleOrDefault(c => c.MaNCC.Equals(createPdc.MaNCC));
                    try
                    {
                        if (ModelState.IsValid)
                        {
                            if (pdc != null)
                            {
                                ViewBag.CreatePdcError = "Hãng sản xuất đã tồn tại.";
                            }
                            else
                            {
                                dbPdc.NCCs.Add(createPdc);
                                dbPdc.SaveChanges();
                                ViewBag.CreatePdcError = "Thêm hãng sản xuất thành công.";
                            }
                        }
                    }
                    catch (Exception)
                    {
                        ViewBag.CreatePdcError = "Không thể thêm hãng sản xuất.";
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
            //return View(dbPdc.NCCs.SingleOrDefault(e => e.MaNCC.Equals(id)));
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
            var model = dbPdc.NCCs.SingleOrDefault(p => p.MaNCC.Equals(id));
            return View(model);
            //}
        }

        [HandleError]
        [HttpPost]
        public ActionResult Edit(Models.NCC editPdc, HttpPostedFileBase file)
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
                        dbPdc.Entry(editPdc).State = System.Data.Entity.EntityState.Modified;
                        dbPdc.SaveChanges();
                        ViewBag.EditPdcError = "Cập nhật hãng sản xuất thành công.";
                    }
                }
                catch (Exception)
                {
                    ViewBag.EditPdcError = "Không thể cập nhật hãng sản xuất.";
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
            {
                var model = dbPdc.NCCs.SingleOrDefault(h => h.MaNCC.Equals(id));
                try
                {
                    if (model != null)
                    {
                        dbPdc.NCCs.Remove(model);
                        dbPdc.SaveChanges();
                        return RedirectToAction("Index", "Producer", new { error = "Xoá hãng sản xuất thành công." });
                    }
                    else
                    {
                        return RedirectToAction("Index", "Producer", new { error = "Hãng sản xuất không tồn tại." });
                    }
                }
                catch (Exception)
                {
                    return RedirectToAction("Index", "Producer", new { error = "Không thể xoá hãng sản xuất." });
                }
            }
        }
    }
}