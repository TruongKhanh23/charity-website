namespace Model.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MaiAmTruyenTinDbContext : DbContext
    {
        public MaiAmTruyenTinDbContext()
            : base("name=MaiAmTruyenTinDbContext")
        {
        }
        public virtual DbSet<Activity> Activities { get; set; }
        public virtual DbSet<About> Abouts { get; set; }

        public virtual DbSet<Bank> Banks { get; set; }
        public virtual DbSet<Children> Children { get; set; }
        public virtual DbSet<ChildrenCategory> ChildrenCategories { get; set; }
        public virtual DbSet<Counseling> Counselings { get; set; }
        public virtual DbSet<Currency> Currencies { get; set; }
        public virtual DbSet<DevelopmentProcess> DevelopmentProcesses { get; set; }
        public virtual DbSet<Document> Documents { get; set; }
        public virtual DbSet<Education> Educations { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Event> Events { get; set; }
        public virtual DbSet<HealthInsurance> HealthInsurances { get; set; }
        public virtual DbSet<History> Histories { get; set; }
        public virtual DbSet<Major> Majors { get; set; }
        public virtual DbSet<MedicalEquipment> MedicalEquipments { get; set; }
        public virtual DbSet<MedicalCategory> MedicalCategories { get; set; }
        public virtual DbSet<Menu> Menus { get; set; }
        public virtual DbSet<Dish> Dishes { get; set; }
        public virtual DbSet<Payment> Payments { get; set; }
        public virtual DbSet<ProfessionalQualification> ProfessionalQualifications { get; set; }
        public virtual DbSet<Quote> Quotes { get; set; }
        public virtual DbSet<Receipt> Receipts { get; set; }
        public virtual DbSet<ReceivePay> ReceivePays { get; set; }
        public virtual DbSet<ReceivePayAccount> ReceivePayAccounts { get; set; }
        public virtual DbSet<ReceivePayObject> ReceivePayObjects { get; set; }
        public virtual DbSet<ReceivePayObjectCategory> ReceivePayObjectCategories { get; set; }
        public virtual DbSet<Regulation> Regulations { get; set; }
        public virtual DbSet<SchoolReport> SchoolReports { get; set; }
        public virtual DbSet<SchoolReportDetail> SchoolReportDetails { get; set; }
        public virtual DbSet<SchoolReportType> SchoolReportTypes { get; set; }
        public virtual DbSet<SECategory> SECategories { get; set; }
        public virtual DbSet<SocialInsurance> SocialInsurances { get; set; }
        public virtual DbSet<SuppliesEquipment> SuppliesEquipments { get; set; }
        public virtual DbSet<User> Users { get; set; }

        public virtual DbSet<Role> Roles { get; set; }

        public virtual DbSet<UserGroup> UserGroups { get; set; }
        public virtual DbSet<Credential> Credentials { get; set; }
        public virtual DbSet<Visitor> Visitors { get; set; }
        public virtual DbSet<Volunteer> Volunteers { get; set; }
        public virtual DbSet<Volunteer_Event> Volunteer_Event { get; set; }
        public virtual DbSet<XFamilyBook> XFamilyBooks { get; set; }
        public virtual DbSet<YellowBook> YellowBooks { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Children>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<ChildrenCategory>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<ChildrenCategory>()
                .Property(e => e.MetaTitle)
                .IsUnicode(false);

            modelBuilder.Entity<Currency>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<DevelopmentProcess>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Document>()
                .Property(e => e.ID)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.IdentityCard)
                .IsUnicode(false);

            modelBuilder.Entity<Employee>()
                .Property(e => e.StartingSalagy)
                .HasPrecision(11, 0);

            modelBuilder.Entity<Employee>()
                .Property(e => e.GiftSalary)
                .HasPrecision(11, 0);

            modelBuilder.Entity<Employee>()
                .Property(e => e.AllOtherFoodExpenses)
                .HasPrecision(11, 0);

            modelBuilder.Entity<Event>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Event>()
                .Property(e => e.Type)
                .IsUnicode(false);

            modelBuilder.Entity<HealthInsurance>()
                .Property(e => e.No)
                .IsUnicode(false);

            modelBuilder.Entity<Payment>()
                .Property(e => e.Amount)
                .HasPrecision(11, 0);

            modelBuilder.Entity<Payment>()
                .Property(e => e.IDNo)
                .IsUnicode(false);

            modelBuilder.Entity<Payment>()
                .Property(e => e.AccountNo)
                .IsUnicode(false);

            modelBuilder.Entity<Quote>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Quote>()
                .Property(e => e.Language)
                .IsUnicode(false);

            modelBuilder.Entity<Receipt>()
                .Property(e => e.Amount)
                .HasPrecision(11, 0);

            modelBuilder.Entity<Receipt>()
                .Property(e => e.IDNo)
                .IsUnicode(false);

            modelBuilder.Entity<Receipt>()
                .Property(e => e.AccountNo)
                .IsUnicode(false);

            modelBuilder.Entity<ReceivePayAccount>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<ReceivePayAccount>()
                .Property(e => e.Original)
                .HasPrecision(11, 0);

            modelBuilder.Entity<ReceivePayObject>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<ReceivePayObject>()
                .Property(e => e.Website)
                .IsUnicode(false);

            modelBuilder.Entity<ReceivePayObjectCategory>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Regulation>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<SchoolReport>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<SchoolReportDetail>()
                .Property(e => e.Semester1)
                .IsUnicode(false);

            modelBuilder.Entity<SchoolReportDetail>()
                .Property(e => e.Semester2)
                .IsUnicode(false);

            modelBuilder.Entity<SchoolReportDetail>()
                .Property(e => e.FullYear)
                .IsUnicode(false);

            modelBuilder.Entity<SchoolReportType>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<SECategory>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<SocialInsurance>()
                .Property(e => e.No)
                .IsUnicode(false);

            modelBuilder.Entity<SuppliesEquipment>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.UserName)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Visitor>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Visitor>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Visitor>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Volunteer>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<Volunteer>()
                .Property(e => e.IdentityCard)
                .IsUnicode(false);

            modelBuilder.Entity<Volunteer>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Volunteer>()
                .Property(e => e.OtherFoodExpenses)
                .IsUnicode(false);

            modelBuilder.Entity<XFamilyBook>()
                .Property(e => e.Code)
                .IsUnicode(false);

            modelBuilder.Entity<XFamilyBook>()
                .Property(e => e.BaptismalName)
                .IsUnicode(false);
        }
    }
}
