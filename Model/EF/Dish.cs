namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("Dish")]
    public partial class Dish
    {
        public int ID { get; set; }

        [StringLength(500)]
        public string Name { get; set; }

        public string Material { get; set; }

        public string Nutrition { get; set; }

        public string Note { get; set; }
        public string Type { get; set; }
        public DateTime? CreatedDate { get; set; }

        [StringLength(250)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(250)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
