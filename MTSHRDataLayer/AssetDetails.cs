using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
   public class AssetDetails
    {

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("READ_ASSETDETAILS");

        }
        public DataTable assetdetailbyid(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_ASSETDETAILSBYID",parameterValues);
        }
        public DataTable Purchased_date_filter(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("FILTERED_ON_PURCHASED_DATE", parameterValues);

        }


    }
}
