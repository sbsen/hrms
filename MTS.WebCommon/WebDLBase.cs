using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.Common;
using MTSEntBlocks.DataBlock;

namespace MTS.Web.MVC.Common.Data
{
    public class WebDLBase
    {
        public static DataTable GetImages(Int64 ImgDocID)
        {
            return ImageDataAccess.GetImage(ImgDocID);
        }
        
    }

}
