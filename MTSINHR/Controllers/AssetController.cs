using MTSEntBlocks.ExceptionBlock.Handlers;
using MTSINHR.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Controllers
{
    public class AssetController : Controller
    {
        MTSHRDataLayer.Asset _data = new MTSHRDataLayer.Asset();
        //
        // GET: /Asset/
        public ActionResult AssetListDetails()
        {
            return View();
        }

        public ActionResult AssignAsset()
        {
            ViewBag.EmployeeNames = GetAllEmployeeNames();
            //ViewBag.LocationNames = GetAllLocation();
            ViewBag.CategoryNames = GetAllCategories();
            ViewBag.VendorNames = GetAllVendorNames();
            ViewBag.AssetNames = GetAllAssetNames(0);
            return View("AssetEntry");
        }

        public int ReadLastInvoiceId()
        {
            MTSHRDataLayer.Asset data_doc = new MTSHRDataLayer.Asset();
            return data_doc.ReadLastInvoiceId();
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
        public int AddAssetDetails(Assets _asset)
        {
            MTSHRDataLayer.Asset _data = new MTSHRDataLayer.Asset();
            try
            {


                int result = _data.Create(_asset.Id, _asset.VendorName, _asset.PurchaseOrderNumber, _asset.PurchasedOn, _asset.BillNumber, _asset.BillDate, _asset.AssetType, _asset.AssetName,
                             _asset.AssetDescription, _asset.CostInRs, _asset.CostType, _asset.Make, _asset.Model, _asset.SerialNumber,
                             _asset.IdentificationCode, _asset.WarrantyMonths, _asset.WarrantyStartDate, _asset.WarrantyEndDate, ReadLastInvoiceId(),
                             _asset.AssetTypeId, _asset.AssetNameId);


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
            return Json(new { success = true, result = JsonConvert.SerializeObject(_data.ReadAllAssetEntries()) }, JsonRequestBehavior.AllowGet);


        }



        public ActionResult ImageFiles(Assets _asset)
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

        public List<SelectListItem> GetAllAssetNames(Int64 AssetTypeId)
        {
            List<SelectListItem> AssetList= new List<SelectListItem>();
            try
            {
               
                MTSHRDataLayer.Asset _data = new MTSHRDataLayer.Asset();
                var AssetNames = _data.ReadAssetNames();

                AssetList.Add(new SelectListItem() { Value = "", Text = "----Select AssetNames----" });
                for (int i = 0; i < AssetNames.Rows.Count; i++)
                {
                    AssetList.Add(new SelectListItem() { Text = AssetNames.Rows[i]["Assetname"].ToString(), Value = AssetNames.Rows[i]["AssettypeId"].ToString() });
                }

            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
                throw exec;
            }

            return AssetList;
        }

        public List<SelectListItem> GetAllCategories()
        {
            List<SelectListItem> CategoryList = new List<SelectListItem>();
            try
            {
                string empid = Session["UserID"].ToString();
                //string empName = String.Format("{0} {1}", Session["FirstName"].ToString(), Session["LastName"].ToString()); 
                MTSHRDataLayer.Asset _data = new MTSHRDataLayer.Asset();
                var CategoryNames = _data.ReadCategory();

                 CategoryList.Add(new SelectListItem() { Value = "", Text = "----Select Category----" });
                for (int i = 0; i < CategoryNames.Tables[0].Rows.Count; i++)
                {
                    CategoryList.Add(new SelectListItem() { Text = CategoryNames.Tables[0].Rows[i]["CategoryName"].ToString(), Value = CategoryNames.Tables[0].Rows[i]["CategoryId"].ToString() });
                }
                //EmployeeNameList.RemoveAt(EmployeeNameList.IndexOf(new SelectListItem() { Value = empid, Text = empName }));

            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return CategoryList;
        }
    }
}
