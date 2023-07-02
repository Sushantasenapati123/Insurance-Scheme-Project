using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace InsuranceClaimDetailsProj.Models
{
    public class InsuranceEntity
    {
        public int Hosp_ID { get; set; }
        public string Hosp_Name { get; set; }
        public int Doct_ID { get; set; }
        public string Doct_Name { get; set; }
        public int Insurance_ID { get; set; }
        public string Insurance_Name { get; set; }
        public int Insurance_Scheme_ID { get; set; }
        public string Insurance_Scheme_Name { get; set; }
        public decimal Insurance_Percentage_cover { get; set; }
        public int Patient_ID { get; set; }

        public string Patient_Name { get; set; }
        public decimal Patient_Phone { get; set; }
        public int Status { get; set; }

        public string Admission_Date { get; set; }
        public string Discharge_Date  { get; set; }
        [NotMapped]
        public decimal Total_Expenses { get; set; }
        [NotMapped]
        public string Insured_amount { get; set; }
        [NotMapped]
        public string Total_Payble_Amount { get; set; }

    }

}
