using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Threading;
using System.Xml;
using System.Web.Mvc;
using MTS.LoginModels;
using MTSEntBlocks.DataBlock;

namespace MTS.Login.Data
{
    public class RoleData
    {

        public DataTable GetData()
        {
            DataTable dt = DataAccess.ExecuteDataTable("MTS_GetRole", null);
            return dt;
        }

        public void GetAccess(Int64 roleid, RoleModel model)
        {
            DataSet ds = DataAccess.ExecuteDataset("MTS_GetAccess", roleid);
            model.SelectedAccess = GetSelectListItem(ds.Tables[1]);
            model.AvailableAccess = GetSelectListItem(ds.Tables[0]);
            model.RoleID = roleid;
        }

        public int SetAccess(Int64 roleid, string values)
        {
            DbCommand cmd = DataAccess.ExecuteNonQueryCMD("MTS_SETACCESS", roleid, values);
            return Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value.ToString());
        }

        public static List<SelectListItem> GetSelectListItem(DataTable dt)
        {
            try
            {
                List<SelectListItem> items = new List<SelectListItem>();
                if (dt.Rows.Count > 0)
                {
                    items = (from dropdownfill in dt.AsEnumerable()
                             select new SelectListItem     // data()
                             {
                                 Value = dropdownfill.ItemArray[1].ToString(),
                                 Text = dropdownfill.ItemArray[0].ToString()
                             }).ToList();
                }
                return items;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}