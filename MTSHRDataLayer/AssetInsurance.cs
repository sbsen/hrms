using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
   public class AMC_OR_ASSET_INSURANCE
    {
        public int Create(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("CREATE_AMC_OR_ASSET_INSURANCE", parameterValues);

        }
        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("READ_AMC_OR_ASSET_INSURANCE");

        }
        public DataSet AssetName()
        {
            return DataAccess.ExecuteDataSet("READ_ASSET_NAME");

        }
        public int Upload_Amc_Insurance(params object[] parameterValues)
        {
            return Convert.ToInt32(DataAccess.ExecuteScalar("CREATE_AMC_INSURANCE_FILES", parameterValues));
        }
        public DataTable Read_Insurance(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_AMC_INSURANCE", parameterValues);
        }
    }
}
