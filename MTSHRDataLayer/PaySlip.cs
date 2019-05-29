using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
    public class PaySlip
    {

        public DataTable Read(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("Read_Payslip", parameterValues);

        }

        public DataTable ReadAllPayslipEmployees(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("ALLEMPLOYEESINPAYSLIPTABLE", parameterValues);

        }
    }
}
