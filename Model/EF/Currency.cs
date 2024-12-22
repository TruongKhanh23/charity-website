namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Currency")]
    public partial class Currency
    {
        public int ID { get; set; }

        [StringLength(100)]
        public string Code { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        [StringLength(100)]
        public string NameInternational { get; set; }

        [StringLength(10)]
        public string Symbol { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
