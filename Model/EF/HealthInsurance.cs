namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HealthInsurance")]
    public partial class HealthInsurance
    {
        public int ID { get; set; }

        public int ChildrenID { get; set; }

        [StringLength(50)]
        public string No { get; set; }

        [StringLength(250)]
        public string RegisteredHospital { get; set; }

        public DateTime? BoughtDate { get; set; }

        public DateTime? EndDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public bool Status { get; set; }
    }
}
