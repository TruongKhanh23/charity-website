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

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class ReceiptController : BaseController
    {
        // GET: Admin/Receipt
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/Receipt

        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var model = new ReceiptDao().ListAllCategory(searchString, page, pageSize);
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
            dt.Columns.AddRange(new DataColumn[22] { new DataColumn("ID"),
                                                     new DataColumn("Mã quỹ tài khoản"),
                                                     new DataColumn("Ngày thu"),
                                                     new DataColumn("Mã khoản thu"),
                                                     new DataColumn("Số tiền"),
                                                     new DataColumn("Bằng chữ"),
                                                     new DataColumn("Mã phiếu thu"),
                                                     new DataColumn("Mã đối tượng nộp tiền"),
                                                     new DataColumn("Số điện thoại"),
                                                     new DataColumn("Số tài khoản"),
                                                     new DataColumn("Ngày cấp"),
                                                     new DataColumn("Nơi cấp"),
                                                     new DataColumn("Số tài khoản thụ hưởng"),
                                                     new DataColumn("Tại ngân hàng"),
                                                     new DataColumn("Chứng từ kế toán"),
                                                     new DataColumn("Ghi chú"),
                                                     new DataColumn("Địa chỉ"),
                                                     new DataColumn("Ngày lập phiếu"),
                                                     new DataColumn("Người lập phiếu"),
                                                     new DataColumn("Ngày sửa phiếu"),
                                                     new DataColumn("Người sửa phiếu"),
                                                     new DataColumn("Trạng thái sử dụng")});
            var receipt = from Receipt in db.Receipts select Receipt;

            foreach (var re in receipt)
            {
                dt.Rows.Add(re.ID, re.ReceivePayAccountID, re.Date, re.ReceivePayID, re.Amount, re.AmountText,
                    re.Code, re.ReceivePayObjectID, re.Phone, re.IDNo, re.DateOfIssue,
                    re.PlaceOfIssue, re.AccountNo, re.AtBank, re.FinancialPaper, re.Note,
                    re.Address, re.CreatedDate, re.CreatedBy, re.ModifiedDate, re.ModifiedBy, re.Status);
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
                var model = new ReceiptDao().ListAllCategory(searchString, page, pageSize);
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
            objbulk.DestinationTableName = "Receipt";
            objbulk.ColumnMappings.Add("ID", "ID");
            objbulk.ColumnMappings.Add("Mã quỹ tài khoản", "ReceivePayAccountID");
            objbulk.ColumnMappings.Add("Ngày thu", "Date");
            objbulk.ColumnMappings.Add("Mã khoản thu", "ReceivePayID");
            objbulk.ColumnMappings.Add("Số tiền", "Amount");
            objbulk.ColumnMappings.Add("Bằng chữ", "AmountText");
            objbulk.ColumnMappings.Add("Mã phiếu thu", "Code");
            objbulk.ColumnMappings.Add("Mã đối tượng nộp tiền", "ReceivePayObjectID");
            objbulk.ColumnMappings.Add("Số điện thoại", "Phone");
            objbulk.ColumnMappings.Add("Số tài khoản", "IDNo");
            objbulk.ColumnMappings.Add("Ngày cấp", "DateOfIssue");
            objbulk.ColumnMappings.Add("Nơi cấp", "PlaceOfIssue");
            objbulk.ColumnMappings.Add("Số tài khoản thụ hưởng", "AccountNo");
            objbulk.ColumnMappings.Add("Tại ngân hàng", "AtBank");
            objbulk.ColumnMappings.Add("Chứng từ kế toán", "FinancialPaper");
            objbulk.ColumnMappings.Add("Ghi chú", "Note");
            objbulk.ColumnMappings.Add("Địa chỉ", "Address");
            objbulk.ColumnMappings.Add("Ngày lập phiếu", "CreatedDate");
            objbulk.ColumnMappings.Add("Người lập phiếu", "CreatedBy");
            objbulk.ColumnMappings.Add("Ngày sửa phiếu", "ModifiedDate");
            objbulk.ColumnMappings.Add("Người sửa phiếu", "ModifiedBy");
            objbulk.ColumnMappings.Add("Trạng thái sử dụng", "Status");

            con.Open();
            objbulk.WriteToServer(dt);
            con.Close();
        }
        [HttpGet]
        public ActionResult Create()
        {
            //try
            //{
            SetViewBagAccount();
            SetViewBagReceivePay();
            SetViewBagReceivePayObject();
            SetViewBagBank();
            return View();
            //}
            //catch (Exception)
            //{
            //    return RedirectToAction("Error", "Home");
            //}
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Receipt receipt)
        {
            try
            {
                var dao = new ReceiptDao();
                receipt.Status = true;
                int id = dao.Insert(receipt);
                if (id > 0)
                {
                    SetAlert("Thêm phiếu thu thành công", "success");
                    return RedirectToAction("Index", "Receipt");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm phiếu thu không thành công");
                }
                SetViewBagAccount(receipt.ReceivePayAccountID);
                SetViewBagReceivePay(receipt.ReceivePayID);
                SetViewBagReceivePayObject(receipt.ReceivePayObjectID);
                SetViewBagBank(receipt.AtBank);
                return View("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var receipt = new ReceiptDao().ViewDetail(id);
            SetViewBagAccount();
            SetViewBagReceivePay();
            SetViewBagReceivePayObject();
            SetViewBagBank();
            return View(receipt);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Receipt receipt, string Status)
        {
            var dao = new ReceiptDao();
            receipt.Status = true;
            var result = dao.Update(receipt);
            if (result)
            {
                SetAlert("Sửa phiếu thu thành công", "success");
                return RedirectToAction("Index", "Receipt");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật phiếu thu không thành công");
            }
            SetViewBagAccount(receipt.ReceivePayAccountID);
            SetViewBagReceivePay(receipt.ReceivePayID);
            SetViewBagReceivePayObject(receipt.ReceivePayObjectID);
            SetViewBagBank(receipt.AtBank);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new ReceiptDao().Delete(id);
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
            SetViewBagAccount();
            SetViewBagReceivePay();
            SetViewBagReceivePayObject();
            Receipt receipt = db.Receipts.Find(id);
            if (receipt == null)
            {
                return HttpNotFound();
            }
            return View(receipt);
        }
        //public string DisplayPQName(int id)
        //{
        //    ProfessionalQualification pq = db.ProfessionalQualifications.Find(id);
        //    string result = pq.Name;
        //    return result;
        //}
        //public string DisplayMajorName(int id)
        //{
        //    Major major = db.Majors.Find(id);
        //    string result = major.Name;
        //    return result;
        //}
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
        public void SetViewBagAccount(long? selectedID = null)
        {
            var dao = new ReceivePayAccountDao();
            ViewBag.AccountName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        public void SetViewBagReceivePayObject(long? selectedID = null)
        {
            var dao = new ReceivePayObjectDao();
            ViewBag.ObjectName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        public void SetViewBagReceivePay(long? selectedID = null)
        {
            var dao = new ReceivePayDao();
            ViewBag.ReceivePayName = new SelectList(db.ReceivePays.Where(x => x.Status == true && x.ReceivableIsTrue == true).ToList(), "ID", "Name", selectedID);
        }
        public string CreateNewID()
        {
            int maxID = 0;
            var receiptList = db.Receipts.ToList().Count();
            if (receiptList != 0)
            {
                string maxCode = db.Receipts.ToList().LastOrDefault().Code;
                maxID = Int32.Parse(maxCode.Substring(maxCode.Length - 5, 5));
            }
            int newID = maxID + 1;
            string result = "";
            if (newID < 10)
            {
                result = "0000" + newID;
            }
            else if (newID <= 100)
            {
                result = "000" + newID;
            }
            else if (newID <= 1000)
            {
                result = "00" + newID;
            }
            else if (newID <= 10000)
            {
                result = "0" + newID;
            }
            return result;
        }
        public void SetViewBagBank(long? selectedID = null)
        {
            var dao = new BankDao();
            ViewBag.BankName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
    }
}