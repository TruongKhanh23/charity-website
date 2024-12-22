using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace MaiAmTruyenTin
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
            //LOGIN
            routes.MapRoute(
                name: "Login",
                url: "dang-nhap",
                defaults: new { controller = "User", action = "Login", id = UrlParameter.Optional },
                namespaces: new[] { "MaiAmTruyenTin.Controllers" }
                );

            routes.MapRoute(
                name: "Home",
                url: "trang-chu",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "MaiAmTruyenTin.Controllers" }
                );
            routes.MapRoute(
                name: "History",
                url: "lich-su",
                defaults: new { controller = "History", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "MaiAmTruyenTin.Controllers" }
                );
            routes.MapRoute(
                name: "Regulation",
                url: "quy-dinh",
                defaults: new { controller = "Regulation", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "MaiAmTruyenTin.Controllers" }
                );
            routes.MapRoute(
               name: "Activity1",
               url: "hoat-dong/danh-sach",
               defaults: new { controller = "Activity", action = "Index", id = UrlParameter.Optional },
               namespaces: new[] { "MaiAmTruyenTin.Controllers" }
               );
            routes.MapRoute(
               name: "DetailActivity1",
               url: "hoat-dong-chi-tiet/{id}",
               defaults: new { controller = "Activity", action = "Details", id = UrlParameter.Optional },
               namespaces: new[] { "MaiAmTruyenTin.Controllers" }
               );
            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new[] { "MaiAmTruyenTin.Controllers" }
                );
        }
    }
}