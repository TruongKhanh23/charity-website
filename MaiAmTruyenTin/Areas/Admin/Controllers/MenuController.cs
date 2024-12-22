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
using PagedList;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class MenuController : BaseController
    {
        // GET: Admin/Model.EF.Menu
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        public IEnumerable<MenuViewModel> ListAllPaging(DateTime start, DateTime end, string searchString, int page, int pageSize)
        {
            List<MenuViewModel> modelView = new List<MenuViewModel>();
            var model = from a in db.Menus select a;
            model = model.Where(x => x.Date >= start && x.Date <= end);

            foreach (var item in model)
            {
                var modelViewString = new MenuViewModel();
                modelViewString.ID = item.ID;
                modelViewString.Date = item.Date;
                modelViewString.MorningTapasName = db.Dishes.Find(item.MorningTapas).Name;
                modelViewString.MorningFryName = db.Dishes.Find(item.MorningFry).Name;
                modelViewString.MorningSoupName = db.Dishes.Find(item.MorningSoup).Name;
                modelViewString.BrunchName1 = db.Dishes.Find(item.Brunch1).Name;
                modelViewString.BrunchName2 = db.Dishes.Find(item.Brunch2).Name;
                modelViewString.NoonTapasName = db.Dishes.Find(item.NoonTapas).Name;
                modelViewString.NoonFryName = db.Dishes.Find(item.NoonFry).Name;
                modelViewString.NoonSoupName = db.Dishes.Find(item.NoonSoup).Name;
                modelViewString.TeaName1 = db.Dishes.Find(item.Tea1).Name;
                modelViewString.TeaName2 = db.Dishes.Find(item.Tea2).Name;
                modelViewString.AfternoonTapasName = db.Dishes.Find(item.AfternoonTapas).Name;
                modelViewString.AfternoonFryName = db.Dishes.Find(item.AfternoonFry).Name;
                modelViewString.AfternoonSoupName = db.Dishes.Find(item.AfternoonSoup).Name;
                modelViewString.DinnerName1 = db.Dishes.Find(item.Dinner1).Name;
                modelViewString.DinnerName2 = db.Dishes.Find(item.Dinner2).Name;

                modelView.Add(modelViewString);
            }

            IEnumerable<MenuViewModel> modelViewList = modelView;
            if (!string.IsNullOrEmpty(searchString))
            {
                modelViewList = modelViewList.Where(x => x.MorningTapasName.Contains(searchString));
            }
            return modelViewList.OrderByDescending(x => x.Date).ToPagedList(page, pageSize);
        }
        public ActionResult Index(string start, string end, string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                if (string.IsNullOrEmpty(start) && string.IsNullOrEmpty(end))
                {
                    start = "01/01/1900";
                    end = DateTime.Now.ToString("MM/dd/yyyy");
                }
                else if (!string.IsNullOrEmpty(start) && string.IsNullOrEmpty(end))
                {
                    end = DateTime.Now.ToString("MM/dd/yyyy");
                }
                else if (string.IsNullOrEmpty(start) && !string.IsNullOrEmpty(end))
                {
                    start = "01/01/1900";
                }
                var dao = new MenuDao();
                var model = ListAllPaging(DateTime.Parse(start), DateTime.Parse(end), searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                ViewBag.STT = page * 10 - 9;
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        public string GetNameDish(int tapasID, int fryID, int soupID)
        {
            string tapasName = db.Dishes.Find(tapasID).Name;
            string fryName = db.Dishes.Find(fryID).Name;
            string soupName = db.Dishes.Find(soupID).Name;
            string dish = tapasName + "; " + fryName + "; " + soupName;
            return dish;
        }
        [HttpPost]
        public FileResult ExportToExcel()
        {
            DataTable dt = new DataTable("Sheet1");
            dt.Columns.AddRange(new DataColumn[17] { new DataColumn("STT"),
                                                     new DataColumn("Ngày"),
                                                     new DataColumn("Sáng: món mặn"),
                                                     new DataColumn("Sáng: món xào"),
                                                     new DataColumn("Sáng: món canh"),
                                                     new DataColumn("Xế trưa 1"),
                                                     new DataColumn("Xế trưa 2"),
                                                     new DataColumn("Trưa: món mặn"),
                                                     new DataColumn("Trưa: món xào"),
                                                     new DataColumn("Trưa: món canh"),
                                                     new DataColumn("Xế chiều 1"),
                                                     new DataColumn("Xế chiều 2"),
                                                     new DataColumn("Chiều: món mặn"),
                                                     new DataColumn("Chiều: món xào"),
                                                     new DataColumn("Chiều: món canh"),
                                                     new DataColumn("Tối 1"),
                                                     new DataColumn("Tối 2")});
            List<MenuViewModel> modelView = new List<MenuViewModel>();

            var model = from a in db.Menus select a;

            foreach (var item in model)
            {
                var modelViewString = new MenuViewModel();
                modelViewString.ID = item.ID;
                modelViewString.Date = item.Date;
                modelViewString.MorningTapasName = db.Dishes.Find(item.MorningTapas).Name;
                modelViewString.MorningFryName = db.Dishes.Find(item.MorningFry).Name;
                modelViewString.MorningSoupName = db.Dishes.Find(item.MorningSoup).Name;
                modelViewString.BrunchName1 = db.Dishes.Find(item.Brunch1).Name;
                modelViewString.BrunchName2 = db.Dishes.Find(item.Brunch2).Name;
                modelViewString.NoonTapasName = db.Dishes.Find(item.NoonTapas).Name;
                modelViewString.NoonFryName = db.Dishes.Find(item.NoonFry).Name;
                modelViewString.NoonSoupName = db.Dishes.Find(item.NoonSoup).Name;
                modelViewString.TeaName1 = db.Dishes.Find(item.Tea1).Name;
                modelViewString.TeaName2 = db.Dishes.Find(item.Tea2).Name;
                modelViewString.AfternoonTapasName = db.Dishes.Find(item.AfternoonTapas).Name;
                modelViewString.AfternoonFryName = db.Dishes.Find(item.AfternoonFry).Name;
                modelViewString.AfternoonSoupName = db.Dishes.Find(item.AfternoonSoup).Name;
                modelViewString.DinnerName1 = db.Dishes.Find(item.Dinner1).Name;
                modelViewString.DinnerName2 = db.Dishes.Find(item.Dinner2).Name;

                modelView.Add(modelViewString);
            }
            IEnumerable<MenuViewModel> modelViewList = modelView;

            foreach (var se in modelViewList)
            {
                int i = 1;
                dt.Rows.Add(i, se.Date, se.MorningTapasName, se.MorningFryName, se.MorningSoupName, se.BrunchName1, se.BrunchName1,
                    se.NoonTapasName, se.NoonFryName, se.NoonSoupName, se.TeaName1, se.TeaName2, se.AfternoonTapasName, se.AfternoonFryName, se.AfternoonSoupName,
                    se.DinnerName1, se.DinnerName2);
                i++;
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

        public ActionResult Index(HttpPostedFileBase file, string start, string end, string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var dao = new MenuDao();
                string filename = Guid.NewGuid() + Path.GetExtension(file.FileName);
                string filepath = "/Data/" + filename;
                file.SaveAs(Path.Combine(Server.MapPath("/Data"), filename));
                InsertExceldata(filepath, filename); System.IO.File.Delete(Path.Combine(Server.MapPath("~/Data/"), filename));
                var model = dao.ListAllPaging(DateTime.Parse(start), DateTime.Parse(end), searchString, page, pageSize);
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
            objbulk.DestinationTableName = "Menu";
            objbulk.ColumnMappings.Add("STT", "ID");
            objbulk.ColumnMappings.Add("Ngày", "Date");
            objbulk.ColumnMappings.Add("Sáng: món mặn", "MorningTapas");
            objbulk.ColumnMappings.Add("Sáng: món xào", "MorningFry");
            objbulk.ColumnMappings.Add("Sáng: món canh", "MorningSoup");
            objbulk.ColumnMappings.Add("Xế trưa 1", "Brunch1");
            objbulk.ColumnMappings.Add("Xế trưa 2", "Brunch2");
            objbulk.ColumnMappings.Add("Trưa: món mặn", "NoonTapas");
            objbulk.ColumnMappings.Add("Trưa: món xào", "NoonFry");
            objbulk.ColumnMappings.Add("Trưa: món canh", "NoonSoup");
            objbulk.ColumnMappings.Add("Xế chiều 1", "Tea1");
            objbulk.ColumnMappings.Add("Xế chiều 2", "Tea2");
            objbulk.ColumnMappings.Add("Chiều: món mặn", "AfternoonTapas");
            objbulk.ColumnMappings.Add("Chiều: món xào", "AfternoonFry");
            objbulk.ColumnMappings.Add("Chiều: món canh", "AfternoonSoup");
            objbulk.ColumnMappings.Add("Tối 1", "Dinner 1");
            objbulk.ColumnMappings.Add("Tối 2", "Dinner 2");
            objbulk.ColumnMappings.Add("Ghi chú", "Note");
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
            SetViewBagTapas();
            SetViewBagFry();
            SetViewBagSoup();
            SetViewBagSnack();
            return View();
        }

        [HttpPost]
        public ActionResult Create(Model.EF.Menu menu)
        {
            if (ModelState.IsValid)
            {
                var dao = new MenuDao();
                int id = dao.Insert(menu);
                if (id > 0)
                {
                    SetAlert("Thêm thực đơn thành công", "success");
                    return RedirectToAction("Index", "Menu");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm thực đơn không thành công");
                }
            }
            SetViewBagTapas(menu.MorningTapas);
            SetViewBagFry(menu.MorningFry);
            SetViewBagSoup(menu.MorningSoup);
            SetViewBagSnack(menu.Brunch1);
            return View("Index");
        }
        public ActionResult Edit(int id)
        {
            var menu = new MenuDao().ViewDetail(id);
            SetViewBagTapas();
            SetViewBagFry();
            SetViewBagSoup();
            SetViewBagSnack();
            return View(menu);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Model.EF.Menu menu)
        {
            var dao = new MenuDao();
            var result = dao.Update(menu);
            if (result)
            {
                SetAlert("Sửa thực đơn thành công", "success");
                return RedirectToAction("Index", "Menu");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật thực đơn không thành công");
            }
            SetViewBagTapas(menu.MorningTapas);
            SetViewBagFry(menu.MorningFry);
            SetViewBagSoup(menu.MorningSoup);
            SetViewBagSnack(menu.Brunch1);
            return View("Index");
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new MenuDao().Delete(id);
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
            Model.EF.Menu menu = db.Menus.Find(id);
            ViewBag.MorningTapas = db.Dishes.Find(menu.MorningTapas).Name;
            ViewBag.MorningFry = db.Dishes.Find(menu.MorningFry).Name;
            ViewBag.MorningSoup = db.Dishes.Find(menu.MorningSoup).Name;
            ViewBag.BrunchName1 = db.Dishes.Find(menu.Brunch1).Name;
            ViewBag.BrunchName2 = db.Dishes.Find(menu.Brunch2).Name;
            ViewBag.NoonTapas = db.Dishes.Find(menu.NoonTapas).Name;
            ViewBag.NoonFry = db.Dishes.Find(menu.NoonFry).Name;
            ViewBag.NoonSoup = db.Dishes.Find(menu.NoonSoup).Name;
            ViewBag.TeaName1 = db.Dishes.Find(menu.Tea1).Name;
            ViewBag.TeaName2 = db.Dishes.Find(menu.Tea2).Name;
            ViewBag.AfternoonTapas = db.Dishes.Find(menu.AfternoonTapas).Name;
            ViewBag.AfternoonFry = db.Dishes.Find(menu.AfternoonFry).Name;
            ViewBag.AfternoonSoup = db.Dishes.Find(menu.AfternoonSoup).Name;
            ViewBag.DinnerName1 = db.Dishes.Find(menu.Dinner1).Name;
            ViewBag.DinnerName2 = db.Dishes.Find(menu.Dinner2).Name;
            if (menu == null)
            {
                return HttpNotFound();
            }
            return View(menu);
        }
        public void SetViewBagTapas(long? selectedID = null)
        {
            var dao = new DishDao();
            ViewBag.Tapas = new SelectList(dao.ListByType("Món mặn"), "ID", "Name", selectedID);
        }
        public void SetViewBagFry(long? selectedID = null)
        {
            var dao = new DishDao();
            ViewBag.Fry = new SelectList(dao.ListByType("Món xào"), "ID", "Name", selectedID);
        }
        public void SetViewBagSoup(long? selectedID = null)
        {
            var dao = new DishDao();
            ViewBag.Soup = new SelectList(dao.ListByType("Món canh"), "ID", "Name", selectedID);
        }
        public void SetViewBagSnack(long? selectedID = null)
        {
            var dao = new DishDao();
            ViewBag.Snack = new SelectList(dao.ListByType("Đồ ăn vặt"), "ID", "Name", selectedID);
        }
    }
}