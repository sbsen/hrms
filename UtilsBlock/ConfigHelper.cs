using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace MTSEntBlocks.UtilsBlock.Web
{
    public class ConfigHelper
    {
        private const string ROLE_MANAGER = "ROLE_MANAGER";
        private const string ROLE_OPERATOR = "ROLE_OPERATOR";
        private const string ROLE_TREASURER = "ROLE_TREASURER";
        private const string ROLE_ADMIN = "ROLE_ADMIN";
        private const string ROLE_VIEWER = "ROLE_VIEWER";
        private const string ROLE_TREASURERSUPERVISOR = "ROLE_TREASURERSUPERVISOR";
        //private const string ROLE_SECRETARY = "SECRETARY_ROLE";
        private const string CULTURE = "CULTURE";
        private const string DATEFORMAT_PATTERN = "DATEFORMAT_PATTERN";
        private const string DATEFORMAT_SEPARATOR = "DATEFORMAT_SEPARATOR";
        private const string NUMBERFORMAT_DIGITS = "NUMBERFORMAT_DIGITS";
        private const string GUESTINFO_ACCOUNT = "GUESTINFO_ACCOUNT";


        private const string STATE_FROMBANK = "STATE_FROMBANK";
        private const string STATE_EXTRACTED = "STATE_EXTRACTED";
        private const string STATE_INPROGRESS = "STATE_INPROGRESS";
        private const string STATE_SUBMITTED = "STATE_SUBMITTED";
        private const string STATE_SUP_APPROVED = "STATE_SUP_APPROVED";
        private const string STATE_SUP_REJECTED = "STATE_SUP_REJECTED";
        private const string STATE_TREP_APPROVED = "STATE_TREP_APPROVED";
        private const string STATE_TREP_REJECTED = "STATE_TREP_REJECTED";
        private const string STATE_TREP_SUP_REJECTED = "STATE_TREP_SUP_REJECTED";
        private const string STATE_TREPSUP_APPROVED = "STATE_TREPSUP_APPROVED";



        public static short WSFromBank
        {
            get
            {
                return Convert.ToInt16(GetConfigValueFromAppVars(STATE_FROMBANK));
            }
        }

        public static short WSInProgress
        {
            get
            {
                return Convert.ToInt16(GetConfigValueFromAppVars(STATE_INPROGRESS));
            }
        }


        public static short WSSubmitted
        {
            get
            {
                return Convert.ToInt16(GetConfigValueFromAppVars(STATE_SUBMITTED));
            }
        }

        public static short WSSupervisorApprove
        {
            get
            {
                return Convert.ToInt16(GetConfigValueFromAppVars(STATE_SUP_APPROVED));
            }
        }

        public static short WSTreasuryApprove
        {
            get
            {
                return Convert.ToInt16(GetConfigValueFromAppVars(STATE_TREP_APPROVED));
            }
        }

        public static short WSTreasurySupervisorApprove
        {
            get
            {
                return Convert.ToInt16(GetConfigValueFromAppVars(STATE_TREPSUP_APPROVED));
            }
        }

        public static short WSExtracted
        {
            get
            {
                return Convert.ToInt16(GetConfigValueFromAppVars(STATE_EXTRACTED));
            }
        }


        public static short WSSupervisorReject
        {
            get
            {
                return Convert.ToInt16(GetConfigValueFromAppVars(STATE_SUP_REJECTED));
            }
        }
        public static short WSTreasuryReject
        {
            get
            {
                return Convert.ToInt16(GetConfigValueFromAppVars(STATE_TREP_REJECTED));
            }
        }
        public static short WSTreasurySupervisorReject
        {
            get
            {
                return Convert.ToInt16(GetConfigValueFromAppVars(STATE_TREP_SUP_REJECTED));
            }
        }


        public static string ManagerRole
        {
            get
            {
                return GetConfigValueFromAppVars(ROLE_MANAGER);
            }            
        }

        public  static string OperatorRole
        {
            get
            {
                return GetConfigValueFromAppVars(ROLE_OPERATOR);
            }
        }

        public  static string TreasurerRole
        {
            get
            {
                return GetConfigValueFromAppVars(ROLE_TREASURER);
            }
        }


        public static string TreasureSupervisorRole
        {
            get
            {
                return GetConfigValueFromAppVars(ROLE_TREASURERSUPERVISOR);
            }
        }


        public  static string AdminRole
        {
            get
            {
                return GetConfigValueFromAppVars(ROLE_ADMIN);
            }
        }

        public  static string DatePattern
        {
            get
            {
                return GetConfigValueFromAppVars(DATEFORMAT_PATTERN);
            }
        }

        public  static string DateSeparator
        {
            get
            {
                return GetConfigValueFromAppVars(DATEFORMAT_SEPARATOR);
            }
        }

        public static string Culture
        {
            get
            {
                return GetConfigValueFromAppVars(CULTURE);
            }
        }

        public static string CurrencyDecimalDigits
        {
            get
            {
                return GetConfigValueFromAppVars(NUMBERFORMAT_DIGITS);
            }
        }

        public static string ViewerRole
        {
            get
            {
                return GetConfigValueFromAppVars(ROLE_VIEWER);
            }
        }

        /*   public static string SecretaryRole
        {
            get
            {
                return validateAndReturn(SECRETARY_ROLE);
            }
        }*/

        public static string GuestInfoAccount
        {
            get
            {
                return GetConfigValueFromAppVars(GUESTINFO_ACCOUNT);
            }
        }


        private const string SCHOOLBUSINESSADNIM_ROLE = "SCHOOLBUSINESSADNIM_ROLE";
        private const string PAYROLLAPPROVER_ROLE = "PAYROLLAPPROVER_ROLE";
        private const string SUPERVISOR_ROLE = "SUPERVISOR_ROLE";


        public static string SchoolBusinessAdminRole
        {
            get
            {
                return validateAndReturn(SCHOOLBUSINESSADNIM_ROLE);
            }
        }
        public static string PayrollApproverRole
        {
            get
            {
                return validateAndReturn(PAYROLLAPPROVER_ROLE);
            }
        }
        public static string SupervisorRole
        {
            get
            {
                return validateAndReturn(SUPERVISOR_ROLE);
            }
        }

        private static string validateAndReturn(String configKey)
        {
            if (!System.Web.Configuration.WebConfigurationManager.AppSettings.AllKeys.Contains(configKey))
            {                
                return null;
            }
            else
            {
                return System.Web.Configuration.WebConfigurationManager.AppSettings.Get(configKey);
            }
        }

        private static string GetConfigValueFromAppVars(string ConfigKey)
        {
            return HttpContext.Current.Application[ConfigKey].ToString();
        }


    }
}
