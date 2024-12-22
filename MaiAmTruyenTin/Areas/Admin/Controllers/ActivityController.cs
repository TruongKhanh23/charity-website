//Khai báo DAO và EF trong Model
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
    public class ActivityController : BaseController
    {
        // GET: Admin/Activity
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/Activity
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new ActivityDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create(Activity model)
        {
            //Image
            string fileName = Path.GetFileNameWithoutExtension(model.ImageFile.FileName);
            string extension = Path.GetExtension(model.ImageFile.FileName);
            fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
            model.Image = "~/Data/images/Activity/" + fileName;
            fileName = Path.Combine(Server.MapPath("~/Data/images/Activity/"), fileName);
            model.ImageFile.SaveAs(fileName);

            var id = new ActivityDao().Insert(model);
            if (id > 0)
            {
                SetAlert("Thêm hoạt động thành công", "success");
                return RedirectToAction("Index", "Activity");
            }
            else
            {
                ModelState.AddModelError("", "Thêm hoạt động không thành công");
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var activity = new ActivityDao().ViewDetail(id);
            Session["imgPath"] = activity.Image;
            return View(activity);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit(Activity activity, HttpPostedFileBase img)
        {
            if (img != null)
            {
                string _ImagesPath = "~/Data/images/Activity/";
                string fileName = Path.GetFileNameWithoutExtension(img.FileName);
                string extension = Path.GetExtension(img.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                activity.Image = _ImagesPath + fileName;
                fileName = Path.Combine(Server.MapPath(_ImagesPath), fileName);
                string oldImgPath = Request.MapPath(Session["imgPath"].ToString());
                img.SaveAs(fileName);
                if (System.IO.File.Exists(oldImgPath))
                {
                    System.IO.File.Delete(oldImgPath);
                }
            }
            else
            {
                activity.Image = Session["imgPath"].ToString();
            }

            var dao = new ActivityDao();
            var result = dao.Update(activity);
            if (result)
            {
                SetAlert("Sửa hoạt động thành công", "success");
                return RedirectToAction("Index", "Activity");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật hoạt động không thành công");
            }
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new ActivityDao().Delete(id);
            }
            catch
            {

            }
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
        public JsonResult ChangeStatus(long id)
        {
            var result = new ActivityDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}