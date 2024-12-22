using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class PaymentViewModel
    {
        public int ID { get; set; }

        public string ReceivePayAccountName { get; set; }

        public DateTime? Date { get; set; }

        public string ReceivePayName { get; set; }

        public decimal? Amount { get; set; }

        [StringLength(100)]
        public string Code { get; set; }

        public string ReceivePayObjectName { get; set; }

        [StringLength(500)]
        public string Address { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }

    }
}
