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
    public class XFamilyBookViewModel
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Code { get; set; }
        public int ChildrenID { get; set; }

        public string ChildrenName { get; set; }

        [StringLength(50)]
        public string BaptismalName { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }

    }
}
