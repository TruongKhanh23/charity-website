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
using ExcelDataReader.Log.Logger;
using Microsoft.Ajax.Utilities;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class CounselingController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/Counseling
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var model = new CounselingDao().ListAllCategory(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                ViewBag.STT = page * 10 - 9;
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }


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
        public ActionResult Create(Counseling counseling)
        {
            try
            {
                var dao = new CounselingDao();
                var counselingTmp = db.Counselings.Where(x => x.ChildrenID == counseling.ChildrenID).ToList();
                if (counselingTmp.Count != 0)
                {
                    counseling.Time = counselingTmp.Max(x => x.Time) + 1;
                }
                else
                {
                    counseling.Time = 1;
                }
                counseling.Ticket = "TVTL/" + NameToCode(counseling.ChildrenID) + "/" + CreateNewID(counseling.ChildrenID);
                int id = dao.Insert(counseling);
                if (id > 0)
                {
                    SetAlert("Thêm hồ sơ tham vấn tâm lý thành công", "success");
                    return RedirectToAction("Index", "Counseling");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm hồ sơ tham vấn tâm lý không thành công");
                }
                SetViewBagName(counseling.ChildrenID);
                return View("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        public string NameToCode(int childrenID)
        {
            ReceivePayObjectDao dao = new ReceivePayObjectDao();
            string name = db.Children.Find(childrenID).FullName;
            string fullName = dao.LocDauTen(name);
            string space = " ";
            //Khởi tạo chuỗi rỗng
            string firstName = "", middleName = "", firstName0 = "", middleName0 = "", lastName0 = "", code = "";
            int spaceCount = dao.spaceCountAction(fullName);

            code = dao.getLastName(fullName).ToUpper();
            while (spaceCount != 0)
            {
                for (int i = 0; i < fullName.Length; i++)
                {
                    if (fullName[i].ToString().Contains(space))
                    {
                        firstName = fullName.Substring(0, i).ToUpper();
                        //Lấy chữ cái đầu của firstName
                        firstName0 = firstName0 + firstName.Substring(0, 1);
                        fullName = fullName.Substring(i + 1).ToUpper();
                        spaceCount--;
                        i = -1;
                    }
                }
                code = code + firstName0;
                code = code.Trim();
            }
            return code;
        }
        public string CreateNewID(int childrenID)
        {
            int maxID = 0;
            var counselingTmp = db.Counselings.Where(x => x.ChildrenID == childrenID).ToList().Count();
            if (counselingTmp != 0)
            {
                maxID = db.Counselings.Where(x => x.ChildrenID == childrenID).ToList().Max(x => x.Time);
            }
            int newID = maxID + 1;
            string result = "";
            if (newID < 10)
            {
                result = "000" + newID;
            }
            else if (newID == 10 || newID == 100 || newID == 1000)
            {
                result = newID.ToString();
            }
            else if (newID < 100)
            {
                result = "00" + newID;
            }
            else if (newID < 1000)
            {
                result = "0" + newID;
            }
            return result;
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var counseling = new CounselingDao().ViewDetail(id);
            ViewBag.ChildrenName = db.Children.Find(counseling.ChildrenID).FullName;
            Session["TicketNumber"] = counseling.Ticket.Substring(counseling.Ticket.Length - 4, 4);
            SetViewBagName();
            return View(counseling);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Counseling counseling)
        {
            var dao = new CounselingDao();
            counseling.Ticket = "TVTL/" + NameToCode(counseling.ChildrenID) + "/" + Session["TicketNumber"].ToString();
            var result = dao.Update(counseling);
            if (result)
            {
                SetAlert("Sửa hồ sơ tham vấn tâm lý thành công", "success");
                return RedirectToAction("Index", "Counseling");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật hồ sơ tham vấn tâm lý không thành công");
            }
            SetViewBagName(counseling.ChildrenID);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new CounselingDao().Delete(id);
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
            Counseling counseling = db.Counselings.Find(id);
            ViewBag.ChildrenName = db.Children.Find(counseling.ChildrenID).FullName;
            if (counseling == null)
            {
                return HttpNotFound();
            }
            return View(counseling);
        }

        public void SetViewBagName(long? selectedID = null)
        {
            var dao = new ChildrenDao();
            ViewBag.ChildrenID = new SelectList(dao.ListAll(), "ID", "FullName", selectedID);
        }

        //public JsonResult ChangeStatus(long id)
        //{
        //    var result = new CounselingDao().ChangeStatus(id);
        //    return Json(new
        //    {
        //        status = result
        //    });
        //}
    }
}