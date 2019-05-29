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
    public class EmailTemplateController : SecureController
    {
        //
        // GET: /EmailTemplate/
        EmailTemplateUIHandler objAdminUI = new EmailTemplateUIHandler();
        public ActionResult EmailTemplate(GridModel gridmodel)
        {
            gridmodel = objAdminUI.GetEmailTemplate(gridmodel);            
            return View(gridmodel);
        }

        public ActionResult GetData(GridModel gridmodel)
        {
            gridmodel = objAdminUI.GetEmailTemplate(gridmodel);
            return PartialView("_PVEmailTemplateData",gridmodel);
        }

        [HttpGet]
        public ActionResult _PartialViewLoad(Int64 id, int type)
        {   
            if (type == 1)
            {
                ViewBag.button = null;
            }
            else if (type == 2)
            {
                ViewBag.button = "disabled";
            }
            EmailTemplate objEmailTmp = new EmailTemplate();
            objEmailTmp = objAdminUI.GetEmailTempData(id);
            return PartialView("_PVEditEmailTemplate", objEmailTmp);
        }
        [HttpPost, ValidateInput(false)]
        public ActionResult PostEmailTemplate(EmailTemplate objEmailTmp)
        {
            int reVal = objAdminUI.PostEmailTemplate(objEmailTmp);
            return Content("UPDATE_SUCESS");
        }
    }
}
