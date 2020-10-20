using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MTSINHR.Models
{
    public class Payroll
    {     
        public Int64 EmpId { get; set; }

        public float Basic_Pay { get; set; }

        public float HouseRentAllwn { get; set; }

        public float SpecialAllwn { get; set; }

        public float MedicalAllwn { get; set; }

        public float ConveyanceAllwn { get; set; }

        public float FoodAllwn { get; set; }

        public float GrossSalary { get; set; }

        public float PF { get; set; }

        public float ProffesionalTax { get; set; }

        public float ESI { get; set; }

        public float SodexoPass { get; set; }

        public float Others { get; set; }

        public float TotalDeduction { get; set; }

        public float NetSalary { get; set; }

        public DateTime? EffectiveSince { get; set; }

        public Boolean PF_Restriction  { get; set; }
    }
}