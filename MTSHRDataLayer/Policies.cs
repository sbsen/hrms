using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
   public class Policies
    {
        public int AddPolicies(params object[] parameterValues)
        {
            return Convert.ToInt32(DataAccess.ExecuteScalar("Mts_Create_NewPolicy", parameterValues));

        }

        public DataSet GetPolicies()
        {
            return DataAccess.ExecuteDataSet("Mts_Read_AllPolicies");

        }

        public int UpdatePolicies(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("MTS_Update_HrPolicies", parameterValues));
        }


        public int Create(params object[] parameterValues)
        {

            return Convert.ToInt32(DataAccess.ExecuteScalar("Create_Policy", parameterValues));
        }

        //public byte[] Read(params object[] parameterValues)
        //{
        //    return DataAccess.ExecuteScalar("Read_Document_Images", parameterValues) as byte[];

        //}
        public DataTable Read(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("Read_PolicyImages", parameterValues);

        }
    }
}
