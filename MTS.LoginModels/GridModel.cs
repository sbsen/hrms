using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace MTS.LoginModels
{
    public class GridModel
    {
        public DataTable Data;

        public Int64 total_Users { get; set; }

        public Int64 active_Users { get; set; }

        public Dictionary<Int32, string> Status = new Dictionary<int, string>();
        public Dictionary<Int32, string> Messages = new Dictionary<int, string>();

        public bool approvePopup { get; set; }

        public Int64 groupid { get; set; }

        //public int Count = 10;

        // static int _nextID = 1;

        // public GridModel()
        //{
        //    ID = _nextID++;
        //}

        //public int ID { get; set; }
        //private DataTable dt;
        //public List<string> Columns { get; set; }
        
        //public DataRowCollection Data
        //{
        //    get
        //    {
        //        return dt.Rows;
        //    }
        //}

        //public void SetData(DataTable data)
        //{
        //    dt = data;
        //}

        
    }
}