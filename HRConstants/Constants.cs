using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HRConstants
{
    public class UserConstants
    {
        public static Int64 Admin = 1;
        public static Int64 User = 2;
        public static Int64 Manager = 3;
        public static Int64 HumanResource = 4;
        public static Int64 OfficeManager = 5;

    }

    public class LeaveConstants
    {
        public static Int64 CasualLeave = 1;
        public static Int64 SickLeave = 2;
        public static Int64 EarnedLeave = 3;
        public static Int64 MaternityLeave = 4;
        public static Int64 PaternityLeave = 5;
    }
    public class LeaveSessionConstants
    {
        public static string Fullday = "1";
        public static string Forenoon = "2";
        public static string Afternoon = "3";
    }

    public class LeaveStatusConstants
    {
        public static Int64 Failed = 0;
        public static Int64 Success = 1;
        public static Int64 LOPDays = 2;
    }

    public class LOPTypeConstants
    {
        public static Int64 LOPDeducted = 1;
        public static Int64 ExhaustedLeave = 2;
        public static Int64 ForcedLeave = 3;
    }

    public class LeaveNameConstants
    {
        public static string SICK = "sick";
        public static string CASUAL = "casual";
        public static string EARNED = "earned";
        public static string MATERNITY = "maternity";
        public static string PATERNITY = "paternity";
    }

    public class AssetStatusConstants
    {
        public static Int64 Unassigned = 0;
        public static Int64 Assigned = 1;
        public static Int64 Repair = 2;
        public static Int64 Sold = 3;
    }

    public class ApprovalStatusConstants
    {
        public static Int64 Initiate = 0;
        public static Int64 Forward = 1;
        public static Int64 Approve = 2;
        public static Int64 Reject = 3;
    }

    public class UserFlagforApprovalConstants
    {
        public static Int64 Initiator = 0;
        public static Int64 Approver = 1;
        public static Int64 Both = 2;
    }

    public class ModuleConstants
    {
        public static Int64 SalaryComponents = 1;
        public static Int64 MonthlyPayrollDetails = 2;
    }

    #region
    public class RegionName
    {
        public class Metadata
        {
            public const string DEVELOPMENT = "ap-south-1";
            public const string INT = "us-west-1";
            public const string PREPROD = "us-east-2";
            public const string PRODUCTION = "us-east-1";
            public const string DEMONEW = "us-west-2";
        }
    }

#endregion

    #region AwsSecretManager

    /// <summary>
    /// AwsSecretManager.
    /// </summary>
    public class AwsSecretManager
    {
        public class Development
        {
            public const string awsSecretJson = "dev/user/dev-service-user/access-key";
        }
        public class Int
        {
            public const string awsSecretJson = "int/user/int-service-user/access-key";
        }
        public class Preprod
        {
            public const string awsSecretJson = "preprod/user/preprod-service-user/access-key";
        }
        public class Demo
        {
            public const string awsSecretJson = "demo/user/demo-service-user/access-key";
        }
        public class Prod
        {
            public const string awsSecretJson = "prod/user/prod-service-user/access-key";
        }
    }

    #endregion

    #region RdsSecretManager

    /// <summary>
    /// RdsSecretManager.
    /// </summary>
    public class RdsSecretManager
    {
        public class Development
        {
            public const string rdsSecretJson = "dev/rds/admin-user";
        }
        public class Int
        {
            public const string rdsSecretJson = "int/rds/admin-user";
        }
        public class Preprod
        {
            public const string rdsSecretJson = "preprod/rds/admin-user";
        }
        public class Demo
        {
            public const string rdsSecretJson = "demo/rds/admin-user";
        }
        public class Prod
        {
            public const string rdsSecretJson = "prod/rds/admin-user";
        }
    }

    #endregion

    public class Contants
    {
        public const string DATABASE_CONNECTION_NAME = "DBConnection";
    }
}
