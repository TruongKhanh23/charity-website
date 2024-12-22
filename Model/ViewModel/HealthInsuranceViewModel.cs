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
    public class HealthInsuranceViewModel
    {
        public int ID { get; set; }
        public int ChildrenID { get; set; }
        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(50)]
        public string No { get; set; }

        [StringLength(250)]
        public string RegisteredHospital { get; set; }

        public DateTime? BoughtDate { get; set; }

        public DateTime? EndDate { get; set; }
        [DisplayName(" Ngày tạo ")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        [DisplayName(" Tạo bởi ")]
        public string CreatedBy { get; set; }

        [DisplayName(" Ngày cập nhật ")]
        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        [DisplayName(" Cập nhật bởi ")]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
