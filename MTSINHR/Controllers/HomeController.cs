using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Home()
        {
            return RedirectToAction("LogOn", "Account", new { area = "MTS.Login" });
        }



    }
}
