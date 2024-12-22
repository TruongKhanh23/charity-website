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
    public class ChildrenViewModel
    {
        public int ID { get; set; }

        [StringLength(250)]
        public string FullName { get; set; }
        public int CateID { get; set; }
        public string CateName { get; set; }
        public int MajorID { get; set; }
        public string MajorName { get; set; }
        public int ProfessionalQualificationID { get; set; }
        public string ProfessionalQualificationName { get; set; }
        public int EducationID { get; set; }
        public string EducationName { get; set; }
        public string Code { get; set; }
        public int CounselingID { get; set; }
        public int Time { get; set; }
        public string Ticket { get; set; }
        public string HealthInsurance { get; set; }
        public string Image { get; set; }
        public DateTime? CreatedDate { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public bool Status { get; set; }
    }
}
