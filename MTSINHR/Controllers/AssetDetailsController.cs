using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using System.Web.Mvc;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class AssetDetailsController : SecureController
    {
        public ActionResult AssetDetail()
        {
            return View();
        }
        public JsonResult Read()
        {
            MTSHRDataLayer.AssetDetails asset = new MTSHRDataLayer.AssetDetails();
            return Json(JsonConvert.SerializeObject(asset.Read()), JsonRequestBehavior.AllowGet);
        }
    }
}