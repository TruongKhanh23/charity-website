namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    [Table("Employee")]
    public partial class Employee
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Code { get; set; }

        [StringLength(12)]
        public string IdentityCard { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        [StringLength(250)]
        public string Gender { get; set; }

        [StringLength(250)]
        public string Image { get; set; }
        [NotMapped]
        public HttpPostedFileBase ImageFile { get; set; }
        [StringLength(500)]
        public string Agreement { get; set; }
        [NotMapped]
        public HttpPostedFileBase AgreementFile { get; set; }

        public DateTime DateOfBirth { get; set; }

        [StringLength(50)]
        public string Domicile { get; set; }

        [StringLength(250)]
        public string PlaceOfBirth { get; set; }

        public int ProfessionalQualificationID { get; set; }

        public int EducationID { get; set; }

        public int MajorID { get; set; }

        [StringLength(250)]
        public string StudiedAt { get; set; }

        [StringLength(250)]
        public string Language { get; set; }

        [StringLength(250)]
        public string InformationTechnology { get; set; }

        [StringLength(250)]
        public string Job { get; set; }

        [StringLength(250)]
        public string JobName { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(250)]
        public string Phone { get; set; }

        public bool Successive { get; set; }

        [StringLength(250)]
        public string Religion { get; set; }

        public decimal? StartingSalagy { get; set; }

        public decimal? GiftSalary { get; set; }

        public decimal? AllOtherFoodExpenses { get; set; }

        [StringLength(250)]
        public string ContractType { get; set; }

        public bool? WorkingContract { get; set; }

        public DateTime? WorkingDate { get; set; }

        public DateTime? StoppedWorkingDate { get; set; }

        [StringLength(10)]
        public string WorkingHours { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
