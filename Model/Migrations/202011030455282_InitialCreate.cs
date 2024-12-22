namespace Model.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Children",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Code = c.String(maxLength: 50, unicode: false),
                        SocialInsurance = c.String(maxLength: 250),
                        BoughtDate = c.DateTime(),
                        EndDate = c.DateTime(),
                        FullName = c.String(maxLength: 250),
                        Age = c.String(maxLength: 250),
                        DateOfBirth = c.DateTime(),
                        Gender = c.String(maxLength: 250),
                        Image = c.String(maxLength: 250),
                        BirthCertificate = c.String(maxLength: 250),
                        Hk01 = c.Boolean(),
                        Hk02 = c.Boolean(),
                        FoodExpenses = c.Decimal(precision: 11, scale: 0),
                        EducationExpenses = c.Decimal(precision: 11, scale: 0),
                        Confirmation = c.Boolean(),
                        EnrollReason = c.String(maxLength: 250),
                        CategoryID = c.Int(),
                        CounselingID = c.String(maxLength: 50, unicode: false),
                        SchoolReportID = c.String(maxLength: 50, unicode: false),
                        XFamilyBookID = c.String(maxLength: 50, unicode: false),
                        EducationID = c.String(maxLength: 250),
                        Problem = c.String(maxLength: 250),
                        Time = c.Int(),
                        Ticket = c.String(maxLength: 250),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.ChildrenCategory",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        MetaTitle = c.String(maxLength: 250, unicode: false),
                        SeoTitle = c.String(maxLength: 250),
                        MetaDescriptions = c.String(maxLength: 250),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.CostCategory",
                c => new
                    {
                        ID = c.Int(nullable: false),
                        Code = c.String(maxLength: 50, unicode: false),
                        Name = c.String(nullable: false, maxLength: 250),
                        Description = c.String(),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Cost",
                c => new
                    {
                        ID = c.String(nullable: false, maxLength: 50, unicode: false),
                        CategoryID = c.String(maxLength: 50, unicode: false),
                        UnitCost = c.Decimal(precision: 10, scale: 0),
                        Number = c.Int(),
                        TotalAmount = c.Decimal(precision: 10, scale: 0),
                        Description = c.String(),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.Boolean(),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Counseling",
                c => new
                    {
                        ID = c.Int(nullable: false),
                        Code = c.String(maxLength: 50, unicode: false),
                        Problem = c.String(maxLength: 250),
                        Time = c.Int(),
                        Ticket = c.String(maxLength: 250),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Document",
                c => new
                    {
                        ID = c.String(nullable: false, maxLength: 50, unicode: false),
                        Example = c.String(maxLength: 50),
                        Description = c.String(maxLength: 250),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Education",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Code = c.String(maxLength: 250),
                        Name = c.String(maxLength: 250),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Employee",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Code = c.String(maxLength: 50, unicode: false),
                        IdentityCard = c.String(maxLength: 11, unicode: false),
                        Name = c.String(maxLength: 250),
                        Age = c.Int(),
                        Gender = c.String(maxLength: 250),
                        Image = c.String(maxLength: 250),
                        DateOfBirth = c.DateTime(),
                        Domicile = c.String(maxLength: 50),
                        PlaceOfBirth = c.String(maxLength: 250),
                        Education = c.Int(),
                        StudiedAt = c.String(maxLength: 250),
                        Language = c.String(maxLength: 250),
                        InformationTechnology = c.String(maxLength: 250),
                        Job = c.String(maxLength: 250),
                        JobName = c.String(maxLength: 250),
                        Phone = c.String(maxLength: 250),
                        Religion = c.String(maxLength: 250),
                        StartingSalagy = c.String(maxLength: 250),
                        GiftSalary = c.Decimal(precision: 11, scale: 0),
                        AllOtherFoodExpenses = c.Decimal(precision: 11, scale: 0),
                        ContractType = c.String(maxLength: 250),
                        WorkingContract = c.Boolean(),
                        WorkingDate = c.DateTime(),
                        StoppedWorkingDate = c.DateTime(),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Menu",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Date = c.DateTime(),
                        Morning = c.String(maxLength: 250),
                        BeforeNoon = c.String(maxLength: 250),
                        Noon = c.String(maxLength: 250),
                        LateAfterNoon = c.String(maxLength: 250),
                        Evening = c.String(maxLength: 250),
                        Description = c.String(maxLength: 250),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Regulation",
                c => new
                    {
                        ID = c.String(nullable: false, maxLength: 50, unicode: false),
                        Name = c.String(maxLength: 50),
                        Description = c.String(maxLength: 50),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.SchoolReport",
                c => new
                    {
                        ChildrenID = c.String(nullable: false, maxLength: 50, unicode: false),
                        SchoolYear = c.String(maxLength: 500),
                        SchoolName = c.String(maxLength: 250),
                        TeacherName = c.String(maxLength: 500),
                        Semester1 = c.String(maxLength: 50, unicode: false),
                        Semester2 = c.String(maxLength: 50, unicode: false),
                        FullYear = c.String(maxLength: 50, unicode: false),
                        Rating = c.String(maxLength: 250),
                        TeacherEvaluation = c.String(maxLength: 250),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ChildrenID);
            
            CreateTable(
                "dbo.SECategory",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Description = c.String(),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.SuppliesEquipment",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Name = c.String(maxLength: 250),
                        Number = c.Int(),
                        BrokenNumber = c.Int(),
                        Manager = c.String(maxLength: 50),
                        UsageHistory = c.String(),
                        Description = c.String(),
                        Image = c.String(maxLength: 250),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.User",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        UserName = c.String(maxLength: 50, unicode: false),
                        Password = c.String(maxLength: 32, unicode: false),
                        Name = c.String(maxLength: 50),
                        Address = c.String(maxLength: 50),
                        Email = c.String(maxLength: 50),
                        Phone = c.String(maxLength: 50),
                        Image = c.String(maxLength: 250),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 50, unicode: false),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 50, unicode: false),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Visitor",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        IdentityCard = c.String(maxLength: 11, unicode: false),
                        VisitReason = c.String(maxLength: 250),
                        Phone = c.String(maxLength: 11, unicode: false),
                        Email = c.String(maxLength: 25, unicode: false),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.Volunteer",
                c => new
                    {
                        ID = c.Int(nullable: false, identity: true),
                        Code = c.String(maxLength: 50, unicode: false),
                        IdentityCard = c.String(maxLength: 11, unicode: false),
                        Name = c.String(maxLength: 250),
                        Age = c.String(maxLength: 500),
                        Gender = c.String(maxLength: 250),
                        Image = c.String(maxLength: 250),
                        Phone = c.String(maxLength: 11, unicode: false),
                        Email = c.String(maxLength: 50),
                        Nationality = c.String(maxLength: 50),
                        Address = c.String(maxLength: 250),
                        OtherFoodExpenses = c.String(maxLength: 50, unicode: false),
                        WorkingHour = c.DateTime(),
                        OffHour = c.DateTime(),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.Boolean(nullable: false),
                    })
                .PrimaryKey(t => t.ID);
            
            CreateTable(
                "dbo.XFamilyBook",
                c => new
                    {
                        ID = c.String(nullable: false, maxLength: 50, unicode: false),
                        ChildrenID = c.String(maxLength: 50, unicode: false),
                        BaptismalName = c.String(maxLength: 50, unicode: false),
                        CreatedDate = c.DateTime(),
                        CreatedBy = c.String(maxLength: 500),
                        ModifiedDate = c.DateTime(),
                        ModifiedBy = c.String(maxLength: 500),
                        Status = c.String(maxLength: 250),
                    })
                .PrimaryKey(t => t.ID);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.XFamilyBook");
            DropTable("dbo.Volunteer");
            DropTable("dbo.Visitor");
            DropTable("dbo.User");
            DropTable("dbo.SuppliesEquipment");
            DropTable("dbo.SECategory");
            DropTable("dbo.SchoolReport");
            DropTable("dbo.Regulation");
            DropTable("dbo.Menu");
            DropTable("dbo.Employee");
            DropTable("dbo.Education");
            DropTable("dbo.Document");
            DropTable("dbo.Counseling");
            DropTable("dbo.Cost");
            DropTable("dbo.CostCategory");
            DropTable("dbo.ChildrenCategory");
            DropTable("dbo.Children");
        }
    }
}
