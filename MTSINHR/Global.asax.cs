using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using MTS.Helpers;
using MTSINHR.App_Start;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

       
        public class SessionExpireFilterAttribute : ActionFilterAttribute
        {

            public override void OnActionExecuting(ActionExecutingContext filterContext)
            {
                HttpContext ctx = HttpContext.Current;

                // check if session is supported
                if (ctx.Session != null)
                {
                    if (SessionHelper.LogonUser == null)
                    {
                        filterContext.Result = new RedirectToRouteResult(
                                                   new RouteValueDictionary {{ "Controller", "Account" },
                                                                        { "Action", "Logon" } });
                    }
                }

                base.OnActionExecuting(filterContext);
            }
            
        }
      
    }
}