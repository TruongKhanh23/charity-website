namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web;

    public partial class SchoolReportDetail
    {
        public int ID { get; set; }

        public int SchoolReportID { get; set; }

        [StringLength(250)]
        public string SchoolName { get; set; }

        [StringLength(500)]
        public string SchoolYear { get; set; }

        [StringLength(500)]
        public string TeacherName { get; set; }

        [StringLength(50)]
        public string Semester1 { get; set; }

        [StringLength(50)]
        public string Semester2 { get; set; }

        [StringLength(50)]
        public string FullYear { get; set; }

        public int Rating { get; set; }

        [StringLength(250)]
        public string TeacherEvaluation { get; set; }
        [StringLength(500)]
        public string Image { get; set; }
        [NotMapped]
        public HttpPostedFileBase PDFFile { get; set; }

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
