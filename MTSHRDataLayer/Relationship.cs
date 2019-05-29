using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class Relationship
    {

        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Create_Relationship", parameterValues));

        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("Read_Relationship");

        }

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_Relationship", parameterValues));
        }

    }

    public class EmployeeDependents
    {

        public int UpdateDependents(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Create_User_Dependents", parameterValues));
        }

    }
}
