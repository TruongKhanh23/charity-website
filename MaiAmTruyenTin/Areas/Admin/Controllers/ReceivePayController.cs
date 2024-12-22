//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Net;
using System.Data;
using ClosedXML.Excel;
using System.IO;
using System.Data.SqlClient;
using System.Web;
using System;
using System.Data.OleDb;
using System.Configuration;
using System.Web.WebPages;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class ReceivePayController : BaseController
    {
        // GET: Admin/ReceivePay
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        //Khoản thu, ReceivableIsTrue = true 
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var dao = new ReceivePayDao();
                var model = dao.ListAllPaging(searchString, page, pageSize, true);
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
            dt.Columns.AddRange(new DataColumn[9] { new DataColumn("ID"),
                                                     new DataColumn("Tên nguồn thu"),
                                                     new DataColumn("Đây là nguồn thu?"),
                                                     new DataColumn("Ghi chú"),
                                                     new DataColumn("Ngày khởi tạo"),
                                                     new DataColumn("Người khởi tạo"),
                                                     new DataColumn("Ngày sửa"),
                                                     new DataColumn("Người sửa"),
                                                     new DataColumn("Trạng thái sử dụng")});
            var repay = from ReceivePay in db.ReceivePays select ReceivePay;

            foreach (var rp in repay)
            {
                if (rp.ReceivableIsTrue == true)
                {
                    dt.Rows.Add(rp.ID, rp.Name, rp.ReceivableIsTrue, rp.Note, rp.CreatedDate, rp.CreatedBy, rp.ModifiedDate, rp.ModifiedBy, rp.Status);
                }
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
                var dao = new ReceivePayDao();
                string filename = Guid.NewGuid() + Path.GetExtension(file.FileName);
                string filepath = "/Data/" + filename;
                file.SaveAs(Path.Combine(Server.MapPath("/Data"), filename));
                InsertExceldata(filepath, filename); System.IO.File.Delete(Path.Combine(Server.MapPath("~/Data/"), filename));
                var model = dao.ListAllPaging(searchString, page, pageSize, true);
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
            objbulk.DestinationTableName = "ReceivePay";
            objbulk.ColumnMappings.Add("ID", "ID");
            objbulk.ColumnMappings.Add("Tên nguồn thu", "Name");
            objbulk.ColumnMappings.Add("Đây là nguồn thu?", "ReceivableIsTrue");
            objbulk.ColumnMappings.Add("Ghi chú", "Note");
            objbulk.ColumnMappings.Add("Ngày khởi tạo", "CreatedDate");
            objbulk.ColumnMappings.Add("Người khởi tạo", "CreatedBy");
            objbulk.ColumnMappings.Add("Ngày sửa", "ModifiedDate");
            objbulk.ColumnMappings.Add("Người sửa", "ModifiedBy");
            objbulk.ColumnMappings.Add("Trạng thái sử dụng", "Status");

            con.Open();
            objbulk.WriteToServer(dt);
            con.Close();
        }
        //Khoản chi, ReceivableIsTrue = false 
        public ActionResult Index1(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var dao = new ReceivePayDao();
                var model = dao.ListAllPaging(searchString, page, pageSize, false);
                ViewBag.SearchString = searchString;
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        [HttpPost]
        public FileResult ExportToExcel1()
        {
            DataTable dt = new DataTable("Sheet1");
            dt.Columns.AddRange(new DataColumn[9] { new DataColumn("ID"),
                                                     new DataColumn("Tên nguồn chi"),
                                                     new DataColumn("Đây là nguồn chi?"),
                                                     new DataColumn("Ghi chú"),
                                                     new DataColumn("Ngày khởi tạo"),
                                                     new DataColumn("Người khởi tạo"),
                                                     new DataColumn("Ngày sửa"),
                                                     new DataColumn("Người sửa"),
                                                     new DataColumn("Trạng thái sử dụng")});
            var repay = from ReceivePay in db.ReceivePays select ReceivePay;

            foreach (var rp in repay)
            {
                if (rp.ReceivableIsTrue == false)
                {
                    dt.Rows.Add(rp.ID, rp.Name, rp.ReceivableIsTrue, rp.Note, rp.CreatedDate, rp.CreatedBy, rp.ModifiedDate, rp.ModifiedBy, rp.Status);
                }
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
        SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["MaiAmTruyenTinDbContext"].ConnectionString);
        OleDbConnection Econ1;
        [HttpPost]

        public ActionResult Index1(HttpPostedFileBase file, string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var dao = new ReceivePayDao();
                string filename = Guid.NewGuid() + Path.GetExtension(file.FileName);
                string filepath = "/Data/" + filename;
                file.SaveAs(Path.Combine(Server.MapPath("/Data"), filename));
                InsertExceldata1(filepath, filename); System.IO.File.Delete(Path.Combine(Server.MapPath("~/Data/"), filename));
                var model = dao.ListAllPaging(searchString, page, pageSize, false);
                ViewBag.SearchString = searchString;
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        private void ExcelConn1(string filepath)
        {
            string constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", filepath);
            Econ = new OleDbConnection(constr);
        }
        private void InsertExceldata1(string filepath, string filename)
        {
            string fullpath = Server.MapPath("/Data/") + filename;
            ExcelConn1(fullpath);
            string query = string.Format("Select * from [{0}]", "Sheet1$");
            OleDbCommand Ecom = new OleDbCommand(query, Econ);
            Econ.Open();

            DataSet ds = new DataSet();
            OleDbDataAdapter oda = new OleDbDataAdapter(query, Econ);
            Econ.Close();
            oda.Fill(ds);
            DataTable dt = ds.Tables[0];
            SqlBulkCopy objbulk = new SqlBulkCopy(con);
            objbulk.DestinationTableName = "ReceivePay";
            objbulk.ColumnMappings.Add("ID", "ID");
            objbulk.ColumnMappings.Add("Tên nguồn chi", "Name");
            objbulk.ColumnMappings.Add("Đây là nguồn chi?", "ReceivableIsTrue");
            objbulk.ColumnMappings.Add("Ghi chú", "Note");
            objbulk.ColumnMappings.Add("Ngày khởi tạo", "CreatedDate");
            objbulk.ColumnMappings.Add("Người khởi tạo", "CreatedBy");
            objbulk.ColumnMappings.Add("Ngày sửa", "ModifiedDate");
            objbulk.ColumnMappings.Add("Người sửa", "ModifiedBy");
            objbulk.ColumnMappings.Add("Trạng thái sử dụng", "Status");

            con.Open();
            objbulk.WriteToServer(dt);
            con.Close();
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(ReceivePay model)
        {
            var id = new ReceivePayDao().Insert(model);
            if (id > 0)
            {
                SetAlert("Thêm khoản thu thành công", "success");
                return RedirectToAction("Index", "ReceivePay");
            }
            else
            {
                ModelState.AddModelError("", "Thêm khoản thu không thành công");
            }
            return View(model);
        }

        public ActionResult Create1()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create1(ReceivePay model)
        {
            var id = new ReceivePayDao().Insert(model);
            if (id > 0)
            {
                SetAlert("Thêm khoản chi thành công", "success");
                return RedirectToAction("Index1", "ReceivePay");
            }
            else
            {
                ModelState.AddModelError("", "Thêm khoản chi không thành công");
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var receivepay = new ReceivePayDao().ViewDetail(id);
            Session["ReceivableIsTrue"] = receivepay.ReceivableIsTrue;
            Session["Status"] = receivepay.Status;
            return View(receivepay);
        }
        [HttpPost]
        public ActionResult Edit(ReceivePay receivepay)
        {
            var dao = new ReceivePayDao();
            if (Session["ReceivableIsTrue"].ToString() == "False")
            {
                receivepay.ReceivableIsTrue = false;
            }
            else
            {
                receivepay.ReceivableIsTrue = true;
            }

            receivepay.Status = Session["Status"].ToString().AsBool();
            var result = dao.Update(receivepay);
            if (result)
            {
                if (receivepay.ReceivableIsTrue == true)
                {
                    SetAlert("Sửa khoản thu thành công", "success");
                    return RedirectToAction("Index", "ReceivePay");
                }
                else
                {
                    SetAlert("Sửa khoản chi thành công", "success");
                    return RedirectToAction("Index1", "ReceivePay");
                }

            }
            else
            {
                ModelState.AddModelError("", "Cập nhật khoản thu/ khoản chi không thành công");
            }
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new ReceivePayDao().Delete(id);
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
            //SetViewBag();
            ReceivePay receivepay = db.ReceivePays.Find(id);
            if (receivepay == null)
            {
                return HttpNotFound();
            }
            return View(receivepay);
        }
        public JsonResult ChangeStatus(long id)
        {
            var result = new ReceivePayDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}