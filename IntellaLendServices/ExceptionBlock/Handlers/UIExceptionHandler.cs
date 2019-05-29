using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using Microsoft.Practices.EnterpriseLibrary.ExceptionHandling;

namespace MTSEntBlocks.ExceptionBlock.Handlers
{
    public static class UIExceptionHandler
    {
        public static bool HandleException(ref System.Exception ex)
        {
            return true;
            //bool rethrow = false;
            //try
            //{
            //    if (ex is MTSException)
            //    {
            //        // DA BL exception has already been logged / handled
            //    }
            //    else
            //    {
            //        rethrow = ExceptionPolicy.HandleException(ex, "UserInterfacePolicy");
            //    }
            //}
            //catch (Exception exp)
            //{
            //    ex = exp;
            //}
            //return rethrow;
        }
    }
}
