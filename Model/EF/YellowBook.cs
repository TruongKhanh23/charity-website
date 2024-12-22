namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("YellowBook")]
    public partial class YellowBook
    {
        public int ID { get; set; }

        public DateTime? Date { get; set; }

        [StringLength(500)]
        public string GiverName { get; set; }

        [StringLength(100)]
        public string Phone { get; set; }
        [StringLength(500)]
        public string Address { get; set; }
        [StringLength(500)]
        public string ReceiverName { get; set; }
        [StringLength(500)]
        public string ProductName1 { get; set; }
        public decimal Amount1 { get; set; }
        public string Unit1 { get; set; }
        public decimal Price1 { get; set; }
        public string ProductName2 { get; set; }
        public decimal Amount2 { get; set; }
        public string Unit2 { get; set; }
        public decimal Price2 { get; set; }
        public string ProductName3 { get; set; }
        public decimal Amount3 { get; set; }
        public string Unit3 { get; set; }
        public decimal Price3 { get; set; }
        public decimal TotalMoney { get; set; }
        public DateTime? CreatedDate { get; set; }

        [StringLength(250)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(250)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
