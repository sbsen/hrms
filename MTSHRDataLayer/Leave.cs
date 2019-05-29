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
    }
}
