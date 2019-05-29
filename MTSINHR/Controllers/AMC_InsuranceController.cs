using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using MTSINHR.Models;
using System.Web.Http;
using Newtonsoft.Json;
using System.Web.Mvc;
using MTS.Controllers;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class AMC_InsuranceController : SecureController
    {
        public ActionResult AMC_Insurance()
        {
            ViewBag.Asset = GetAsset();
            ViewBag.AssetName = GetAssetName();
            return View();
        }
        public JsonResult Read()
        {
            MTSHRDataLayer.AMC_OR_ASSET_INSURANCE Amc_ins = new MTSHRDataLayer.AMC_OR_ASSET_INSURANCE();
            return Json(JsonConvert.SerializeObject(Amc_ins.Read()), JsonRequestBehavior.AllowGet);
        }
        [System.Web.Http.HttpPost]
        public JsonResult Add(AMC_Insurance  AMC_Ins)
        {
            MTSHRDataLayer.AMC_OR_ASSET_INSURANCE data_amc_ins = new MTSHRDataLayer.AMC_OR_ASSET_INSURANCE();
            int result = data_amc_ins.Create(AMC_Ins.AssetTypeId,AMC_Ins.AssetName,AMC_Ins.Category,AMC_Ins.VendorName,AMC_Ins.AmcType,AMC_Ins.InsuranceType,
                AMC_Ins.AmcCharges,AMC_Ins.PremiumCharges,AMC_Ins.PaymentType,AMC_Ins.PaymentRefDate,AMC_Ins.PaymentRefNumber,AMC_Ins.FromDate,AMC_Ins.ToDate,
                AMC_Ins.ContactPerson,AMC_Ins.ContactPhone,AMC_Ins.Notes);
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
            MTSHRDataLayer.AMC_OR_ASSET_INSURANCE data_Ass = new MTSHRDataLayer.AMC_OR_ASSET_INSURANCE();
            List<SelectListItem> Assetlist = new List<SelectListItem>();
            try
            {
                var Asset = data_Ass.AssetName();
                Assetlist.Add(new SelectListItem() { Value = "", Text = "---- Select Asset----" });
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
