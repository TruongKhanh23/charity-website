using System.Web;
using System.Web.Optimization;

namespace MaiAmTruyenTin
{
    public class BundleConfig
    {
        // For more information on bundling, visit https://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at https://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js"));

            bundles.Add(new StyleBundle("~/bundles/admin").Include(
                      "~/Assets/admin/css/bootstrap-social.css",
                      "~/Assets/admin/css/fontawesome.css",
                      "~/Assets/admin/bower_components/metrics-graphics/dist/metricsgraphics.css",
                      "~/Assets/admin/bower_components/chartist/dist/chartist.min.css",
                      "~/Assets/admin/bower_components/uikit/css/uikit.almost-flat.min.css",
                      "~/Assets/admin/icons/flags/flags.min.css",
                      "~/Assets/admin/css/main.min.css",
                      "~/Assets/admin/css/bootstrap.min.css",
                      "~/Assets/admin/css/fonts.googleapis.family.roboto.css",
                      "~/Assets/admin/bower_components/kendo-ui/styles/kendo.common-material.min.css",
                      "~/Assets/admin/bower_components/kendo-ui/styles/kendo.material.min.css",
                      "~/Assets/admin/bower_components/uikit/css/uikit.almost-flat.min.css",
                      "~/Assets/admin/icons/flags/flags.min.css",
                      "~/Assets/admin/bower_components/weather-icons/css/weather-icons.min.css"));
            BundleTable.EnableOptimizations = true;
        }

    }
}
