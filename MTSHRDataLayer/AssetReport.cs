using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
  public  class AssetReport
    {

        public DataTable Read()
        {
            return MTSEntBlocks.DataBlock.DataAccess.ExecuteDataTable("READ_ASSET_REPORT");
        }
    }
}
