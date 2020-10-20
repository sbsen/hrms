using MTS.Controllers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Controllers
{
    public class AssetDashboardController : SecureController
    {
        // GET: AssetDashboard
        public ActionResult AssetDashboard()
        {
            return View();
        }
        public ActionResult ReadAssetDashboardDetails()
        {
            MTSHRDataLayer.AssetDashboard assetDashboard = new MTSHRDataLayer.AssetDashboard();
            try
            {
                DataSet ds = assetDashboard.ReadAssetDashboardDetails();
                return Json(new { success = true, result = JsonConvert.SerializeObject(assetDashboard.ReadAssetDashboardDetails().Tables[0]) },JsonRequestBehavior.AllowGet);
               // return Json(new { success = true },JsonRequestBehavior.AllowGet);
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
            }
            return Json(new { success=false},JsonRequestBehavior.AllowGet);
        }
        public ActionResult ReadAssetAssignedCount()
        {
            MTSHRDataLayer.AssetDashboard assetDashboard = new MTSHRDataLayer.AssetDashboard();
            try
            {
                return Json(new { success = true, result = JsonConvert.SerializeObject(assetDashboard.ReadAssetAssignedCount()) }, JsonRequestBehavior.AllowGet);
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
            }
            return Json(new { success = false }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult ReadEmployeeAssignedAsset(Int64? Id)
        {
            MTSHRDataLayer.AssetDashboard assetDashboard = new MTSHRDataLayer.AssetDashboard();
            try
            {
                return Json(new { success = true, result = JsonConvert.SerializeObject(assetDashboard.ReadEmployeeAssignedAsset(Id)) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return Json(new { success = false }, JsonRequestBehavior.AllowGet);
        }
		public ActionResult UnAssignAsset(Int64 Type, Int64 Name, Int64 Item, Int64 Empid, DateTime UnassignedDate)
        {
            MTSHRDataLayer.AssetDashboard assetDashboard = new MTSHRDataLayer.AssetDashboard();
            try
            {
                return Content(assetDashboard.UnAssignAsset(Type, Name, Item, Empid, UnassignedDate).ToString());
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
            }
            return Content("-1");
        }
        [HttpPost]
        public JsonResult ReadDashboardTable(Int64 AssetTypeId, Int64 AssetNameId)
        {
            try {

                if (AssetTypeId == -1)
                {
                    MTSHRDataLayer.AssetDetails asset = new MTSHRDataLayer.AssetDetails();
                    return Json(new { success = true, result = JsonConvert.SerializeObject(asset.Read()) }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    MTSHRDataLayer.AssetDashboard assetDashboard = new MTSHRDataLayer.AssetDashboard();
                    return Json(new { success = true, result = JsonConvert.SerializeObject(assetDashboard.ReadDashboardTable(AssetTypeId, AssetNameId)) }, JsonRequestBehavior.AllowGet);
                }
            }           
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return Json(new { success = false }, JsonRequestBehavior.AllowGet);
        }


        public JsonResult ReadAssetClassification(Int64 Id)
        {
         
            try
            {
                MTSHRDataLayer.AssetDashboard assetDashboard = new MTSHRDataLayer.AssetDashboard();
                return Json(new { success = true, result = JsonConvert.SerializeObject(assetDashboard.ReadAssetClassification(Id)) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return Json(new { success = false }, JsonRequestBehavior.AllowGet);
        }




    }
}