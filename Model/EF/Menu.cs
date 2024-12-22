namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("Menu")]
    public partial class Menu
    {
        public int ID { get; set; }

        public DateTime Date { get; set; }
        public int MorningTapas { get; set; }
        public int MorningFry { get; set; }
        public int MorningSoup { get; set; }
        public int Brunch1 { get; set; }
        public int Brunch2 { get; set; }
        public int NoonTapas { get; set; }
        public int NoonFry { get; set; }
        public int NoonSoup { get; set; }
        public int Tea1 { get; set; }
        public int Tea2 { get; set; }
        public int AfternoonTapas { get; set; }
        public int AfternoonFry { get; set; }
        public int AfternoonSoup { get; set; }
        public int Dinner1 { get; set; }
        public int Dinner2 { get; set; }

        public string Note { get; set; }
        public DateTime? CreatedDate { get; set; }

        [StringLength(250)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(250)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
