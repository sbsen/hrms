using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSEntBlocks.DataBlock;
using MTSINHR.Models;
using Newtonsoft.Json;
using MTS.Login.Data;
using System.Data.Common;
using System.Data;
using System.Globalization;
using MTSHRDataLayer;
using MTS.Controllers;
using Newtonsoft.Json.Converters;
using MTSEntBlocks.ExceptionBlock.Handlers;
using HRConstants;
using System.Configuration;

namespace MTSINHR.Controllers
{
    public class LeaveApplyController : SecureController
    {
        public DateTime earnedLeaveStartDate = new DateTime();
        public ActionResult LeaveApply()
        {
            //string empid = Session["UserID"].ToString();
            //MTSHRDataLayer.EmployeeLeave LeaveTypedata = new MTSHRDataLayer.EmployeeLeave();
            //LeaveTypedata.CalculateEarnedLeaveBalance(empid);
            ViewBag.LeaveTypes = GetAllLeaveType();
            ViewBag.LeaveFromSessions = GetAllLeaveFromSession();
            ViewBag.LeaveToSessions = GetAllLeaveToSession();
            ViewBag.EmployeeNames = GetAllEmployeeNames();
            return View();
        }
        public ActionResult BPOLeaveApply()
        {
            //string empid = Session["UserID"].ToString();
            //MTSHRDataLayer.EmployeeLeave LeaveTypedata = new MTSHRDataLayer.EmployeeLeave();
            //LeaveTypedata.CalculateEarnedLeaveBalance(empid);
            ViewBag.LeaveTypes = GetAllLeaveType();
            ViewBag.LeaveFromSessions = GetAllLeaveFromSession();
            ViewBag.LeaveToSessions = GetAllLeaveToSession();
            ViewBag.EmployeeNames = GetAllEmployeeNames();
            return View();
        }

        private List<SelectListItem> GetAllLeaveType()
        {
            string gender = Session["Gender"].ToString();
            string empid = Session["UserID"].ToString();
            //string department = Session["DepartmentId"].ToString();
            Int64 id = Convert.ToInt64(empid);
            //Int64 departmentid = Convert.ToInt64(department);
            MTSHRDataLayer.EmployeeLeave LeaveTypedata = new MTSHRDataLayer.EmployeeLeave();
            var LeaveTypes = LeaveTypedata.GetAllLeaveType(id);
            List<SelectListItem> LeaveTypelist = new List<SelectListItem>();
            try
            {
                LeaveTypelist.Add(new SelectListItem() { Value = "", Text = "----Select LeaveType----" });
                for (int i = 0; i < LeaveTypes.Tables[0].Rows.Count; i++)
                {
                    LeaveTypelist.Add(new SelectListItem() { Value = LeaveTypes.Tables[0].Rows[i]["id"].ToString(), Text = LeaveTypes.Tables[0].Rows[i]["LeaveType"].ToString() });
                    //if (gender == "0" && (LeaveTypelist[i].Text).ToString() == "Maternity")
                    //{
                    //    LeaveTypelist.RemoveAt(i);
                    //}
                    //else if (gender == "1" && (LeaveTypelist[i].Text).ToString() == "Paternity")
                    //{
                    //    LeaveTypelist.RemoveAt(i);
                    //}
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return LeaveTypelist;
        }


        private List<SelectListItem> GetAllLeaveFromSession()
        {
            MTSHRDataLayer.EmployeeLeave LeaveSessiondata = new MTSHRDataLayer.EmployeeLeave();
            var LeaveFromSessions = LeaveSessiondata.GetAllLeaveToSession();
            List<SelectListItem> LeaveFromSessionlist = new List<SelectListItem>();
            try
            {
                for (int i = 0; i < LeaveFromSessions.Tables[0].Rows.Count; i++)
                {
                    string SessionID = LeaveFromSessions.Tables[0].Rows[i]["id"].ToString();

                    LeaveFromSessionlist.Add(new SelectListItem() { Value = LeaveFromSessions.Tables[0].Rows[i]["id"].ToString(), Text = LeaveFromSessions.Tables[0].Rows[i]["Session"].ToString() });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return LeaveFromSessionlist;
        }

        private List<SelectListItem> GetAllLeaveToSession()
        {
            MTSHRDataLayer.EmployeeLeave LeaveSessiondata = new MTSHRDataLayer.EmployeeLeave();
            var LeaveToSessions = LeaveSessiondata.GetAllLeaveToSession();
            List<SelectListItem> LeaveToSessionlist = new List<SelectListItem>();
            try
            {
                for (int i = 0; i < LeaveToSessions.Tables[0].Rows.Count; i++)
                {
                    string SessionID = LeaveToSessions.Tables[0].Rows[i]["id"].ToString();
                    if (SessionID != "3")
                    {
                        LeaveToSessionlist.Add(new SelectListItem() { Value = LeaveToSessions.Tables[0].Rows[i]["id"].ToString(), Text = LeaveToSessions.Tables[0].Rows[i]["Session"].ToString() });
                    }
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return LeaveToSessionlist;
        }

        public List<SelectListItem> GetAllEmployeeNames()
        {
            List<SelectListItem> EmployeeNameList = new List<SelectListItem>();
            try
            {
                string empid = Session["UserID"].ToString();
                //string empName = String.Format("{0} {1}", Session["FirstName"].ToString(), Session["LastName"].ToString()); 
                MTSHRDataLayer.EmployeeLeave EmployeeNamedata = new MTSHRDataLayer.EmployeeLeave();
                var EmployeeNames = EmployeeNamedata.GetAllManagereNames(empid, false);

                if (EmployeeNames.Tables[0].Rows.Count != 1)
                {
                    EmployeeNameList.Add(new SelectListItem() { Value = "", Text = "----Select Employee----" });
                }
                for (int i = 0; i < EmployeeNames.Tables[0].Rows.Count; i++)
                {
                    string ID = EmployeeNames.Tables[0].Rows[i]["id"].ToString();
                    if (!ID.Equals(empid))
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

        [HttpPost]
        public JsonResult Create(MTSINHR.Models.Leave leaveapply)
        {
            string empid = Session["UserID"].ToString();
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            Int64 id = Convert.ToInt64(empid);
            string department = Session["DepartmentId"].ToString();
            Int64 departmentid = Convert.ToInt64(department);
            var result = 0;
            int leaveCheck;
            Int64 leaveTypeID = 0;
            decimal availableLeaveCount = 0;
            DateTime todate = new DateTime();
            DateTime local_fromdate = new DateTime();
            DateTime local_todate = new DateTime();
            int year = leaveapply.FromDate.Year;
            string appliedLeaveType = string.Empty;
            string appliedLeaveCode = string.Empty;
            Int64 CreateLeave = 0;
            var CreateLeaveDetailsResult = 0;
            try
            {
                var MTSLeavePolicy = data_contact.GetMTSLeavePolicyLeaveType(empid, leaveapply.LeaveType, year);


                if (MTSLeavePolicy.Tables[0].Rows.Count > 0)
                {
                    var EmployeeLeaveList = data_contact.GetEmployeeLeaveDetails(empid, false, year);
                    for (int i = 0; i < EmployeeLeaveList.Tables[0].Rows.Count; i++)
                    {
                        leaveTypeID = Convert.ToInt64(EmployeeLeaveList.Tables[0].Rows[i]["LeaveTypeId"]);
                        if (leaveTypeID == leaveapply.LeaveType)
                        {
                            availableLeaveCount = Convert.ToDecimal(EmployeeLeaveList.Tables[0].Rows[i]["AvailableLeave"]);
                            appliedLeaveType = (EmployeeLeaveList.Tables[0].Rows[i]["LEAVE_TYPE"]).ToString();
                            appliedLeaveCode = (EmployeeLeaveList.Tables[0].Rows[i]["LEAVE_CODE"]).ToString();
                            break;
                        }
                    }
                }
                if (availableLeaveCount == 0)
                {
                    todate = todate.AddDays(1);
                    CreateLeave = data_contact.Create(leaveapply.Employee_Id = id, leaveapply.LeaveType
                                                       , leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate
                                                       , leaveapply.LeaveToSession, leaveapply.Reason, leaveapply.Managerid, leaveapply.NumberOfDays, true, leaveapply.LeaveType, true);

                    CreateLeaveDetailsResult = data_contact.CreateLeaveDetails(leaveapply.Employee_Id = id, appliedLeaveCode
                      , appliedLeaveType, leaveTypeID, leaveTypeID, leaveapply.NumberOfDays, true
                     , leaveapply.LeaveFromSession, leaveapply.LeaveToSession, CreateLeave, leaveapply.FromDate, leaveapply.ToDate);
                }
                else
                {
                    CreateLeave = data_contact.Create(leaveapply.Employee_Id = id, leaveapply.LeaveType
                                                       , leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate
                                                       , leaveapply.LeaveToSession, leaveapply.Reason, leaveapply.Managerid, leaveapply.NumberOfDays, false, leaveapply.LeaveType, true);

                    Int64 LeaveID = CreateLeave;

                    //decimal todatedayscount = leaveapply.NumberOfDays - Convert.ToDecimal(availableLeaveCount);
                    //Int64 toleaveDays = Convert.ToInt64(Math.Ceiling(todatedayscount));

                    //todate = leaveapply.ToDate.AddDays(-toleaveDays);


                    Int64 aBalance = Convert.ToInt64(Math.Ceiling(availableLeaveCount));
                    todate = getfromandtodate(aBalance, leaveapply.FromDate, leaveapply.LeaveType, year);

                    decimal byValue = 0.5M;
                    bool is_SameAsFrom;
                    decimal sessioncounts = availableLeaveCount / byValue;
                    if (sessioncounts % 2 == 0)
                        is_SameAsFrom = false;
                    else
                        is_SameAsFrom = true;

                    string local_FromSession = string.Empty;
                    string local_ToSession = string.Empty;
                    if (is_SameAsFrom)
                    {

                        if (leaveapply.LeaveFromSession == LeaveSessionConstants.Fullday)
                        {
                            local_ToSession = LeaveSessionConstants.Forenoon;
                            local_FromSession = LeaveSessionConstants.Forenoon;
                        }
                        else
                        {
                            local_FromSession = leaveapply.LeaveFromSession;
                            local_ToSession = leaveapply.LeaveFromSession;
                        }
                    }
                    else
                    {
                        if(leaveapply.LeaveFromSession == LeaveSessionConstants.Fullday)
                        {
                            local_FromSession = LeaveSessionConstants.Forenoon;
                            local_ToSession = LeaveSessionConstants.Afternoon;
                        }
                        else if(leaveapply.LeaveFromSession == LeaveSessionConstants.Forenoon)
                            local_ToSession = LeaveSessionConstants.Afternoon;
                        else if (leaveapply.LeaveFromSession == LeaveSessionConstants.Afternoon)
                            local_ToSession = LeaveSessionConstants.Forenoon;
                    }

                    CreateLeaveDetailsResult = data_contact.CreateLeaveDetails(leaveapply.Employee_Id = id, appliedLeaveCode
                   , appliedLeaveType, leaveTypeID, leaveTypeID, availableLeaveCount, false
                  , local_FromSession, local_ToSession, LeaveID, leaveapply.FromDate, todate);


                    if (is_SameAsFrom && leaveapply.FromDate == todate && local_FromSession != LeaveSessionConstants.Afternoon)
                        local_fromdate = todate.AddDays(0);
                    else
                        local_fromdate = todate.AddDays(1);

                    bool isSameAsFrom;
                    availableLeaveCount = leaveapply.NumberOfDays - availableLeaveCount;
                    decimal session_counts = availableLeaveCount / byValue;
                    if (session_counts % 2 == 0)
                        isSameAsFrom = false;
                    else
                        isSameAsFrom = true;

                    if (local_ToSession == LeaveSessionConstants.Afternoon)
                        local_FromSession = LeaveSessionConstants.Forenoon;
                    else if (local_ToSession == LeaveSessionConstants.Forenoon)
                        local_FromSession = LeaveSessionConstants.Afternoon;
                    if (isSameAsFrom)
                    {
                        local_ToSession = local_FromSession;
                    }
                    else
                    {
                        if (local_FromSession == LeaveSessionConstants.Forenoon)
                            local_ToSession = LeaveSessionConstants.Afternoon;
                        else if (local_FromSession == LeaveSessionConstants.Afternoon)
                            local_ToSession = LeaveSessionConstants.Forenoon;
                    }


                    Int64 toBalance = Convert.ToInt64(Math.Ceiling(availableLeaveCount));
                    if (local_fromdate.DayOfWeek == DayOfWeek.Saturday)
                    {
                        local_fromdate = local_fromdate.AddDays(1);
                    }
                    if (local_fromdate.DayOfWeek == DayOfWeek.Sunday)
                    {
                        local_fromdate = local_fromdate.AddDays(1);
                    }
                    local_todate = getfromandtodate(toBalance, local_fromdate, leaveapply.LeaveType, year);
                    
                    if (availableLeaveCount != 0)
                        CreateLeaveDetailsResult = data_contact.CreateLeaveDetails(leaveapply.Employee_Id = id, appliedLeaveCode
                       , appliedLeaveType, leaveTypeID, leaveTypeID, availableLeaveCount, true
                      , local_FromSession, local_ToSession, LeaveID, local_fromdate, leaveapply.ToDate);
                }
                //result = RestrictEmployeeLeaves(leaveapply);
                //if (result == 1)
                //{
                //    MTSHRDataLayer.EmployeeLeave data_dates = new MTSHRDataLayer.EmployeeLeave();
                //    var employeeLeaves = GetLeaveBalance();
                //    string data = employeeLeaves.Data.ToString();
                //    DataTable dt = JsonConvert.DeserializeObject<DataTable>(data);
                //    decimal leastNumberofDays = Convert.ToDecimal(0.5);
                //    DataRow dr = dt.AsEnumerable().Where(r => r.Field<string>("Leavetype").ToLower() == "earned").FirstOrDefault();
                //    decimal earnedLeaveBalance = Convert.ToDecimal(dr.ItemArray[4]);
                //    string leaveTypeName = data_dates.READLEAVETYPENAME(leaveapply.LeaveType);
                //    leaveTypeName = leaveTypeName.ToLower();
                //    if (leaveTypeName == "sick")
                //    { 
                //        //changed by NITHYA - START
                //        Int64 leaveTypeID = 0;
                //        string leaveType = "";
                //        decimal availableLeaveBalance = 0;
                //        for (int i = 0; i < dt.Rows.Count; i++)
                //        {
                //            leaveTypeID = Convert.ToInt64(dt.Rows[i]["LeaveTypeId"]);
                //            leaveType = dt.Rows[i]["Leavetype"].ToString();
                //            availableLeaveBalance = Convert.ToDecimal(dt.Rows[i]["Leavebalance"]);
                //            leaveType = leaveType.ToLower();
                //            if (leaveTypeID == leaveapply.LeaveType)
                //                break;
                //        }
                //        if(leaveTypeID != 0 && leaveType != "")
                //        {
                //            if (leaveTypeID == leaveapply.LeaveType)
                //            {
                //                decimal availableDays = availableLeaveBalance - leaveapply.NumberOfDays;
                //                decimal earnedLeaveNoOfDays = leaveapply.NumberOfDays - availableLeaveBalance;
                //                if (availableDays >= 0)
                //                {
                //                    result = InsertLeaveDetails(leaveapply, id, leaveapply.LeaveType, leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate, leaveapply.LeaveToSession, leaveapply.NumberOfDays);
                //                }
                //                else if (availableLeaveBalance == 0 && earnedLeaveBalance > 0 && leaveType == "sick")
                //                {
                //                    result = InsertLeaveDetails(leaveapply, id, LeaveConstants.EarnedLeave, leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate, leaveapply.LeaveToSession, leaveapply.NumberOfDays);
                //                }
                //                else if (availableDays <= 0 && earnedLeaveBalance <= 0)
                //                {
                //                    result = InsertLeaveDetails(leaveapply, id, leaveapply.LeaveType, leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate, leaveapply.LeaveToSession, leaveapply.NumberOfDays);
                //                }
                //                else if (availableLeaveBalance <= 0 && earnedLeaveBalance == 0 && leaveType == "sick")
                //                {
                //                    result = InsertLeaveDetails(leaveapply, id, leaveapply.LeaveType, leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate, leaveapply.LeaveToSession, leaveapply.NumberOfDays);
                //                }
                //                else if (leaveType == "sick" && availableDays < 0 && earnedLeaveBalance > 0)
                //                {
                //                    //decimal totalAvailableleave = leaveapply.NumberOfDays * Convert.ToDecimal(availableLeaveBalance);
                //                    if (leaveapply.LeaveFromSession == LeaveSessionConstants.Afternoon)
                //                    {
                //                        if (availableLeaveBalance == Convert.ToDecimal(0.5))
                //                        {
                //                            //For Sick Leave 
                //                            result = InsertLeaveDetails(leaveapply, id, leaveapply.LeaveType, leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.FromDate, leaveapply.LeaveFromSession, leastNumberofDays);
                //                        }
                //                        else
                //                        {
                //                            //For Sick Leave 
                //                            Int64 _sickLeaveDays = Convert.ToInt64(Math.Ceiling(availableLeaveBalance));
                //                            DateTime sickLeaveToDate = leaveapply.FromDate.AddDays(_sickLeaveDays);
                //                            result = InsertLeaveDetails(leaveapply, id, leaveapply.LeaveType, leaveapply.FromDate, leaveapply.LeaveFromSession, sickLeaveToDate, LeaveSessionConstants.Fullday, _sickLeaveDays);
                //                        }
                //                        //For Earned Leave 
                //                        if (earnedLeaveNoOfDays == Convert.ToDecimal(0.5))
                //                        {
                //                            result = InsertLeaveDetails(leaveapply, id, LeaveConstants.EarnedLeave, leaveapply.ToDate, leaveapply.LeaveToSession, leaveapply.ToDate, leaveapply.LeaveToSession, leastNumberofDays);
                //                        }
                //                        else
                //                        {
                //                            DateTime earnedLeaveFromDate = leaveapply.FromDate.AddDays(1);
                //                            result = InsertLeaveDetails(leaveapply, id, LeaveConstants.EarnedLeave, earnedLeaveFromDate, LeaveSessionConstants.Fullday, leaveapply.ToDate, leaveapply.LeaveToSession, earnedLeaveNoOfDays);
                //                        }
                //                    }
                //                    else
                //                    {
                //                        string _availableDays = availableLeaveBalance.ToString();
                //                        //_availableDays = _availableDays.Replace(".", "");
                //                        if (!_availableDays.Contains('.'))
                //                        {
                //                            //sickleave
                //                            Int64 _sickLeaveDays = Convert.ToInt64(Math.Ceiling(availableLeaveBalance));
                //                            DateTime sickLeaveToDate = leaveapply.FromDate.AddDays(_sickLeaveDays - 1);
                //                            result = InsertLeaveDetails(leaveapply, id, leaveapply.LeaveType, leaveapply.FromDate, leaveapply.LeaveFromSession, sickLeaveToDate, LeaveSessionConstants.Fullday, availableLeaveBalance);


                //                            //earned leave
                //                            DateTime earnedLeaveFromDate = earnedLeaveStartDate.AddDays(1);//leaveapply.FromDate.AddDays(_sickLeaveDays);
                //                            result = InsertLeaveDetails(leaveapply, id, LeaveConstants.EarnedLeave, earnedLeaveFromDate, LeaveSessionConstants.Fullday, leaveapply.ToDate, leaveapply.LeaveToSession, earnedLeaveNoOfDays);
                //                        }
                //                        else
                //                        {
                //                            if (_availableDays == "0.5")
                //                            {
                //                                result = InsertLeaveDetails(leaveapply, id, leaveapply.LeaveType, leaveapply.FromDate, LeaveSessionConstants.Forenoon, leaveapply.FromDate, LeaveSessionConstants.Forenoon, availableLeaveBalance);

                //                                if (earnedLeaveNoOfDays == Convert.ToDecimal(0.5))
                //                                {
                //                                    result = InsertLeaveDetails(leaveapply, id, LeaveConstants.EarnedLeave, leaveapply.FromDate, LeaveSessionConstants.Afternoon, leaveapply.ToDate, LeaveSessionConstants.Afternoon, earnedLeaveNoOfDays);
                //                                }
                //                                else
                //                                {
                //                                    result = InsertLeaveDetails(leaveapply, id, LeaveConstants.EarnedLeave, leaveapply.FromDate, LeaveSessionConstants.Afternoon, leaveapply.ToDate, leaveapply.LeaveToSession, earnedLeaveNoOfDays);
                //                                }
                //                            }
                //                            else
                //                            {
                //                                //sickleave
                //                                Int64 _sickLeaveDays = Convert.ToInt64(Math.Ceiling(availableLeaveBalance));
                //                                DateTime sickLeaveToDate = leaveapply.FromDate.AddDays(_sickLeaveDays - 1);
                //                                result = InsertLeaveDetails(leaveapply, id, leaveapply.LeaveType, leaveapply.FromDate, leaveapply.LeaveFromSession, sickLeaveToDate, LeaveSessionConstants.Fullday, availableLeaveBalance);

                //                                //earned leave
                //                                DateTime earnedLeaveFromDate = earnedLeaveStartDate.AddDays(1);//leaveapply.FromDate.AddDays(_sickLeaveDays);
                //                                result = InsertLeaveDetails(leaveapply, id, LeaveConstants.EarnedLeave, earnedLeaveFromDate, LeaveSessionConstants.Fullday, leaveapply.ToDate, leaveapply.LeaveToSession, earnedLeaveNoOfDays);
                //                            }
                //                        }
                //                    }
                //                }
                //            }
                //            else
                //            {
                //                result = 0;
                //            }

                //        }
                //        //}
                //        //changed by NITHYA - END
                //    }
                //    else
                //    {
                //        result = InsertLeaveDetails(leaveapply, id, leaveapply.LeaveType, leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate, leaveapply.LeaveToSession, leaveapply.NumberOfDays);
                //    }
                //}
                //else if (result == 2)
                //{

                //}
                //else
                //{
                //    result = data_contact.Create(leaveapply.Employee_Id = id, leaveapply.LeaveType
                //        , leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate
                //        , leaveapply.LeaveToSession, leaveapply.Reason, leaveapply.Managerid, leaveapply.NumberOfDays, false);
                //}
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new
            {
                success = CreateLeave
            });
        }

        [HttpPost]
        public JsonResult getLeaveAdjustment(MTSINHR.Models.Leave leaveapply)
        {
            string empid = Session["UserID"].ToString();
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            Int64 id = Convert.ToInt64(empid);
            Int64 leaveTypeID = 0;
            decimal availableLeaveCount = 0;
            decimal leavebalance = 0;
            decimal leavetaken = 0;
            string result = string.Empty;
            string msg = string.Empty;
            int k = 1;
            int year = leaveapply.FromDate.Year;
            var MTSLeavePolicy = data_contact.GetMTSLeavePolicyLeaveType(empid, leaveapply.LeaveType, year);
            try
            {
                if (MTSLeavePolicy.Tables[0].Rows.Count > 0)
                {
                    string adjustment_leave_against = (MTSLeavePolicy.Tables[0].Rows[0]["ADJUSTMENT_LEAVE_AGAINST"]).ToString();

                    var EmployeeLeaveList = data_contact.GetEmployeeLeaveDetails(empid, false, year);
                    if (EmployeeLeaveList.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < EmployeeLeaveList.Tables[0].Rows.Count; i++)
                        {
                            leaveTypeID = Convert.ToInt64(EmployeeLeaveList.Tables[0].Rows[i]["LeaveTypeId"]);
                            if (leaveTypeID == leaveapply.LeaveType)
                            {
                                availableLeaveCount = Convert.ToDecimal(EmployeeLeaveList.Tables[0].Rows[i]["AvailableLeave"]);
                                break;
                            }
                        }
                    }

                    if (adjustment_leave_against.Trim() == "")
                    {
                        decimal lopCount = leaveapply.NumberOfDays - availableLeaveCount;

                        msg = "Leave Applied " + leaveapply.NumberOfDays + " Day(s), Balance available " + availableLeaveCount + " Day(s), Loss Of Pay " + lopCount + " Day(s)";
                    }
                    else
                    {
                        string data = string.Empty;
                        dynamic leavcount = leaveapply.NumberOfDays;
                        string[] ADJUSTMENT_LEAVE_AGAINST;
                        ADJUSTMENT_LEAVE_AGAINST = adjustment_leave_against.Split(',');
                        leavcount = leaveapply.NumberOfDays - availableLeaveCount;
                        leavebalance = leaveapply.NumberOfDays - availableLeaveCount;

                        foreach (var item in ADJUSTMENT_LEAVE_AGAINST)
                        {
                            string leaveCode = string.Empty;
                            string leaveType = string.Empty;
                            string leavecode = string.Empty;
                            decimal availableLeave;
                            if (leavcount > 0)
                            {
                                for (int n = 0; n < EmployeeLeaveList.Tables[0].Rows.Count; n++)
                                {
                                    leavecode = EmployeeLeaveList.Tables[0].Rows[n]["LEAVE_CODE"].ToString();
                                    availableLeave = Convert.ToDecimal(EmployeeLeaveList.Tables[0].Rows[n]["AvailableLeave"]);
                                    if (leavecode.ToLower() == item.ToLower() && leavcount > 0)
                                    {
                                        leaveCode = EmployeeLeaveList.Tables[0].Rows[n]["LEAVE_CODE"].ToString();
                                        leaveType = EmployeeLeaveList.Tables[0].Rows[n]["LEAVE_TYPE"].ToString();

                                        if (availableLeave > 0 && leavcount > 0)
                                        {
                                            if (availableLeave > leavcount)
                                            {
                                                //leavetaken = availableLeave - leavcount;
                                                leavebalance = 0;
                                                if (k == 1)
                                                {
                                                    data += ", Leave Adjusted Against " + leaveType + ' ' + leavcount + " Day(s) ";
                                                    k++;
                                                }
                                                else
                                                    data += ", " + leaveType + ' ' + leavcount;
                                                leavcount = 0;
                                                break;
                                            }
                                            else
                                            {
                                                leavebalance = leavcount - availableLeave;
                                                leavcount = leavebalance;
                                                if (k == 1)
                                                {
                                                    data += ", Leave Adjusted Against " + leaveType + ' ' + availableLeave + " Day(s) ";
                                                    k++;
                                                }
                                                else
                                                    data += ", " + leaveType + ' ' + availableLeave;

                                            }
                                            //leavcount += availableLeave;
                                        };
                                        break;
                                    }
                                }
                            }
                            else
                            {
                                break;
                            }
                        }
                        
                        if (leavcount != 0)
                        {
                            //leavebalance = leaveapply.NumberOfDays - availableLeaveCount - leavcount;
                            if (leavebalance == 0)
                                msg = "Leave Applied " + leaveapply.NumberOfDays + " Day(s), Balance available " + availableLeaveCount + " Day(s) " + data;
                            else
                                msg = "Leave Applied " + leaveapply.NumberOfDays + " Day(s), Balance available " + availableLeaveCount + " Day(s) " + data + ", Loss Of Pay " + leavebalance + " Day(s)";
                        }
                        else
                            msg = "Leave Applied " + leaveapply.NumberOfDays + " Day(s), Balance available " + availableLeaveCount + " Day(s) " + data;
                    }
                }
                else
                {
                    msg = "Leave Applied " + leaveapply.NumberOfDays + " Day(s), Balance available " + availableLeaveCount + " Day(s) " + ", Loss Of Pay " + leaveapply.NumberOfDays + " Day(s)";
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new
            {
                message = msg
            });
        }

        public string ValidateLeaveRestriction(string leave_cannot_taken_together, MTSINHR.Models.Leave leaveapply, Int64 id)
        {
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            string[] LEAVE_CANNOT_TAKE_TOGETHER;
            LEAVE_CANNOT_TAKE_TOGETHER = leave_cannot_taken_together.Split(',');
            string empid = Session["UserID"].ToString();
            int year = leaveapply.FromDate.Year;
            var EmployeeLeaveList = data_contact.GetEmployeeLeaveDetails(empid, false, year);

            foreach (var item in LEAVE_CANNOT_TAKE_TOGETHER)
            {
                for (int i = 0; i < EmployeeLeaveList.Tables[0].Rows.Count; i++)
                {
                    string leaveCode = EmployeeLeaveList.Tables[0].Rows[i]["LEAVE_CODE"].ToString();
                    Int64 leaveTypeid = Convert.ToInt64(EmployeeLeaveList.Tables[0].Rows[i]["LeaveTypeId"]);
                    string leaveType = EmployeeLeaveList.Tables[0].Rows[i]["LEAVE_TYPE"].ToString();
                    if (leaveCode.ToLower() == item.ToLower())
                    {

                        var EmployeeListBWDate = data_contact.GetEmployeeListBWDate(leaveapply.FromDate, leaveapply.ToDate, id, leaveTypeid);
                        if (EmployeeListBWDate.Tables[0].Rows.Count > 0)
                        {
                            return "Leave cannot be taken together with " + leaveType;
                        }
                        DateTime beforeFromDate = leaveapply.FromDate.AddDays(-1);
                        DateTime beforeToDate = leaveapply.ToDate.AddDays(-1);
                        var EmployeeListBWBDate = data_contact.GetEmployeeListBWDate(beforeFromDate, beforeToDate, id, leaveTypeid);
                        if (EmployeeListBWBDate.Tables[0].Rows.Count > 0)
                        {
                            return "Leave cannot be taken together with " + leaveType;
                        }
                        DateTime afterFromDate = leaveapply.FromDate.AddDays(1);
                        DateTime afterToDate = leaveapply.ToDate.AddDays(1);
                        var EmployeeListBWADate = data_contact.GetEmployeeListBWDate(afterFromDate, afterToDate, id, leaveTypeid);
                        if (EmployeeListBWADate.Tables[0].Rows.Count > 0)
                        {
                            return "Leave cannot be taken together with " + leaveType;
                        }
                    }
                }
            }
            return string.Empty;
        }
        public DateTime getfromandtodate(Int64 addDays, DateTime fromDate, Int64 leaveType, int year)
        {
            DateTime toDate = new DateTime();
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            for (int a = 0; a < addDays; a++)
            {
                if (a == 0)
                    toDate = fromDate.AddDays(0);
                else
                    toDate = toDate.AddDays(1);
                if (toDate.DayOfWeek == DayOfWeek.Saturday)
                {
                    toDate = toDate.AddDays(1);
                }
                if (toDate.DayOfWeek == DayOfWeek.Sunday)
                {
                    toDate = toDate.AddDays(1);
                }
            }

            var EmployeeHolidayList = data_contact.GetEmployeeLeaveDetailsBetweenYears(leaveType, fromDate, toDate, year);

            if (EmployeeHolidayList.Tables[0].Rows.Count > 0)
            {
                for (int i = 0; i < EmployeeHolidayList.Tables[0].Rows.Count; i++)
                {
                    //if (EmployeeHolidayList.Tables[0].Rows[i]["DateOfHoliday"].ToString() == toDate.ToString())
                    //{
                        toDate = toDate.AddDays(1);
                        if (toDate.DayOfWeek == DayOfWeek.Saturday)
                        {
                            toDate = toDate.AddDays(1);
                        }
                        if (toDate.DayOfWeek == DayOfWeek.Sunday)
                        {
                            toDate = toDate.AddDays(1);
                        }
                    //}
                }
            }
            return toDate;
        }

        [HttpPost]
        public JsonResult validateLeave(MTSINHR.Models.Leave leaveapply)
        {
            string empid = Session["UserID"].ToString();
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            Int64 id = Convert.ToInt64(empid);
            string department = Session["DepartmentId"].ToString();
            Int64 departmentid = Convert.ToInt64(department);
            Int64 appliedLeaveTypeID = 0;
            decimal availableLeaveCount = 0;
            string appliedLeaveType = string.Empty;
            string appliedLeaveCode = string.Empty;
            Int64 CreateLeaveResult = 0;
            var CreateLeaveDetailsResult = 0;
            int year = leaveapply.FromDate.Year;
            int currentYear = DateTime.Now.Year;
            try
            {
                var EmployeeListBWDateWtihoutLT = data_contact.GetEmployeeListBWDateWithoutLeaveType(leaveapply.FromDate, leaveapply.ToDate, leaveapply.LeaveFromSession, leaveapply.LeaveToSession, id);
                if (EmployeeListBWDateWtihoutLT.Tables[0].Rows.Count > 0)
                {
                    return Json(new
                    {
                        success = 0,
                        message = "Leave applied or pending on same Date(s)"
                    });
                }

                var MTSLeavePolicy = data_contact.GetMTSLeavePolicyLeaveType(empid, leaveapply.LeaveType, year);                

                if (MTSLeavePolicy.Tables[0].Rows.Count > 0)
                {
                    //int currentYear = DateTime.Now.Year;
                    bool accural = Convert.ToBoolean(MTSLeavePolicy.Tables[0].Rows[0]["ACCURAL"]);
                    //if (year < currentYear && accural == true)
                    //{
                    //    year--;
                    //    MTSLeavePolicy = data_contact.GetMTSLeavePolicyLeaveType(empid, leaveapply.LeaveType, year);
                    //}
                    var EmployeeLeaveList = data_contact.GetEmployeeLeaveDetails(empid, false, year);
                    if (EmployeeLeaveList.Tables[0].Rows.Count > 0)
                    {
                        for (int i = 0; i < EmployeeLeaveList.Tables[0].Rows.Count; i++)
                        {
                            appliedLeaveTypeID = Convert.ToInt64(EmployeeLeaveList.Tables[0].Rows[i]["LeaveTypeId"]);
                            if (appliedLeaveTypeID == leaveapply.LeaveType)
                            {
                                availableLeaveCount = Convert.ToDecimal(EmployeeLeaveList.Tables[0].Rows[i]["AvailableLeave"]);
                                appliedLeaveType = (EmployeeLeaveList.Tables[0].Rows[i]["LEAVE_TYPE"]).ToString();
                                appliedLeaveCode = (EmployeeLeaveList.Tables[0].Rows[i]["LEAVE_CODE"]).ToString();
                                break;
                            }
                        }
                    }

                    Int64 CONSECUTIVE_LEAVES = Convert.ToInt64(MTSLeavePolicy.Tables[0].Rows[0]["CONSECUTIVE_LEAVES"]);
                    string adjustment_leave_against = (MTSLeavePolicy.Tables[0].Rows[0]["ADJUSTMENT_LEAVE_AGAINST"]).ToString();
                    string leave_cannot_taken_together = (MTSLeavePolicy.Tables[0].Rows[0]["LEAVE_CANNOT_TAKE_TOGETHER"]).ToString();
                    if (CONSECUTIVE_LEAVES == 0 || CONSECUTIVE_LEAVES >= leaveapply.NumberOfDays)
                    {
                        if (availableLeaveCount >= leaveapply.NumberOfDays)
                        {
                            string resMsg = "Applied Failed";
                            //leaveCredit
                            if (leave_cannot_taken_together.Trim() != "")
                            {
                                string response = ValidateLeaveRestriction(leave_cannot_taken_together, leaveapply, id);
                                if (response != string.Empty)
                                {
                                    return Json(new
                                    {
                                        success = 0,
                                        message = response
                                    });
                                }
                                CreateLeaveResult = data_contact.Create(leaveapply.Employee_Id = id, leaveapply.LeaveType
                                   , leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate
                                   , leaveapply.LeaveToSession, leaveapply.Reason, leaveapply.Managerid, leaveapply.NumberOfDays, false, leaveapply.LeaveType, false);


                                if (CreateLeaveResult > 0)
                                {
                                    resMsg = string.Empty;
                                    resMsg = "successfully Applied";
                                }
                                return Json(new
                                {
                                    success = 1, //success value 1 it returns 1
                                    message = resMsg
                                });
                            }
                            else
                            {
                                CreateLeaveResult = data_contact.Create(leaveapply.Employee_Id = id, leaveapply.LeaveType
                                    , leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate
                                    , leaveapply.LeaveToSession, leaveapply.Reason, leaveapply.Managerid, leaveapply.NumberOfDays, false, leaveapply.LeaveType, false);

                                if (CreateLeaveResult == 1)
                                {
                                    resMsg = string.Empty;
                                    resMsg = "successfully Applied";
                                }
                                return Json(new
                                {
                                    success = 1, //success value 1 it returns 1
                                    message = resMsg
                                });
                            }
                        }
                        else
                        {
                            if (adjustment_leave_against.Trim() == "")
                            {
                                return Json(new
                                {
                                    success = 3,
                                    message = "Your available leave " + availableLeaveCount + " Day(s), Applied leave " + leaveapply.NumberOfDays + " Day(s).Proceed leave with LOP?"

                                });
                            }
                            else
                            {
                                if (adjustment_leave_against.Trim() != "")
                                {
                                    decimal leavebalancetoapplay = 0;
                                    leavebalancetoapplay = leaveapply.NumberOfDays;
                                    var regex = new System.Text.RegularExpressions.Regex("(?<=[\\.])[0-9]+");

                                    string[] ADJUSTMENT_LEAVE_AGAINST;
                                    ADJUSTMENT_LEAVE_AGAINST = adjustment_leave_against.Split(',');

                                    string local_fromsession = LeaveSessionConstants.Fullday;
                                    string local_tosession = LeaveSessionConstants.Fullday;
                                    string from_session = string.Empty;
                                    string to_session = string.Empty;

                                    if (leave_cannot_taken_together.Trim() != "")
                                    {
                                        string response = ValidateLeaveRestriction(leave_cannot_taken_together, leaveapply, id);
                                        if (response != string.Empty)
                                        {
                                            return Json(new
                                            {
                                                success = 0,
                                                message = response
                                            });
                                        }
                                    }

                                    if (availableLeaveCount >= leaveapply.NumberOfDays)
                                    {
                                        CreateLeaveResult = data_contact.Create(leaveapply.Employee_Id = id, leaveapply.LeaveType
                                            , leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate
                                            , leaveapply.LeaveToSession, leaveapply.Reason, leaveapply.Managerid, availableLeaveCount, false, leaveapply.LeaveType, false);

                                        leavebalancetoapplay = 0;
                                    }


                                    else if (availableLeaveCount < leaveapply.NumberOfDays)
                                    {
                                        CreateLeaveResult = data_contact.Create(leaveapply.Employee_Id = id, leaveapply.LeaveType
                                            , leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate
                                            , leaveapply.LeaveToSession, leaveapply.Reason, leaveapply.Managerid, leaveapply.NumberOfDays, false, leaveapply.LeaveType, true);

                                        if (CreateLeaveResult == 0)
                                        {
                                            return Json(new
                                            {
                                                success = 0,
                                                message = "Leave applied or pending on same Date(s)"
                                            });
                                        }

                                        //if(CreateLeaveResult == 1)
                                        //{
                                        List<leaveAdjustTo> _leaveAdjustToList = new List<leaveAdjustTo>();
                                        if (CreateLeaveResult != 0)
                                        {
                                            Int64 LeaveID =  CreateLeaveResult;
                                            string data = string.Empty;
                                            string msg = string.Empty;
                                            dynamic leavcount = leaveapply.NumberOfDays;
                                            decimal leavebalance = 0;
                                            leavcount = leaveapply.NumberOfDays - availableLeaveCount;
                                            leavebalance = leaveapply.NumberOfDays - availableLeaveCount;
                                            int assignfromseccion = 0;
                                            decimal appliedLeaveCount = 0;
                                            if (availableLeaveCount > 0)
                                            {
                                                bool isSameAsFrom;
                                                decimal byValue = 0.5M;
                                                decimal sessioncounts = availableLeaveCount / byValue;
                                                if (sessioncounts % 2 == 0)
                                                    isSameAsFrom = false;
                                                else
                                                    isSameAsFrom = true;
                                                leaveAdjustTo _leaveAdjustTo = new leaveAdjustTo();
                                                _leaveAdjustTo.leaveCode = appliedLeaveCode;
                                                _leaveAdjustTo.leaveName = appliedLeaveType;
                                                _leaveAdjustTo.availableLeaveCount = availableLeaveCount;
                                                _leaveAdjustTo.leaveTypeId = appliedLeaveTypeID;
                                                _leaveAdjustTo.isLOP = false;
                                                _leaveAdjustTo.appliedLeaveTypeID = appliedLeaveTypeID;
                                                _leaveAdjustTo.LeaveID = LeaveID;

                                                if (assignfromseccion == 0)
                                                {
                                                    if (leaveapply.LeaveFromSession == LeaveSessionConstants.Fullday)
                                                        _leaveAdjustTo.fromSession = LeaveSessionConstants.Forenoon;
                                                    else
                                                        _leaveAdjustTo.fromSession = LeaveSessionConstants.Afternoon;
                                                }

                                                if (isSameAsFrom)
                                                {
                                                    _leaveAdjustTo.toSession = _leaveAdjustTo.fromSession;
                                                }
                                                else
                                                {
                                                    if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Forenoon)
                                                        _leaveAdjustTo.toSession = LeaveSessionConstants.Afternoon;
                                                    else if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Afternoon)
                                                        _leaveAdjustTo.toSession = LeaveSessionConstants.Forenoon;
                                                }

                                                _leaveAdjustTo.fromDate = leaveapply.FromDate;
                                                Int64 aBalance = Convert.ToInt64(Math.Ceiling(availableLeaveCount));
                                                if(_leaveAdjustTo.availableLeaveCount < 1)
                                                {
                                                    _leaveAdjustTo.toDate = _leaveAdjustTo.fromDate;
                                                }
                                                else
                                                {
                                                    _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                }

                                                _leaveAdjustToList.Add(_leaveAdjustTo);
                                                assignfromseccion++;
                                                leavebalancetoapplay = leavebalancetoapplay - availableLeaveCount;
                                                appliedLeaveCount = availableLeaveCount;
                                            }
                                            foreach (var item in ADJUSTMENT_LEAVE_AGAINST)
                                            {
                                                string leaveCode = string.Empty;
                                                string leaveType = string.Empty;
                                                string leavecode = string.Empty;
                                                decimal availableLeave;
                                                Int64 leave_TypeId = 0;
                                                if (leavcount > 0)
                                                {
                                                    for (int n = 0; n < EmployeeLeaveList.Tables[0].Rows.Count; n++)
                                                    {
                                                        leavecode = EmployeeLeaveList.Tables[0].Rows[n]["LEAVE_CODE"].ToString();
                                                        availableLeave = Convert.ToDecimal(EmployeeLeaveList.Tables[0].Rows[n]["AvailableLeave"]);
                                                        leave_TypeId = Convert.ToInt64(EmployeeLeaveList.Tables[0].Rows[n]["LeaveTypeId"]);
                                                        if (leavecode.ToLower() == item.ToLower() && leavcount > 0)
                                                        {
                                                            leaveCode = EmployeeLeaveList.Tables[0].Rows[n]["LEAVE_CODE"].ToString();
                                                            leaveType = EmployeeLeaveList.Tables[0].Rows[n]["LEAVE_TYPE"].ToString();

                                                            if (availableLeave > 0 && leavcount > 0)
                                                            {
                                                                //var MTS_LeaveType_ID = data_contact.Get_MTS_LeaveType_ID(leaveCode, departmentid);

                                                                int last_Index = 0;
                                                                if(_leaveAdjustToList != null)
                                                                {
                                                                    if (_leaveAdjustToList.Count > 0)
                                                                        last_Index = _leaveAdjustToList.Count - 1;
                                                                }

                                                                if (availableLeave > leavcount)
                                                                {
                                                                    bool isSameAsFrom;
                                                                    decimal sessioncount = leavcount / 0.5M;
                                                                    if (sessioncount % 2 == 0)
                                                                        isSameAsFrom = false;
                                                                    else
                                                                        isSameAsFrom = true;

                                                                    leaveAdjustTo _leaveAdjustTo = new leaveAdjustTo();
                                                                    _leaveAdjustTo.leaveCode = leaveCode;
                                                                    _leaveAdjustTo.leaveName = leaveType;
                                                                    _leaveAdjustTo.availableLeaveCount = leavcount;
                                                                    //if (MTS_LeaveType_ID.Tables[0].Rows.Count > 0)
                                                                    //    _leaveAdjustTo.leaveTypeId = Convert.ToInt64(MTS_LeaveType_ID.Tables[0].Rows[0]["id"]);
                                                                    //else
                                                                    _leaveAdjustTo.leaveTypeId = leave_TypeId;
                                                                    _leaveAdjustTo.isLOP = false;
                                                                    _leaveAdjustTo.appliedLeaveTypeID = appliedLeaveTypeID;
                                                                    _leaveAdjustTo.LeaveID = LeaveID;


                                                                    if (assignfromseccion == 0)
                                                                    {
                                                                        if (leaveapply.LeaveFromSession == LeaveSessionConstants.Fullday)
                                                                            _leaveAdjustTo.fromSession = LeaveSessionConstants.Forenoon;
                                                                        else
                                                                            _leaveAdjustTo.fromSession = LeaveSessionConstants.Afternoon;
                                                                    }
                                                                    else
                                                                    {
                                                                        if (_leaveAdjustToList.Count > 0)
                                                                        {
                                                                            if (_leaveAdjustToList[last_Index].toSession == LeaveSessionConstants.Forenoon)
                                                                                _leaveAdjustTo.fromSession = LeaveSessionConstants.Afternoon;
                                                                            else
                                                                                _leaveAdjustTo.fromSession = LeaveSessionConstants.Forenoon;
                                                                        }
                                                                    }


                                                                    if (isSameAsFrom)
                                                                    {
                                                                        _leaveAdjustTo.toSession = _leaveAdjustTo.fromSession;
                                                                    }
                                                                    else
                                                                    {
                                                                        if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Forenoon)
                                                                            _leaveAdjustTo.toSession = LeaveSessionConstants.Afternoon;
                                                                        else if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Afternoon)
                                                                            _leaveAdjustTo.toSession = LeaveSessionConstants.Forenoon;
                                                                    }

                                                                    if(_leaveAdjustToList != null)
                                                                    {
                                                                        if (_leaveAdjustToList.Count > 0)
                                                                        {
                                                                            string to__session = _leaveAdjustToList[last_Index].toSession;
                                                                            decimal availav_LeaveCount = appliedLeaveCount;
                                                                            string decimal_places = regex.Match(availav_LeaveCount.ToString()).Value;
                                                                            if (to__session == "2" && (decimal_places == "5" || decimal_places == "50") && _leaveAdjustToList[last_Index].availableLeaveCount < 1)
                                                                            {
                                                                                _leaveAdjustTo.fromDate = _leaveAdjustToList[last_Index].toDate;
                                                                                _leaveAdjustTo.toDate = _leaveAdjustToList[last_Index].toDate;
                                                                            }
                                                                            else
                                                                            {
                                                                                if (to__session == "2" && (decimal_places == "5" || decimal_places == "50"))
                                                                                {
                                                                                    _leaveAdjustTo.fromDate = _leaveAdjustToList[last_Index].toDate;
                                                                                    Int64 aBalance = Convert.ToInt64(Math.Ceiling(_leaveAdjustTo.availableLeaveCount));
                                                                                    string decimal_place = regex.Match(_leaveAdjustTo.availableLeaveCount.ToString()).Value;
                                                                                    if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Afternoon && leavebalance >= 1.0M && (decimal_place != "5" || decimal_place != "50"))
                                                                                    {
                                                                                        aBalance++;
                                                                                    }
                                                                                    _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                                                }
                                                                                else
                                                                                {
                                                                                    _leaveAdjustTo.fromDate = _leaveAdjustToList[last_Index].toDate.AddDays(1);
                                                                                    Int64 aBalance = Convert.ToInt64(Math.Ceiling(_leaveAdjustTo.availableLeaveCount));
                                                                                    _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                                                }
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            _leaveAdjustTo.fromDate = leaveapply.FromDate;
                                                                            Int64 aBalance = Convert.ToInt64(Math.Ceiling(_leaveAdjustTo.availableLeaveCount));
                                                                            _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                                        }
                                                                    }
                                                                    else
                                                                    {
                                                                        _leaveAdjustTo.fromDate = leaveapply.FromDate;
                                                                        Int64 aBalance = Convert.ToInt64(Math.Ceiling(_leaveAdjustTo.availableLeaveCount));
                                                                        _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                                    }

                                                                    _leaveAdjustToList.Add(_leaveAdjustTo);
                                                                    leavebalance = 0;
                                                                    //data += leaveType + ' ' + leavcount;
                                                                    leavcount = 0;
                                                                    leavebalancetoapplay = leavebalancetoapplay - leavcount;
                                                                    appliedLeaveCount = appliedLeaveCount + availableLeaveCount;
                                                                    break;
                                                                }
                                                                else
                                                                {

                                                                    bool isSameAsFrom;
                                                                    decimal byValue = 0.5M;
                                                                    decimal sessioncount = availableLeave / byValue;
                                                                    if (sessioncount % 2 == 0)
                                                                        isSameAsFrom = false;
                                                                    else
                                                                        isSameAsFrom = true;

                                                                    leavebalance = leavcount - availableLeave;
                                                                    leavcount = leavebalance;
                                                                    leaveAdjustTo _leaveAdjustTo = new leaveAdjustTo();
                                                                    _leaveAdjustTo.leaveCode = leaveCode;
                                                                    _leaveAdjustTo.leaveName = leaveType;
                                                                    _leaveAdjustTo.availableLeaveCount = availableLeave;
                                                                    _leaveAdjustTo.isLOP = false;
                                                                    //if (MTS_LeaveType_ID.Tables[0].Rows.Count > 0)
                                                                    //    _leaveAdjustTo.leaveTypeId = Convert.ToInt64(MTS_LeaveType_ID.Tables[0].Rows[0]["id"]);
                                                                    //else
                                                                    _leaveAdjustTo.leaveTypeId = leave_TypeId;
                                                                    _leaveAdjustTo.appliedLeaveTypeID = appliedLeaveTypeID;
                                                                    _leaveAdjustTo.LeaveID = LeaveID;

                                                                    if (assignfromseccion == 0)
                                                                    {
                                                                        if (leaveapply.LeaveFromSession == LeaveSessionConstants.Fullday)
                                                                            _leaveAdjustTo.fromSession = LeaveSessionConstants.Forenoon;
                                                                        else
                                                                            _leaveAdjustTo.fromSession = LeaveSessionConstants.Afternoon;
                                                                    }
                                                                    else
                                                                    {
                                                                        if(_leaveAdjustToList != null)
                                                                        {
                                                                            if (_leaveAdjustToList.Count > 0)
                                                                            {
                                                                                if (_leaveAdjustToList[last_Index].toSession == LeaveSessionConstants.Forenoon)
                                                                                    _leaveAdjustTo.fromSession = LeaveSessionConstants.Afternoon;
                                                                                else
                                                                                    _leaveAdjustTo.fromSession = LeaveSessionConstants.Forenoon;
                                                                            }
                                                                        }
                                                                    }


                                                                    if (isSameAsFrom)
                                                                    {
                                                                        _leaveAdjustTo.toSession = _leaveAdjustTo.fromSession;
                                                                    }
                                                                    else
                                                                    {
                                                                        if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Forenoon)
                                                                            _leaveAdjustTo.toSession = LeaveSessionConstants.Afternoon;
                                                                        else if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Afternoon)
                                                                            _leaveAdjustTo.toSession = LeaveSessionConstants.Forenoon;
                                                                    }

                                                                    if(_leaveAdjustToList != null)
                                                                    {
                                                                        if (_leaveAdjustToList.Count > 0)
                                                                        {
                                                                            string to__session = _leaveAdjustToList[last_Index].toSession;
                                                                            decimal availav_LeaveCount = appliedLeaveCount;
                                                                            string decimal_places = regex.Match(availav_LeaveCount.ToString()).Value;
                                                                            if (to__session == "2" && (decimal_places == "5" || decimal_places == "50") && _leaveAdjustTo.availableLeaveCount < 1)
                                                                            {
                                                                                _leaveAdjustTo.fromDate = _leaveAdjustToList[last_Index].toDate;
                                                                                _leaveAdjustTo.toDate = _leaveAdjustToList[last_Index].toDate;
                                                                            }
                                                                            else
                                                                            {
                                                                                if (to__session == "2" && (decimal_places == "5" || decimal_places == "50"))
                                                                                {
                                                                                    _leaveAdjustTo.fromDate = _leaveAdjustToList[last_Index].toDate;
                                                                                    Int64 aBalance = Convert.ToInt64(Math.Ceiling(_leaveAdjustTo.availableLeaveCount));
                                                                                    string decimal_place = regex.Match(_leaveAdjustTo.availableLeaveCount.ToString()).Value;
                                                                                    if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Afternoon && leavebalance >= 1.0M && (decimal_place != "5" || decimal_place != "50"))
                                                                                    {
                                                                                        aBalance++;
                                                                                    }
                                                                                    _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                                                }
                                                                                else
                                                                                {
                                                                                    _leaveAdjustTo.fromDate = _leaveAdjustToList[last_Index].toDate.AddDays(1);
                                                                                    Int64 aBalance = Convert.ToInt64(Math.Ceiling(_leaveAdjustTo.availableLeaveCount));
                                                                                    _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);

                                                                                }
                                                                            }
                                                                        }
                                                                        else
                                                                        {
                                                                            _leaveAdjustTo.fromDate = leaveapply.FromDate;
                                                                            Int64 aBalance = Convert.ToInt64(Math.Ceiling(_leaveAdjustTo.availableLeaveCount));
                                                                            _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                                        }
                                                                    }
                                                                    else
                                                                    {
                                                                        _leaveAdjustTo.fromDate = leaveapply.FromDate;
                                                                        Int64 aBalance = Convert.ToInt64(Math.Ceiling(_leaveAdjustTo.availableLeaveCount));
                                                                        _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                                    }
                                                                    _leaveAdjustToList.Add(_leaveAdjustTo);
                                                                    //data += ", " + leaveType + ' ' + availableLeave;
                                                                    leavebalancetoapplay = leavebalancetoapplay - availableLeave;
                                                                    appliedLeaveCount = appliedLeaveCount + availableLeave;
                                                                }
                                                            };
                                                            break;
                                                        }
                                                    }
                                                }
                                                else
                                                {
                                                    break;
                                                }
                                            }

                                            if (leavcount != 0)
                                            {
                                                if (leavebalance != 0)
                                                {

                                                    int last_Index = 0;
                                                    if(_leaveAdjustToList != null)
                                                    {
                                                        if (_leaveAdjustToList.Count > 0)
                                                            last_Index = _leaveAdjustToList.Count - 1;
                                                    }

                                                    bool isSameAsFrom;
                                                    decimal byValue = 0.5M;
                                                    decimal sessioncount = leavebalance / byValue;
                                                    if (sessioncount % 2 == 0)
                                                        isSameAsFrom = false;
                                                    else
                                                        isSameAsFrom = true;

                                                    leaveAdjustTo _leaveAdjustTo = new leaveAdjustTo();
                                                    _leaveAdjustTo.leaveCode = appliedLeaveCode;
                                                    _leaveAdjustTo.leaveName = appliedLeaveType;
                                                    _leaveAdjustTo.availableLeaveCount = leavebalance;
                                                    _leaveAdjustTo.isLOP = true;
                                                    _leaveAdjustTo.leaveTypeId = appliedLeaveTypeID;
                                                    _leaveAdjustTo.appliedLeaveTypeID = appliedLeaveTypeID;
                                                    _leaveAdjustTo.LeaveID = LeaveID;

                                                    if (assignfromseccion == 0)
                                                    {
                                                        if (leaveapply.LeaveFromSession == LeaveSessionConstants.Fullday)
                                                            _leaveAdjustTo.fromSession = LeaveSessionConstants.Forenoon;
                                                        else
                                                            _leaveAdjustTo.fromSession = LeaveSessionConstants.Afternoon;
                                                    }
                                                    else
                                                    {
                                                        if(_leaveAdjustToList != null)
                                                        {
                                                            if (_leaveAdjustToList.Count > 0)
                                                            {
                                                                if (_leaveAdjustToList[last_Index].toSession == LeaveSessionConstants.Forenoon)
                                                                    _leaveAdjustTo.fromSession = LeaveSessionConstants.Afternoon;
                                                                else
                                                                    _leaveAdjustTo.fromSession = LeaveSessionConstants.Forenoon;
                                                            }
                                                        }
                                                    }

                                                    if (isSameAsFrom)
                                                    {
                                                        _leaveAdjustTo.toSession = _leaveAdjustTo.fromSession;
                                                    }
                                                    else
                                                    {
                                                        if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Forenoon)
                                                            _leaveAdjustTo.toSession = LeaveSessionConstants.Afternoon;
                                                        else if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Afternoon)
                                                            _leaveAdjustTo.toSession = LeaveSessionConstants.Forenoon;
                                                    }
                                                    if(_leaveAdjustToList != null)
                                                    {
                                                        if (_leaveAdjustToList.Count > 0)
                                                        {
                                                            string to__session = _leaveAdjustToList[last_Index].toSession;
                                                            decimal availav_LeaveCount = appliedLeaveCount;
                                                            string decimal_places = regex.Match(availav_LeaveCount.ToString()).Value;
                                                            //if(decimal_places == "5" || decimal_places == "50")
                                                            //{
                                                            //    decimal_Value_Count++;
                                                            //}
                                                            if (to__session == "2" && (decimal_places == "5" || decimal_places == "50") && _leaveAdjustTo.availableLeaveCount < 1)
                                                            {
                                                                _leaveAdjustTo.fromDate = _leaveAdjustToList[last_Index].toDate;
                                                                _leaveAdjustTo.toDate = _leaveAdjustToList[last_Index].toDate;
                                                            }
                                                            else
                                                            {
                                                                if (to__session == "2" && (decimal_places == "5" || decimal_places == "50"))
                                                                {
                                                                    _leaveAdjustTo.fromDate = _leaveAdjustToList[last_Index].toDate;
                                                                    Int64 aBalance = Convert.ToInt64(Math.Ceiling(_leaveAdjustTo.availableLeaveCount));
                                                                    string decimal_place = regex.Match(leavebalance.ToString()).Value;
                                                                    if (_leaveAdjustTo.fromSession == LeaveSessionConstants.Afternoon && leavebalance >= 1.0M && (decimal_place != "5" || decimal_place != "50"))
                                                                    {
                                                                        aBalance++;
                                                                    }
                                                                    _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                                }
                                                                else
                                                                {
                                                                    _leaveAdjustTo.fromDate = _leaveAdjustToList[last_Index].toDate.AddDays(1);
                                                                    Int64 aBalance = Convert.ToInt64(Math.Ceiling(_leaveAdjustTo.availableLeaveCount));
                                                                    _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                                }
                                                            }
                                                        }
                                                        else
                                                        {
                                                            _leaveAdjustTo.fromDate = leaveapply.FromDate;
                                                            _leaveAdjustTo.toDate = leaveapply.ToDate;
                                                        }
                                                    }
                                                    else
                                                    {
                                                        _leaveAdjustTo.fromDate = leaveapply.FromDate;
                                                        _leaveAdjustTo.toDate = leaveapply.ToDate;
                                                    }

                                                    appliedLeaveCount = appliedLeaveCount + _leaveAdjustTo.availableLeaveCount;
                                                    _leaveAdjustToList.Add(_leaveAdjustTo);

                                                    
                                                }
                                            }
                                        }
                                        leavebalancetoapplay = 0;

                                        foreach (leaveAdjustTo item in _leaveAdjustToList)
                                        {
                                            CreateLeaveDetailsResult = data_contact.CreateLeaveDetails(leaveapply.Employee_Id = id, item.leaveCode
                                                , item.leaveName, item.leaveTypeId, item.appliedLeaveTypeID, item.availableLeaveCount, item.isLOP
                                               , item.fromSession, item.toSession, item.LeaveID, item.fromDate, item.toDate);
                                        }

                                        if (leavebalancetoapplay == 0)
                                        {
                                            if(CreateLeaveDetailsResult == 1)
                                            {
                                                return Json(new
                                                {
                                                    success = 2,
                                                    message = "successfully Applied"
                                                });
                                            }
                                        }                                        
                                    }                                    
                                    return Json(new
                                    {
                                        success = 1, //success value 1 it returns 1
                                        message = "successfully Applied"
                                    });
                                }
                            }
                        }
                    }
                    else
                    {
                        return Json(new
                        {
                            success = 0,
                            message = "More than " + CONSECUTIVE_LEAVES + " Consecutive Leave(s) not allowed"
                        });
                    }
                }
                else if (currentYear + 1 == year)
                {
                    CreateLeaveResult = data_contact.Create(leaveapply.Employee_Id = id, leaveapply.LeaveType
                                                   , leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate
                                                   , leaveapply.LeaveToSession, leaveapply.Reason, leaveapply.Managerid, leaveapply.NumberOfDays, false, leaveapply.LeaveType, false);
                    if(CreateLeaveResult > 0)
                    {
                        return Json(new
                        {
                            success = 1, //success value 1 it returns 1
                            message = "successfully Applied"
                        });
                    }
                }
                else
                {
                    return Json(new
                    {
                        success = 0,
                        message = "Leave not available for the year " + year
                    });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new
            {
                success = 0,
                message = "Failed to apply"
            });
        }

        public JsonResult MTSLeavePolicyLeaveType(string empid, Int64 leaveType)
        {
            MTSHRDataLayer.EmployeeLeave data = new MTSHRDataLayer.EmployeeLeave();
            var result = JsonConvert.SerializeObject(data.GetMTSLeavePolicyLeaveType(empid, leaveType));
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult LeaveApplyWithLOP(MTSINHR.Models.Leave leaveapply)
        {
            string empid = Session["UserID"].ToString();
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            Int64 id = Convert.ToInt64(empid);
            Int64 result = 0;
            result = data_contact.Create(leaveapply.Employee_Id = id, leaveapply.LeaveType
                      , leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate
                      , leaveapply.LeaveToSession, leaveapply.Reason, leaveapply.Managerid, leaveapply.NumberOfDays, true, leaveapply.LeaveType, false);

            return Json(new
            {
                success = result
            });
        }

        public int RestrictEmployeeLeaves(MTSINHR.Models.Leave leaveapply)
        {
            string department = Session["DepartmentId"].ToString();
            Int64 departmentid = Convert.ToInt64(department);
            int result = 0;
            string empid = Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(empid);
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            if (ConfigurationManager.AppSettings["BPO_DeptID"].ToString() != department)
            {
                bool holidayDate = false;
                DateTime fromDate = CheckIfPreviousDayOrNextHoliday(leaveapply.FromDate, "-");
                DateTime toDate = CheckIfPreviousDayOrNextHoliday(leaveapply.ToDate, "-");
                DateTime nextDate = CheckIfPreviousDayOrNextHoliday(leaveapply.ToDate, "+");
                result = data_contact.RestrictEmployeeLeaves(empid, departmentid, leaveapply.LeaveType, fromDate, toDate, nextDate);

            }
            else
            {
                result = data_contact.RestrictEmployeeLeaves(empid, departmentid, leaveapply.LeaveType, leaveapply.FromDate.AddDays(-1), leaveapply.ToDate.AddDays(-1), leaveapply.ToDate.AddDays(1));
            }
            return result;

        }

        public Int64 InsertLeaveDetails(MTSINHR.Models.Leave leaveapply, Int64 id, Int64 leaveType, DateTime FromDate, string FromSession, DateTime ToDate, string ToSession, decimal NumberOfDays)
        {

            int keepGoing = 1;
            int count = 0;
            Int64 _leaveDays = Convert.ToInt64(Math.Ceiling(NumberOfDays));
            if (FromSession == LeaveSessionConstants.Afternoon && ToSession == LeaveSessionConstants.Forenoon)
            {
                _leaveDays = _leaveDays + 1;
            }
            decimal leastNumberofDays = Convert.ToDecimal(0.5);
            DateTime fromDate = new DateTime();
            MTSHRDataLayer.EmployeeLeave data_dates = new MTSHRDataLayer.EmployeeLeave();
            string leaveTypeName = data_dates.READLEAVETYPENAME(leaveapply.LeaveType);
            leaveTypeName = leaveTypeName.ToLower();
            DateTime startEndDate = FromDate;
            string tempDay = FromDate.DayOfWeek.ToString();
            string _disabledCalculation = ConfigurationManager.AppSettings["Disabled_LeaveCalculation"].ToString();
            for (int i = 0; i < keepGoing; i++)
            {

                if (!(_disabledCalculation.Contains(leaveTypeName)))
                {
                    DataTable dt = data_dates.GetHolidayDatesList(startEndDate, startEndDate);
                    if (tempDay == "Sunday" || tempDay == "Saturday")
                    {
                        keepGoing = keepGoing + 1;
                    }
                    else if (dt.Rows.Count > 0)
                    {
                        keepGoing = keepGoing + 1;
                    }
                    else
                    {

                        keepGoing = keepGoing + 1;
                        count++;
                        if (count == 1)
                        {
                            fromDate = startEndDate;
                        }
                    }
                }
                else
                {

                    keepGoing = keepGoing + 1;
                    count++;
                    if (count == 1)
                    {
                        fromDate = startEndDate;
                    }
                }

                if (count == _leaveDays)
                {
                    break;
                }
                if (ToSession != "2" || NumberOfDays > leastNumberofDays)
                {
                    startEndDate = startEndDate.AddDays(1);
                    tempDay = startEndDate.DayOfWeek.ToString();
                    earnedLeaveStartDate = startEndDate;
                }
            }
            Int64 result = 0;
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();

            if (leaveType == LeaveConstants.EarnedLeave)
            {
                result = data_contact.Create(leaveapply.Employee_Id = id, leaveType
                    , fromDate, FromSession, ToDate
                    , ToSession, leaveapply.Reason, leaveapply.Managerid, NumberOfDays, false, leaveapply.LeaveType, false);
            }
            else
            {
                result = data_contact.Create(leaveapply.Employee_Id = id, leaveType
                    , FromDate, FromSession, startEndDate
                    , ToSession, leaveapply.Reason, leaveapply.Managerid, NumberOfDays, false, leaveapply.LeaveType, false);
            }


            return result;

        }

        public DateTime CheckIfPreviousDayOrNextHoliday(DateTime _date, string operatorFunction)
        {
            MTSHRDataLayer.EmployeeLeave data_dates = new MTSHRDataLayer.EmployeeLeave();
            int noofDays = 1;
            DateTime leaveDate = new DateTime();
            for (int i = 0; i < noofDays; i++)
            {
                if (operatorFunction == "-")
                {
                    leaveDate = _date.AddDays(-noofDays);
                }
                else
                {
                    leaveDate = _date.AddDays(noofDays);
                }
                //leaveDate = _date.AddDays(-noofDays);
                string leaveDay = leaveDate.DayOfWeek.ToString();
                if (leaveDay == "Sunday" || leaveDay == "Saturday")
                {
                    noofDays = noofDays + 1;
                }
                else
                {
                    DataTable dt = data_dates.GetHolidayDatesList(leaveDate, leaveDate);
                    if (dt.Rows.Count > 0)
                    {
                        noofDays = noofDays + 1;
                    }
                }
            }
            return leaveDate;
        }

        public bool CheckLeaveBalance(Int64 empId, Int64 LeaveType)
        {
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            DataTable dt = data_contact.GetIndividualEmployeeLeaveBalance(empId);
            if (dt.Rows.Count > 0)
            {

            }
            return true;
        }

        [HttpPost]
        public JsonResult LeaveCancel(Int64 id)
        {

            MTSINHR.Models.Leave leavecancel = new Models.Leave();

            string empid = Session["UserID"].ToString();
            Int64 eid = Convert.ToInt64(empid);
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            var result = data_contact.LeaveCancel(id, leavecancel.Approval = 4, leavecancel.Employee_Id = eid);
            return Json(new { success = result });
        }
        
        public JsonResult GetEmployeeLeaveList()
        {
            string empid = Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(empid);
            MTSHRDataLayer.EmployeeLeave data_emp = new MTSHRDataLayer.EmployeeLeave();
            return Json(JsonConvert.SerializeObject(data_emp.GetEmployeeLeaveList(id), new IsoDateTimeConverter() { DateTimeFormat = "dd/MM/yyyy" }), JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult GetDetailedLeaveList(Int64 leaveId)
        {
            MTSHRDataLayer.EmployeeLeave data = new MTSHRDataLayer.EmployeeLeave();
            return Json(JsonConvert.SerializeObject(data.GetDetailedLeaveList(Convert.ToUInt64(Session["UserID"]), leaveId)));
        }

        public JsonResult GetHolidayDatesList(DateTime FromDate, DateTime ToDate)
        {
            MTSHRDataLayer.EmployeeLeave data_dates = new MTSHRDataLayer.EmployeeLeave();
            return Json(JsonConvert.SerializeObject(data_dates.GetHolidayDatesList(FromDate, ToDate), new IsoDateTimeConverter() { DateTimeFormat = "yyyyMMdd" }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetDisableHolidayDatesList(Int64 year)
        {
            MTSHRDataLayer.EmployeeLeave data_dates = new MTSHRDataLayer.EmployeeLeave();
            return Json(JsonConvert.SerializeObject(data_dates.GetDisableHolidayDatesList(year), new IsoDateTimeConverter() { DateTimeFormat = "dd/MM/yyyy" }), JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetLeaveBalance(int year)
        {
            string empid = Session["UserID"].ToString();
            MTSHRDataLayer.EmployeeLeave data = new MTSHRDataLayer.EmployeeLeave();
            var result = JsonConvert.SerializeObject(data.ReadEmployeeLeaveList(empid, false, year));
            return Json(result, JsonRequestBehavior.AllowGet);


            //string department = Session["DepartmentId"].ToString();
            //Int64 departmentid = Convert.ToInt64(department);
            //MTSHRDataLayer.EmployeeLeave data_dates = new MTSHRDataLayer.EmployeeLeave();

            //return Json(JsonConvert.SerializeObject(data_dates.GetLeaveBalance(empid)), JsonRequestBehavior.AllowGet);

        }

        public JsonResult GetLeaveBalanceDetails(int LeaveTypeId, int year)
        {
            string empid = Session["UserID"].ToString();
            MTSHRDataLayer.EmployeeLeave data = new MTSHRDataLayer.EmployeeLeave();
            var result = JsonConvert.SerializeObject(data.GetLeaveBalanceDetails(empid, LeaveTypeId, year));
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public JsonResult CreateLeaveBalanceForFeatureYear(int year)
        {
            string empid = Session["UserID"].ToString();
            MTSHRDataLayer.EmployeeLeave data = new MTSHRDataLayer.EmployeeLeave();
            var result = JsonConvert.SerializeObject(data.CreateLeaveBalanceForFeatureYear(empid, year));
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetManagersNames(bool GetAllmanagers)
        {
            List<SelectListItem> EmployeeNameList = new List<SelectListItem>();
            try
            {
                string empid = Session["UserID"].ToString();
                MTSHRDataLayer.EmployeeLeave EmployeeNamedata = new MTSHRDataLayer.EmployeeLeave();
                var EmployeeNames = EmployeeNamedata.GetAllManagereNames(empid, GetAllmanagers);

                if (EmployeeNames.Tables[0].Rows.Count != 1)
                {
                    EmployeeNameList.Add(new SelectListItem() { Value = "", Text = "----Select Employee----" });
                }
                for (int i = 0; i < EmployeeNames.Tables[0].Rows.Count; i++)
                {
                    string ID = EmployeeNames.Tables[0].Rows[i]["id"].ToString();
                    if (!ID.Equals(empid))
                        EmployeeNameList.Add(new SelectListItem() { Text = EmployeeNames.Tables[0].Rows[i]["EmployeeName"].ToString(), Value = ID });
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
                EmployeeNameList = new List<SelectListItem>();
            }
            return Json(JsonConvert.SerializeObject(EmployeeNameList), JsonRequestBehavior.AllowGet);
        }

    }
}

public class dateandsessionObject{
    public DateTime fromdate { get; set; }
    public DateTime todate { get; set; }
    public string fromsession { get; set; }
    public string tosession { get; set; }
}

public class leaveAdjustTo{
    public string leaveCode { get; set; }
    public string leaveName { get; set; }
    public Int64 leaveTypeId { get; set; }
    public Int64 appliedLeaveTypeID { get; set; }
    public decimal availableLeaveCount { get; set; }
    public bool isLOP { get; set; }
    public string fromSession { get; set; }
    public string toSession { get; set; }
    public Int64 LeaveID { get; set; }
    public DateTime fromDate { get; set; }
    public DateTime toDate { get; set; }
}


