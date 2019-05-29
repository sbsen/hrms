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
    }


    public class EmployeePersonalDetails
    {

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_EmployeeDetails", parameterValues));
        }
    }
}