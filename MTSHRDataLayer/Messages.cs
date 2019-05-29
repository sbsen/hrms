using MTSEntBlocks.DataBlock;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSHRDataLayer
{
    public class Messages
    {

        public int Create(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("CREATE_MESSAGES", parameterValues);
        }

        public int Edit(params object[] parameterValues)
        {
            return DataAccess.ExecuteNonQuery("UPDATE_MESSAGES", parameterValues);
        }

        public DataTable Read(params object[] parameterValues)
        {

            return DataAccess.ExecuteDataTable("READ_ALL_MESSAGES", parameterValues);

        }
        public DataTable ReadBirthDays()
        {

            return DataAccess.ExecuteDataTable("READ_BIRTHDAYS");

        }
        

    }
}
