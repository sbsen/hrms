using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Text.RegularExpressions;

namespace MTS.Web.MVC.Common.Business
{
    public class WebBusinessBase
    {

        public bool isNumeric(string input)
        {
            Int32 output = 0;
            bool bNumeric = false;
            try
            {
                bNumeric = Int32.TryParse(input, out output);
                return bNumeric;
            }
            catch
            {
                return bNumeric;
            }
        }

        private string GetBetweenString(string strSource, string strStart, string strEnd, ref int stripIdx)
        {
            int Start, End;
            if (strSource.Contains(strStart) && strSource.Contains(strEnd))
            {
                Start = strSource.IndexOf(strStart, 0) + strStart.Length;
                End = strSource.IndexOf(strEnd, Start);

                if (End == -1)
                    return string.Empty;

                stripIdx = End;
                return strSource.Substring(Start, End - Start);
            }
            else
            {
                return string.Empty;
            }
        }

        public DataTable GetImage(Int64 imgDocId)
        {
            DataTable dtImage = new DataTable();
            dtImage = Data.WebDLBase.GetImages(imgDocId);
            dtImage.TableName = "dtImage";
            return dtImage;
        }
    }
}
