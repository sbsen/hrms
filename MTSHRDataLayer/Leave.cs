using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MTSEntBlocks.DataBlock;


namespace MTSHRDataLayer
{
    public class Leave
    {
        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("applyleave", parameterValues));

        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("EmployeeLeaveList");

        }

        public DataTable ReadLeavePolicy()
        {
            DataTable dt = null;
            try
            {
                dt =  DataAccess.ExecuteDataTable("READ_LEAVE_POLICY");
            }
            catch(Exception e)
            {
                e.Data.Clear();
            }
            return dt;
        }
        
        public int AddLeavePolicy(params object[] parameterValues)
        {
            int rowsaffected = 0;
            try
            {
                rowsaffected = DataAccess.ExecuteNonQuery("ADD_LEAVE_POLICY", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return rowsaffected;
        }

        public int UpdateLeavePolicy(params object[] parameterValues)
        {
            int rowsaffected = 0;
            try
            {
                rowsaffected = DataAccess.ExecuteNonQuery("UPDATE_LEAVE_POLICY", parameterValues);
            }
            catch (Exception e)
            {
                e.Data.Clear();
            }
            return rowsaffected;
        }
    }
}
