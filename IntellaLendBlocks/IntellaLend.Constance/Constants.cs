using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IntellaLend.Constance
{
    public class EmailTemplateConstants
    {
        public static Int64 NewUserTemplate = 1;
        public static Int64 ResetPasswordEmail = 2; 
        public static Int64 ChangePasswordEmail = 3;
    }

    public class Application
    {
        public static string URL = "https://{0}.IntellaLend.com";        
    }

    public class StatusConstant
    {
        public static Int64 COMPLETE = 1;
        public static Int64 PENDING_IDC = 2;
        public static Int64 IDC_COMPLETE = 3;
        public static Int64 PENDING_BOX_DOWNLOAD = 4;
        public static Int64 FAILED_BOX_DOWNLOAD = 5;

        public static Int64 READY_FOR_IDC = 6;

        //Loan Purge Status
        public static Int64 LOAN_PURGED = 100;
        public static Int64 LOAN_EXPIRED = 101;    
        public static Int64 PURGE_WAITING = 102;
        public static Int64 PURGE_FAILED = 103;

        //Pending Status
        public static Int64 PENDING_AUDIT = 91;

        //Ephesoft Status
        public static Int64 PENDING_OCR = 201;

        protected static readonly Dictionary<Int64, string> Status = new Dictionary<long, string>()
        {
            { COMPLETE, "Completed" },
            {READY_FOR_IDC,"Ready for IDC"},
            { PENDING_IDC, "Pending IDC" },
            { IDC_COMPLETE, "IDC Completed" },
            { PENDING_AUDIT, "Pending Audit" },
            { PENDING_BOX_DOWNLOAD, "Pending Box Download" },
            { FAILED_BOX_DOWNLOAD, "Failed Box Download" },
            { PENDING_OCR, "Pending OCR" },
            { LOAN_PURGED, "Loan Purged" },
            { LOAN_EXPIRED, "Loan Expired" },
            { PURGE_WAITING, "Purge Waiting" },
            { PURGE_FAILED, "Purge Failed" }
        };        

        public static string GetStatusDescription(Int64 StatusID)
        {
            if (Status.ContainsKey(StatusID))
                return Status[StatusID];
            else
                return "Status Unavailable";            
        }
    }

    public class RoleConstant
    {

        public static Int64 SYSTEM_ADMINISTRATOR = 1;
        public static Int64 QUALITY_CONTROL_MANAGER = 2;
        public static Int64 DATA_ENTRY = 3;
        public static Int64 QUALITY_CONTROL_AUDITOR = 4;

        protected static readonly Dictionary<Int64, string> Role = new Dictionary<long, string>()
        {
            { SYSTEM_ADMINISTRATOR, "System Administrator" },
            { QUALITY_CONTROL_MANAGER, "Quality Control Manager" },
            { DATA_ENTRY, "Data Entry" },
            { QUALITY_CONTROL_AUDITOR, "Quality Control Auditor" },
        };

        public static string GetRoleDescription(Int64 RoleId)
        {
            if(Role.ContainsKey(RoleId))
                return Role[RoleId];
            else
                return "Role Unavailable";
        }
    }

    public class DocumentLevelConstant
    {

        public static Int32 CRITICAL = 11;
        public static Int32 NON_CRITICAL = 0;

        protected static readonly Dictionary<Int32, string> DocumentLevel = new Dictionary<Int32, string>()
        {
            { CRITICAL, "Critical" },
            { NON_CRITICAL, "Non-Critical" }
        };

        protected static readonly Dictionary<Int32, string> DocumentLevelIcons = new Dictionary<int, string>()
        {
            { CRITICAL, "fa fa-times-circle fa-stack-2x fa-icon-size fa-stack-two"},
            { NON_CRITICAL, "fa fa-exclamation-circle fa-stack-2x fa-icon-size fa-stack-two"}
        };

        protected static readonly Dictionary<Int32, string> DocumentLevelIconColor = new Dictionary<int, string>()
        {
            { CRITICAL, "fa-stack fa-lg txt-danger"},
            { NON_CRITICAL, "fa-stack fa-lg txt-warning"}
        };

        public static string GetDocumentLevelDescription(Int32 DocLevel)
        {
            if (DocumentLevel.ContainsKey(DocLevel))
                return DocumentLevel[DocLevel];
            else
                return "Status Unavailable";
        }

        public static string GetDocumentLevelIcons(Int32 DocLevel)
        {
            if (DocumentLevelIcons.ContainsKey(DocLevel))
                return DocumentLevelIcons[DocLevel];
            else
                return string.Empty;
        }

        public static string GetDocumentLevelIconColor(Int32 DocLevel)
        {
            if (DocumentLevelIconColor.ContainsKey(DocLevel))
                return DocumentLevelIconColor[DocLevel];
            else
                return string.Empty;
        }
    }

    public class BoxDownloadStatusConstant
    {
        public static int DOWNLOAD_PENDING = 0;
        public static int DOWNLOAD_SUCCESS = 1;
        public static int DOWNLOAD_FAILED = 2;

        protected static readonly Dictionary<Int64, string> Status = new Dictionary<long, string>()
        {
            { DOWNLOAD_PENDING, "Dowload Pending" },
            { DOWNLOAD_SUCCESS, "Download Success" },
            { DOWNLOAD_FAILED, "IDC Completed" },
        };

        public static string GetStatusDescription(Int64 StatusID)
        {
            return Status[StatusID];
        }
    }

    public class DateConstance
    {
        public static string ShortDateFormart = "MM/dd/YYYY";
    }     
}
