namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Receipt")]
    public partial class Receipt
    {
        public int ID { get; set; }

        public int ReceivePayAccountID { get; set; }

        public DateTime? Date { get; set; }

        public int ReceivePayID { get; set; }

        public decimal? Amount { get; set; }

        [StringLength(500)]
        public string AmountText { get; set; }

        [StringLength(100)]
        public string Code { get; set; }

        public int ReceivePayObjectID { get; set; }

        [StringLength(50)]
        public string Phone { get; set; }

        [StringLength(100)]
        public string IDNo { get; set; }

        public DateTime? DateOfIssue { get; set; }

        [StringLength(500)]
        public string PlaceOfIssue { get; set; }

        [StringLength(100)]
        public string AccountNo { get; set; }

        public int? AtBank { get; set; }

        [StringLength(250)]
        public string FinancialPaper { get; set; }

        [StringLength(500)]
        public string Note { get; set; }

        [StringLength(500)]
        public string Address { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
