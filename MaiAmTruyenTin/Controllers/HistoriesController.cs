using MaiAmTruyenTin.Areas.Admin.Controllers;
using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MaiAmTruyenTin.Controllers
{
    public class HistoryController : Controller
    {
        [OutputCache(CacheProfile = "Cache1Day")]
        public ActionResult Index()
        {
            var model = new HistoryDao().ListAll();
            return View(model);
        }
    }
}