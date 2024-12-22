using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.Spatial;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.ViewModel
{
    public class ActivityViewModel
    {
        public int ID { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(250)]
        public string MetaTitle { get; set; }

        public string Description { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        public string Details { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(250)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(250)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }


    }
}
