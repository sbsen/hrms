using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Mvc;

namespace MTS.Controllers
{
    public class SecurityViewController:Controller
    {
        public ActionResult SecureView(string value)
        {


            return View();
        }
    }
}
