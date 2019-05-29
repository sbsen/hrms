using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class MaritalStatus
    {
        public int Create(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("Create_Marital_status", parameterValues);
        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("Read_Marital_status");
        }

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_Marital_status", parameterValues));
        }
    }
}
