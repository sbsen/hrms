using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class EmployeeDetails
    {
        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("Read_EmployeeDetails");
        }

        public DataTable FilterEmployeesOnDoj(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("Filter_EmployeedetailsOnDoj", parameterValues);
        }
        public DataTable GetManagersList(params object[] parameterValues)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_EMPLOYEE_ASSIGNED_MANAGERS", parameterValues);
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
                dt = null;
            }
            return dt;
        }
        public Int64 AddManager(params object[] parameterValues)
        {
            try
            {
                return DataAccess.ExecuteNonQuery("ASSIGN_EMPLOYEE_REPORTING_MANAGER", parameterValues);
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
                return -999;
            }
        }
    }


    public class EmployeePersonalDetails
    {

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_EmployeeDetails", parameterValues));
        }
    }
}