using Model.DAO;
using Model.EF;
using System.Web.Mvc;
using System.Net;
using System.Data;
using System.Linq;
using ClosedXML.Excel;
using System.IO;
using System.Web;
using System.Configuration;
using System.Data.OleDb;
using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using ExcelDataReader;
using System.Reflection;
using MaiAmTruyenTin.Common;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class RegulationController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/Regulation
        [HasCredential(RoleID = "READ_REGULATION")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var model = new RegulationDao().ListAllPaging(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        [HttpPost]
        public FileResult ExportToExcel()
        {
            DataTable dt = new DataTable("Sheet1");
            dt.Columns.AddRange(new DataColumn[10] { new DataColumn("ID"),
                                                     new DataColumn("Code"),
                                                     new DataColumn("Name"),
                                                     new DataColumn("MetaDescriptions"),
                                                     new DataColumn("CreatedDate"),
                                                     new DataColumn("CreatedBy"),
                                                     new DataColumn("ModifiedDate"),
                                                     new DataColumn("ModifiedBy"),
                                                     new DataColumn("MetaKeyWords"),
                                                     new DataColumn("Status")});
            var regulation = from Regulation in db.Regulations select Regulation;

            foreach (var emp in regulation)
            {
                dt.Rows.Add(emp.ID, emp.Code, emp.Name, emp.MetaDescriptions,
                    emp.CreatedDate, emp.CreatedBy, emp.ModifiedDate, emp.ModifiedBy,
                    emp.MetaKeyWords, emp.Status);
            }

            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt);
                using (MemoryStream stream = new MemoryStream())
                {
                    wb.SaveAs(stream);
                    return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "QuyDinh.xlsx");
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
                var model = new RegulationDao().ListAllPaging(searchString, page, pageSize);
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
            objbulk.DestinationTableName = "Regulation";
            objbulk.ColumnMappings.Add("ID", "ID");
            objbulk.ColumnMappings.Add("Code", "Code");
            objbulk.ColumnMappings.Add("Name", "Name");
            objbulk.ColumnMappings.Add("MetaDescriptions", "MetaDescriptions");
            objbulk.ColumnMappings.Add("CreatedDate", "CreatedDate");
            objbulk.ColumnMappings.Add("CreatedBy", "CreatedBy");
            objbulk.ColumnMappings.Add("ModifiedDate", "ModifiedDate");
            objbulk.ColumnMappings.Add("ModifiedBy", "ModifiedBy");
            objbulk.ColumnMappings.Add("MetaKeyWords", "MetaKeyWords");
            objbulk.ColumnMappings.Add("Status", "Status");

            con.Open();
            objbulk.WriteToServer(dt);
            con.Close();
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBag();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Regulation regulation)
        {
            var dao = new RegulationDao();
            long id = dao.Insert(regulation);
            if (id > 0)
            {
                SetAlert("Thêm quy định thành công", "success");
                return RedirectToAction("Index", "Regulation");
            }
            else
            {
                ModelState.AddModelError("", "Thêm quy định không thành công");
            }
            SetViewBag(regulation.CreatedBy);
            return View("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var regulation = new RegulationDao().ViewDetail(id);
            SetViewBag();
            return View(regulation);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Regulation regulation, string Status)
        {
            if (Status == "on")
                regulation.Status = true;
            else
                regulation.Status = false;
            var dao = new RegulationDao();
            var result = dao.Update(regulation);
            if (result)
            {
                SetAlert("Sửa quy định thành công", "success");
                return RedirectToAction("Index", "Regulation");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật quy định không thành công");
            }
            SetViewBag(regulation.CreatedBy);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new RegulationDao().Delete(id);
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
            SetViewBag();
            Regulation regulation = db.Regulations.Find(id);
            if (regulation == null)
            {
                return HttpNotFound();
            }
            return View(regulation);
        }
        public void SetViewBag(string selectedID = null)
        {
            var dao = new UserDao();
            ViewBag.UserID = new SelectList(dao.ListAll(), "Name", "Name", selectedID);
        }
        public JsonResult ChangeStatus(long id)
        {
            var result = new RegulationDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }

}
