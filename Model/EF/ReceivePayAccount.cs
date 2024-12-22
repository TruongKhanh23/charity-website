namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ReceivePayAccount")]
    public partial class ReceivePayAccount
    {
        public int ID { get; set; }

        [StringLength(100)]
        public string Code { get; set; }

        [StringLength(100)]
        public string Name { get; set; }

        public int CurrencyID { get; set; }

        public decimal? Original { get; set; }

        [StringLength(500)]
        public string Note { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
