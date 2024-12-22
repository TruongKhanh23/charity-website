using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class ReceivePayViewModel
    {

        public int ID { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        public bool? ReceivableIsTrue { get; set; }

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
