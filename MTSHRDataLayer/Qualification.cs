using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class Qualification
    {
        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Create_Qualification", parameterValues));

        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("Read_Qualification");

        }

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_Qualification", parameterValues));
        }
    }
}
