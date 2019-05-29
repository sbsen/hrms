using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MTSINHR.Models
{
   public class Qualification
    {   
        [Key]
        public Int64 Id { get; set; }

        [Required]
        public string qualification { get; set; }
    }
}
