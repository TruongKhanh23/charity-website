using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class ReceivePayAccountViewModel
    {
        public int ID { get; set; }

        [StringLength(100)]
        public string Code { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        public string CurrencyName { get; set; }

        public decimal? Original { get; set; }

        public decimal? OriginalTotal { get; set; }

        public decimal? ReceivedTotal { get; set; }

        public decimal? PayedTotal { get; set; }

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
