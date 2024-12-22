namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("Event")]
    public partial class Event
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Code { get; set; }

        [StringLength(50)]
        public string Type { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        public string Description { get; set; }

        public string MoreInformation { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }
        [StringLength(500)]
        public string Image { get; set; }
        [NotMapped]
        public HttpPostedFileBase ImageFile { get; set; }
        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public bool Status { get; set; }
    }
}
