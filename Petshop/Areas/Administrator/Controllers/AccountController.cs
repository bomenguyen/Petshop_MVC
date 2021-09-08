using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Petshop.Areas.Administrator.Controllers
{
    public class AccountController : Controller
    {
        Models.AdminContent dbLog = new Models.AdminContent();
        Repository.PetDAO dao = new Repository.PetDAO();
        // GET: Administrator/Account
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken()]
        public ActionResult Login(Models.DANGNHAP adLogin)
        {
            try
            {
                var model = dbLog.DANGNHAPs.SingleOrDefault(a => a.tenDN.Equals(adLogin.tenDN));
                if (model != null)
                {
                    if (model.pass.Equals(dao.Encrypt(adLogin.pass)))
                    {
                        Session["accname"] = model.tenDN;
                        return RedirectToAction("Index", "Home");
                    }
                    else
                    {
                        Session["accname"] = null;
                        ViewBag.LoginError = "Sai tài khoản hoặc mật khẩu.";
                    }
                }
                else
                {
                    Session["accname"] = null;
                    ViewBag.LoginError = "Sai tài khoản hoặc mật khẩu.";
                }
            }
            catch (Exception)
            {
                Session["accname"] = null;
                ViewBag.LoginError = "Sai tài khoản hoặc mật khẩu.";
            }
            return View();
        }

        public ActionResult Logout()
        {
            System.Web.Security.FormsAuthentication.SignOut();
            Session["accname"] = null;
            return RedirectToAction("Login", "Account");
        }
    }
}
