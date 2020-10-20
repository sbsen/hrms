using MTSEntBlocks.ExceptionBlock.Handlers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class ModuleController : SecureController
    {
        // GET: Module
        public ActionResult Module()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ReadApprovalDetails(Int64 TableFlag)
        {
            Int64 approversFlag;
            Int64 rejectedCount = 0;
            MTSHRDataLayer.Module data = new MTSHRDataLayer.Module();
            DataSet result = data.GetApprovalDetails(Convert.ToInt64(Session["UserID"]));
            approversFlag = String.IsNullOrEmpty(result.Tables[2].Rows[0][0].ToString()) ? -1 : Convert.ToInt64(result.Tables[2].Rows[0][0]);
            if(approversFlag == 0)
            {
                DataTable res = data.GetRejectedApprovalDetails(Convert.ToInt64(Session["UserID"]));
                rejectedCount = (res.Rows.Count > 0) ? res.Rows.Count : 0;
            }

            if(TableFlag == 1)
            {
                return Json(new { success = JsonConvert.SerializeObject(result.Tables[0])
                                    , approversFlag = approversFlag
                                    , rejectedCount = rejectedCount
                });
            }
            else if(TableFlag == 2)
            {
                return Json(new { success = JsonConvert.SerializeObject(result.Tables[1]) });
            }
            else
            {
                return null;
            }            
        }

        [HttpPost]
        public ActionResult ReadApprovers()
        {
            Int64 approvalFlag = -1;
            MTSHRDataLayer.Module data = new MTSHRDataLayer.Module();
            DataSet result = data.GetApprovers(Convert.ToInt64(Session["UserID"]));
            if(result.Tables[3].Rows.Count > 0)
            {
                approvalFlag = Convert.ToInt64( result.Tables[3].Rows[0]["Approval_flag"] );   
                //return Json(new { success = JsonConvert.SerializeObject(result) });
                return Json(new { success = approvalFlag });
            }
            else
            {
                //return Json(new { success = JsonConvert.SerializeObject(result) });
                return Json(new { success = approvalFlag });
            }
        }

        [HttpPost]
        public ActionResult InsertApprovalDetails(Int64 Moduleid, Int64 Status, Int64? To_Userid,string Parameters, string Remarks, Int64? empID)
        {

            MTSHRDataLayer.Module data = new MTSHRDataLayer.Module();
            Int64 result = data.InsertApprovalDetails(Moduleid, Status, Convert.ToInt64(Session["UserID"]), To_Userid, Parameters, Remarks, empID);
            return Json(new { success = result });
        }

        [HttpPost]
        public ActionResult ValidateApproval(string Parameters, Int64 Module)
        {
            Int64 Result = 0;
            MTSHRDataLayer.Module data = new MTSHRDataLayer.Module();
            DataTable res = data.ValidateApprovalDetails(Parameters, Module);
            if(res.Columns.Count > 1)
            {
                Result = Convert.ToInt64(res.Rows[0]["STATUS"]);
                return Json(new { success = true,
                                result = Result,
                });
            }
            else
            {
                Result = -1;
                return Json(new { success = true,
                                result = Result
                });
            }
        }
        
        [HttpPost]
        public ActionResult ReadApprovalActions(Int64 ActivityID)
        {
            MTSHRDataLayer.Module data = new MTSHRDataLayer.Module();
            DataTable result = data.ReadApprovalActionsDetails(ActivityID);
            return Json(new { success = JsonConvert.SerializeObject(result) });
        }

        [HttpPost]
        public ActionResult ViewModulePage(Int64 ActivityID, Int64 ModuleID)
        {
            string Description = "";
            MTSHRDataLayer.Module data = new MTSHRDataLayer.Module();
            DataTable res = data.ViewModulePagedetails(ActivityID, ModuleID);
            if (res.Rows.Count > 0)
            {
                if (res.Rows[0]["EmployeeName"].ToString() == "No Data")
                    Description = res.Rows[0]["MODULE"].ToString() + " - " + res.Rows[0]["MonthYear"].ToString();
                else if(res.Rows[0]["EmployeeName"].ToString() != null)
                    Description = res.Rows[0]["MODULE"].ToString() + " - " + res.Rows[0]["EmployeeName"].ToString() + " (" + res.Rows[0]["MonthYear"].ToString() + ")";
                return Json(new { Urlstring = Url.Content("~/"+res.Rows[0]["PAGE_URL"].ToString()), PARAMETERS_VALUE = res.Rows[0]["PARAMETERS_VALUE"].ToString(), Description = Description});
            }
            else
            {
                return Content("1");
            }
        }

        [HttpPost]
        public ActionResult ReadRejectedDetails()
        {
            MTSHRDataLayer.Module data = new MTSHRDataLayer.Module();
            DataTable result = data.GetRejectedApprovalDetails(Convert.ToInt64(Session["UserID"]));
            return Json(new { success = JsonConvert.SerializeObject(result) });
        }

        public ActionResult PV_ModuleApproval()
        {
            ViewBag.Approvers = GetApproversList();
            return PartialView("PV_Module_Approval");
        }

        public static List<SelectListItem> GetApproversList()
        {
            MTSHRDataLayer.Module data = new MTSHRDataLayer.Module();
            List<SelectListItem> ApproversList = new List<SelectListItem>();
            string USERID = null;
            
            try
            {
                DataSet Approver = data.GetApprovers(USERID);
                for (int i = 0; i < Approver.Tables[1].Rows.Count; i++)
                {
                   ApproversList.Add(new SelectListItem() { Value = Approver.Tables[1].Rows[i]["UserId"].ToString(), Text = Approver.Tables[1].Rows[i]["Approver"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return ApproversList;
        }
    }
}