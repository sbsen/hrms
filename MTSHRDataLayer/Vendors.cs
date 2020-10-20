using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSEntBlocks.DataBlock;
using System.Data;

namespace MTSHRDataLayer
{
   public class Vendors
    {
        public int Create(params object[] parameterValues)
        {

            return Convert.ToInt32(DataAccess.ExecuteScalar("CREATE_VENDORDETAILS", parameterValues));
        }

        public DataSet ReadVendorName()
        {
            return DataAccess.ExecuteDataSet("READ_VENDOR_NAME");
        }
    }
}
