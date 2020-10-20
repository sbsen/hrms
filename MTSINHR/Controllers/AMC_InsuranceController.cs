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
using System.IO;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class AMC_InsuranceController : SecureController
    {
        public ActionResult AMC_Insurance()
        {
            ViewBag.Asset = GetAsset();
            List<SelectListItem> Assetnamelist = new List<SelectListItem>();
            Assetnamelist.Add(new SelectListItem() { Value = "", Text = "----Select Category----" });
            ViewBag.AssetName = Assetnamelist;
            List<SelectListItem> Assetitemlist = new List<SelectListItem>();
            Assetitemlist.Add(new SelectListItem() { Value = "", Text = "----Select Item ----" });
            ViewBag.Itemcode = Assetitemlist;
            ViewBag.vendorname = GetVendorName();
            ViewBag.AssetType = TempData["AmcAssetTypeId"];
            ViewBag.Assetnames = TempData["AmcAssetName"];
            ViewBag.item = TempData["AmcItem"];
            TempData.Keep("AmcAssetTypeId");
            TempData.Keep("AmcAssetName");
            TempData.Keep("AmcItem");
            return View();
        }
        public ActionResult AMC_InsuranceAsset(int assettype = 0, int assetname = 0 , int item=0)
        {
            if ((assettype > 0) && (assetname > 0) && (item > 0))
            {
                TempData["AmcAssetTypeId"] = assettype;
                TempData["AmcAssetName"] = assetname;
                TempData["AmcItem"] = item;
            }
            else
            {
                TempData["AmcAssetTypeId"] = null;
                TempData["AmcAssetName"] = null;
                TempData["AmcItem"] = null;
            }
            return RedirectToAction("AMC_Insurance");
        }
        public ActionResult viewdata(int Id)
        {
            MTSHRDataLayer.AMC_OR_ASSET_INSURANCE data_amc_ins = new MTSHRDataLayer.AMC_OR_ASSET_INSURANCE();
            ViewBag.Asset = GetAsset();
            List<SelectListItem> Assetnamelist = new List<SelectListItem>();
            Assetnamelist.Add(new SelectListItem() { Value = "", Text = "----Select Category----" });
            ViewBag.AssetName = Assetnamelist;
            List<SelectListItem> Assetitemlist = new List<SelectListItem>();
            Assetitemlist.Add(new SelectListItem() { Value = "", Text = "----Select Item ----" });
            ViewBag.Itemcode = Assetitemlist;
            ViewBag.vendorname = GetVendorName();
            return View(data_amc_ins);
        }

        public JsonResult Read()
        {
            MTSHRDataLayer.AMC_OR_ASSET_INSURANCE Amc_ins = new MTSHRDataLayer.AMC_OR_ASSET_INSURANCE();
            return Json(JsonConvert.SerializeObject(Amc_ins.Read()), JsonRequestBehavior.AllowGet);
        }
        [System.Web.Http.HttpPost]
        public JsonResult Add(AMC_Insurance AMC_Ins)
        {
            MTSHRDataLayer.AMC_OR_ASSET_INSURANCE data_amc_ins = new MTSHRDataLayer.AMC_OR_ASSET_INSURANCE();
            int result = 0;
            //string Itemlist = string.Join(",", AMC_Ins.Item);
            //Itemlist = Itemlist.Substring(1, Itemlist.Length-1);
            foreach (string Itemlist in AMC_Ins.Item)
            {
                if (Itemlist != "")
                    result = data_amc_ins.Create(AMC_Ins.AssetTypeId, AMC_Ins.AssetName, AMC_Ins.Category, AMC_Ins.VendorName, AMC_Ins.AmcType, AMC_Ins.InsuranceType,
                  AMC_Ins.AmcCharges, AMC_Ins.PremiumCharges, AMC_Ins.PaymentType, AMC_Ins.PaymentRefDate, AMC_Ins.PaymentRefNumber, AMC_Ins.FromDate, AMC_Ins.ToDate,
                  AMC_Ins.ContactPerson, AMC_Ins.ContactPhone, AMC_Ins.Notes, Itemlist,AMC_Ins.Amc_Document_Id);
            }

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
        public JsonResult Item_Amc_Insurance(Int64 Assettypeid, Int64 Assetnameid, Int64 categoryid)
        {
            MTSHRDataLayer.AssetMaintenanceDetails data_item = new MTSHRDataLayer.AssetMaintenanceDetails();
            List<SelectListItem> Assetitemlist = new List<SelectListItem>();
            try
            {

                var item = data_item.GetItem_Amc_Insurance(Assettypeid, Assetnameid, categoryid);
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
        [System.Web.Http.HttpPost]
        public int GetFileData()
        {
            try
            {
                var file = Request.Files[0];
                string FileName = file.FileName;
                BinaryReader reader = new BinaryReader(file.InputStream);
                MTSHRDataLayer.AMC_OR_ASSET_INSURANCE data_doc = new MTSHRDataLayer.AMC_OR_ASSET_INSURANCE();
                byte[] bytes = reader.ReadBytes((int)file.ContentLength);
                int result = data_doc.Upload_Amc_Insurance(bytes, FileName);
                return result;
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
                return 0;
            }

        }
    }
}
