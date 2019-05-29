using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MTS.ServiceBase
{
   public  interface IMTSServiceBase
    {
         bool DoTask();
         void OnStart(string Params);
    }

   public interface IMTSTenantServiceBase : IMTSServiceBase
   {
       bool DoTask(string param);
   }
}
