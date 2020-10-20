using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSEntBlocks.ExceptionBlock.Handlers;
using System.Data;
using Newtonsoft.Json;
using MTSINHR.Models;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class LeavePolicyController : SecureController
    {
        // GET: LeavePolicy
        public ActionResult LeavePolicy()
        {
            ViewBag.leavetype = GetLeaveType();
            return View();
        }

        private List<SelectListItem> GetLeaveType()
        {
            MTSHRDataLayer.Leave data = new MTSHRDataLayer.Leave();
            List<SelectListItem> leavetype = new List<SelectListItem>();
            try
            {
                DataTable leavenamelist = data.ReadLeavePolicy();
                //leavetype.Add(new SelectListItem() { Value = "", Text = "---- Select Leave type----" });
                for (int i = 0; i < leavenamelist.Rows.Count; i++)
                {
                    leavetype.Add(new SelectListItem() { Value = leavenamelist.Rows[i]["LEAVE_CODE"].ToString(), Text = leavenamelist.Rows[i]["LEAVE_TYPE"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return leavetype;
        }

        public ActionResult ReadLeavePolicy()
        {
            MTSHRDataLayer.Leave data = new MTSHRDataLayer.Leave();
            var result = JsonConvert.SerializeObject(data.ReadLeavePolicy());
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddLeavepolicy(LeavePolicy leavePolicy)
        {
            MTSHRDataLayer.Leave data = new MTSHRDataLayer.Leave();
            int result = data.AddLeavePolicy(leavePolicy.LeaveType, leavePolicy.LeaveCode, leavePolicy.ApplicableAfter, leavePolicy.ApplicableFor, leavePolicy.MaritalStatus,
                                     leavePolicy.Accural, leavePolicy.MaxAllowBal, leavePolicy.ConsecutiveLeave, leavePolicy.ADJUSTMENT_LEAVE_AGAINST, leavePolicy.LEAVE_CANNOT_TAKE_TOGETHER, leavePolicy.ENABLE_UPLOAD_DOC_FOR_EXCEEDED_DAYS,leavePolicy.PRORATA);
            return Json(new { success = result });
        }

        [HttpPost]
        public JsonResult UpdateLeavepolicy(LeavePolicy leavePolicy)
        {
            MTSHRDataLayer.Leave data = new MTSHRDataLayer.Leave();
            var result = JsonConvert.SerializeObject(data.UpdateLeavePolicy(leavePolicy.Id, leavePolicy.LeaveType, leavePolicy.LeaveCode, leavePolicy.ApplicableAfter, leavePolicy.ApplicableFor, leavePolicy.MaritalStatus,
                                     leavePolicy.Accural, leavePolicy.MaxAllowBal, leavePolicy.ConsecutiveLeave, leavePolicy.ADJUSTMENT_LEAVE_AGAINST, leavePolicy.LEAVE_CANNOT_TAKE_TOGETHER, leavePolicy.ENABLE_UPLOAD_DOC_FOR_EXCEEDED_DAYS, leavePolicy.PRORATA));
            return Json(new { success = result });
        }


    }
}