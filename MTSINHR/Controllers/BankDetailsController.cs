using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using MTSEntBlocks.ExceptionBlock.Handlers;
using MTSINHR.Models;
using Newtonsoft.Json;

namespace MTSINHR.Controllers
{
    public class BankDetailsController : SecureController
    {

        // GET: /BankDetails/
        public ActionResult BankDetails(Int64 id)
        {
              ViewBag.empid = id;
            return PartialView("BankDetails");
        }

        [HttpPost]
        public ActionResult AddEdit(BankDetails bank)
        {
            int result = 0;
            try
            {
                MTSHRDataLayer.BankDetails data_bank = new MTSHRDataLayer.BankDetails();
                result = data_bank.CreateUpdate_Bankdetails(bank.Accountnumber, bank.Bankname, bank.Branchname, bank.Employee_Id, bank.Flag, bank.Ifsccode);
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Json(new { success = result }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ReadBankDetails()
        {

            return View();
        }
        [HttpGet]
        public JsonResult Read()
        {
            MTSHRDataLayer.BankDetails bank_Details = new MTSHRDataLayer.BankDetails();
            return Json(JsonConvert.SerializeObject(bank_Details.Read()), JsonRequestBehavior.AllowGet);
        }

        public JsonResult FilterBankdetails(string StartDate, string EndDate)
        {
            MTSHRDataLayer.BankDetails employeedetails = new MTSHRDataLayer.BankDetails();
            return Json(JsonConvert.SerializeObject(employeedetails.FilterBankdetails(StartDate, EndDate)), JsonRequestBehavior.AllowGet);
        }

    }
}



