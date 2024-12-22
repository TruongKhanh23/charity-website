//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
//Khai báo Common
using System.Web.Mvc;
using System.Net;
using System;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class SocialInsuranceController : BaseController
    {
        // GET: Admin/SocialInsurance
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/SocialInsurance
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var model = new SocialInsuranceDao().ListAllCategory(searchString, page, pageSize);
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
        public ActionResult Create(SocialInsurance socialinsurance)
        {
            var dao = new SocialInsuranceDao();
            int id = dao.Insert(socialinsurance);
            if (id > 0)
            {
                SetAlert("Thêm bảo hiểm xã hội thành công", "success");
                return RedirectToAction("Index", "SocialInsurance");
            }
            else
            {
                ModelState.AddModelError("", "Thêm bảo hiểm xã hội không thành công");
            }
            SetViewBagName(socialinsurance.EmployeeID);
            return View("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var socialinsurance = new SocialInsuranceDao().ViewDetail(id);
            SetViewBagName();
            return View(socialinsurance);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(SocialInsurance socialinsurance, string Status)
        {
            if (Status == "on")
                socialinsurance.Status = true;
            else
                socialinsurance.Status = false;
            var dao = new SocialInsuranceDao();
            var result = dao.Update(socialinsurance);
            if (result)
            {
                SetAlert("Sửa bảo hiểm xã hội thành công", "success");
                return RedirectToAction("Index", "SocialInsurance");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật bảo hiểm xã hội không thành công");
            }
            SetViewBagName(socialinsurance.EmployeeID);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new SocialInsuranceDao().Delete(id);
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
            SocialInsurance socialinsurance = db.SocialInsurances.Find(id);
            if (socialinsurance == null)
            {
                return HttpNotFound();
            }
            return View(socialinsurance);
        }
        public void SetViewBagName(long? selectedID = null)
        {
            var dao = new EmployeeDao();
            ViewBag.EmployeeName = new SelectList(dao.ListEmployeeHasNotInsurance(), "ID", "Name", selectedID);
        }
    }
}