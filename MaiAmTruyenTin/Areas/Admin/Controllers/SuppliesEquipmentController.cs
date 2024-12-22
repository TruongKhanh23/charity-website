//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
//using Model.EF;
//Khai báo Common
using MaiAmTruyenTin.Common;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;
using System.Net;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Data.OleDb;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class SuppliesEquipmentController : BaseController
    {
        // GET: Admin/SuppliesEquipment
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/SuppliesEquipment
        // Chức năng tìm kiếm và phân trang
        [HasCredential(RoleID = "READ_SE")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var dao = new SuppliesEquipmentDao();
                var model = dao.ListAllPaging(searchString, page, pageSize);
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
            dt.Columns.AddRange(new DataColumn[14] { new DataColumn("STT"),
                                                     new DataColumn("Mã thiết bị"),
                                                     new DataColumn("Tên thiết bị"),
                                                     new DataColumn("Số lượng tổng"),
                                                     new DataColumn("Số lượng hư hỏng"),
                                                     new DataColumn("Người quản lý"),
                                                     new DataColumn("Lịch sử sử dụng"),
                                                     new DataColumn("Mô tả"),
                                                     new DataColumn("Hình ảnh"),
                                                     new DataColumn("Ngày khởi tạo dữ liệu"),
                                                     new DataColumn("Người khởi tạo dữ liệu"),
                                                     new DataColumn("Ngày chỉnh sửa dữ liệu"),
                                                     new DataColumn("Người chỉnh sửa dữ liệu"),
                                                     new DataColumn("Trạng thái sử dụng")});
            var suppliesequipment = from SuppliesEquipment in db.SuppliesEquipments select SuppliesEquipment;
            int i = 1;
            foreach (var se in suppliesequipment)
            {
                i++;
                dt.Rows.Add(i, se.Code, se.Name, se.Number, se.BrokenNumber, se.Manager, se.UsageHistory, se.Description, se.Image, se.CreatedDate, se.CreatedBy, se.ModifiedDate, se.ModifiedBy, se.Status);
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
                var dao = new SuppliesEquipmentDao();
                string filename = Guid.NewGuid() + Path.GetExtension(file.FileName);
                string filepath = "/Data/" + filename;
                file.SaveAs(Path.Combine(Server.MapPath("/Data"), filename));
                InsertExceldata(filepath, filename); System.IO.File.Delete(Path.Combine(Server.MapPath("~/Data/"), filename));
                var model = dao.ListAllPaging(searchString, page, pageSize);
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
            objbulk.DestinationTableName = "SuppliesEquipment";
            objbulk.ColumnMappings.Add("STT", "ID");
            objbulk.ColumnMappings.Add("Mã thiết bị", "Code");
            objbulk.ColumnMappings.Add("Tên thiết bị", "Name");
            objbulk.ColumnMappings.Add("Số lượng tổng", "Number");
            objbulk.ColumnMappings.Add("Số lượng hư hỏng", "BrokenNumber");
            objbulk.ColumnMappings.Add("Người quản lý", "Manager");
            objbulk.ColumnMappings.Add("Lịch sử sử dụng", "UsageHistory");
            objbulk.ColumnMappings.Add("Mô tả", "Description");
            objbulk.ColumnMappings.Add("Hình ảnh", "Image");
            objbulk.ColumnMappings.Add("Ngày khởi tạo dữ liệu", "CreatedDate");
            objbulk.ColumnMappings.Add("Người khởi tạo dữ liệu", "CreatedBy");
            objbulk.ColumnMappings.Add("Ngày chỉnh sửa dữ liệu", "ModifiedDate");
            objbulk.ColumnMappings.Add("Người chỉnh sửa dữ liệu", "ModifiedBy");
            objbulk.ColumnMappings.Add("Trạng thái sử dụng", "Status");

            con.Open();
            objbulk.WriteToServer(dt);
            con.Close();
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBagCreatedBy();
            return View();
        }

        [HttpPost]
        public ActionResult Create(SuppliesEquipment suppliesequipment)
        {
            // Xác thực dữ liệu
            if (ModelState.IsValid)
            {
                //Tạo mới đối tượng truy cập dữ liệu
                var dao = new SuppliesEquipmentDao();
                int id = dao.Insert(suppliesequipment);
                if (id > 0)
                {
                    SetAlert("Thêm thiết bị vật tư thành công", "success");
                    return RedirectToAction("Index", "SuppliesEquipment");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm thiết bị vật tư không thành công");
                }
            }
            SetViewBagCreatedBy(suppliesequipment.CreatedBy);
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var suppliesequipment = new SuppliesEquipmentDao().ViewDetail(id);
            SetViewBagCreatedBy();
            return View(suppliesequipment);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(SuppliesEquipment suppliesequipment, string Status)
        {
            if (Status == "on")
                suppliesequipment.Status = true;
            else
                suppliesequipment.Status = false;
            var dao = new SuppliesEquipmentDao();
            //if (!string.IsNullOrEmpty(suppliesequipment.Password))
            //{
            //    var encryptedMd5Pas = Encryptor.MD5Hash(suppliesequipment.Password);
            //    suppliesequipment.Password = encryptedMd5Pas;
            //}
            var result = dao.Update(suppliesequipment);
            if (result)
            {
                SetAlert("Sửa thiết bị vật tư thành công", "success");
                return RedirectToAction("Index", "SuppliesEquipment");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật thiết bị vật tư không thành công");
            }
            SetViewBagCreatedBy(suppliesequipment.ModifiedBy);
            return View("Index");
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new SuppliesEquipmentDao().Delete(id);
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
            SuppliesEquipment suppliesequipment = db.SuppliesEquipments.Find(id);
            if (suppliesequipment == null)
            {
                return HttpNotFound();
            }
            return View(suppliesequipment);
        }
        public void SetViewBagCreatedBy(string selectedID = null)
        {
            var dao = new UserDao();
            ViewBag.UserID = new SelectList(dao.ListAll(), "Name", "Name", selectedID);
        }
        //[HttpPost]
        //public JsonResult ChangeStatus(long id)
        //{
        //    var result = new SuppliesEquipmentDao().ChangeStatus(id);
        //    return Json(new
        //    {
        //        status = result
        //    });
        //}

    }
}