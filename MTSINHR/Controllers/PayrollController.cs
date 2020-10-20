using System;
using Newtonsoft.Json;
using System.Web.Mvc;
using System.Data;
using MTSEntBlocks.ExceptionBlock.Handlers;
using MTSINHR.Models;
using MTS.Controllers;
using System.Collections.Generic;
using System.Linq;

namespace MTSINHR.Controllers
{
    public class PayrollController : SecureController
    {
        // GET: Payroll
        public ActionResult Payroll()
        {
            return View();
        }

        public ActionResult ViewpayrollDetails(string Parameter, string Description)
        {
            string[] result;
            if (Parameter.Contains(","))
            {
                result = Parameter.Split(',');
                TempData["Userid"] = Convert.ToInt64(result[0]);
                TempData["EffectiveMonth"] = result[1];
                TempData["Description_1M"] = Description;
            }
            else
            {
                TempData["Userid"] = Convert.ToInt64(Parameter);
            }  
            return RedirectToAction("EmployeePayrollDetails");
        }
                
        public ActionResult EmployeePayrollDetails()
        {
            Int64 flagFromInbox = 1;
            ViewBag.EmpID = TempData["Userid"];
            ViewBag.EffectiveMonth = TempData["EffectiveMonth"];
            ViewBag.Description = TempData["Description_1M"];
            ViewBag.flagFromInbox = flagFromInbox;
            return View("Payroll");
        }

        public ActionResult ViewPayrollProcess(string Parameter, string Description)
        {
            TempData["PayrollProcessMonth"] = Parameter;
            TempData["Description_2M"] = Description;
            return RedirectToAction("MonthlyPayrollProcess");
        }

        public ActionResult MonthlyPayrollProcess()
        {
            Int64 flagFromInbox = 1;
            ViewBag.PayrollProcessMonth = TempData["PayrollProcessMonth"];
            ViewBag.flagFromInbox = flagFromInbox;
            ViewBag.Description = TempData["Description_2M"];
            return View("PayrollCalculations");
        }

        public ActionResult MonthlyVariance()
        {
            return View("MonthlyVariance");
        }
        [HttpPost]
        public ActionResult SubmitPayrollDetails(Payroll roll, Int64 payrollID)
        {
            MTSHRDataLayer.Payroll data = new MTSHRDataLayer.Payroll();
            var result = JsonConvert.SerializeObject(data.SubmitPayrollDetails(roll.EmpId,roll.Basic_Pay,roll.HouseRentAllwn,roll.SpecialAllwn,roll.MedicalAllwn
                ,roll.ConveyanceAllwn,roll.FoodAllwn,roll.GrossSalary,roll.PF,roll.ProffesionalTax,roll.ESI,roll.SodexoPass,roll.Others,roll.TotalDeduction,roll.NetSalary,roll.EffectiveSince,roll.PF_Restriction, payrollID));
            return Json(new { success = result });
        }


        [HttpPost]
        public ActionResult AddMonthlyVarianceData(string EmpId, string type, string description, string Amount, string month)
        {
            MTSHRDataLayer.Payroll data = new MTSHRDataLayer.Payroll();
            var result = JsonConvert.SerializeObject(data.AddMonthlyVarianceData(Convert.ToInt64(EmpId),  Convert.ToInt64(type), description, Amount == "" ? (Decimal)0 : Convert.ToDecimal(Amount), month == "" ? (DateTime?)null : Convert.ToDateTime(month)));
            return Json(new { success = result });
        }
        public ActionResult GetMonthlyVarianceData(string EmpId, string type, string description)
        {
            MTSHRDataLayer.Payroll data = new MTSHRDataLayer.Payroll();
            var MonthlyVarianceData = data.GetMonthlyVarianceData(Convert.ToInt64(EmpId), Convert.ToInt64(type), description);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(MonthlyVarianceData.Tables[0]), result2 = JsonConvert.SerializeObject(MonthlyVarianceData.Tables[1]) }, JsonRequestBehavior.AllowGet);   
        }

        [HttpPost]
        public ActionResult UpdateMonthlyVarianceData(Int64 ID, string EmpId, string type, string description, string Amount, string month)
        {
            MTSHRDataLayer.Payroll data = new MTSHRDataLayer.Payroll();
            var result = JsonConvert.SerializeObject(data.UpdateMonthlyVarianceData(ID, Convert.ToInt64(EmpId),  Convert.ToInt64(type), description, Amount == "" ? (Decimal)0 : Convert.ToDecimal(Amount), month == "" ? (DateTime?)null : Convert.ToDateTime(month)));
            return Json(new { success = result });
        }

        public JsonResult GetEmployeesList()
        {
        
            DataTable dt = new DataTable();
          
            MTSHRDataLayer.Payroll activeEmployee = new MTSHRDataLayer.Payroll();
         
            dt = activeEmployee.Read();

            return Json(JsonConvert.SerializeObject(dt), JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetEmployeeDetails(string EmpId)
        {
            MTSHRDataLayer.Employee data_emp = new MTSHRDataLayer.Employee();
            var employeeData = Json(JsonConvert.SerializeObject(data_emp.Read(EmpId).Tables[0]));

            return Json(new { result=employeeData }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetDeductionCalculationDetails()
        {
            MTSHRDataLayer.Payroll data = new MTSHRDataLayer.Payroll();
            var MonthlyVarianceData = data.GetDeductionCalculationDetails();
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(MonthlyVarianceData.Tables[0]), result2 = JsonConvert.SerializeObject(MonthlyVarianceData.Tables[1]), result3 = JsonConvert.SerializeObject(MonthlyVarianceData.Tables[2]) }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetEmployeePayrollDetails(string EmpId)
        {
            MTSHRDataLayer.Payroll data = new MTSHRDataLayer.Payroll();
            var MonthlyVarianceData = data.GetEmployeePayrollDetails(Convert.ToInt64(EmpId));
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(MonthlyVarianceData.Tables[0]), result2 = JsonConvert.SerializeObject(MonthlyVarianceData.Tables[1]) }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetPayrollDetails(string Payroll_Month, string AttandanceFrom, string AttandanceTo)

        {
            var year = "";
            int month = 0;
            if (!string.IsNullOrEmpty(Payroll_Month))
            {
                string[] date = new string[2];
                date = Payroll_Month.Split('-');
                var MonthName = date[0];
                year = date[1].Trim().ToString();
                month = this.getMonth(MonthName);
            }
            else
            {
                return Json(new { result = "" }, JsonRequestBehavior.AllowGet);
            }
            MTSHRDataLayer.Payroll data_pay = new MTSHRDataLayer.Payroll();
            var payrollData = Json(JsonConvert.SerializeObject(data_pay.ProcessPayrollData(month.ToString(), year, AttandanceFrom, AttandanceTo)));

            return Json(new { result = payrollData }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Read(string Payroll_Month)
        {
            var year = "";
            int month = 0;
            if (!string.IsNullOrEmpty(Payroll_Month))
            {
                string[] date = new string[2];
                date = Payroll_Month.Split('-');
                var MonthName = date[0];
                 year = date[1].Trim().ToString();
                month = this.getMonth(MonthName);
            }
            else
            {
                return Json(new { result = "" }, JsonRequestBehavior.AllowGet);
            }
           
            MTSHRDataLayer.Payroll data_pay = new MTSHRDataLayer.Payroll();
            var payrollData = Json(JsonConvert.SerializeObject(data_pay.GetMonthlyPayrollData(month.ToString(), year).Tables[0]));

            return Json(new { result = payrollData }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult Read_Lop(string Payroll_Month, string AttandanceFrom, string AttandanceTo)
        {
            var year = "";
            int month = 0;
            if (!string.IsNullOrEmpty(Payroll_Month))
            {
                string[] date = new string[2];
                date = Payroll_Month.Split('-');
                var MonthName = date[0];
                year = date[1].Trim().ToString();
                month = this.getMonth(MonthName);
            }
            else
            {
                return Json(new { result = "" }, JsonRequestBehavior.AllowGet);
            }

            MTSHRDataLayer.Payroll data_pay = new MTSHRDataLayer.Payroll();
            var payrollData = Json(JsonConvert.SerializeObject(data_pay.Get_Lop_Days(month.ToString(), year, AttandanceFrom, AttandanceTo).Tables[0]));

            return Json(new { result = payrollData }, JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public ActionResult UpdatePayrollDetails(Int64 ID, Int64 EmployeeId, float BasicPay, float HouseAllowance, float SpecialAllowance, float Medical_allowance, float FoodAllowance,  float Conveyance, float Others, 
            float TotalEarnings, float SudexoPass, float IncomeTax, float Professional_Tax, float EmployeeEsi, float Employee_PF, float OthersDeductions, 
            float TotalDeductions, float Incentives, float NetSalary, float TotalDays, float LopDays, float PaidDays)
        {
            Int64 result = 0;
            try
            {
                MTSHRDataLayer.Payroll payroll = new MTSHRDataLayer.Payroll();
                result = payroll.UpdatePayrollDetails(ID, EmployeeId, BasicPay, HouseAllowance, SpecialAllowance, Medical_allowance, FoodAllowance, Conveyance, Others,
                    TotalEarnings, SudexoPass, IncomeTax, Professional_Tax, EmployeeEsi, Employee_PF, OthersDeductions,
                    TotalDeductions, Incentives, NetSalary, TotalDays, LopDays, PaidDays, Convert.ToInt64(Session["UserID"].ToString()));
            }
            catch (Exception ex)
            {
                BaseExceptionHandler.HandleException(ref ex);
                result = -999;
            }
            return Content(result.ToString());
        }

        public JsonResult ClosePayrollDetails(string Payroll_Month)
        {
            var year = "";
            int month = 0;
            if (!string.IsNullOrEmpty(Payroll_Month))
            {
                string[] date = new string[2];
                date = Payroll_Month.Split('-');
                var MonthName = date[0];
                year = date[1].Trim().ToString();
                month = this.getMonth(MonthName);
            }
            else
            {
                return Json(new { result = "0" }, JsonRequestBehavior.AllowGet);
            }

            MTSHRDataLayer.Payroll data_pay = new MTSHRDataLayer.Payroll();
            var payrollData = Json(JsonConvert.SerializeObject(data_pay.ClosePayrollData(month.ToString(), year)));

            return Json(new { result = payrollData }, JsonRequestBehavior.AllowGet);
        }


        public JsonResult CheckPayrollDetails(string Payroll_Month, Int64 Flag)
        {
            var year = "";
            int month = 0;
            if (!string.IsNullOrEmpty(Payroll_Month))
            {
                string[] date = new string[2];
                date = Payroll_Month.Split('-');
                var MonthName = date[0];
                year = date[1].Trim().ToString();
                month = this.getMonth(MonthName);
            }
            else
            {
                return Json(new { result = "0" }, JsonRequestBehavior.AllowGet);
            }

            MTSHRDataLayer.Payroll data_pay = new MTSHRDataLayer.Payroll();
            var payrollData = Json(JsonConvert.SerializeObject(data_pay.CheckPayrollData(month.ToString(), year, Flag)));

            return Json(new { result = payrollData }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetPayrollFromDate(string Payroll_Month)
        {
            var year = "";
            int month = 0;
            if (!string.IsNullOrEmpty(Payroll_Month))
            {
                string[] date = new string[2];
                date = Payroll_Month.Split('-');
                var MonthName = date[0];
                year = date[1].Trim().ToString();
                month = this.getMonth(MonthName);
            }
            else
            {
                return Json(new { result = "0" }, JsonRequestBehavior.AllowGet);
            }

            MTSHRDataLayer.Payroll data_pay = new MTSHRDataLayer.Payroll();
            var payrollDataFrom = data_pay.GetPayrollFromDate(month.ToString(), year);
            var payrollDataTo = data_pay.GetPayrollToDate(month.ToString(), year);
            var prevBonus = data_pay.GetPayrollPreviousBonus(month.ToString(), year);

            return Json(new { result = payrollDataFrom, result2 = payrollDataTo, result1 = prevBonus }, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetPayrollReport(string FromDate, String Option)
        {
            string fromyear = "";
            int frommonth = 0;
            if (!string.IsNullOrEmpty(FromDate))
            {
                string[] date = new string[2];
                date = FromDate.Split('-');
                var MonthName = date[0];
                fromyear = date[1].Trim().ToString();
                frommonth = this.getMonth(MonthName);
            }

            MTSHRDataLayer.Payroll data_pay = new MTSHRDataLayer.Payroll();
            DataTable payrollReport = new DataTable();
            payrollReport = data_pay.GetpayrollReport(frommonth.ToString(), fromyear, Option);
            return Json(new { result = JsonConvert.SerializeObject(payrollReport)}, JsonRequestBehavior.AllowGet);
        }

        //GetDownloadPayroll
        [HttpGet]
        public void GetDownloadPayroll(string Month)
        {
            if (!string.IsNullOrEmpty(Month))
            {
                string[] date = new string[2];
                date = Month.Split('-');
                var MonthName = date[0];
                var year = date[1].Trim().ToString();
                int month = this.getMonth(MonthName);

                DataTable dt = new DataTable();
                MTSHRDataLayer.Payroll data_pay = new MTSHRDataLayer.Payroll();
                dt = data_pay.GetDownloadPayroll(month.ToString(), year);

                string attachment = "attachment; filename=payroll_employee_bank_sheet_" + Month + ".xls";
                Response.ClearContent();
                Response.AddHeader("content-disposition", attachment);
                Response.ContentType = "application/vnd.ms-excel";
                string tab = "";
                foreach (DataColumn dc in dt.Columns)
                {
                    Response.Write(tab + dc.ColumnName);
                    tab = "\t";
                }
                Response.Write("\n");
                int i;
                foreach (DataRow dr in dt.Rows)
                {
                    tab = "";
                    for (i = 0; i < dt.Columns.Count; i++)
                    {
                        Response.Write(tab + dr[i].ToString());
                        tab = "\t";
                    }
                    Response.Write("\n");
                }
                Response.End();



            }
        }

        public JsonResult GetPayrollMonth()
        {
            MTSHRDataLayer.Payroll data_pay = new MTSHRDataLayer.Payroll();
            var payrollData = data_pay.GetPayrollMonth();

            return Json(new { result = payrollData }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult PayrollCalculations()
        {
            return View();
        }

        public ActionResult PayrollReport()
        {
            return View();
        }

        public ActionResult PayrollLop()
        {
            return View("PayrollLop");
        }

        public int getMonth(string Month)
        {
            string month = Month.ToUpper().Trim();
            if (month == "JANUARY")
                return 1;
            else if (month == "FEBRUARY")
                return 2;
            else if (month == "MARCH")
                return 3;
            else if (month == "APRIL")
                return 4;
            else if (month == "MAY")
                return 5;
            else if (month == "JUNE")
                return 6;
            else if (month == "JULY")
                return 7;
            else if (month == "AUGUST")
                return 8;
            else if (month == "SEPTEMBER")
                return 9;
            else if (month == "OCTOBER")
                return 10;
            else if (month == "NOVEMBER")
                return 11;
            else if (month == "DECEMBER")
                return 12;
            else
                return 0;
        }
        public ActionResult Get_PV_EmployeeLossOfPayDetails()
        {
            return PartialView("_PV_EmployeeLossOfPayDetails");
        }

        public ActionResult Get_PV_EmployeePayrollDeails()
        {
            return PartialView("_PV_EmployeePayrollDeails");
        }
        public ActionResult Get_PV_PreviousBonusDetail()
        {
            return PartialView("_PV_PreviousBonusDetail");
        }

        [HttpPost]
        public ActionResult GetEmployeeLossOfPayDetails(Int64 EmployeeId, string Month, string Year)
        {
            DataTable dt = new DataTable();
            try
            {
                Month = getMonth(Month).ToString();
                MTSHRDataLayer.Payroll payroll = new MTSHRDataLayer.Payroll();
                dt = payroll.GetEmployeeLossOfPayDetails(EmployeeId, Month, Year);
            }
            catch(Exception ex)
            {
                BaseExceptionHandler.HandleException(ref ex);
                dt = new DataTable();
            }
            return Json(JsonConvert.SerializeObject(dt));
        }

        [HttpPost]
        public ActionResult AddOrRemoveLop(Int64 EmployeeId,string Month, string Year, DateTime LeaveFrom, DateTime LeaveTo, decimal Numberofdays, string Reason,bool AutoLop, Int64 AddOrRemoveFlag)
        {
            Int64 result = 0;
            try
            {
                Month = getMonth(Month).ToString();
                Month = Month.Length == 1 ? ("0" + Month) : Month;
                MTSHRDataLayer.Payroll payroll = new MTSHRDataLayer.Payroll();
                result = payroll.AddOrRemoveLop(EmployeeId, Month, Year, LeaveFrom, LeaveTo, Numberofdays, Reason,AutoLop, AddOrRemoveFlag, Convert.ToInt64(Session["UserID"].ToString()));
            }
            catch (Exception ex)
            {
                BaseExceptionHandler.HandleException(ref ex);
                result = -999;
            }
            return Content(result.ToString());
        }
              

        [HttpPost]
        public ActionResult UpdatePrevBounsDate(DateTime PrevBounsDate)
        {
            MTSHRDataLayer.Payroll PrevBouns = new MTSHRDataLayer.Payroll();
            Int64 result = PrevBouns.UpdatePrevBounsDate(PrevBounsDate, Convert.ToInt64(Session["UserID"].ToString()));
            return Json(new { success = true,
                                result = result });
        }

        [HttpPost]
        public ActionResult RevisePayrollDetails(Int64 Empid)
        {
            MTSHRDataLayer.Payroll revisePayroll = new MTSHRDataLayer.Payroll();
            Int64 result = revisePayroll.RevisePayrollDetails(Empid);
            if(result == 2)
            {
                return Content("1");
            }
            return Content("0");
        }
    }


}