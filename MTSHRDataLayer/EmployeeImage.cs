using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSEntBlocks.DataBlock;

namespace MTSHRDataLayer
{
    public class EmployeeImage
    {

        public int Create(params object[] parameterValues)
        {

            return DataAccess.ExecuteNonQuery("Create_Employee_Image", parameterValues);
        }
        public byte[] Read(params object[] parameterValues)
        {
            return DataAccess.ExecuteScalar("Read_Employee_Image", parameterValues) as byte[];

        }
    }
}
