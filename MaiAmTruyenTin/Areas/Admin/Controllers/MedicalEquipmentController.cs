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
using Model.ViewModel;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class MedicalEquipmentController : BaseController
    {
        // GET: Admin/MedicalEquipment
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/MedicalEquipment
        // Chức năng tìm kiếm và phân trang
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var dao = new MedicalEquipmentDao();
                var model = dao.ListAllCategory(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                ViewBag.STT = page * 10 - 9;
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
            dt.Columns.AddRange(new DataColumn[13] { new DataColumn("STT"),
                                                     new DataColumn("Tên"),
                                                     new DataColumn("Công dụng"),
                                                     new DataColumn("Đơn vị tính"),
                                                     new DataColumn("Số lượng"),
                                                     new DataColumn("Ngày sản xuất"),
                                                     new DataColumn("Hạn sử dụng"),
                                                     new DataColumn("Loại dụng cụ"),
                                                     new DataColumn("Ngày khởi tạo dữ liệu"),
                                                     new DataColumn("Người khởi tạo dữ liệu"),
                                                     new DataColumn("Ngày chỉnh sửa dữ liệu"),
                                                     new DataColumn("Người chỉnh sửa dữ liệu"),
                                                     new DataColumn("Trạng thái sử dụng")});
            var medicalequipment = from a in db.MedicalEquipments
                                   join b in db.MedicalCategories on a.CategoryID equals b.ID
                                   select new MedicalEquipmentViewModel()
                                   {
                                       ID = a.ID,
                                       Name = a.Name,
                                       Uses = a.Uses,
                                       Unit = a.Unit,
                                       Amount = a.Amount,
                                       ManufacturingDate = a.ManufacturingDate,
                                       ExpiryDate = a.ExpiryDate,
                                       CategoryName = b.Name,
                                       CreatedDate = a.CreatedDate,
                                       ModifiedDate = a.ModifiedDate,
                                       ModifiedBy = a.ModifiedBy,
                                       CreatedBy = a.CreatedBy,
                                       Status = a.Status,
                                   };
            int i = 1;
            foreach (var se in medicalequipment)
            {
                i++;
                dt.Rows.Add(i, se.Name, se.Uses, se.Unit, se.Amount, se.ManufacturingDate, se.ExpiryDate, se.CategoryName, se.CreatedDate, se.CreatedBy, se.ModifiedDate, se.ModifiedBy, se.Status);
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
                var dao = new MedicalEquipmentDao();
                string filename = Guid.NewGuid() + Path.GetExtension(file.FileName);
                string filepath = "/Data/" + filename;
                file.SaveAs(Path.Combine(Server.MapPath("/Data"), filename));
                InsertExceldata(filepath, filename); System.IO.File.Delete(Path.Combine(Server.MapPath("~/Data/"), filename));
                var model = dao.ListAllCategory(searchString, page, pageSize);
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
            objbulk.DestinationTableName = "MedicalEquipment";
            objbulk.ColumnMappings.Add("STT", "ID");
            objbulk.ColumnMappings.Add("Tên", "Name");
            objbulk.ColumnMappings.Add("Công dụng", "Uses");
            objbulk.ColumnMappings.Add("Đơn vị tính", "Unit");
            objbulk.ColumnMappings.Add("Số lượng", "Amount");
            objbulk.ColumnMappings.Add("Ngày sản xuất", "ManufacturingDate");
            objbulk.ColumnMappings.Add("Hạn sử dụng", "ExpiryDate");
            objbulk.ColumnMappings.Add("Loại dụng cụ", "CategoryID");
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
            SetViewBagCategory();
            return View();
        }

        [HttpPost]
        public ActionResult Create(MedicalEquipment medicalequipment)
        {
            // Xác thực dữ liệu
            if (ModelState.IsValid)
            {
                //Tạo mới đối tượng truy cập dữ liệu
                var dao = new MedicalEquipmentDao();
                int id = dao.Insert(medicalequipment);
                if (id > 0)
                {
                    SetAlert("Thêm dụng cụ y tế thành công", "success");
                    return RedirectToAction("Index", "MedicalEquipment");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm dụng cụ y tế không thành công");
                }
            }
            SetViewBagCategory(medicalequipment.CategoryID);
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var medicalequipment = new MedicalEquipmentDao().ViewDetail(id);
            SetViewBagCategory();
            return View(medicalequipment);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(MedicalEquipment medicalequipment)
        {
            var dao = new MedicalEquipmentDao();
            var result = dao.Update(medicalequipment);
            if (result)
            {
                SetAlert("Sửa dụng cụ y tế thành công", "success");
                return RedirectToAction("Index", "MedicalEquipment");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật dụng cụ y tế không thành công");
            }
            SetViewBagCategory(medicalequipment.CategoryID);
            return View("Index");
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new MedicalEquipmentDao().Delete(id);
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
            MedicalEquipment medicalequipment = db.MedicalEquipments.Find(id);
            ViewBag.CateName = db.MedicalCategories.Find(medicalequipment.CategoryID).Name;
            if (medicalequipment == null)
            {
                return HttpNotFound();
            }
            return View(medicalequipment);
        }
        public void SetViewBagCategory(long? selectedID = null)
        {
            var dao = new MedicalEquipmentDao();
            ViewBag.CateName = new SelectList(dao.ListMedicalCategory(), "ID", "Name", selectedID);
        }
    }
}