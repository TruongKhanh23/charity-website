using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MaiAmTruyenTin.Common;
using MaiAmTruyenTin.Areas.Admin.Models;
using Model;
using Model.DAO;
using Model.EF;
using System.Configuration;
using System.Xml.Linq;
using System.Net;
using System.Data;
using ClosedXML.Excel;
using System.IO;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class HistoryController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        [HasCredential(RoleID = "READ_HISTORY")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            try
            {
                var dao = new HistoryDao();
                var model = dao.ListAllPaging(searchString, page, pageSize);
                ViewBag.SearchString = searchString;
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
            dt.Columns.AddRange(new DataColumn[8] { new DataColumn("ID"),
                                                     new DataColumn("Name"),
                                                     new DataColumn("Description"),
                                                     new DataColumn("CreatedDate"),
                                                     new DataColumn("CreatedBy"),
                                                     new DataColumn("ModifiedDate"),
                                                     new DataColumn("ModifiedBy"),
                                                     new DataColumn("Status")});
            var history = from History in db.Histories select History;

            foreach (var his in history)
            {
                dt.Rows.Add(his.ID, his.Name, his.Description, his.CreatedDate, his.CreatedBy, his.ModifiedDate, his.ModifiedBy, his.Status);
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
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(History model)
        {
            var id = new HistoryDao().Insert(model);
            if (id > 0)
            {
                SetAlert("Thêm lịch sử thành công", "success");
                return RedirectToAction("Index", "History");
            }
            else
            {
                ModelState.AddModelError("", "Thêm lịch sử không thành công");
            }
            return View(model);
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var history = new HistoryDao().ViewDetail(id);
            return View(history);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(History history)
        {
            var dao = new HistoryDao();
            var result = dao.Update(history);
            if (result)
            {
                SetAlert("Sửa lịch sử thành công", "success");
                return RedirectToAction("Index", "History");
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật lịch sử không thành công");
            }
            return View();
        }
        [HttpPost]
        public void Delete(int id)
        {
            try
            {
                new HistoryDao().Delete(id);
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
            History history = db.Histories.Find(id);
            if (history == null)
            {
                return HttpNotFound();
            }
            return View(history);
        }
        public JsonResult ChangeStatus(long id)
        {
            var result = new HistoryDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}