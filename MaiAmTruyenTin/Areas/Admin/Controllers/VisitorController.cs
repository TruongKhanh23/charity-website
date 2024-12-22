//Khai báo DAO và EF trong Model
using Model.DAO;
using Model.EF;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Model;
using System.Data;
using System.Net;
using PagedList;
using System.Web.UI.HtmlControls;
using MaiAmTruyenTin.Areas.Admin.Models;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using System.IO;
using System;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class VisitorController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/Visitor
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var model = new VisitorDao().ListAllPaging(searchString, page, pageSize);
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
            dt.Columns.AddRange(new DataColumn[10] { new DataColumn("ID"),
                                                     new DataColumn("Name"),
                                                     new DataColumn("VisitReason"),
                                                     new DataColumn("Phone"),
                                                     new DataColumn("Email"),
                                                     new DataColumn("CreatedDate"),
                                                     new DataColumn("CreatedBy"),
                                                     new DataColumn("ModifiedDate"),
                                                     new DataColumn("ModifiedBy"),
                                                     new DataColumn("Status")});
            var visitor = from Visitor in db.Visitors select Visitor;

            foreach (var vi in visitor)
            {
                dt.Rows.Add(vi.ID, vi.Name, vi.VisitReason, vi.Phone, vi.Email, vi.CreatedDate, vi.CreatedBy, vi.ModifiedDate, vi.ModifiedBy, vi.Status);
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
        public ActionResult Details(int? id)
        {
            try
            {
                if (id == null)
                {
                    return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                }
                Visitor visitor = db.Visitors.Find(id);
                if (visitor == null)
                {
                    return HttpNotFound();
                }
                return View(visitor);
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
                new VisitorDao().Delete(id);
            }
            catch
            {

            }
        }
    }
}