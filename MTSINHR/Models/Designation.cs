using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSINHR.Models
{
   public class Designation
    {        
        public Int64 Id { get; set; }

        [Required]
        public string designation { get; set; }
    }
}
