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
using MaiAmTruyenTin.Areas.Admin.Controllers;

namespace MaiAmTruyenTin.Controllers
{
    public class RegulationController : Controller
    {
        [OutputCache(CacheProfile = "Cache1Day")]
        public ActionResult Index()
        {
            var model = new RegulationDao().ListAll();
            return View(model);
        }
    }
}