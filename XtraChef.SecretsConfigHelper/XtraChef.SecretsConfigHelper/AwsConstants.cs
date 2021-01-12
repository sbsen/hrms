using System;

namespace XtraChef.SecretsConfigHelper
{
    /// <summary>
    /// General Constant class to store app related Constants
    /// </summary>
    public class AwsConstants
    {
        public const string DATABASE_CONNECTION_NAME = "DefaultConnection";
        public const string SERVICE_DATABASE_CONNECTION_NAME = "XtraChef";
        public const string ABBYY_DATABASE_CONNECTION_NAME = "AbbyyServer";
        public const string DATABASE_CONNECTION_NAME_ENTITY = "XTRACHEF_DBEntities";
        public const string ABBYY_DATABASE_CONNECTION_NAME_ENTITY = "AbbyyServerEntities";
        public const string HR_DATABASE_CONNECTION_NAME = "DBConnection";

        public const string SALESFORCE_CONNECTION_NAME = "SalesForce";
        public const string CHARGEBEE_CONNECTION_NAME = "Chargebee";


        public const string SALESFORCE_USERNAME = "SALESFORCE_USERNAME";
        public const string SALESFORCE_PASSWORD = "SALESFORCE_PASSWORD";
        public const string SALESFORCE_CLIENTID = "SALESFORCE_CLIENTID";
        public const string SALESFORCE_CLIENTSECRET = "SALESFORCE_CLIENTSECRET";
        public const string SALESFORCE_TOKENREQUESTURL = "SALESFORCE_TOKENREQUESTURL";
        public const string SALESFORCE_APIVERSION = "SALESFORCE_APIVERSION";

    }

    #region RegionName

    /// <summary>
    /// RegionName.
    /// </summary>
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
}