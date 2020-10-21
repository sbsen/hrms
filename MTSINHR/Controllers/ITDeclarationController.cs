using MTSEntBlocks.ExceptionBlock.Handlers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MTSINHR.Controllers
{
    public class ITDeclarationController : Controller
    {
        // GET: ITDeclaration
        public ActionResult ITDeclarationEmployeeDetails()
        {
            return View();
        }
        public ActionResult RedirectFromITDeclaration(Int64 EmpID = 0)
        {
            TempData["EmpID"] = EmpID;
            TempData["DirectITDeclaration"] = false;
            return RedirectToAction("EmployeeITDeclarationForm");
        }
        public ActionResult EmployeeITDeclarationForm()
        {
            ViewBag.DirectITDeclaration = TempData["DirectITDeclaration"];
            TempData.Keep("DirectITDeclaration");
            ViewBag.EmpID = TempData["EmpID"];
            TempData.Keep("EmpID");
            return View("ITDeclarationForm");
        }
        public ActionResult ITDeclarationForm()
        {

            TempData["DirectITDeclaration"] = true;
            ViewBag.DirectITDeclaration = Convert.ToBoolean(TempData["DirectITDeclaration"]);
            TempData.Keep("DirectITDeclaration");
            return View();
        }
        [HttpGet]
        public ActionResult getFinancialYearDetails(Int64 year = 0)
        {
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            var table = data.getFinancialYearDetails(year);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(table) }, JsonRequestBehavior.AllowGet);

        }

        [HttpPost]
        public ActionResult AddHouseLoanDetails(Int64 Id = 0, Decimal principalPaid = 0, Decimal interestPaid = 0, string nameLender = null, string lenderPAN = null, string LoanFinancialYear = null, Int64 Employee_ID = 0)
        {
            Int64 result = 0;
            var EmpID = Session["UserID"].ToString();

            if (Employee_ID == 0)
            {
                Employee_ID = Convert.ToInt64(EmpID);
            }
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            try
            {

                result = data.AddHouseLoanDetails(Id, Employee_ID, Convert.ToInt64(LoanFinancialYear), principalPaid, interestPaid, nameLender, lenderPAN);
                if (result > 0)
                {
                    result = 1;
                }
            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }


        public ActionResult getEmployeeDetails( Int64 Employee_ID = 0)
        {
            var EmpID = Session["UserID"].ToString();

            if (Employee_ID == 0)
            {
                Employee_ID = Convert.ToInt64(EmpID);
            }
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            var tableDetails = data.getEmployeeDetails(Convert.ToInt64(Employee_ID));
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(tableDetails.Tables[0]) }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult getHomeLoanDetails(Int64 year = 0, Int64 Employee_ID = 0)
        {
            var EmpID = Session["UserID"].ToString();

            if (Employee_ID == 0)
            {
                Employee_ID = Convert.ToInt64(EmpID);
            }
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            var tableDetails = data.getHomeLoanDetails(Convert.ToInt64(Employee_ID), year);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(tableDetails.Tables[0]) }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult gethomeRentDetails(Int64 year = 0, Int64 Employee_ID=0)
        {
            var EmpID = Session["UserID"].ToString();

            if(Employee_ID==0)
            {
                Employee_ID = Convert.ToInt64(EmpID);
            }
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            var tableDetails = data.gethomeRentDetails(Convert.ToInt64(Employee_ID), year);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(tableDetails.Tables[0]), result2 = JsonConvert.SerializeObject(tableDetails.Tables[1]) }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult getSummaryTabDetails(Int64 year = 0)
        {
            var EmpID = Session["UserID"].ToString();
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            var tableDetails = data.getSummaryTabDetails(Convert.ToInt64(EmpID), year);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(tableDetails.Tables[0]) }, JsonRequestBehavior.AllowGet);
        }


        public ActionResult getOtherSourceIncomeDetails(Int64 year = 0, Int64 Employee_ID = 0)
        {
            var EmpID = Session["UserID"].ToString();

            if (Employee_ID == 0)
            {
                Employee_ID = Convert.ToInt64(EmpID);
            }
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            var tableDetails = data.getOtherSourceIncomeDetails(Convert.ToInt64(Employee_ID), year);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(tableDetails.Tables[0]) }, JsonRequestBehavior.AllowGet);
        }
        public ActionResult getSectionDescriptionDetails(Int64 year = 0, Int64 Employee_ID = 0)
        {
            var EmpID = Session["UserID"].ToString();

            if (Employee_ID == 0)
            {
                Employee_ID = Convert.ToInt64(EmpID);
            }
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            var tableDetails = data.getSectionDescriptionDetails(Convert.ToInt64(Employee_ID), year);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(tableDetails.Tables[0]), result2 = JsonConvert.SerializeObject(tableDetails.Tables[1]) }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ITDeclarationofEmployee(String Employee_ID, String year, bool IT_Declaration, Decimal payable_tax)
        {
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            var table = data.ITDeclarationofEmployee(Convert.ToInt64(Employee_ID), Convert.ToInt64(year), IT_Declaration, payable_tax).ToString();
            Int64 result = Convert.ToInt64(table) > 0 ? 1 : 0;
            return Json(new { success = true, result = result }, JsonRequestBehavior.AllowGet);

        }
        public ActionResult getFinancialYear()
        {
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            DataTable result = new DataTable();
            result = data.getFinancialYear();
            return Json(new { success = true, result = JsonConvert.SerializeObject(result) }, JsonRequestBehavior.AllowGet);

        }
        [HttpPost]
        public ActionResult addOtherSourceIncomeDetails(Int64 Id = 0, Int64 financialYear = 0, decimal incomeOtherSource = 0, decimal savingsInterst = 0, decimal fixedInterest = 0, Int64 Employee_ID = 0)
        {
            Int64 result = 0;
            var EmpID = Session["UserID"].ToString();

            if (Employee_ID == 0)
            {
                Employee_ID = Convert.ToInt64(EmpID);
            }
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            try
            {

                result = data.addOtherSourceIncomeDetails(Id, Employee_ID, Convert.ToInt64(financialYear), null, Convert.ToDecimal(incomeOtherSource), Convert.ToDecimal(savingsInterst), Convert.ToDecimal(fixedInterest));
                if (result > 0)
                {
                    result = 1;
                }
            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }

        [HttpPost]
        public ActionResult FinalSubmitITDeclaration(Int64 emp_IT_ID=0, bool DirectITDeclaration=false)
        {
            Int64 result = 0;
            var EmpID = Session["UserID"].ToString();
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            try
            {

                result = data.FinalSubmitITDeclaration (emp_IT_ID,Convert.ToBoolean(DirectITDeclaration), DateTime.Now, EmpID);
                if (result > 0)
                {
                    result = 1;
                }
            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }


        [HttpPost]
        public ActionResult AddHomeRentDetails(Int64 Id = 0, string year = null, string fromdate = null, string todate = null, string PAN = null, string address = null, string amount = null, string Name = null, Int64 Employee_ID = 0,Int64 HRA_ActualAmt=0)
        {
            Int64 result = 0;
            var EmpID = Session["UserID"].ToString();

            if (Employee_ID == 0)
            {
                Employee_ID = Convert.ToInt64(EmpID);
            }
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            try
            {

                result = data.AddHomeRentDetails(Id, Employee_ID, Convert.ToInt64(year), Convert.ToDateTime(fromdate), Convert.ToDateTime(todate), Convert.ToDecimal(amount), PAN, address, Name, Convert.ToDecimal(HRA_ActualAmt));
                if (result > 0)
                {
                    result = 1;
                }
            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }

        [HttpPost]
        public ActionResult saveITFormDetails(Int64 emp_IT_id = 0, string tempSection = null, string tempSubSectionList = null, string tempsubAmtList = null, string tempActualAmtList = null, decimal totalDeclaredAmt = 0, decimal totalActualAmt = 0, Int64 year = 0 ,Int64 Employee_ID=0)
        {
            var EmpID = Session["UserID"].ToString();

            if (Employee_ID == 0)
            {
                Employee_ID = Convert.ToInt64(EmpID);
            }
            Int64 result = 0;
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();

            try
            {
                string[] SubSectionList = tempSubSectionList.Split(',');
                string[] SubmittedAmt = tempsubAmtList.Split(',');
                string[] ActualAmt = tempActualAmtList.Split(',');

                if (SubSectionList != null && SubSectionList.Length > 0)
                {
                    for (int int_i = 0; int_i <= SubSectionList.Length; int_i++)
                    {
                        if (int_i == SubSectionList.Length)
                        {
                            result = data.saveITFormDetails(emp_IT_id, tempSection, "", Convert.ToDecimal(totalDeclaredAmt), null, null, null, Convert.ToDecimal(totalActualAmt), null, null, year, Employee_ID);
                        }
                        else
                        {
                            result = data.saveITFormDetails(emp_IT_id, tempSection, (SubSectionList[int_i]), Convert.ToDecimal(SubmittedAmt[int_i]), null, null, null, Convert.ToDecimal(ActualAmt[int_i]), null, null, year, Employee_ID);
                        }
                    }
                }
                if (result > 0)
                {
                    result = 1;
                }


            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }
    }
}