using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class MedicalEquipmentViewModel
    {
        public int ID { get; set; }

        [StringLength(500)]
        public string Name { get; set; }
        public string Uses { get; set; }

        [StringLength(100)]
        public string Unit { get; set; }
        public int Amount { get; set; }

        public DateTime? ManufacturingDate { get; set; }
        public DateTime ExpiryDate { get; set; }
        public string CategoryName { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
