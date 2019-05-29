using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
    public class BloodGroup
    {

        public int Create(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Create_BloodGroup", parameterValues));

        }

        public DataTable Read()
        {
            return DataAccess.ExecuteDataTable("Read_BloodGroup");

        }

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_BloodGroup", parameterValues));
        }




    }
}
