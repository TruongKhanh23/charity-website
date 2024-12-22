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
    public class SchoolReportDetailController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/SchoolReportDetail
        //public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        //{
        //    var model = new SchoolReportDetailDao().ListAllCategory(searchString, page, pageSize);
        //    ViewBag.SearchString = searchString;
        //    return PartialView(model);
        //}

        [HttpGet]
        public ActionResult Create(int schoolReportID)
        {
            ViewBag.SchoolReportID = schoolReportID;
            ViewBag.SchoolReportName = db.SchoolReports.Find(schoolReportID).Code;
            ViewBag.SchoolReportTypeName = db.SchoolReportTypes.Find(db.SchoolReports.Find(schoolReportID).Type).Name.ToUpper();
            ViewBag.ChildrenName = db.Children.Find(db.SchoolReports.Find(schoolReportID).ChildrenID).FullName.ToUpper();
            SetViewBagSchoolReportID();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(SchoolReportDetail schoolreportdetail)
        {
            string fileName = Path.GetFileNameWithoutExtension(schoolreportdetail.PDFFile.FileName);
            string extension = Path.GetExtension(schoolreportdetail.PDFFile.FileName);
            fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
            schoolreportdetail.Image = "~/Data/files/" + fileName;
            fileName = Path.Combine(Server.MapPath("~/Data/files/"), fileName);
            schoolreportdetail.PDFFile.SaveAs(fileName);

            var dao = new SchoolReportDetailDao();
            int id = dao.Insert(schoolreportdetail);
            if (id > 0)
            {
                SetAlert("Thêm kết quả học tập thành công", "success");
                return RedirectToAction("Details", "SchoolReport", new { id = schoolreportdetail.SchoolReportID });
            }
            else
            {
                ModelState.AddModelError("", "Thêm kết quả học tập không thành công");
            }
            SetViewBagSchoolReportID(schoolreportdetail.SchoolReportID);
            return View("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var schoolreportdetail = new SchoolReportDetailDao().ViewDetail(id);
            Session["pdfPath"] = schoolreportdetail.Image;
            SetViewBagName();
            int SchoolReportID = schoolreportdetail.SchoolReportID;
            ViewBag.SchoolReportCode = db.SchoolReports.Find(SchoolReportID).Code;
            int ChildrenID = db.SchoolReports.Find(SchoolReportID).ChildrenID;
            ViewBag.ChildrenName = db.Children.Find(ChildrenID).FullName.ToUpper();
            return View(schoolreportdetail);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(SchoolReportDetail schoolreportdetail, HttpPostedFileBase pdfFile)
        {
            string _pdfPath = "~/Data/files/";
            //Image
            if (pdfFile != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(pdfFile.FileName);
                string extension = Path.GetExtension(pdfFile.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                schoolreportdetail.Image = _pdfPath + fileName;
                fileName = Path.Combine(Server.MapPath("~/Data/files/"), fileName);
                string oldImgPath = Request.MapPath(Session["pdfPath"].ToString());
                pdfFile.SaveAs(fileName);
                if (System.IO.File.Exists(oldImgPath))
                {
                    System.IO.File.Delete(oldImgPath);
                }
            }
            else
            {
                schoolreportdetail.Image = Session["pdfPath"].ToString();
            }

            var dao = new SchoolReportDetailDao();
            var result = dao.Update(schoolreportdetail);
            if (result)
            {
                SetAlert("Sửa kết quả học tập thành công", "success");
                return RedirectToAction("Details", "SchoolReport", new { id = schoolreportdetail.SchoolReportID });
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật kết quả học tập không thành công");
            }
            SetViewBagName(schoolreportdetail.SchoolReportID);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new SchoolReportDetailDao().Delete(id);
            }
            catch
            {

            }
        }
        public string ChildrenNameOfReport(int id)
        {
            string childrenName = "";
            var model = from a in db.Children
                        join b in db.SchoolReports on a.ID equals b.ChildrenID into Table1
                        from b in Table1.ToList()
                        join c in db.SchoolReportDetails on b.ID equals c.SchoolReportID into Table2
                        from c in Table2.ToList()
                        select new SchoolReportViewModel()
                        {
                            ID = b.ID,
                            ChildrenName = a.FullName
                        };
            model = model.Where(x => x.ID == id);
            childrenName = model.FirstOrDefault().ChildrenName;
            return childrenName.ToUpper();
        }
        public FileResult DownloadPDF(string pdfFile)
        {
            return File(pdfFile, "application /pdf");
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SetViewBagName();
            SchoolReportDetail schoolreportdetail = db.SchoolReportDetails.Find(id);
            int SchoolReportID = schoolreportdetail.SchoolReportID;
            ViewBag.SchoolReportCode = db.SchoolReports.Find(SchoolReportID).Code;
            int ChildrenID = db.SchoolReports.Find(SchoolReportID).ChildrenID;
            ViewBag.ChildrenName = db.Children.Find(ChildrenID).FullName;
            if (schoolreportdetail == null)
            {
                return HttpNotFound();
            }
            return View(schoolreportdetail);
        }
        public void SetViewBagCreatedBy(long? selectedID = null)
        {
            var dao = new UserDao();
            ViewBag.UserID = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        public void SetViewBagSchoolReportID(long? selectedID = null)
        {
            var dao = new SchoolReportDao();
            ViewBag.SchoolReportCode = new SelectList(dao.ListAll(), "ID", "Code", selectedID);
        }
        public void SetViewBagName(long? selectedID = null)
        {
            var dao = new ChildrenDao();
            ViewBag.ChildrenID = new SelectList(dao.ListAll(), "ID", "FullName", selectedID);
        }

        //public JsonResult ChangeStatus(long id)
        //{
        //    var result = new SchoolReportDetailDao().ChangeStatus(id);
        //    return Json(new
        //    {
        //        status = result
        //    });
        //}
    }
}