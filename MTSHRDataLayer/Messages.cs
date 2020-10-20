using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
    public class Messages
    {

        public int CreateMessages(params object[] parameterValues)
        {
            int rowsaffected = 0;
            try
            {
                rowsaffected = DataAccess.ExecuteNonQuery("CREATE_MESSAGES", parameterValues);
            }
            catch(Exception e)
            {
                e.Data.Clear();
            }
            return rowsaffected;
        }

        public int EditMessages(params object[] parameterValues)
        {
            int rowsaffected = 0;
            try
            {
                rowsaffected = DataAccess.ExecuteNonQuery("UPDATE_MESSAGES", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return rowsaffected;
        }

        public DataTable ReadMessages(params object[] parameterValues)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_ALL_MESSAGES", parameterValues);
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return dt;
        }

        public DataTable DisplayMessages(params object[] parameterValues)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("DISPLAY_ALL_MESSAGES", parameterValues);
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return dt;
        }

        public Int32 StatusUpdate(params object[] parameterValues)
        {
            int rowsaffected = 0;
            try
            {
                rowsaffected = DataAccess.ExecuteNonQuery("UPDATE_MESSAGE_STATUS", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return rowsaffected;
        }

        public DataTable ReadBirthDays(params object[] parameterValues)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_BIRTHDAYS", parameterValues);
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return dt;
        }

        public DataTable GetNewJoiners()
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("Display_New_Joiners");
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return dt;
        }

        public DataSet GetMessageCount()
        {
            DataSet ds = null;
            try
            {
                ds = DataAccess.ExecuteDataset("Get_Messages_Count");
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
            return ds;
        }

        public DataSet GetEmployeeAttendanceDetails(params object[] parameterValues)
        {
            DataSet ds = null;
            try
            {
                ds = DataAccess.ExecuteDataset("VIEW_EACH_EMPLOYEE_ATTENDANCE_DETAILS", parameterValues);
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
            }
            return ds;
        }

        //public DataTable GetRoles()
        //{
        //    return DataAccess.ExecuteDataTable("MTS_READROLES");
        //}
    }
}
