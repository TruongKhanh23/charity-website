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
    public class EmployeeViewModel
    {
        public int ID { get; set; }

        [StringLength(250)]
        public string Code { get; set; }
        [StringLength(250)]
        public string Name { get; set; }
        [StringLength(250)]
        public string EducationName { get; set; }
        public int ProfessID { get; set; }
        [StringLength(50)]
        public string ProfessionalQualificationName { get; set; }
        public int MajorID { get; set; }
        [StringLength(50)]
        public string MajorName { get; set; }
        [StringLength(250)]
        [DisplayName("Ảnh đại diện")]
        public string Image { get; set; }
        public string CreatedBy { get; set; }
        public string ModifiedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool Status { get; set; }
    }
}
