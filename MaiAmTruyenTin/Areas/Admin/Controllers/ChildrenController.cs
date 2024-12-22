//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
using Model.ViewModel;
//Khai báo Common
using System;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Net;
using System.IO;
using System.Data.SqlClient;
using System.Data.Entity.Infrastructure;
using ClosedXML.Excel;
using System.Data.OleDb;
using MaiAmTruyenTin.Common;
using System.Collections.Generic;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    [HandleError(ExceptionType = typeof(DbUpdateException), View = "Error")]
    public class ChildrenController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/Children
        [HasCredential(RoleID = "READ_CHILDREN")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var model = new ChildrenDao().ListAllCategory(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                return View(model);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        public int Age(int id)
        {
            var model = db.Children.Find(id);
            DateTime now = DateTime.Today;
            int age = now.Year - model.DateOfBirth.Year;
            if (model.DateOfBirth > now.AddYears(-age)) age--;
            return age;
        }
        [HttpPost]
        public FileResult ExportToExcel()
        {
            DataTable dt = new DataTable("Sheet1");
            dt.Columns.AddRange(new DataColumn[28] { new DataColumn("ID"),
                                                     new DataColumn("Code"),
                                                     new DataColumn("Successive"),
                                                     new DataColumn("FullName"),
                                                     new DataColumn("FoodExpenses"),
                                                     new DataColumn("EducationExpenses"),
                                                     new DataColumn("StartLiveDate"),
                                                     new DataColumn("DateOfBirth"),
                                                     new DataColumn("PlaceOfBirth"),
                                                     new DataColumn("Gender"),
                                                     new DataColumn("Ethnic"),
                                                     new DataColumn("Image"),
                                                     new DataColumn("BirthCertificate"),
                                                     new DataColumn("HkType"),
                                                     new DataColumn("HKImage"),
                                                     new DataColumn("Confirmation"),
                                                     new DataColumn("EnrollReason"),
                                                     new DataColumn("Date"),
                                                     new DataColumn("CategoryID"),
                                                     new DataColumn("ProfessionalQualificationID"),
                                                     new DataColumn("MajorID"),
                                                     new DataColumn("EducationID"),
                                                     new DataColumn("MetaDescriptions"),
                                                     new DataColumn("CreatedDate"),
                                                     new DataColumn("CreatedBy"),
                                                     new DataColumn("ModifiedDate"),
                                                     new DataColumn("ModifiedBy"),
                                                     new DataColumn("Status")});
            var children = from Children in db.Children select Children;

            foreach (var vol in children)
            {
                dt.Rows.Add(vol.ID, vol.Code, vol.Successive, vol.FullName, vol.FoodExpenses, vol.EducationExpenses,
                    vol.StartLiveDate, vol.DateOfBirth, vol.PlaceOfBirth, vol.Gender, vol.Ethnic,
                    vol.Image, vol.BirthCertificate, vol.HkType, vol.HKImage, vol.Confirmation,
                    vol.EnrollReason, vol.Date, vol.CategoryID, vol.ProfessionalQualificationID, vol.MajorID, vol.EducationID,
                    vol.MetaDescriptions, vol.CreatedDate, vol.CreatedBy, vol.ModifiedDate, vol.ModifiedBy, vol.Status);
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
            //try
            //{
                string filename = Guid.NewGuid() + Path.GetExtension(file.FileName);
                string filepath = "~/Data/" + filename;
                file.SaveAs(Path.Combine(Server.MapPath("~/Data"), filename));
                InsertExceldata(filepath, filename); System.IO.File.Delete(Path.Combine(Server.MapPath("~/Data/"), filename));
                var model = new ChildrenDao().ListAllCategory(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
                return View(model);
            //}
            //catch (Exception)
            //{
            //    return RedirectToAction("Error", "Home");
            //}
        }
        private void ExcelConn(string filepath)
        {
            string constr = string.Format(@"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={0};Extended Properties=""Excel 12.0 Xml;HDR=YES;""", filepath);
            Econ = new OleDbConnection(constr);
        }
        private void InsertExceldata(string filepath, string filename)
        {
            string fullpath = Server.MapPath("~/Data/") + filename;
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
            objbulk.DestinationTableName = "Children";
            objbulk.ColumnMappings.Add("ID", "ID");
            objbulk.ColumnMappings.Add("Code", "Code");
            objbulk.ColumnMappings.Add("Successive", "Successive");
            objbulk.ColumnMappings.Add("FullName", "FullName");
            objbulk.ColumnMappings.Add("FoodExpenses", "FoodExpenses");
            objbulk.ColumnMappings.Add("EducationExpenses", "EducationExpenses");
            objbulk.ColumnMappings.Add("StartLiveDate", "StartLiveDate");
            objbulk.ColumnMappings.Add("DateOfBirth", "DateOfBirth");
            objbulk.ColumnMappings.Add("PlaceOfBirth", "PlaceOfBirth");
            objbulk.ColumnMappings.Add("Gender", "Gender");
            objbulk.ColumnMappings.Add("Ethnic", "Ethnic");
            objbulk.ColumnMappings.Add("Image", "Image");
            objbulk.ColumnMappings.Add("BirthCertificate", "BirthCertificate");
            objbulk.ColumnMappings.Add("HkType", "HkType");
            objbulk.ColumnMappings.Add("HKImage", "HKImage");
            objbulk.ColumnMappings.Add("Confirmation", "Confirmation");
            objbulk.ColumnMappings.Add("EnrollReason", "EnrollReason");
            objbulk.ColumnMappings.Add("Date", "Date");
            objbulk.ColumnMappings.Add("CategoryID", "CategoryID");
            objbulk.ColumnMappings.Add("ProfessionalQualificationID", "ProfessionalQualificationID");
            objbulk.ColumnMappings.Add("MajorID", "MajorID");
            objbulk.ColumnMappings.Add("EducationID", "EducationID");
            objbulk.ColumnMappings.Add("MetaDescriptions", "MetaDescriptions");
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
            string firstName = "", middleName = "", firstName0 = "", middleName0 = "", lastName0 = "", code = "";
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
                code = code.Trim();
            }
            return code;
        }

        [HttpGet]
        public ActionResult Create()
        {
            SetViewBagCategory();
            SetViewBagEducation();
            SetViewBagProQua();
            SetViewBagMajor();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Children children)
        {
            try
            {
                //Image
                string fileName = Path.GetFileNameWithoutExtension(children.ImageFile.FileName);
                string extension = Path.GetExtension(children.ImageFile.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                children.Image = "~/Data/images/Children/" + fileName;
                fileName = Path.Combine(Server.MapPath("~/Data/images/Children/"), fileName);
                children.ImageFile.SaveAs(fileName);
                //BirthCertificate
                string fileName1 = Path.GetFileNameWithoutExtension(children.BirthCertificateImageFile.FileName);
                string extension1 = Path.GetExtension(children.BirthCertificateImageFile.FileName);
                fileName1 = fileName1 + DateTime.Now.ToString("yymmssfff") + extension1;
                children.BirthCertificate = "~/Data/images/Children/" + fileName1;
                fileName1 = Path.Combine(Server.MapPath("~/Data/images/Children/"), fileName1);
                children.BirthCertificateImageFile.SaveAs(fileName1);
                //HKImage
                string fileName2 = Path.GetFileNameWithoutExtension(children.HKImageFile.FileName);
                string extension2 = Path.GetExtension(children.HKImageFile.FileName);
                fileName2 = fileName2 + DateTime.Now.ToString("yymmssfff") + extension2;
                children.HKImage = "~/Data/images/Children/" + fileName2;
                fileName2 = Path.Combine(Server.MapPath("~/Data/images/Children/"), fileName2);
                children.HKImageFile.SaveAs(fileName2);

                children.Status = true;
                var dao = new ChildrenDao();
                children.Code = NameToCode(children.FullName) + children.DateOfBirth.ToString("ddMMyyyy");
                int id = dao.Insert(children);
                if (id > 0)
                {
                    SetAlert("Thêm đối tượng thành công", "success");
                    return RedirectToAction("Index", "Children");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm đối tượng không thành công");
                }
                SetViewBagEducation(children.EducationID);
                SetViewBagCategory(children.CategoryID);
                SetViewBagMajor(children.MajorID);
                SetViewBagProQua(children.ProfessionalQualificationID);
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
            var children = new ChildrenDao().ViewDetail(id);
            Session["imgPath"] = children.Image;
            Session["hkImgPath"] = children.HKImage;
            Session["birthImgPath"] = children.BirthCertificate;
            SetViewBagCategory();
            SetViewBagEducation();
            SetViewBagProQua();
            SetViewBagMajor();
            return View(children);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Children children, HttpPostedFileBase img, HttpPostedFileBase hkImg, HttpPostedFileBase birthImg)
        {
            try
            {
                string _ImagesPath = "~/Data/images/Children/";
                //Image
                if (img != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(img.FileName);
                    string extension = Path.GetExtension(img.FileName);
                    fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                    children.Image = _ImagesPath + fileName;
                    fileName = Path.Combine(Server.MapPath("~/Data/images/Children/"), fileName);
                    string oldImgPath = Request.MapPath(Session["imgPath"].ToString());
                    img.SaveAs(fileName);
                    if (System.IO.File.Exists(oldImgPath))
                    {
                        System.IO.File.Delete(oldImgPath);
                    }
                }
                else
                {
                    children.Image = Session["imgPath"].ToString();
                }

                //BirthCertificate
                if (birthImg != null)
                {
                    string fileName1 = Path.GetFileNameWithoutExtension(birthImg.FileName);
                    string extension1 = Path.GetExtension(birthImg.FileName);
                    fileName1 = fileName1 + DateTime.Now.ToString("yymmssfff") + extension1;
                    children.BirthCertificate = "~/Data/images/Children/" + fileName1;
                    fileName1 = Path.Combine(Server.MapPath("~/Data/images/Children/"), fileName1);
                    string oldBirthImgPath = Request.MapPath(Session["birthImgPath"].ToString());
                    birthImg.SaveAs(fileName1);
                    if (System.IO.File.Exists(oldBirthImgPath))
                    {
                        System.IO.File.Delete(oldBirthImgPath);
                    }
                }
                else
                {
                    children.BirthCertificate = Session["birthImgPath"].ToString();
                }

                //HKImage
                if (hkImg != null)
                {
                    string fileName2 = Path.GetFileNameWithoutExtension(hkImg.FileName);
                    string extension2 = Path.GetExtension(hkImg.FileName);
                    fileName2 = fileName2 + DateTime.Now.ToString("yymmssfff") + extension2;
                    children.HKImage = "~/Data/images/Children/" + fileName2;
                    fileName2 = Path.Combine(Server.MapPath("~/Data/images/Children/"), fileName2);
                    string oldHKImgPath = Request.MapPath(Session["hkImgPath"].ToString());
                    hkImg.SaveAs(fileName2);
                    if (System.IO.File.Exists(oldHKImgPath))
                    {
                        System.IO.File.Delete(oldHKImgPath);
                    }
                }
                else
                {
                    children.HKImage = Session["hkImgPath"].ToString();
                }
                children.Status = true;
                var dao = new ChildrenDao();
                children.Code = NameToCode(children.FullName) + children.DateOfBirth.ToString("ddMMyyyy");
                var result = dao.Update(children);
                if (result)
                {
                    SetAlert("Sửa đối tượng thành công", "success");
                    return RedirectToAction("Index", "Children");
                }
                else
                {
                    ModelState.AddModelError("", "Cập nhật thông tin trẻ không thành công");
                }
                SetViewBagEducation(children.EducationID);
                SetViewBagCategory(children.CategoryID);
                SetViewBagMajor(children.MajorID);
                SetViewBagProQua(children.ProfessionalQualificationID);
                return View();
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new ChildrenDao().Delete(id);
            }
            catch
            {

            }
        }
        public FileResult DownloadHKFile(string hkFile)
        {
            string typeFile = hkFile.Substring(hkFile.Length - 3, 3);
            if (typeFile == "pdf")
            {
                return File(hkFile, "application /pdf");
            }
            else if (typeFile == "jpg")
            {
                return File(hkFile, "image/jpg");
            }
            else
            {
                return File(hkFile, "image/png");
            }
        }
        public ActionResult Details(int? id)
        {
            var dao = new DataDao();
            var daoCate = new ChildrenCategoryDao();
            var daoEdu = new EducationDao();
            var daoMajor = new MajorDao();
            var daoProfessional = new ProfessionalQualificationDao();
            var daoInsurance = new HealthInsuranceDao();
            Children children = db.Children.Find(id);
            try
            {
                ViewBag.ChildrenCategory = daoCate.ViewDetail(children.CategoryID).Name;
                ViewBag.Education = daoEdu.ViewDetail(children.EducationID).Name;
                if (children.ProfessionalQualificationID != 0)
                {
                    ViewBag.Major = daoMajor.ViewDetail(children.MajorID).Name;
                    ViewBag.ProfessionalQualification = daoProfessional.ViewDetail(children.ProfessionalQualificationID).Name;
                }
                return View(children);
            }
            catch (Exception)
            {
                return RedirectToAction("Error", "Home");
            }
        }
        //SetViewBagData
        public void SetViewBagCategory(int? selectedID = null)
        {
            var dao = new ChildrenCategoryDao();
            ViewBag.CategoryName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        public void SetViewBagEducation(long? selectedID = null)
        {
            var dao = new EducationDao();
            ViewBag.EducationName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        public void SetViewBagMajor(long? selectedID = null)
        {
            var dao = new MajorDao();
            ViewBag.MajorName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        public void SetViewBagProQua(long? selectedID = null)
        {
            var dao = new ProfessionalQualificationDao();
            ViewBag.ProfessionalQualificationName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        private const string urlPattern = "http://rate-exchange-1.appspot.com/currency?from={0}&to={1}";
        public string CurrencyConversion(decimal amount, string fromCurrency, string toCurrency)
        {
            string url = string.Format(urlPattern, fromCurrency, toCurrency);
            try
            {
                using (var wc = new WebClient())
                {
                    var json = wc.DownloadString(url);

                    Newtonsoft.Json.Linq.JToken token = Newtonsoft.Json.Linq.JObject.Parse(json);
                    decimal exchangeRate = (decimal)token.SelectToken("rate");
                    decimal result = amount * exchangeRate;
                    string resultString = String.Format("0:$#,##0.00;($#,##0.00);Zero", result);
                    Console.WriteLine(resultString);
                    return String.Format("{0:$#,##0.00;($#,##0.00);Zero}", result);
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public int GetHealthID(int id)
        {
            int healthID = db.HealthInsurances.Where(x => x.ChildrenID == id).FirstOrDefault().ID;
            return healthID;
        }
        public string GetHealthInsuranceNo(int id)
        {
            var model = new HealthInsuranceDao().GetHealthInsuranceInfo(id, 1, 1);
            ViewBag.ID = id;
            string result = "";
            if (model.Count() > 0)
            {
                result = model.FirstOrDefault().No;
            }
            else
            {
                result = "Chưa có dữ liệu";
            }
            return result;
        }
        public string GetXFamilyBookCode(int id)
        {
            var model = new XFamilyBookDao().GetXFmailyBookInfo(id, 1, 1);
            ViewBag.ID = id;
            string result = "";
            if (model.Count() > 0)
            {
                result = model.FirstOrDefault().Code;
            }
            else
            {
                result = "Chưa có dữ liệu";
            }
            return result;
        }

        public ActionResult CounselingChildren(int id)
        {
            var counseling = from c in db.Counselings where c.ChildrenID == id select c;
            return PartialView(counseling);
        }
        public ActionResult SchoolReportDetail(int id)
        {
            var model = new SchoolReportDetailDao().ListAllSchoolReportDetails(id, 1, 30);
            return PartialView(model);
        }
        public ActionResult EmptySchoolReport(int id)
        {
            var model = new SchoolReportDao().ListAllSchoolReport(id, 1, 3);
            ViewBag.ID = id;
            return PartialView(model);
        }
        public ActionResult GetListSchoolReportCode(int id)
        {
            var model = new SchoolReportDao().ListAllSchoolReport(id, 1, 3);
            ViewBag.ID = id;
            return PartialView(model);
        }
        public ActionResult DevelopmentProcess(int id)
        {
            var developmentprocess = from dp in db.DevelopmentProcesses where dp.ChildrenID == id select dp;
            return PartialView(developmentprocess);
        }
    }
}