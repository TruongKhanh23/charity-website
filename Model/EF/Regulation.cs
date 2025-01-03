namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Regulation")]
    public partial class Regulation
    {
        public int ID { get; set; }

        [StringLength(250)]
        public string Code { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public string MetaDescriptions { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        [StringLength(250)]
        public string MetaKeyWords { get; set; }

        public bool Status { get; set; }
    }
}
