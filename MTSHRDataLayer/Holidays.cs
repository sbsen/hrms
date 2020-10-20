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

        public DataTable ReadUpCommingHoliday(params object[] parameterValues)
        {
            return DataAccess.ExecuteDataTable("READ_UPCOMMING_HOLIDAYSLIST", parameterValues);
        }
        
        public DataSet getMtsHolidaysList()
        {
            return DataAccess.ExecuteDataSet("READ_ALL_MTS_HOLIDAYSLIST");
        }
        public int CreateMtsHolidaysList(params object[] parameterValues)
        {
            return Convert.ToInt16(DataAccess.ExecuteScalar("CREATE_MTS_HOLIDAYSLIST", parameterValues));
        }
    }
}
