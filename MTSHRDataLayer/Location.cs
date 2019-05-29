using System;
using System.Collections.Generic;
using MTSEntBlocks.DataBlock;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
   public class Location
    {
        public int Create(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("Create_Location", parameterValues);

        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("Read_location");

        }

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_Location", parameterValues));
        }
    }
}
