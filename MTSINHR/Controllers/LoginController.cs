using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Web.Security;

using MTS.LoginModels;
using MTSEntBlocks.UtilsBlock.Web;
using MTS.Helpers;
using MTS.Login;

namespace MTS.Controllers
{

    public class LoginController : Controller
    {

        public ActionResult LogOn(LogonUser model)
        {
            return RedirectToAction("Logon", "Account", new { area = "MTS.Login" });
        }


    }
}
