using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class EmployeeDocuments
    {

        public DataSet getemployeedocuments(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataset("Read_EmployeeDocuments", parameterValues);

        }
        public int Create(params object[] parameterValues)
        {

            return DataAccess.ExecuteNonQuery("Create_Employee_Documents", parameterValues);
        }

        //public byte[] Read(params object[] parameterValues)
        //{
        //    return DataAccess.ExecuteScalar("Read_Document_Images", parameterValues) as byte[];

        //}
        public DataTable Read(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("Read_Document_Images", parameterValues);

        }
    }
}
