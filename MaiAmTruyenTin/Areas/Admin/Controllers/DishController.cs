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
    public class DishController : BaseController
    {
        // GET: Admin/Dish
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var dao = new DishDao();
                var model = dao.ListAllPaging(searchString, page, pageSize);
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
            dt.Columns.AddRange(new DataColumn[11] { new DataColumn("STT"),
                                                     new DataColumn("Tên món ăn"),
                                                     new DataColumn("Nguyên liệu"),
                                                     new DataColumn("Dinh dưỡng"),
                                                     new DataColumn("Ghi chú"),
                                                     new DataColumn("Loại món ăn"),
                                                     new DataColumn("Ngày khởi tạo dữ liệu"),
                                                     new DataColumn("Người khởi tạo dữ liệu"),
                                                     new DataColumn("Ngày chỉnh sửa dữ liệu"),
                                                     new DataColumn("Người chỉnh sửa dữ liệu"),
                                                     new DataColumn("Trạng thái sử dụng")});
            var dish = from Dish in db.Dishes select Dish;
            foreach (var d in dish)
            {
                dt.Rows.Add(d.ID, d.Name, d.Material, d.Nutrition,
                    d.Note, d.Type, d.CreatedDate, d.CreatedBy, d.ModifiedDate, d.ModifiedBy, d.Status);
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
                var dao = new DishDao();
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
            objbulk.DestinationTableName = "Dish";
            objbulk.ColumnMappings.Add("STT", "ID");
            objbulk.ColumnMappings.Add("Tên món ăn", "Name");
            objbulk.ColumnMappings.Add("Nguyên liệu", "Material");
            objbulk.ColumnMappings.Add("Dinh dưỡng", "Nutrition");
            objbulk.ColumnMappings.Add("Ghi chú", "Note");
            objbulk.ColumnMappings.Add("Loại món ăn", "Type");
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
            return View();
        }

        [HttpPost]
        public ActionResult Create(Model.EF.Dish dish)
        {
            if (ModelState.IsValid)
            {
                var dao = new DishDao();
                int id = dao.Insert(dish);
                if (id > 0)
                {
                    SetAlert("Thêm món ăn thành công", "success");
                    return RedirectToAction("Index", "Dish");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm món ăn không thành công");
                }
            }
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var dish = new DishDao().ViewDetail(id);
            return View(dish);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Model.EF.Dish dish)
        {
            var dao = new DishDao();
            var result = dao.Update(dish);
            if (result)
            {
                SetAlert("Sửa món ăn thành công", "success");
                return RedirectToAction("Index", "Dish");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật món ăn không thành công");
            }
            return View("Index");
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new DishDao().Delete(id);
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
            Model.EF.Dish dish = db.Dishes.Find(id);
            if (dish == null)
            {
                return HttpNotFound();
            }
            return View(dish);
        }
    }
}