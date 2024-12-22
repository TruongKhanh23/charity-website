namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("About")]
    public partial class About
    {
        public int ID { get; set; }

        [StringLength(100)]
        public string BigTitleLine1 { get; set; }
        [StringLength(100)]
        public string BigTitleLine2 { get; set; }

        [StringLength(500)]
        public string Description { get; set; }
        [StringLength(500)]

        public string Slogan { get; set; }


        public string Introduce { get; set; }

        [StringLength(200)]
        public string BankingNumber { get; set; }
        [StringLength(500)]

        public string BankBranch { get; set; }
        [StringLength(500)]
        public string AccountHolder { get; set; }
        [StringLength(500)]

        public string Email { get; set; }


    }
}
