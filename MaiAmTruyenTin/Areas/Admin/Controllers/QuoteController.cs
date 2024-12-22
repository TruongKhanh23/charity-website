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
using Model;
using System.Data;
//using System.Data.Entity;
using System.Net;
using PagedList;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Web.Helpers;

namespace MaiAmTruyenTin.Areas.Admin.Controllers
{
    public class QuoteController : BaseController
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        // GET: Admin/Quote
        [HasCredential(RoleID = "READ_QUOTE")]
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var model = new QuoteDao().ListAllPaging(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
        }
        public ActionResult IndexChildren(string searchString, string childrenName, int page = 1, int pageSize = 10)
        {
            var model = new QuoteDao().ListAllPagingChildren(searchString, childrenName, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);
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
                code = code.Trim();
            }
            return code;
        }
        [HttpGet]
        [HasCredential(RoleID = "CREATE_QUOTE")]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        [HasCredential(RoleID = "CREATE_QUOTE")]
        public ActionResult Create(Quote quote, String GroupID, String ChildrenName, HttpPostedFileBase img)
        {
            string _ImagesPath = "~/Data/images/Quote/";
            //Image
            if (img != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(img.FileName);
                string extension = Path.GetExtension(img.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                quote.Image = _ImagesPath + fileName;
                fileName = Path.Combine(Server.MapPath(_ImagesPath), fileName);
                WebImage image = new WebImage(img.InputStream);
                if (image.Width > 200)
                    image.Crop(image.Width - 200, image.Height - 200);
                image.Save(fileName);
            }
            else
            {
                quote.Image = "~/Assets/admin/img/doraemon.png";
            }
            var dao = new QuoteDao();
            quote.Code = NameToCode(quote.Name) + DateTime.Now.ToString("ddMMyy");
            long id = dao.Insert(quote);
            if (id > 0)
            {
                if (GroupID.Equals("CHILDREN"))
                {
                    return RedirectToAction("IndexChildren", "Quote", new { ChildrenName = ChildrenName});
                }
                else
                {
                    return RedirectToAction("Index", "Quote");
                }
            }
            else
            {
                ModelState.AddModelError("", "Thêm cảm nhận không thành công");
            }
            if (GroupID.Equals("CHILDREN"))
            {
                return View("IndexChildren");
            }
            else
            {
                return View("Index");
            }
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var quote = new QuoteDao().ViewDetail(id);
            Session["imgPath"] = quote.Image;
            return View(quote);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(Quote quote, String GroupID, String ChildrenName, string Status, HttpPostedFileBase img)
        {
            if (Status == "on")
                quote.Status = true;
            else
                quote.Status = false;
            string _ImagesPath = "~/Data/images/Quote/";
            //Image
            if (img != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(img.FileName);
                string extension = Path.GetExtension(img.FileName);
                fileName = fileName + DateTime.Now.ToString("yymmssfff") + extension;
                quote.Image = _ImagesPath + fileName;
                fileName = Path.Combine(Server.MapPath(_ImagesPath), fileName);
                string oldImgPath = Request.MapPath(Session["imgPath"].ToString());
                img.SaveAs(fileName);

                if (System.IO.File.Exists(oldImgPath) && oldImgPath != "G:\\Learning\\Service Learning\\MaiAmTruyenTinWebsite\\MaiAmTruyenTin\\MaiAmTruyenTin\\Assets\\admin\\img\\doraemon.png")
                {
                    System.IO.File.Delete(oldImgPath);
                }
            }
            else
            {
                quote.Image = Session["imgPath"].ToString();
            }
            var dao = new QuoteDao();
            quote.Code = NameToCode(quote.Name) + DateTime.Now.ToString("ddMMyy");
            var result = dao.Update(quote);
            if (result)
            {
                if (GroupID.Equals("CHILDREN"))
                {
                    return RedirectToAction("IndexChildren", "Quote", new { ChildrenName = ChildrenName });
                }
                else
                {
                    return RedirectToAction("Index", "Quote");
                }
            }
            else
            {
                ModelState.AddModelError("", "Cập nhật cảm nhận không thành công");
            }
            return View();
        }
        [HttpPost]
        [HasCredential(RoleID = "DELETE_QUOTE")]
        public void Delete(int id)
        {
            try
            {
                new QuoteDao().Delete(id);
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
            Quote quote = db.Quotes.Find(id);
            if (quote == null)
            {
                return HttpNotFound();
            }
            return View(quote);
        }
        [HasCredential(RoleID = "STATUS_QUOTE")]
        public JsonResult ChangeStatus(long id)
        {
            var result = new QuoteDao().ChangeStatus(id);
            return Json(new
            {
                status = result
            });
        }
    }
}