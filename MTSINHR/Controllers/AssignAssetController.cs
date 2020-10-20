using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using MTSINHR.Models;
using Newtonsoft.Json;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class AssignAssetController : SecureController
    {
        // GET: AssignAsset
        public ActionResult AssignAsset()
        {
            ViewBag.AssetCategory = GetAsset();
            ViewBag.AssetNames = DummyAssetName();
            ViewBag.EmployeeNames = GetActiveEmployees();
            ViewBag.Locations = GetLocation();
            ViewBag.Departments = GetDepartment();
            ViewBag.ItemCode = DummyGetItemCode();
            ViewBag.LocationDetails = DummyLocationDetails();
            ViewBag.Assettype = TempData["AssignAssetTypeId"];
            ViewBag.Assetname = TempData["AssignAssetNameId"];
            ViewBag.Item = TempData["AssignItemCode"];
            TempData.Keep("AssignAssetTypeId");
            TempData.Keep("AssignAssetNameId");
            TempData.Keep("AssignItemCode");
            return View("AssignAsset");
        }

        public ActionResult AssetAssign(int assettype = 0, int assetname = 0 , int item = 0)
        {
            if ((assettype > 0) && (assetname > 0) && (item > 0))
            {
                TempData["AssignAssetTypeId"] = assettype;
                TempData["AssignAssetNameId"] = assetname;
                TempData["AssignItemCode"] = item;
            }
            else
            {
                TempData["AssignAssetTypeId"] = null;
                TempData["AssignAssetNameId"] = null;
                TempData["AssignItemCode"] = null;
            }
            return RedirectToAction("AssignAsset");
        }

        public List<SelectListItem> GetActiveEmployees()
        {
            MTSHRDataLayer.AssignAsset data_doc = new MTSHRDataLayer.AssignAsset();
            var Employees = data_doc.GetActiveEmployees();
            List<SelectListItem> empList = new List<SelectListItem>();
            empList.Add(new SelectListItem() { Value = "", Text = "---- Select Employee ----" });
            for (int i = 0; i < Employees.Tables[0].Rows.Count; i++)
            {
                empList.Add(new SelectListItem() { Value = Employees.Tables[0].Rows[i]["id"].ToString(), Text = Employees.Tables[0].Rows[i]["EmployeeName"].ToString() });
            }
            return empList;
        }

        [HttpPost]
        public JsonResult AssetName(Int64 Id)
        {
            MTSHRDataLayer.AssetMaintenanceDetails data_asset_name = new MTSHRDataLayer.AssetMaintenanceDetails();
            List<SelectListItem> Assetnamelist = new List<SelectListItem>();
            try
            {
                var Assetname = data_asset_name.GetSpecificAsset(Id);
                Assetnamelist.Add(new SelectListItem() { Value = "", Text = "---- Select Category----" });
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

        [HttpPost]
        public JsonResult GetLocationDetails(Int64 id)
        {
            MTSHRDataLayer.AssignAsset data_location_details = new MTSHRDataLayer.AssignAsset();
            List<SelectListItem> locationDetailList = new List<SelectListItem>();
            try
            {
                var LocationDetail = data_location_details.GetLocationDetails(id);
                locationDetailList.Add(new SelectListItem() { Value = "", Text = "---- Select Location Details----" });
                for (int i = 0; i < LocationDetail.Rows.Count; i++)
                {
                    locationDetailList.Add(new SelectListItem() { Value = LocationDetail.Rows[i]["PLACE_ID"].ToString(), Text = LocationDetail.Rows[i]["PLACE_NAME"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            ViewBag.LocationDetails = locationDetailList;

            return Json(new { success = true, LocationDetailList = JsonConvert.SerializeObject(locationDetailList) }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        //public JsonResult GetItemCode(Int64 id)
        //{
        //    MTSHRDataLayer.AssignAsset data_item_code = new MTSHRDataLayer.AssignAsset();
        //    List<SelectListItem> itemCodeList = new List<SelectListItem>();
        //    try
        //    {
        //        var ItemCode = data_item_code.GetItemCode(id);
        //        itemCodeList.Add(new SelectListItem() { Value = "", Text = "---- Select Item Code----" });
        //        for (int i = 0; i < ItemCode.Rows.Count; i++)
        //        {
        //            itemCodeList.Add(new SelectListItem() { Value = ItemCode.Rows[i]["IDENTIFICATION_CODE"].ToString(), Text = ItemCode.Rows[i]["IDENTIFICATION_CODE"].ToString() });
        //        }
        //    }
        //    catch (Exception exec)
        //    {
        //        BaseExceptionHandler.HandleException(ref exec);
        //    }
        //    ViewBag.ItemCode = itemCodeList;

        //    return Json(new { success = true, ItemCodeList = JsonConvert.SerializeObject(itemCodeList) }, JsonRequestBehavior.AllowGet);
        //}
        public JsonResult GetItemCode(Int64 Assettypeid, Int64 Assetnameid)
        {
            MTSHRDataLayer.AssetMaintenanceDetails data_item = new MTSHRDataLayer.AssetMaintenanceDetails();
            List<SelectListItem> itemCodeList = new List<SelectListItem>();
            try
            {
                var item = data_item.GetItem(Assettypeid, Assetnameid);
                itemCodeList.Add(new SelectListItem() { Value = "", Text = "--Select Item--" });
                for (int i = 0; i < item.Rows.Count; i++)
                {
                    itemCodeList.Add(new SelectListItem() { Value = item.Rows[i]["ID"].ToString(), Text = item.Rows[i]["Item"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            ViewBag.ItemCode = itemCodeList;

            return Json(new { success = true, ItemCodeList = JsonConvert.SerializeObject(itemCodeList) }, JsonRequestBehavior.AllowGet);
        }

        public List<SelectListItem> DummyGetItemCode()
        {
          
            List<SelectListItem> itemCodeList = new List<SelectListItem>();
            itemCodeList.Add(new SelectListItem() { Value = "", Text = "----Select Item Code----" });
            return itemCodeList;
        }

        public List<SelectListItem> DummyAssetName()
        {

            List<SelectListItem> AssetnameList = new List<SelectListItem>();
            AssetnameList.Add(new SelectListItem() { Value = "", Text = "----Select Asset----" });
            return AssetnameList;
        }

        public List<SelectListItem> DummyLocationDetails()
        {

            List<SelectListItem> AssetnameList = new List<SelectListItem>();
            AssetnameList.Add(new SelectListItem() { Value = "", Text = "----Select Asset----" });
            return AssetnameList;
        }


        public List<SelectListItem> GetLocation()
        {
            MTSHRDataLayer.AssignAsset data_doc = new MTSHRDataLayer.AssignAsset();
            var Location = data_doc.GetLocations();
            List<SelectListItem> locationList = new List<SelectListItem>();
            locationList.Add(new SelectListItem() { Value = "", Text = "----Select Location----" });
            for (int i = 0; i < Location.Tables[0].Rows.Count; i++)
            {
                locationList.Add(new SelectListItem() { Value = Location.Tables[0].Rows[i]["LocationId"].ToString(), Text = Location.Tables[0].Rows[i]["LocationName"].ToString() });
            }
            return locationList;
        }

        public List<SelectListItem> GetDepartment()
        {
            MTSHRDataLayer.AssignAsset data_doc = new MTSHRDataLayer.AssignAsset();
            var Departments = data_doc.GetDepartments();
            List<SelectListItem> departmentList = new List<SelectListItem>();
            departmentList.Add(new SelectListItem() { Value = "", Text = "----Select Department----" });
            for (int i = 0; i < Departments.Tables[0].Rows.Count; i++)
            {
                departmentList.Add(new SelectListItem() { Value = Departments.Tables[0].Rows[i]["id"].ToString(), Text = Departments.Tables[0].Rows[i]["Department"].ToString() });
            }
            return departmentList;
        }

        private List<SelectListItem> GetAsset()
        {
            MTSHRDataLayer.Asset data_Ass = new MTSHRDataLayer.Asset();
            List<SelectListItem> Assetlist = new List<SelectListItem>();
            try
            {
                var Asset = data_Ass.ReadCategory();
                Assetlist.Add(new SelectListItem() { Value = "", Text = "---- Select Asset Classification----" });
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

        [HttpPost]
        public JsonResult GetLastAssignedEmployee(string Id)
        {
            MTSHRDataLayer.AssignAsset data_doc = new MTSHRDataLayer.AssignAsset();
            return Json(JsonConvert.SerializeObject(data_doc.GetCurrentlyAssignedEmployee(Id)), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetDescription(string Id)
        {
            MTSHRDataLayer.AssignAsset data_doc = new MTSHRDataLayer.AssignAsset();
            return Json(JsonConvert.SerializeObject(data_doc.GetDescription(Id)), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult Add(AssignAsset assign)

        {
         

            MTSHRDataLayer.AssignAsset data_main = new MTSHRDataLayer.AssignAsset();

            int result = data_main.AddAssetAssignment(assign.AssetTypeId,assign.AssetNameId,assign.ItemCode
                        , assign.EmployeeId, assign.DepartmentId, assign.LocationId
                         , assign.LocationDetails,assign.ActionDate, assign.Notes, assign.AssignTypeId);
                     //   , assign.LocationDetails,test, assign.Notes, assign.AssignTypeId);
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }
    }
}