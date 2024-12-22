using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MaiAmTruyenTin.Common;
using Model;
using Model.DAO;
using Model.EF;
using System.Data;
//using System.Data.Entity;
using System.Net;
using PagedList;
using System.IO;
using System.Web.UI.HtmlControls;
using Microsoft.Ajax.Utilities;

namespace MaiAmTruyenTin.Controllers
{
    public class ActivityController : Controller
    {
        // GET: Activity
        MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Content
        public ActionResult Index()
        {
            var model = new ActivityDao().GetActivity(3);
            return View(model);
        }
        [OutputCache(Duration = 60 * 30, VaryByParam = "searchString")]
        public ActionResult Find(string searchString, int page = 1, int pageSize = 9)
        {
            var dao = new ActivityDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        public ActionResult PartialViewActivity()
        {
            var dao = new ActivityDao();
            var model = dao.GetActivity(3);
            return PartialView(model);
        }
        public ActionResult PartialViewAllActivity(string searchString, int page = 1, int pageSize = 6)
        {
            var dao = new ActivityDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            return PartialView(model);
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            //SetViewBag();
            Activity activity = db.Activities.Find(id);
            if (activity == null)
            {
                return HttpNotFound();
            }
            return View(activity);
        }
    }
}