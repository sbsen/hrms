using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using Newtonsoft.Json;
using MTSINHR.Models;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class AssetMaintenanceDetailsController : SecureController
    {
        public ActionResult AssetMaintenance()
        {
            ViewBag.Asset = GetAsset();
            ViewBag.Assetname = GetAssetName();
            return View();
        }
        public JsonResult Read()
        {
            MTSHRDataLayer.AssetMaintenanceDetails Maintenance = new MTSHRDataLayer.AssetMaintenanceDetails();
            return Json(JsonConvert.SerializeObject(Maintenance.Read()), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Add(AssetMaintenanceDetails maintenance)
        {
            MTSHRDataLayer.AssetMaintenanceDetails data_main = new MTSHRDataLayer.AssetMaintenanceDetails();
            int result = data_main.Create(maintenance.AssetTypeId,maintenance.AssetName, maintenance.Dateofpurchase, maintenance.Maintenance_Carried_out, maintenance.Cost, maintenance.Notes);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
        private List<SelectListItem> GetAsset()
        {
            MTSHRDataLayer.Asset data_Ass = new MTSHRDataLayer.Asset();
            List<SelectListItem> Assetlist = new List<SelectListItem>();
            try
            {
                var Asset = data_Ass.ReadCategory();
                Assetlist.Add(new SelectListItem() { Value = "", Text = "---- Select Asset----" });
                for (int i = 0; i < Asset.Tables[0].Rows.Count; i++)
                {
                    Assetlist.Add(new SelectListItem() { Value = Asset.Tables[0].Rows[i]["CategoryId"].ToString(), Text = Asset.Tables[0].Rows[i]["CategoryName"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Assetlist;
        }
        private List<SelectListItem> GetAssetName()
        {
            MTSHRDataLayer.AssetMaintenanceDetails data_Ass = new MTSHRDataLayer.AssetMaintenanceDetails();
            List<SelectListItem> Assetlist = new List<SelectListItem>();
            try
            {
                var Asset = data_Ass.GetAssetName();
                Assetlist.Add(new SelectListItem() { Value = "", Text = "---- Select Asset Name----" });
                for (int i = 0; i < Asset.Tables[0].Rows.Count; i++)
                {
                    Assetlist.Add(new SelectListItem() { Value = Asset.Tables[0].Rows[i]["AssetTypeId"].ToString(), Text = Asset.Tables[0].Rows[i]["AssetName"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Assetlist;
        }


    }
}
