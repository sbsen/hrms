using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSEntBlocks.DataBlock;
using System.Data;

namespace MTSHRDataLayer
{
    public class EmployeeEntry
    {
        public DataTable ReadEmployeeDetail(params object[] parameterValues)
        {
            var dt= DataAccess.ExecuteDataTable("READ_EMPLOYEE_ENTRY_DETAILS", parameterValues);
            return dt;
        }
    }
}
