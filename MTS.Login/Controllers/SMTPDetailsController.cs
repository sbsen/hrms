using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MTS.Login.Data;
using MTS.LoginModels;
using MTS.Controllers;

using MTSEntBlocks.UtilsBlock.Web;
using MTSEntBlocks.UtilsBlock;
using MTS.Helpers;
using MTS.Login.UI;

namespace MTS.Login.Controllers
{
    public class SmtpDetailsController : SecureController
    {
        
        SmtpDetailsUIHandler objAdminUI = new SmtpDetailsUIHandler();

        /// <summary>
        /// Populates list of smtp details in a grid.
        /// </summary>
        /// <returns>SmtpDetails view with gridmodel.</returns>
        public ActionResult SmtpDetails(GridModel gridModel)
        {
            gridModel = objAdminUI.GetSmtpDetails();
            return View(gridModel);
        }


        public ActionResult GetSmtpData(GridModel gridModel)
        {
            gridModel = objAdminUI.GetSmtpDetails();
            return PartialView("_PVSmtpDetailsData", gridModel);
        }
       
        [HttpGet]
        public ActionResult _PartialViewLoad(Int64 id, int type)
        {
            switch (type)
            {
                case 1:
                    {
                        SmtpDetails smtp = new SmtpDetails();
                        return PartialView("_PVAddSmtpDetails", smtp);
                    }
                case 2:
                    {
                        SmtpDetails smtp = objAdminUI.GetSmtpDetailForUpdate(id);
                        ViewBag.button = null;
                        return PartialView("_PVEditSmtpDetails", smtp);
                    }
                case 3:
                    {
                        SmtpDetails smtp = objAdminUI.GetSmtpDetailForUpdate(id);
                        ViewBag.button = "disabled";
                        return PartialView("_PVEditSmtpDetails", smtp);
                    }
            }

            return PartialView();   
        }

        [HttpPost]
        public ActionResult UpdateSmtpDetails(SmtpDetails smtp)
        {
            int result=objAdminUI.UpdateSmtpDetails(smtp);
            if (result == 1)
                return Content("UPDATE_SUCESS");
            else if(result == -1)
                return Content("ALREADY_EXIST");
            else
                return Content("UPDATE_FAIL");
        }


        [HttpPost]
        public ActionResult AddData(SmtpDetails smtp)
        {
            int result = objAdminUI.InsertSmtpDetails(smtp);
            if (result == 1)
                return Content("INSERT_SCCCESS");
            else if (result == -1)
                return Content("ALREADY_EXIST");
            else
                return Content("INSERT_FAIL");

        }       

    }
}
