using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class GovernmentID
    {
        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Create_Government_Id", parameterValues));

        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("Read_Government_Id");

        }

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_Government_Id", parameterValues));
        }
    }
}
