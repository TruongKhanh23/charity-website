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
using System.Data.OleDb;
using System.Web;
using System;
using System.Configuration;
using GroupDocs.Viewer;
using GroupDocs.Viewer.Options;
using MaiAmTruyenTin.Common;
using Model.ViewModel;
using DocumentFormat.OpenXml.Drawing.Diagrams;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class EmployeeController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/Employee
        HistoryDao dao = new HistoryDao();
        [HasCredential(RoleID = "READ_EMPLOYEE")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var model = new EmployeeDao().ListAllCategory(searchString, page, pageSize);
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
            var model = db.Employees.Find(id);
            DateTime now = DateTime.Today;
            int age = now.Year - model.DateOfBirth.Year;
            if (model.DateOfBirth > now.AddYears(-age)) age--;
            return age;
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
        [HttpPost]
        public FileResult ExportToExcel()
        {
            DataTable dt = new DataTable("Sheet1");
            dt.Columns.AddRange(new DataColumn[34] { new DataColumn("ID"),
                                                     new DataColumn("Code"),
                                                     new DataColumn("IdentityCard"),
                                                     new DataColumn("Name"),
                                                     new DataColumn("Gender"),
                                                     new DataColumn("Image"),
                                                     new DataColumn("DateOfBirth"),
                                                     new DataColumn("Domicile"),
                                                     new DataColumn("PlaceOfBirth"),
                                                     new DataColumn("ProfessionalQualificationID"),
                                                     new DataColumn("EducationID"),
                                                     new DataColumn("MajorID"),
                                                     new DataColumn("StudiedAt"),
                                                     new DataColumn("Language"),
                                                     new DataColumn("InformationTechnology"),
                                                     new DataColumn("Job"),
                                                     new DataColumn("JobName"),
                                                     new DataColumn("Email"),
                                                     new DataColumn("Phone"),
                                                     new DataColumn("Successive"),
                                                     new DataColumn("Religion"),
                                                     new DataColumn("StartingSalagy"),
                                                     new DataColumn("GiftSalary"),
                                                     new DataColumn("AllOtherFoodExpenses"),
                                                     new DataColumn("ContractType"),
                                                     new DataColumn("WorkingContract"),
                                                     new DataColumn("WorkingDate"),
                                                     new DataColumn("StoppedWorkingDate"),
                                                     new DataColumn("WorkingHours"),
                                                     new DataColumn("CreatedDate"),
                                                     new DataColumn("CreatedBy"),
                                                     new DataColumn("ModifiedDate"),
                                                     new DataColumn("ModifiedBy"),
                                                     new DataColumn("Status")});
            var employee = from Employee in db.Employees select Employee;

            foreach (var emp in employee)
            {
                dt.Rows.Add(emp.ID, emp.Code, emp.IdentityCard, emp.Name, emp.Gender, emp.Image, emp.DateOfBirth,
                    emp.Domicile, emp.PlaceOfBirth, emp.ProfessionalQualificationID, emp.EducationID, emp.MajorID,
                    emp.StudiedAt, emp.Language, emp.InformationTechnology, emp.Job, emp.JobName,
                    emp.Email, emp.Phone, emp.Successive, emp.Religion, emp.StartingSalagy,
                    emp.GiftSalary, emp.AllOtherFoodExpenses, emp.ContractType, emp.WorkingContract, emp.WorkingDate,
                    emp.StoppedWorkingDate, emp.WorkingHours, emp.CreatedDate, emp.CreatedBy, emp.ModifiedDate, emp.ModifiedBy, emp.Status);
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
                var model = new EmployeeDao().ListAllCategory(searchString, page, pageSize);
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
            objbulk.DestinationTableName = "Employee";
            objbulk.ColumnMappings.Add("ID", "ID");
            objbulk.ColumnMappings.Add("Code", "Code");
            objbulk.ColumnMappings.Add("IdentityCard", "IdentityCard");
            objbulk.ColumnMappings.Add("Name", "Name");
            objbulk.ColumnMappings.Add("Gender", "Gender");
            objbulk.ColumnMappings.Add("Image", "Image");
            objbulk.ColumnMappings.Add("DateOfBirth", "DateOfBirth");
            objbulk.ColumnMappings.Add("Domicile", "Domicile");
            objbulk.ColumnMappings.Add("PlaceOfBirth", "PlaceOfBirth");
            objbulk.ColumnMappings.Add("ProfessionalQualificationID", "ProfessionalQualificationID");
            objbulk.ColumnMappings.Add("EducationID", "EducationID");
            objbulk.ColumnMappings.Add("MajorID", "MajorID");
            objbulk.ColumnMappings.Add("StudiedAt", "StudiedAt");
            objbulk.ColumnMappings.Add("Language", "Language");
            objbulk.ColumnMappings.Add("InformationTechnology", "InformationTechnology");
            objbulk.ColumnMappings.Add("Job", "Job");
            objbulk.ColumnMappings.Add("JobName", "JobName");
            objbulk.ColumnMappings.Add("Email", "Email");
            objbulk.ColumnMappings.Add("Phone", "Phone");
            objbulk.ColumnMappings.Add("Successive", "Successive");
            objbulk.ColumnMappings.Add("Religion", "Religion");
            objbulk.ColumnMappings.Add("StartingSalagy", "StartingSalagy");
            objbulk.ColumnMappings.Add("GiftSalary", "GiftSalary");
            objbulk.ColumnMappings.Add("AllOtherFoodExpenses", "AllOtherFoodExpenses");
            objbulk.ColumnMappings.Add("ContractType", "ContractType");
            objbulk.ColumnMappings.Add("WorkingContract", "WorkingContract");
            objbulk.ColumnMappings.Add("WorkingDate", "WorkingDate");
            objbulk.ColumnMappings.Add("StoppedWorkingDate", "StoppedWorkingDate");
            objbulk.ColumnMappings.Add("WorkingHours", "WorkingHours");
            objbulk.ColumnMappings.Add("CreatedDate", "CreatedDate");
            objbulk.ColumnMappings.Add("CreatedBy", "CreatedBy");
            objbulk.ColumnMappings.Add("ModifiedDate", "ModifiedDate");
            objbulk.ColumnMappings.Add("ModifiedBy", "ModifiedBy");
            objbulk.ColumnMappings.Add("Status", "Status");

            con.Open();
            objbulk.WriteToServer(dt);
            con.Close();
        }
        [HttpGet]
        public ActionResult Create()
        {
            SetViewBagEducation();
            SetViewBagMajor();
            SetViewBagProfessionalQualification();
            SetViewBagReligion();
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Employee employee)
        {
            string fileName = Path.GetFileNameWithoutExtension(employee.AgreementFile.FileName);
            string extension = Path.GetExtension(employee.AgreementFile.FileName);
            fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
            employee.Agreement = "/Data/files/" + fileName;
            fileName = Path.Combine(Server.MapPath("~/Data/files/"), fileName);
            employee.AgreementFile.SaveAs(fileName);

            string fileName1 = Path.GetFileNameWithoutExtension(employee.ImageFile.FileName);
            string extension1 = Path.GetExtension(employee.ImageFile.FileName);
            fileName1 = fileName1 + DateTime.Now.ToString("yymmssfff") + extension1;
            employee.Image = "/Data/files/" + fileName1;
            fileName1 = Path.Combine(Server.MapPath("~/Data/files/"), fileName1);
            employee.ImageFile.SaveAs(fileName1);

            var dao = new EmployeeDao();
            employee.Status = true;
            employee.Code = NameToCode(employee.Name) + employee.DateOfBirth.ToString("ddMMyyyy");
            int id = dao.Insert(employee);
            if (id > 0)
            {
                SetAlert("Thêm trẻ thành công", "success");
                return RedirectToAction("Index", "Employee");
            }
            else
            {
                ModelState.AddModelError("", "Thêm trẻ không thành công");
            }
            SetViewBagEducation(employee.EducationID);
            SetViewBagMajor(employee.MajorID);
            SetViewBagProfessionalQualification(employee.ProfessionalQualificationID);
            SetViewBagReligion(Int32.Parse(employee.Religion));
            return View("Index");
        }
        public FileResult DownloadAgreement(string agreement)
        {
            string typeFile = agreement.Substring(agreement.Length - 3, 3);
            if (typeFile == "pdf")
            {
                return File(agreement, "application /pdf");
            }
            else if (typeFile == "jpg")
            {
                return File(agreement, "image/jpg");
            }
            else
            {
                return File(agreement, "image/png");
            }
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var employee = new EmployeeDao().ViewDetail(id);
            Session["agreementFile"] = employee.Agreement;
            Session["img"] = employee.Image;
            SetViewBagEducation();
            SetViewBagMajor();
            SetViewBagProfessionalQualification();
            SetViewBagReligion();
            return View(employee);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Employee employee, HttpPostedFileBase agreement, HttpPostedFileBase img)
        {
            string _agreementPath = "/Data/files/";
            //Agreement Image
            if (agreement != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(agreement.FileName);
                string extension = Path.GetExtension(agreement.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                employee.Agreement = _agreementPath + fileName;
                fileName = Path.Combine(Server.MapPath("~/Data/files/"), fileName);
                string oldImgPath = Request.MapPath(Session["agreementFile"].ToString());
                agreement.SaveAs(fileName);
                if (System.IO.File.Exists(oldImgPath))
                {
                    System.IO.File.Delete(oldImgPath);
                }
            }
            else
            {
                employee.Agreement = Session["agreementFile"].ToString();
            }
            string _ImagesPath = "/Data/images/Employee/";
            //Image
            if (img != null)
            {
                string fileName1 = Path.GetFileNameWithoutExtension(img.FileName);
                string extension1 = Path.GetExtension(img.FileName);
                fileName1 = fileName1 + DateTime.Now.ToString("yymmssfff") + extension1;
                employee.Image = _ImagesPath + fileName1;
                fileName1 = Path.Combine(Server.MapPath("~/Data/images/Employee/"), fileName1);
                string oldImgPath = Request.MapPath(Session["img"].ToString());
                img.SaveAs(fileName1);
                if (System.IO.File.Exists(oldImgPath))
                {
                    System.IO.File.Delete(oldImgPath);
                }
            }
            else
            {
                employee.Image = Session["img"].ToString();
            }

            var dao = new EmployeeDao();
            employee.Code = NameToCode(employee.Name) + employee.DateOfBirth.ToString("ddMMyyyy");
            employee.Status = true;
            var result = dao.Update(employee);
            if (result)
            {
                SetAlert("Sửa nhân viên thành công", "success");
                return RedirectToAction("Index", "Employee");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật nhân viên không thành công");
            }
            SetViewBagEducation(employee.EducationID);
            SetViewBagMajor(employee.MajorID);
            SetViewBagProfessionalQualification(employee.ProfessionalQualificationID);
            SetViewBagReligion(Int32.Parse(employee.Religion));
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new EmployeeDao().Delete(id);
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
            SetViewBagEducation();
            SetViewBagMajor();
            SetViewBagProfessionalQualification();
            Employee employee = db.Employees.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }
        //Display Details Data
        public string DisplayReligion(int id)
        {
            var dao = new DataDao();
            string result = dao.ViewDetailReligion(id).Name;
            return result;
        }
        public string DisplayPQName(int id)
        {
            string result = "";
            if (id != 0)
            {
                ProfessionalQualification pq = db.ProfessionalQualifications.Find(id);
                result = pq.Name;
            }
            return result;
        }
        public string DisplayEducation(int id)
        {
            Education edu = db.Educations.Find(id);
            var model = new EmployeeViewModel();
            model.EducationName = edu.Name;
            string result = model.EducationName;
            return result;
        }
        public string DisplayMajorName(int id)
        {
            string result = "";
            if (id != 0)
            {
                Major major = db.Majors.Find(id);
                result = major.Name;
            }
            return result;
        }
        public string GetSocialInsuranceNo(int id)
        {
            var model = new SocialInsuranceDao().GetSocialInsuranceInfo(id, 1, 1);
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

        //SetViewBagData

        public void SetViewBagReligion(int? selectedID = null)
        {
            var dao = new DataDao();
            ViewBag.ReligionName = new SelectList(dao.ReligionList(), "ID", "Name", selectedID);
        }
        public void SetViewBagEducation(long? selectedID = null)
        {
            var dao = new EducationDao();
            ViewBag.EducationName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        public void SetViewBagProfessionalQualification(long? selectedID = null)
        {
            var dao = new ProfessionalQualificationDao();
            ViewBag.ProfessionalQualificationName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
        public void SetViewBagMajor(long? selectedID = null)
        {
            var dao = new MajorDao();
            ViewBag.MajorName = new SelectList(dao.ListAll(), "ID", "Name", selectedID);
        }
    }
}