using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MaiAmTruyenTin.Common;
using Model;
using Model.DAO;
using Model.EF;
using System.Data;
//using System.Data.Entity;
using System.Net;
using PagedList;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Web.Helpers;
using System.Web.Hosting;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Web.Caching;

namespace MaiAmTruyenTin.Controllers
{
    public class HomeController : Controller
    {
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        QuoteDao dao = new QuoteDao();
        public ActionResult Quote()
        {
            var model = new QuoteDao().ListAll();
            return PartialView(model);
        }
        [OutputCache(CacheProfile = "Cache1Day")]
        public ActionResult Index()
        {
            ViewBag.BigTitleLine1 = db.Abouts.Find(2).BigTitleLine1;
            ViewBag.BigTitleLine2 = db.Abouts.Find(2).BigTitleLine2;
            ViewBag.Description = db.Abouts.Find(2).Description;
            ViewBag.Slogan = db.Abouts.Find(2).Slogan;
            ViewBag.Introduce = db.Abouts.Find(2).Introduce;
            ViewBag.BankingNumber = db.Abouts.Find(2).BankingNumber;
            ViewBag.BankBranch = db.Abouts.Find(2).BankBranch;
            ViewBag.AccountHolder = db.Abouts.Find(2).AccountHolder;
            ViewBag.Email = db.Abouts.Find(2).Email;
            return View();
        }
        public string Slogan()
        {
            string slogan = db.Abouts.Find(2).Slogan;
            return slogan;
        }
        public string Email()
        {
            string email = db.Abouts.Find(2).Email;
            return email;
        }


        public static System.Drawing.Image ScaleImage(System.Drawing.Image image, int maxHeight)
        {
            var ratio = (double)maxHeight / image.Height;
            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);
            var newImage = new Bitmap(newWidth, newHeight);
            using (var g = Graphics.FromImage(newImage))
            {
                g.DrawImage(image, 0, 0, newWidth, newHeight);
            }
            return newImage;
        }
    }
}