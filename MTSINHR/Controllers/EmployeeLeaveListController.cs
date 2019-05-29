using LeaveApply.Models;
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
           // EmployeeNameList.Insert(0, new SelectListItem() { Value = "0", Text = "----Select ALL----" });
            for (int i = 0; i < EmployeeNames.Tables[0].Rows.Count; i++)
            {
                EmployeeNameList.Add(new SelectListItem() { Text = EmployeeNames.Tables[0].Rows[i]["EmployeeName"].ToString(), Value = EmployeeNames.Tables[0].Rows[i]["id"].ToString() });
            }

             return EmployeeNameList.OrderBy(o => o.Text).ToList();
            //EmployeeNameList.Insert(0, new SelectListItem() { Value = "0", Text = "----Select ALL----" });
           // return EmployeeNameList;
        }

        private List<SelectListItem> GetAllLeaveType()
        {
            string gender = Session["Gender"].ToString();
            MTSHRDataLayer.EmployeeLeave LeaveTypedata = new MTSHRDataLayer.EmployeeLeave();
            var LeaveTypes = LeaveTypedata.GetAllLeaveType();
            List<SelectListItem> LeaveTypelist = new List<SelectListItem>();
            try
            {
                LeaveTypelist.Add(new SelectListItem() { Value = "", Text = "----Select LeaveType----" });
                for (int i = 0; i < LeaveTypes.Tables[0].Rows.Count; i++)
                {
                    LeaveTypelist.Add(new SelectListItem() { Value = LeaveTypes.Tables[0].Rows[i]["id"].ToString(), Text = LeaveTypes.Tables[0].Rows[i]["LeaveType"].ToString() });
                    if (gender == "0" && LeaveTypelist[i].Value == "3")
                    {
                        LeaveTypelist.RemoveAt(i);
                    }
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return LeaveTypelist;
        }

        public ActionResult LossOfPayDays()
        {
            ViewBag.LeaveTypes = GetAllLeaveType();
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
    }
}
