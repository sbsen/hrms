using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using MTSEntBlocks.DataBlock;



namespace MTSHRDataLayer
{
    public class Skills
    {
        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Create_Skills", parameterValues));

        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("Read_Skills");

        }

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_Skills", parameterValues));
        }

    }



    public class EmployeeSkills
    {

        public int UpdateSkills(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Create_User_Skills", parameterValues));
        }


    }
}
