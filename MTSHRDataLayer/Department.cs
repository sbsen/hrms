using System;
using System.Collections.Generic;
using System.Data;
using MTSEntBlocks.DataBlock;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
   public class Department
    {
        public int Create(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("Create_Department", parameterValues);

        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("Read_Department");

        }

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_Department", parameterValues));
        }
    }
}
