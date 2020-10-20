using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class Employee
    {
        public DataSet Read(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("View_Employeedetails", parameterValues);

        }


        public int Create(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("Create_Employee", parameterValues);

        }

        public int ActivateAccount(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("ACTIVATEACCOUNT", parameterValues));

        }

        public int GetEmployeeId(params object[] emp)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Get_EmployeeId", emp));

        }

        public string getlastemployeeid()
        {
            return Convert.ToString(DataAccess.ExecuteScalar("GETLASTEMPLOYEEID"));

        }

        public int GetUserId(params object[] emp)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("GetUserId", emp));

        }

        public void UpdateEmployeeLeavePolicy(params object[] parameterValues)
        {
            DataAccess.ExecuteScalar("UPDATE_EMPLOYEE_DEPARTMENT_LEAVEPOLICY", parameterValues);
        }

        public Int64 Edit(params object[] parameterValues)
        {
            return Convert.ToInt64(DataAccess.ExecuteScalar("Update_Employee", parameterValues));

        }


        public DataTable getemployeedetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("Read_Employee", parameterValues);

        }

        public DataSet getDesignation()
        {
            return DataAccess.ExecuteDataSet("Read_Designation");

        }
        public DataSet getDepartment()
        {
            return DataAccess.ExecuteDataSet("Read_Department");

        }
        public DataSet getMaritalstatus()
        {
            return DataAccess.ExecuteDataSet("Read_Marital_status");

        }
        public DataSet getNationality()
        {
            return DataAccess.ExecuteDataSet("Read_Nationality");

        }

        public DataTable CheckAuthorization()
        {
            return DataAccess.ExecuteDataTable("Read_Authorization");

        }
        public int CheckAccessURL(params object[] parameterValues)
        {

            return Convert.ToInt16(DataAccess.ExecuteScalar("CHECKACCESSURL", parameterValues));
        }
        public DataTable GetRole(params object[] parameterValues)
        {
            DataTable dt = new DataTable();
            try
            {
                dt = DataAccess.ExecuteDataTable("READ_EMPLOYEEROLE", parameterValues);
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
                dt = new DataTable();
            }
            return dt;
        }
        public Int64 EditRole(params object[] parameterValues)
        {
            Int64 result=new Int64();
            try
            {
                result= Convert.ToInt64(DataAccess.ExecuteScalar("MTS_EDITROLE", parameterValues));
            }
            catch(Exception ex)
            {
                ex.Data.Clear();
                result = -999;
            }
            return result;
        }

    }
}
