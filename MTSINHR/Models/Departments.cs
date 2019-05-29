using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace MTSINHR.Models
{
    public class Departments
    {
        public Int64 id { get; set; }
        [Required]
        public string department { get; set; }
    }
}