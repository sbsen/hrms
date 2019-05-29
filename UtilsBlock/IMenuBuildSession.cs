using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MTSEntBlocks.UtilsBlock
{
   public interface IMenuBuildSession
    {
       Int64 USERID { get; set; }
       bool MENURANGE { get; set; }
       Int64 USERROLE { get; set; }
       string AUTHORITYLEVEL { get; set; }
    }
}
