using ClosedXML.Excel;
using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class Volunteer_EventController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        Volunteer_EventDao dao = new Volunteer_EventDao();
        // GET: Admin/Volunteer_Event

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["MaiAmTruyenTinDbContext"].ConnectionString);
        OleDbConnection Econ;
        [HttpPost]

        public ActionResult Index(HttpPostedFileBase file, string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                string filename = Guid.NewGuid() + Path.GetExtension(file.FileName);
                string filepath = "/Data/" + filename;
                file.SaveAs(Path.Combine(Server.MapPath("/Data"), filename));
                InsertExceldata(filepath, filename); System.IO.File.Delete(Path.Combine(Server.MapPath("~/Data/"), filename));
                var model = new Volunteer_EventDao().ListAllPaging(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        private void ExcelConn(string filepath)
        {
            string constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", filepath);
            Econ = new OleDbConnection(constr);
        }
        private void InsertExceldata(string filepath, string filename)
        {
            string fullpath = Server.MapPath("/Data/") + filename;
            ExcelConn(fullpath);
            string query = string.Format("Select * from [{0}]", "Sheet1$");
            OleDbCommand Ecom = new OleDbCommand(query, Econ);
            Econ.Open();

            DataSet ds = new DataSet();
            OleDbDataAdapter oda = new OleDbDataAdapter(query, Econ);
            Econ.Close();
            oda.Fill(ds);
            DataTable dt = ds.Tables[0];
            SqlBulkCopy objbulk = new SqlBulkCopy(con);
            objbulk.DestinationTableName = "Volunteer_Event";
            objbulk.ColumnMappings.Add("ID", "ID");
            objbulk.ColumnMappings.Add("Code", "Code");
            objbulk.ColumnMappings.Add("IdentityCard", "IdentityCard");
            objbulk.ColumnMappings.Add("Name", "Name");
            objbulk.ColumnMappings.Add("DateOfBirth", "DateOfBirth");
            objbulk.ColumnMappings.Add("PlaceOfBirth", "PlaceOfBirth");
            objbulk.ColumnMappings.Add("Gender", "Gender");
            objbulk.ColumnMappings.Add("Image", "Image");
            objbulk.ColumnMappings.Add("Phone", "Phone");
            objbulk.ColumnMappings.Add("Email", "Email");
            objbulk.ColumnMappings.Add("Nationality", "Nationality");
            objbulk.ColumnMappings.Add("Address", "Address");
            objbulk.ColumnMappings.Add("OtherFoodExpenses", "OtherFoodExpenses");
            objbulk.ColumnMappings.Add("WorkingHour", "WorkingHour");
            objbulk.ColumnMappings.Add("OffHour", "OffHour");
            objbulk.ColumnMappings.Add("CreatedDate", "CreatedDate");
            objbulk.ColumnMappings.Add("CreatedBy", "CreatedBy");
            objbulk.ColumnMappings.Add("ModifiedDate", "ModifiedDate");
            objbulk.ColumnMappings.Add("ModifiedBy", "ModifiedBy");
            objbulk.ColumnMappings.Add("Status", "Status");

            con.Open();
            objbulk.WriteToServer(dt);
            con.Close();
        }

        [HttpGet]
        public ActionResult Edit(int id)
        {
            var vltevent = new Volunteer_EventDao().ViewDetail(id);
            ViewBag.eventName = db.Events.Find(db.Volunteer_Event.Find(id).EventID).Name;
            ViewBag.volunteerName = db.Volunteers.Find(db.Volunteer_Event.Find(id).VolunteerID).Name;
            Session["imgPath"] = vltevent.Image;
            return View(vltevent);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Volunteer_Event vltevent, HttpPostedFileBase img)
        {
            string _ImagesPath = "~/Data/images/VolunteerEvent/";
            //Image
            if (img != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(img.FileName);
                string extension = Path.GetExtension(img.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                vltevent.Image = _ImagesPath + fileName;
                fileName = Path.Combine(Server.MapPath("~/Data/images/VolunteerEvent/"), fileName);
                string oldImgPath = Request.MapPath(Session["imgPath"].ToString());
                img.SaveAs(fileName);
                if (System.IO.File.Exists(oldImgPath))
                {
                    System.IO.File.Delete(oldImgPath);
                }
            }
            else
            {
                vltevent.Image = Session["imgPath"].ToString();
            }
            var dao = new Volunteer_EventDao();
            var result = dao.Update(vltevent);
            if (result)
            {
                SetAlert("Sửa tình nguyện viên tham gia sự kiện thành công", "success");
                return RedirectToAction("Details", "Event", new { id = vltevent.EventID });
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật tình nguyện viên tham gia sự kiện không thành công");
            }
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new Volunteer_EventDao().Delete(id);
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
            Volunteer_Event vltevent = db.Volunteer_Event.Find(id);
            if (vltevent == null)
            {
                return HttpNotFound();
            }
            return View(vltevent);
        }
        public void SetViewBagEvent(int? selectedID = null)
        {
            var dao = new EventDao();
            ViewBag.EventID = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
    }
}