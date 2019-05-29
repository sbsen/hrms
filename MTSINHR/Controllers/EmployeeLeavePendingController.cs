using LeaveApply.Models;
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
            string managerid= Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(managerid);
            MTSHRDataLayer.LeavePending_Approve leaves_pending = new MTSHRDataLayer.LeavePending_Approve();

            return Content(JsonConvert.SerializeObject(leaves_pending.GetAllPendingLeaveList(managerid), new IsoDateTimeConverter() { DateTimeFormat = "MM-dd-yyyy" }));
        }

        [HttpPost]
        public Int64 Approve_Leave(Leave le)
        {
           
            string managerid = Session["UserID"].ToString();
            Int64 mid = Convert.ToInt64(managerid);
            int status = 0;
            Int64 result = 0;
            MTSHRDataLayer.LeavePending_Approve leave_approve = new MTSHRDataLayer.LeavePending_Approve();
            DateTime testfrom = new DateTime(le.FromDate.Year, le.FromDate.Month, 21);
            DateTime testto = le.FromDate.AddMonths(1);
            testto = new DateTime(testto.Year, testto.Month, 20);
            try
            {
                if (le.FromDate >= testfrom && le.ToDate <= testto)
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
                }

                 result = leave_approve.Approve_Leave(status, le.id, managerid, le.Approval, le.Employee_Id, le.FromDate, le.ToDate, le.LeaveType, le.Reason, le.NumberOfDays, year, month);
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
                return result;

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

                List<DateTime> temp = new List<DateTime>();
                DateTime date;
                bool holidaydate = false;
                string dayofweek;
                MTSHRDataLayer.EmployeeLeave data_dates = new MTSHRDataLayer.EmployeeLeave();
                DataTable dt = data_dates.GetHolidayDatesList(FromDate, testfd);
                for (date = FromDate; date <= testfd; date = date.AddDays(1))
                {
                    dayofweek = date.DayOfWeek.ToString();
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
                    totalnumberofdays(FromDate, ToDate, check = 2, leavetype, empid, LeaveFromSession, LeaveToSession);

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




