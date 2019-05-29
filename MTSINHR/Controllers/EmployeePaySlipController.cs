using MTSINHR.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Rotativa;
using System.Data;
namespace MTSINHR.Controllers
{
    public class EmployeePaySlipController : Controller
    {
        //
        // GET: /EmployeePaySlip/

        public ActionResult PaySlip()
        {
            //var model = new PaySlip();
            //string empid = Session["UserID"].ToString();
            //Int64 id = Convert.ToInt64(empid);
            //MTSHRDataLayer.PaySlip data_payslip = new MTSHRDataLayer.PaySlip();
            //DataTable model = data_payslip.Read(id);
            
            //PaySlip pay = new PaySlip();
            
            //pay.Employee_Id = model.Rows[0]["Employee_Id"].ToString();
            //pay.Employee_Name = model.Rows[0]["EmployeeName"].ToString();
            //pay.Designation = model.Rows[0]["Designation"].ToString();
            //pay.Department = model.Rows[0]["Department"].ToString();
            //pay.Dateofjoin = Convert.ToDateTime(model.Rows[0]["Dateofjoin"]);
            //pay.Pancard = model.Rows[0]["Pancard"].ToString();
            //pay.BankName = model.Rows[0]["Bankname"].ToString();
            //pay.Accountnumber =  Convert.ToInt64(model.Rows[0]["Accountnumber"].ToString());
            //pay.Basic = Convert.ToInt64(model.Rows[0]["Basic"]);
            //pay.Conveyance = Convert.ToInt64(model.Rows[0]["Conveyance"]);
            //pay.Food_Allowance = Convert.ToInt64(model.Rows[0]["Food_Allowance"]);
            //pay.Meal_Pass = Convert.ToInt64(model.Rows[0]["Food_Coupon"]);
            //pay.HRA = Convert.ToInt64(model.Rows[0]["HRA"]);
            //pay.Income_Tax = Convert.ToInt64(model.Rows[0]["Income_Tax"]);
            //pay.Paid_Days = Convert.ToInt64(model.Rows[0]["Paid_Days"]);
            //pay.PF = Convert.ToInt64(model.Rows[0]["PF"]);
            //pay.PF_Account_Number = model.Rows[0]["PF_Account_Number"].ToString();
            //pay.PF_UAN = Convert.ToInt64(model.Rows[0]["PF_UAN"]);
            //pay.Professional_Tax = Convert.ToInt64(model.Rows[0]["Professional_Tax"]);
            //pay.Special_Allowance = Convert.ToInt64(model.Rows[0]["Special_Allowance"]);

            return new Rotativa.ViewAsPdf("PaySlip") { FileName = "Sample.pdf" };
        }



        public JsonResult GetPaySlipDetails()
        {
            string empid = Session["UserID"].ToString();
            Int64 id = Convert.ToInt64(empid);
            MTSHRDataLayer.PaySlip data_payslip = new MTSHRDataLayer.PaySlip();
            return Json(JsonConvert.SerializeObject(data_payslip.Read(id)), JsonRequestBehavior.AllowGet);
        }


    }
}
