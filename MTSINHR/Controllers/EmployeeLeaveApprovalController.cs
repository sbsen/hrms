using MTSINHR.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class EmployeeLeaveApprovalController : SecureController
    {
        //
        // GET: /EmployeeLeaveApproval/

        public ActionResult LeaveApproval()
        {
            return View();
        }


        [HttpPost]
        public JsonResult GetAllApprovalLeaveList(Leave le)
        {
            try
            {
                if (Request.Headers["Range"] == null)
                {
                    le.FromDate = DateTime.Now;
                    le.ToDate = DateTime.Now.AddMonths(3);
                }
                //else if (Request.Headers["Range"] == "1")
                //{
                //    String[] date = le.DateRange.Split('-');
                //    le.FromDate = Convert.ToDateTime(date[0].Trim());
                //    le.ToDate = Convert.ToDateTime(date[1].Trim());

                //}

                string empid = Session["UserID"].ToString();
                Int64 id = Convert.ToInt64(empid);
                MTSHRDataLayer.LeavePending_Approve leaves_pending = new MTSHRDataLayer.LeavePending_Approve();
                return Json(JsonConvert.SerializeObject(leaves_pending.GetAllApprovedLeaveList(empid, le.FromDate, le.ToDate)));
            }
            catch (Exception ex)
            {
                BaseExceptionHandler.HandleException(ref ex);
            }
            return Json(JsonConvert.SerializeObject(new { Success = false }));
        }



    }
}
