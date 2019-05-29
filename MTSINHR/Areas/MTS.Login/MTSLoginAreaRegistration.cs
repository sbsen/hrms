using System.Web.Mvc;

namespace MTS.Login {
    public class MTSLoginAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "MTS.Login";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "MTS.Login_default",
                "MTS.Login/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
