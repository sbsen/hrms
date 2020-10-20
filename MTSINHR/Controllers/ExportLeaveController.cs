using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using ClosedXML.Excel;
using MTSINHR.Models;
using Newtonsoft.Json;

namespace MTSINHR.Controllers
{
    public class ExportLeaveController : Controller
    {
        //
        // GET: /ExportLeave/



        [HttpPost]
        public FileResult GetAllEmployeeLeaveList(Leave le)
        {
            MTSHRDataLayer.EmployeeLeave data_leaves = new MTSHRDataLayer.EmployeeLeave();
            DataTable dt = new DataTable("Grid");
            dt = data_leaves.GetAllEmployeeApprovedLeaveList(le.FromDate, le.ToDate, le.EmployeeName);

            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt);
                using (MemoryStream stream = new MemoryStream())
                {
                    wb.SaveAs(stream);
                    return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Grid.xlsx");
                }
            }

        }
    }
}

