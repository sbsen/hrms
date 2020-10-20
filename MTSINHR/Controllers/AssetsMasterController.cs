using MTSINHR.Models;
using Newtonsoft.Json;
using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using MTS.Controllers;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class AssetsMasterController : SecureController
    {
        public ActionResult Assets()
        {
            ViewBag.Asset = GetAsset();
            ViewBag.Assetname = GetAssetName();
            return View();
        }

        public JsonResult Read()
        {
            MTSHRDataLayer.AssetsMaster asset = new MTSHRDataLayer.AssetsMaster();
            return Json(JsonConvert.SerializeObject(asset.Read()), JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Edit(AssetsMaster ass)
        {
            MTSHRDataLayer.AssetsMaster data_asset = new MTSHRDataLayer.AssetsMaster();
            int result = data_asset.Update(ass.Id,ass.AssetTypeId,ass.AssetName,ass.AssetDepreciation, ass.ExpectedLife,ass.SalvageValue);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public JsonResult Add(AssetsMaster ass)
        {
            MTSHRDataLayer.AssetsMaster data_asset = new MTSHRDataLayer.AssetsMaster();
            int result = data_asset.Create(ass.AssetTypeId,ass.AssetName,ass.AssetDepreciation, ass.ExpectedLife,ass.SalvageValue);
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
            MTSHRDataLayer.Asset data_Ass = new MTSHRDataLayer.Asset();
            List<SelectListItem> Assetnamelist = new List<SelectListItem>();
            try
            {
                var Assetname = data_Ass.ReadAssetNames();
                Assetnamelist.Add(new SelectListItem() { Value = "", Text = "---- Select Category----" });
                for (int i = 0; i < Assetname.Rows.Count; i++)
                {
                    Assetnamelist.Add(new SelectListItem() { Value = Assetname.Rows[i]["Id"].ToString(), Text = Assetname.Rows[i]["Assetname"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Assetnamelist;
        }

    }
}
