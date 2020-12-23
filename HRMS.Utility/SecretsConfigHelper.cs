using Amazon;
using Amazon.Runtime;
using Amazon.SecretsManager;
using Amazon.SecretsManager.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Reflection;
using static HRMS.Utility.CommonUtility;
using HRConstants;
using System.Configuration;

namespace HRMS.Utility
{
    public class SecretsConfigHelper
    {
        public static AmazonSecretsManagerClient Client;
        //
        // Summary:
        //     Constructs SecretsConfigHelper with the database connectionStrings and aws credentials loaded from the aws secret's
        //     manager. Example web.config or App.config with connectionStrings and credentials set.
        //     <?xml version="1.0" encoding="utf-8" ?> <configuration> <connectionStrings>  <add name = "DefaultConnection" providerName="System.Data.SqlClient" connectionString="" />
        //      </connectionStrings>  <appSettings> <add key="AWS_ACCESS_KEY"
        //     value="AWS Default Access Key"/> <add key="AWS_SECRET_KEY"
        //     value="AWS Default Secret Key"/> </appSettings> </configuration>
        public SecretsConfigHelper()
        {
            try
            {
                //Get the access key from system variable and decrypt.
                var accessKey = CommonUtility.EnDecrypt(Environment.GetEnvironmentVariable("API_AWS_ACCESS_KEY"), true);
                //Get the secret key from system variable and decrypt.
                var secretKey = CommonUtility.EnDecrypt(Environment.GetEnvironmentVariable("API_AWS_SECRET_KEY"), true);
                //Get Region Name based on environment.
                string awsRegion = Resion.GetRegionName();

                var credentials = new BasicAWSCredentials(accessKey, secretKey);
                var clientConfig = new AmazonSecretsManagerConfig
                {
                    RegionEndpoint = RegionEndpoint.GetBySystemName(awsRegion) //Gets the region based on its system name like "ap-south-1"
                };
                Client = new AmazonSecretsManagerClient(credentials, clientConfig);
                //set the aws access key and secret key in runtime.
                SetAwsConfig();
                //set the rds (database) connectionString in runtime.
                SetRdsConnectionStringConfig();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
            }
        }
        //
        // Summary:
        //     check the secret manager json formate.
        //
        // Parameters:
        //   str:
        //     The json string object.
        public static bool IsJson(string strInput)
        {
            if (string.IsNullOrWhiteSpace(strInput)) { return false; }
            strInput = strInput.Trim();
            if ((strInput.StartsWith("{") && strInput.EndsWith("}")) || //For object
                (strInput.StartsWith("[") && strInput.EndsWith("]"))) //For array
            {
                try
                {
                    var obj = JToken.Parse(strInput);
                    return true;
                }
                catch (JsonReaderException jex)
                {
                    //Exception in parsing json
                    return false;
                }
                catch (Exception ex) //some other exception
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        //
        // Summary:
        //     set the aws access key and secret key in runtime.
        public static void SetAwsConfig()
        {
            try
            {
                //Get aws Secret Name.
                var secretId = SecretsName.GetAwsSecretName();

                var secretValue = Client.GetSecretValue(new GetSecretValueRequest
                {
                    SecretId = secretId,
                });

                var secretString = secretValue.SecretString;
                if (secretString != null)
                {
                    if (IsJson(secretString))
                    {
                        var jObject = JToken.Parse(secretString);
                        ConfigurationManager.AppSettings.Set("AWS_ACCESS_KEY", jObject["ACCESS_KEY"].ToString());
                        ConfigurationManager.AppSettings.Set("AWS_SECRET_KEY", jObject["SECRET_KEY"].ToString());
                    }
                    else
                    {
                        throw new FormatException("unsupported json format");
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //
        // Summary:
        //     set the rds (database) connectionString in runtime.
        public static void SetRdsConnectionStringConfig()
        {
            try
            {
                // Get the rds secret name.
                var secretId = SecretsName.GetRdsSecretName();

                var secretValue = Client.GetSecretValue(new GetSecretValueRequest
                {
                    SecretId = secretId,
                });

                var secretString = secretValue.SecretString;
                if (secretString != null)
                {
                    if (IsJson(secretString))
                    {
                        //Convert the json string to json token.
                        var jObject = JToken.Parse(secretString);

                        string connectionStringName = Contants.DATABASE_CONNECTION_NAME;
                        string providerName = "System.Data.SqlClient";
                        // Get the connectionString.
                        string connectionString = $"Data Source={jObject["DB_HOST"]},{jObject["DB_PORT"]};Initial Catalog={jObject["DB_NAME"]};Integrated Security=false; user id={jObject["DB_USER_NAME"]};password={jObject["DB_PASSWORD"]}";
                        //string connectionString = $"Database = MTSHRMS_INT; Server = MTS0066; user id = sa; password = sadmin; Integrated Security = false;

                        if (IsConnectionString(ConfigurationManager.ConnectionStrings[connectionStringName]))
                        {
                            UpdateConnectionString(providerName, connectionString, connectionStringName);
                        }
                        else
                        {
                            AddConnectionString(providerName, connectionString, connectionStringName);
                        }
                    }
                    else
                    {
                        throw new FormatException("unsupported json format");
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        //
        // Summary:
        //     Check the ConnectionString is availble in web.config or app.config.
        //
        // Parameters:
        //   connectionString:
        //     The Connection String Settings object.
        private static bool IsConnectionString(ConnectionStringSettings connectionString)
        {
            return (connectionString == null || string.IsNullOrEmpty(connectionString.ToString())) ? false : true;
        }
        //
        // Summary:
        //     Add the new connectionStrings.
        //
        // Parameters:
        //   providerName:
        //     The name of the connection String provider.
        //   connectionString:
        //     The connection String.
        //   connectionStringName:
        //     The name of the connection String.
        private static void AddConnectionString(string providerName, string connectionString, string connectionStringName)
        {
            //Initializes a new instance of a System.Configuration.ConnectionStringSettings class.
            ConnectionStringSettings connectionStringSettings = new ConnectionStringSettings();
            //Replace Connecion string Name. 
            connectionStringSettings.Name = connectionStringName;
            //Replace Connecion string ProviderName.
            connectionStringSettings.ProviderName = providerName;
            //Replace Connecion string.  
            connectionStringSettings.ConnectionString = connectionString;
            //Convert Readonly to Writable (In Connection String Provider is readonly so we need to change it as Writable)  
            var writable = typeof(ConfigurationElementCollection).GetField("bReadOnly", BindingFlags.Instance | BindingFlags.NonPublic);
            //desable the read access the. 
            writable.SetValue(ConfigurationManager.ConnectionStrings, false);
            //Add the connectionStringSettings.
            ConfigurationManager.ConnectionStrings.Add(connectionStringSettings);
            //enable the read access the.
            writable.SetValue(ConfigurationManager.ConnectionStrings, true);
        }
        //
        // Summary:
        //     Update the connectionStrings.
        //
        // Parameters:
        //   providerName:
        //     The name of the connection String provider.
        //   connectionString:
        //     The connection String.
        //   connectionStringName:
        //     The name of the connection String.
        private static void UpdateConnectionString(string providerName, string connectionString, string connectionStringName)
        {
            //Gets the System.Configuration.ConnectionStringsSection data for the current application's default configuration. 
            var connectionStringSettings = ConfigurationManager.ConnectionStrings[connectionStringName];
            //Convert Readonly to Writable (In Connection String Provider is readonly so we need to change it as Writable)  
            var writable = typeof(ConfigurationElement).GetField("_bReadOnly", BindingFlags.Instance | BindingFlags.NonPublic);
            //desable the read access the. 
            writable.SetValue(connectionStringSettings, false);
            /*//Replace Connecion string Name. 
            connectionStringSettings.Name = name;*/
            //Replace Connecion string ProviderName.
            connectionStringSettings.ProviderName = providerName;
            //Replace Connecion string  
            connectionStringSettings.ConnectionString = connectionString;
            //enable the read access the.
            writable.SetValue(connectionStringSettings, true);
        }
    }
}