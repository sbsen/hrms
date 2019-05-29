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
    class QAdata
    {
        public DataTable GetData()
        {
            DataTable dt = DataAccess.ExecuteDataTable("MTS_GetQA", null);
            return dt;
        }
        public int InsertQA(QA model)
        {
            DbCommand cmd = DataAccess.ExecuteNonQueryCMD("MTS_AddQA", model.SecurityQuestionName);
            return Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value.ToString());
        }

        public int UpdateQA(QA qa)
        {
            DbCommand cmd = DataAccess.ExecuteNonQueryCMD("MTS_UpdateQA", qa.SecurityQuestionName, qa.Active, qa.SecurityQuestionid);
            return Convert.ToInt16(cmd.Parameters["@RETURN_VALUE"].Value.ToString());
        }

        public QA GetQAForUpdate(Int64 id)
        {
            DataSet ds = DataAccess.ExecuteDataset("MTS_GetQABasedonID", id);
            QA model = new QA();
            if (ds.Tables[0].Rows.Count > 0)
            {
                model.SecurityQuestionName = ds.Tables[0].Rows[0]["QUESTION"].ToString();
                model.SecurityQuestionid = Convert.ToInt32(ds.Tables[0].Rows[0]["QUESTIONID"].ToString());
                model.Active = Convert.ToBoolean(ds.Tables[0].Rows[0]["ACTIVE"].ToString());
            }
            return model;
        }
    }
}
