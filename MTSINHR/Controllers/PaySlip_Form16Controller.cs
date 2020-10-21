using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTS.Controllers;
using MTSINHR.Models;
using Rotativa;
using Humanizer;
using System.Globalization;
using System.Text.RegularExpressions;
using iTextSharp.text;
using iTextSharp.text.pdf;
using MTSEntBlocks.ExceptionBlock.Handlers;

namespace MTSINHR.Controllers
{
    public class PaySlip_Form16Controller : SecureController
    {

        // GET: /PaySlip/

        public ActionResult PaySlip_Form16()
        {
            DataTable dt = new DataTable();
            PaySlip_Form16 pay = new Models.PaySlip_Form16();
            MTSHRDataLayer.PaySlip data_payslip = new MTSHRDataLayer.PaySlip();
            dt = data_payslip.ReadEmployees();
            //pay.EmployeeList = GetSelectListItem(dt);
            ViewBag.EmployeeList = GetSelectListItem(dt);
            return View();
        }

        public static List<SelectListItem> GetSelectListItem(DataTable dt)
        {
            try
            {
                List<SelectListItem> items = new List<SelectListItem>();
                if (dt.Rows.Count > 0)
                {
                    items = (from dropdownfill in dt.AsEnumerable()
                             select new SelectListItem     // data()
                             {
                                 Value = dropdownfill.ItemArray[1].ToString(),
                                 Text = dropdownfill.ItemArray[0].ToString()
                             }).ToList();
                }
                return items;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        [HttpPost]
        public int PaySlip_Form16(PaySlip_Form16 datas)
        {
            try
            {
                MTSHRDataLayer.PaySlip data_payslip = new MTSHRDataLayer.PaySlip();
                string Employee_Id = string.IsNullOrEmpty(datas.Employee_ID) ? "0" : datas.Employee_ID;
                string Filename = Employee_Id + ".pdf";
                string FormMonth = datas.Date;
                string webconfigpath;
                TempData["Payform"] = datas.Payform;
                TempData.Keep("Payform");
                TempData["FormMonth"] = FormMonth;
                TempData.Keep("FormMonth");
                TempData["Authentication"] = Request.Headers["auth"];
                TempData.Keep("Authentication");
                TempData["Employee_Id"] = Employee_Id;
                TempData.Keep("Employee_Id");
                if (datas.Payform == "0")
                {

                    Char delimiter = '/';
                    string[] period = datas.Date.Split(delimiter);

                    DataTable model = data_payslip.Read(Employee_Id == "0" ? Session["EmployeeId"].ToString() : Employee_Id, period[0], period[1]);
                    if (model.Rows.Count > 0 && TempData["Authentication"].ToString() == "user")
                    {
                        TempData["year"] = period[0];
                        TempData.Keep("year");
                        TempData["month"] = period[1];
                        TempData.Keep("month");
                        return 1;
                    }
                    else if (TempData["Authentication"].ToString() == "admin")
                    {
                        TempData.Keep("Authentication");
                        if (datas.Employee_ID == "" || datas.Employee_ID == null)
                            model = data_payslip.ReadAllPayslipEmployees(period[0], period[1]);
                        else
                            model = data_payslip.Read(Employee_Id, period[0], period[1]);
                        if (model.Rows.Count > 0)
                        {
                            TempData["year"] = period[0];
                            TempData["month"] = period[1];
                            TempData["Employee_Id"] = Employee_Id;
                            return 2;
                        }
                        else
                        {
                            return 0;
                        }
                    }
                    else
                    {
                        return 0;
                    }
                }
                else
                {
                    //string Combinedpath = Path.Combine(ConfigurationManager.AppSettings["Form16path"].ToString(), FormMonth, Filename);
                string panNumber = data_payslip.ReadPanNumber(Employee_Id);
                string Combinedpath = Path.Combine(ConfigurationManager.AppSettings["Form16path"].ToString(), FormMonth);
                if (Directory.Exists(Combinedpath))
                {
                    string[] files = new string[] { };
                    if (Convert.ToInt64(FormMonth) > 2018)
                    {
                        files = Directory.GetFiles(Combinedpath, panNumber + "*.pdf", SearchOption.AllDirectories);
                    }
                    else
                    {
                       files = Directory.GetFiles(Combinedpath, Employee_Id + "*.pdf", SearchOption.AllDirectories);
                    }
                        if (files.Length > 0)
                        {
                            TempData["Filename"] = Filename;
                            TempData.Keep("Filename");
                            TempData["Combinedpath"] = Combinedpath;
                            TempData.Keep("Combinedpath");
                            return 2;
                        }
                        else
                        {
                            return 0;
                        }
                    }

                    else
                    {
                        return 0;
                    }
                }
            }
            catch(Exception ex)
            {
                BaseExceptionHandler.HandleException(ref ex);
            }
            return 0;

        }


        public ActionResult File()
        {
            try
            {
                string payform = TempData["Payform"].ToString();
                TempData.Keep("Payform");

                if (payform == "0")
                {
                    string empid = TempData["Employee_Id"].ToString();
                    TempData.Keep("Employee_Id");
                    if (String.IsNullOrEmpty(empid) || empid == "0")
                        empid = Session["EmployeeId"].ToString();
                    string tempyear = TempData["year"].ToString();
                    TempData.Keep("year");
                    Int64 year = Convert.ToInt64(tempyear);
                    string month = TempData["month"].ToString();
                    TempData.Keep("month");
                    PaySlip pay = new PaySlip();
                    DataTable model = new DataTable();
                    MTSHRDataLayer.PaySlip data_payslip = new MTSHRDataLayer.PaySlip();
                    if (TempData["Authentication"].ToString() == "admin")
                    {
                        TempData.Keep("Authentication");
                        if (TempData["Employee_Id"].ToString() == "0")
                        {
                            TempData.Keep("Employee_Id");
                            model = data_payslip.ReadAllPayslipEmployees(year, month);
                        }

                        else
                            model = data_payslip.Read(empid, year, month);
                    }
                    else
                    {
                        model = data_payslip.Read(empid, year, month);
                    }

                    for (int i = 0; i < model.Rows.Count; i++)
                    {
                        decimal netpayinwords = Convert.ToDecimal(model.Rows[i]["Net_Salary"].ToString());
                        pay.Employee_Id = model.Rows[i]["Emp_No"].ToString();
                        pay.Employee_Name = model.Rows[i]["Employee_Name"].ToString();
                        pay.Designation = model.Rows[i]["Designation"].ToString();
                        pay.Department = model.Rows[i]["Department"].ToString();
                        pay.Month = model.Rows[i]["Month"].ToString();
                        pay.Year = model.Rows[i]["Year"].ToString(); ;
                        pay.Dateofjoin = model.Rows[i]["Dateofjoin"].ToString();
                        pay.Pancard = model.Rows[i]["Pancard"].ToString();
                        pay.BankName = model.Rows[i]["Bankname"].ToString();
                        pay.Accountnumber = model.Rows[i]["Accountnumber"].ToString();
                        pay.Basic = Convert.ToDecimal(model.Rows[i]["Basic"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Prof_Dev = Convert.ToDecimal(model.Rows[i]["Prof_Dev"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Conveyance = Convert.ToDecimal(model.Rows[i]["Conveyance"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Communication_Allowance = Convert.ToDecimal(model.Rows[i]["Communication_Allowance"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Petrol_Allowance = Convert.ToDecimal(model.Rows[i]["Petrol_Allowance"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Driver_Allowance = Convert.ToDecimal(model.Rows[i]["Driver_Allowance"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Education_Allowance = Convert.ToDecimal(model.Rows[i]["Education_Allowance"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Food_Allowance = Convert.ToDecimal(model.Rows[i]["Food_Allowance"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Medical_Allowance = Convert.ToDecimal(model.Rows[i]["Medical_Allowance"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Meal_Pass = Convert.ToDecimal(model.Rows[i]["Meal_Pass"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.HRA = Convert.ToDecimal(model.Rows[i]["HRA"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Gross_Earnings = Convert.ToDecimal(model.Rows[i]["Gross_Earnings"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Net_Salary = Convert.ToDecimal(model.Rows[i]["Net_Salary"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Income_Tax = Convert.ToDecimal(model.Rows[i]["Income_Tax"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Total_Deduction = Convert.ToDecimal(model.Rows[i]["Total_Deduction"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Paid_Days = Convert.ToDecimal(model.Rows[i]["Paid_Days"]).ToString();
                        pay.PF = Convert.ToDecimal(model.Rows[i]["PF"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.PF_Account_Number = model.Rows[i]["PF_AccountNumber"].ToString();
                        pay.PF_UAN = Convert.ToInt64(model.Rows[i]["PF_UAN"]).ToString();
                        pay.ESI_Number = Convert.ToInt64(model.Rows[i]["ESI_Number"]).ToString();
                        pay.ESI = Convert.ToDecimal(model.Rows[i]["ESI"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Professional_Tax = Convert.ToDecimal(model.Rows[i]["Professional_Tax"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Others = Convert.ToDecimal(model.Rows[i]["Others"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Special_Allowance = Convert.ToDecimal(model.Rows[i]["Special_Allowance"]).ToString("N2", CultureInfo.InvariantCulture);
                        pay.Amountinwords = netpayinwords.ToString();

                        if (model.Rows.Count > 0 && TempData["Authentication"].ToString() == "admin")
                        {
                            var actionPdf = new PartialViewAsPdf("_Payslippdf", pay);
                            byte[] applicationPDFData = actionPdf.BuildPdf(ControllerContext);
                            string Directory = Path.Combine(ConfigurationManager.AppSettings["PayslipPath"], TempData["year"].ToString(), TempData["month"].ToString(), pay.Department);
                            string Combinedpath = Path.Combine(ConfigurationManager.AppSettings["PayslipPath"], TempData["year"].ToString(), TempData["month"].ToString(), pay.Department, pay.Employee_Id + ".pdf");
                            if (System.IO.Directory.Exists(Directory))
                            {
                                int count = 0;
                                if (!System.IO.File.Exists(Combinedpath))
                                {

                                    using (var stream = System.IO.File.Create(Combinedpath))
                                    {
                                        stream.Write(applicationPDFData, 0, applicationPDFData.Length);
                                    }
                                    TempData["Message"] = "Success";
                                }
                                else
                                {
                                    if (System.IO.File.Exists(Combinedpath))
                                    {
                                        System.IO.File.Delete(Combinedpath);
                                    }
                                    using (var stream = System.IO.File.Create(Combinedpath))
                                    {
                                        stream.Write(applicationPDFData, 0, applicationPDFData.Length);
                                    }
                                    TempData["Message"] = "Success";
                                    //TempData["Message"] = "Failed";
                                }
                            }

                            else
                            {
                                System.IO.Directory.CreateDirectory(Directory);
                                using (var stream = System.IO.File.Create(Combinedpath))
                                {
                                    stream.Write(applicationPDFData, 0, applicationPDFData.Length);
                                }
                                TempData["Message"] = "Success";
                            }
                        }
                        else
                        {
                            return new PartialViewAsPdf("_Payslippdf", pay);
                            //return PartialView("_Payslippdf", pay); //return partialview as html
                        }
                    }

                    //return PartialView("_Payslippdf", pay); //return partialview as html

                }
                else
                {
                    Int64 formYear = Convert.ToInt64(TempData["FormMonth"]);
                    string Filename = TempData["Filename"].ToString();
                    string Combinedpath = TempData["Combinedpath"].ToString();
                    //string Employee_Id = Session["EmployeeId"].ToString();
                    string Employee_Id = TempData["Employee_Id"].ToString();
                    byte[] form16Bytes = GetForm16PDF(Combinedpath, Employee_Id, formYear);
                    return File(form16Bytes, "application/pdf", Employee_Id + "_Form-16.pdf");

                }

                return RedirectToAction("PaySlip_Form16");
            }
            catch (Exception ex)
            {
                TempData["Message"] = "Failed";
                BaseExceptionHandler.HandleException(ref ex);
                return RedirectToAction("PaySlip_Form16");
            }
            
           
        }

        private byte[] GetForm16PDF(string folderPath, string empID,Int64 formYear)
        {
            MTSHRDataLayer.PaySlip data_payslip = new MTSHRDataLayer.PaySlip();
            string panNumber = data_payslip.ReadPanNumber(empID);
            string[] files = new string[] { };
            if (formYear > 2018)
            {
                files = Directory.GetFiles(folderPath, panNumber + "*.pdf", SearchOption.AllDirectories);
            }
            else
            {
                files = Directory.GetFiles(folderPath, empID + "*.pdf", SearchOption.AllDirectories);
            }
            //files = Directory.GetFiles(folderPath, empName+"_1"+".pdf", SearchOption.AllDirectories);
            byte[] pdfBytes = new byte[0];
            if (files.Length > 0)
            {
                using (MemoryStream stream = new MemoryStream())
                {
                    Document document = new Document();
                    PdfCopy pdf = new PdfCopy(document, stream);
                    PdfReader reader = null;
                    try
                    {
                        document.Open();
                        foreach (string file in files)
                        {
                            reader = new PdfReader(file);
                            pdf.AddDocument(reader);
                            reader.Close();
                        }
                    }
                    catch (Exception)
                    {
                        reader.Close();
                    }

                    document.Close();

                    pdfBytes = stream.ToArray();
                }
            }
            return pdfBytes;
        }

    }

}
