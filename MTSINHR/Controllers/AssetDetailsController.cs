using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using System.Web.Mvc;
using MTS.Controllers;
using MTSINHR.Models;

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
        [HttpPost]
        public JsonResult Purchased(string from, string to)
        {
            MTSHRDataLayer.AssetDetails data_filter = new MTSHRDataLayer.AssetDetails();
            return Json(JsonConvert.SerializeObject(data_filter.Purchased_date_filter(Convert.ToDateTime(from), Convert.ToDateTime( to))), JsonRequestBehavior.AllowGet);
        }

        //public JsonResult AddMaintenance(string[] Asset)
        //{

        //    //string data = TempData["Asset"];
        //    return Json(JsonConvert.SerializeObject() JsonRequestBehavior.AllowGet);
        //}

        public JsonResult ReadAssetDetail(Int64 ItemCode)
        {
            MTSHRDataLayer.AssetDetails view = new MTSHRDataLayer.AssetDetails();
            TempData.Keep("ItemCode");
            return Json(JsonConvert.SerializeObject(view.assetdetailbyid(ItemCode)), JsonRequestBehavior.AllowGet);
        }


    }
}