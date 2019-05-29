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
using LeaveApply.Models;
using MTSHRDataLayer;
using MTS.Controllers;
using Newtonsoft.Json.Converters;
using MTSEntBlocks.ExceptionBlock.Handlers;


namespace LeaveApply.Controllers
{
    public class LeaveApplyController : SecureController
    {

        public ActionResult LeaveApply()
        {

            ViewBag.LeaveTypes = GetAllLeaveType();
            ViewBag.LeaveFromSessions = GetAllLeaveFromSession();
            ViewBag.LeaveToSessions = GetAllLeaveToSession();
            ViewBag.EmployeeNames = GetAllEmployeeNames();
            return View();
        }
        public ActionResult BPOLeaveApply()
        {

            ViewBag.LeaveTypes = GetAllLeaveType();
            ViewBag.LeaveFromSessions = GetAllLeaveFromSession();
            ViewBag.LeaveToSessions = GetAllLeaveToSession();
            ViewBag.EmployeeNames = GetAllEmployeeNames();
            return View();
        }

        private List<SelectListItem> GetAllLeaveType( )
        {
            string gender = Session["Gender"].ToString();
            string empid = Session["UserID"].ToString();
            string department = Session["DepartmentId"].ToString();
            Int64 id = Convert.ToInt64(empid);
           Int64 departmentid = Convert.ToInt64(department);
            MTSHRDataLayer.EmployeeLeave  LeaveTypedata = new MTSHRDataLayer.EmployeeLeave();
            var LeaveTypes = LeaveTypedata.GetAllLeaveType(id, departmentid);
            List<SelectListItem> LeaveTypelist = new List<SelectListItem>();
            try
            {
                LeaveTypelist.Add(new SelectListItem() { Value = "", Text = "----Select LeaveType----" });
                for (int i = 0; i <= LeaveTypes.Tables[0].Rows.Count; i++)
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
                var EmployeeNames = EmployeeNamedata.GetAllManagereNames();

                EmployeeNameList.Add(new SelectListItem() { Value = "", Text = "----Select Employee----" });
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
        public JsonResult Create(LeaveApply.Models.Leave leaveapply)
        {
            string empid = Session["UserID"].ToString();
            MTSHRDataLayer.EmployeeLeave data_contact = new MTSHRDataLayer.EmployeeLeave();
            Int64 id = Convert.ToInt64(empid);
            var result = 0;
            int leaveCheck;
            try
            {
               

                DateTime checkDate = leaveapply.FromDate.AddDays(-1);
                leaveCheck = data_contact.RestrictEmployeeLeaves(id, checkDate);
                if (leaveCheck == 1 || leaveCheck == 6)
                    result = 0;
                else if ((leaveCheck == 2 || leaveCheck == 7 || leaveCheck == 3 || leaveCheck == 8) && leaveapply.LeaveType == 1 || leaveapply.LeaveType == 6)
                    result = 0;
                else
                    result = data_contact.Create(leaveapply.Employee_Id = id, leaveapply.LeaveType
                        , leaveapply.FromDate, leaveapply.LeaveFromSession, leaveapply.ToDate
                        , leaveapply.LeaveToSession, leaveapply.Reason, leaveapply.Managerid, leaveapply.NumberOfDays);

            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new { success = result });
        }



        [HttpPost]
        public JsonResult LeaveCancel(Int64 id)
        {

            LeaveApply.Models.Leave leavecancel = new Models.Leave();

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

        public ActionResult GetLeaveBalance()
        {
            string empid = Session["UserID"].ToString();            
            string department = Session["DepartmentId"].ToString();
            Int64 departmentid = Convert.ToInt64(department);
            MTSHRDataLayer.EmployeeLeave data_dates = new MTSHRDataLayer.EmployeeLeave();

            return Json(JsonConvert.SerializeObject(data_dates.GetLeaveBalance(empid, departmentid)), JsonRequestBehavior.AllowGet);

        }
    }
}


