//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
//using Model.EF;
//Khai báo Common
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
//using System.Data.Entity;
using System.Net;
using MaiAmTruyenTin.Common;
using System.Data;
using ClosedXML.Excel;
using System.IO;
using System.Data.OleDb;
using System;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class ReceivePayObjectController : BaseController
    {
        // GET: Admin/ReceivePayObject
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/ReceivePayObject

        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var model = new ReceivePayObjectDao().ListAllCategory(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                return View(model);
            }
            catch (System.Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        [HttpPost]
        public FileResult ExportToExcel()
        {
            DataTable dt = new DataTable("Sheet1");
            dt.Columns.AddRange(new DataColumn[19] { new DataColumn("ID"),
                                                     new DataColumn("Code"),
                                                     new DataColumn("Name"),
                                                     new DataColumn("AffiliatedUnit"),
                                                     new DataColumn("Address"),
                                                     new DataColumn("Phone"),
                                                     new DataColumn("Fax"),
                                                     new DataColumn("Website"),
                                                     new DataColumn("Email"),
                                                     new DataColumn("BankingNumber"),
                                                     new DataColumn("BankID"),
                                                     new DataColumn("HolderName"),
                                                     new DataColumn("CategoryID"),
                                                     new DataColumn("Note"),
                                                     new DataColumn("CreatedDate"),
                                                     new DataColumn("CreatedBy"),
                                                     new DataColumn("ModifiedDate"),
                                                     new DataColumn("ModifiedBy"),
                                                     new DataColumn("Status")});
            var objectRePa = from ReceivePayObject in db.ReceivePayObjects select ReceivePayObject;

            foreach (var obj in objectRePa)
            {
                dt.Rows.Add(obj.ID, obj.Code, obj.Name, obj.AffiliatedUnit, obj.Address, obj.Phone, obj.Fax, obj.Website,
                    obj.Email, obj.BankingNumber, obj.BankID, obj.HolderName, obj.CategoryID, obj.Note,
                    obj.CreatedDate, obj.CreatedBy, obj.ModifiedDate, obj.ModifiedBy, obj.Status);
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
                var model = new ReceivePayObjectDao().ListAllCategory(searchString, page, pageSize);
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
            objbulk.DestinationTableName = "ReceivePayObject";
            objbulk.ColumnMappings.Add("ID", "ID");
            objbulk.ColumnMappings.Add("Code", "Code");
            objbulk.ColumnMappings.Add("Name", "Name");
            objbulk.ColumnMappings.Add("AffiliatedUnit", "AffiliatedUnit");
            objbulk.ColumnMappings.Add("Address", "Address");
            objbulk.ColumnMappings.Add("Phone", "Phone");
            objbulk.ColumnMappings.Add("Fax", "Fax");
            objbulk.ColumnMappings.Add("Website", "Website");
            objbulk.ColumnMappings.Add("Email", "Email");
            objbulk.ColumnMappings.Add("BankingNumber", "BankingNumber");
            objbulk.ColumnMappings.Add("BankID", "BankID");
            objbulk.ColumnMappings.Add("HolderName", "HolderName");
            objbulk.ColumnMappings.Add("CategoryID", "CategoryID");
            objbulk.ColumnMappings.Add("Note", "Note");
            objbulk.ColumnMappings.Add("CreatedDate", "CreatedDate");
            objbulk.ColumnMappings.Add("CreatedBy", "CreatedBy");
            objbulk.ColumnMappings.Add("ModifiedDate", "ModifiedDate");
            objbulk.ColumnMappings.Add("ModifiedBy", "ModifiedBy");
            objbulk.ColumnMappings.Add("Status", "Status");

            con.Open();
            objbulk.WriteToServer(dt);
            con.Close();
        }
        public string NameToCode(string name)
        {
            ReceivePayObjectDao dao = new ReceivePayObjectDao();
            string fullName = dao.LocDauTen(name);
            string space = " ";
            //Khởi tạo chuỗi rỗng
            string firstName = "", middleName = "", firstName0 = "", middleName0 = "", lastName0 = "", code = ""; ;
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
            }
            return code;
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBagBank();
            SetViewBagObjectCategory();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(ReceivePayObject receivepayobject)
        {

            var dao = new ReceivePayObjectDao();
            receivepayobject.Code = NameToCode(receivepayobject.Name);
            receivepayobject.Status = true;
            int id = dao.Insert(receivepayobject);
            if (id > 0)
            {
                SetAlert("Thêm đối tượng thu chi thành công", "success");
                return RedirectToAction("Index", "ReceivePayObject");
            }
            else
            {
                ModelState.AddModelError("", "Thêm đối tượng thu chi không thành công");
            }
            SetViewBagBank(receivepayobject.BankID);
            SetViewBagObjectCategory(receivepayobject.CategoryID);
            return View("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var receivepayobject = new ReceivePayObjectDao().ViewDetail(id);
            SetViewBagBank();
            SetViewBagObjectCategory();
            return View(receivepayobject);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(ReceivePayObject receivepayobject, string Status)
        {
            var dao = new ReceivePayObjectDao();
            receivepayobject.Status = true;
            receivepayobject.Code = NameToCode(receivepayobject.Name);
            var result = dao.Update(receivepayobject);
            if (result)
            {
                SetAlert("Sửa đối tượng thu chi thành công", "success");
                return RedirectToAction("Index", "ReceivePayObject");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật đối tượng thu chi không thành công");
            }
            SetViewBagBank(receivepayobject.BankID);
            SetViewBagObjectCategory(receivepayobject.CategoryID);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new ReceivePayObjectDao().Delete(id);
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
            SetViewBagBank();
            SetViewBagObjectCategory();
            ReceivePayObject receivepayobject = db.ReceivePayObjects.Find(id);
            if (receivepayobject == null)
            {
                return HttpNotFound();
            }
            return View(receivepayobject);
        }
        //public ActionResult Education(int education)
        //{
        //    EducationDao dao = new EducationDao();
        //    List<Education> lst = dao.GetEducation(education);
        //    return PartialView(lst);
        //}
        public string DisplayBankName(int id)
        {
            Bank bank = db.Banks.Find(id);
            string result = bank.Name;
            return result;
        }
        public string DisplayCategoryName(int id)
        {
            ReceivePayObjectCategory category = db.ReceivePayObjectCategories.Find(id);
            string result = category.Name;
            return result;
        }
        //public string GetSocialInsuranceNo(int id)
        //{
        //    var model = new SocialInsuranceDao().GetSocialInsuranceInfo(id, 1, 1);
        //    ViewBag.ID = id;
        //    string result = "";
        //    if (model.Count() > 0)
        //    {
        //        result = model.FirstOrDefault().No;
        //    }
        //    else
        //    {
        //        result = "Chưa có dữ liệu";
        //    }
        //    return result;
        //}
        public void SetViewBagBank(long? selectedID = null)
        {
            var dao = new BankDao();
            ViewBag.BankName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        public void SetViewBagObjectCategory(long? selectedID = null)
        {
            var dao = new ReceivePayObjectCategoryDao();
            ViewBag.CategoryName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        public JsonResult ChangeStatus(long id)
        {
            var result = new ReceivePayObjectDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}