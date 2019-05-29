using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MTSHRDataLayer;

using MTSHRBussinessLogic;
namespace MTSHRBussinessLogic
{
    public class BusinessLogic
    {
       Mts_GridModel gm=new Mts_GridModel();
       
        public DataTable GetDesignation()
        {

            DataLayer dl = new DataLayer();
            return dl.GetDesignation();
        }

        public int EditDesignation( obj)
        {
            DataLayer d1 = new DataLayer();
            return d1.EditDesignation(obj);
        }
    }
}
