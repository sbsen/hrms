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
using System.Web.Security;

namespace MTS.Login.Data
{
    public class Encrypt
    {
        public string GetSHA1HashData(string data)
        {
            try
            {

                return (FormsAuthentication.HashPasswordForStoringInConfigFile(data, "SHA1")).ToLower();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        public string CreateRandomPassword(int passwordLength)
        {
            string allowedChars = "abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
            char[] chars = new char[passwordLength];
            Random rd = new Random();
            for (int i = 0; i < passwordLength; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }           
            return new string(chars);
        }

    }
}