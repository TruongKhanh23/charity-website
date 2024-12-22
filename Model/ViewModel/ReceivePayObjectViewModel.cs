using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class ReceivePayObjectViewModel
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Code { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(100)]
        public string AffiliatedUnit { get; set; }

        [StringLength(500)]
        public string Address { get; set; }

        [StringLength(100)]
        public string Phone { get; set; }

        [StringLength(100)]
        public string Fax { get; set; }

        [StringLength(100)]
        public string Website { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(100)]
        public string BankingNumber { get; set; }

        public string BankName { get; set; }

        public string CategoryName { get; set; }
        public string HolderName { get; set; }

        [StringLength(500)]
        public string Note { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }

    }
}
