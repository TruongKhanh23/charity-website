//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Model;
using System.Data;
using System.Net;
using PagedList;
using System.Web.UI.HtmlControls;
using MaiAmTruyenTin.Areas.Admin.Models;
using System.Web.UI.WebControls;
using System;
using System.Data.Entity.Core.Common.CommandTrees;
using ClosedXML.Excel;
using System.IO;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;
using MaiAmTruyenTin.Common;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class VolunteerController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        Volunteer_EventDao dao = new Volunteer_EventDao();
        // GET: Admin/Volunteer
        [HasCredential(RoleID = "READ_VOLUNTEER")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var model = new VolunteerDao().ListAllPaging(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }

        public int Age(int id)
        {
            var model = db.Volunteers.Find(id);
            DateTime now = DateTime.Today;
            int age = now.Year - model.DateOfBirth.Year;
            if (model.DateOfBirth > now.AddYears(-age)) age--;
            return age;
        }
        public ActionResult Volunteer_Event(int ve)
        {
            List<Model.ViewModel.Volunteer_EventModel> lst = new List<Model.ViewModel.Volunteer_EventModel>();
            lst = dao.ListTop(ve);
            return PartialView(lst);
        }
        public string NameToCode(string name)
        {
            ReceivePayObjectDao dao = new ReceivePayObjectDao();
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
        public FileResult ExportToExcel()
        {
            DataTable dt = new DataTable("Sheet1");
            dt.Columns.AddRange(new DataColumn[20] { new DataColumn("ID"),
                                                     new DataColumn("Code"),
                                                     new DataColumn("IdentityCard"),
                                                     new DataColumn("Name"),
                                                     new DataColumn("DateOfBirth"),
                                                     new DataColumn("PlaceOfBirth"),
                                                     new DataColumn("Gender"),
                                                     new DataColumn("Image"),
                                                     new DataColumn("Phone"),
                                                     new DataColumn("Email"),
                                                     new DataColumn("Nationality"),
                                                     new DataColumn("Address"),
                                                     new DataColumn("OtherFoodExpenses"),
                                                     new DataColumn("WorkingHour"),
                                                     new DataColumn("OffHour"),
                                                     new DataColumn("CreatedDate"),
                                                     new DataColumn("CreatedBy"),
                                                     new DataColumn("ModifiedDate"),
                                                     new DataColumn("ModifiedBy"),
                                                     new DataColumn("Status")});
            var volunteer = from Volunteer in db.Volunteers select Volunteer;

            foreach (var vol in volunteer)
            {
                dt.Rows.Add(vol.ID, vol.Code, vol.IdentityCard, vol.Name, vol.DateOfBirth, vol.PlaceOfBirth,
                    vol.Gender, vol.Image, vol.Phone, vol.Email, vol.Nationality, vol.Address, vol.OtherFoodExpenses,
                    vol.WorkingHour, vol.OffHour, vol.CreatedDate, vol.CreatedBy, vol.ModifiedDate, vol.ModifiedBy, vol.Status);
            }

            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt);
                using (MemoryStream stream = new MemoryStream())
                {
                    wb.SaveAs(stream);
                    return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "ExcelFile.xlsx");
                }
            }
        }
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
                var model = new VolunteerDao().ListAllPaging(searchString, page, pageSize);
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
            objbulk.DestinationTableName = "Volunteer";
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
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Volunteer volunteer)
        {
            var dao = new VolunteerDao();
            volunteer.Code = NameToCode(volunteer.Name) + volunteer.DateOfBirth.ToString("ddMMyyyy");
            long id = dao.Insert(volunteer);
            if (id > 0)
            {
                SetAlert("Thêm tình nguyện viên thành công", "success");
                return RedirectToAction("Index", "Volunteer");
            }
            else
            {
                ModelState.AddModelError("", "Thêm tình nguyện viên không thành công");
            }
            return View("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var volunteer = new VolunteerDao().ViewDetail(id);
            return View(volunteer);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Volunteer volunteer)
        {
            var dao = new VolunteerDao();
            volunteer.Code = NameToCode(volunteer.Name) + volunteer.DateOfBirth.ToString("ddMMyyyy");
            var result = dao.Update(volunteer);
            if (result)
            {
                SetAlert("Sửa tình nguyện viên thành công", "success");
                return RedirectToAction("Index", "Volunteer");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật tình nguyện viên không thành công");
            }
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new VolunteerDao().Delete(id);
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
            Volunteer volunteer = db.Volunteers.Find(id);
            if (volunteer == null)
            {
                return HttpNotFound();
            }
            return View(volunteer);
        }
        public void SetViewBagEvent(int? selectedID = null)
        {
            var dao = new EventDao();
            ViewBag.EventID = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }

        //public ActionResult GetVolunteer(int eventID, string searchString, int page = 1, int pageSize = 5)
        //{
        //    List<int> lstVLTCode = new List<int>();
        //    EventModel item = (from ev in db.Events
        //                       where ev.ID == eventID
        //                       select (new EventModel
        //                       {
        //                           ID = ev.ID,
        //                           CreatedDate = ev.CreatedDate,
        //                           EventName = ev.Name
        //                       }
        //                       )).FirstOrDefault();

        //    lstVLTCode = db.Volunteer_Event.Where(s => s.EventID == eventID && s.CreatedDate.Value != item.CreatedDate.Value).Select(s => s.VolunteerID).ToList();

        //    var lst = from vlt in db.Volunteers
        //              where !lstVLTCode.Contains(vlt.ID)
        //              select new EventVolunteerModel()
        //              {
        //                  VolunteerCode = vlt.Code,
        //                  VolunteerImg = vlt.Image,
        //                  Email = vlt.Email,
        //                  FullName = vlt.Name,
        //                  Phone = vlt.Phone,
        //                  VolunteerID = vlt.ID
        //              };
        //    if (!string.IsNullOrEmpty(searchString))
        //    {
        //        lst = lst.Where(x => x.FullName.Contains(searchString) || x.Email.Contains(searchString));
        //    }
        //    IPagedList<EventVolunteerModel> myList;
        //    ViewBag.Event = item;
        //    myList = lst.OrderByDescending(x => x.VolunteerID).ToPagedList(page, pageSize);
        //    return View(myList);
        //}
    }
}
