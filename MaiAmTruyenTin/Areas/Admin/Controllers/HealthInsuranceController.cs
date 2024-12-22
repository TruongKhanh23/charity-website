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


namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class HealthInsuranceController : BaseController
    {
        // GET: Admin/HealthInsurance
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/HealthInsurance
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var model = new HealthInsuranceDao().ListAllCategory(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        //[HttpGet]
        //public ActionResult Create()
        //{
        //    SetViewBagName();
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
                }
                else
                {
                    SetViewBagName();
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
        public ActionResult Create(HealthInsurance healthinsurance)
        {
            var dao = new HealthInsuranceDao();
            int id = dao.Insert(healthinsurance);
            if (id > 0)
            {
                SetAlert("Thêm bảo hiểm y tế thành công", "success");
                return RedirectToAction("Index", "HealthInsurance");
            }
            else
            {
                ModelState.AddModelError("", "Thêm bảo hiểm y tế không thành công");
            }
            SetViewBagName(healthinsurance.ChildrenID);
            return View("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var healthinsurance = new HealthInsuranceDao().ViewDetail(id);
            SetViewBagName();
            ViewBag.ChildrenName = db.Children.Find(db.HealthInsurances.Find(id).ChildrenID).FullName;
            ViewBag.ChildrenID = db.Children.Find(db.HealthInsurances.Find(id).ChildrenID).ID;
            return View(healthinsurance);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(HealthInsurance healthinsurance, string Status)
        {
            var dao = new HealthInsuranceDao();
            var result = dao.Update(healthinsurance);
            if (result)
            {
                SetAlert("Sửa bảo hiểm y tế thành công", "success");
                return RedirectToAction("Index", "HealthInsurance");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật bảo hiểm y tế không thành công");
            }
            SetViewBagName(healthinsurance.ChildrenID);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new HealthInsuranceDao().Delete(id);
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
            HealthInsurance healthinsurance = db.HealthInsurances.Find(id);
            ViewBag.ChildrenName = db.Children.Find(db.HealthInsurances.Find(id).ChildrenID).FullName;
            if (healthinsurance == null)
            {
                return HttpNotFound();
            }
            return View(healthinsurance);
        }
        public void SetViewBagName(long? selectedID = null)
        {
            var dao = new ChildrenDao();
            ViewBag.ChildrenFullName = new SelectList(dao.ListChildrenHasNotInsurance(), "ID", "FullName", selectedID);
        }
    }
}
