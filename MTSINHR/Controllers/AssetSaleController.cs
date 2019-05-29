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
            ViewBag.Assetname = GetAssetName();
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
            int result = data_Sale.Create(Sale.Date,Sale.TypeOfSale,Sale.SalePrice,Sale.SoldTo,Sale.ApprovedDate,Sale.ApprovedRef,Sale.ApprovedBy,Sale.Notes);
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
