using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MaiAmTruyenTin.Common;
using MaiAmTruyenTin.Areas.Admin.Models;
using Model;
using Model.DAO;
using Model.EF;
using System.Configuration;
using System.Xml.Linq;
using System.Net;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class SECategoryController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new SECategoryDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
        [HttpPost]
        public ActionResult Create(SECategory model)
        {
            //var dao = new SECategoryDao();
            //string id = dao.Insert(model);
            var id = new SECategoryDao().Insert(model);
            if (id > 0)
            {
                //SetAlert("Thêm loại thiết bị - vật tư thành công", "success");
                return RedirectToAction("Index", "SECategory");
            }
            else
            {
                ModelState.AddModelError("", "Thêm loại thiết bị - vật tư không thành công");
            }
            SetViewBag(model.CreatedBy);
            return View(model);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var secategory = new SECategoryDao().ViewDetail(id);
            SetViewBag();
            return View(secategory);
        }
        [HttpPost]
        public ActionResult Edit(SECategory secategory)
        {
            if (ModelState.IsValid)
            {
                var dao = new SECategoryDao();
                var result = dao.Update(secategory);
                if (result)
                {
                    //SetAlert("Sửa thể loại trẻ thành công", "success");
                    return RedirectToAction("Index", "SECategory");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thể loại trẻ không thành công");
                }
            }
            SetViewBag(secategory.ModifiedBy);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new SECategoryDao().Delete(id);
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
            SECategory secategory = db.SECategories.Find(id);
            if (secategory == null)
            {
                return HttpNotFound();
            }
            return View(secategory);
        }
        //public JsonResult ChangeStatus(long id)
        //{
        //    var result = new SECategoryDao().ChangeStatus(id);
        //    return Json(new
        //    {
        //        status = result
        //    });
        //}
        public void SetViewBag(string selectedID = null)
        {
            var dao = new UserDao();
            ViewBag.UserID = new SelectList(dao.ListAll(), "Name", "Name", selectedID);
        }
    }
}