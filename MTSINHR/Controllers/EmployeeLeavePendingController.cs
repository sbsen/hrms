using MTSINHR.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using System.Data;
using Newtonsoft.Json.Converters;
using MTSEntBlocks.ExceptionBlock.Handlers;
using HRConstants;
using System.Configuration;

namespace MTSINHR.Controllers
{
    public class EmployeeLeavePendingController : SecureController
    {
        //
        // GET: /EmployeeLeavePending/

        public ActionResult LeavePending()
        {
            return View();
        }

        int month;
        int year;
        DateTime enddate;
        DateTime lastdate;


        public ActionResult GetAllPendingLeaveList()
        {
            string managerid = Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(managerid);
            MTSHRDataLayer.LeavePending_Approve leaves_pending = new MTSHRDataLayer.LeavePending_Approve();

            return Content(JsonConvert.SerializeObject(leaves_pending.GetAllPendingLeaveList(managerid), new IsoDateTimeConverter() { DateTimeFormat = "MM-dd-yyyy" }));
        }

        [HttpPost]
        public Int64 Approve_Leave(Leave le)
        {
            Int64 result = 0;
            try
            {

             string managerid = Session["UserID"].ToString();
            Int64 mid = Convert.ToInt64(managerid);
            int status = 0;
            
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            MTSHRDataLayer.LeavePending_Approve leave_approve = new MTSHRDataLayer.LeavePending_Approve();
            string _disabledCalculation = ConfigurationManager.AppSettings["Disabled_LeaveCalculation"].ToString();
            MTSHRDataLayer.EmployeeLeave data_dates = new MTSHRDataLayer.EmployeeLeave();
            //disable leave calculation two lines
            string leaveTypeName = data_dates.READLEAVETYPENAME(le.LeaveType);
            leaveTypeName = leaveTypeName.ToLower();
            DateTime testfrom = new DateTime(le.FromDate.Year, le.FromDate.Month, 21);
            DateTime testto = le.FromDate.AddMonths(1);
            testto = new DateTime(testto.Year, testto.Month, 20);
            //vignesh change -awailed count
            Int64 leaveTypeID = 0;
            decimal availableLeaveCount = 0;
            decimal leave_avail_ntcredit = 0;
            decimal leave_availed_advance = -1;
            int year = le.FromDate.Year;
            int EmployeeLeaveBalanceyear = le.FromDate.Year;
            var EmployeeLeaveList = data_contact.GetEmployeeLeaveDetails(le.Employee_Id,true, year);
                
            var MTSLeavePolicy = data_contact.GetMTSLeavePolicyLeaveType(le.Employee_Id, le.LeaveType, year);
            int currentYear = DateTime.Now.Year;
            bool accural = false;
            if (MTSLeavePolicy.Tables[0].Rows.Count > 0)
            {
                accural = Convert.ToBoolean(MTSLeavePolicy.Tables[0].Rows[0]["ACCURAL"]);
            }
            if (year != currentYear)
            {
                //year++;
                //MTSLeavePolicy = data_contact.GetMTSLeavePolicyLeaveType(le.Employee_Id, le.LeaveType, year);
                //EmployeeLeaveList = data_contact.GetEmployeeLeaveDetails(le.Employee_Id,true, year);
                EmployeeLeaveBalanceyear = year + 1;
            }
            for (int i = 0; i < EmployeeLeaveList.Tables[0].Rows.Count; i++)
            {
                leaveTypeID = Convert.ToInt64(EmployeeLeaveList.Tables[0].Rows[i]["LeaveTypeId"]);
                if (leaveTypeID == le.LeaveType)
                {


                    availableLeaveCount = Convert.ToDecimal(EmployeeLeaveList.Tables[0].Rows[i]["AvailableLeave"]);
                    leave_avail_ntcredit = Convert.ToDecimal(EmployeeLeaveList.Tables[0].Rows[i]["LeaveCredited"])- Convert.ToDecimal(EmployeeLeaveList.Tables[0].Rows[i]["NumberofdaysLeaveTaken"]);

                    decimal AdvanceCredit = Convert.ToDecimal(EmployeeLeaveList.Tables[0].Rows[i]["AdvanceCredit"]);
                    decimal AdvanceAvailed= Convert.ToDecimal(EmployeeLeaveList.Tables[0].Rows[i]["AdvanceAvailed"]);
                    if (availableLeaveCount >= le.NumberOfDays && le.NumberOfDays>leave_avail_ntcredit) {

                        leave_availed_advance = le.NumberOfDays- leave_avail_ntcredit ;
                        if (leave_availed_advance+ AdvanceAvailed > AdvanceCredit)
                        {
                            leave_availed_advance = AdvanceCredit;

                        }
                        else {

                            leave_availed_advance= leave_availed_advance + AdvanceAvailed;

                        }
                    }
                    break;
                }
            }
           

                if ((le.FromDate.Day > 20 && le.FromDate.Month == 12 || le.FromDate.Day < 21 && le.FromDate.Month == 1) && !(_disabledCalculation.Contains(leaveTypeName)))
                {
                    status = 1;
                    month = le.FromDate.Month;
                    year = le.FromDate.Year;
                }
                else if (le.FromDate >= testfrom && le.ToDate <= testto)
                {
                    status = 1;
                    month = testto.Month;
                    year = testto.Year;

                }
                else if (le.FromDate == le.ToDate)
                {
                    status = 1;
                    if (le.FromDate.Day > 20)
                    {
                        DateTime samedate = le.FromDate.AddMonths(1);
                        month = samedate.Month;
                        year = samedate.Year;
                    }
                    else
                    {
                        month = le.FromDate.Month;
                        year = le.FromDate.Year;

                    }

                }
                else if (le.FromDate < testfrom && le.ToDate < testfrom)
                {
                    status = 1;
                    month = le.FromDate.Month;
                    year = le.FromDate.Year;
                }

                else
                {
                    status = 2;
                    totalnumberofdays(le.FromDate, le.ToDate, 1, le.LeaveType, le.Employee_Id, le.LeaveFromSession, le.LeaveToSession);
                    month = le.FromDate.Month;
                }


                Int64 IsDeteted = data_contact.DeleteLeaveDetails(le.id);

                checkAvailableLeaveCountAndUpdate(le);

                if (le.isLOP)
                    result = leave_approve.Approve_Leave(LOPTypeConstants.ForcedLeave, le.id, managerid, le.Approval, le.Employee_Id, le.FromDate, le.ToDate, le.LeaveType, le.Reason, le.NumberOfDays, year, month, leave_availed_advance, EmployeeLeaveBalanceyear);
                else
                    result = leave_approve.Approve_Leave(1, le.id, managerid, le.Approval, le.Employee_Id, le.FromDate, le.ToDate, le.LeaveType, le.Reason, le.NumberOfDays, year, month, leave_availed_advance, EmployeeLeaveBalanceyear);
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return result;

        }

        public void checkAvailableLeaveCountAndUpdate(MTSINHR.Models.Leave leaveapply)
        {
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            string department = Session["DepartmentId"].ToString();
            Int64 departmentid = Convert.ToInt64(department);
            Int64 appliedLeaveTypeID = 0;
            decimal availableLeaveCount = 0;
            string appliedLeaveType = string.Empty;
            string appliedLeaveCode = string.Empty;
            var CreateLeaveResult = 0;
            var CreateLeaveDetailsResult = 0;
            int year = leaveapply.FromDate.Year;
            int currentYear = DateTime.Now.Year;
            try
            {
                var MTSLeavePolicy = data_contact.GetMTSLeavePolicyLeaveType(leaveapply.Employee_Id, leaveapply.LeaveType, year);

                if (MTSLeavePolicy.Tables[0].Rows.Count > 0)
                {
                    bool accural = Convert.ToBoolean(MTSLeavePolicy.Tables[0].Rows[0]["ACCURAL"]);
                    //if (year < currentYear && accural == true)
                    //{
                    //    year++;
                    //    MTSLeavePolicy = data_contact.GetMTSLeavePolicyLeaveType(leaveapply.Employee_Id, leaveapply.LeaveType, year);
                    //}
                    var EmployeeLeaveList = data_contact.GetEmployeeApproredLeaveDetails(leaveapply.Employee_Id, false, year);
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
                            CreateLeaveResult = data_contact.Create_ADD_EMPLOYEE_LEAVE_DETAILS(leaveapply.id, leaveapply.LeaveType, false);
                            //return true;
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

                                if (availableLeaveCount >= leaveapply.NumberOfDays)
                                {
                                    CreateLeaveResult = data_contact.Create_ADD_EMPLOYEE_LEAVE_DETAILS(leaveapply.id, leaveapply.LeaveType, false);

                                    leavebalancetoapplay = 0;

                                    //return true;
                                }


                                else if (availableLeaveCount < leaveapply.NumberOfDays)
                                {
                                    //CreateLeaveResult = data_contact.Create_ADD_EMPLOYEE_LEAVE_DETAILS(leaveapply.id, leaveapply.LeaveType, false);
                                    Int64 createLeaveResult = leaveapply.id;
                                    List<leaveAdjustTo> _leaveAdjustToList = new List<leaveAdjustTo>();
                                    if (createLeaveResult != 0 && createLeaveResult != null)
                                    {
                                        Int64 LeaveID = createLeaveResult;
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
                                            //_leaveAdjustTo.isSameAsFrom = isSameAsFrom;

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
                                            if (_leaveAdjustTo.availableLeaveCount < 1)
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
                                                            if (_leaveAdjustToList != null)
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
                                                                //_leaveAdjustTo.isSameAsFrom = isSameAsFrom;


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

                                                                if (_leaveAdjustToList != null)
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
                                                                    Int64 aBalance = Convert.ToInt64(Math.Ceiling(availableLeaveCount));
                                                                    _leaveAdjustTo.toDate = getfromandtodate(aBalance, _leaveAdjustTo.fromDate, leaveapply.LeaveType, year);
                                                                }

                                                                _leaveAdjustToList.Add(_leaveAdjustTo);
                                                                leavebalance = 0;
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
                                                                //_leaveAdjustTo.isSameAsFrom = isSameAsFrom;

                                                                if (assignfromseccion == 0)
                                                                {
                                                                    if (leaveapply.LeaveFromSession == LeaveSessionConstants.Fullday)
                                                                        _leaveAdjustTo.fromSession = LeaveSessionConstants.Forenoon;
                                                                    else
                                                                        _leaveAdjustTo.fromSession = LeaveSessionConstants.Afternoon;
                                                                }
                                                                else
                                                                {
                                                                    if (_leaveAdjustToList != null)
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

                                                                if (_leaveAdjustToList != null)
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
                                                if (_leaveAdjustToList != null)
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
                                                //_leaveAdjustTo.isSameAsFrom = isSameAsFrom;

                                                if (assignfromseccion == 0)
                                                {
                                                    if (leaveapply.LeaveFromSession == LeaveSessionConstants.Fullday)
                                                        _leaveAdjustTo.fromSession = LeaveSessionConstants.Forenoon;
                                                    else
                                                        _leaveAdjustTo.fromSession = LeaveSessionConstants.Afternoon;
                                                }
                                                else
                                                {
                                                    if (_leaveAdjustToList != null)
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
                                                if (_leaveAdjustToList != null)
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
                                        CreateLeaveDetailsResult = data_contact.CreateLeaveDetails(leaveapply.Employee_Id, item.leaveCode
                                            , item.leaveName, item.leaveTypeId, item.appliedLeaveTypeID, item.availableLeaveCount, item.isLOP
                                           , item.fromSession, item.toSession, item.LeaveID, item.fromDate, item.toDate);
                                    }
                                    //return true;
                                }
                                //return true;
                            }
                            else
                            {
                                if (availableLeaveCount == 0)
                                {
                                    CreateLeaveDetailsResult = data_contact.CreateLeaveDetails(leaveapply.Employee_Id, appliedLeaveCode
                                      , appliedLeaveType, appliedLeaveTypeID, appliedLeaveTypeID, leaveapply.NumberOfDays, true
                                     , leaveapply.LeaveFromSession, leaveapply.LeaveToSession, leaveapply.id, leaveapply.FromDate, leaveapply.ToDate);
                                }
                                else
                                {
                                    DateTime local_fromdate = new DateTime();
                                    DateTime local_todate = new DateTime();
                                    DateTime todate = new DateTime();
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
                                        if (leaveapply.LeaveFromSession == LeaveSessionConstants.Fullday)
                                        {
                                            local_FromSession = LeaveSessionConstants.Forenoon;
                                            local_ToSession = LeaveSessionConstants.Afternoon;
                                        }
                                        else if (leaveapply.LeaveFromSession == LeaveSessionConstants.Forenoon)
                                            local_ToSession = LeaveSessionConstants.Afternoon;
                                        else if (leaveapply.LeaveFromSession == LeaveSessionConstants.Afternoon)
                                            local_ToSession = LeaveSessionConstants.Forenoon;
                                    }

                                    CreateLeaveDetailsResult = data_contact.CreateLeaveDetails(leaveapply.Employee_Id, appliedLeaveCode
                                   , appliedLeaveType, appliedLeaveTypeID, appliedLeaveTypeID, availableLeaveCount, false
                                  , local_FromSession, local_ToSession, leaveapply.id, leaveapply.FromDate, todate);


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
                                        CreateLeaveDetailsResult = data_contact.CreateLeaveDetails(leaveapply.Employee_Id, appliedLeaveCode
                                       , appliedLeaveType, appliedLeaveTypeID, appliedLeaveTypeID, availableLeaveCount, true
                                      , local_FromSession, local_ToSession, leaveapply.id, local_fromdate, leaveapply.ToDate);

                                    //DateTime to_date = new DateTime();
                                    //DateTime localFromdate = new DateTime();
                                    //DateTime localTodate = new DateTime();

                                    //string localfromsession = string.Empty;
                                    //string localtosession = string.Empty;

                                    //Int64 aBalance = Convert.ToInt64(Math.Ceiling(availableLeaveCount));
                                    //to_date = getfromandtodate(aBalance, leaveapply.FromDate, leaveapply.LeaveType, year);

                                    //var Regex = new System.Text.RegularExpressions.Regex("(?<=[\\.])[0-9]+");
                                    //string decimal_places = Regex.Match(availableLeaveCount.ToString()).Value;
                                    //if (decimal_places == "5" || decimal_places == "50")
                                    //{
                                    //    if (leaveapply.LeaveFromSession == LeaveSessionConstants.Fullday)
                                    //        leaveapply.LeaveFromSession = LeaveSessionConstants.Forenoon;

                                    //    localtosession = leaveapply.LeaveFromSession;
                                    //}
                                    //else if (decimal_places != "5" || decimal_places != "50")
                                    //{
                                    //    if(leaveapply.LeaveFromSession == LeaveSessionConstants.Forenoon)
                                    //        localtosession = LeaveSessionConstants.Afternoon;
                                    //    if (leaveapply.LeaveFromSession == LeaveSessionConstants.Afternoon)
                                    //        localtosession = LeaveSessionConstants.Forenoon;
                                    //}

                                    //CreateLeaveDetailsResult = data_contact.CreateLeaveDetails(leaveapply.Employee_Id, appliedLeaveCode
                                    // , appliedLeaveType, appliedLeaveTypeID, appliedLeaveTypeID, availableLeaveCount, false
                                    //, leaveapply.LeaveFromSession, localtosession, leaveapply.id, leaveapply.FromDate, to_date);

                                    //availableLeaveCount = leaveapply.NumberOfDays - availableLeaveCount;

                                    //Int64 toBalance = Convert.ToInt64(Math.Ceiling(availableLeaveCount));
                                    //localFromdate = to_date.AddDays(1);
                                    //if (localFromdate.DayOfWeek == DayOfWeek.Saturday)
                                    //{
                                    //    localFromdate = localFromdate.AddDays(1);
                                    //}
                                    //if (localFromdate.DayOfWeek == DayOfWeek.Sunday)
                                    //{
                                    //    localFromdate = localFromdate.AddDays(1);
                                    //}
                                    //localTodate = getfromandtodate(toBalance, localFromdate, leaveapply.LeaveType, year);

                                    //localfromsession = localtosession;

                                    //if (availableLeaveCount != 0)
                                    //    CreateLeaveDetailsResult = data_contact.CreateLeaveDetails(leaveapply.Employee_Id, appliedLeaveCode
                                    //  , appliedLeaveType, appliedLeaveTypeID, appliedLeaveTypeID, availableLeaveCount, true
                                    // , localfromsession, leaveapply.LeaveToSession, leaveapply.id, localFromdate, localTodate);
                                }
                            }
                        }
                    }
                }
                //return AdjustLeaveTypeId;
                //else if (currentYear + 1 == year)
                //{
                //    CreateLeaveResult = data_contact.Create_ADD_EMPLOYEE_LEAVE_DETAILS(leaveapply.id, leaveapply.LeaveType);
                //    return true;
                //}
                //return false;
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
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
        public Int64 Cancel_Leave(Leave le)
        {
            string managerid = Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(managerid);
            MTSHRDataLayer.LeavePending_Approve leave_approve = new MTSHRDataLayer.LeavePending_Approve();
            Int64 result = leave_approve.Cancel_Leave(managerid, le.Approval, le.Employee_Id, le.FromDate, le.ToDate, le.LeaveType, le.Reason);
            return result;

        }


        public int totalnumberofdays(DateTime FromDate, DateTime ToDate, int check, Int64 leavetype, Int64 empid, string LeaveFromSession, string LeaveToSession)
        {
            try
            {

                DateTime testfd;
                if (FromDate.Day > 20)
                {
                    testfd = FromDate.AddMonths(1);
                    testfd = new DateTime(testfd.Year, testfd.Month, 20);
                }
                else
                {
                    testfd = new DateTime(FromDate.Year, FromDate.Month, 20);
                }
                if (check == 1)
                {

                    enddate = ToDate;

                }
                if (check == 2)
                {
                    testfd = ToDate;
                }
                //disable leave calculation
                string _disabledCalculation = ConfigurationManager.AppSettings["Disabled_LeaveCalculation"].ToString();
                //disable leave calculation
                List<DateTime> temp = new List<DateTime>();
                DateTime date;
                bool holidaydate = false;
                string dayofweek;
                MTSHRDataLayer.EmployeeLeave data_dates = new MTSHRDataLayer.EmployeeLeave();
                //disable leave calculation two lines
                string leaveTypeName = data_dates.READLEAVETYPENAME(leavetype);
                leaveTypeName = leaveTypeName.ToLower();

                DataTable dt = data_dates.GetHolidayDatesList(FromDate, testfd);
                for (date = FromDate; date <= testfd; date = date.AddDays(1))
                {
                    dayofweek = date.DayOfWeek.ToString();
                    if (!(_disabledCalculation.Contains(leaveTypeName)))
                    {
                        if (dayofweek != "Saturday" && dayofweek != "Sunday")
                        {
                            if (dt != null)
                            {
                                holidaydate = dt.AsEnumerable().Where(c => Convert.ToDateTime(c.Field<DateTime>("DateOfHoliday")).Equals(date)).Count() > 0;
                            }
                            if (holidaydate == false)
                            {
                                if (date <= enddate)
                                {
                                    temp.Add(date);
                                    int i = (temp.Count - 1);
                                    lastdate = temp[i];
                                }
                            }
                        }
                    }
                    else
                    {
                        if (date <= enddate)
                        {
                            temp.Add(date);
                            int i = (temp.Count - 1);
                            lastdate = temp[i];
                        }
                    }
                }

                if (lastdate <= enddate)
                {
                    if (lastdate == enddate && lastdate.Day > 20)
                    {
                        lastdate = lastdate.AddMonths(1);
                    }

                    int year = lastdate.Year;
                    int month = lastdate.Month;
                    double numberofdays = temp.Count;
                    if (check == 1)
                    {
                        if (LeaveFromSession == "2" || LeaveFromSession == "3")
                        {
                            numberofdays = numberofdays - 0.5;
                        }
                    }

                    return num(year, month, numberofdays, lastdate, leavetype, empid, LeaveFromSession, LeaveToSession);
                }
                return 1;
            }

            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return 0;
        }

        public int num(int year, int month, double numberofdays, DateTime lastdate, Int64 leavetype, Int64 empid, string LeaveFromSession, string LeaveToSession)
        {
            try
            {
                int check;
                MTSHRDataLayer.LeavePending_Approve leave_approve = new MTSHRDataLayer.LeavePending_Approve();
                DateTime FromDate = lastdate.AddDays(1);

                if (lastdate < enddate)
                {
                    DateTime ToDate = FromDate.AddMonths(1);
                    ToDate = new DateTime(ToDate.Year, ToDate.Month, 20);
                    Int64 report = leave_approve.LeaveReport(2, leavetype, empid, year, month, 0, numberofdays);
                    //totalnumberofdays(FromDate, ToDate, check = 2, leavetype, empid, LeaveFromSession, LeaveToSession);

                }
                else
                {
                    if (LeaveToSession == "2")
                    {
                        numberofdays = numberofdays - 0.5;
                    }

                    Int64 report = leave_approve.LeaveReport(2, leavetype, empid, year, month, 0, numberofdays);
                }
                return 1;
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return 0;
        }
    }
}




