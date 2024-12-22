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
    public class SchoolReportViewModel
    {
        public int ID { get; set; }
        public int ChildrenID { get; set; }
        public string ChildrenName { get; set; }
        public string SchoolReportCode { get; set; }
        public string TypeName { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
    }
}
