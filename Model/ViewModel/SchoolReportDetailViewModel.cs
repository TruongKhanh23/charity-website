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
    public class SchoolReportDetailViewModel
    {
        public int ID { get; set; }
        public int ChildrenID { get; set; }
        public int SchoolReportID { get; set; }
        public string SchoolReportCode { get; set; }
        public string FullName { get; set; }
        public string SchoolName { get; set; }
        public string SchoolYear { get; set; }
        public string FullYear { get; set; }
        public int Rating { get; set; }
        public string Image { get; set; }
        public string SchoolReportTypeName { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
    }
}
