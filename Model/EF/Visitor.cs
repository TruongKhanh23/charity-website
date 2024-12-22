namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Visitor")]
    public partial class Visitor
    {
        public int ID { get; set; }

        public string Name { get; set; }

        public string VisitReason { get; set; }

        [StringLength(150)]
        public string Phone { get; set; }

        [StringLength(250)]
        public string Email { get; set; }

        public DateTime? CreatedDate { get; set; }

        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
