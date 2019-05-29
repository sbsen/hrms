using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSEntBlocks.DataBlock;
using System.Linq;
using System.Data;
namespace MTSHRDataLayer
{
    public class ImportExcel
    {

        public int AddDetails(DataTable dt)
        {
            
            
         
            return Convert.ToInt16(DataAccess.ExecuteScalar("CREATESALARYDETAILS", dt));
        }

    }
}
