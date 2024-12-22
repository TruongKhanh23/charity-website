namespace Model.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("Religion")]
    public partial class Religion
    {
        public int ID { get; set; }

        [StringLength(100)]
        public string Name { get; set; }
    }
}
