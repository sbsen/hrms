using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSEntBlocks.DataBlock;
using MTSINHR.Models;
using Newtonsoft.Json;
using MTS.Login.Data;
using System.Data.Common;
using System.Data;
using System.Globalization;
using MTS.Controllers;
using System.IO;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class AssetReportController : SecureController
    {
        public ActionResult AssetReport()
        {

            return View();
        }
      
         public JsonResult Read()
        {
            MTSHRDataLayer.AssetReport report = new MTSHRDataLayer.AssetReport();
            return Json(JsonConvert.SerializeObject(report.Read()), JsonRequestBehavior.AllowGet);
        }

    }
}
