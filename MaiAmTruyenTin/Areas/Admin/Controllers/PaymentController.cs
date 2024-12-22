//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Net;
using System.Web.DynamicData;
using System.Data;
using ClosedXML.Excel;
using System.IO;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.Web;
using System.Configuration;
using System;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class PaymentController : BaseController
    {
        // GET: Admin/Payment
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/Payment

        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var model = new PaymentDao().ListAllCategory(searchString, page, pageSize);
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
            dt.Columns.AddRange(new DataColumn[23] { new DataColumn("ID"),
                                                     new DataColumn("Mã quỹ tài khoản"),
                                                     new DataColumn("Ngày chi"),
                                                     new DataColumn("Mã khoản chi"),
                                                     new DataColumn("Số tiền"),
                                                     new DataColumn("Bằng chữ"),
                                                     new DataColumn("Mã phiếu chi"),
                                                     new DataColumn("Đối tượng nhận tiền"),
                                                     new DataColumn("Số điện thoại"),
                                                     new DataColumn("Số tài khoản"),
                                                     new DataColumn("Ngày cấp"),
                                                     new DataColumn("Nơi cấp"),
                                                     new DataColumn("Số tài khoản chi tiền"),
                                                     new DataColumn("Tại ngân hàng"),
                                                     new DataColumn("Ghi chú"),
                                                     new DataColumn("Chứng từ kế toán"),
                                                     new DataColumn("Lí do chi tiền"),
                                                     new DataColumn("Địa chỉ"),
                                                     new DataColumn("Ngày lập phiếu"),
                                                     new DataColumn("Người lập phiếu"),
                                                     new DataColumn("Ngày sửa phiếu"),
                                                     new DataColumn("Người sửa phiếu"),
                                                     new DataColumn("Trạng thái sử dụng")});
            var payment = from Payment in db.Payments select Payment;

            foreach (var pay in payment)
            {
                dt.Rows.Add(pay.ID, pay.ReceivePayAccountID, pay.Date, pay.ReceivePayID, pay.Amount, pay.AmountText,
                    pay.Code, pay.ReceivePayObjectID, pay.Phone, pay.IDNo, pay.DateOfIssue,
                    pay.PlaceOfIssue, pay.AccountNo, pay.AtBank, pay.Note, pay.FinancialPaper,
                    pay.Reason, pay.Address, pay.CreatedDate, pay.CreatedBy, pay.ModifiedDate, pay.ModifiedBy, pay.Status);
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
                InsertExceldata(filepath, filename);
                System.IO.File.Delete(Path.Combine(Server.MapPath("~/Data/"), filename));
                var model = new PaymentDao().ListAllCategory(searchString, page, pageSize);
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
            objbulk.DestinationTableName = "Payment";
            objbulk.ColumnMappings.Add("ID", "ID");
            objbulk.ColumnMappings.Add("Mã quỹ tài khoản", "ReceivePayAccountID");
            objbulk.ColumnMappings.Add("Ngày chi", "Date");
            objbulk.ColumnMappings.Add("Mã khoản chi", "ReceivePayID");
            objbulk.ColumnMappings.Add("Số tiền", "Amount");
            objbulk.ColumnMappings.Add("Bằng chữ", "AmountText");
            objbulk.ColumnMappings.Add("Mã phiếu chi", "Code");
            objbulk.ColumnMappings.Add("Đối tượng nhận tiền", "ReceivePayObjectID");
            objbulk.ColumnMappings.Add("Số điện thoại", "Phone");
            objbulk.ColumnMappings.Add("Số tài khoản", "IDNo");
            objbulk.ColumnMappings.Add("Ngày cấp", "DateOfIssue");
            objbulk.ColumnMappings.Add("Nơi cấp", "PlaceOfIssue");
            objbulk.ColumnMappings.Add("Số tài khoản chi tiền", "AccountNo");
            objbulk.ColumnMappings.Add("Tại ngân hàng", "AtBank");
            objbulk.ColumnMappings.Add("Ghi chú", "Note");
            objbulk.ColumnMappings.Add("Chứng từ kế toán", "FinancialPaper");
            objbulk.ColumnMappings.Add("Lí do chi tiền", "Reason");
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
        public ActionResult Create(Payment payment)
        {
            try
            {
                var dao = new PaymentDao();
                payment.Status = true;
                int id = dao.Insert(payment);
                if (id > 0)
                {
                    SetAlert("Thêm phiếu chi thành công", "success");
                    return RedirectToAction("Index", "Payment");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm phiếu chi không thành công");
                }
                SetViewBagAccount(payment.ReceivePayAccountID);
                SetViewBagReceivePay(payment.ReceivePayID);
                SetViewBagReceivePayObject(payment.ReceivePayObjectID);
                SetViewBagBank(payment.AtBank);
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
            try
            {
                var payment = new PaymentDao().ViewDetail(id);
                SetViewBagAccount();
                SetViewBagReceivePay();
                SetViewBagReceivePayObject();
                SetViewBagBank();
                return View(payment);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Payment payment)
        {
            var dao = new PaymentDao();
            payment.Status = true;
            var result = dao.Update(payment);
            if (result)
            {
                SetAlert("Sửa phiếu chi thành công", "success");
                return RedirectToAction("Index", "Payment");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật phiếu chi không thành công");
            }
            SetViewBagAccount(payment.ReceivePayAccountID);
            SetViewBagReceivePay(payment.ReceivePayID);
            SetViewBagReceivePayObject(payment.ReceivePayObjectID);
            SetViewBagBank(payment.AtBank);
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new PaymentDao().Delete(id);
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
            Payment payment = db.Payments.Find(id);
            if (payment == null)
            {
                return HttpNotFound();
            }
            return View(payment);
        }
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
            ViewBag.ReceivePayName = new SelectList(db.ReceivePays.Where(x => x.Status == true && x.ReceivableIsTrue == false).ToList(), "ID", "Name", selectedID);
        }
        public string CreateNewID()
        {
            int maxID = 0;
            var paymentList = db.Payments.ToList().Count();
            if (paymentList != 0)
            {
                string maxCode = db.Payments.ToList().LastOrDefault().Code;
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