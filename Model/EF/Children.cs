namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    public partial class Children
    {
        public int ID { get; set; }
        [StringLength(12)]
        public string IdentityCard { get; set; }

        [StringLength(50)]
        public string Code { get; set; }

        public bool? Successive { get; set; }

        public decimal FoodExpenses { set; get; }
        public decimal EducationExpenses { get; set; }
        [StringLength(250)]
        public string FullName { get; set; }
        public DateTime? StartLiveDate { get; set; }
        public DateTime DateOfBirth { get; set; }

        [StringLength(500)]
        public string PlaceOfBirth { get; set; }

        [StringLength(250)]
        public string Gender { get; set; }

        [StringLength(250)]
        public string Ethnic { get; set; }
        [StringLength(250)]
        public string Image { get; set; }
        [NotMapped]
        public HttpPostedFileBase ImageFile { get; set; }

        [StringLength(250)]
        public string BirthCertificate { get; set; }
        [NotMapped]
        public HttpPostedFileBase BirthCertificateImageFile { get; set; }
        public string HkType { get; set; }

        [StringLength(250)]
        public string HKImage { get; set; }
        [NotMapped]
        public HttpPostedFileBase HKImageFile { get; set; }

        public bool? Confirmation { get; set; }

        [StringLength(250)]
        public string EnrollReason { get; set; }

        public DateTime? Date { get; set; }

        public int CategoryID { get; set; }

        public int ProfessionalQualificationID { get; set; }

        public int MajorID { get; set; }

        public int EducationID { get; set; }

        [StringLength(250)]
        public string MetaDescriptions { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
