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
using System.Security.Cryptography;
using System.Text;


namespace MTS.LoginModels
{
    static class Status
    {
        //1 => pass 2=> failed  3 =>  locked   4 => 90 days pwd expired   5 => first time login 

        public const byte FIRSTLOGIN = 1;
        public const byte PWDEXPIRED = 4;
        public const byte CHGPWD = 2;
        public const byte NO_OF_ATM_LOCKED = 3;
        public const byte ADMIN_LOCKED = 5;
        public const byte FORGETPWD = 6;
        public const byte PASS = 7;
        
        //for total no of users.
        public const Int64 Total_Users = 400;

        //session names


        //public const string USERNAME = "USERNAME";
        //public const string TEMPUSERNAME = "TEMPUSERNAME";
        //public const string STATUS = "STATUS";
        //public const string MENURANGE = "MENURANGE";
        //public const string USERID = "USERID";
        //public const string CURRENTPASSWORD = "CURRENTPASSWORD";
        //public const string PASSWORDCOUNT = "PASSWORDCOUNT";

        //public const string FIRSTNAME = "FIRSTNAME";
        //public const string LASTNAME = "LASTNAME";
        //public const string CARDTYPE = "CARDTYPE";
        //public const string CARDNUMBER = "CARDNUMBER";
        //public const string COMPANYID = "COMPANYID";
        //public const string USERROLE = "ROLEID";
        //public const string ROLENAME = "ROLENAME";

        public const string TRANSACTIONTABLE = "TRANSACTIONTABLE";
        public const string ACCOUNTCOUNTTABLE = "ACCOUNTCOUNTTABLE";
        public const string TRANSACTIONTDETLS = "TRANSACTIONTDETLS";
        
        //userview for admin user
        public const string SELECTEDUSER = "SELECTEDUSER";
    }
    public static class WorkflowState
    {
        //workflowstatus

        public const byte FROMBANK = 1;
        public const byte USERWIP = 2;
        public const byte SUBMITTED = 3;
        public const byte MANAGERAPPROVED = 4;
        public const byte MANAGERREJECT = 90;
        public const byte TREASURYREPAPPROVED = 5;
        public const byte TREASURYREPREJECT = 91;

    }
    static class Msg
    {
        //Messages

        //login page


        public const string PWDCOMPARE = "The new password and confirmation password do not match.";
       

       
    }
    static class ExpenseReportAction
    {
        public const byte CREATE = 1;
        public const byte EDIT = 2;
        public const byte VIEW = 3;
    }
}