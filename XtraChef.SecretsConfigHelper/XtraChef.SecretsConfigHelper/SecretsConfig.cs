using Amazon;
using Amazon.Runtime;
using Amazon.SecretsManager;
using Amazon.SecretsManager.Model;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Configuration;
using XtraChef.SecretsConfigHelper;

namespace XtraChef.SecretsConfigHelper
{
    public class SecretsConfig
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

        public SecretsConfig()
        {
            try
            {
                //Get the access key from system variable and decrypt.
                var accessKey = AwsCommon.EnDecrypt(Environment.GetEnvironmentVariable("API_AWS_ACCESS_KEY", EnvironmentVariableTarget.Machine), true);
                //Get the secret key from system variable and decrypt.
                var secretKey = AwsCommon.EnDecrypt(Environment.GetEnvironmentVariable("API_AWS_SECRET_KEY", EnvironmentVariableTarget.Machine), true);
                //Get Region Name based on environment.
                string awsRegion = AwsCommon.Region.GetRegionName();

                var credentials = new BasicAWSCredentials(accessKey, secretKey);
                var clientConfig = new AmazonSecretsManagerConfig
                {
                    RegionEndpoint = RegionEndpoint.GetBySystemName(awsRegion) //Gets the region based on its system name like "ap-south-1"
                };
                Client = new AmazonSecretsManagerClient(credentials, clientConfig);
                //set the aws access key and secret key in runtime.
                SetAppSettingsConfig();
                //set the rds (database) connectionString in runtime.
                SetConnectionStringConfig();
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
        //     set the aws access key and secret key in runtime.
        public static void SetAppSettingsConfig()
        {
            try
            {
                //Get aws Secret Name.
                var secretId = AwsCommon.SecretsName.GetAwsSecretName();

                var secretValue = Client.GetSecretValue(new GetSecretValueRequest
                {
                    SecretId = secretId,
                });

                var secretString = secretValue.SecretString;
                if (secretString != null)
                {
                    if (AwsCommon.UtilConfig.IsJson(secretString))
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
        public static void SetConnectionStringConfig()
        {
            try
            {
                // Get the rds secret name.
                var secretId = AwsCommon.SecretsName.GetRdsSecretName();

                var secretValue = Client.GetSecretValue(new GetSecretValueRequest
                {
                    SecretId = secretId,
                });

                var secretString = secretValue.SecretString;
                if (secretString != null)
                {
                    if (AwsCommon.UtilConfig.IsJson(secretString))
                    {
                        //Convert the json string to json token.
                        var jObject = JToken.Parse(secretString);


                        ConfigurationManager.AppSettings.Set(AwsConstants.SALESFORCE_USERNAME, jObject["SALESFORCE_USERNAME"].ToString());
                        ConfigurationManager.AppSettings.Set(AwsConstants.SALESFORCE_PASSWORD, jObject["SALESFORCE_PASSWORD"].ToString());
                        ConfigurationManager.AppSettings.Set(AwsConstants.SALESFORCE_CLIENTID, jObject["SALESFORCE_CLIENTID"].ToString());
                        ConfigurationManager.AppSettings.Set(AwsConstants.SALESFORCE_CLIENTSECRET, jObject["SALESFORCE_CLIENTSECRET"].ToString());
                        ConfigurationManager.AppSettings.Set(AwsConstants.SALESFORCE_TOKENREQUESTURL, jObject["SALESFORCE_TOKENREQUESTURL"].ToString());
                        ConfigurationManager.AppSettings.Set(AwsConstants.SALESFORCE_APIVERSION, jObject["SALESFORCE_APIVERSION"].ToString());



                        #region DATABASE_CONNECTION_NAME
                        string connectionStringName = AwsConstants.DATABASE_CONNECTION_NAME;
                        string providerName = "System.Data.SqlClient";
                        // Get the connectionString.
                        string connectionString = $"Data Source={jObject["DB_HOST"]},{jObject["DB_PORT"]};Initial Catalog={jObject["DB_NAME"]};Integrated Security=false; user id={jObject["DB_USER_NAME"]};password={jObject["DB_PASSWORD"]}";
                        if (AwsCommon.UtilConfig.IsConnectionString(ConfigurationManager.ConnectionStrings[connectionStringName]))
                        {
                            AwsCommon.UtilConfig.UpdateConnectionString(providerName, connectionString, connectionStringName);
                        }
                        else
                        {
                            AwsCommon.UtilConfig.AddConnectionString(providerName, connectionString, connectionStringName);
                        }

                        connectionStringName = AwsConstants.SERVICE_DATABASE_CONNECTION_NAME;

                        if (AwsCommon.UtilConfig.IsConnectionString(ConfigurationManager.ConnectionStrings[connectionStringName]))
                        {
                            AwsCommon.UtilConfig.UpdateConnectionString(providerName, connectionString, connectionStringName);
                        }
                        else
                        {
                            AwsCommon.UtilConfig.AddConnectionString(providerName, connectionString, connectionStringName);
                        }
                        #endregion

                        #region HR_DATABASE
                        connectionStringName = AwsConstants.HR_DATABASE_CONNECTION_NAME;
                        providerName = "System.Data.SqlClient";
                        connectionString = $"Data Source={jObject["DB_HOST"]},{jObject["DB_PORT"]};Initial Catalog={jObject["HRDB_NAME"]};Integrated Security=false; user id={jObject["DB_USER_NAME"]};password={jObject["DB_PASSWORD"]}";
                     
                        if (AwsCommon.UtilConfig.IsConnectionString(ConfigurationManager.ConnectionStrings[connectionStringName]))
                        {
                            AwsCommon.UtilConfig.UpdateConnectionString(providerName, connectionString, connectionStringName);
                        }
                        else
                        {
                            AwsCommon.UtilConfig.AddConnectionString(providerName, connectionString, connectionStringName);
                        }
                        #endregion

                        #region SALES_FORCE
                        connectionStringName = AwsConstants.SALESFORCE_CONNECTION_NAME;
                        providerName = "System.Data.SqlClient";
                        connectionString = $"userid={jObject["SALESFORCE_USERNAME"]};password={jObject["SALESFORCE_PASSWORD"]};clientId={jObject["SALESFORCE_CLIENTID"]};clientSecret={jObject["SALESFORCE_CLIENTSECRET"]};tokenRequestEndpointUrl={jObject["SALESFORCE_TOKENREQUESTURL"]};ApiVersion={jObject["SALESFORCE_APIVERSION"]}";
                        if (AwsCommon.UtilConfig.IsConnectionString(ConfigurationManager.ConnectionStrings[connectionStringName]))
                        {
                            AwsCommon.UtilConfig.UpdateConnectionString(providerName, connectionString, connectionStringName);
                        }
                        else
                        {
                            AwsCommon.UtilConfig.AddConnectionString(providerName, connectionString, connectionStringName);
                        }
                        #endregion

                        #region CHARGEBEE_CONNECTION
                        connectionStringName = AwsConstants.CHARGEBEE_CONNECTION_NAME;
                        providerName = "";
                        connectionString = Convert.ToString(jObject["CHARGEBEE_CONNECTION"]);
                        if (AwsCommon.UtilConfig.IsConnectionString(ConfigurationManager.ConnectionStrings[connectionStringName]))
                        {
                            AwsCommon.UtilConfig.UpdateConnectionString(providerName, connectionString, connectionStringName);
                        }
                        else
                        {
                            AwsCommon.UtilConfig.AddConnectionString(providerName, connectionString, connectionStringName);
                        }
                        #endregion

                        #region ABBYY_DATABASE_CONNECTION_NAME
                        connectionStringName = AwsConstants.ABBYY_DATABASE_CONNECTION_NAME;
                        providerName = "System.Data.SqlClient";
                        // Get the connectionString.
                        connectionString = $"Data Source={jObject["ABBYY_DB_HOST"]},{jObject["ABBYY_DB_PORT"]};Initial Catalog={jObject["ABBYY_DB_NAME"]};Integrated Security=false; user id={jObject["ABBYY_DB_USER_NAME"]};password={jObject["ABBYY_DB_PASSWORD"]}";
                        if (AwsCommon.UtilConfig.IsConnectionString(ConfigurationManager.ConnectionStrings[connectionStringName]))
                        {
                            AwsCommon.UtilConfig.UpdateConnectionString(providerName, connectionString, connectionStringName);
                        }
                        else
                        {
                            AwsCommon.UtilConfig.AddConnectionString(providerName, connectionString, connectionStringName);
                        }
                        #endregion

                        #region DATABASE_CONNECTION_NAME_ENTITY
                        connectionStringName = AwsConstants.DATABASE_CONNECTION_NAME_ENTITY;
                        providerName = "System.Data.EntityClient";

                        string connectionStringEntity = new System.Data.EntityClient.EntityConnectionStringBuilder
                        {
                            Metadata = "res://*/Models.DEQueueCount.csdl|res://*/Models.DEQueueCount.ssdl|res://*/Models.DEQueueCount.msl",
                            Provider = "System.Data.SqlClient",
                            ProviderConnectionString = new System.Data.SqlClient.SqlConnectionStringBuilder
                            {
                                InitialCatalog = Convert.ToString(jObject["DB_NAME"]),
                                DataSource = $"{ jObject["DB_HOST"] },{ jObject["DB_PORT"] }",
                                IntegratedSecurity = false,
                                UserID = Convert.ToString(jObject["DB_USER_NAME"]),
                                Password = Convert.ToString(jObject["DB_PASSWORD"]),
                            }.ConnectionString
                        }.ConnectionString;
                        if (AwsCommon.UtilConfig.IsConnectionString(ConfigurationManager.ConnectionStrings[connectionStringName]))
                        {
                            AwsCommon.UtilConfig.UpdateConnectionString(providerName, connectionStringEntity, connectionStringName);
                        }
                        else
                        {
                            AwsCommon.UtilConfig.AddConnectionString(providerName, connectionStringEntity, connectionStringName);
                        }
                        #endregion

                        #region ABBYY_DATABASE_CONNECTION_NAME_ENTITY
                        connectionStringName = AwsConstants.ABBYY_DATABASE_CONNECTION_NAME_ENTITY;
                        providerName = "System.Data.EntityClient";
                        connectionStringEntity = new System.Data.EntityClient.EntityConnectionStringBuilder
                        {
                            Metadata = "res://*/Models.TenantPendingCount.csdl|res://*/Models.TenantPendingCount.ssdl|res://*/Models.TenantPendingCount.msl",
                            Provider = "System.Data.SqlClient",
                            ProviderConnectionString = new System.Data.SqlClient.SqlConnectionStringBuilder
                            {
                                InitialCatalog = Convert.ToString(jObject["ABBYY_DB_NAME"]),
                                DataSource = $"{ jObject["ABBYY_DB_HOST"] },{ jObject["ABBYY_DB_PORT"] }",
                                IntegratedSecurity = false,
                                UserID = Convert.ToString(jObject["ABBYY_DB_USER_NAME"]),
                                Password = Convert.ToString(jObject["ABBYY_DB_PASSWORD"]),
                            }.ConnectionString
                        }.ConnectionString;
                        if (AwsCommon.UtilConfig.IsConnectionString(ConfigurationManager.ConnectionStrings[connectionStringName]))
                        {
                            AwsCommon.UtilConfig.UpdateConnectionString(providerName, connectionStringEntity, connectionStringName);
                        }
                        else
                        {
                            AwsCommon.UtilConfig.AddConnectionString(providerName, connectionStringEntity, connectionStringName);
                        }
                        #endregion


                    }
                    else
                    {
                        throw new FormatException("Unsupported json format");
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}