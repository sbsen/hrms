using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class Designation
    {
        public int Create(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("Create_Designation", parameterValues);

        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("Read_Designation");

        }
        public DataTable Read_FunctionalRole()
        {
            return DataAccess.ExecuteDataTable("READ_FUNCTIONALROLE");

        }
        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_Designation", parameterValues));
        }
    }
}
