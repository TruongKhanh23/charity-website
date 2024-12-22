namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DevelopmentProcess")]
    public partial class DevelopmentProcess
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Code { get; set; }

        public int ChildrenID { get; set; }

        [StringLength(500)]
        public string Title { get; set; }

        public string MetaDescription { get; set; }

        public string Description { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        [StringLength(250)]
        public string Thumbnail { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public bool Status { get; set; }
    }
}
