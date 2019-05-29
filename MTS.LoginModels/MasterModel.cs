using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Data.Common;
using System.Data;
using System.Web.Mvc;

namespace MTS.LoginModels
{
    public abstract class MasterModel
    {
     
        public virtual string Name { get; set; }
        public virtual string ItemId { get; set; }
        public virtual string Type { get; set; }        
    }

    public class MasterJudgeModel : MasterModel { 
        [Required(ErrorMessage = "Required field")]
        [Display(Name = "Judge")]
        public override string Name { get; set; }
        public override string ItemId { get; set; }
        public override string Type { get; set; }  
    }
    public class MasterStateModel : MasterModel 
        {
        [Required(ErrorMessage = "Required field")]
        [Display(Name = "State")]
        public override string Name { get; set; }
        public override string ItemId { get; set; }
        public override string Type { get; set; }  
        }


}
