using MTSINHR.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using System.Data;
using ClosedXML.Excel;
using System.IO;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class EmployeeLeaveListController : SecureController
    {
        //
        // GET: /EmployeeLeaveList/

        public ActionResult LeaveList()
        {
            ViewBag.EmployeeNames = GetAllEmployeeNames();
            return View();
        }


        public ActionResult Export()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Export(Leave leave)
        {

            MTSHRDataLayer.EmployeeLeave data_leaves = new MTSHRDataLayer.EmployeeLeave();
            int month = DateTime.ParseExact(leave.Month, "MMMM", System.Globalization.CultureInfo.InvariantCulture).Month;
            DataTable dt = new DataTable();
            return Json(JsonConvert.SerializeObject(data_leaves.GetApprovedLeaveList(month, leave.Year)));
        }



        [HttpPost]
        public JsonResult GetAllEmployeeLeaveList(Leave le)
        {
            try
            {
                MTSHRDataLayer.EmployeeLeave data_leaves = new MTSHRDataLayer.EmployeeLeave();

                DataTable dt = new DataTable();
                dt = data_leaves.GetAllEmployeeLeaveList(le.FromDate, le.ToDate, le.EmployeeName);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    DateTime startdate = Convert.ToDateTime(dt.Rows[i]["FromDate"]);
                    DateTime enddate = Convert.ToDateTime(dt.Rows[i]["ToDate"]);

                    List<DateTime> alldate = returnalldates(startdate, enddate);
                }

                return Json(JsonConvert.SerializeObject(data_leaves.GetAllEmployeeLeaveList(le.FromDate, le.ToDate, le.EmployeeName)));
            }
            catch(Exception ex)
            {
                BaseExceptionHandler.HandleException(ref ex);
            }
            return Json (new { success = true });
        }


        public List<DateTime> returnalldates(DateTime startdate, DateTime enddate)
        {


            List<DateTime> allDates = new List<DateTime>();
            string dayofweek;

            for (DateTime date = startdate; date <= enddate; date = date.AddDays(1))
            {

                dayofweek = date.DayOfWeek.ToString();

                if (dayofweek != "Saturday" && dayofweek != "Sunday")
                {
                    allDates.Add(date);
                }
            }

            return allDates;
        }


        public List<SelectListItem> GetAllEmployeeNames()
        {
            MTSHRDataLayer.EmployeeLeave EmployeeNamedata = new MTSHRDataLayer.EmployeeLeave();
            var EmployeeNames = EmployeeNamedata.GetAllEmployeeNames();
            List<SelectListItem> EmployeeNameList = new List<SelectListItem>();
            //EmployeeNameList.Insert(0, new SelectListItem() { Value = "0", Text = "----Select Employee NameA----" });
            for (int i = 0; i < EmployeeNames.Tables[0].Rows.Count; i++)
            {
                EmployeeNameList.Add(new SelectListItem() { Text = EmployeeNames.Tables[0].Rows[i]["EmployeeName"].ToString(), Value = EmployeeNames.Tables[0].Rows[i]["id"].ToString() });
            }

             return EmployeeNameList.OrderBy(o => o.Text).ToList();
           // EmployeeNameList.Insert(0, new SelectListItem() { Value = "0", Text = "----Select ALL----" });
           // return EmployeeNameList;
        }

        //private List<SelectListItem> GetAllLeaveType(int empid =0)
        //{
        //    string gender = Session["Gender"].ToString();
        //    MTSHRDataLayer.EmployeeLeave LeaveTypedata = new MTSHRDataLayer.EmployeeLeave();
        //    var LeaveTypes = LeaveTypedata.GetAllLeaveType();
        //    List<SelectListItem> LeaveTypelist = new List<SelectListItem>();
        //    try
        //    {
        //        LeaveTypelist.Add(new SelectListItem() { Value = "", Text = "----Select LeaveType----" });
        //        for (int i = 0; i < LeaveTypes.Tables[0].Rows.Count; i++)
        //        {
        //            LeaveTypelist.Add(new SelectListItem() { Value = LeaveTypes.Tables[0].Rows[i]["id"].ToString(), Text = LeaveTypes.Tables[0].Rows[i]["LeaveType"].ToString() });
        //            if (gender == "0" && LeaveTypelist[i].Value == "3")
        //            {
        //                LeaveTypelist.RemoveAt(i);
        //            }
        //        }
        //    }
        //    catch (Exception exec)
        //    {
        //        BaseExceptionHandler.HandleException(ref exec);
        //    }
        //    return LeaveTypelist;
        //}
        [HttpPost]
        public JsonResult GetAllLeaveType(Int64 empid)
        {
         
           // string empid = Session["UserID"].ToString();
            //string department = Session["DepartmentId"].ToString();
            //Int64 id = Convert.ToInt64(empid);
            //Int64 departmentid = Convert.ToInt64(department);
            MTSHRDataLayer.EmployeeLeave LeaveTypedata = new MTSHRDataLayer.EmployeeLeave();
            var LeaveTypes = LeaveTypedata.GetAllLeaveType(empid);
            List<SelectListItem> LeaveTypelist = new List<SelectListItem>();
            try
            {
                LeaveTypelist.Add(new SelectListItem() { Value = "0", Text = "----Select LeaveType----" });
                for (int i = 0; i < LeaveTypes.Tables[0].Rows.Count; i++)
                {
                    LeaveTypelist.Add(new SelectListItem() { Value = LeaveTypes.Tables[0].Rows[i]["id"].ToString(), Text = LeaveTypes.Tables[0].Rows[i]["LeaveType"].ToString() });
                 
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            ViewBag.LeaveTypes = LeaveTypelist;
           // return LeaveTypelist;
            return Json(new { success = true, LeaveList = JsonConvert.SerializeObject(LeaveTypelist) }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult LossOfPayDays()
        {
            //GetAllLeaveType(0);
            List<SelectListItem> leavelist = new List<SelectListItem>();
            leavelist.Add(new SelectListItem() { Value = "", Text = "----Select LeaveType----" });
            ViewBag.LeaveTypes = leavelist;
            ViewBag.EmployeeNames = GetAllEmployeeNames();
            return View();
        }

        [HttpPost]
        public int LossOfPayDays(Leave le)
        {

            MTSHRDataLayer.EmployeeLeave data_leaves = new MTSHRDataLayer.EmployeeLeave();

            int month = DateTime.ParseExact(le.Month, "MMMM", System.Globalization.CultureInfo.InvariantCulture).Month;
            int result = data_leaves.UpdateLopDays(le.EmployeeName, le.LeaveType, month, le.Year, le.lopDays);

            return result;
        }

        [HttpGet]
        public ActionResult ReadEmployeeLeaveBalance(int? employeeid)
        {
            int year = DateTime.Now.Year;
            MTSHRDataLayer.EmployeeLeave data = new MTSHRDataLayer.EmployeeLeave();
            var result = JsonConvert.SerializeObject(data.ReadEmployeeLeaveList(employeeid,false, year));
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult AddAdvanceCreditLeave(string EmpId, string Availableleave, string AdvanceCredit, string AdvanceAvailed, string leavetype)
        {
            MTSHRDataLayer.EmployeeLeave data = new MTSHRDataLayer.EmployeeLeave();
            var result = JsonConvert.SerializeObject(data.AddAdvanceCreditLeave(Convert.ToInt64(EmpId), Availableleave==""? (Int64)0 : Convert.ToInt64(Availableleave), AdvanceCredit==""?(Int64)0 : Convert.ToInt64(AdvanceCredit), AdvanceAvailed == "" ? (Int64)0 : Convert.ToInt64(AdvanceAvailed), Convert.ToInt64(leavetype)));
            return Json(new { success = result });
        }
        [HttpPost]
        public JsonResult UpdateAdvanceCreditAndAvailed(LeavePolicy leavePolicy)
        {
            MTSHRDataLayer.EmployeeLeave data = new MTSHRDataLayer.EmployeeLeave();
            var result = JsonConvert.SerializeObject(data.UpdateAdvanceCreditAndAvailed(leavePolicy.Id, leavePolicy.MaxAllowBal, leavePolicy.ConsecutiveLeave));
            return Json(new { success = result });
        }

        public ActionResult ReadLeavePolicy(string deptID)
        {
            MTSHRDataLayer.EmployeeLeave data = new MTSHRDataLayer.EmployeeLeave();
            var result = JsonConvert.SerializeObject(data.ReadLeaveType(deptID == "" ?(Int64?) null : Convert.ToInt64(deptID)));
            return Json(result, JsonRequestBehavior.AllowGet);
        }
    }
}
