using System;
using System.Collections.Generic;
using System.Collections;
using System.Linq;
using System.Text;
using System.Web;
using System.Data;

namespace MTS.Helpers
{
    public static class SessionHelper
    {
        private const string TRANSACTIONTABLE = "TRANSACTIONTABLE";
        private const string ACCOUNTCOUNTTABLE = "ACCOUNTCOUNTTABLE";
        private const string ERRORMESSAGE = "ERRORMSG";
        private const string CLIENTID = "CLIENTID";
        private const string CARDID = "CARDID";
        private const string BUSINESSID = "BUSINESSID";
        private const string BUDGETCENTERID = "BUDGETCENTERID";
        private const string EXPIREDDAYS = "EXPIREDDAYS";
        private const string SELECTEDUSER = "SELECTEDUSER";
        private const string DEPARTMENTID = "DEPARTMENTID";
        private const string LEDGERACCOUNTID = "LEDGERACCOUNTID";
        private const string LOCATIONID = "LOCATIONID";
        private const string COMPANYID = "COMPANYID";
        private const string QAID = "QAID";
        private const string REJECTREASONID = "REJECTREASONID";
        private const string ROLEID = "ROLEID";
        private const string STATEID = "STATEID";
        private const string REPORTNAME = "REPORTNAME";
        private const string REPORTID = "REPORTID";
        private const string LOGONUSER = "LOGONUSER";

        private const string PWDWITHOUTENCRYPT = "PWDWITHOUTENCRYPT";
        private const string PWDPOLICYID = "PWDPOLICYID";
        private const string EXPENSEREPORTACTION = "EXPENSEREPORTACTION";
        private const string TRANSACTIONID = "TRANSACTIONIDS"; //senthil 072812
        private const string GROUPID = "GROUPID"; //senthil 072812
        private const string RECEIPTCOUNT = "RECEIPTCOUNT";
        private const string SELECTEDCUSTRANID = "SELECTEDCUSTRANID";
        private const string SELECTEDTRANID = "SELECTEDTRANID";
        private const string SELECTEDPAYEENAME = "SELECTEDPAYEENAME";

        private const string ACCESSURLS = "ACCESSURLS";
        private const string LOGONTEMPUSERINFO = "LOGONTEMPUSERINFO";
        private const string USERID = "USERID";
        private const string IPADDRESS = "IPADDRESS";

        private const string BROWSERNAME = "BROWSERNAME";


        public static List<string> AccessUrls
        {
            get { return (List<string>)HttpContext.Current.Session[ACCESSURLS]; }
            set { HttpContext.Current.Session[ACCESSURLS] = value; }
        }
        public static object LogonTempUserInfo
        {
            get
            {
                return HttpContext.Current.Session[LOGONTEMPUSERINFO];
            }
            set
            {
                HttpContext.Current.Session[LOGONTEMPUSERINFO] = value;
            }
        }
        public static Hashtable TransactionTable
        {
            get
            {
                return (Hashtable)HttpContext.Current.Session[TRANSACTIONTABLE];
            }
            set{
                HttpContext.Current.Session[TRANSACTIONTABLE] = value;
            }        
        }

        public static Hashtable AccountCountTable
        {
            get
            {
                return (Hashtable)HttpContext.Current.Session[ACCOUNTCOUNTTABLE];
            }
            set
            {
                HttpContext.Current.Session[ACCOUNTCOUNTTABLE] = value;
            }        
        }

        public static string ErrorMessage
        {
            get
            {
                return Convert.ToString(HttpContext.Current.Session[ERRORMESSAGE]);
            }
            set
            {
                HttpContext.Current.Session[ERRORMESSAGE] = value;
            }
        }

        public static Int64 ClientId
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[CLIENTID]);
            }
            set
            {
                HttpContext.Current.Session[CLIENTID] = value;
            }
        }

        public static Int64 CardId
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[CARDID]);
            }
            set
            {
                HttpContext.Current.Session[CARDID] = value;
            }
        }

        public static Int64 BusinessId
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[BUSINESSID]);
            }
            set
            {
                HttpContext.Current.Session[BUSINESSID] = value;
            }
        }

        public static Int64 BudgetCenterId
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[BUDGETCENTERID]);
            }
            set
            {
                HttpContext.Current.Session[BUDGETCENTERID] = value;
            }
        }

        public static Int32 ExpiredDays
        {
            get
            {
                return Convert.ToInt32(HttpContext.Current.Session[EXPIREDDAYS]);
            }
            set
            {
                HttpContext.Current.Session[EXPIREDDAYS] = value;
            }
        }

        public static object SelectedUser
        {
            get
            {
                return HttpContext.Current.Session[SELECTEDUSER];
            }
            set
            {
                HttpContext.Current.Session[SELECTEDUSER] = value;
            }
        }

        public static Int64 DepartmentId
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[DEPARTMENTID]);
            }
            set
            {
                HttpContext.Current.Session[DEPARTMENTID] = value;
            }
        }

        public static Int64 LedgeraccountID
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[LEDGERACCOUNTID]);
            }
            set
            {
                HttpContext.Current.Session[LEDGERACCOUNTID] = value;
            }
        }
        public static Int64 LocationID
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[LOCATIONID]);
            }
            set
            {
                HttpContext.Current.Session[LOCATIONID] = value;
            }
        }

        public static Int64 CompanyID
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[COMPANYID]);
            }
            set
            {
                HttpContext.Current.Session[COMPANYID] = value;
            }
        }       

        public static Int64 QAid
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[QAID]);
            }
            set
            {
                HttpContext.Current.Session[QAID] = value;
            }
        }

        public static Int64 RejectReasonid
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[REJECTREASONID]);
            }
            set
            {
                HttpContext.Current.Session[REJECTREASONID] = value;
            }
        }

        public static Int64 Roleid
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[ROLEID]);
            }
            set
            {
                HttpContext.Current.Session[ROLEID] = value;
            }
        }

        public static Int64 Stateid
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[STATEID]);
            }
            set
            {
                HttpContext.Current.Session[STATEID] = value;
            }
        }

        public static DataTable ReportTable
        {
            get
            {
                return (DataTable)HttpContext.Current.Session[REPORTNAME];
            }
            set
            {
                HttpContext.Current.Session[REPORTNAME] = value;
            }
        }

        public static Int64 Reportid
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[REPORTID]);
            }
            set
            {
                HttpContext.Current.Session[REPORTID] = value;
            }
        }


        public static object LogonUser
        {
            get
            {
                return HttpContext.Current.Session[LOGONUSER];
            }
            set
            {
                HttpContext.Current.Session[LOGONUSER] = value;
            }
        }

        public static string Password
        {
            get
            {
                return Convert.ToString(HttpContext.Current.Session[PWDWITHOUTENCRYPT]);
            }
            set
            {
                HttpContext.Current.Session[PWDWITHOUTENCRYPT] = value;
            }
        }

        public static Int64 Policyid
        {
            get
            {
                return Convert.ToInt64(HttpContext.Current.Session[PWDPOLICYID]);
            }
            set
            {
                HttpContext.Current.Session[PWDPOLICYID] = value;
            }
        }

        public static Int16 ExpenseReportAction
        {
            get
            {
                return Convert.ToInt16(HttpContext.Current.Session[EXPENSEREPORTACTION]);
            }
            set
            {
                HttpContext.Current.Session[EXPENSEREPORTACTION] = value;
            }
        }      
        
        public static string GroupId
        {
            get
            {
                return Convert.ToString(HttpContext.Current.Session[GROUPID]);
            }
            set
            {
                HttpContext.Current.Session[GROUPID] = value;
            }
        }
        
        public static string TransactionId
        {
            get
            {
                return Convert.ToString(HttpContext.Current.Session[TRANSACTIONID]);
            }
            set
            {
                HttpContext.Current.Session[TRANSACTIONID] = value;
            }
        }

        public static Hashtable ReceiptsCount
        {
            get
            {
                return (Hashtable)HttpContext.Current.Session[RECEIPTCOUNT];
            }
            set
            {
                HttpContext.Current.Session[RECEIPTCOUNT] = value;
            }
        }

        public static String SelectedCusTranID
        {
            get
            {
                return (String)HttpContext.Current.Session[SELECTEDCUSTRANID];
            }
            set
            {
                HttpContext.Current.Session[SELECTEDCUSTRANID] = value;
            }
        }

        public static String SelectedTranID
        {
            get
            {
                return (String)HttpContext.Current.Session[SELECTEDTRANID];
            }
            set
            {
                HttpContext.Current.Session[SELECTEDTRANID] = value;
            }
        }

        public static String SelectedPayeeName
        {
            get
            {
                return (String)HttpContext.Current.Session[SELECTEDPAYEENAME];
            }
            set
            {
                HttpContext.Current.Session[SELECTEDPAYEENAME] = value;
            }
        }

        public static String UserId
        {
            get
            {
                return (String)HttpContext.Current.Session[USERID];
            }
            set
            {
                HttpContext.Current.Session[USERID] = value;
            }
        }

        public static string IPAddress
        {
            get
            {
                return Convert.ToString(HttpContext.Current.Session[IPADDRESS]);
            }
            set
            {
                HttpContext.Current.Session[IPADDRESS] = value;
            }

        }

        public static string BrowserName
        {
            get
            {
                return Convert.ToString(HttpContext.Current.Session[BROWSERNAME]);
            }
            set
            {
                HttpContext.Current.Session[BROWSERNAME] = value;
            }

        }
        
    }
}
