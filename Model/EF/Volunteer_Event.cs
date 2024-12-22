namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Volunteer_Event
    {
        public int ID { get; set; }

        public int VolunteerID { get; set; }

        public int EventID { get; set; }

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        public string Note { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public bool Status { get; set; }
    }
}
