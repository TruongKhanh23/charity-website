namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Volunteer")]
    public partial class Volunteer
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Code { get; set; }

        [StringLength(12)]
        public string IdentityCard { get; set; }

        [StringLength(250)]
        public string Name { get; set; }

        public DateTime DateOfBirth { get; set; }

        [StringLength(500)]
        public string PlaceOfBirth { get; set; }

        [StringLength(250)]
        public string Gender { get; set; }

        [StringLength(250)]
        public string Image { get; set; }

        [StringLength(11)]
        public string Phone { get; set; }

        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Nationality { get; set; }

        [StringLength(250)]
        public string Address { get; set; }

        [StringLength(50)]
        public string OtherFoodExpenses { get; set; }

        public int WorkingHour { get; set; }

        public int OffHour { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(500)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [StringLength(500)]
        public string ModifiedBy { get; set; }

        public bool Status { get; set; }
    }
}
