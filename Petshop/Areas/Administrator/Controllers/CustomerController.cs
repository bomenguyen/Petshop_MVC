using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Petshop.Areas.Administrator.Controllers
{
    public class CustomerController : Controller
    {
        Models.AdminContent dbCus = new Models.AdminContent();
        //
        // GET: /Administrator/Category/
        [HandleError]
        public ActionResult Index(string name, string error)
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                ViewBag.CusError = error;
                var model = dbCus.KHACHHANGs.ToList();
                if (!string.IsNullOrEmpty(name))
                {
                    model = model.Where(p => p.DienthoaiKH.Contains(name)).ToList();
                }
                return View(model);
            //}
        }
    }
}