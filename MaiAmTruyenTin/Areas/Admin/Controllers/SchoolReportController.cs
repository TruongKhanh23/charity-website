//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
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
using Model.ViewModel;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class SchoolReportController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/SchoolReport
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var model = new SchoolReportDao().ListAllCategory(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                ViewBag.STT = page * 10 - 9;
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        public ActionResult SchoolReportDetail(int schoolReportID, int page = 1, int pageSize = 10)
        {
            var model = new SchoolReportDetailDao().ListAllCategory(schoolReportID, page, pageSize);
            ViewBag.schoolReportID = schoolReportID;
            return PartialView(model);
        }

        //[HttpGet]
        //public ActionResult Create()
        //{
        //    SetViewBagName();
        //    SetViewBagSchoolReportType();
        //    return View();    
        //}
        [HttpGet]
        public ActionResult Create(int? ChildrenID = null)
        {
            try
            {
                if (!String.IsNullOrEmpty(ChildrenID.ToString()))
                {
                    SetViewBagName(ChildrenID);
                    SetViewBagSchoolReportType();
                }
                else
                {
                    SetViewBagName();
                    SetViewBagSchoolReportType();
                }
                return View();
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }

        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(SchoolReport schoolreport)
        {
            var dao = new SchoolReportDao();
            int id = dao.Insert(schoolreport);
            if (id > 0)
            {
                SetAlert("Thêm học bạ thành công", "success");
                return RedirectToAction("Index", "SchoolReport");
            }
            else
            {
                ModelState.AddModelError("", "Thêm học bạ không thành công");
            }
            SetViewBagName(schoolreport.ChildrenID);
            SetViewBagSchoolReportType(schoolreport.Type);
            return View("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var schoolreport = new SchoolReportDao().ViewDetail(id);
            SetViewBagName();
            SetViewBagSchoolReportType();
            return View(schoolreport);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(SchoolReport schoolreport, string Status)
        {
            if (Status == "on")
                schoolreport.Status = true;
            else
                schoolreport.Status = false;
            var dao = new SchoolReportDao();
            var result = dao.Update(schoolreport);
            if (result)
            {
                SetAlert("Sửa học bạ thành công", "success");
                return RedirectToAction("Details", "SchoolReport", new { id = schoolreport.ID });
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật học bạ không thành công");
            }
            SetViewBagName(schoolreport.ChildrenID);
            SetViewBagSchoolReportType(schoolreport.Type);
            return View();
        }
        public string ChildrenNameOfReport(int id)
        {
            string childrenName = "";
            var model = from a in db.Children
                        join b in db.SchoolReports on a.ID equals b.ChildrenID into Table1
                        from b in Table1.ToList()
                        select new SchoolReportViewModel()
                        {
                            ID = b.ID,
                            ChildrenName = a.FullName
                        };
            model = model.Where(x => x.ID == id);
            childrenName = model.FirstOrDefault().ChildrenName;
            return childrenName.ToUpper();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new SchoolReportDao().Delete(id);
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
            SetViewBagName();
            SetViewBagSchoolReportType();
            SchoolReport schoolreport = db.SchoolReports.Find(id);
            ViewBag.ChildrenName = db.Children.Find(db.SchoolReports.Find(id).ChildrenID).FullName;
            ViewBag.SchoolReportType = db.SchoolReportTypes.Find(db.SchoolReports.Find(id).Type).Name;
            if (schoolreport == null)
            {
                return HttpNotFound();
            }
            return View(schoolreport);
        }
        public void SetViewBagName(long? selectedID = null)
        {
            var dao = new ChildrenDao();
            ViewBag.ChildrenFullName = new SelectList(dao.ListAll(), "ID", "FullName", selectedID);
        }
        public void SetViewBagSchoolReportType(long? selectedID = null)
        {
            var dao = new SchoolReportTypeDao();
            ViewBag.SchoolReportTypeName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }

        //public JsonResult ChangeStatus(long id)
        //{
        //    var result = new SchoolReportDao().ChangeStatus(id);
        //    return Json(new
        //    {
        //        status = result
        //    });
        //}
    }
}