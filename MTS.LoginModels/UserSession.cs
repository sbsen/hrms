using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MTSEntBlocks.UtilsBlock;

namespace MTS.LoginModels
{
    [Serializable]
    public class UserSession
    {
        public Int64 USERID { get; set; }
        public string ROLENAME { get; set; }
        public Int64 COMPANYID { get; set; }
        public Int64 ROLEID { get; set; }
        public string SELECTEDCARDTYPE { get; set; }
        public string REPORTINGTO { get; set; }        
    }
    [Serializable]
    public class LogonUserSession : UserSession, IMenuBuildSession
    {
        public string USERNAME { get; set; }
        public string TEMPUSERNAME { get; set; }
        public byte STATUS { get; set; }
        public bool MENURANGE { get; set; }
        public string CURRENTPASSWORD { get; set; }
        public int PASSWORDCOUNT { get; set; }
        public string FIRSTNAME { get; set; }
        public string LASTNAME { get; set; }
        public string CARDTYPE { get; set; }
        public string CARDNUMBER { get; set; }
        public Int64 USERROLE { get; set; }
        public string EXPIREDDAYS { get; set; }    
        public string COMPANYNAME { get; set; } 
        public Int64 DEPARTMENT { get; set; }      
        public string AUTHORITYLEVEL { get; set; }
    }
}