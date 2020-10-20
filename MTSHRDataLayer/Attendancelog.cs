using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace MTSHRDataLayer
{
    public class AttendanceLog
    {
       
        public DataTable ReadMonthlyAttendanceDetails(params object[] parameterValues)
        {
            DataTable dt = new DataTable();
            try
            {
                dt= DataAccess.ExecuteDataTable("READ_MONTHLY_ATTENDANCE_LOG", parameterValues);
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
                dt = new DataTable();
            }
            return dt;
        }
		   public Int64 InsertAttData(string employeecode, string employeename, string InDeviceName, string OutDeviceName, string StatusCode, Int64 Duration, string PunchRecords, DateTime? InDateTime, DateTime? OutDateTime, DateTime? MonthCol)
        {
            Int64 rowaffected = 0;
            try
            {
                rowaffected = DataAccess.ExecuteNonQuery("UPLOAD_ATTENDANCE_DATA", employeecode, employeename, InDeviceName, OutDeviceName, StatusCode, Duration, PunchRecords, InDateTime, OutDateTime, MonthCol);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return rowaffected;
        }
        public static DataSet CheckEmpID(params object[] parameterValues)
        {
            //Boolean check = false;
            DataSet dt = null;
            try
            {
                //dt = DataAccess.ExecuteDataTable("READ_EMPLOYEE_ID", parameterValues);
                dt = DataAccess.ExecuteDataset("READ_EMPLOYEE_ID", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }
        
    }
}
