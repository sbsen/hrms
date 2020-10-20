using MTSEntBlocks.ExceptionBlock.Handlers;
using Newtonsoft.Json;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSINHR.Models;
using MTSHRDataLayer;
using System.Globalization;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class AttendanceLogController : SecureController
    {
        // GET: AttendanceLog
        public ActionResult GetMonthlyAttendance()
        {
            return View();
        }
        public ActionResult AttendanceLog()
        {
            return View();
        }
         [HttpPost]
        public ActionResult ExcelUpload(HttpPostedFileBase qqfile, string Dateval)
        {
            string currentMonth = "";
            string filename = qqfile.FileName;
            string extension = Path.GetExtension(filename);
            try
            {
                if (string.IsNullOrEmpty(Dateval))
                {
                    var msg = "Please select Processing Month & Year";
                    return Json(new { success = false, message = msg }, JsonRequestBehavior.AllowGet);
                }
                string[] date = new string[2];
                date = Dateval.Split('-');
                //var year = date[1].Trim().ToString();
                int Month = this.getMonth(date[0]);
                string choosenMonth = Month.ToString() + "/" + date[1].Trim();
                Stream excelStream = qqfile.InputStream;
                IWorkbook wb;
                ISheet sheet;
                if (Path.GetExtension(qqfile.FileName) == ".xlsx")
                {
                    wb = new XSSFWorkbook(excelStream);
                }
                else if (Path.GetExtension(qqfile.FileName) == ".xls")
                {
                    wb = new HSSFWorkbook(excelStream);
                }
                else
                {
                    return Json(new { success = false, message = "Invalid Extension. Please Use .xls or .xlsx" }, JsonRequestBehavior.AllowGet);
                    //throw new Exception("This format is not supported");
                }
                sheet = wb.GetSheetAt(0);
                //GetSheet("TenantVendor");
                DataRow Row;
                DataTable AttendanceLogtable = new DataTable();
                AttendanceLogtable = this.AddColumns();
                var error_msg = "";
                for (int row = 1; row <= sheet.LastRowNum; row++)
                {
                    string value = "";
                    Row = AttendanceLogtable.NewRow();
                    IRow excelrow = (IRow)sheet.GetRow(row);
                    bool CheckEmptyRows = excelrow != null ? excelrow.Cells.All(d => d.CellType == CellType.Blank) : true;
                    if (!CheckEmptyRows)
                    {
                        if (sheet.GetRow(row) != null) //null is when the row only contains empty cells   
                        {
                            for (int j = 0; j < AttendanceLogtable.Columns.Count; j++)
                            {
                                if (sheet.GetRow(row).GetCell(j) != null)
                                {
                                    value = sheet.GetRow(row).GetCell(j).ToString();
                                    Row[j] = value;
                                }
                            }
                        }
                    }
                    Row["ERROR_MESSAGE"] = error_msg;
                    AttendanceLogtable.Rows.Add(Row);
                }
                //AttendanceLogtable = this.validateFileUpload(AttendanceLogtable);
                //List<string> ErrorList = validateFileUpload(AttendanceLogtable, currentMonth, choosenMonth);

                DataSet ErrorTable = validateFileUpload(AttendanceLogtable, currentMonth, choosenMonth);
                if (ErrorTable.Tables[0].Rows.Count > 0)
                {
                    return Json(new { success = false, message = JsonConvert.SerializeObject(ErrorTable.Tables[1]) }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    int result = insertExcel(AttendanceLogtable);
                    if (result == 1)
                    {
                        return Json(new { success = true, message = "Uploaded Successfully" }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        return Json(new { success = true, message = "Uploaded Failed" }, JsonRequestBehavior.AllowGet);
                    }
                }
            }
            catch (Exception ex)
            {
                var msg = "Mapping columns Error. kindly Verify.";
                var result = new { success = false, message = msg };
                return Json(result, JsonRequestBehavior.AllowGet);
            }

        }
       
	
     
	 
	 

       
        [HttpGet]
        public ActionResult MonthlyAttendanceDetails()
        {
            TempData.Keep("Title");
            return View();
        }
        [HttpPost]
        public ActionResult MonthlyAttendanceDetails(Attendance_Log attendanceLog)
        {
            if (ModelState.IsValid)
            {
                if (Session["RoleId"].ToString() == "2")
                {
                    TempData["Empcode"] = Session["EmployeeId"];
                    TempData["Date"] = attendanceLog.Date;
                    return RedirectToAction("ReadEmployeeEntry", "EmployeeEntry");
                }
                TempData["Title"] = attendanceLog.Date.ToString("yyyy/MMMM") + " - " + "Month Attendance Details";
                TempData["Date"] = attendanceLog.Date;
                return RedirectToAction("MonthlyAttendanceDetails");
            }
            return RedirectToAction("Attendance_Log");
        }
        [HttpGet]
        public JsonResult ReadMonthlyAttendanceDetails()
        {
            DateTime date = Convert.ToDateTime(TempData["Date"]);
            TempData.Keep("Date");
            DataTable dt = new DataTable();
            try
            {
                Int64 RoleId = Int64.Parse(Session["RoleId"].ToString());
                Int64 UserId = Int64.Parse(Session["UserID"].ToString());
                MTSHRDataLayer.AttendanceLog attendance_Log = new MTSHRDataLayer.AttendanceLog();
                dt = attendance_Log.ReadMonthlyAttendanceDetails(date, RoleId, UserId);
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
                dt = new DataTable();
            }
            return Json(JsonConvert.SerializeObject(dt), JsonRequestBehavior.AllowGet);

        }
		
		  private int getMonth(string monthName)
        {
            string month = monthName.ToUpper().Trim();
            if (month == "JANUARY" || month == "JAN" || month == "1")
                return 1;
            else if (month == "FEBRUARY" || month == "FEB" || month == "2")
                return 2;
            else if (month == "MARCH" || month == "MAR" || month == "3")
                return 3;
            else if (month == "APRIL" || month == "APR" || month == "4")
                return 4;
            else if (month == "MAY" || month == "MAY" || month == "5")
                return 5;
            else if (month == "JUNE" || month == "JUN" || month == "6")
                return 6;
            else if (month == "JULY" || month == "JUL" || month == "7")
                return 7;
            else if (month == "AUGUST" || month == "AUG" || month == "8")
                return 8;
            else if (month == "SEPTEMBER" || month == "SEP" || month == "9")
                return 9;
            else if (month == "OCTOBER" || month == "OCT" || month == "10")
                return 10;
            else if (month == "NOVEMBER" || month == "NOV" || month == "11")
                return 11;
            else if (month == "DECEMBER" || month == "DEC" || month == "12")
                return 12;
            else
                return 0;
        }

        private DataTable AddColumns()
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("Employee Code");
            dt.Columns.Add("Employee Name");
            dt.Columns.Add("In Device Name");
            dt.Columns.Add("Out Device Name");
            dt.Columns.Add("Status Code");
            dt.Columns.Add("Duration");
            dt.Columns.Add("Punch Records");
            dt.Columns.Add("In DateTime");
            dt.Columns.Add("Out DateTime");
            
            dt.Columns.Add("ERROR_MESSAGE");
            return dt;
        }
        public DateTime ParseRequestDate(string date)
        {

        

         
            //var dt = "7/25/2013 6:37:31 PM";
            //var dt = "2013-07-25 14:26:00";

            DateTime dateValue;

            var formatStrings = new string[] { "M-d-yy H:mm", "M-d-yyyy H:mm","yyyy-M-d H:mm" };
            if (DateTime.TryParseExact(date, formatStrings, CultureInfo.InvariantCulture, DateTimeStyles.None, out dateValue))
                return dateValue;

            throw new Exception("Don't know how to parse...");
        }
        private DataSet validateFileUpload(DataTable AttendanceLogtable, string currentMonth, string choosenMonth)
        {
            //List<string> ErrorList = new List<string>();
            DataSet err_attendance = new DataSet();
            DataTable ErrorTable = new DataTable();
            ErrorTable.Columns.Add("Error");
            //for(int rowno = 0; rowno < AttendanceLogtable.Rows.Count; rowno++)
            //{
            //    string error_msg = "";
            //    if (In_DateTime != null || In_DateTime.ToString() != "")
            //    {
            //        string curMonth = In_DateTime.ToString();
            //        string[] monthName = curMonth.Split('-');
            //        int m = getMonth(monthName[1]);
            //        currentMonth = m.ToString() + "/" + monthName[2];
            //        if(currentMonth != choosenMonth)
            //        {
            //            //ErrorList.Add("Choosen Month and the Excel Month not Matched");
            //            if (error_msg == "")
            //            {
            //                error_msg = "1";
            //            }
            //            else
            //            {
            //                error_msg = error_msg + ",1";
            //            }
            //            ErrorTable.Rows.Add("Choosen Month and the Excel Month not Matched");
            //            AttendanceLogtable.Rows[rowno]["ERROR_MESSAGE"] = error_msg;
            //            break;
            //        }
            //        break;
            //    }
            //}
            if (ErrorTable.Rows.Count == 0)
            {

                List<string> Namelist = new List<string>();
                List<string> CheckEmpId = new List<string>();
                List<string> ValidEmpId = new List<string>();
                List<string> ValidEmpIdName = new List<string>();
                for (int rowno = 0; rowno < AttendanceLogtable.Rows.Count; rowno++)
                {
                    string error_msg = "";
                    string Employee_Code = AttendanceLogtable.Rows[rowno]["Employee Code"].ToString().Trim();
                    string Employee_Name = AttendanceLogtable.Rows[rowno]["Employee Name"].ToString().Trim();
                    string In_Device_Name = AttendanceLogtable.Rows[rowno]["In Device Name"].ToString().Trim();
                    string Out_Device_Name = AttendanceLogtable.Rows[rowno]["Out Device Name"].ToString().Trim();
                    string Status_Code = AttendanceLogtable.Rows[rowno]["Status Code"].ToString().Trim();
                    string Duration = AttendanceLogtable.Rows[rowno]["Duration"].ToString().Trim();
                    string Punch_Records = AttendanceLogtable.Rows[rowno]["Punch Records"].ToString().Trim();
                    string Out_DateTime = (AttendanceLogtable.Rows[rowno]["out DateTime"]).ToString().Trim();
                    string In_DateTime = (AttendanceLogtable.Rows[rowno]["In DateTime"]).ToString().Trim();


                    if (In_DateTime != null && In_DateTime != "")
                    {
                        if (In_DateTime.Contains("/")) {
                            In_DateTime=In_DateTime.Replace("/", "-");
                            Out_DateTime = Out_DateTime.Replace("/", "-");
                            AttendanceLogtable.Rows[rowno]["In DateTime"] = In_DateTime;
                            AttendanceLogtable.Rows[rowno]["out DateTime"] = Out_DateTime;

                        }


                        DateTime In_time = ParseRequestDate(In_DateTime);
                            //DateTime.ParseExact(, formatStrings, CultureInfo.InvariantCulture);


                        currentMonth = In_time.ToString("M/yyyy", CultureInfo.InvariantCulture);
                         
                        if (currentMonth != choosenMonth)
                        {
                            //ErrorList.Add("Choosen Month and the Excel Month not Matched");
                            if (error_msg == "")
                            {
                                error_msg = "1";
                            }
                            else
                            {
                                error_msg = error_msg + ",1";
                            }
                            ErrorTable.Rows.Add("Choosen Month and the Excel Month not Matched");
                            AttendanceLogtable.Rows[rowno]["ERROR_MESSAGE"] = error_msg;

                        }

                    }

                    if (Employee_Code == null || Employee_Code == "")
                    {
                        
                        //ErrorList.Add("Employee Code in row " + rowno + "is empty");
                        ErrorTable.Rows.Add("Employee Code in row " + rowno + "is empty");
                        if (error_msg == "")
                        {
                            error_msg = "3";
                        }
                        else
                        {
                            error_msg = error_msg + ",3";
                        }

                    }

                    else
                    {

                        Int64 length_id = Employee_Code.Length;
                        if (length_id < 5)
                        {
                            string emp_prev = "E";
                            for (int i = 0; i < 5 - length_id; i++)
                            {

                                if (i != 0)
                                {
                                    emp_prev += "0";
                                }
                                                              
                            }
                            AttendanceLogtable.Rows[rowno]["Employee Code"] = emp_prev + Employee_Code;
                            Employee_Code = emp_prev + Employee_Code;

                        }
                    }


                    if (Employee_Name == null || Employee_Name == "")
                    {
                        //ErrorList.Add("Employee Name in row " + rowno + "is empty");
                        ErrorTable.Rows.Add("Employee Name in row " + rowno + "is empty");
                        if (error_msg == "")
                        {
                            error_msg = "4";
                        }
                        else
                        {
                            error_msg = error_msg + ",4";
                        }
                    }
                    if (Status_Code.ToUpper() != "A"|| Status_Code != "WO")
                    {
                        if (Punch_Records == ""
                           || Duration == "" || Out_DateTime == ""
                           || In_Device_Name == "" || Out_Device_Name == ""|| In_DateTime=="")
                        {
                            //ErrorList.Add("Required fields in row " + rowno + "is empty");
                            ErrorTable.Rows.Add("Required fields in row " + rowno + "is empty");
                            if (error_msg == "")
                            {
                                error_msg = "5";
                            }
                            else
                            {
                                error_msg = error_msg + ",5";
                            }
                        }


                    }

                    if (In_DateTime != null || In_DateTime != "")
                    {
                        if (Status_Code == "" || Punch_Records == ""
                            && Duration == "" || Out_DateTime == ""
                            && In_Device_Name == "" || Out_Device_Name == "")
                        {
                            //ErrorList.Add("Required fields in row " + rowno + "is empty");
                            ErrorTable.Rows.Add("Required fields in row " + rowno + "is empty");
                            if (error_msg == "")
                            {
                                error_msg = "5";
                            }
                            else
                            {
                                error_msg = error_msg + ",5";
                            }
                        }



                    }
                    else
                    {
                        if ( Punch_Records != ""
                            || Duration != "" || Out_DateTime != ""
                            || In_Device_Name != "" || Out_Device_Name != "")
                        {
                            //ErrorList.Add("Required fields in row " + rowno + "is empty");
                            ErrorTable.Rows.Add("Required fields in row " + rowno + "is empty");
                            if (error_msg == "")
                            {
                                error_msg = "5";
                            }
                            else
                            {
                                error_msg = error_msg + ",5";
                            }
                        }
                    }

                    if (Employee_Code != "" && In_DateTime != "")
                    {

                        string checkDuplicate = Employee_Code + In_DateTime;
                        if (Namelist.Contains(checkDuplicate))
                        {
                            ErrorTable.Rows.Add("Employee Details in row " + rowno + "is DuplicateCopy");
                            if (error_msg == "")
                            {
                                error_msg = "2";
                            }
                            else
                            {
                                error_msg = error_msg + ",2";
                            }
                        }
                        else
                        {
                            Namelist.Add(checkDuplicate);
                        }
                    }


                    if (Employee_Code != "")
                    {
                        if (CheckEmpId.Contains(Employee_Code) && !ValidEmpId.Contains(Employee_Code))
                        {
                            ErrorTable.Rows.Add(rowno + " is an Invalid Employee");
                            if (error_msg == "")
                            {
                                error_msg = "6";
                            }
                            else
                            {
                                error_msg = error_msg + ",6";
                            }
                        }
                        //else if (CheckEmpId.Contains(Employee_Code) && !ValidEmpId.Contains(Employee_Code + Employee_Name))
                        //{
                        //    ErrorTable.Rows.Add(rowno + " is an Invalid Employee (Mismatching Id with Name)");
                        //    if (error_msg == "")
                        //    {
                        //        error_msg = "7";
                        //    }
                        //    else
                        //    {
                        //        error_msg = error_msg + ",7";
                        //    }
                        //}
                        else
                        {
                            CheckEmpId.Add(Employee_Code);
                            DataSet result = MTSHRDataLayer.AttendanceLog.CheckEmpID(Employee_Code, Employee_Name);

                            if (Convert.ToBoolean(result.Tables[0].Rows[0]["Column1"].ToString()) == true)
                            {
                                ValidEmpId.Add(Employee_Code);
                            }
                            else
                            {
                                ErrorTable.Rows.Add(rowno + " is an Invalid Employee");
                                if (error_msg == "")
                                {
                                    error_msg = "6";
                                }
                                else
                                {
                                    error_msg = error_msg + ",6";
                                }
                            }

                            // check EmpId and Emp Name (Mismatching Id with Name)
                            //if (Convert.ToInt32(result.Tables[1].Rows.Count) > 0)
                            //{
                            //    ValidEmpIdName.Add(Employee_Code + Employee_Name);
                            //}
                        }
                    }

                    

                    int b = ErrorTable.Rows.Count;
                    AttendanceLogtable.Rows[rowno]["ERROR_MESSAGE"] = error_msg;
                }
            }
            //return ErrorList;
            
            err_attendance.Tables.Add(ErrorTable);
            err_attendance.Tables.Add(AttendanceLogtable);
            return err_attendance;
        }
        [HttpPost]
        public ActionResult SaveAttendanceExcel(string TableData, string Month)
        {
            try
            {
                DataTable dt = (DataTable)JsonConvert.DeserializeObject(TableData, (typeof(DataTable)));
               int status= insertExcel(dt);
                if (status > 0)
                {
                    return Json(new { success = status });
                }else
                {
                    return Json(new { success = false });

                }
              
            }
            catch (Exception e)
            {
                return Json(new{ success = false});
            }
        }
        private int insertExcel(DataTable attendanceLogtable)
        {
            try
            {
                int Count = 0;
                string MonthCol = "";
                for (int rowno = 0; rowno < attendanceLogtable.Rows.Count; rowno++)
                {
                    if (attendanceLogtable.Rows[rowno]["In DateTime"] != null || attendanceLogtable.Rows[rowno]["In DateTime"].ToString().Trim() != "")
                    {
                        MonthCol = attendanceLogtable.Rows[rowno]["In DateTime"].ToString().Trim();
                        break;
                    }
                }
                long dt = 0;
                if (attendanceLogtable.Rows.Count > 0)
                {
                   
                    List<string> Namelist = new List<string>();
                    for (int rowno = 0; rowno < attendanceLogtable.Rows.Count; rowno++)
                    {


                        if (attendanceLogtable.Rows[rowno]["Employee Code"].ToString().Trim() != "" && attendanceLogtable.Rows[rowno]["In DateTime"].ToString().Trim() != "")
                        {

                            string checkDuplicate = attendanceLogtable.Rows[rowno]["Employee Code"].ToString().Trim() + attendanceLogtable.Rows[rowno]["In DateTime"].ToString().Trim();

                            if (!Namelist.Contains(checkDuplicate))
                            {
                                Namelist.Add(checkDuplicate);
                                dt = insertData(attendanceLogtable, rowno, MonthCol);
                            }
                        }
                        else if(attendanceLogtable.Rows[rowno]["Employee Code"].ToString().Trim() != "" && attendanceLogtable.Rows[rowno]["In DateTime"].ToString().Trim() == "")
                        {
                            dt = insertData(attendanceLogtable, rowno, MonthCol);
                        }

                        if (dt == 1)
                        {
                            Count = Count + 1;
                        }
                    }

                }
                
                return Count;
            }
            catch (Exception e)
            {

                return -1;
            }
        }
        private long insertData(DataTable attendanceLogtable, int rowno, string monthCol)
        {
            MTSHRDataLayer.AttendanceLog attendanceLog = new MTSHRDataLayer.AttendanceLog();
            var result = attendanceLog.InsertAttData(attendanceLogtable.Rows[rowno]["Employee Code"].ToString().Trim(),
                                                     attendanceLogtable.Rows[rowno]["Employee Name"].ToString().Trim(),
                                                     attendanceLogtable.Rows[rowno]["In Device Name"].ToString().Trim(),
                                                     attendanceLogtable.Rows[rowno]["Out Device Name"].ToString().Trim(),
                                                     attendanceLogtable.Rows[rowno]["Status Code"].ToString().Trim(),
                                                     Convert.ToInt64(attendanceLogtable.Rows[rowno]["Duration"]),
                                                     attendanceLogtable.Rows[rowno]["Punch Records"].ToString().Trim(),
                                                     (attendanceLogtable.Rows[rowno]["In DateTime"].ToString().Trim()!="")? ParseRequestDate(attendanceLogtable.Rows[rowno]["In DateTime"].ToString()):(DateTime ?)null,
                                                     (attendanceLogtable.Rows[rowno]["out DateTime"].ToString().Trim() != "") ? ParseRequestDate(attendanceLogtable.Rows[rowno]["out DateTime"].ToString()) : (DateTime?)null,

                                                   (monthCol.Trim() != "") ?ParseRequestDate(monthCol) : (DateTime?)null);
            return result == -1 ? 0 : result;
        }
    }
}