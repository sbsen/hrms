using System.Web;
using System.Web.Optimization;

namespace MTSINHR.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                      "~/Scripts/jquery-3.2.1.js",
                                  "~/Content/bootstrap-4.0.0-beta/js/popper.min.js",
            "~/Content/bootstrap-4.0.0-beta/js/bootstrap.js",
                      "~/Scripts/jquery.validate.js",
                      "~/Scripts/jquery.validate.unobtrusive.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(

            "~/Scripts/bootbox.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/datepicker").Include(
           "~/Scripts/bootstrap-datepicker.js"));


            bundles.Add(new ScriptBundle("~/bundles/datatable").Include(
                      "~/Scripts/DataTables/jquery.dataTables.js",
                      "~/Scripts/DataTables/dataTables.bootstrap4.js",
                // "~/Scripts/DataTables/dataTables.buttons.js",
                // "~/Scripts/DataTables/buttons.bootstrap4.js",                      
                      "~/Scripts/DataTables/dataTables.select.js",
                      "~/Scripts/DataTables/dataTables.responsive.js",
                      "~/Scripts/DataTables/responsive.bootstrap4.js"));



            bundles.Add(new StyleBundle("~/bundles/bootstrapcss").Include(
             "~/Content/bootstrap-4.0.0-beta/css/bootstrap.css",
             "~/Content/bootstrap-4.0.0-beta/css/StyleSheet1.css"));


            bundles.Add(new StyleBundle("~/bundles/bootstrapdt").Include(
                       "~/Content/DataTables/css/dataTables.bootstrap4.css",
                // "~/Content/DataTables/css/buttons.bootstrap4.css",
                       "~/Content/DataTables/css/select.bootstrap4.css"));

            bundles.Add(new StyleBundle("~/bundles/fontawesome").Include(
                     "~/Content/css/font-awesome.css"));


            bundles.Add(new StyleBundle("~/bundles/datepickercss").Include(
           "~/Content/bootstrap-datepicker.css"));

            bundles.Add(new StyleBundle("~/bundles/main").Include(
                "~/Content/css/main.css"));
        }
    }
}