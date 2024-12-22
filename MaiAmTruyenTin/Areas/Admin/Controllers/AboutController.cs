using Model.DAO;
using Model.EF;
using Model.ViewModel;
//Khai báo Common
using MaiAmTruyenTin.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using Model;
using System.Data;
using System.Data.Entity;
using System.Net;
using PagedList;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Web.WebSockets;
using System.Data.SqlClient;
using System.Drawing;
using System.Data.Entity.Infrastructure;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class AboutController : BaseController
    {
        // GET: Admin/About
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //SetViewBag();
            About about = db.Abouts.Find(id);
            if (about == null)
            {
                return HttpNotFound();
            }
            return View(about);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var about = db.Abouts.Find(id);
            return View(about);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit(About about)
        {
            var dao = new ActivityDao();
            var result = dao.UpdateAbout(about);
            if (result)
            {
                SetAlert("Sửa thông tin giới thiệu mái ấm thành công", "success");
                return Redirect("/he-thong/gioi-thieu/chi-tiet/" + about.ID);
            }
            else
            {
                ModelState.AddModelError("", "Cập thông tin giới thiệu mái ấm không thành công");
            }
            return View();
        }
        public string Slogan()
        {
            string slogan = db.Abouts.Find(2).Slogan;
            return slogan;
        }


    }
}