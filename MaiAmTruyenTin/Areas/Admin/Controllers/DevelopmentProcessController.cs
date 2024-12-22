//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
//Khai báo Common
using System.Web.Mvc;
using System.Net;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class DevelopmentProcessController : BaseController
    {
        // GET: Admin/DevelopmentProcess
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/DevelopmentProcess
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var model = new DevelopmentProcessDao().ListAllCategory(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        public ActionResult Create(int? ChildrenID)
        {

            try
            {
                if (!string.IsNullOrEmpty(ChildrenID.ToString()))
                {
                    SetViewBagName(ChildrenID);
                }
                SetViewBagName();
                return View();
            }
            catch (System.Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(DevelopmentProcess developmentprocess)
        {
            var dao = new DevelopmentProcessDao();
            int id = dao.Insert(developmentprocess);
            if (id > 0)
            {
                SetAlert("Thêm lịch sử phát triển của trẻ thành công", "success");
                return RedirectToAction("Index", "DevelopmentProcess");
            }
            else
            {
                ModelState.AddModelError("", "Thêm lịch sử phát triển của trẻ không thành công");
            }
            SetViewBagName(developmentprocess.ChildrenID);
            return View("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var developmentprocess = new DevelopmentProcessDao().ViewDetail(id);
            SetViewBagName();
            return View(developmentprocess);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(DevelopmentProcess developmentprocess, string Status)
        {
            if (Status == "on")
                developmentprocess.Status = true;
            else
                developmentprocess.Status = false;
            var dao = new DevelopmentProcessDao();
            var result = dao.Update(developmentprocess);
            if (result)
            {
                SetAlert("Sửa lịch sử phát triển của trẻ thành công", "success");
                return RedirectToAction("Index", "DevelopmentProcess");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật lịch sử phát triển của trẻ không thành công");
            }
            SetViewBagName(developmentprocess.ChildrenID);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new DevelopmentProcessDao().Delete(id);
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
            DevelopmentProcess developmentprocess = db.DevelopmentProcesses.Find(id);
            if (developmentprocess == null)
            {
                return HttpNotFound();
            }
            return View(developmentprocess);
        }

        public void SetViewBagName(long? selectedID = null)
        {
            var dao = new ChildrenDao();
            ViewBag.ChildrenID = new SelectList(dao.ListAll(), "ID", "FullName", selectedID);
        }

        //public JsonResult ChangeStatus(long id)
        //{
        //    var result = new DevelopmentProcessDao().ChangeStatus(id);
        //    return Json(new
        //    {
        //        status = result
        //    });
        //}
    }
}
