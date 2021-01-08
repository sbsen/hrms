using MTSEntBlocks.ExceptionBlock.Handlers;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
        public ActionResult RedirectFromITDeclaration(Int64 EmpID = 0, Int64 FinancialYear = 0)
        {
            TempData["EmpID"] = EmpID;
            TempData["FinancialYear"] = FinancialYear;
            TempData["DirectITDeclaration"] = false;
            return RedirectToAction("EmployeeITDeclarationForm");
        }
        public ActionResult EmployeeITDeclarationForm()
        {
            ViewBag.FinancialYear = TempData["FinancialYear"];
            TempData.Keep("FinancialYear");
            ViewBag.DirectITDeclaration = TempData["DirectITDeclaration"];
            TempData.Keep("DirectITDeclaration");
            ViewBag.EmpID = TempData["EmpID"];
            TempData.Keep("EmpID");
            return View("ITDeclarationForm");
        }
        public ActionResult ITDeclarationForm()
        {
            ViewBag.FinancialYear = 0;
            ViewBag.EmpID = 0;
            TempData["DirectITDeclaration"] = true;
            ViewBag.DirectITDeclaration = Convert.ToBoolean(TempData["DirectITDeclaration"]);
            TempData.Keep("DirectITDeclaration");
            return View();
        }
        [HttpGet]
        public ActionResult getFinancialYearDetails(string year)
        {
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            Int64 sDate = Convert.ToInt64(year.Split('-')[0]);
            Int64 eDate = Convert.ToInt64(year.Split('-')[1]);
            var table = data.getFinancialYearDetails(sDate, eDate);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(table) }, JsonRequestBehavior.AllowGet);

        }
        [HttpGet]
        public ActionResult getITLiablity(Int64 EmployeeID, Int64 FinancialYear)
        {
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            DataSet dst = new DataSet();
            dst = data.getITLiablity(EmployeeID, FinancialYear);
            return Json(new { success = true, result = JsonConvert.SerializeObject(dst?.Tables[0]), result1 = JsonConvert.SerializeObject(dst?.Tables[1]) }, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SubmitITLiablity(List<ITModel> Tabledata, Int64 EmployeeID, Int64 FinancialYear)
        {
            try

            {
                DataTable TableData = JsonConvert.DeserializeObject<DataTable>(JsonConvert.SerializeObject(Tabledata));
                MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
                foreach (DataRow rowval in TableData.Rows)
                {
                    if (Convert.ToInt64(rowval["FLAG"]) == 2)
                    {
                        var month = rowval["MONTH_NAME"].ToString();
                        Int64 monthno = this.getMonth(month);
                        var checkinsert = data.SubmitITLiablity(EmployeeID, FinancialYear, monthno, Convert.ToDecimal(rowval["DEDUCTED_AMOUNT"]));
                    }
                }

                return Json(new { result = true });
            }

            catch (Exception ex)
            {

                throw ex;
            }

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
            if (Employee_ID == 0)
            {
                var EmpID = Session["UserID"].ToString();
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
            DataTable tableDetails = data.getOtherSourceIncomeDetails(Convert.ToInt64(Employee_ID), year);
            return Json(new { success = true, result1 = JsonConvert.SerializeObject(tableDetails) }, JsonRequestBehavior.AllowGet);
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

        public ActionResult ITDeclarationofEmployee(String Employee_ID, Int64 year, bool IT_Declaration, Decimal payable_tax)
        {
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            var table = data.ITDeclarationofEmployee(Convert.ToInt64(Employee_ID), Convert.ToInt64(year), IT_Declaration, payable_tax);
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

        public ActionResult getAssignedEmployees()
        {
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            DataTable result = new DataTable();
            result = data.getAssignedEmployees();
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
        [HttpPost]
        public ActionResult UploadImagefiles(HttpPostedFileBase qqfile, string employeecode, string fileid, string description)
        {
            string currentMonth = "";
            string filename = qqfile.FileName;
            string extension = Path.GetExtension(filename);
            Int64 result = 0;
            byte[] bytes;
            using (var binaryReader = new BinaryReader(qqfile.InputStream))
            {
                bytes = binaryReader.ReadBytes(Request.Files[0].ContentLength);
            }
            Stream excelStream = qqfile.InputStream;
            string path = @"D:\HRFiles";
            path = System.IO.Path.Combine(path, employeecode);
            var EmpID = Session["UserID"].ToString();
            string fileName = fileid + "-" + description + "" + extension;
            string fileNamewithall = fileid + "-" + description + ".*";
            //  MemoryStream ms = (MemoryStream)excelStream;
            // = ms.ToArray();
            if (!Directory.Exists(path))
                Directory.CreateDirectory(path);


            checkandDeleteExistingfiles(path, fileName);
            using (FileStream fs = new FileStream(Path.Combine(path, fileName), FileMode.CreateNew, FileAccess.Write))
            {
                fs.Write(bytes, 0, (int)bytes.Length);
                //fs.Close();
            }
            MTSHRDataLayer.ITDeclaration data = new MTSHRDataLayer.ITDeclaration();
            try
            {


            }
            catch (Exception e)
            {
                BaseExceptionHandler.HandleException(ref e);
            }
            return Json(new { result = result });
        }
        public ActionResult GetDocuments(string fileid, string description, string employeecode)
        {
            try
            {
                string path = @"D:\HRFiles";
                path = System.IO.Path.Combine(path, employeecode);
                string filename = fileid + "-" + description;
                if (true)
                {
                    byte[] imagedata;

                    filename = getfilename(path, filename);
                    if(filename != "")
                    {
                        path = Path.Combine(path, filename);
                        imagedata = getfile(path);

                        string imagename = filename;

                        string baseimage = Convert.ToBase64String(imagedata);
                        TempData["image"] = baseimage;
                        TempData["imagename"] = imagename;
                        //TempData["functiontype"] = functiontype;
                        TempData.Keep("functiontype");
                        return Content("Success");
                    }
                }
                else
                {
                    return Content("Failed");
                }
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return Content("Failed");
        }


        public ActionResult ViewDocuments()
        {
            try
            {

                ViewBag.Documents = TempData["Documents"];
                TempData.Keep("Documents");
                ViewBag.Image = TempData["image"];
                ViewBag.Imagename = TempData["imagename"];
                string Imagename = TempData["imagename"].ToString();
                //   string checkfunction = TempData["functiontype"].ToString();
                //   TempData.Keep("functiontype");
                string ext = Path.GetExtension(Imagename);


                if (ext == ".pdf")
                {
                    var imagefile = Convert.FromBase64String(TempData["image"].ToString());
                    // return this.File(imagefile, "image/" + ext, Imagename);
                    return new FileStreamResult(new MemoryStream(imagefile), ext);
                }
                else
                {
                    return View("ViewImage");
                }

            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return View("ViewImage");

        }

        public byte[] getfile(string filename)
        {

            using (FileStream fs = new FileStream(filename, FileMode.Open, FileAccess.Read))
            {
                // Create a byte array of file stream length
                byte[] bytes = System.IO.File.ReadAllBytes(filename);
                //Read block of bytes from stream into the byte array
                fs.Read(bytes, 0, System.Convert.ToInt32(fs.Length));
                //Close the File Stream
                fs.Close();
                return bytes; //return the byte data
            }

        }
        public string getfilename(string directory, string filename)
        {
            String fileName = "";
            var files = Directory.GetFiles(directory, filename + ".*");
            for (int i = 0; i < files.Length; i++)
            {
                string fnwithoutextension;

                fnwithoutextension = Path.GetFileNameWithoutExtension((files[i]));
                if (fnwithoutextension.Equals(filename))
                {

                    fileName = Path.GetFileName(files[i]);
                    return fileName;
                };


            }

            return fileName;
        }
        public Boolean checkandDeleteExistingfiles(string directory, string filename)
        {
            string filename_without_extension = Path.GetFileNameWithoutExtension(filename);
            var filesWithoutExtension = System.IO.Directory.GetFiles(directory).Where(c => Path.GetFileNameWithoutExtension(c) == filename_without_extension).ToList();
            if (filesWithoutExtension.Count > 0)
            {
                foreach (var item in filesWithoutExtension)
                {
                    System.IO.File.Delete(item);
                }
            }

            return true;
        }
        
    }
    public class ITModel
    {
        public Decimal DEDUCTED_AMOUNT { get; set; }

        public Int64 FLAG { get; set; }

        public string MONTH_NAME { get; set; }
    }
}