using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
    public class Holidays
    {

        public int CreateHolidaysList(params object[] parameterValues)
        {
            return Convert.ToInt32(DataAccess.ExecuteScalar("CREATE_HOLIDAYS", parameterValues));

        }

        public int Update(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("Update_HOLIDAYS", parameterValues));
        }

        public DataTable Read(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_ALL_HOLIDAYSLIST", parameterValues);

        }
    }
}
