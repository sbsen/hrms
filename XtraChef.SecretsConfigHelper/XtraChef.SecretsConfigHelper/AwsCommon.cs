using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Reflection;
using System.Text;

namespace XtraChef.SecretsConfigHelper
{
    public class AwsCommon
    {
        /// <summary>
        /// EnDecrypt.
        /// </summary>
        public static string EnDecrypt(string input, bool decrypt = false)
        {
            string _alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ984023";

            if (decrypt)
            {
                Dictionary<string, uint> _index = null;
                Dictionary<string, Dictionary<string, uint>> _indexes = new Dictionary<string, Dictionary<string, uint>>(2, StringComparer.InvariantCulture);

                if (_index == null)
                {
                    Dictionary<string, uint> cidx;

                    string indexKey = "I" + _alphabet;

                    if (!_indexes.TryGetValue(indexKey, out cidx))
                    {
                        lock (_indexes)
                        {
                            if (!_indexes.TryGetValue(indexKey, out cidx))
                            {
                                cidx = new Dictionary<string, uint>(_alphabet.Length, StringComparer.InvariantCulture);
                                for (int i = 0; i < _alphabet.Length; i++)
                                {
                                    cidx[_alphabet.Substring(i, 1)] = (uint)i;
                                }
                                _indexes.Add(indexKey, cidx);
                            }
                        }
                    }

                    _index = cidx;
                }

                MemoryStream ms = new MemoryStream(Math.Max((int)Math.Ceiling(input.Length * 5 / 8.0), 1));

                for (int i = 0; i < input.Length; i += 8)
                {
                    int chars = Math.Min(input.Length - i, 8);

                    ulong val = 0;

                    int bytes = (int)Math.Floor(chars * (5 / 8.0));

                    for (int charOffset = 0; charOffset < chars; charOffset++)
                    {
                        uint cbyte;
                        if (!_index.TryGetValue(input.Substring(i + charOffset, 1), out cbyte))
                        {
                            throw new ArgumentException(string.Format("Invalid character {0} valid characters are: {1}", input.Substring(i + charOffset, 1), _alphabet));
                        }

                        val |= (((ulong)cbyte) << ((((bytes + 1) * 8) - (charOffset * 5)) - 5));
                    }

                    byte[] buff = BitConverter.GetBytes(val);
                    Array.Reverse(buff);
                    ms.Write(buff, buff.Length - (bytes + 1), bytes);
                }

                return System.Text.ASCIIEncoding.ASCII.GetString(ms.ToArray());
            }
            else
            {

                byte[] data = System.Text.ASCIIEncoding.ASCII.GetBytes(input);

                StringBuilder result = new StringBuilder(Math.Max((int)Math.Ceiling(data.Length * 8 / 5.0), 1));

                byte[] emptyBuff = new byte[] { 0, 0, 0, 0, 0, 0, 0, 0 };
                byte[] buff = new byte[8];

                for (int i = 0; i < data.Length; i += 5)
                {
                    int bytes = Math.Min(data.Length - i, 5);

                    Array.Copy(emptyBuff, buff, emptyBuff.Length);
                    Array.Copy(data, i, buff, buff.Length - (bytes + 1), bytes);
                    Array.Reverse(buff);
                    ulong val = BitConverter.ToUInt64(buff, 0);

                    for (int bitOffset = ((bytes + 1) * 8) - 5; bitOffset > 3; bitOffset -= 5)
                    {
                        result.Append(_alphabet[(int)((val >> bitOffset) & 0x1f)]);
                    }
                }


                return result.ToString();
            }
        }

        #region Region

        /// <summary>
		
        /// Resion.
        /// </summary>
        public class Region
        {
            public static string GetRegionName()
            {
                var environment = string.Empty;
                var aspNetCoreEnvironment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", EnvironmentVariableTarget.Machine);
                switch (aspNetCoreEnvironment)
                {
                    case "Dev":
                        environment = RegionName.Metadata.DEVELOPMENT;
                        break;
                    case "Int":
                        environment = RegionName.Metadata.INT;
                        break;
                    case "Preprod":
                        environment = RegionName.Metadata.PREPROD;
                        break;
                    case "Prod":
                        environment = RegionName.Metadata.PRODUCTION;
                        break;
                    case "Demo":
                        environment = RegionName.Metadata.DEMONEW;
                        break;
                    default:
                        {
                            throw new FormatException("unsupported environment");
                        }
                }

                return environment;
            }
        }
        #endregion

        #region SecretsName

        /// <summary>
        /// SecretsName.
        /// </summary>
        public class SecretsName
        {
            public static string GetAwsSecretName()
            {
                var environment = string.Empty;
                var aspNetCoreEnvironment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", EnvironmentVariableTarget.Machine);
                switch (aspNetCoreEnvironment)
                {
                    case "Dev":
                        environment = AwsSecretManager.Development.awsSecretJson;
                        break;
                    case "Int":
                        environment = AwsSecretManager.Int.awsSecretJson;
                        break;
                    case "Preprod":
                        environment = AwsSecretManager.Preprod.awsSecretJson;
                        break;
                    case "Demo":
                        environment = AwsSecretManager.Demo.awsSecretJson;
                        break;
                    case "Prod":
                        environment = AwsSecretManager.Prod.awsSecretJson;
                        break;
                    default:
                        {
                            throw new FormatException("unsupported environment");
                        }
                }

                return environment;
            }

            public static string GetRdsSecretName()
            {
                var environment = string.Empty;
                var aspNetCoreEnvironment = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", EnvironmentVariableTarget.Machine);
                switch (aspNetCoreEnvironment)
                {
                    case "Dev":
                        environment = RdsSecretManager.Development.rdsSecretJson;
                        break;
                    case "Int":
                        environment = RdsSecretManager.Int.rdsSecretJson;
                        break;
                    case "Preprod":
                        environment = RdsSecretManager.Preprod.rdsSecretJson;
                        break;
                    case "Demo":
                        environment = RdsSecretManager.Demo.rdsSecretJson;
                        break;
                    case "Prod":
                        environment = RdsSecretManager.Prod.rdsSecretJson;
                        break;
                    default:
                        {
                            throw new FormatException("unsupported environment");
                        }
                }

                return environment;
            }
        }

        #endregion

        #region UtilConfig

        /// <summary>
        /// UtilConfig.
        /// </summary>
        public class UtilConfig
        {
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
            //     Check the ConnectionString is availble in web.config or app.config.
            //
            // Parameters:
            //   connectionString:
            //     The Connection String Settings object.
            public static bool IsConnectionString(ConnectionStringSettings connectionString)
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
            public static void AddConnectionString(string providerName, string connectionString, string connectionStringName)
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
            public static void UpdateConnectionString(string providerName, string connectionString, string connectionStringName)
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
        #endregion
    }
}