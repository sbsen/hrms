using MTSEntBlocks.ExceptionBlock.Handlers;
using MTSINHR.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using HRConstants;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class AssetController : SecureController
    {
        MTSHRDataLayer.Asset _data = new MTSHRDataLayer.Asset();
        //
        // GET: /Asset/

        public int Asset(int assettype = 0, int assetname = 0)
        {
            TempData["AssetTypeId"] = assettype;
            TempData["AssetName"] = assetname;
            TempData.Keep("AssetTypeId");
            TempData.Keep("AssetName");
            ViewBag.AssetType = assettype;
            ViewBag.AssetName = assetname;

            return 1;
        }

        public ActionResult AssignAsset()
        {
            ViewBag.EmployeeNames = GetAllEmployeeNames();
            //ViewBag.LocationNames = GetAllLocation();
            ViewBag.Asset = GetAsset();
            ViewBag.Assetname = GetAssetName();
            ViewBag.VendorNames = GetAllVendorNames();
            return View("AssetEntry");
        }

        public int ReadLastInvoiceId()
        {
            MTSHRDataLayer.Asset data_doc = new MTSHRDataLayer.Asset();
            return data_doc.ReadLastInvoiceId();
        }

        [HttpPost]
        public JsonResult FilterAssets(string StartDate, string EndDate)
        {
            MTSHRDataLayer.Asset data_doc = new MTSHRDataLayer.Asset();
            return Json(JsonConvert.SerializeObject(data_doc.FilterAssets(Convert.ToDateTime(StartDate), Convert.ToDateTime(EndDate))), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public int GetFormData()
        {
            try
            {
                var file = Request.Files[0];
                string FileName = file.FileName;
                BinaryReader reader = new BinaryReader(file.InputStream);
                MTSHRDataLayer.Asset data_doc = new MTSHRDataLayer.Asset();
                byte[] bytes = reader.ReadBytes((int)file.ContentLength);
                int result = data_doc.UploadInvoice(bytes, FileName);
                return result;
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
                return 0;
            }

        }

        [HttpPost]
        public int AddAssetDetails(AssetsEntry _asset)
        {
            MTSHRDataLayer.Asset _data = new MTSHRDataLayer.Asset();
            try
            {
                int result = 0;


                result = _data.Create(_asset.Id, _asset.VendorName, _asset.PurchaseOrderNumber, _asset.PurchasedOn, _asset.BillNumber, _asset.BillDate, _asset.AssetType, _asset.AssetName,
                            _asset.AssetDescription, _asset.CostInRs, _asset.CostType, _asset.Make, _asset.Model, _asset.SerialNumber,
                            _asset.IdentificationCode, _asset.WarrantyMonths, _asset.WarrantyStartDate, _asset.WarrantyEndDate,_asset.InvoiceId,
                            _asset.AssetTypeId, _asset.AssetNameId,HRConstants.AssetStatusConstants.Unassigned);


                return result;


            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
                throw exec;
            }



        }

        [HttpPost]
        public int EditAssetDetails(AssetsEntry _asset)
        {
            MTSHRDataLayer.Asset _data = new MTSHRDataLayer.Asset();
            try
            {
                int result = 0;


                result = _data.Edit(_asset.Id, _asset.VendorName, _asset.PurchaseOrderNumber, _asset.PurchasedOn, _asset.BillNumber, _asset.BillDate, _asset.AssetType, _asset.AssetName,
                            _asset.AssetDescription, _asset.CostInRs, _asset.CostType, _asset.Make, _asset.Model, _asset.SerialNumber,
                            _asset.IdentificationCode, _asset.WarrantyMonths, _asset.WarrantyStartDate, _asset.WarrantyEndDate, _asset.InvoiceId,
                            _asset.AssetTypeId, _asset.AssetNameId,HRConstants.AssetStatusConstants.Unassigned);


                return result;


            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
                throw exec;
            }
        }

        public JsonResult ReadAllAssetEntries()
        {
            MTSHRDataLayer.Asset _data = new MTSHRDataLayer.Asset();
            var assetDetails = _data.ReadAllAssetEntries();
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(assetDetails.Tables[1]), result2 = JsonConvert.SerializeObject(assetDetails.Tables[0]) }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ImageFiles(AssetsEntry _asset)
        {
            try
            {
                var docname = Request.Params["docname"].ToString();
                if (Request.Files.Count > 0)
                {
                    var file = Request.Files[0];
                    string FileName = file.FileName;
                    if (file != null && file.ContentLength > 0)
                    {
                        BinaryReader reader = new BinaryReader(file.InputStream);
                        MTSHRDataLayer.Policies data_doc = new MTSHRDataLayer.Policies();
                        byte[] bytes = reader.ReadBytes((int)file.ContentLength);
                        int result = data_doc.Create(docname, bytes, FileName);
                        return Content("Success");
                    }
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Content("Failed");
        }

        public List<SelectListItem> GetAllEmployeeNames()
        {
            List<SelectListItem> EmployeeNameList = new List<SelectListItem>();
            try
            {
                string empid = Session["UserID"].ToString();
                //string empName = String.Format("{0} {1}", Session["FirstName"].ToString(), Session["LastName"].ToString()); 
                MTSHRDataLayer.EmployeeLeave EmployeeNamedata = new MTSHRDataLayer.EmployeeLeave();
                var EmployeeNames = EmployeeNamedata.GetAllEmployeeNames();
                EmployeeNameList.Add(new SelectListItem() { Value = "", Text = "----Select Employee----" });
                for (int i = 0; i < EmployeeNames.Tables[0].Rows.Count; i++)
                {
                    string ID = EmployeeNames.Tables[0].Rows[i]["id"].ToString();
                    EmployeeNameList.Add(new SelectListItem() { Text = EmployeeNames.Tables[0].Rows[i]["EmployeeName"].ToString(), Value = ID });
                }
                //EmployeeNameList.RemoveAt(EmployeeNameList.IndexOf(new SelectListItem() { Value = empid, Text = empName }));
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return EmployeeNameList;
        }
        ////public List<SelectListItem> GetAllLocation()
        ////{
        ////    List<SelectListItem> LocationList = new List<SelectListItem>();
        ////    try
        ////    {
        ////        string empid = Session["UserID"].ToString();

        ////        MTSHRDataLayer.Asset _data = new MTSHRDataLayer.Asset();
        ////        var LocationNames = _data.ReadLocation();

        ////        LocationList.Add(new SelectListItem() { Value = "", Text = "----Select Location----" });
        ////        for (int i = 0; i < LocationNames.Rows.Count; i++)
        ////        {
        ////            LocationList.Add(new SelectListItem() { Text = LocationNames.Rows[i]["LocationName"].ToString(), Value = LocationNames.Rows[i]["LocationId"].ToString() });
        ////        }
        ////    }
        ////    catch (Exception exec)
        ////    {
        ////        BaseExceptionHandler.HandleException(ref exec);
        ////    }
        ////    return LocationList;
        //}
        public List<SelectListItem> GetAllVendorNames()
        {
            List<SelectListItem> VendorList = new List<SelectListItem>();
            try
            {
                string empid = Session["UserID"].ToString();

                MTSHRDataLayer.Asset _data = new MTSHRDataLayer.Asset();
                var VendorNames = _data.ReadVendorNames();

                VendorList.Add(new SelectListItem() { Value = "", Text = "----Select Vendor----" });
                for (int i = 0; i < VendorNames.Rows.Count; i++)
                {
                    VendorList.Add(new SelectListItem() { Text = VendorNames.Rows[i]["Name"].ToString(), Value = VendorNames.Rows[i]["Id"].ToString() });
                }

            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return VendorList;
        }

        [HttpPost]
        public JsonResult AssetName(Int64 id)
        {
            MTSHRDataLayer.AssetMaintenanceDetails data_asset_name = new MTSHRDataLayer.AssetMaintenanceDetails();
            List<SelectListItem> Assetnamelist = new List<SelectListItem>();
            try
            {
                var Assetname = data_asset_name.GetSpecificAsset(id);
                Assetnamelist.Add(new SelectListItem() { Value = "", Text = "----Select Asset----" });
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
            List<SelectListItem> Assetlist = new List<SelectListItem>();
            try
            {
                var Asset = data_Ass.ReadAssetName();
                Assetlist.Add(new SelectListItem() { Value = "", Text = "---- Select Category----" });
                //for (int i = 0; i < Asset.Tables[0].Rows.Count; i++)
                //{
                //    Assetlist.Add(new SelectListItem() { Value = Asset.Tables[0].Rows[i]["Id"].ToString(), Text = Asset.Tables[0].Rows[i]["Assetname"].ToString() });
                //}
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Assetlist;
        }


    }
}
