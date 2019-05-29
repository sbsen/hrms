using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;

using MTS.Login.Data;
using MTS.LoginModels;
using System.Net.Mail;
using MTSEntBlocks.UtilsBlock.Web;
using MTS.Helpers;
using MTS.Controllers;

namespace MTS.Login.Controllers
{
    public class QAController : SecureController
    {
        QAdata qaData = new QAdata();
        LogonUserSession logonUserSession = (LogonUserSession)SessionHelper.LogonUser;

        //
        // GET: /QA/      

        public ActionResult SecurityQuestion(GridModel gridmodel)
        {
            gridmodel.Data = qaData.GetData();
            return View(gridmodel);
        }

        public ActionResult GetData(GridModel gridmodel)
        {
            gridmodel.Data = qaData.GetData();
            return PartialView("_PVQAData", gridmodel);
        }

        [HttpGet, SessionExpireFilter]
        public ActionResult _PartialViewLoad(Int64 id, int type)
        {
            switch (type)
            {
                case 1:
                    {
                        return PartialView("_PVcreatesecurityquestion");
                    }
                case 2:
                    {
                        ViewBag.button = null;
                        QA qa = qaData.GetQAForUpdate(id);
                        return PartialView("_PVeditsecurityquestion", qa);
                    }
                case 3:
                    {
                        ViewBag.button = "disabled";
                        QA qa = qaData.GetQAForUpdate(id);
                        return PartialView("_PVeditsecurityquestion", qa);
                    }

            }
            return PartialView();
        }

        [SessionExpireFilter]
        public ActionResult AddData(QA model)
        {
            int QAResult = qaData.InsertQA(model);

            if (QAResult == 1)
                return Content("ALREADY_EXIST");
            else if (QAResult == -1)
                return Content("INSERT_FAIL");
            else
                return Content("INSERT_SCCCESS");
        }

        [SessionExpireFilter]
        public ActionResult UpdateQA(QA model)
        {
            int QAResult = qaData.UpdateQA(model);
            if (QAResult == 1)
                return Content("ALREADY_EXIST");
            else if (QAResult == 0)
                return Content("UPDATE_SUCESS");
            else
                return Content("UPDATE_FAIL");
        }


    }
}
