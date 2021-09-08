using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Petshop.Areas.Administrator.Controllers
{
    public class DefaultController : Controller
    {
        Models.AdminContent db = new Models.AdminContent();
        Repository.PetDAO dao = new Repository.PetDAO();
        [HandleError]
        // GET: Administrator/Home
        public ActionResult Index()
        {
            //if (Session["accname"] == null)
            //{
            //    Session["accname"] = null;
            //    return RedirectToAction("Login", "Account");
            //}
            //else
            //{
                return View();
            //}
        }
    }
    
}