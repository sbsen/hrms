using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MTSEntBlocks.ExceptionBlock.Handlers;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using NPOI.XSSF.Extractor;
using NPOI.XSSF.UserModel;
using MTS.Controllers;

namespace MTSINHR.Controllers
{
    public class ImportExcelController : SecureController
    {
        //
        // GET: /ImportExcel/

        public ActionResult Import()
        {
            return View();
        }
        [HttpPost]
        public int Import(HttpPostedFileBase path1)
        {
            int result = 0;
            try
            {
                List<object> strvalue = new List<object>();
              
                MTSHRDataLayer.ImportExcel importdata = new MTSHRDataLayer.ImportExcel();
                HttpPostedFileBase files = Request.Files[0]; //Read the Posted Excel File  
                ISheet sheet; //Create the ISheet object to read the sheet cell values  
                string filename = Path.GetFileName(Server.MapPath(files.FileName)); //get the uploaded file name  
                var fileExt = Path.GetExtension(filename); //get the extension of uploaded excel file  
                if (fileExt == ".xls")
                {
                    HSSFWorkbook hssfwb = new HSSFWorkbook(files.InputStream); //HSSWorkBook object will read the Excel 97-2000 formats  
                    sheet = hssfwb.GetSheetAt(0); //get first Excel sheet from workbook  
                }
                else
                {
                    XSSFWorkbook hssfwb = new XSSFWorkbook(files.InputStream); //XSSFWorkBook will read 2007 Excel format  
                    sheet = hssfwb.GetSheetAt(0); //get first Excel sheet from workbook   
                }
                DataTable table = new DataTable();
                DataRow dr = table.NewRow();
                Int32 PayslipImportCellCount=26;
                Int32.TryParse(ConfigurationManager.AppSettings["PayslipImportCellCount"], out PayslipImportCellCount);
                for (int row = 0; row <= sheet.LastRowNum; row++) //Loop the records upto filled row  
                {
                    strvalue = new List<object>();
                    if (sheet.GetRow(row) != null) //null is when the row only contains empty cells   
                    {

                        for (int j = 0; j < PayslipImportCellCount; j++)
                        {
                            if (row == 0)
                            {
                                string value = (sheet.GetRow(row).GetCell(j).ToString());
                                value = value.Replace(",", "");
                                table.Columns.Add(value, typeof(string));
                            }
                            else
                            {
                                if (!(sheet.GetRow(row).Cells.All(d => d.CellType == CellType.Blank)))
                                {

                                    string value = (sheet.GetRow(row).GetCell(j).ToString());
                                    value = value.Replace(",", "");
                                    if (value == string.Empty)
                                    {
                                        value = "0";
                                    }
                                    dr[sheet.GetRow(0).GetCell(j).ToString()] = value;
                                }
                                
                            }
                        }
                        if (row != 0 && !(sheet.GetRow(row).Cells.All(d => d.CellType == CellType.Blank)))
                        {
                            table.Rows.Add(dr);
                            dr = table.NewRow();
                        }
                    }

                }
                result = importdata.AddDetails(table);
            }
            catch (Exception exec)
            {
                BaseExceptionHandler.HandleException(ref exec);
            }
            return result;
        }



        


    }

}

