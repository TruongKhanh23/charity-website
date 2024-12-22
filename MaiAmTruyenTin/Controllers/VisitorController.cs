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

namespace MaiAmTruyenTin.Controllers
{
    public class VisitorController : Controller
    {
        // GET: Visitor
        private MaiAmTruyenTinDbContext db = new MaiAmTruyenTinDbContext();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Create()
        {
            return PartialView();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(Visitor visitor)
        {
            //try
            //{
            var dao = new VisitorDao();
            visitor.CreatedDate = DateTime.Now;
            visitor.CreatedBy = "Trương Nguyễn Khánh";
            visitor.ModifiedDate = DateTime.Now;
            visitor.ModifiedBy = "Trương Nguyễn Khánh";
            visitor.Status = true;
            int id = dao.Insert(visitor);

            //item.Name = "Trương Nguyễn Khánh";
            //item.VisitReason = visitor.VisitReason;
            //item.Phone = visitor.Phone;
            //item.Email = visitor.Email;
            if (id > 0)
            {
                return Redirect("/Visitor/SuccessAlert");
            }
            else
            {
                return Redirect("/Visitor/ErrorAlert");
            }
            //db.Visitors.Add(item);
            //db.SaveChanges();
            //return Redirect("/Visitor/SuccessAlert");
            //}
            //catch (Exception ex)
            //{
            //    return Redirect("/Visitor/ErrorAlert");
            //}

        }
        public ActionResult SuccessAlert()
        {
            return View();
        }
        public ActionResult ErrorAlert()
        {
            return View();
        }
    }
}