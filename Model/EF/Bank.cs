namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Bank")]
    public partial class Bank
    {
        public int ID { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(250)]
        public string EnglishName { get; set; }

        [StringLength(100)]
        public string ShorcutName { get; set; }

        [StringLength(100)]
        public string Website { get; set; }

        [StringLength(500)]
        public string Address { get; set; }

        [StringLength(100)]
        public string NationalName { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
