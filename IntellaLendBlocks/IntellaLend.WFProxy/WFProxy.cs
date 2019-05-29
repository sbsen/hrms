using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;

namespace IntellaLend.WFProxy
{
    public class WFProxy
    {
        public static void ExecuteWorkFlow(Dictionary<string, string> wfValues)
        {
            try
            {               
                BasicHttpBinding binding = new BasicHttpBinding();
                EndpointAddress endpoint = new EndpointAddress(new Uri(WFProxyDataAccess.WorkFlowURL));

                IntellaLendWF.ServiceClient client = new IntellaLendWF.ServiceClient(binding, endpoint);
                client.ExecuteWorkFlow(wfValues);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
