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
    public class YellowBookController : BaseController
    {
        // GET: Admin/YellowBook
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/YellowBook
        // Chức năng tìm kiếm và phân trang
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var dao = new YellowBookDao();
                var model = dao.ListAllPaging(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                var sum = db.YellowBooks.Sum(x => x.TotalMoney);
                ViewBag.TotalMoney = sum.ToString("00,0");
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
            dt.Columns.AddRange(new DataColumn[24] { new DataColumn("STT"),
                                                     new DataColumn("Ngày"),
                                                     new DataColumn("Tên người/ đơn vị cho"),
                                                     new DataColumn("Điện thoại"),
                                                     new DataColumn("Địa chỉ"),
                                                     new DataColumn("Tên người nhận"),
                                                     new DataColumn("Tên hàng hóa 1"),
                                                     new DataColumn("Đơn vị tính 1"),
                                                     new DataColumn("Số lượng 1"),
                                                     new DataColumn("Đơn giá 1"),
                                                     new DataColumn("Tên hàng hóa 2"),
                                                     new DataColumn("Đơn vị tính 2"),
                                                     new DataColumn("Số lượng 2"),
                                                     new DataColumn("Đơn giá 2"),
                                                     new DataColumn("Tên hàng hóa 3"),
                                                     new DataColumn("Đơn vị tính 3"),
                                                     new DataColumn("Số lượng 3"),
                                                     new DataColumn("Đơn giá 3"),
                                                     new DataColumn("Quy ra thành tiền"),
                                                     new DataColumn("Ngày khởi tạo dữ liệu"),
                                                     new DataColumn("Người khởi tạo dữ liệu"),
                                                     new DataColumn("Ngày chỉnh sửa dữ liệu"),
                                                     new DataColumn("Người chỉnh sửa dữ liệu"),
                                                     new DataColumn("Trạng thái sử dụng")});

            var yellowbook = from YellowBook in db.YellowBooks select YellowBook;
            int i = 1;

            foreach (var se in yellowbook)
            {
                i++;
                dt.Rows.Add(i, se.Date, se.GiverName, se.Phone, se.Address, se.ReceiverName, se.ProductName1, se.Unit1, se.Amount1, se.Price1, se.ProductName2, se.Unit2, se.Amount2, se.Price2, se.ProductName3, se.Unit3, se.Amount3, se.Price3, se.TotalMoney, se.CreatedDate, se.CreatedBy, se.ModifiedDate, se.ModifiedBy, se.Status);
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
                var dao = new YellowBookDao();
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
            objbulk.DestinationTableName = "YellowBook";
            objbulk.ColumnMappings.Add("STT", "ID");
            objbulk.ColumnMappings.Add("Ngày", "Date");
            objbulk.ColumnMappings.Add("Tên người/ đơn vị cho", "GiverName");
            objbulk.ColumnMappings.Add("Điện thoại", "Phone");
            objbulk.ColumnMappings.Add("Địa chỉ", "Address");
            objbulk.ColumnMappings.Add("Tên người nhận", "ReceiverName");
            objbulk.ColumnMappings.Add("Tên hàng hóa 1", "ProductName1");
            objbulk.ColumnMappings.Add("Đơn vị tính 1", "Unit1");
            objbulk.ColumnMappings.Add("Số lượng 1", "Amount1");
            objbulk.ColumnMappings.Add("Đơn giá 1", "Price1");
            objbulk.ColumnMappings.Add("Tên hàng hóa 2", "ProductName2");
            objbulk.ColumnMappings.Add("Đơn vị tính 2", "Unit2");
            objbulk.ColumnMappings.Add("Số lượng 2", "Amount2");
            objbulk.ColumnMappings.Add("Đơn giá 2", "Price2");
            objbulk.ColumnMappings.Add("Tên hàng hóa 3", "ProductName3");
            objbulk.ColumnMappings.Add("Đơn vị tính 3", "Unit3");
            objbulk.ColumnMappings.Add("Số lượng 3", "Amount3");
            objbulk.ColumnMappings.Add("Đơn giá 3", "Price3");
            objbulk.ColumnMappings.Add("Quy ra thành tiền", "TotalMoney");
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
        public ActionResult Create(YellowBook yellowbook)
        {
            // Xác thực dữ liệu
            if (ModelState.IsValid)
            {
                //Tạo mới đối tượng truy cập dữ liệu
                var dao = new YellowBookDao();
                yellowbook.TotalMoney = yellowbook.Price1 * yellowbook.Amount1 + yellowbook.Price2 * yellowbook.Amount2 + yellowbook.Price3 * yellowbook.Amount3;
                int id = dao.Insert(yellowbook);
                if (id > 0)
                {
                    SetAlert("Thêm phiếu nhập kho vào sổ vàng thành công", "success");
                    return RedirectToAction("Index", "YellowBook");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm phiếu nhập kho vào sổ vàng không thành công");
                }
            }
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var yellowbook = new YellowBookDao().ViewDetail(id);
            return View(yellowbook);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(YellowBook yellowbook, string Status)
        {
            var dao = new YellowBookDao();
            yellowbook.TotalMoney = yellowbook.Price1 * yellowbook.Amount1 + yellowbook.Price2 * yellowbook.Amount2 + yellowbook.Price3 * yellowbook.Amount3;
            var result = dao.Update(yellowbook);
            if (result)
            {
                SetAlert("Sửa phiếu nhập kho vào sổ vàng thành công", "success");
                return RedirectToAction("Index", "YellowBook");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật phiếu nhập kho vào sổ vàng không thành công");
            }
            return View("Index");
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new YellowBookDao().Delete(id);
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
            YellowBook yellowbook = db.YellowBooks.Find(id);
            if (yellowbook == null)
            {
                return HttpNotFound();
            }
            return View(yellowbook);
        }
    }
}