using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using MTSEntBlocks.DataBlock;
namespace MTSHRDataLayer
{
  public  class AssetSale
    {
        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16( DataAccess.ExecuteScalar("CREATE_ASSET_Sale", parameterValues));

        }
        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("READ_ASSET_SALE");

        }
    }
}
