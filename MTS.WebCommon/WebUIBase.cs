using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.Web;
using System.Data;
using System.Web.Mvc;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text.RegularExpressions;

namespace MTS.Web.MVC.Common.UI
{
    public class WebUIBase
    {

        //protected String CheckURI
        //{
        //    get
        //    {
        //        return HttpContext.Current.Application["PROXY_CHECKWF"].ToString();
        //    }
        //}

        protected String InvoiceURI
        {
            get
            {
                return HttpContext.Current.Application["PROXY_INVOICEWF"].ToString();
            }
        }

        //protected bool IsMICRCaptureEnabled
        //{
        //    get
        //    {
        //        if (HttpContext.Current.Application["MICRCAPTUREENABLED"].ToString().ToUpper() == "YES")
        //        {
        //            return true;
        //        }
        //        else
        //        {
        //            return false;
        //        }
                
        //    }
        //}

        //protected String MICRIQAURI
        //{
        //    get
        //    {
        //        return string.Empty;
        //    }
        //}

        //protected String PCardURI
        //{
        //    get
        //    {
        //        return HttpContext.Current.Application["PROXY_PCARDWF"].ToString();
        //    }
        //}
        
        //protected String No_Of_Checks_Allowed
        //{
        //    get
        //    {
        //        return HttpContext.Current.Application["NO_OF_CHECKS_ALLOWED"].ToString();
        //    }
        //}

        //protected String No_Of_Invoice_Allowed
        //{
        //    get
        //    {
        //        return HttpContext.Current.Application["INVOICE_GL_MAX_LIMIT"].ToString();
        //    }
        //}


        //protected Int64 Invoice_DueDate_Range
        //{
        //    get
        //    {
        //        return Convert.ToInt64 (HttpContext.Current.Application["INVOICE_DUEDATE_RANGE"].ToString());
        //    }
        //}

        //protected String INVOICE_IMAGE_SIZE
        //{
        //    get
        //    {
        //        return HttpContext.Current.Application["INVOICE_ATTACHMENT_SIZE"].ToString();
        //    }
        //}

        //protected String Scanner
        //{
        //    get
        //    {
        //        return HttpContext.Current.Application["SCANNER"].ToString();
        //    }
        //}

        public List<SelectListItem> GetSelectListItem(DataTable dt)
        {
            try
            {
                List<SelectListItem> items = new List<SelectListItem>();
                if (dt.Rows.Count > 0)
                {
                    items = (from dropdownfill in dt.AsEnumerable()                            
                             select new SelectListItem     // data()
                             {
                                 Value = dropdownfill.ItemArray[0].ToString().TrimEnd(),
                                 Text = dropdownfill.ItemArray[1].ToString()
                             }).ToList();
                }
                return items;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
   



    }
}
