//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
//Khai báo Common
using System.Web.Mvc;
using System.Net;
using System;
using System.IO;
using System.Web;
using MaiAmTruyenTin.Areas.Admin.Models;
using System.Collections.Generic;
using System.Linq;
using PagedList;
using MaiAmTruyenTin.Common;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class EventController : BaseController
    {
        // GET: Admin/Event
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/Event

        [HasCredential(RoleID = "READ_EVENT")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var model = new EventDao().ListAllCategory(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Event sukien)
        {
            //Image
            string fileName = Path.GetFileNameWithoutExtension(sukien.ImageFile.FileName);
            string extension = Path.GetExtension(sukien.ImageFile.FileName);
            fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
            sukien.Image = "~/Data/images/Event/" + fileName;
            fileName = Path.Combine(Server.MapPath("~/Data/images/Event/"), fileName);
            sukien.ImageFile.SaveAs(fileName);
            var dao = new EventDao();
            int id = dao.Insert(sukien);
            if (id > 0)
            {
                SetAlert("Thêm sự kiện thành công", "success");
                return RedirectToAction("Index", "Event");
            }
            else
            {
                ModelState.AddModelError("", "Thêm sự kiện không thành công");
            }
            return View("Index");
        }
        public ActionResult GetVolunteer(int eventID, string searchString, int page = 1, int pageSize = 5)
        {
            //Get information of the event
            EventModel item = (from ev in db.Events
                               where ev.ID == eventID
                               select (new EventModel
                               {
                                   ID = ev.ID,
                                   CreatedDate = ev.CreatedDate,
                                   EventName = ev.Name
                               }
                               )).FirstOrDefault();
            //Get list volunteer have had joined to this event
            List<int> lstVLTID = new List<int>();
            lstVLTID = db.Volunteer_Event.Where(s => s.EventID == eventID &&
            s.CreatedDate.Value != item.CreatedDate.Value).Select(s => s.VolunteerID).ToList();
            //Get list volunteer have not joined to this event by !Contains vlt.ID
            var lst = from vlt in db.Volunteers
                      where !lstVLTID.Contains(vlt.ID)
                      select new EventVolunteerModel()
                      {
                          VolunteerCode = vlt.Code,
                          VolunteerImg = vlt.Image,
                          Email = vlt.Email,
                          FullName = vlt.Name,
                          Phone = vlt.Phone,
                          VolunteerID = vlt.ID
                      };
            if (!string.IsNullOrEmpty(searchString))
            {
                lst = lst.Where(x => x.FullName.Contains(searchString) || x.Email.Contains(searchString));
            }
            //Assign lst to IPagedList and return
            IPagedList<EventVolunteerModel> myList;
            ViewBag.Event = item;
            myList = lst.OrderByDescending(x => x.VolunteerID).ToPagedList(page, pageSize);
            return View(myList);
        }
        [HttpPost]
        public void AddVolunteerEvent(int eventID, int volunteerID, string createdBy, string VolunteerImg)
        {
            Volunteer_Event vltevent = new Volunteer_Event();
            var dao = new Volunteer_EventDao();
            vltevent.EventID = eventID;
            vltevent.VolunteerID = volunteerID;
            vltevent.CreatedBy = createdBy;
            vltevent.CreatedDate = DateTime.Now;
            vltevent.Note = "Chưa có ghi chú đặc biệt!";
            vltevent.StartDate = DateTime.Now;
            vltevent.Image = VolunteerImg;
            vltevent.Status = true;
            int id = dao.Insert(vltevent);
            if (id > 0)
            {
                SetAlert("Thêm sự kiện thành công", "success");
            }
            else
            {
                ModelState.AddModelError("", "Thêm sự kiện không thành công");
            }
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var sukien = new EventDao().ViewDetail(id);
            Session["imgPath"] = sukien.Image;
            return View(sukien);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Event sukien, HttpPostedFileBase img)
        {
            string _ImagesPath = "~/Data/images/Event/";
            //Image
            if (img != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(img.FileName);
                string extension = Path.GetExtension(img.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                sukien.Image = _ImagesPath + fileName;
                fileName = Path.Combine(Server.MapPath("~/Data/images/Event/"), fileName);
                string oldImgPath = Request.MapPath(Session["imgPath"].ToString());
                img.SaveAs(fileName);
                if (System.IO.File.Exists(oldImgPath))
                {
                    System.IO.File.Delete(oldImgPath);
                }
            }
            else
            {
                sukien.Image = Session["imgPath"].ToString();
            }

            var dao = new EventDao();
            var result = dao.Update(sukien);
            if (result)
            {
                SetAlert("Sửa sự kiện thành công", "success");
                return RedirectToAction("Index", "Event");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật sự kiện không thành công");
            }
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new EventDao().Delete(id);
            }
            catch
            {

            }
        }
        public ActionResult Details(int? id, string searchString)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Event sukien = db.Events.Find(id);
            ViewBag.SearchString = searchString;
            if (sukien == null)
            {
                return HttpNotFound();
            }
            return View(sukien);
        }
        public ActionResult ListVolunteerOfEvent(int id, string searchString, int page = 1, int pageSize = 10)
        {
            var model = new Volunteer_EventDao().ListAllVolunteerInEvent(id, searchString, page, pageSize);
            ViewBag.searchString = searchString;
            ViewBag.eventID = id;
            return PartialView(model);
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


    }
}