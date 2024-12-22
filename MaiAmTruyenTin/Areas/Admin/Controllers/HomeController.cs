using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
//using Model;
//using Model.DAO;
//using Model.EF;
using System.Data;
//using System.Data.Entity;
using System.Net;
using PagedList;
using System.IO;
using System.Web.UI.HtmlControls;
//using Model.ViewModel;
using System.Web.Mvc.Ajax;
using Model.EF;
using Model.DAO;
using System.Web.Security;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        UserDao dao = new UserDao();

        public ActionResult Index()
        {
            List<User> lst = new List<User>();
            return View(lst);
        }
        public ActionResult GetUser()
        {
            try
            {
                List<User> lst = new List<User>();
                return PartialView(lst);
            }
            catch (Exception)
            {
                return RedirectToAction("Index", "Login");
            }
        }
        public ActionResult LogOut()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.RemoveAll();
            Session.Abandon();
            return RedirectToAction("Index", "Login");
        }
        public ActionResult Error()
        {
            return View();
        }
    }
}