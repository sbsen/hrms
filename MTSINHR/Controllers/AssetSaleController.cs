using MTS.Controllers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Newtonsoft.Json;
using MTSINHR.Models;
using System.Web.Mvc;
using MTSEntBlocks.ExceptionBlock.Handlers;
namespace MTSINHR.Controllers
{
    public class AssetSaleController : SecureController
    {
        public ActionResult Sale()
        {
            ViewBag.Asset = GetAsset();
            List<SelectListItem> Assetnamelist = new List<SelectListItem>();
            Assetnamelist.Add(new SelectListItem() { Value = "", Text = "----Select Category----" });
            ViewBag.Assetname = Assetnamelist;
            List<SelectListItem> Assetitemlist = new List<SelectListItem>();
            Assetitemlist.Add(new SelectListItem() { Value = "", Text = "----Select Item ----" });
            ViewBag.Itemcode = Assetitemlist;
            return View();
        }

        public JsonResult Read()
        {
            MTSHRDataLayer.AssetSale Sale = new MTSHRDataLayer.AssetSale();
            return Json(JsonConvert.SerializeObject(Sale.Read()), JsonRequestBehavior.AllowGet);
        }
        [System.Web.Http.HttpPost]
        public JsonResult Add(AssetSale Sale)
        {
            MTSHRDataLayer.AssetSale data_Sale = new MTSHRDataLayer.AssetSale();
            int result = data_Sale.Create(Sale.Date,Sale.TypeOfSale,Sale.SalePrice,Sale.SoldTo,Sale.ApprovedDate,Sale.ApprovedRef,Sale.ApprovedBy,Sale.Notes,Sale.Item,Sale.AssetTypeId,Sale.AssetName);
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
    
        public JsonResult Item(Int64 Assettypeid, Int64 Assetnameid)
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
        public JsonResult AssetName(Int64 id)
        {
            MTSHRDataLayer.AssetMaintenanceDetails data_asset_name = new MTSHRDataLayer.AssetMaintenanceDetails();
            List<SelectListItem> Assetnamelist = new List<SelectListItem>();
            try
            {
                var Assetname = data_asset_name.GetSpecificAsset(id);
                Assetnamelist.Add(new SelectListItem() { Value = "", Text = "---- Select Asset----" });
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

    }
}
