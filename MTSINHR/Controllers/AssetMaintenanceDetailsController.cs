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
            List<SelectListItem> Assetnamelist = new List<SelectListItem>();
            Assetnamelist.Add(new SelectListItem() { Value = "", Text = "----Select Category----" });
            ViewBag.Assetname = Assetnamelist;
            List<SelectListItem> Assetitemlist = new List<SelectListItem>();
            Assetitemlist.Add(new SelectListItem() { Value = "", Text = "----Select Item ----" });
            ViewBag.Itemcode = Assetitemlist;
            ViewBag.vendorname = GetVendorName();
            ViewBag.AssetType = TempData["MaintenanceAssetTypeId"];
            ViewBag.AssetNames = TempData["MaintenanceAssetName"];
            ViewBag.Item = TempData["MaintenanceItem"];
            TempData.Keep("MaintenanceAssetTypeId");
            TempData.Keep("MaintenanceAssetName");
            TempData.Keep("MaintenanceItem");
            return View();
        }

        public ActionResult MaintenanceAsset(int assettype = 0, int assetname = 0,int item=0)
        {
            ViewBag.Asset = GetAsset();
            List<SelectListItem> Assetnamelist = new List<SelectListItem>();
            Assetnamelist.Add(new SelectListItem() { Value = "", Text = "----Select Category----" });
            ViewBag.Assetname = Assetnamelist;
            List<SelectListItem> Assetitemlist = new List<SelectListItem>();
            Assetitemlist.Add(new SelectListItem() { Value = "", Text = "----Select Item ----" });
            ViewBag.Itemcode = Assetitemlist;
            ViewBag.vendorname = GetVendorName();
            if ((assettype > 0) && (assetname > 0) && (item>0))
            {
                TempData["MaintenanceAssetTypeId"] = assettype;
                TempData["MaintenanceAssetName"] = assetname;
                TempData["MaintenanceItem"] = item;
            }
            else
            {
                TempData["MaintenanceAssetTypeId"] = null;
                TempData["MaintenanceAssetName"] = null;
                TempData["MaintenanceItem"] = null;
            }
            return RedirectToAction("AssetMaintenance");
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

            int result = data_main.Create(maintenance.AssetTypeId, maintenance.AssetName, maintenance.Dateofpurchase, maintenance.Vendor, maintenance.Maintenance_Carried_out, maintenance.Cost, maintenance.Notes,maintenance.Item);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult AssetName(Int64 id)
        {
            MTSHRDataLayer.AssetMaintenanceDetails data_asset_name = new MTSHRDataLayer.AssetMaintenanceDetails();
            List<SelectListItem> Assetnamelist = new List<SelectListItem>();
            try
            {
                var Assetname = data_asset_name.GetSpecificAsset(id);
                Assetnamelist.Add(new SelectListItem() { Value = "", Text = "--Select Category--" });
                for (int i = 0; i < Assetname.Rows.Count; i++)
                {
                    Assetnamelist.Add(new SelectListItem() { Value = Assetname.Rows[i]["Id"].ToString(), Text = Assetname.Rows[i]["AssetName"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            ViewBag.Assetname = Assetnamelist;

            return Json(new { success = true, AssetList = JsonConvert.SerializeObject(Assetnamelist) }, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Item(Int64 Assettypeid , Int64 Assetnameid)
        {
            MTSHRDataLayer.AssetMaintenanceDetails data_item = new MTSHRDataLayer.AssetMaintenanceDetails();
            List<SelectListItem> Assetitemlist = new List<SelectListItem>();
            try
            {
                var item = data_item.GetItem(Assettypeid, Assetnameid);
                Assetitemlist.Add(new SelectListItem() { Value = "", Text = "--Select Item--" });
                for (int i = 0; i < item.Rows.Count; i++)
                {
                    Assetitemlist.Add(new SelectListItem() { Value = item.Rows[i]["ID"].ToString(), Text = item.Rows[i]["Item"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            ViewBag.Itemlist = Assetitemlist;

            return Json(new { success = true, AssetList = JsonConvert.SerializeObject(Assetitemlist) }, JsonRequestBehavior.AllowGet);
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

        private List<SelectListItem> GetVendorName()
        {
            MTSHRDataLayer.Vendors data_Ass = new MTSHRDataLayer.Vendors();
            List<SelectListItem> Assetlist = new List<SelectListItem>();
            try
            {
                var Vendor = data_Ass.ReadVendorName();
                Assetlist.Add(new SelectListItem() { Value = "", Text = "---- Select Vendor Name----" });
                for (int i = 0; i < Vendor.Tables[0].Rows.Count; i++)
                {
                    Assetlist.Add(new SelectListItem() { Value = Vendor.Tables[0].Rows[i]["ID"].ToString(), Text = Vendor.Tables[0].Rows[i]["NAME"].ToString() });
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
