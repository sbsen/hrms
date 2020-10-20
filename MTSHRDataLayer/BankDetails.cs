using MTSEntBlocks.DataBlock;
using System.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
    public class BankDetails
    {
        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("READ_BANKDETAILS");

        }

        public int CreateUpdate_Bankdetails(params object[] parameterValues)
        {
            return Convert.ToInt32(DataAccess.ExecuteScalar("CreateUpdate_BankDetails", parameterValues));

        }
        public DataTable FilterBankdetails(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("FILTER_BANKDETAILS", parameterValues);
        }

    }
}
