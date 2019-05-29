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
 class encryptSha1
    {
     //String data = "test";
     //       System.Text.ASCIIEncoding enc = new System.Text.ASCIIEncoding(); 
     //       byte[] dataArray = enc.GetBytes(data); 			
     //       byte[] result;

     //       SHA1 sha = new SHA1CryptoServiceProvider();
     //       // This is one implementation of the abstract class SHA1.
     //       result = sha.ComputeHash(dataArray);
     //       foreach (byte b in result)
     //       {
     //           Console.WriteLine(b);
     //       }


     public string GetSHA1HashData(string data)
     {
         ////create new instance of md5
         //SHA1 sha1 = SHA1.Create();

         ////convert the input text to array of bytes
         //byte[] hashData = sha1.ComputeHash(Encoding.Default.GetBytes(data));


        

         ////create new instance of StringBuilder to save hashed data
         //StringBuilder returnValue = new StringBuilder();

         ////loop for each byte and add it to StringBuilder
         //for (int i = 0; i < hashData.Length; i++)
         //{
         //    returnValue.Append(hashData[i].ToString());
         //}

         //// return hexadecimal string
         //return returnValue.ToString();

         //byte[] data1 = new byte[32];
         //byte[] result;

         //SHA1 sha = new SHA1CryptoServiceProvider();
         //// This is one implementation of the abstract class SHA1.
         //result = sha.ComputeHash(data1);

         try
         {

             return (FormsAuthentication.HashPasswordForStoringInConfigFile(data, "SHA1")).ToLower();
         }
         catch(Exception ex )
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