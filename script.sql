USE [master]
GO
/****** Object:  Database [MaiAmBaoTroXaHoi]    Script Date: 04/25/2021 5:32:22 PM ******/
CREATE DATABASE [MaiAmBaoTroXaHoi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MaiAmBaoTroXaHoi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MaiAmBaoTroXaHoi.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MaiAmBaoTroXaHoi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MaiAmBaoTroXaHoi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MaiAmBaoTroXaHoi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET ARITHABORT OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET RECOVERY FULL 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET  MULTI_USER 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MaiAmBaoTroXaHoi', N'ON'
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET QUERY_STORE = OFF
GO
USE [MaiAmBaoTroXaHoi]
GO
/****** Object:  User [root]    Script Date: 04/25/2021 5:32:23 PM ******/
CREATE USER [root] FOR LOGIN [root] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ReceivePayAccount]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceivePayAccount](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[CurrencyID] [int] NULL,
	[Original] [decimal](11, 0) NULL,
	[Note] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ReceivePayAccount] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReceivePayAccountID] [int] NULL,
	[Date] [datetime] NULL,
	[ReceivePayID] [int] NULL,
	[Amount] [decimal](11, 0) NULL,
	[AmountText] [nvarchar](500) NULL,
	[Code] [nvarchar](100) NULL,
	[ReceivePayObjectID] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[IDNo] [varchar](100) NULL,
	[DateOfIssue] [datetime] NULL,
	[PlaceOfIssue] [nvarchar](500) NULL,
	[AccountNo] [varchar](100) NULL,
	[AtBank] [int] NULL,
	[FinancialPaper] [nvarchar](250) NULL,
	[Note] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Receipt] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MyView]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MyView]
AS SELECT ReceivePayAccount.Name, Receipt.Amount
FROM ReceivePayAccount INNER JOIN Receipt ON ReceivePayAccount.ID = Receipt.ReceivePayAccountID
GO
/****** Object:  Table [dbo].[ReceivePayObject]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceivePayObject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[AffiliatedUnit] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nvarchar](100) NULL,
	[Fax] [nvarchar](100) NULL,
	[Website] [varchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[BankingNumber] [nvarchar](100) NULL,
	[BankID] [int] NULL,
	[HolderName] [nvarchar](100) NULL,
	[CategoryID] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ObjectRecievePay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceivePay]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceivePay](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ReceivableIsTrue] [bit] NULL,
	[Note] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ReceivePay] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[MyView1]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MyView1]
AS SELECT ReceivePayAccount.Name as 'Qũy tài khoản', Receipt.Date, ReceivePay.Name as 'Loại', Receipt.Amount, Receipt.Code, ReceivePayObject.Name as 'Họ và tên', Receipt.Address, Receipt.CreatedDate, Receipt.CreatedBy
FROM Receipt 
INNER JOIN ReceivePayAccount ON ReceivePayAccount.ID = Receipt.ReceivePayAccountID
INNER JOIN ReceivePay ON ReceivePay.ID = Receipt.ReceivePayID
INNER JOIN ReceivePayObject ON ReceivePayObject.ID = Receipt.ReceivePayObjectID
GO
/****** Object:  View [dbo].[MyView2]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MyView2]
AS SELECT ReceivePayAccount.Name as 'Qũy tài khoản', Receipt.Date, ReceivePay.Name as 'Loại', Receipt.Amount, Receipt.Code, ReceivePayObject.Name as 'Họ và tên', Receipt.Address, Receipt.CreatedDate, Receipt.CreatedBy
FROM Receipt 
INNER JOIN ReceivePayAccount ON ReceivePayAccount.ID = Receipt.ReceivePayAccountID
INNER JOIN ReceivePay ON ReceivePay.ID = Receipt.ReceivePayID
INNER JOIN ReceivePayObject ON ReceivePayObject.ID = Receipt.ReceivePayObjectID
WHERE ReceivePayAccount.ID = 1
GO
/****** Object:  View [dbo].[MyView3]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MyView3]
AS SELECT ReceivePayAccount.Name as 'Qũy tài khoản', Receipt.Date, ReceivePay.Name as 'Loại', Receipt.Amount, Receipt.Code, ReceivePayObject.Name as 'Họ và tên', Receipt.Address, Receipt.CreatedDate, Receipt.CreatedBy
FROM Receipt 
INNER JOIN ReceivePayAccount ON ReceivePayAccount.ID = Receipt.ReceivePayAccountID
INNER JOIN ReceivePay ON ReceivePay.ID = Receipt.ReceivePayID
INNER JOIN ReceivePayObject ON ReceivePayObject.ID = Receipt.ReceivePayObjectID
WHERE ReceivePayAccount.ID = 1 AND  ReceivePay.ID = 3 AND ReceivePayObject.ID = 1
GO
/****** Object:  View [dbo].[MyView4]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MyView4]
AS SELECT ReceivePayAccount.Name, Receipt.Amount
FROM ReceivePayAccount 
INNER JOIN Receipt ON ReceivePayAccount.ID = Receipt.ReceivePayAccountID
INNER JOIN ReceivePayObject ON ReceivePayObject.ID = Receipt.ReceivePayObjectID
GO
/****** Object:  View [dbo].[MyView5]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[MyView5]
AS SELECT ReceivePayAccount.Name 'Qũy tài khoản', Receipt.Amount, ReceivePayObject.Name 'Họ và tên'
FROM ReceivePayAccount 
INNER JOIN Receipt ON ReceivePayAccount.ID = Receipt.ReceivePayAccountID
INNER JOIN ReceivePayObject ON ReceivePayObject.ID = Receipt.ReceivePayObjectID
GO
/****** Object:  View [dbo].[MyView6]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MyView6]
AS SELECT ReceivePayAccount.Name 'Qũy tài khoản', Receipt.Amount, ReceivePayObject.Name 'Họ và tên', ReceivePay.Name 'Khoản chi'
FROM ReceivePayAccount 
INNER JOIN Receipt ON ReceivePayAccount.ID = Receipt.ReceivePayAccountID
INNER JOIN ReceivePayObject ON ReceivePayObject.ID = Receipt.ReceivePayObjectID
INNER JOIN ReceivePay ON ReceivePay.ID = Receipt.ReceivePayID
GO
/****** Object:  View [dbo].[MyView7]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MyView7]
AS SELECT ReceivePayAccount.Name 'Qũy tài khoản', Receipt.Amount, ReceivePayObject.Name 'Họ và tên', Receipt.ReceivePayID
FROM ReceivePayAccount 
INNER JOIN Receipt ON ReceivePayAccount.ID = Receipt.ReceivePayAccountID
INNER JOIN ReceivePayObject ON ReceivePayObject.ID = Receipt.ReceivePayObjectID
GO
/****** Object:  Table [dbo].[About]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[About](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BigTitleLine1] [nvarchar](100) NULL,
	[BigTitleLine2] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Slogan] [nvarchar](500) NULL,
	[Introduce] [nvarchar](max) NULL,
	[BankingNumber] [nvarchar](200) NULL,
	[BankBranch] [nvarchar](500) NULL,
	[AccountHolder] [nvarchar](500) NULL,
	[Email] [nvarchar](500) NULL,
 CONSTRAINT [PK_About] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[MetaTitle] [varchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](250) NULL,
	[Details] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[EnglishName] [nvarchar](250) NULL,
	[ShorcutName] [nvarchar](100) NULL,
	[Website] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[NationalName] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Children]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Children](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[IdentityCard] [varchar](11) NULL,
	[Successive] [bit] NULL,
	[FullName] [nvarchar](250) NULL,
	[FoodExpenses] [decimal](11, 0) NULL,
	[EducationExpenses] [decimal](11, 0) NULL,
	[StartLiveDate] [datetime] NULL,
	[DateOfBirth] [datetime] NULL,
	[PlaceOfBirth] [nvarchar](500) NULL,
	[Gender] [nvarchar](250) NULL,
	[Ethnic] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[BirthCertificate] [nvarchar](250) NULL,
	[HkType] [nvarchar](250) NULL,
	[HKImage] [nvarchar](250) NULL,
	[Confirmation] [bit] NULL,
	[EnrollReason] [nvarchar](250) NULL,
	[Date] [datetime] NULL,
	[CategoryID] [int] NULL,
	[ProfessionalQualificationID] [int] NULL,
	[MajorID] [int] NULL,
	[EducationID] [int] NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Children] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChildrenCategory]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChildrenCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](250) NOT NULL,
	[MetaTitle] [varchar](250) NULL,
	[SeoTitle] [nvarchar](250) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ChildrenCategory_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Counseling]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Counseling](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChildrenID] [int] NULL,
	[Problem] [nvarchar](250) NULL,
	[Time] [int] NULL,
	[Ticket] [nvarchar](250) NULL,
	[Solution] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[Psychologist] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[MetaKeyWords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Counseling] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credential]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credential](
	[UserGroupID] [varchar](20) NOT NULL,
	[RoleID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Credential_1] PRIMARY KEY CLUSTERED 
(
	[UserGroupID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[NameInternational] [nvarchar](100) NULL,
	[Symbol] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DevelopmentProcess]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DevelopmentProcess](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[ChildrenID] [int] NULL,
	[Title] [nvarchar](500) NULL,
	[MetaDescription] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](250) NULL,
	[Thumbnail] [nvarchar](250) NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_DevelopmentProcess] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dish]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dish](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Material] [nvarchar](max) NULL,
	[Nutrition] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[Type] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Dish] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Document]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[ID] [varchar](50) NOT NULL,
	[Example] [nvarchar](50) NULL,
	[Description] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [nvarchar](250) NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Education]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](250) NULL,
	[Name] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Education] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](250) NULL,
	[IdentityCard] [varchar](11) NULL,
	[Name] [nvarchar](250) NULL,
	[Gender] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Agreement] [nvarchar](500) NULL,
	[DateOfBirth] [datetime] NULL,
	[Domicile] [nvarchar](50) NULL,
	[PlaceOfBirth] [nvarchar](250) NULL,
	[ProfessionalQualificationID] [int] NULL,
	[EducationID] [int] NULL,
	[MajorID] [int] NULL,
	[StudiedAt] [nvarchar](250) NULL,
	[Language] [nvarchar](250) NULL,
	[InformationTechnology] [nvarchar](250) NULL,
	[Job] [nvarchar](250) NULL,
	[JobName] [nvarchar](250) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](250) NULL,
	[Successive] [bit] NOT NULL,
	[Religion] [nvarchar](250) NULL,
	[StartingSalagy] [decimal](11, 0) NULL,
	[GiftSalary] [decimal](11, 0) NULL,
	[AllOtherFoodExpenses] [decimal](11, 0) NULL,
	[ContractType] [nvarchar](250) NULL,
	[WorkingContract] [bit] NULL,
	[WorkingDate] [datetime] NULL,
	[StoppedWorkingDate] [datetime] NULL,
	[WorkingHours] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Employee_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[MoreInformation] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Image] [nvarchar](500) NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HealthInsurance]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HealthInsurance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChildrenID] [int] NULL,
	[No] [varchar](50) NULL,
	[RegisteredHospital] [nvarchar](250) NULL,
	[BoughtDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_HealthInsurance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalCategory]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_MedicalCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalEquipment]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalEquipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[Uses] [nvarchar](max) NULL,
	[Unit] [nvarchar](100) NULL,
	[Amount] [int] NULL,
	[ManufacturingDate] [datetime] NULL,
	[ExpiryDate] [datetime] NULL,
	[CategoryID] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_MedicalInstrument] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[MorningTapas] [int] NULL,
	[MorningFry] [int] NULL,
	[MorningSoup] [int] NULL,
	[Brunch1] [int] NULL,
	[Brunch2] [int] NULL,
	[NoonTapas] [int] NULL,
	[NoonFry] [int] NULL,
	[NoonSoup] [int] NULL,
	[Tea1] [int] NULL,
	[Tea2] [int] NULL,
	[AfternoonTapas] [int] NULL,
	[AfternoonFry] [int] NULL,
	[AfternoonSoup] [int] NULL,
	[Dinner1] [int] NULL,
	[Dinner2] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](250) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ReceivePayAccountID] [int] NULL,
	[Date] [datetime] NULL,
	[ReceivePayID] [int] NULL,
	[Amount] [decimal](11, 0) NULL,
	[AmountText] [nvarchar](500) NULL,
	[Code] [nvarchar](100) NULL,
	[ReceivePayObjectID] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[IDNo] [varchar](11) NULL,
	[DateOfIssue] [datetime] NULL,
	[PlaceOfIssue] [nvarchar](500) NULL,
	[AccountNo] [varchar](100) NULL,
	[AtBank] [int] NULL,
	[Note] [nvarchar](500) NULL,
	[FinancialPaper] [nvarchar](250) NULL,
	[Reason] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProfessionalQualification]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProfessionalQualification](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ProfessionalQualification] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quote]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quote](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[Quote1] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
	[Language] [varchar](2) NULL,
 CONSTRAINT [PK_Quote] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReceivePayObjectCategory]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReceivePayObjectCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ReceivePayObjectCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Regulation]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Regulation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](250) NULL,
	[Name] [nvarchar](50) NULL,
	[MetaDescriptions] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[MetaKeyWords] [nvarchar](250) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Regulation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolReport]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolReport](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ChildrenID] [int] NULL,
	[Code] [varchar](50) NULL,
	[Type] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SchoolReport] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolReportDetails]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolReportDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SchoolReportID] [int] NOT NULL,
	[SchoolName] [nvarchar](250) NULL,
	[SchoolYear] [nvarchar](500) NULL,
	[TeacherName] [nvarchar](500) NULL,
	[Semester1] [varchar](50) NULL,
	[Semester2] [varchar](50) NULL,
	[FullYear] [varchar](50) NULL,
	[Rating] [int] NULL,
	[TeacherEvaluation] [nvarchar](250) NULL,
	[Image] [nvarchar](500) NULL,
	[MetaDescriptions] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SchoolReport_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SchoolReportType]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolReportType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SchoolReportType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SECategory]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SECategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SocialInsurance]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SocialInsurance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[No] [varchar](50) NULL,
	[RegisteredHospital] [nvarchar](250) NULL,
	[BoughtDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SocialInsurance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SuppliesEquipment]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SuppliesEquipment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [nvarchar](250) NULL,
	[Number] [int] NULL,
	[BrokenNumber] [int] NULL,
	[Manager] [nvarchar](50) NULL,
	[UsageHistory] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_SuppliesEquipment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](32) NULL,
	[GroupID] [varchar](20) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Image] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[ID] [varchar](20) NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitor]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NULL,
	[VisitReason] [nvarchar](max) NULL,
	[Phone] [varchar](150) NULL,
	[Email] [varchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Visitor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[IdentityCard] [varchar](11) NULL,
	[Name] [nvarchar](250) NULL,
	[DateOfBirth] [datetime] NULL,
	[PlaceOfBirth] [nvarchar](500) NULL,
	[Gender] [nvarchar](250) NULL,
	[Image] [nvarchar](250) NULL,
	[Phone] [varchar](11) NULL,
	[Email] [nvarchar](50) NULL,
	[Nationality] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[OtherFoodExpenses] [varchar](50) NULL,
	[WorkingHour] [int] NULL,
	[OffHour] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Volunteer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteer_Event]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteer_Event](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VolunteerID] [int] NULL,
	[EventID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Note] [nvarchar](max) NULL,
	[Image] [nvarchar](250) NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Volunteer_Event] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XFamilyBook]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XFamilyBook](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[ChildrenID] [int] NULL,
	[BaptismalName] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_XFamilyBook] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YellowBook]    Script Date: 04/25/2021 5:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YellowBook](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[GiverName] [nvarchar](500) NULL,
	[Phone] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[ReceiverName] [nvarchar](500) NULL,
	[ProductName1] [nvarchar](500) NULL,
	[Amount1] [decimal](11, 2) NULL,
	[Unit1] [nvarchar](100) NULL,
	[Price1] [decimal](11, 0) NULL,
	[ProductName2] [nvarchar](500) NULL,
	[Unit2] [nvarchar](100) NULL,
	[Amount2] [decimal](11, 2) NULL,
	[Price2] [decimal](11, 0) NULL,
	[ProductName3] [nvarchar](500) NULL,
	[Amount3] [decimal](11, 2) NULL,
	[Unit3] [nvarchar](100) NULL,
	[Price3] [decimal](11, 0) NULL,
	[TotalMoney] [decimal](11, 0) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [nvarchar](500) NULL,
	[ModifiedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_YellowBook] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[About] ON 

INSERT [dbo].[About] ([ID], [BigTitleLine1], [BigTitleLine2], [Description], [Slogan], [Introduce], [BankingNumber], [BankBranch], [AccountHolder], [Email]) VALUES (2, N'MÁI ẤM TRUYỀN TIN', N'NGÔI NHÀ CHUNG CỦA CÁC TRẺ', N'Đây sẽ là một đoạn văn ngắn gọn trong 1 dòng. Mô tả một nội dung bất kỳ mà mái ấm muốn truyền đạt cho mọi người.', N'Mái Ấm Truyền Tin, một mái ấm cho mọi nhà.', N'Mái ấm truyền tin hay còn gọi là cơ sở bảo trợ xã hội truyền tin. Được thành lập vào năm 1995 bởi Soeur Maria Nguyễn Thị Cư với mong muốn tạo nên một mái ấm nuôi dưỡng các em mồ côi từ sơ sinh, đến nay mái ấm đã có bề dày lịch sử tận 25 năm trời. Vào năm 2016, UBND quận Bình Tân đã cấp phép hoạt động là cơ sở bảo trợ xã hội theo quyết định số 1560 ngày 24/03/2016/QĐ-UBND. Đôi nét về cơ sở bảo trợ xã hội truyền tin chúng ta sẽ có những cụm từ “Bảo vệ quyền lợi của trẻ mồ côi, bị bỏ rơi không nơi nương tựa”, “được chăm sóc sức khỏe, được học văn hóa, học nghề”, “được vui chơi giải trí, được giao lưu với cộng đồng”.', N'10299082901982', N'Mái Ấm Truyền Tin, một mái ấm cho mọi nhà.', N'Nguyễn Thị Cư (Sơ Cư)', N'khanhtn18@uef.edu.vn')
SET IDENTITY_INSERT [dbo].[About] OFF
SET IDENTITY_INSERT [dbo].[Activity] ON 

INSERT [dbo].[Activity] ([ID], [Name], [MetaTitle], [Description], [Image], [Details], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Nhà là nơi để…trở về', NULL, N'Đối với các em nhỏ có hoàn cảnh đặc biệt ở Mái ấm Truyền Tin, nhà là nơi để được sống, được yêu thương và để… trở về. Đối với các em nhỏ có hoàn cảnh đặc biệt ở Mái ấm Truyền Tin, nhà là nơi để được sống, được yêu thương và để… trở về', N'~/Data/images/Activity/rsz_coverdesk212844672.jpg', N'<p style="text-align:center"><img alt="" src="/Data/images/Activity/anh1_ajlg213347440.jpg" style="height:470px; width:660px" /></p>

<p style="text-align:center">C&aacute;c em nhỏ ở M&aacute;i ấm Truyền Tin ao ước c&oacute; một nơi để vui chơi, để học tập v&agrave; t&igrave;m hiểu nhiều hơn về thế giới b&ecirc;n ngo&agrave;i.</p>

<p>Xuất ph&aacute;t từ trung t&acirc;m th&agrave;nh phố v&agrave; mất hơn 30 ph&uacute;t di chuyển, ch&uacute;ng t&ocirc;i c&oacute; mặt tại M&aacute;i ấm Truyền Tin (đường T&acirc;n Kỳ T&acirc;n Qu&yacute;, phường B&igrave;nh Hưng, Q.B&igrave;nh T&acirc;n, TP.HCM) - nơi đang chăm s&oacute;c gần 40 em nhỏ c&oacute; ho&agrave;n cảnh đặc biệt. Thoạt nh&igrave;n, m&aacute;i ấm đơn giản chỉ l&agrave; một ng&ocirc;i nh&agrave; lớn bao gồm tầng trệt v&agrave; lầu một để sinh hoạt chung với c&aacute;c khu như bếp, ph&ograve;ng ăn, ph&ograve;ng học. Tầng tr&ecirc;n c&ugrave;ng l&agrave; kh&ocirc;ng gian ri&ecirc;ng để c&aacute;c b&eacute; nghỉ ngơi. Ở đ&acirc;y c&aacute;c em nhỏ đều được tiếp nhận&nbsp;từ những trường học b&ecirc;n ngo&agrave;i v&agrave; r&egrave;n luyện lối sống bởi c&aacute;c c&ocirc;, c&aacute;c d&igrave; tại m&aacute;i ấm.</p>

<p style="text-align:center"><img alt="" src="/Data/images/Activity/anh2_bxfl.jpg" style="height:440px; width:660px" /></p>

<p style="text-align:center">Nụ cười hồn nhi&ecirc;n của b&eacute; B&iacute;ch Ngọc tại M&aacute;i ấm Truyền tin: Ảnh Quy&ecirc;n Nghĩa Thảo</p>

<h2><strong>Một ng&agrave;y ở m&aacute;i ấm Truyền Tin</strong></h2>

<p>Chia sẻ với ch&uacute;ng t&ocirc;i, chị Chu Đ&agrave;o, quản l&yacute; m&aacute;i ấm cho biết c&aacute;i kh&oacute; nhất l&agrave; chế độ dinh dưỡng v&agrave; c&aacute;ch ph&acirc;n chia c&ocirc;ng việc nấu ăn cho c&aacute;c b&eacute;. &ldquo;Khẩu phần sẽ theo sơ đồ tam gi&aacute;c dinh dưỡng. Ng&agrave;y thường t&ocirc;i đi chợ v&agrave; c&aacute;c bạn sẽ nấu. Bạn n&agrave;o học s&aacute;ng sẽ nấu ăn buổi chiều v&agrave; ngược lại bạn n&agrave;o học chiều sẽ nấu ăn v&agrave;o buổi s&aacute;ng. Nếu đi học hết sẽ c&oacute; c&aacute;c c&ocirc; hỗ trợ nấu thay&rdquo;, chị Chu Đ&agrave;o cho hay.</p>

<p>Kh&ocirc;ng kh&iacute; tại m&aacute;i ấm trở n&ecirc;n b&igrave;nh y&ecirc;n v&agrave; ấm c&uacute;ng đến lạ. Nh&igrave;n c&aacute;c em được ăn no, mặc ấm, được chăm s&oacute;c đủ đầy mới thấy những hi sinh thầm lặng của những<a href="http://thanhnien.vn/gioi-tre/hoc-sinh-co-hoan-canh-dac-biet-lam-thung-rac-hinh-ca-thu-gom-rac-thai-nhua-1251037.html" rel="">&nbsp;</a>d&agrave;nh cho c&aacute;c em nhỏ, như một niềm an ủi cho những bất hạnh m&agrave; c&aacute;c em gặp phải.</p>

<p>Với số lượng gần 40 em, trong đ&oacute; c&oacute; cả những trẻ sơ sinh, những em c&ograve;n rất nhỏ, một m&igrave;nh chị Chu Đ&agrave;o kh&ocirc;ng thể đủ sức chăm s&oacute;c. Thế n&ecirc;n, ngo&agrave;i chị Đ&agrave;o c&ograve;n c&oacute; c&aacute;c c&ocirc;, c&aacute;c d&igrave; gi&uacute;p đỡ việc nh&agrave; v&agrave; cho những em trong độ tuổi dậy th&igrave;. B&ecirc;n cạnh đ&oacute;, c&aacute;c em c&ograve;n c&ugrave;ng nhau san sẻ v&agrave; đỡ đần cho m&aacute;i ấm trong việc chăm s&oacute;c c&aacute;c b&eacute; nhỏ hơn. C&aacute;c em tự học c&aacute;ch quan t&acirc;m v&agrave; y&ecirc;u thương lẫn nhau như một gia đ&igrave;nh thực sự.</p>

<p>&ldquo;T&ocirc;i muốn ở đ&acirc;y l&agrave; nh&agrave; - l&agrave; nơi để về của c&aacute;c bạn. Ngo&agrave;i kia, những bạn c&oacute; gia đ&igrave;nh đ&ocirc;i khi giận cha mẹ vẫn c&oacute; thể qua nh&agrave; c&ocirc; hoặc d&igrave; ở. Nhưng c&aacute;c bạn ở đ&acirc;y th&igrave; kh&ocirc;ng c&ograve;n nơi n&agrave;o để đi cả. Thế n&ecirc;n t&ocirc;i thật l&ograve;ng mong đ&acirc;y sẽ l&agrave; nh&agrave;, để d&ugrave; sau n&agrave;y bạn c&oacute; đi đ&acirc;u, l&agrave;m g&igrave;, th&igrave; vẫn y&ecirc;n t&acirc;m v&igrave; ph&iacute;a sau bạn vẫn c&oacute; một ng&ocirc;i nh&agrave; để trở về&rdquo;, chị Đ&agrave;o chia sẻ.</p>

<p style="text-align:center"><img alt="" src="/Data/images/Activity/anh3_qcej.jpg" style="height:440px; width:660px" /></p>

<p style="text-align:center">Chị Chu Đ&agrave;o - Quản l&yacute; M&aacute;i ấm Truyền Tin: Ảnh Quy&ecirc;n Nghĩa Thảo</p>

<h2><strong>Những ước mơ giản dị&hellip;</strong></h2>

<p>Tr&ograve; chuyện c&ugrave;ng c&aacute;c b&eacute;, nghe c&aacute;c em kể về nh&agrave; (m&aacute;i ấm), về sự quan t&acirc;m, chăm s&oacute;c của Sơ v&agrave; sự dạy bảo của c&aacute;c anh chị, ch&uacute;ng t&ocirc;i nhận thấy tr&ecirc;n gương mặt hồn nhi&ecirc;n của c&aacute;c em lu&ocirc;n nở những nụ cười rất v&ocirc; tư, y&ecirc;u đời. C&aacute;c em chia sẻ về ước mơ khi lớn l&ecirc;n một c&aacute;ch ng&acirc;y thơ, giản dị v&agrave; ch&acirc;n thật khiến ch&uacute;ng t&ocirc;i kh&ocirc;ng khỏi x&uacute;c động.</p>

<p>C&oacute; lẽ, sự thiếu vắng t&igrave;nh thương của bố mẹ từ nhỏ n&ecirc;n phần lớn c&aacute;c em ở đ&acirc;y rắn rỏi, suy nghĩ ch&iacute;n chắn hơn c&aacute;c bạn c&ugrave;ng trang lứa.</p>

<p>Mỗi một em nhỏ hiện diện tại đ&acirc;y đều c&oacute; một ho&agrave;n cảnh đặc biệt. C&oacute; em mồ c&ocirc;i, c&oacute; em bị bỏ rơi cho cha mẹ ly h&ocirc;n, nhiều em do gia đ&igrave;nh qu&aacute; kh&oacute; khăn phải t&igrave;m tới M&aacute;i ấm&hellip; Tuy nhi&ecirc;n, điểm chung m&agrave; c&aacute;c em c&oacute; được l&agrave; sự quan t&acirc;m nu&ocirc;i nấng, chăm s&oacute;c từ ng&ocirc;i nh&agrave; chung n&agrave;y. Điều may mắn l&agrave; c&aacute;c em c&oacute; được một đại gia đ&igrave;nh rất tuyệt vời v&agrave; người &ldquo;l&aacute;i đ&ograve;&rdquo; đưa những mảnh đời k&eacute;m may mắn ấy kh&ocirc;ng ai kh&aacute;c l&agrave; Sơ Nguyễn Thị Cư. C&oacute; lẽ đối với Sơ Cư, &ldquo;Truyền Tin&rdquo; như một th&ocirc;ng điệp m&agrave; Sơ muốn lan tỏa, gieo niềm tin v&agrave; hy vọng v&agrave;o những mảnh đời c&ocirc;i c&uacute;t, bất hạnh.</p>

<p>Khi được hỏi, nếu mai n&agrave;y lớn l&ecirc;n v&agrave; c&oacute; thể tự lập, liệu c&aacute;c em c&oacute; nhớ v&agrave; muốn quay lại nh&agrave; (m&aacute;i ấm) kh&ocirc;ng, c&aacute;c em đều đồng loạt trả lời ngay rằng &ldquo;Sau n&agrave;y ch&uacute;ng em sẽ cố gắng thật th&agrave;nh c&ocirc;ng để quay về gi&uacute;p đỡ Sơ &rdquo;.</p>

<p>Điều m&agrave; c&aacute;c em nhỏ ở đ&acirc;y lu&ocirc;n ao ước l&agrave; c&oacute; một nơi để vui chơi, để học tập v&agrave; t&igrave;m hiểu nhiều hơn về&nbsp;b&ecirc;n ngo&agrave;i. Một khu vui chơi, một căn ph&ograve;ng c&oacute; những c&aacute;i m&aacute;y t&iacute;nh hay một căn ph&ograve;ng c&oacute; thật nhiều s&aacute;ch&hellip; l&agrave; những mong ước giản dị m&agrave; c&aacute;c em muốn c&oacute; được. Mong muốn l&agrave; thế nhưng hiện tại ở nh&agrave; (m&aacute;i ấm) mới chỉ c&oacute; ph&ograve;ng ngủ, sinh hoạt cho c&aacute;c em m&agrave; chưa c&oacute; đầy đủ thiết bị để đi v&agrave;o hoạt động. Ph&ograve;ng vi t&iacute;nh th&igrave; chưa c&oacute; m&aacute;y, thư viện th&igrave; chưa c&oacute; nhiều s&aacute;ch...N&oacute;i chung c&ograve;n thiếu thốn trăm bề&hellip;</p>

<p>Đồng h&agrave;nh c&ugrave;ng ch&uacute;ng t&ocirc;i trong chuyến đi, bạn Dương Kim Kh&aacute;nh, sinh vi&ecirc;n năm 2, Khoa Quan hệ c&ocirc;ng ch&uacute;ng v&agrave; truyền th&ocirc;ng (&nbsp;Kinh tế - T&agrave;i ch&iacute;nh TP.HCM) chia sẻ: &ldquo;M&igrave;nh cảm thấy nơi đ&acirc;y như một ng&ocirc;i nh&agrave; lớn,&nbsp;&yacute; thức rất tốt v&agrave; lễ ph&eacute;p khiến m&igrave;nh y&ecirc;u mến c&aacute;c em v&ocirc; c&ugrave;ng. M&igrave;nh cảm nhận được trong &aacute;nh mắt v&ocirc; tư, hồn nhi&ecirc;n của c&aacute;c em lu&ocirc;n ao ước c&oacute; nhiều truyện tranh, s&aacute;ch vở để đọc. Nếu c&oacute; dịp trở lại m&igrave;nh nghĩ sẽ đến đ&acirc;y một lần nữa v&agrave; tặng truyện cho c&aacute;c em.&rdquo;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', CAST(N'2021-03-30T23:28:45.053' AS DateTime), NULL, CAST(N'2021-03-30T23:28:45.053' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Activity] ([ID], [Name], [MetaTitle], [Description], [Image], [Details], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'10.000 suất học bổng Vingroup và hành trình thầm lặng tiếp sức những tấm gương nghèo hiếu học', NULL, N'Đối với các em nhỏ có hoàn cảnh đặc biệt ở Mái ấm Truyền Tin, nhà là nơi để được sống, được yêu thương và để… trở về. Đối với các em nhỏ có hoàn cảnh đặc biệt ở Mái ấm Truyền Tin, nhà là nơi để được sống, được yêu thương và để… trở về', N'~/Data/images/Activity/1.jpg', N'<p><strong>Trong căn nh&agrave; tạm bằng gỗ nằm cheo leo giữa n&uacute;i rừng, c&oacute; hai đứa trẻ ng&agrave;y ng&agrave;y c&ocirc;i c&uacute;t sống với nhau trong cảnh thiếu thốn trăm bề. Kể từ ng&agrave;y bố đi t&ugrave;, mẹ cũng lẳng lặng bỏ đi, em L&ugrave; Thị Xinh (ở x&atilde; Hố M&iacute;t, huyện T&acirc;n Uy&ecirc;n, tỉnh Lai Ch&acirc;u) mới học lớp 8 trở th&agrave;nh điểm tựa duy nhất cho ch&iacute;nh bản th&acirc;n v&agrave; em g&aacute;i 5 tuổi. Đ&atilde; c&oacute; l&uacute;c, con đường học tập của em tưởng chừng phải bỏ dở giữa chừng v&igrave; c&aacute;i đ&oacute;i, c&aacute;i r&eacute;t v&agrave; c&aacute;i khổ cứ h&agrave;nh hạ hai đứa trẻ đ&aacute;ng thương.</strong></p>

<p>C&acirc;u chuyện của hai chị em Xinh chỉ l&agrave; một trong h&agrave;ng trăm ngh&igrave;n học sinh, sinh vi&ecirc;n c&oacute; ho&agrave;n cảnh đặc biệt kh&oacute; khăn tr&ecirc;n khắp mọi miền đất nước. Hơn ai hết, c&aacute;c em rất cần sự đồng h&agrave;nh, chung tay của cộng đồng x&atilde; hội để tiếp sức tr&ecirc;n con đường học tập. Xuất ph&aacute;t từ mục đ&iacute;ch nh&acirc;n văn ấy, bắt đầu từ năm 2012, Quỹ Thiện T&acirc;m triển khai chương tr&igrave;nh &ldquo;Học bổng Vingroup&rdquo; với mong muốn đ&oacute;ng g&oacute;p một phần nhỏ b&eacute; để gi&uacute;p đỡ những tấm gương ngh&egrave;o hiếu học c&oacute; cơ hội cắp s&aacute;ch đến trường. Ri&ecirc;ng trong năm học 2020 &ndash; 2021, Quỹ tiếp tục đồng h&agrave;nh v&agrave; d&agrave;nh tặng gần 10.000 suất Học bổng Vingroup, số lượng học bổng hỗ trợ nhiều nhất trong c&aacute;c năm qua. Những suất học bổng thay cho vạn lời muốn n&oacute;i, l&agrave; m&oacute;n qu&agrave;, tấm l&ograve;ng v&agrave; cũng l&agrave; lời động vi&ecirc;n, kh&iacute;ch lệ &yacute; nghĩa nhất m&agrave; Quỹ Thiện T&acirc;m muốn d&agrave;nh tặng những bạn nhỏ vẫn ng&agrave;y đ&ecirc;m cần mẫn vượt l&ecirc;n kh&oacute; khăn để viết n&ecirc;n c&acirc;u chuyện cuộc đời m&igrave;nh.</p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/L%C3%B9%20Th%E1%BB%8B%20Xinh.jpg" style="height:488px; width:650px" /></p>

<p><em>D&ugrave; cuộc sống kh&oacute; khăn nhưng em L&ugrave; Thị Xinh (Lai Ch&acirc;u) vẫn cố gắng học tập tốt. Nhiều năm liền em đạt học lực giỏi v&agrave; trở th&agrave;nh tấm gương s&aacute;ng của nh&agrave; trường</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/H%C3%B2a%20B%C3%ACnh.jpg" style="height:488px; width:650px" /></p>

<p><em>Em B&ugrave;i Lệ&nbsp;Duy&ecirc;n ở H&ograve;a B&igrave;nh vừa học vừa đi l&agrave;m th&ecirc;m để kiếm tiền phụ gi&uacute;p mẹ</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Th%C3%A1i%20Nguy%C3%AAn(1).jpg" style="height:413px; width:550px" /></p>

<p><em>Nụ cười hồn nhi&ecirc;n của c&ocirc; b&eacute; Nguyễn Thị Th&uacute;y Lộc v&agrave; em trai. Lộc l&agrave; một trong số hơn 200 ho&agrave;n cảnh kh&oacute; khăn tại Th&aacute;i Nguy&ecirc;n được nhận Học bổng Vingroup năm học n&agrave;y</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/117726516_2767113036907184_7346202484733400555_n.jpg" style="height:412px; width:550px" /></p>

<p><em>Trường hợp em Phạm Như Quỳnh ở L&agrave;o Cai l&agrave; một trong những trường hợp rất đặc biệt được nhận Học bổng Vingroup năm học 2020 &ndash; 2021. Em mắc căn bệnh rối loạn thượng b&igrave; khiến l&agrave;n da tr&ecirc;n cơ thể cứ bong tr&oacute;c từng mảng rất đau đớn. Tuy vậy, Như Quỳnh vẫn cố gắng vươn l&ecirc;n v&agrave; đạt th&agrave;nh t&iacute;ch xuất sắc trong học tập</em></p>

<p>Những ng&agrave;y đầu năm mới, đo&agrave;n trao qu&agrave; của Quỹ Thiện T&acirc;m do &ocirc;ng L&ecirc; Khắc Hiệp &ndash; Ph&oacute; Chủ tịch Tập đo&agrave;n Vingroup dẫn đầu đ&atilde; tới trao học bổng cho c&aacute;c em học sinh ngh&egrave;o vượt kh&oacute; học giỏi tại Nghệ An v&agrave; H&agrave; Tĩnh. Thời điểm trao học bổng diễn ra đ&uacute;ng v&agrave;o dịp đầu xu&acirc;n năm mới n&ecirc;n kh&ocirc;ng kh&iacute; c&agrave;ng th&ecirc;m phần trang trọng, &yacute; nghĩa. Kh&ocirc;ng chỉ ri&ecirc;ng Nghệ An v&agrave; H&agrave; Tĩnh, học sinh tr&ecirc;n khắp 62 tỉnh/th&agrave;nh phố tr&ecirc;n cả nước cũng đ&atilde; nhận được những suất học bổng tiếp sức của Quỹ Thiện T&acirc;m.</p>

<p><em>&ldquo;</em><em>Năm&nbsp;</em><em>học&nbsp;</em><em>2020</em><em>&nbsp;-2021</em><em>&nbsp;l&agrave; năm v&ocirc; c&ugrave;ng kh&oacute; khăn&nbsp;</em><em>đối với rất nhiều gia đ&igrave;nh c&aacute;c em học sinh ở H&agrave; Tĩnh v&agrave; Nghệ An cũng như c&aacute;c tỉnh miền Trung. Kh&ocirc;ng chỉ bị ảnh hưởng v&igrave; dịch bệnh Covid &ndash; 19, trận lụt lịch sử diễn ra hồi th&aacute;ng 10.2020 cũng đ&atilde; khiến rất nhiều gia đ&igrave;nh kiệt quệ. Những suất học bổng d&ugrave; nhỏ th&ocirc;i nhưng hi vọng sẽ tiếp th&ecirc;m nghị lực v&agrave; niềm tin để c&aacute;c em y&ecirc;n t&acirc;m học tập. Mong c&aacute;c em lan tỏa tinh thần hiếu học tới c&aacute;c bạn học sinh kh&aacute;c để ch&uacute;ng ta c&ugrave;ng nỗ lực vươn l&ecirc;n d&ugrave; trong bất cứ ho&agrave;n cảnh n&agrave;o&rdquo;, &ocirc;ng L&ecirc; Khắp Hiệp chia sẻ.</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Ngh%E1%BB%87%20An(1).jpg" style="height:488px; width:650px" /></p>

<p><em>&Ocirc;ng L&ecirc; Khắc Hiệp trao tận tay những suất học bổng hiếu học tới c&aacute;c em học sinh ngh&egrave;o vượt kh&oacute;, học giỏi tại Nghệ An v&agrave; H&agrave; Tĩnh</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Trao%20h%E1%BB%8Dc%20b%E1%BB%95ng%20t%E1%BA%A1i%20S%C3%B3c%20Tr%C4%83n.jpg" style="height:440px; width:660px" /></p>

<p><em>Lễ trao học bổng cho 197 học sinh, sinh vi&ecirc;n ngh&egrave;o hiếu học tại S&oacute;c Trăng</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Qu%E1%BA%A3ng%20B%C3%ACnh.jpg" style="height:487px; width:650px" /></p>

<p>&nbsp;<em>&Ocirc;ng Trần Nam Giang &ndash; Gi&aacute;m đốc Showroom VinFast Quảng B&igrave;nh đại diện&nbsp;Quỹ Thiện T&acirc;m trao học bổng cho c&aacute;c em học sinh tại địa phương</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/B%C3%ACnh%20%C4%90%E1%BB%8Bnh.jpg" style="height:366px; width:650px" /></p>

<p><em>331 tấm gương ngh&egrave;o hiếu học B&igrave;nh Định hạnh ph&uacute;c đ&oacute;n nhận những suất học bổng tiếp sức đến trường</em></p>

<p>Học bổng Vingroup l&agrave; một trong những chương tr&igrave;nh trọng t&acirc;m được Quỹ Thiện T&acirc;m duy tr&igrave; v&agrave; ph&aacute;t triển trong suốt 9 năm qua. Đến nay, chương tr&igrave;nh đ&atilde; d&agrave;nh tặng gần 34.000 suất học bổng hỗ trợ cho c&aacute;c em học sinh, sinh vi&ecirc;n ngh&egrave;o hiếu học tr&ecirc;n khắp cả nước. T&ugrave;y v&agrave;o mỗi cấp học v&agrave; ho&agrave;n cảnh gia đ&igrave;nh kh&aacute;c nhau, Quỹ sẽ hỗ trợ tiền học ph&iacute; v&agrave; sinh hoạt ph&iacute; cho c&aacute;c em theo c&aacute;c mức: 500.000 đồng/th&aacute;ng, 700.000 đồng/th&aacute;ng, suất đặc biệt l&agrave; &nbsp;1.000.000đồng/th&aacute;ng trong 9 th&aacute;ng của năm học đối với c&aacute;c em học sinh ở bậc tiểu học, trung học cơ sở v&agrave; trung học phổ th&ocirc;ng. Ri&ecirc;ng c&aacute;c em sinh vi&ecirc;n học tại c&aacute;c trường đại học, cao đẳng, trung học chuy&ecirc;n nghiệp, đ&agrave;o tạo dạy nghề sẽ được hỗ trợ tiền học ph&iacute; với mức tối đa 20 triệu đồng/năm học. Sau mỗi năm học, chương tr&igrave;nh sẽ tổ chức đ&aacute;nh gi&aacute; lại kết quả học tập v&agrave; ho&agrave;n cảnh gia đ&igrave;nh của từng em. Nếu c&aacute;c em học sinh, sinh vi&ecirc;n vẫn giữ vững th&agrave;nh t&iacute;ch học tập tốt v&agrave; ho&agrave;n cảnh gia đ&igrave;nh vẫn thuộc diện đặc biệt kh&oacute; khăn, Quỹ sẽ tiếp tục x&eacute;t gia hạn học bổng trong năm tiếp theo.</p>

<p>Với sứ mệnh &ldquo;V&igrave; một cuộc sống tốt đẹp hơn cho mọi người&rdquo;, Quỹ Thiện T&acirc;m hi vọng những suất học bổng sẽ l&agrave; nguồn động vi&ecirc;n thật &yacute; nghĩa để những t&agrave;i năng viết tiếp giấc mơ c&ograve;n dang dở. Thời gian qua, nhờ sự gi&uacute;p đỡ của Quỹ Thiện T&acirc;m, h&agrave;ng chục ngh&igrave;n học sinh, sinh vi&ecirc;n trong cả nước đ&atilde; vượt qua ho&agrave;n cảnh kh&oacute; khăn để chuy&ecirc;n t&acirc;m phấn đấu học tập tốt. Nhiều em đ&atilde; thi đỗ c&aacute;c trường đại học cao đẳng, tốt nghiệp v&agrave; ra trường c&oacute; việc l&agrave;m ổn định, từ đ&oacute; gi&uacute;p đỡ gia đ&igrave;nh tho&aacute;t ngh&egrave;o v&agrave; x&acirc;y dựng tương lai tốt đẹp hơn.</p>

<p>Thực hiện: Quỹ Thiện T&acirc;m</p>
', CAST(N'2021-03-11T20:01:02.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-11T22:37:23.203' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Activity] ([ID], [Name], [MetaTitle], [Description], [Image], [Details], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N'Sáng 5/3, bắt đầu tuyển tình nguyện viên tham gia thử nghiệm vắc xin COVIVAC', NULL, N'Sáng nay 5/3/2021, Trung tâm Dược lý lâm sàng (Trường Đại học Y Hà Nội) - đơn vị thử nghiệm lâm sàng giai đoạn 1 vắc-xin “Made in Việt Nam” thứ 2 COVIVAC sẽ tiếp nhận hồ sơ đăng ký của các tình nguyện viên.', N'~/Data/images/Activity/rsz_17122020_vaccin_covid_1212525689.jpg', N'<p><strong>Trong căn nh&agrave; tạm bằng gỗ nằm cheo leo giữa n&uacute;i rừng, c&oacute; hai đứa trẻ ng&agrave;y ng&agrave;y c&ocirc;i c&uacute;t sống với nhau trong cảnh thiếu thốn trăm bề. Kể từ ng&agrave;y bố đi t&ugrave;, mẹ cũng lẳng lặng bỏ đi, em L&ugrave; Thị Xinh (ở x&atilde; Hố M&iacute;t, huyện T&acirc;n Uy&ecirc;n, tỉnh Lai Ch&acirc;u) mới học lớp 8 trở th&agrave;nh điểm tựa duy nhất cho ch&iacute;nh bản th&acirc;n v&agrave; em g&aacute;i 5 tuổi. Đ&atilde; c&oacute; l&uacute;c, con đường học tập của em tưởng chừng phải bỏ dở giữa chừng v&igrave; c&aacute;i đ&oacute;i, c&aacute;i r&eacute;t v&agrave; c&aacute;i khổ cứ h&agrave;nh hạ hai đứa trẻ đ&aacute;ng thương.</strong></p>

<p>C&acirc;u chuyện của hai chị em Xinh chỉ l&agrave; một trong h&agrave;ng trăm ngh&igrave;n học sinh, sinh vi&ecirc;n c&oacute; ho&agrave;n cảnh đặc biệt kh&oacute; khăn tr&ecirc;n khắp mọi miền đất nước. Hơn ai hết, c&aacute;c em rất cần sự đồng h&agrave;nh, chung tay của cộng đồng x&atilde; hội để tiếp sức tr&ecirc;n con đường học tập. Xuất ph&aacute;t từ mục đ&iacute;ch nh&acirc;n văn ấy, bắt đầu từ năm 2012, Quỹ Thiện T&acirc;m triển khai chương tr&igrave;nh &ldquo;Học bổng Vingroup&rdquo; với mong muốn đ&oacute;ng g&oacute;p một phần nhỏ b&eacute; để gi&uacute;p đỡ những tấm gương ngh&egrave;o hiếu học c&oacute; cơ hội cắp s&aacute;ch đến trường. Ri&ecirc;ng trong năm học 2020 &ndash; 2021, Quỹ tiếp tục đồng h&agrave;nh v&agrave; d&agrave;nh tặng gần 10.000 suất Học bổng Vingroup, số lượng học bổng hỗ trợ nhiều nhất trong c&aacute;c năm qua. Những suất học bổng thay cho vạn lời muốn n&oacute;i, l&agrave; m&oacute;n qu&agrave;, tấm l&ograve;ng v&agrave; cũng l&agrave; lời động vi&ecirc;n, kh&iacute;ch lệ &yacute; nghĩa nhất m&agrave; Quỹ Thiện T&acirc;m muốn d&agrave;nh tặng những bạn nhỏ vẫn ng&agrave;y đ&ecirc;m cần mẫn vượt l&ecirc;n kh&oacute; khăn để viết n&ecirc;n c&acirc;u chuyện cuộc đời m&igrave;nh.</p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/L%C3%B9%20Th%E1%BB%8B%20Xinh.jpg" style="height:488px; width:650px" /></p>

<p><em>D&ugrave; cuộc sống kh&oacute; khăn nhưng em L&ugrave; Thị Xinh (Lai Ch&acirc;u) vẫn cố gắng học tập tốt. Nhiều năm liền em đạt học lực giỏi v&agrave; trở th&agrave;nh tấm gương s&aacute;ng của nh&agrave; trường</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/H%C3%B2a%20B%C3%ACnh.jpg" style="height:488px; width:650px" /></p>

<p><em>Em B&ugrave;i Lệ&nbsp;Duy&ecirc;n ở H&ograve;a B&igrave;nh vừa học vừa đi l&agrave;m th&ecirc;m để kiếm tiền phụ gi&uacute;p mẹ</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Th%C3%A1i%20Nguy%C3%AAn(1).jpg" style="height:413px; width:550px" /></p>

<p><em>Nụ cười hồn nhi&ecirc;n của c&ocirc; b&eacute; Nguyễn Thị Th&uacute;y Lộc v&agrave; em trai. Lộc l&agrave; một trong số hơn 200 ho&agrave;n cảnh kh&oacute; khăn tại Th&aacute;i Nguy&ecirc;n được nhận Học bổng Vingroup năm học n&agrave;y</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/117726516_2767113036907184_7346202484733400555_n.jpg" style="height:412px; width:550px" /></p>

<p><em>Trường hợp em Phạm Như Quỳnh ở L&agrave;o Cai l&agrave; một trong những trường hợp rất đặc biệt được nhận Học bổng Vingroup năm học 2020 &ndash; 2021. Em mắc căn bệnh rối loạn thượng b&igrave; khiến l&agrave;n da tr&ecirc;n cơ thể cứ bong tr&oacute;c từng mảng rất đau đớn. Tuy vậy, Như Quỳnh vẫn cố gắng vươn l&ecirc;n v&agrave; đạt th&agrave;nh t&iacute;ch xuất sắc trong học tập</em></p>

<p>Những ng&agrave;y đầu năm mới, đo&agrave;n trao qu&agrave; của Quỹ Thiện T&acirc;m do &ocirc;ng L&ecirc; Khắc Hiệp &ndash; Ph&oacute; Chủ tịch Tập đo&agrave;n Vingroup dẫn đầu đ&atilde; tới trao học bổng cho c&aacute;c em học sinh ngh&egrave;o vượt kh&oacute; học giỏi tại Nghệ An v&agrave; H&agrave; Tĩnh. Thời điểm trao học bổng diễn ra đ&uacute;ng v&agrave;o dịp đầu xu&acirc;n năm mới n&ecirc;n kh&ocirc;ng kh&iacute; c&agrave;ng th&ecirc;m phần trang trọng, &yacute; nghĩa. Kh&ocirc;ng chỉ ri&ecirc;ng Nghệ An v&agrave; H&agrave; Tĩnh, học sinh tr&ecirc;n khắp 62 tỉnh/th&agrave;nh phố tr&ecirc;n cả nước cũng đ&atilde; nhận được những suất học bổng tiếp sức của Quỹ Thiện T&acirc;m.</p>

<p><em>&ldquo;</em><em>Năm&nbsp;</em><em>học&nbsp;</em><em>2020</em><em>&nbsp;-2021</em><em>&nbsp;l&agrave; năm v&ocirc; c&ugrave;ng kh&oacute; khăn&nbsp;</em><em>đối với rất nhiều gia đ&igrave;nh c&aacute;c em học sinh ở H&agrave; Tĩnh v&agrave; Nghệ An cũng như c&aacute;c tỉnh miền Trung. Kh&ocirc;ng chỉ bị ảnh hưởng v&igrave; dịch bệnh Covid &ndash; 19, trận lụt lịch sử diễn ra hồi th&aacute;ng 10.2020 cũng đ&atilde; khiến rất nhiều gia đ&igrave;nh kiệt quệ. Những suất học bổng d&ugrave; nhỏ th&ocirc;i nhưng hi vọng sẽ tiếp th&ecirc;m nghị lực v&agrave; niềm tin để c&aacute;c em y&ecirc;n t&acirc;m học tập. Mong c&aacute;c em lan tỏa tinh thần hiếu học tới c&aacute;c bạn học sinh kh&aacute;c để ch&uacute;ng ta c&ugrave;ng nỗ lực vươn l&ecirc;n d&ugrave; trong bất cứ ho&agrave;n cảnh n&agrave;o&rdquo;, &ocirc;ng L&ecirc; Khắp Hiệp chia sẻ.</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Ngh%E1%BB%87%20An(1).jpg" style="height:488px; width:650px" /></p>

<p><em>&Ocirc;ng L&ecirc; Khắc Hiệp trao tận tay những suất học bổng hiếu học tới c&aacute;c em học sinh ngh&egrave;o vượt kh&oacute;, học giỏi tại Nghệ An v&agrave; H&agrave; Tĩnh</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Trao%20h%E1%BB%8Dc%20b%E1%BB%95ng%20t%E1%BA%A1i%20S%C3%B3c%20Tr%C4%83n.jpg" style="height:440px; width:660px" /></p>

<p><em>Lễ trao học bổng cho 197 học sinh, sinh vi&ecirc;n ngh&egrave;o hiếu học tại S&oacute;c Trăng</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Qu%E1%BA%A3ng%20B%C3%ACnh.jpg" style="height:487px; width:650px" /></p>

<p>&nbsp;<em>&Ocirc;ng Trần Nam Giang &ndash; Gi&aacute;m đốc Showroom VinFast Quảng B&igrave;nh đại diện&nbsp;Quỹ Thiện T&acirc;m trao học bổng cho c&aacute;c em học sinh tại địa phương</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/B%C3%ACnh%20%C4%90%E1%BB%8Bnh.jpg" style="height:366px; width:650px" /></p>

<p><em>331 tấm gương ngh&egrave;o hiếu học B&igrave;nh Định hạnh ph&uacute;c đ&oacute;n nhận những suất học bổng tiếp sức đến trường</em></p>

<p>Học bổng Vingroup l&agrave; một trong những chương tr&igrave;nh trọng t&acirc;m được Quỹ Thiện T&acirc;m duy tr&igrave; v&agrave; ph&aacute;t triển trong suốt 9 năm qua. Đến nay, chương tr&igrave;nh đ&atilde; d&agrave;nh tặng gần 34.000 suất học bổng hỗ trợ cho c&aacute;c em học sinh, sinh vi&ecirc;n ngh&egrave;o hiếu học tr&ecirc;n khắp cả nước. T&ugrave;y v&agrave;o mỗi cấp học v&agrave; ho&agrave;n cảnh gia đ&igrave;nh kh&aacute;c nhau, Quỹ sẽ hỗ trợ tiền học ph&iacute; v&agrave; sinh hoạt ph&iacute; cho c&aacute;c em theo c&aacute;c mức: 500.000 đồng/th&aacute;ng, 700.000 đồng/th&aacute;ng, suất đặc biệt l&agrave; &nbsp;1.000.000đồng/th&aacute;ng trong 9 th&aacute;ng của năm học đối với c&aacute;c em học sinh ở bậc tiểu học, trung học cơ sở v&agrave; trung học phổ th&ocirc;ng. Ri&ecirc;ng c&aacute;c em sinh vi&ecirc;n học tại c&aacute;c trường đại học, cao đẳng, trung học chuy&ecirc;n nghiệp, đ&agrave;o tạo dạy nghề sẽ được hỗ trợ tiền học ph&iacute; với mức tối đa 20 triệu đồng/năm học. Sau mỗi năm học, chương tr&igrave;nh sẽ tổ chức đ&aacute;nh gi&aacute; lại kết quả học tập v&agrave; ho&agrave;n cảnh gia đ&igrave;nh của từng em. Nếu c&aacute;c em học sinh, sinh vi&ecirc;n vẫn giữ vững th&agrave;nh t&iacute;ch học tập tốt v&agrave; ho&agrave;n cảnh gia đ&igrave;nh vẫn thuộc diện đặc biệt kh&oacute; khăn, Quỹ sẽ tiếp tục x&eacute;t gia hạn học bổng trong năm tiếp theo.</p>

<p>Với sứ mệnh &ldquo;V&igrave; một cuộc sống tốt đẹp hơn cho mọi người&rdquo;, Quỹ Thiện T&acirc;m hi vọng những suất học bổng sẽ l&agrave; nguồn động vi&ecirc;n thật &yacute; nghĩa để những t&agrave;i năng viết tiếp giấc mơ c&ograve;n dang dở. Thời gian qua, nhờ sự gi&uacute;p đỡ của Quỹ Thiện T&acirc;m, h&agrave;ng chục ngh&igrave;n học sinh, sinh vi&ecirc;n trong cả nước đ&atilde; vượt qua ho&agrave;n cảnh kh&oacute; khăn để chuy&ecirc;n t&acirc;m phấn đấu học tập tốt. Nhiều em đ&atilde; thi đỗ c&aacute;c trường đại học cao đẳng, tốt nghiệp v&agrave; ra trường c&oacute; việc l&agrave;m ổn định, từ đ&oacute; gi&uacute;p đỡ gia đ&igrave;nh tho&aacute;t ngh&egrave;o v&agrave; x&acirc;y dựng tương lai tốt đẹp hơn.</p>

<p>Thực hiện: Quỹ Thiện T&acirc;m</p>
', CAST(N'2021-03-30T23:25:25.710' AS DateTime), NULL, CAST(N'2021-03-30T23:25:25.710' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Activity] ([ID], [Name], [MetaTitle], [Description], [Image], [Details], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (18, N'Nhà là nơi để…trở về', NULL, N'Đối với các em nhỏ có hoàn cảnh đặc biệt ở Mái ấm Truyền Tin, nhà là nơi để được sống, được yêu thương và để… trở về. Đối với các em nhỏ có hoàn cảnh đặc biệt ở Mái ấm Truyền Tin, nhà là nơi để được sống, được yêu thương và để… trở về', N'~/Data/images/Activity/rsz_coverdesk210624685.jpg', N'<p><img alt="" src="/Data/images/Activity/anh1_ajlg213347440.jpg" /></p>

<p>C&aacute;c em nhỏ ở M&aacute;i ấm Truyền Tin ao ước c&oacute; một nơi để vui chơi, để học tập v&agrave; t&igrave;m hiểu nhiều hơn về thế giới b&ecirc;n ngo&agrave;i.</p>

<p>Xuất ph&aacute;t từ trung t&acirc;m th&agrave;nh phố v&agrave; mất hơn 30 ph&uacute;t di chuyển, ch&uacute;ng t&ocirc;i c&oacute; mặt tại M&aacute;i ấm Truyền Tin (đường T&acirc;n Kỳ T&acirc;n Qu&yacute;, phường B&igrave;nh Hưng, Q.B&igrave;nh T&acirc;n, TP.HCM) - nơi đang chăm s&oacute;c gần 40 em nhỏ c&oacute; ho&agrave;n cảnh đặc biệt. Thoạt nh&igrave;n, m&aacute;i ấm đơn giản chỉ l&agrave; một ng&ocirc;i nh&agrave; lớn bao gồm tầng trệt v&agrave; lầu một để sinh hoạt chung với c&aacute;c khu như bếp, ph&ograve;ng ăn, ph&ograve;ng học. Tầng tr&ecirc;n c&ugrave;ng l&agrave; kh&ocirc;ng gian ri&ecirc;ng để c&aacute;c b&eacute; nghỉ ngơi. Ở đ&acirc;y c&aacute;c em nhỏ đều được tiếp nhận&nbsp;từ những trường học b&ecirc;n ngo&agrave;i v&agrave; r&egrave;n luyện lối sống bởi c&aacute;c c&ocirc;, c&aacute;c d&igrave; tại m&aacute;i ấm.</p>

<p><img alt="" src="/Data/images/Activity/anh2_bxfl.jpg" /></p>

<p>Nụ cười hồn nhi&ecirc;n của b&eacute; B&iacute;ch Ngọc tại M&aacute;i ấm Truyền tin: Ảnh Quy&ecirc;n Nghĩa Thảo</p>

<h2><strong>Một ng&agrave;y ở m&aacute;i ấm Truyền Tin</strong></h2>

<p>Chia sẻ với ch&uacute;ng t&ocirc;i, chị Chu Đ&agrave;o, quản l&yacute; m&aacute;i ấm cho biết c&aacute;i kh&oacute; nhất l&agrave; chế độ dinh dưỡng v&agrave; c&aacute;ch ph&acirc;n chia c&ocirc;ng việc nấu ăn cho c&aacute;c b&eacute;. &ldquo;Khẩu phần sẽ theo sơ đồ tam gi&aacute;c dinh dưỡng. Ng&agrave;y thường t&ocirc;i đi chợ v&agrave; c&aacute;c bạn sẽ nấu. Bạn n&agrave;o học s&aacute;ng sẽ nấu ăn buổi chiều v&agrave; ngược lại bạn n&agrave;o học chiều sẽ nấu ăn v&agrave;o buổi s&aacute;ng. Nếu đi học hết sẽ c&oacute; c&aacute;c c&ocirc; hỗ trợ nấu thay&rdquo;, chị Chu Đ&agrave;o cho hay.</p>

<p>Kh&ocirc;ng kh&iacute; tại m&aacute;i ấm trở n&ecirc;n b&igrave;nh y&ecirc;n v&agrave; ấm c&uacute;ng đến lạ. Nh&igrave;n c&aacute;c em được ăn no, mặc ấm, được chăm s&oacute;c đủ đầy mới thấy những hi sinh thầm lặng của những<a href="http://thanhnien.vn/gioi-tre/hoc-sinh-co-hoan-canh-dac-biet-lam-thung-rac-hinh-ca-thu-gom-rac-thai-nhua-1251037.html" rel="">&nbsp;</a>d&agrave;nh cho c&aacute;c em nhỏ, như một niềm an ủi cho những bất hạnh m&agrave; c&aacute;c em gặp phải.</p>

<p>Với số lượng gần 40 em, trong đ&oacute; c&oacute; cả những trẻ sơ sinh, những em c&ograve;n rất nhỏ, một m&igrave;nh chị Chu Đ&agrave;o kh&ocirc;ng thể đủ sức chăm s&oacute;c. Thế n&ecirc;n, ngo&agrave;i chị Đ&agrave;o c&ograve;n c&oacute; c&aacute;c c&ocirc;, c&aacute;c d&igrave; gi&uacute;p đỡ việc nh&agrave; v&agrave; cho những em trong độ tuổi dậy th&igrave;. B&ecirc;n cạnh đ&oacute;, c&aacute;c em c&ograve;n c&ugrave;ng nhau san sẻ v&agrave; đỡ đần cho m&aacute;i ấm trong việc chăm s&oacute;c c&aacute;c b&eacute; nhỏ hơn. C&aacute;c em tự học c&aacute;ch quan t&acirc;m v&agrave; y&ecirc;u thương lẫn nhau như một gia đ&igrave;nh thực sự.</p>

<p>&ldquo;T&ocirc;i muốn ở đ&acirc;y l&agrave; nh&agrave; - l&agrave; nơi để về của c&aacute;c bạn. Ngo&agrave;i kia, những bạn c&oacute; gia đ&igrave;nh đ&ocirc;i khi giận cha mẹ vẫn c&oacute; thể qua nh&agrave; c&ocirc; hoặc d&igrave; ở. Nhưng c&aacute;c bạn ở đ&acirc;y th&igrave; kh&ocirc;ng c&ograve;n nơi n&agrave;o để đi cả. Thế n&ecirc;n t&ocirc;i thật l&ograve;ng mong đ&acirc;y sẽ l&agrave; nh&agrave;, để d&ugrave; sau n&agrave;y bạn c&oacute; đi đ&acirc;u, l&agrave;m g&igrave;, th&igrave; vẫn y&ecirc;n t&acirc;m v&igrave; ph&iacute;a sau bạn vẫn c&oacute; một ng&ocirc;i nh&agrave; để trở về&rdquo;, chị Đ&agrave;o chia sẻ.</p>

<p><img alt="" src="/Data/images/Activity/anh3_qcej.jpg" /></p>

<p>Chị Chu Đ&agrave;o - Quản l&yacute; M&aacute;i ấm Truyền Tin: Ảnh Quy&ecirc;n Nghĩa Thảo</p>

<h2><strong>Những ước mơ giản dị&hellip;</strong></h2>

<p>Tr&ograve; chuyện c&ugrave;ng c&aacute;c b&eacute;, nghe c&aacute;c em kể về nh&agrave; (m&aacute;i ấm), về sự quan t&acirc;m, chăm s&oacute;c của Sơ v&agrave; sự dạy bảo của c&aacute;c anh chị, ch&uacute;ng t&ocirc;i nhận thấy tr&ecirc;n gương mặt hồn nhi&ecirc;n của c&aacute;c em lu&ocirc;n nở những nụ cười rất v&ocirc; tư, y&ecirc;u đời. C&aacute;c em chia sẻ về ước mơ khi lớn l&ecirc;n một c&aacute;ch ng&acirc;y thơ, giản dị v&agrave; ch&acirc;n thật khiến ch&uacute;ng t&ocirc;i kh&ocirc;ng khỏi x&uacute;c động.</p>

<p>C&oacute; lẽ, sự thiếu vắng t&igrave;nh thương của bố mẹ từ nhỏ n&ecirc;n phần lớn c&aacute;c em ở đ&acirc;y rắn rỏi, suy nghĩ ch&iacute;n chắn hơn c&aacute;c bạn c&ugrave;ng trang lứa.</p>

<p>Mỗi một em nhỏ hiện diện tại đ&acirc;y đều c&oacute; một ho&agrave;n cảnh đặc biệt. C&oacute; em mồ c&ocirc;i, c&oacute; em bị bỏ rơi cho cha mẹ ly h&ocirc;n, nhiều em do gia đ&igrave;nh qu&aacute; kh&oacute; khăn phải t&igrave;m tới M&aacute;i ấm&hellip; Tuy nhi&ecirc;n, điểm chung m&agrave; c&aacute;c em c&oacute; được l&agrave; sự quan t&acirc;m nu&ocirc;i nấng, chăm s&oacute;c từ ng&ocirc;i nh&agrave; chung n&agrave;y. Điều may mắn l&agrave; c&aacute;c em c&oacute; được một đại gia đ&igrave;nh rất tuyệt vời v&agrave; người &ldquo;l&aacute;i đ&ograve;&rdquo; đưa những mảnh đời k&eacute;m may mắn ấy kh&ocirc;ng ai kh&aacute;c l&agrave; Sơ Nguyễn Thị Cư. C&oacute; lẽ đối với Sơ Cư, &ldquo;Truyền Tin&rdquo; như một th&ocirc;ng điệp m&agrave; Sơ muốn lan tỏa, gieo niềm tin v&agrave; hy vọng v&agrave;o những mảnh đời c&ocirc;i c&uacute;t, bất hạnh.</p>

<p>Khi được hỏi, nếu mai n&agrave;y lớn l&ecirc;n v&agrave; c&oacute; thể tự lập, liệu c&aacute;c em c&oacute; nhớ v&agrave; muốn quay lại nh&agrave; (m&aacute;i ấm) kh&ocirc;ng, c&aacute;c em đều đồng loạt trả lời ngay rằng &ldquo;Sau n&agrave;y ch&uacute;ng em sẽ cố gắng thật th&agrave;nh c&ocirc;ng để quay về gi&uacute;p đỡ Sơ &rdquo;.</p>

<p>Điều m&agrave; c&aacute;c em nhỏ ở đ&acirc;y lu&ocirc;n ao ước l&agrave; c&oacute; một nơi để vui chơi, để học tập v&agrave; t&igrave;m hiểu nhiều hơn về&nbsp;b&ecirc;n ngo&agrave;i. Một khu vui chơi, một căn ph&ograve;ng c&oacute; những c&aacute;i m&aacute;y t&iacute;nh hay một căn ph&ograve;ng c&oacute; thật nhiều s&aacute;ch&hellip; l&agrave; những mong ước giản dị m&agrave; c&aacute;c em muốn c&oacute; được. Mong muốn l&agrave; thế nhưng hiện tại ở nh&agrave; (m&aacute;i ấm) mới chỉ c&oacute; ph&ograve;ng ngủ, sinh hoạt cho c&aacute;c em m&agrave; chưa c&oacute; đầy đủ thiết bị để đi v&agrave;o hoạt động. Ph&ograve;ng vi t&iacute;nh th&igrave; chưa c&oacute; m&aacute;y, thư viện th&igrave; chưa c&oacute; nhiều s&aacute;ch...N&oacute;i chung c&ograve;n thiếu thốn trăm bề&hellip;</p>

<p>Đồng h&agrave;nh c&ugrave;ng ch&uacute;ng t&ocirc;i trong chuyến đi, bạn Dương Kim Kh&aacute;nh, sinh vi&ecirc;n năm 2, Khoa Quan hệ c&ocirc;ng ch&uacute;ng v&agrave; truyền th&ocirc;ng (&nbsp;Kinh tế - T&agrave;i ch&iacute;nh TP.HCM) chia sẻ: &ldquo;M&igrave;nh cảm thấy nơi đ&acirc;y như một ng&ocirc;i nh&agrave; lớn,&nbsp;&yacute; thức rất tốt v&agrave; lễ ph&eacute;p khiến m&igrave;nh y&ecirc;u mến c&aacute;c em v&ocirc; c&ugrave;ng. M&igrave;nh cảm nhận được trong &aacute;nh mắt v&ocirc; tư, hồn nhi&ecirc;n của c&aacute;c em lu&ocirc;n ao ước c&oacute; nhiều truyện tranh, s&aacute;ch vở để đọc. Nếu c&oacute; dịp trở lại m&igrave;nh nghĩ sẽ đến đ&acirc;y một lần nữa v&agrave; tặng truyện cho c&aacute;c em.&rdquo;</p>

<p>&nbsp;</p>
', CAST(N'2021-03-31T00:05:44.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Activity] ([ID], [Name], [MetaTitle], [Description], [Image], [Details], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (19, N'Sáng 5/3, bắt đầu tuyển tình nguyện viên tham gia thử nghiệm vắc xin COVIVAC', NULL, N'Sáng nay 5/3/2021, Trung tâm Dược lý lâm sàng (Trường Đại học Y Hà Nội) - đơn vị thử nghiệm lâm sàng giai đoạn 1 vắc-xin “Made in Việt Nam” thứ 2 COVIVAC sẽ tiếp nhận hồ sơ đăng ký của các tình nguyện viên.', N'~/Data/images/Activity/rsz_17122020_vaccin_covid_1212525689210724051.jpg', N'<p><strong>Trong căn nh&agrave; tạm bằng gỗ nằm cheo leo giữa n&uacute;i rừng, c&oacute; hai đứa trẻ ng&agrave;y ng&agrave;y c&ocirc;i c&uacute;t sống với nhau trong cảnh thiếu thốn trăm bề. Kể từ ng&agrave;y bố đi t&ugrave;, mẹ cũng lẳng lặng bỏ đi, em L&ugrave; Thị Xinh (ở x&atilde; Hố M&iacute;t, huyện T&acirc;n Uy&ecirc;n, tỉnh Lai Ch&acirc;u) mới học lớp 8 trở th&agrave;nh điểm tựa duy nhất cho ch&iacute;nh bản th&acirc;n v&agrave; em g&aacute;i 5 tuổi. Đ&atilde; c&oacute; l&uacute;c, con đường học tập của em tưởng chừng phải bỏ dở giữa chừng v&igrave; c&aacute;i đ&oacute;i, c&aacute;i r&eacute;t v&agrave; c&aacute;i khổ cứ h&agrave;nh hạ hai đứa trẻ đ&aacute;ng thương.</strong></p>

<p>C&acirc;u chuyện của hai chị em Xinh chỉ l&agrave; một trong h&agrave;ng trăm ngh&igrave;n học sinh, sinh vi&ecirc;n c&oacute; ho&agrave;n cảnh đặc biệt kh&oacute; khăn tr&ecirc;n khắp mọi miền đất nước. Hơn ai hết, c&aacute;c em rất cần sự đồng h&agrave;nh, chung tay của cộng đồng x&atilde; hội để tiếp sức tr&ecirc;n con đường học tập. Xuất ph&aacute;t từ mục đ&iacute;ch nh&acirc;n văn ấy, bắt đầu từ năm 2012, Quỹ Thiện T&acirc;m triển khai chương tr&igrave;nh &ldquo;Học bổng Vingroup&rdquo; với mong muốn đ&oacute;ng g&oacute;p một phần nhỏ b&eacute; để gi&uacute;p đỡ những tấm gương ngh&egrave;o hiếu học c&oacute; cơ hội cắp s&aacute;ch đến trường. Ri&ecirc;ng trong năm học 2020 &ndash; 2021, Quỹ tiếp tục đồng h&agrave;nh v&agrave; d&agrave;nh tặng gần 10.000 suất Học bổng Vingroup, số lượng học bổng hỗ trợ nhiều nhất trong c&aacute;c năm qua. Những suất học bổng thay cho vạn lời muốn n&oacute;i, l&agrave; m&oacute;n qu&agrave;, tấm l&ograve;ng v&agrave; cũng l&agrave; lời động vi&ecirc;n, kh&iacute;ch lệ &yacute; nghĩa nhất m&agrave; Quỹ Thiện T&acirc;m muốn d&agrave;nh tặng những bạn nhỏ vẫn ng&agrave;y đ&ecirc;m cần mẫn vượt l&ecirc;n kh&oacute; khăn để viết n&ecirc;n c&acirc;u chuyện cuộc đời m&igrave;nh.</p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/L%C3%B9%20Th%E1%BB%8B%20Xinh.jpg" /></p>

<p><em>D&ugrave; cuộc sống kh&oacute; khăn nhưng em L&ugrave; Thị Xinh (Lai Ch&acirc;u) vẫn cố gắng học tập tốt. Nhiều năm liền em đạt học lực giỏi v&agrave; trở th&agrave;nh tấm gương s&aacute;ng của nh&agrave; trường</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/H%C3%B2a%20B%C3%ACnh.jpg" /></p>

<p><em>Em B&ugrave;i Lệ&nbsp;Duy&ecirc;n ở H&ograve;a B&igrave;nh vừa học vừa đi l&agrave;m th&ecirc;m để kiếm tiền phụ gi&uacute;p mẹ</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Th%C3%A1i%20Nguy%C3%AAn(1).jpg" /></p>

<p><em>Nụ cười hồn nhi&ecirc;n của c&ocirc; b&eacute; Nguyễn Thị Th&uacute;y Lộc v&agrave; em trai. Lộc l&agrave; một trong số hơn 200 ho&agrave;n cảnh kh&oacute; khăn tại Th&aacute;i Nguy&ecirc;n được nhận Học bổng Vingroup năm học n&agrave;y</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/117726516_2767113036907184_7346202484733400555_n.jpg" /></p>

<p><em>Trường hợp em Phạm Như Quỳnh ở L&agrave;o Cai l&agrave; một trong những trường hợp rất đặc biệt được nhận Học bổng Vingroup năm học 2020 &ndash; 2021. Em mắc căn bệnh rối loạn thượng b&igrave; khiến l&agrave;n da tr&ecirc;n cơ thể cứ bong tr&oacute;c từng mảng rất đau đớn. Tuy vậy, Như Quỳnh vẫn cố gắng vươn l&ecirc;n v&agrave; đạt th&agrave;nh t&iacute;ch xuất sắc trong học tập</em></p>

<p>Những ng&agrave;y đầu năm mới, đo&agrave;n trao qu&agrave; của Quỹ Thiện T&acirc;m do &ocirc;ng L&ecirc; Khắc Hiệp &ndash; Ph&oacute; Chủ tịch Tập đo&agrave;n Vingroup dẫn đầu đ&atilde; tới trao học bổng cho c&aacute;c em học sinh ngh&egrave;o vượt kh&oacute; học giỏi tại Nghệ An v&agrave; H&agrave; Tĩnh. Thời điểm trao học bổng diễn ra đ&uacute;ng v&agrave;o dịp đầu xu&acirc;n năm mới n&ecirc;n kh&ocirc;ng kh&iacute; c&agrave;ng th&ecirc;m phần trang trọng, &yacute; nghĩa. Kh&ocirc;ng chỉ ri&ecirc;ng Nghệ An v&agrave; H&agrave; Tĩnh, học sinh tr&ecirc;n khắp 62 tỉnh/th&agrave;nh phố tr&ecirc;n cả nước cũng đ&atilde; nhận được những suất học bổng tiếp sức của Quỹ Thiện T&acirc;m.</p>

<p><em>&ldquo;</em><em>Năm&nbsp;</em><em>học&nbsp;</em><em>2020</em><em>&nbsp;-2021</em><em>&nbsp;l&agrave; năm v&ocirc; c&ugrave;ng kh&oacute; khăn&nbsp;</em><em>đối với rất nhiều gia đ&igrave;nh c&aacute;c em học sinh ở H&agrave; Tĩnh v&agrave; Nghệ An cũng như c&aacute;c tỉnh miền Trung. Kh&ocirc;ng chỉ bị ảnh hưởng v&igrave; dịch bệnh Covid &ndash; 19, trận lụt lịch sử diễn ra hồi th&aacute;ng 10.2020 cũng đ&atilde; khiến rất nhiều gia đ&igrave;nh kiệt quệ. Những suất học bổng d&ugrave; nhỏ th&ocirc;i nhưng hi vọng sẽ tiếp th&ecirc;m nghị lực v&agrave; niềm tin để c&aacute;c em y&ecirc;n t&acirc;m học tập. Mong c&aacute;c em lan tỏa tinh thần hiếu học tới c&aacute;c bạn học sinh kh&aacute;c để ch&uacute;ng ta c&ugrave;ng nỗ lực vươn l&ecirc;n d&ugrave; trong bất cứ ho&agrave;n cảnh n&agrave;o&rdquo;, &ocirc;ng L&ecirc; Khắp Hiệp chia sẻ.</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Ngh%E1%BB%87%20An(1).jpg" /></p>

<p><em>&Ocirc;ng L&ecirc; Khắc Hiệp trao tận tay những suất học bổng hiếu học tới c&aacute;c em học sinh ngh&egrave;o vượt kh&oacute;, học giỏi tại Nghệ An v&agrave; H&agrave; Tĩnh</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Trao%20h%E1%BB%8Dc%20b%E1%BB%95ng%20t%E1%BA%A1i%20S%C3%B3c%20Tr%C4%83n.jpg" /></p>

<p><em>Lễ trao học bổng cho 197 học sinh, sinh vi&ecirc;n ngh&egrave;o hiếu học tại S&oacute;c Trăng</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Qu%E1%BA%A3ng%20B%C3%ACnh.jpg" /></p>

<p>&nbsp;<em>&Ocirc;ng Trần Nam Giang &ndash; Gi&aacute;m đốc Showroom VinFast Quảng B&igrave;nh đại diện&nbsp;Quỹ Thiện T&acirc;m trao học bổng cho c&aacute;c em học sinh tại địa phương</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/B%C3%ACnh%20%C4%90%E1%BB%8Bnh.jpg" /></p>

<p><em>331 tấm gương ngh&egrave;o hiếu học B&igrave;nh Định hạnh ph&uacute;c đ&oacute;n nhận những suất học bổng tiếp sức đến trường</em></p>

<p>Học bổng Vingroup l&agrave; một trong những chương tr&igrave;nh trọng t&acirc;m được Quỹ Thiện T&acirc;m duy tr&igrave; v&agrave; ph&aacute;t triển trong suốt 9 năm qua. Đến nay, chương tr&igrave;nh đ&atilde; d&agrave;nh tặng gần 34.000 suất học bổng hỗ trợ cho c&aacute;c em học sinh, sinh vi&ecirc;n ngh&egrave;o hiếu học tr&ecirc;n khắp cả nước. T&ugrave;y v&agrave;o mỗi cấp học v&agrave; ho&agrave;n cảnh gia đ&igrave;nh kh&aacute;c nhau, Quỹ sẽ hỗ trợ tiền học ph&iacute; v&agrave; sinh hoạt ph&iacute; cho c&aacute;c em theo c&aacute;c mức: 500.000 đồng/th&aacute;ng, 700.000 đồng/th&aacute;ng, suất đặc biệt l&agrave; &nbsp;1.000.000đồng/th&aacute;ng trong 9 th&aacute;ng của năm học đối với c&aacute;c em học sinh ở bậc tiểu học, trung học cơ sở v&agrave; trung học phổ th&ocirc;ng. Ri&ecirc;ng c&aacute;c em sinh vi&ecirc;n học tại c&aacute;c trường đại học, cao đẳng, trung học chuy&ecirc;n nghiệp, đ&agrave;o tạo dạy nghề sẽ được hỗ trợ tiền học ph&iacute; với mức tối đa 20 triệu đồng/năm học. Sau mỗi năm học, chương tr&igrave;nh sẽ tổ chức đ&aacute;nh gi&aacute; lại kết quả học tập v&agrave; ho&agrave;n cảnh gia đ&igrave;nh của từng em. Nếu c&aacute;c em học sinh, sinh vi&ecirc;n vẫn giữ vững th&agrave;nh t&iacute;ch học tập tốt v&agrave; ho&agrave;n cảnh gia đ&igrave;nh vẫn thuộc diện đặc biệt kh&oacute; khăn, Quỹ sẽ tiếp tục x&eacute;t gia hạn học bổng trong năm tiếp theo.</p>

<p>Với sứ mệnh &ldquo;V&igrave; một cuộc sống tốt đẹp hơn cho mọi người&rdquo;, Quỹ Thiện T&acirc;m hi vọng những suất học bổng sẽ l&agrave; nguồn động vi&ecirc;n thật &yacute; nghĩa để những t&agrave;i năng viết tiếp giấc mơ c&ograve;n dang dở. Thời gian qua, nhờ sự gi&uacute;p đỡ của Quỹ Thiện T&acirc;m, h&agrave;ng chục ngh&igrave;n học sinh, sinh vi&ecirc;n trong cả nước đ&atilde; vượt qua ho&agrave;n cảnh kh&oacute; khăn để chuy&ecirc;n t&acirc;m phấn đấu học tập tốt. Nhiều em đ&atilde; thi đỗ c&aacute;c trường đại học cao đẳng, tốt nghiệp v&agrave; ra trường c&oacute; việc l&agrave;m ổn định, từ đ&oacute; gi&uacute;p đỡ gia đ&igrave;nh tho&aacute;t ngh&egrave;o v&agrave; x&acirc;y dựng tương lai tốt đẹp hơn.</p>

<p>Thực hiện: Quỹ Thiện T&acirc;m</p>
', CAST(N'2021-03-31T00:06:37.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Activity] ([ID], [Name], [MetaTitle], [Description], [Image], [Details], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (20, N'10.000 suất học bổng Vingroup và hành trình thầm lặng tiếp sức những tấm gương nghèo hiếu học', NULL, N'Đối với các em nhỏ có hoàn cảnh đặc biệt ở Mái ấm Truyền Tin, nhà là nơi để được sống, được yêu thương và để… trở về. Đối với các em nhỏ có hoàn cảnh đặc biệt ở Mái ấm Truyền Tin, nhà là nơi để được sống, được yêu thương và để… trở về', N'~/Data/images/Activity/1210814090.jpg', N'<p><strong>Trong căn nh&agrave; tạm bằng gỗ nằm cheo leo giữa n&uacute;i rừng, c&oacute; hai đứa trẻ ng&agrave;y ng&agrave;y c&ocirc;i c&uacute;t sống với nhau trong cảnh thiếu thốn trăm bề. Kể từ ng&agrave;y bố đi t&ugrave;, mẹ cũng lẳng lặng bỏ đi, em L&ugrave; Thị Xinh (ở x&atilde; Hố M&iacute;t, huyện T&acirc;n Uy&ecirc;n, tỉnh Lai Ch&acirc;u) mới học lớp 8 trở th&agrave;nh điểm tựa duy nhất cho ch&iacute;nh bản th&acirc;n v&agrave; em g&aacute;i 5 tuổi. Đ&atilde; c&oacute; l&uacute;c, con đường học tập của em tưởng chừng phải bỏ dở giữa chừng v&igrave; c&aacute;i đ&oacute;i, c&aacute;i r&eacute;t v&agrave; c&aacute;i khổ cứ h&agrave;nh hạ hai đứa trẻ đ&aacute;ng thương.</strong></p>

<p>C&acirc;u chuyện của hai chị em Xinh chỉ l&agrave; một trong h&agrave;ng trăm ngh&igrave;n học sinh, sinh vi&ecirc;n c&oacute; ho&agrave;n cảnh đặc biệt kh&oacute; khăn tr&ecirc;n khắp mọi miền đất nước. Hơn ai hết, c&aacute;c em rất cần sự đồng h&agrave;nh, chung tay của cộng đồng x&atilde; hội để tiếp sức tr&ecirc;n con đường học tập. Xuất ph&aacute;t từ mục đ&iacute;ch nh&acirc;n văn ấy, bắt đầu từ năm 2012, Quỹ Thiện T&acirc;m triển khai chương tr&igrave;nh &ldquo;Học bổng Vingroup&rdquo; với mong muốn đ&oacute;ng g&oacute;p một phần nhỏ b&eacute; để gi&uacute;p đỡ những tấm gương ngh&egrave;o hiếu học c&oacute; cơ hội cắp s&aacute;ch đến trường. Ri&ecirc;ng trong năm học 2020 &ndash; 2021, Quỹ tiếp tục đồng h&agrave;nh v&agrave; d&agrave;nh tặng gần 10.000 suất Học bổng Vingroup, số lượng học bổng hỗ trợ nhiều nhất trong c&aacute;c năm qua. Những suất học bổng thay cho vạn lời muốn n&oacute;i, l&agrave; m&oacute;n qu&agrave;, tấm l&ograve;ng v&agrave; cũng l&agrave; lời động vi&ecirc;n, kh&iacute;ch lệ &yacute; nghĩa nhất m&agrave; Quỹ Thiện T&acirc;m muốn d&agrave;nh tặng những bạn nhỏ vẫn ng&agrave;y đ&ecirc;m cần mẫn vượt l&ecirc;n kh&oacute; khăn để viết n&ecirc;n c&acirc;u chuyện cuộc đời m&igrave;nh.</p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/L%C3%B9%20Th%E1%BB%8B%20Xinh.jpg" /></p>

<p><em>D&ugrave; cuộc sống kh&oacute; khăn nhưng em L&ugrave; Thị Xinh (Lai Ch&acirc;u) vẫn cố gắng học tập tốt. Nhiều năm liền em đạt học lực giỏi v&agrave; trở th&agrave;nh tấm gương s&aacute;ng của nh&agrave; trường</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/H%C3%B2a%20B%C3%ACnh.jpg" /></p>

<p><em>Em B&ugrave;i Lệ&nbsp;Duy&ecirc;n ở H&ograve;a B&igrave;nh vừa học vừa đi l&agrave;m th&ecirc;m để kiếm tiền phụ gi&uacute;p mẹ</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Th%C3%A1i%20Nguy%C3%AAn(1).jpg" /></p>

<p><em>Nụ cười hồn nhi&ecirc;n của c&ocirc; b&eacute; Nguyễn Thị Th&uacute;y Lộc v&agrave; em trai. Lộc l&agrave; một trong số hơn 200 ho&agrave;n cảnh kh&oacute; khăn tại Th&aacute;i Nguy&ecirc;n được nhận Học bổng Vingroup năm học n&agrave;y</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/117726516_2767113036907184_7346202484733400555_n.jpg" /></p>

<p><em>Trường hợp em Phạm Như Quỳnh ở L&agrave;o Cai l&agrave; một trong những trường hợp rất đặc biệt được nhận Học bổng Vingroup năm học 2020 &ndash; 2021. Em mắc căn bệnh rối loạn thượng b&igrave; khiến l&agrave;n da tr&ecirc;n cơ thể cứ bong tr&oacute;c từng mảng rất đau đớn. Tuy vậy, Như Quỳnh vẫn cố gắng vươn l&ecirc;n v&agrave; đạt th&agrave;nh t&iacute;ch xuất sắc trong học tập</em></p>

<p>Những ng&agrave;y đầu năm mới, đo&agrave;n trao qu&agrave; của Quỹ Thiện T&acirc;m do &ocirc;ng L&ecirc; Khắc Hiệp &ndash; Ph&oacute; Chủ tịch Tập đo&agrave;n Vingroup dẫn đầu đ&atilde; tới trao học bổng cho c&aacute;c em học sinh ngh&egrave;o vượt kh&oacute; học giỏi tại Nghệ An v&agrave; H&agrave; Tĩnh. Thời điểm trao học bổng diễn ra đ&uacute;ng v&agrave;o dịp đầu xu&acirc;n năm mới n&ecirc;n kh&ocirc;ng kh&iacute; c&agrave;ng th&ecirc;m phần trang trọng, &yacute; nghĩa. Kh&ocirc;ng chỉ ri&ecirc;ng Nghệ An v&agrave; H&agrave; Tĩnh, học sinh tr&ecirc;n khắp 62 tỉnh/th&agrave;nh phố tr&ecirc;n cả nước cũng đ&atilde; nhận được những suất học bổng tiếp sức của Quỹ Thiện T&acirc;m.</p>

<p><em>&ldquo;</em><em>Năm&nbsp;</em><em>học&nbsp;</em><em>2020</em><em>&nbsp;-2021</em><em>&nbsp;l&agrave; năm v&ocirc; c&ugrave;ng kh&oacute; khăn&nbsp;</em><em>đối với rất nhiều gia đ&igrave;nh c&aacute;c em học sinh ở H&agrave; Tĩnh v&agrave; Nghệ An cũng như c&aacute;c tỉnh miền Trung. Kh&ocirc;ng chỉ bị ảnh hưởng v&igrave; dịch bệnh Covid &ndash; 19, trận lụt lịch sử diễn ra hồi th&aacute;ng 10.2020 cũng đ&atilde; khiến rất nhiều gia đ&igrave;nh kiệt quệ. Những suất học bổng d&ugrave; nhỏ th&ocirc;i nhưng hi vọng sẽ tiếp th&ecirc;m nghị lực v&agrave; niềm tin để c&aacute;c em y&ecirc;n t&acirc;m học tập. Mong c&aacute;c em lan tỏa tinh thần hiếu học tới c&aacute;c bạn học sinh kh&aacute;c để ch&uacute;ng ta c&ugrave;ng nỗ lực vươn l&ecirc;n d&ugrave; trong bất cứ ho&agrave;n cảnh n&agrave;o&rdquo;, &ocirc;ng L&ecirc; Khắp Hiệp chia sẻ.</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Ngh%E1%BB%87%20An(1).jpg" /></p>

<p><em>&Ocirc;ng L&ecirc; Khắc Hiệp trao tận tay những suất học bổng hiếu học tới c&aacute;c em học sinh ngh&egrave;o vượt kh&oacute;, học giỏi tại Nghệ An v&agrave; H&agrave; Tĩnh</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Trao%20h%E1%BB%8Dc%20b%E1%BB%95ng%20t%E1%BA%A1i%20S%C3%B3c%20Tr%C4%83n.jpg" /></p>

<p><em>Lễ trao học bổng cho 197 học sinh, sinh vi&ecirc;n ngh&egrave;o hiếu học tại S&oacute;c Trăng</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Qu%E1%BA%A3ng%20B%C3%ACnh.jpg" /></p>

<p>&nbsp;<em>&Ocirc;ng Trần Nam Giang &ndash; Gi&aacute;m đốc Showroom VinFast Quảng B&igrave;nh đại diện&nbsp;Quỹ Thiện T&acirc;m trao học bổng cho c&aacute;c em học sinh tại địa phương</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/B%C3%ACnh%20%C4%90%E1%BB%8Bnh.jpg" /></p>

<p><em>331 tấm gương ngh&egrave;o hiếu học B&igrave;nh Định hạnh ph&uacute;c đ&oacute;n nhận những suất học bổng tiếp sức đến trường</em></p>

<p>Học bổng Vingroup l&agrave; một trong những chương tr&igrave;nh trọng t&acirc;m được Quỹ Thiện T&acirc;m duy tr&igrave; v&agrave; ph&aacute;t triển trong suốt 9 năm qua. Đến nay, chương tr&igrave;nh đ&atilde; d&agrave;nh tặng gần 34.000 suất học bổng hỗ trợ cho c&aacute;c em học sinh, sinh vi&ecirc;n ngh&egrave;o hiếu học tr&ecirc;n khắp cả nước. T&ugrave;y v&agrave;o mỗi cấp học v&agrave; ho&agrave;n cảnh gia đ&igrave;nh kh&aacute;c nhau, Quỹ sẽ hỗ trợ tiền học ph&iacute; v&agrave; sinh hoạt ph&iacute; cho c&aacute;c em theo c&aacute;c mức: 500.000 đồng/th&aacute;ng, 700.000 đồng/th&aacute;ng, suất đặc biệt l&agrave; &nbsp;1.000.000đồng/th&aacute;ng trong 9 th&aacute;ng của năm học đối với c&aacute;c em học sinh ở bậc tiểu học, trung học cơ sở v&agrave; trung học phổ th&ocirc;ng. Ri&ecirc;ng c&aacute;c em sinh vi&ecirc;n học tại c&aacute;c trường đại học, cao đẳng, trung học chuy&ecirc;n nghiệp, đ&agrave;o tạo dạy nghề sẽ được hỗ trợ tiền học ph&iacute; với mức tối đa 20 triệu đồng/năm học. Sau mỗi năm học, chương tr&igrave;nh sẽ tổ chức đ&aacute;nh gi&aacute; lại kết quả học tập v&agrave; ho&agrave;n cảnh gia đ&igrave;nh của từng em. Nếu c&aacute;c em học sinh, sinh vi&ecirc;n vẫn giữ vững th&agrave;nh t&iacute;ch học tập tốt v&agrave; ho&agrave;n cảnh gia đ&igrave;nh vẫn thuộc diện đặc biệt kh&oacute; khăn, Quỹ sẽ tiếp tục x&eacute;t gia hạn học bổng trong năm tiếp theo.</p>

<p>Với sứ mệnh &ldquo;V&igrave; một cuộc sống tốt đẹp hơn cho mọi người&rdquo;, Quỹ Thiện T&acirc;m hi vọng những suất học bổng sẽ l&agrave; nguồn động vi&ecirc;n thật &yacute; nghĩa để những t&agrave;i năng viết tiếp giấc mơ c&ograve;n dang dở. Thời gian qua, nhờ sự gi&uacute;p đỡ của Quỹ Thiện T&acirc;m, h&agrave;ng chục ngh&igrave;n học sinh, sinh vi&ecirc;n trong cả nước đ&atilde; vượt qua ho&agrave;n cảnh kh&oacute; khăn để chuy&ecirc;n t&acirc;m phấn đấu học tập tốt. Nhiều em đ&atilde; thi đỗ c&aacute;c trường đại học cao đẳng, tốt nghiệp v&agrave; ra trường c&oacute; việc l&agrave;m ổn định, từ đ&oacute; gi&uacute;p đỡ gia đ&igrave;nh tho&aacute;t ngh&egrave;o v&agrave; x&acirc;y dựng tương lai tốt đẹp hơn.</p>

<p>Thực hiện: Quỹ Thiện T&acirc;m</p>
', CAST(N'2021-03-31T00:07:47.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Activity] ([ID], [Name], [MetaTitle], [Description], [Image], [Details], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (21, N'10.000 suất học bổng Vingroup và hành trình thầm lặng tiếp sức những tấm gương nghèo hiếu học', NULL, N'Đối với các em nhỏ có hoàn cảnh đặc biệt ở Mái ấm Truyền Tin, nhà là nơi để được sống, được yêu thương và để… trở về. Đối với các em nhỏ có hoàn cảnh đặc biệt ở Mái ấm Truyền Tin, nhà là nơi để được sống, được yêu thương và để… trở về', N'~/Data/images/Activity/rsz_17122020_vaccin_covid_1212525689210848376.jpg', N'<p><strong>Trong căn nh&agrave; tạm bằng gỗ nằm cheo leo giữa n&uacute;i rừng, c&oacute; hai đứa trẻ ng&agrave;y ng&agrave;y c&ocirc;i c&uacute;t sống với nhau trong cảnh thiếu thốn trăm bề. Kể từ ng&agrave;y bố đi t&ugrave;, mẹ cũng lẳng lặng bỏ đi, em L&ugrave; Thị Xinh (ở x&atilde; Hố M&iacute;t, huyện T&acirc;n Uy&ecirc;n, tỉnh Lai Ch&acirc;u) mới học lớp 8 trở th&agrave;nh điểm tựa duy nhất cho ch&iacute;nh bản th&acirc;n v&agrave; em g&aacute;i 5 tuổi. Đ&atilde; c&oacute; l&uacute;c, con đường học tập của em tưởng chừng phải bỏ dở giữa chừng v&igrave; c&aacute;i đ&oacute;i, c&aacute;i r&eacute;t v&agrave; c&aacute;i khổ cứ h&agrave;nh hạ hai đứa trẻ đ&aacute;ng thương.</strong></p>

<p>C&acirc;u chuyện của hai chị em Xinh chỉ l&agrave; một trong h&agrave;ng trăm ngh&igrave;n học sinh, sinh vi&ecirc;n c&oacute; ho&agrave;n cảnh đặc biệt kh&oacute; khăn tr&ecirc;n khắp mọi miền đất nước. Hơn ai hết, c&aacute;c em rất cần sự đồng h&agrave;nh, chung tay của cộng đồng x&atilde; hội để tiếp sức tr&ecirc;n con đường học tập. Xuất ph&aacute;t từ mục đ&iacute;ch nh&acirc;n văn ấy, bắt đầu từ năm 2012, Quỹ Thiện T&acirc;m triển khai chương tr&igrave;nh &ldquo;Học bổng Vingroup&rdquo; với mong muốn đ&oacute;ng g&oacute;p một phần nhỏ b&eacute; để gi&uacute;p đỡ những tấm gương ngh&egrave;o hiếu học c&oacute; cơ hội cắp s&aacute;ch đến trường. Ri&ecirc;ng trong năm học 2020 &ndash; 2021, Quỹ tiếp tục đồng h&agrave;nh v&agrave; d&agrave;nh tặng gần 10.000 suất Học bổng Vingroup, số lượng học bổng hỗ trợ nhiều nhất trong c&aacute;c năm qua. Những suất học bổng thay cho vạn lời muốn n&oacute;i, l&agrave; m&oacute;n qu&agrave;, tấm l&ograve;ng v&agrave; cũng l&agrave; lời động vi&ecirc;n, kh&iacute;ch lệ &yacute; nghĩa nhất m&agrave; Quỹ Thiện T&acirc;m muốn d&agrave;nh tặng những bạn nhỏ vẫn ng&agrave;y đ&ecirc;m cần mẫn vượt l&ecirc;n kh&oacute; khăn để viết n&ecirc;n c&acirc;u chuyện cuộc đời m&igrave;nh.</p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/L%C3%B9%20Th%E1%BB%8B%20Xinh.jpg" /></p>

<p><em>D&ugrave; cuộc sống kh&oacute; khăn nhưng em L&ugrave; Thị Xinh (Lai Ch&acirc;u) vẫn cố gắng học tập tốt. Nhiều năm liền em đạt học lực giỏi v&agrave; trở th&agrave;nh tấm gương s&aacute;ng của nh&agrave; trường</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/H%C3%B2a%20B%C3%ACnh.jpg" /></p>

<p><em>Em B&ugrave;i Lệ&nbsp;Duy&ecirc;n ở H&ograve;a B&igrave;nh vừa học vừa đi l&agrave;m th&ecirc;m để kiếm tiền phụ gi&uacute;p mẹ</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Th%C3%A1i%20Nguy%C3%AAn(1).jpg" /></p>

<p><em>Nụ cười hồn nhi&ecirc;n của c&ocirc; b&eacute; Nguyễn Thị Th&uacute;y Lộc v&agrave; em trai. Lộc l&agrave; một trong số hơn 200 ho&agrave;n cảnh kh&oacute; khăn tại Th&aacute;i Nguy&ecirc;n được nhận Học bổng Vingroup năm học n&agrave;y</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/117726516_2767113036907184_7346202484733400555_n.jpg" /></p>

<p><em>Trường hợp em Phạm Như Quỳnh ở L&agrave;o Cai l&agrave; một trong những trường hợp rất đặc biệt được nhận Học bổng Vingroup năm học 2020 &ndash; 2021. Em mắc căn bệnh rối loạn thượng b&igrave; khiến l&agrave;n da tr&ecirc;n cơ thể cứ bong tr&oacute;c từng mảng rất đau đớn. Tuy vậy, Như Quỳnh vẫn cố gắng vươn l&ecirc;n v&agrave; đạt th&agrave;nh t&iacute;ch xuất sắc trong học tập</em></p>

<p>Những ng&agrave;y đầu năm mới, đo&agrave;n trao qu&agrave; của Quỹ Thiện T&acirc;m do &ocirc;ng L&ecirc; Khắc Hiệp &ndash; Ph&oacute; Chủ tịch Tập đo&agrave;n Vingroup dẫn đầu đ&atilde; tới trao học bổng cho c&aacute;c em học sinh ngh&egrave;o vượt kh&oacute; học giỏi tại Nghệ An v&agrave; H&agrave; Tĩnh. Thời điểm trao học bổng diễn ra đ&uacute;ng v&agrave;o dịp đầu xu&acirc;n năm mới n&ecirc;n kh&ocirc;ng kh&iacute; c&agrave;ng th&ecirc;m phần trang trọng, &yacute; nghĩa. Kh&ocirc;ng chỉ ri&ecirc;ng Nghệ An v&agrave; H&agrave; Tĩnh, học sinh tr&ecirc;n khắp 62 tỉnh/th&agrave;nh phố tr&ecirc;n cả nước cũng đ&atilde; nhận được những suất học bổng tiếp sức của Quỹ Thiện T&acirc;m.</p>

<p><em>&ldquo;</em><em>Năm&nbsp;</em><em>học&nbsp;</em><em>2020</em><em>&nbsp;-2021</em><em>&nbsp;l&agrave; năm v&ocirc; c&ugrave;ng kh&oacute; khăn&nbsp;</em><em>đối với rất nhiều gia đ&igrave;nh c&aacute;c em học sinh ở H&agrave; Tĩnh v&agrave; Nghệ An cũng như c&aacute;c tỉnh miền Trung. Kh&ocirc;ng chỉ bị ảnh hưởng v&igrave; dịch bệnh Covid &ndash; 19, trận lụt lịch sử diễn ra hồi th&aacute;ng 10.2020 cũng đ&atilde; khiến rất nhiều gia đ&igrave;nh kiệt quệ. Những suất học bổng d&ugrave; nhỏ th&ocirc;i nhưng hi vọng sẽ tiếp th&ecirc;m nghị lực v&agrave; niềm tin để c&aacute;c em y&ecirc;n t&acirc;m học tập. Mong c&aacute;c em lan tỏa tinh thần hiếu học tới c&aacute;c bạn học sinh kh&aacute;c để ch&uacute;ng ta c&ugrave;ng nỗ lực vươn l&ecirc;n d&ugrave; trong bất cứ ho&agrave;n cảnh n&agrave;o&rdquo;, &ocirc;ng L&ecirc; Khắp Hiệp chia sẻ.</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Ngh%E1%BB%87%20An(1).jpg" /></p>

<p><em>&Ocirc;ng L&ecirc; Khắc Hiệp trao tận tay những suất học bổng hiếu học tới c&aacute;c em học sinh ngh&egrave;o vượt kh&oacute;, học giỏi tại Nghệ An v&agrave; H&agrave; Tĩnh</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Trao%20h%E1%BB%8Dc%20b%E1%BB%95ng%20t%E1%BA%A1i%20S%C3%B3c%20Tr%C4%83n.jpg" /></p>

<p><em>Lễ trao học bổng cho 197 học sinh, sinh vi&ecirc;n ngh&egrave;o hiếu học tại S&oacute;c Trăng</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/Qu%E1%BA%A3ng%20B%C3%ACnh.jpg" /></p>

<p>&nbsp;<em>&Ocirc;ng Trần Nam Giang &ndash; Gi&aacute;m đốc Showroom VinFast Quảng B&igrave;nh đại diện&nbsp;Quỹ Thiện T&acirc;m trao học bổng cho c&aacute;c em học sinh tại địa phương</em></p>

<p><img alt="" src="http://quythientam.com/data/media/2427/images/B%C3%ACnh%20%C4%90%E1%BB%8Bnh.jpg" /></p>

<p><em>331 tấm gương ngh&egrave;o hiếu học B&igrave;nh Định hạnh ph&uacute;c đ&oacute;n nhận những suất học bổng tiếp sức đến trường</em></p>

<p>Học bổng Vingroup l&agrave; một trong những chương tr&igrave;nh trọng t&acirc;m được Quỹ Thiện T&acirc;m duy tr&igrave; v&agrave; ph&aacute;t triển trong suốt 9 năm qua. Đến nay, chương tr&igrave;nh đ&atilde; d&agrave;nh tặng gần 34.000 suất học bổng hỗ trợ cho c&aacute;c em học sinh, sinh vi&ecirc;n ngh&egrave;o hiếu học tr&ecirc;n khắp cả nước. T&ugrave;y v&agrave;o mỗi cấp học v&agrave; ho&agrave;n cảnh gia đ&igrave;nh kh&aacute;c nhau, Quỹ sẽ hỗ trợ tiền học ph&iacute; v&agrave; sinh hoạt ph&iacute; cho c&aacute;c em theo c&aacute;c mức: 500.000 đồng/th&aacute;ng, 700.000 đồng/th&aacute;ng, suất đặc biệt l&agrave; &nbsp;1.000.000đồng/th&aacute;ng trong 9 th&aacute;ng của năm học đối với c&aacute;c em học sinh ở bậc tiểu học, trung học cơ sở v&agrave; trung học phổ th&ocirc;ng. Ri&ecirc;ng c&aacute;c em sinh vi&ecirc;n học tại c&aacute;c trường đại học, cao đẳng, trung học chuy&ecirc;n nghiệp, đ&agrave;o tạo dạy nghề sẽ được hỗ trợ tiền học ph&iacute; với mức tối đa 20 triệu đồng/năm học. Sau mỗi năm học, chương tr&igrave;nh sẽ tổ chức đ&aacute;nh gi&aacute; lại kết quả học tập v&agrave; ho&agrave;n cảnh gia đ&igrave;nh của từng em. Nếu c&aacute;c em học sinh, sinh vi&ecirc;n vẫn giữ vững th&agrave;nh t&iacute;ch học tập tốt v&agrave; ho&agrave;n cảnh gia đ&igrave;nh vẫn thuộc diện đặc biệt kh&oacute; khăn, Quỹ sẽ tiếp tục x&eacute;t gia hạn học bổng trong năm tiếp theo.</p>

<p>Với sứ mệnh &ldquo;V&igrave; một cuộc sống tốt đẹp hơn cho mọi người&rdquo;, Quỹ Thiện T&acirc;m hi vọng những suất học bổng sẽ l&agrave; nguồn động vi&ecirc;n thật &yacute; nghĩa để những t&agrave;i năng viết tiếp giấc mơ c&ograve;n dang dở. Thời gian qua, nhờ sự gi&uacute;p đỡ của Quỹ Thiện T&acirc;m, h&agrave;ng chục ngh&igrave;n học sinh, sinh vi&ecirc;n trong cả nước đ&atilde; vượt qua ho&agrave;n cảnh kh&oacute; khăn để chuy&ecirc;n t&acirc;m phấn đấu học tập tốt. Nhiều em đ&atilde; thi đỗ c&aacute;c trường đại học cao đẳng, tốt nghiệp v&agrave; ra trường c&oacute; việc l&agrave;m ổn định, từ đ&oacute; gi&uacute;p đỡ gia đ&igrave;nh tho&aacute;t ngh&egrave;o v&agrave; x&acirc;y dựng tương lai tốt đẹp hơn.</p>

<p>Thực hiện: Quỹ Thiện T&acirc;m</p>
', CAST(N'2021-03-31T00:08:33.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Activity] ([ID], [Name], [MetaTitle], [Description], [Image], [Details], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (22, N'Bài viết cuối kỳ', NULL, N'Đây là bài viết chạy thử minh chứng cho chức năng CKEditor', N'~/Data/images/Activity/rsz_ogimage-ck4-1ea514a336211951243.png', N'<h2>Mở đầu</h2>

<p>B&agrave;i trước m&igrave;nh đ&atilde; viết về việc. H&ocirc;m nay m&igrave;nh xin giới thiệu với c&aacute;c bạn c&aacute;ch ch&egrave;n ảnh đ&atilde; upload v&agrave;o CKeditor.</p>

<h2>CKeditor l&agrave; g&igrave;?</h2>

<p>CKEditor (c&ograve;n gọi l&agrave; FCKeditor) l&agrave; một tr&igrave;nh soạn thảo m&atilde; nguồn mở theo kiểu WYSIWYG (tay l&agrave;m - mắt thấy) của CKSource. Chương tr&igrave;nh n&agrave;y c&oacute; thể t&iacute;ch hợp v&agrave;o c&aacute;c web site m&agrave; kh&ocirc;ng cần c&agrave;i đặt. Phi&ecirc;n bản đầu ti&ecirc;n được ph&aacute;t h&agrave;nh năm 2003 v&agrave; đến nay được rất nhiều người sử dụng.</p>

<p><em>Nguồn: wikipedia</em></p>

<p><br />
Nền tảng của Ckeditor l&agrave; javascript v&agrave; l&agrave; m&atilde; nguồn mở n&ecirc;n bạn c&oacute; thể chỉnh sửa bất k&igrave; những g&igrave; theo &yacute; của bạn.</p>

<p>CKEditor tương th&iacute;ch được với hầu hết c&aacute;c tr&igrave;nh duyệt Internet.</p>

<h2>Dowload</h2>

<p>Bạn c&oacute; thể tải CKeditor tại.&nbsp;Sau khi tải xong bạn giải n&eacute;n v&agrave;o thư mục chứa web site của m&igrave;nh.</p>

<p>Bạn cũng c&oacute; thể c&agrave;i CKeditor với Package Managers:</p>

<ul>
	<li>npm:&nbsp;<code>npm install ckeditor --save</code></li>
	<li>bower:&nbsp;<code>bower install ckeditor --save</code></li>
</ul>

<h2>Sử dụng CKeditor</h2>

<h3>Thay thế texarea</h3>

<p>C&oacute; 2 c&aacute;ch để thay thế phần tử textarea bằng CKeditor: sử dụng javascript hoặc sử dụng class</p>

<ol>
	<li>Sử dụng javascript: Việc sử dụng javascript để thay thế phần tử textarea th&agrave;nh CKeditor cực k&igrave; đơn giản. Ta chỉ cần sử d&ugrave;ng h&agrave;m&nbsp;<code>CKEditor.replace(id)</code>&nbsp;để thay thế. id ch&iacute;nh l&agrave; id của thẻ textarea cần thay thế.</li>
</ol>

<p>V&iacute; dụ:<code> </code></p>

<p><strong>Lưu &yacute;:</strong>&nbsp;Thẻ script include file ckeditor.js phải được đặt tr&ecirc;n thẻ chạy lệnh&nbsp;<code>CKEditor.replace(&#39;editor&#39;)</code>&nbsp;nh&eacute;. Kh&ocirc;ng th&igrave; sẽ kh&ocirc;ng c&oacute; kết quả như mong muốn đ&acirc;u.</p>

<p><br />
Qu&aacute; đơn giản phải kh&ocirc;ng n&agrave;o. B&acirc;y giờ chuyển sang c&aacute;ch thay thế thứ 2.</p>

<ol start="2">
	<li>Sử dụng class: C&aacute;ch n&agrave;y c&ograve;n đơn giản hơn cả c&aacute;ch tr&ecirc;n nữa. Ta chỉ cần th&ecirc;m class ckeditor v&agrave;o trong thẻ textarea l&agrave; c&oacute; thể thay thế được CKEditor v&agrave;o rồi.<code> </code></li>
</ol>

<p>Lưu &yacute;:</p>

<ul>
	<li>Thẻ textarea phải c&oacute; t&ecirc;n th&igrave; mới thay thế được nh&eacute;. Nếu thẻ kh&ocirc;ng t&ecirc;n th&igrave; CKEditor kh&ocirc;ng hiểu v&agrave; thay thế cho m&igrave;nh đ&acirc;u.</li>
	<li>Đoạn ch&egrave;n script&nbsp;<code>ckeditor.js</code>&nbsp;phải được đặt tr&ecirc;n tất cả thẻ&nbsp;<code>textarea</code>. M&igrave;nh hay l&agrave;m c&aacute;ch n&agrave;y v&agrave; thẻ&nbsp;<code>script</code>&nbsp;ch&egrave;n file ckeditor.js m&igrave;nh sẽ đặt v&agrave;o trong thẻ&nbsp;<code>head</code>.</li>
</ul>

<p>Sau khi thay thế xong. Bạn truy cập v&agrave;o trang vừa tạo m&agrave; hiện như thế n&agrave;y l&agrave; đ&atilde; th&agrave;nh c&ocirc;ng rồi đấy.</p>

<p><img alt="editor.PNG" src="https://viblo.asia/uploads/06dc5e05-bf70-4626-9781-4088782881f8.png" /></p>

<h3>T&ugrave;y chọn c&aacute;c plugin cho CKEditor</h3>

<p>CKEditor mặc định c&oacute; rất nhiều c&ocirc;ng cụ. Để th&ecirc;m hoặc loại bỏ những c&ocirc;ng cụ n&agrave;y th&igrave; ta phải cấu h&igrave;nh ở file config.js. File đấy c&oacute; vị tr&iacute; c&ugrave;ng thư mục với file&nbsp;<code>ckeditor.js</code>. Ngo&agrave;i ra c&ograve;n c&oacute; thể định file cấu h&igrave;nh bằng lệnh&nbsp;<code>CKEDITOR.config.customConfig = &#39;file cấu h&igrave;nh của m&igrave;nh&#39;;</code></p>

<p>Thế l&agrave; xong việc c&agrave;i đặt v&agrave; cấu h&igrave;nh CKEditor b&acirc;y giờ t&iacute;ch hợp c&aacute;i upload file của ch&uacute;ng ta v&agrave;o n&agrave;o.</p>

<h2>T&iacute;ch hợp upload file v&agrave;o CKEditor</h2>

<p>B&agrave;i trước m&igrave;nh đ&atilde; giới thiệu việc tạo một trang upload file l&ecirc;n flickr bạn c&oacute; thể đọc lại tại&nbsp;<a href="https://viblo.asia/p/ckeditor-va-upload-anh-MdZkAQwAkox" target="_blank">đ&acirc;y</a>&nbsp;B&acirc;y giờ ta viết lại th&ecirc;m 1 t&yacute; để c&oacute; thể upload được file từ CKEditor.</p>

<h3>Tạo view</h3>

<p>Việc đầu ti&ecirc;n cần l&agrave;m l&agrave; tạo 1 file view c&oacute; c&agrave;i CKEditor v&agrave;o đ&oacute;. Để sử dụng được chức năng upload image trong CK th&igrave; ta cần th&ecirc;m một d&ograve;ng script cấu h&igrave;nh url:</p>

<pre>
<code>CKEDITOR.config.filebrowserImageUploadUrl = &#39;{!! route(&#39;uploadPhoto&#39;).&#39;?_token=&#39;.csrf_token() !!}&#39;;
</code></pre>

<p>Ch&uacute;ng ta sẽ truyền v&agrave;o route upload file (đ&acirc;y l&agrave; route sẽ nhận file v&agrave; sử l&yacute; khi ấn n&uacute;t submit) v&agrave; cần th&ecirc;m 1 thuộc t&iacute;nh _token bằng csrf_token() để kh&ocirc;ng bị lỗi thiếu token.</p>

<p>To&agrave;n bộ code sẽ như sau:</p>

<pre>

&nbsp;</pre>

<p>Test CKeditor</p>

<p>Kết quả khi ấn v&agrave;o n&uacute;t th&ecirc;m h&igrave;nh ảnh m&agrave; c&oacute; tab tải l&ecirc;n th&igrave; bạn đ&atilde; bước đầu th&agrave;nh c&ocirc;ng rồi đấy.</p>

<p style="text-align:center"><img alt="tailen.PNG" src="https://viblo.asia/uploads/703db8d9-ce3e-4f50-871f-9b1b9166490b.png" /></p>

<h3>Tạo controller</h3>

<p>M&igrave;nh sử dụng controller upload của&nbsp;<a href="https://viblo.asia/Hoanghoi/posts/MVpeKylQvKd" target="_blank">b&agrave;i trước</a>. Trước hết m&igrave;nh phải biết CKEditor sẽ gửi request g&igrave; th&igrave; mới c&oacute; thể xử l&yacute; được. Sau khi bấm n&uacute;t submit CKEditor sẽ gửi 1 request với phương thức POST (tất nhi&ecirc;n rồi) với kh&aacute; nhiều biến. M&igrave;nh chỉ cần quan t&acirc;m đến 2 biến ch&iacute;nh n&agrave;y th&ocirc;i:</p>

<ul>
	<li><code>upload</code>: đ&acirc;y ch&iacute;nh l&agrave; file m&igrave;nh upload l&ecirc;n</li>
	<li><code>CKEditorFuncNum</code>: Đ&acirc;y l&agrave; m&atilde; h&agrave;m sẽ chạy khi nhận được kết quả trả về.</li>
</ul>

<p>M&igrave;nh sẽ sử dụng biến&nbsp;<code>upload</code>&nbsp;để upload ảnh l&ecirc;n flickr. Sau khi upload l&ecirc;n flickr xong m&igrave;nh kh&ocirc;ng return mảng như l&uacute;c trước nữa m&agrave; m&igrave;nh sẽ return 1 view với c&aacute;c tham số như sau:</p>

<pre>
<code>return view(&#39;uploadCKEditor&#39;, [
    &#39;CKEditorFuncNum&#39; =&gt; $request-&gt;CKEditorFuncNum,
    &#39;data&#39; =&gt; [
        &#39;url&#39; =&gt; $url,
        &#39;message&#39; =&gt; $message,
    ],
]);
</code></pre>

<p>Nội dung view:</p>

<pre>

&nbsp;</pre>

<p>Trong view n&agrave;y m&igrave;nh sẽ chạy một h&agrave;m của CKEditor&nbsp;<code>window.opener.CKEDITOR.tools.callFunction(funcNum, fileUrl [, data]);</code>&nbsp;C&aacute;c tham số cần truyền v&agrave;o:</p>

<ul>
	<li>m&atilde; h&agrave;m l&agrave; $CKEditorFuncNum đ&atilde; truyền v&agrave;o từ request.</li>
	<li>fileUrl l&agrave; url trả về</li>
	<li>data c&oacute; thể c&oacute; hoặc kh&ocirc;ng. N&oacute; c&oacute; thể l&agrave; h&agrave;m hoặc chuỗi. Nếu n&oacute; l&agrave; chuỗi k&iacute; tự th&igrave; n&oacute; sẽ hiện l&ecirc;n m&agrave;n h&igrave;nh giống như ta gọi h&agrave;m&nbsp;<code>alert()</code>&nbsp;của javascript.</li>
</ul>

<p>Mọi việc đ&atilde; xong. Giờ ch&uacute;ng ta upload thử 1 file để xem th&agrave;nh quả th&ocirc;i.&nbsp;<img alt="😃" src="https://twemoji.maxcdn.com/2/72x72/1f603.png" /></p>

<p style="text-align:center"><img alt="done.PNG" src="https://viblo.asia/uploads/89838bdc-173f-4352-9a37-34a11c28dadd.png" /></p>

<p>Như vậy l&agrave; m&igrave;nh đ&atilde; giới thiệu c&aacute;ch upload ảnh trong CKEditor. Hi vọng b&agrave;i viết n&agrave;y c&oacute; &iacute;ch cho c&aacute;c bạn.</p>
', CAST(N'2021-04-25T14:22:40.860' AS DateTime), NULL, CAST(N'2021-04-25T14:22:40.860' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[Activity] OFF
SET IDENTITY_INSERT [dbo].[Bank] ON 

INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Ngân hàng Chính sách xã hội', N'Vietnam Bank for Social Policies', N'NHCSXH/VBSP', N'vbsp.org.vn', NULL, N'Việt Nam', CAST(N'2021-02-25T08:31:20.157' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.157' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Ngân hàng Phát triển Việt Nam', N'Vietnam Development Bank', N'VDB', N'vdb.gov.vn Lưu trữ 2018-02-03 tại Wayback Machine', NULL, N'Việt Nam', CAST(N'2021-02-25T08:31:20.270' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.270' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Ngân hàng Xây dựng', N'Construction Bank', N'CB', N'cbbank.vn', N'41A Lý Thái Tổ, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:20.323' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.323' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Ngân hàng Đại Dương', N'Ocean Bank', N'Oceanbank', N'oceanbank.vn', N'Tòa nhà Daeha, 360 Kim Mã, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:20.373' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.373' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Ngân hàng Dầu Khí Toàn Cầu', N'Global Petro Bank', N'GPBank', N'gpbank.com.vn', N'Tòa nhà Capital Tower, 109 Trần Hưng Đạo, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:20.430' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.430' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Ngân hàng Nông nghiệp và Phát triển Nông thôn VN', N'Vietnam Bank for Agriculture and Rural Development', N'Agribank', N'agribank.com.vn', N'2 Láng Hạ, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:20.487' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.487' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'Ngân hàng Á Châu', N'Asia Commercial Joint Stock Bank', N'ACB', N'acb.com.vn', N'442 Nguyễn Thị Minh Khai, Q.3, TP HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:20.540' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.540' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'Kiên Long', N'Kien Long Commercial Joint Stock Bank', N'KLB', N'kienlongbank.com', N'98-108A Cách Mạng Tháng 8, Q.3, Tp.HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:20.590' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.590' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'Ngân hàng thương mại cổ phần Phát triển Nhà Thành phố Hồ Chí Minh', N'Ho Chi Minh City Development Bank', N' HDB', N'hdbank.com.vn', N'25Bis Nguyễn Thị Minh Khai, Quận 1, TP. HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:20.643' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.643' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N'Quốc tế', N'Vietnam International and Commercial Joint Stock Bank', N'VIB', N'vib.com.vn', N'111A Pasteur, Quận 1, Tp.  HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:20.693' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.693' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'Việt Nam Thương Tín', N'Vietnam Thuong Tin Commercial Joint Stock Bank', N'VBB', N'vietbank.com.vn', N'62A Cách Mạng Tháng Tám, Quận 3, TP.HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:20.747' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.747' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N'Xuất Nhập khẩu Việt Nam', N'Vietnam Export Import Commercial Joint Stock Bank', N'EIB', N'eximbank.com.vn', N'72 Lê Thánh Tôn, Q.1, TP.HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:20.800' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.800' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N'Sài Gòn Thương Tín', N'Sai Gon Thuong Tin Commercial Joint Stock Bank', N'STB', N'sacombank.com.vn Lưu trữ 2009-09-09 tại Wayback Machine', N'266 - 268 Nam Kỳ Khởi Nghĩa, Quận 3, TP. HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:20.853' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.853' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'Ngân hàng Bản Việt', N'Viet Capital Bank', N'BVB', N'vietcapitalbank.com.vn', N'412 Nguyễn Thị Minh Khai, Quận 3, TP.HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:20.907' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.907' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'Ngân hàng thương mại cổ phần Đông Á', N'DongA Bank', N'Đông Á Bank', N'dongabank.com.vn', N'130 Phan Đăng Lưu, Q. Phú Nhuận, Tp. HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:20.957' AS DateTime), NULL, CAST(N'2021-02-25T08:31:20.957' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (16, N'Ngân hàng thương mại cổ phần Nam Á', N'Nam A Bank', N'NAB', N'namabank.com.vn', N'201 - 203 Cách Mạng Tháng Tám, Quận 3, Tp. HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:21.010' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.010' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (17, N'Phương Đông', N'Orient Commercial Joint Stock Bank', N'OCB', N'ocb.com.vn', N'41 & 45 Lê Duẩn, Quận 1, Tp. HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:21.063' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.063' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (18, N'Ngân hàng TMCP Sài Gòn', N'Sai Gon Commercial Bank', N'SCB', N'scb.com.vn', N'19-21-23-25 Nguyễn Huệ, Phường Bến Nghé, Quận 1, Tp. HCM', N'Việt Nam', CAST(N'2021-02-25T08:31:21.117' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.117' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (19, N'Sài Gòn Công Thương', N'Saigon Bank for Industry and Trade', N'SGB', N'saigonbank.com.vn', N'2C Phó Đức Chính, Quận 1, TPHCM', N'Việt Nam', CAST(N'2021-02-25T08:31:21.167' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.167' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (20, N'Ngân hàng Tiên Phong', N'Tien Phong Bank', N'TPB', N'tpb.vn', N'57 Lý Thường Kiệt, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.220' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.220' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (21, N'Ngân hàng Bắc Á', N'Bac A Bank', N'BAB', N'baca-bank.vn', N'Tòa nhà số 9 Đào Duy Anh, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.270' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.270' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (22, N'Kỹ Thương Việt Nam', N'VietNam Technological and Commercial Joint Stock Bank', N' TCB', N'techcombank.com.vn', N'Tháp B Vincom Bà Triệu, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.323' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.323' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (23, N'Quốc Dân', N'National Citizen Bank', N'NCB', N'ncb-bank.vn', N'28C-28D Bà Triệu, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.380' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.380' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (24, N'Việt Nam Thịnh Vượng', N'Vietnam Prosperity Bank', N'VPB', N'vpbank.com.vn', N'VPbank Tower, 89 Láng Hạ, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.430' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.430' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (25, N'Sài Gòn-Hà Nội', N'Saigon - Hanoi Commercial Joint Stock Bank', N'SHB', N'shb.com.vn', N'77 Trần Hưng Đạo, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.483' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.483' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (26, N'Bưu điện Liên Việt', N'Lien Viet Postal Commercial Joint Stock Bank', N'LPB', N'lienvietpostbank.com.vn', N'Thai Holdings Tower, 210 Trần Quang Khải, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.537' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.537' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (27, N'Quân đội', N'Military Commercial Joint Stock Bank', N'MB', N'mbbank.com.vn', N'MB Grand Tower, 63 Lê Văn Lương, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.587' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.587' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (28, N'Ngoại thương Việt Nam', N'JSC Bank for Foreign Trade of Vietnam', N'VCB', N'vietcombank.com.vn', N'Vietcombank Tower, 198 Trần Quang Khải, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.637' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.637' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (29, N'Công Thương Việt Nam', N'Vietnam Joint Stock Commercial Bank for Industry and Trade', N'VietinBank, CTG', N'vietinbank.vn', N'108 Trần Hưng Đạo, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.690' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.690' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (30, N'Đầu tư và Phát triển Việt Nam', N'JSC Bank for Investment and Development of Vietnam', N'BIDV, BID', N'bidv.com.vn', N'BIDV Tower, 194 Trần Quang Khải, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.740' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.740' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (31, N'Ngân hàng Đông Nam Á', N'South East Asia Bank', N'SeABank, SSB', N'seabank.com.vn', N'BRG Tower, 198 Trần Quang Khải, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.793' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.793' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (32, N'Ngân hàng An Bình', N'An Binh Bank', N'ABBANK, ABB', N'abbank.vn', N'Tòa nhà Geleximco, 36 Hoàng Cầu, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.847' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.847' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (33, N'Hàng Hải Việt Nam', N'Vietnam Maritime Joint - Stock Commercial Bank', N'MSB', N'msb.com.vn', N'TNR Tower, 54A Nguyễn Chí Thanh, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.900' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.900' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (34, N'Việt Á', N'Viet A Bank', N'VietABank', N'vietabank.com.vn', N'34A - 34B Hàn Thuyên, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:21.950' AS DateTime), NULL, CAST(N'2021-02-25T08:31:21.950' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (35, N'Đại chúng Việt Nam', N'Vietnam Public Joint Stock Commercial Bank', N'PVcombank', N'pvcombank.com.vn', N'22 Ngô Quyền, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:22.000' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.000' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (36, N'Bảo Việt', N'Bao Viet Bank', N'BaoVietBank', N'baovietbank.vn', N'16 Phan Chu Trinh, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:22.053' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.053' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (37, N'Xăng dầu Petrolimex', N'Petrolimex Commercial Joint Stock Bank', N'PG Bank, PGB', N'pgbank.com.vn', N'229 Tây Sơn, Hà Nội', N'Việt Nam', CAST(N'2021-02-25T08:31:22.103' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.103' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (38, N'Ngân hàng TNHH MTV Shinhan Việt Nam', N'Shinhan Bank', NULL, N'http://www.shinhan.com.vn/', N'138-142 Hai Bà Trưng, Quận 1, TP. HCM', N'Hàn Quốc', CAST(N'2021-02-25T08:31:22.157' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.157' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (39, N'Ngân hàng Public Bank Việt Nam', N'Public Bank', NULL, N'http://www.publicbank.com.vn/', N'2 Ngô Quyền, Quận Hoàn Kiếm, Hà Nội', N'Malaysia', CAST(N'2021-02-25T08:31:22.203' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.203' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (40, N'Ngân hàng TNHH một thành viên HSBC (Việt Nam)', N'HSBC', NULL, N'http://www.hsbc.com.vn', N'235 Đồng Khởi, quận 1, TP. HCM', N'Anh', CAST(N'2021-02-25T08:31:22.257' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.257' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (41, N'Ngân hàng Woori Bank tại Việt Nam', N'Woori Bank', NULL, N'https://svc.wooribank.com/svc/Dream?withyou=ml&LCL=VI', N'Tòa nhà Keangnam, Phạm Hùng, Hà Nội', N'Hàn Quốc', CAST(N'2021-02-25T08:31:22.307' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.307' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (42, N'Ngân hàng Standard Chartered', N'Standard Chartered', NULL, N'http://www.standardchartered.com/vn/vn/', N'Tòa nhà Keangnam, Phạm Hùng, Hà Nội', N'Anh', CAST(N'2021-02-25T08:31:22.357' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.357' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (43, N'Ngân hàng Hong Leong Việt Nam', N'Hong Leong Bank', NULL, N'http://www.hlb.com.my/vn/', N'72-74 Nguyễn Thị Minh Khai, quận 3, TP. HCM', N'Malaysia', CAST(N'2021-02-25T08:31:22.407' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.407' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (44, N'Ngân hàng CIMB Việt Nam', N'CIMB Bank', NULL, N'https://www.cimbbank.com.vn', N'Tòa nhà Corner Stone, 16 Phan Chu Trinh, Hà Nội', N'Malaysia', CAST(N'2021-02-25T08:31:22.457' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.457' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (45, N'Ngân hàng UOB tại Việt Nam', N'UOB', NULL, N'https://www.uob.com.vn', N'17 Lê Duẩn, Quận 1, Tp HCM', N'Singapore', CAST(N'2021-02-25T08:31:22.507' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.507' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (46, N'Ngân hàng TNHH một thành viên ANZ (Việt Nam)', N'ANZ', NULL, N'http://www.anz.com/vietnam/vn/', N'Gelex Tower, 52 Lê Đại Hành, Hà Nội', N'Australia', CAST(N'2021-02-25T08:31:22.560' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.560' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (47, N'Ngân hàng Citibank, Chi nhánh Việt Nam', N'Citibank', NULL, N'http://www.citibank.com.vn/', NULL, N'Mỹ', CAST(N'2021-02-25T08:31:22.610' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.610' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (48, N'Ngân hàng Deutsche Bank Việt Nam', N'Deutsche Bank AG, Vietnam', NULL, N'http://www.db.com/vietnam/', NULL, N'Đức', CAST(N'2021-02-25T08:31:22.660' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.660' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (49, N'Ngân hàng Đầu tư và Phát triển Campuchia', N'BIDC', NULL, N'http://www.bidc.vn/', NULL, N'Campuchia', CAST(N'2021-02-25T08:31:22.710' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.710' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (50, N'Ngân hàng Mizuho', N'Mizuhobank', NULL, N'https://www.mizuhobank.com/', NULL, N'Nhật Bản', CAST(N'2021-02-25T08:31:22.760' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.760' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (51, N'Ngân hàng MUFG Bank', NULL, NULL, N'http://www.bk.mufg.jp', NULL, N'Nhật Bản', CAST(N'2021-02-25T08:31:22.813' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.813' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (52, N'Ngân hàng Sumitomo Mitsui Banking Corporation', NULL, NULL, N'http://www.smbc.co.jp/global/asia/', NULL, N'Nhật Bản', CAST(N'2021-02-25T08:31:22.863' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.863' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (53, N'Ngân hàng Commonwealth Bank tại Việt Nam', NULL, NULL, N'http://www.commbank.com.vn/', NULL, N'Australia', CAST(N'2021-02-25T08:31:22.923' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.923' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (54, N'Ngân hàng Bank of China tại Việt Nam', NULL, NULL, N'http://www.bankofchina.com/vn', NULL, N'Trung Quốc', CAST(N'2021-02-25T08:31:22.983' AS DateTime), NULL, CAST(N'2021-02-25T08:31:22.983' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (55, N'Ngân hàng Maybank tại Việt Nam', NULL, NULL, N'http://www.maybank.com/maybank-worldwide/vietnam', NULL, N'Malaysia', CAST(N'2021-02-25T08:31:23.040' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.040' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (56, N'Ngân hàng ICBC tại Việt Nam', NULL, NULL, N'http://hanoi.icbc.com.cn/icbc', NULL, N'Trung Quốc', CAST(N'2021-02-25T08:31:23.107' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.107' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (57, N'Ngân hàng Scotiabank tại Việt Nam', NULL, NULL, N'http://www.scotiabank.com/global/en', NULL, N'Canada', CAST(N'2021-02-25T08:31:23.170' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.170' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (58, N'Ngân hàng Commercial Siam bank tại Việt Nam', NULL, NULL, N'http://www.scb.co.th/en', NULL, N'Thái Lan', CAST(N'2021-02-25T08:31:23.230' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.230' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (59, N'Ngân hàng BNP Paribas tại Việt Nam', NULL, NULL, N'http://vietnam.bnpparibas.com', NULL, N'Pháp', CAST(N'2021-02-25T08:31:23.287' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.287' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (60, N'Ngân hàng Bankok bank tại Việt Nam', NULL, NULL, N'http://www.bangkokbank.com/BANGKOKBANK Lưu trữ 2014-06-27 tại Wayback Machine', NULL, N'Thái Lan', CAST(N'2021-02-25T08:31:23.337' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.337' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (61, N'Ngân hàng WB tại Việt Nam', NULL, NULL, N'http://www.worldbank.org/vi/country/vietnam', NULL, NULL, CAST(N'2021-02-25T08:31:23.387' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.387' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (62, N'Ngân hàng RHB (Malaysia) tại Việt Nam', NULL, NULL, N'https://logon.rhb.com.my/', NULL, N'Malaysia', CAST(N'2021-02-25T08:31:23.437' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.437' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (63, N'Ngân hàng Intesa Sanpaolo (Italia) tại Việt Nam', NULL, NULL, N'https://www.intesasanpaolobank.ro/', NULL, N'Ý', CAST(N'2021-02-25T08:31:23.490' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.490' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (64, N'Ngân hàng JP Morgan Chase Bank (Mỹ) tại Việt Nam', NULL, NULL, N'https://www.jpmorganchase.com/', NULL, N'Mỹ', CAST(N'2021-02-25T08:31:23.537' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.537' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (65, N'Ngân hàng Wells Fargo (Mỹ) tại Việt Nam', NULL, NULL, NULL, NULL, N'Mỹ', CAST(N'2021-02-25T08:31:23.590' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.590' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (66, N'Ngân hàng BHF - Bank Aktiengesellschaft (Đức) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đức', CAST(N'2021-02-25T08:31:23.640' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.640' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (67, N'Ngân hàng Unicredit Bank AG (Đức) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đức', CAST(N'2021-02-25T08:31:23.690' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.690' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (68, N'Ngân hàng Landesbank Baden-Wuerttemberg (Đức) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đức', CAST(N'2021-02-25T08:31:23.737' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.737' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (69, N'Ngân hàng Commerzbank AG (Đức) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đức', CAST(N'2021-02-25T08:31:23.787' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.787' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (70, N'Ngân hàng Bank Sinopac (Đài Loan) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đài Loan', CAST(N'2021-02-25T08:31:23.833' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.833' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (71, N'Ngân hàng Chinatrust Commercial Bank (Đài Loan) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đài Loan', CAST(N'2021-02-25T08:31:23.887' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.887' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (72, N'Ngân hàng Union Bank of Taiwan (Đài Loan) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đài Loan', CAST(N'2021-02-25T08:31:23.933' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.933' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (73, N'Ngân hàng Hua Nan Commercial Bank, Ltd (Đài Loan) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đài Loan', CAST(N'2021-02-25T08:31:23.983' AS DateTime), NULL, CAST(N'2021-02-25T08:31:23.983' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (74, N'Ngân hàng Cathay United Bank (Đài Loan) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đài Loan', CAST(N'2021-02-25T08:31:24.037' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.037' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (75, N'Ngân hàng Taishin International Bank (Đài Loan) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đài Loan', CAST(N'2021-02-25T08:31:24.083' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.083' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (76, N'Ngân hàng Land Bank of Taiwan (Đài Loan) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đài Loan', CAST(N'2021-02-25T08:31:24.133' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.133' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (77, N'Ngân hàng The Shanghai Commercial and Savings Bank, Ltd (Đài Loan) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đài Loan', CAST(N'2021-02-25T08:31:24.187' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.187' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (78, N'Ngân hàng Taiwan Shin Kong Commercial Bank (Đài Loan) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đài Loan', CAST(N'2021-02-25T08:31:24.237' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.237' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (79, N'Ngân hàng E.Sun Commercial Bank (Đài Loan) tại Việt Nam', NULL, NULL, NULL, NULL, N'Đài Loan', CAST(N'2021-02-25T08:31:24.290' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.290' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (80, N'Ngân hàng Natixis Banque BFCE (Pháp) tại Việt Nam', NULL, NULL, NULL, NULL, N'Pháp', CAST(N'2021-02-25T08:31:24.340' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.340' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (81, N'Ngân hàng Société Générale Bank - tại TP. HCM (Pháp) tại Việt Nam', NULL, NULL, NULL, NULL, N'Pháp', CAST(N'2021-02-25T08:31:24.390' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.390' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (82, N'Ngân hàng Fortis Bank (Bỉ) tại Việt Nam', NULL, NULL, NULL, NULL, N'Bỉ', CAST(N'2021-02-25T08:31:24.440' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.440' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (83, N'Ngân hàng RBI (Áo) tại Việt Nam', NULL, NULL, NULL, NULL, N'Áo', CAST(N'2021-02-25T08:31:24.490' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.490' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (84, N'Ngân hàng Phongsavanh (Lào) tại Việt Nam', NULL, NULL, NULL, NULL, N'Lào', CAST(N'2021-02-25T08:31:24.547' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.547' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (85, N'Ngân hàng Acom Co., Ltd (Nhật) tại Việt Nam', NULL, NULL, NULL, NULL, N'Nhật Bản', CAST(N'2021-02-25T08:31:24.597' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.597' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (86, N'Ngân hàng Mitsubishi UFJ Lease & Finance Company Limited (Nhật) tại Việt Nam', NULL, NULL, NULL, NULL, N'Nhật Bản', CAST(N'2021-02-25T08:31:24.643' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.643' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (87, N'Ngân hàng Industrial Bank of Korea (Hàn Quốc) tại Việt Nam', NULL, NULL, N'http://vie.ibk.co.kr/lang/vi/index.jsp', NULL, N'Hàn Quốc', CAST(N'2021-02-25T08:31:24.693' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.693' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (88, N'Ngân hàng KEB Hana (Hàn Quốc) tại Việt Nam', NULL, NULL, N'http://kebhana.com/', NULL, N'Hàn Quốc', CAST(N'2021-02-25T08:31:24.740' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.740' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (89, N'Ngân hàng Kookmin Bank (Hàn Quốc) tại Việt Nam', NULL, NULL, NULL, NULL, N'Hàn Quốc', CAST(N'2021-02-25T08:31:24.787' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.787' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (90, N'Ngân hàng Bank of India (Ấn Độ) tại Việt Nam', NULL, NULL, NULL, NULL, N'Ấn Độ', CAST(N'2021-02-25T08:31:24.833' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.833' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (91, N'Ngân hàng Indian Oversea Bank (Ấn Độ) tại Việt Nam', NULL, NULL, NULL, NULL, N'Ấn Độ', CAST(N'2021-02-25T08:31:24.883' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.883' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (92, N'Ngân hàng Rothschild Limited (Singapore) tại Việt Nam', NULL, NULL, NULL, NULL, N'Singapore', CAST(N'2021-02-25T08:31:24.930' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.930' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (93, N'Ngân hàng The Export-Import Bank of Korea (Hàn Quốc) tại Việt Nam', NULL, NULL, NULL, NULL, N'Hàn Quốc', CAST(N'2021-02-25T08:31:24.980' AS DateTime), NULL, CAST(N'2021-02-25T08:31:24.980' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (94, N'Ngân hàng Busan - (Hàn Quốc) tại Việt Nam', NULL, NULL, NULL, NULL, N'Hàn Quốc', CAST(N'2021-02-25T08:31:25.030' AS DateTime), NULL, CAST(N'2021-02-25T08:31:25.030' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (95, N'Ngân hàng Ogaki Kyorítu (Nhật Bản) tại Việt Nam', NULL, NULL, NULL, NULL, N'Nhật Bản', CAST(N'2021-02-25T08:31:25.080' AS DateTime), NULL, CAST(N'2021-02-25T08:31:25.080' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (96, N'Ngân hàng Phát triển Hàn Quốc (Hàn Quốc) tại Việt Nam', NULL, NULL, NULL, NULL, N'Hàn Quốc', CAST(N'2021-02-25T08:31:25.127' AS DateTime), NULL, CAST(N'2021-02-25T08:31:25.127' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (97, N'Ngân hàng Phát triển châu Á (ADB) tại Việt Nam', NULL, NULL, NULL, NULL, NULL, CAST(N'2021-02-25T08:31:25.170' AS DateTime), NULL, CAST(N'2021-02-25T08:31:25.170' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (98, N'Ngân hàng Oversea-Chinese Banking Corp (OCBC) tại Việt Nam', NULL, NULL, NULL, NULL, N'Singapore', CAST(N'2021-02-25T08:31:25.223' AS DateTime), NULL, CAST(N'2021-02-25T08:31:25.223' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (99, N'BPCE', NULL, NULL, N'https://bpce-vietnam.com/', NULL, N'Pháp', CAST(N'2021-02-25T08:31:25.270' AS DateTime), NULL, CAST(N'2021-02-25T08:31:25.270' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (100, N'Ngân hàng TNHH Indovina', NULL, N'IVB', N'https://www.indovinabank.com.vn/vi/?', N'97A Nguyễn Văn Trỗi, Quận Phú Nhuận, TP. HCM', NULL, CAST(N'2021-02-25T08:31:25.320' AS DateTime), NULL, CAST(N'2021-02-25T08:31:25.320' AS DateTime), NULL, 1)
INSERT [dbo].[Bank] ([ID], [Name], [EnglishName], [ShorcutName], [Website], [Address], [NationalName], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (101, N'Ngân hàng Việt - Nga', NULL, N'VRB', N'http://www.vrbank.com.vn/ Lưu trữ 2009-10-22 tại Wayback Machine', N'75 Trần Hưng Đạo, Hà Nội', NULL, CAST(N'2021-02-25T08:31:25.370' AS DateTime), NULL, CAST(N'2021-02-25T08:31:25.370' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Bank] OFF
SET IDENTITY_INSERT [dbo].[Children] ON 

INSERT [dbo].[Children] ([ID], [Code], [IdentityCard], [Successive], [FullName], [FoodExpenses], [EducationExpenses], [StartLiveDate], [DateOfBirth], [PlaceOfBirth], [Gender], [Ethnic], [Image], [BirthCertificate], [HkType], [HKImage], [Confirmation], [EnrollReason], [Date], [CategoryID], [ProfessionalQualificationID], [MajorID], [EducationID], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'DANGNN29032011', N'343839029', NULL, N'Nguyễn Nguyên Đăng', CAST(10000 AS Decimal(11, 0)), CAST(10000 AS Decimal(11, 0)), CAST(N'2011-03-29T00:00:00.000' AS DateTime), CAST(N'2011-03-29T00:00:00.000' AS DateTime), N'Trống', N'Nam', N'Kinh', N'~/Data/images/Children/HongPhuc.png', N'~/Data/images/Children/HongPhuc.png', N'HK01', N'~/Data/images/Children/HongPhuc.png', 1, N'Ba mẹ em không đủ điều kiện để có thể nuôi e nên đã gửi e vào mái ấm', NULL, 2, 1, 2, 23, NULL, CAST(N'2020-09-16T21:15:36.590' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-10T21:02:59.290' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Children] ([ID], [Code], [IdentityCard], [Successive], [FullName], [FoodExpenses], [EducationExpenses], [StartLiveDate], [DateOfBirth], [PlaceOfBirth], [Gender], [Ethnic], [Image], [BirthCertificate], [HkType], [HKImage], [Confirmation], [EnrollReason], [Date], [CategoryID], [ProfessionalQualificationID], [MajorID], [EducationID], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N' MINHNS28092013', N'293029029', NULL, N'Nguyễn Song Minh', CAST(10000 AS Decimal(11, 0)), CAST(10000 AS Decimal(11, 0)), CAST(N'2011-03-29T00:00:00.000' AS DateTime), CAST(N'2013-09-28T00:00:00.000' AS DateTime), N'Trống', N'Nam', N'Kinh', N'~/Data/images/Children/HongPhuc.png', N'~/Data/images/Children/HongPhuc.png', N'HK02', N'~/Data/images/Children/HongPhuc.png', 1, N'Ba mẹ em mất trong một tai nạn, em được họ hàng gửi vào mái ấm.', NULL, 2, 1, 3, 24, NULL, CAST(N'2020-09-16T21:15:36.670' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-08T01:36:11.227' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Children] ([ID], [Code], [IdentityCard], [Successive], [FullName], [FoodExpenses], [EducationExpenses], [StartLiveDate], [DateOfBirth], [PlaceOfBirth], [Gender], [Ethnic], [Image], [BirthCertificate], [HkType], [HKImage], [Confirmation], [EnrollReason], [Date], [CategoryID], [ProfessionalQualificationID], [MajorID], [EducationID], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3003, N' NGHIEMT29032011', N'859403920', NULL, N'Thử Nghiệm', CAST(10000 AS Decimal(11, 0)), CAST(10000 AS Decimal(11, 0)), CAST(N'2011-03-29T00:00:00.000' AS DateTime), CAST(N'2011-03-29T00:00:00.000' AS DateTime), N'Trống', N'Nam', N'Kinh', N'~/Data/images/Children/HongPhuc.png', N'~/Data/images/Children/HongPhuc.png', N'HK01', N'~/Data/images/Children/HongPhuc.png', 1, N'Ba mẹ em không đủ điều kiện để có thể nuôi e nên đã gửi e vào mái ấm', NULL, 2, 1, 2, 23, NULL, CAST(N'2020-09-16T21:15:36.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-30T16:23:13.807' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Children] ([ID], [Code], [IdentityCard], [Successive], [FullName], [FoodExpenses], [EducationExpenses], [StartLiveDate], [DateOfBirth], [PlaceOfBirth], [Gender], [Ethnic], [Image], [BirthCertificate], [HkType], [HKImage], [Confirmation], [EnrollReason], [Date], [CategoryID], [ProfessionalQualificationID], [MajorID], [EducationID], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3014, N' TRUONGKN23042000', N'35238679028', NULL, N'Khánh Nguyễn Trương', CAST(10000 AS Decimal(11, 0)), CAST(10000 AS Decimal(11, 0)), CAST(N'2002-04-26T00:00:00.000' AS DateTime), CAST(N'2000-04-23T00:00:00.000' AS DateTime), N'Hải Dương', N'Nam', N'Kinh', N'~/Data/images/Children/avatar215124530215512287.jpg', N'~/Data/images/Children/[15.03.2021] BIÊN BẢN HỌP DỰ ÁN SAO HẢI VƯƠNG LẦN 1 - CUONGND211410823215124534215512289.pdf', N'HK01', N'~/Data/images/Children/[15.03.2021] BIÊN BẢN HỌP DỰ ÁN SAO HẢI VƯƠNG LẦN 1 - CUONGND211410823215124531215512336.pdf', 1, N'Không có lý do đặc biệt!', NULL, 1, 4, 16, 25, NULL, CAST(N'2021-04-24T16:54:17.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-24T17:18:42.580' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Children] ([ID], [Code], [IdentityCard], [Successive], [FullName], [FoodExpenses], [EducationExpenses], [StartLiveDate], [DateOfBirth], [PlaceOfBirth], [Gender], [Ethnic], [Image], [BirthCertificate], [HkType], [HKImage], [Confirmation], [EnrollReason], [Date], [CategoryID], [ProfessionalQualificationID], [MajorID], [EducationID], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4017, N' KYTNC29032011', NULL, NULL, N'Thử Nghiệm cuối kỳ', CAST(10000 AS Decimal(11, 0)), CAST(10000 AS Decimal(11, 0)), CAST(N'2011-03-29T00:00:00.000' AS DateTime), CAST(N'2011-03-29T00:00:00.000' AS DateTime), N'Trống', N'Nam', N'Kinh', N'~/Data/images/Children/HongPhuc.png', N'~/Data/images/Children/HongPhuc.png', N'HK01', N'~/Data/images/Children/HongPhuc.png', 1, N'Ba mẹ em không đủ điều kiện để có thể nuôi e nên đã gửi e vào mái ấm', NULL, 2, 1, 2, 23, NULL, CAST(N'2020-09-16T21:15:36.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-25T00:17:46.347' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Children] ([ID], [Code], [IdentityCard], [Successive], [FullName], [FoodExpenses], [EducationExpenses], [StartLiveDate], [DateOfBirth], [PlaceOfBirth], [Gender], [Ethnic], [Image], [BirthCertificate], [HkType], [HKImage], [Confirmation], [EnrollReason], [Date], [CategoryID], [ProfessionalQualificationID], [MajorID], [EducationID], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4018, N' NGHIEMCKT23042000', NULL, NULL, N'Cuối kỳ thử nghiệm', CAST(10000 AS Decimal(11, 0)), CAST(10000 AS Decimal(11, 0)), CAST(N'2002-04-26T00:00:00.000' AS DateTime), CAST(N'2000-04-23T00:00:00.000' AS DateTime), N'Hải Dương', N'Nam', N'Kinh', N'~/Data/images/Children/avatar215124530215512287.jpg', N'~/Data/images/Children/[15.03.2021] BIÊN BẢN HỌP DỰ ÁN SAO HẢI VƯƠNG LẦN 1 - CUONGND211410823215124534215512289.pdf', N'HK01', N'~/Data/images/Children/[15.03.2021] BIÊN BẢN HỌP DỰ ÁN SAO HẢI VƯƠNG LẦN 1 - CUONGND211410823215124531215512336.pdf', 1, N'Không có lý do đặc biệt!', NULL, 1, 4, 16, 25, NULL, CAST(N'2021-04-24T16:54:17.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-25T00:17:41.773' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[Children] OFF
SET IDENTITY_INSERT [dbo].[ChildrenCategory] ON 

INSERT [dbo].[ChildrenCategory] ([ID], [Code], [Name], [MetaTitle], [SeoTitle], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (0, NULL, N'Có mẹ hoặc cha', N'co-me-hoac-cha', N'CÓ MẸ HOẶC CHA', N'Không có mô tả đặc biệt nào', CAST(N'2020-09-10T13:21:28.200' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-09-10T13:21:28.200' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[ChildrenCategory] ([ID], [Code], [Name], [MetaTitle], [SeoTitle], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, NULL, N'Có cả ba và mẹ', N'co-ca-ba-va-me', N'CÓ CẢ BA VÀ MẸ', N'Không có mô tả đặc biệt nào', CAST(N'2020-09-10T13:21:28.610' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-09-10T13:21:28.610' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[ChildrenCategory] ([ID], [Code], [Name], [MetaTitle], [SeoTitle], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, NULL, N'Không có ba mẹ', NULL, NULL, N'Không có mô tả đặc biệt nào', NULL, NULL, CAST(N'2021-03-24T19:36:47.967' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[ChildrenCategory] ([ID], [Code], [Name], [MetaTitle], [SeoTitle], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, NULL, N'Trẻ dưới 14 tuổi', NULL, NULL, N'Không có mô tả đặc biệt nào', NULL, NULL, CAST(N'2021-03-24T19:37:19.403' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[ChildrenCategory] ([ID], [Code], [Name], [MetaTitle], [SeoTitle], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, NULL, N'Trẻ trên 14 tuổi', NULL, NULL, N'Trẻ trên 14 tuổi', NULL, NULL, CAST(N'2021-03-24T19:45:27.520' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[ChildrenCategory] OFF
SET IDENTITY_INSERT [dbo].[Counseling] ON 

INSERT [dbo].[Counseling] ([ID], [ChildrenID], [Problem], [Time], [Ticket], [Solution], [Description], [Psychologist], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (1019, 1, N'Trẻ hay đi chơi điện tử', 1, N'TVTL/ DANGNN/0001', N'Chưa có', N'Trẻ hay đi chơi điện tử', N'Trần Trung Kiên', CAST(N'2021-03-24T22:24:54.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, NULL, 1)
INSERT [dbo].[Counseling] ([ID], [ChildrenID], [Problem], [Time], [Ticket], [Solution], [Description], [Psychologist], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (1020, 1, N'Trẻ đánh nhau với bạn cùng lớp đó', 2, N'TVTL/ DANGNN/0002', N'Chưa có', N'Trẻ đánh nhau với bạn cùng lớp đó', N'Trần Trung Kiên', CAST(N'2021-03-24T22:25:05.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, NULL, 1)
INSERT [dbo].[Counseling] ([ID], [ChildrenID], [Problem], [Time], [Ticket], [Solution], [Description], [Psychologist], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (1021, 2, N'Trẻ đánh nhau với bạn cùng lớp đó', 1, N'TVTL/ MINHNS/0001', N'Chưa có', N'Trẻ đánh nhau với bạn cùng lớp đó', N'Trần Trung Kiên', CAST(N'2021-03-24T22:25:14.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, NULL, 1)
INSERT [dbo].[Counseling] ([ID], [ChildrenID], [Problem], [Time], [Ticket], [Solution], [Description], [Psychologist], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (1022, 2, N'Trẻ hay đi chơi điện tử', 2, N'TVTL/ MINHNS/0002', N'Chưa có', N'Trẻ hay đi chơi điện tử', N'Trần Trung Kiên', CAST(N'2021-03-24T22:25:23.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, NULL, 1)
INSERT [dbo].[Counseling] ([ID], [ChildrenID], [Problem], [Time], [Ticket], [Solution], [Description], [Psychologist], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (1023, 2005, N'Trẻ đánh nhau với bạn cùng lớp đó', 1, N'TVTL/ NGHIEMT/0001', N'Chưa có', N'x', N'Trần Trung Kiên', CAST(N'2021-03-24T22:28:48.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Counseling] OFF
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'CREATE_QUOTE')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'CREATE_USER')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'DELETE_QUOTE')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'DELETE_USER')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'READ_CHILDREN')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'READ_EMPLOYEE')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'READ_EVENT')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'READ_HISTORY')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'READ_QUOTE')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'READ_REGULATION')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'READ_SE')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'READ_USER')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'READ_VOLUNTEER')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'STATUS_QUOTE')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'UPDATE_QUOTE')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'ADMIN', N'UPDATE_USER')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'CHILDREN', N'CREATE_QUOTE')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'CHILDREN', N'READ_QUOTE')
INSERT [dbo].[Credential] ([UserGroupID], [RoleID]) VALUES (N'CHILDREN', N'UPDATE_USER')
SET IDENTITY_INSERT [dbo].[Currency] ON 

INSERT [dbo].[Currency] ([ID], [Code], [Name], [NameInternational], [Symbol], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'VND', N'Việt Nam Đồng', N'VNĐ', N'đ', CAST(N'2021-02-25T16:08:29.987' AS DateTime), NULL, CAST(N'2021-02-25T16:08:29.987' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Currency] OFF
SET IDENTITY_INSERT [dbo].[DevelopmentProcess] ON 

INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (1, NULL, 0, N'Học bổng tài năng', N'Đạt học bổng tài năng', N'Sau một năm học tập chăm chỉ và làm việc vất vả Hoàng Văn Hùng đã đạt được thành tích xuất sắc. Song song với đó, sau 1 năm hoạt động tích cực các hoạt động đoàn thể, Hùng đã tích lũy được điểm rèn luyện sinh viên ở mức rất cao. Tất cả như thế đã tạo nên một Hoàng Văn Hùng trưởng thành hơn và đạt được thành tựu cột mốc trong con đường học tập của mình.', N'/Data/images/Children/hoc-bong-tai-nang.jpg', N'/Data/images/Employee/HinhChung.jpg', N'Trương Nguyễn Khánh', CAST(N'2020-10-16T19:06:21.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:02:51.687' AS DateTime), 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (2, NULL, 0, N'Bán kết nghiên cứu khoa học EUREKA', N'Tham dự cuộc thi nghiên cứu khoa học EUREKA toàn quốc với đề tài "Xây dựng cổng thông tin hỗ trợ từ thiện"', N'Tham dự cuộc thi nghiên cứu khoa học EUREKA toàn quốc với đề tài "Xây dựng cổng thông tin hỗ trợ từ thiện"', N'/Data/images/Children/eureka-poster.jpg', N'/Data/images/Children/eureka-poster.jpg', N'Trương Nguyễn Khánh', CAST(N'2020-10-16T20:07:23.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:06:24.067' AS DateTime), 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (3, NULL, 0, N'Top 2 Youth Leader 2018 ', N'Hùng đã đạt được vị trí thứ 2 trong hoạt động lãnh đạo trẻ, Youth Leader UEF 2018', N'Hùng đã đạt được vị trí thứ 2 trong hoạt động lãnh đạo trẻ, Youth Leader UEF 2018', N'/Data/images/Children/youth-leader.jpg', N'/Data/images/Children/youth-leader.jpg', N'Trương Nguyễn Khánh', CAST(N'2018-10-16T20:10:49.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (4, NULL, 0, N'Á quân tại cuộc thi UEF TEAM RACE 2019', N'Vào năm 2019, Hùng cùng với nhóm đã giành được giải nhì với giải thưởng 1 triệu tại UEF TEAM RACE. ', N'Vào năm 2019, Hùng cùng với nhóm đã giành được giải nhì với giải thưởng 1 triệu tại UEF TEAM RACE. ', N'/Data/images/Children/uef-team-race-2019.jpg', N'/Data/images/Children/uef-team-race-2019.jpg', N'Trương Nguyễn Khánh', CAST(N'2019-10-16T20:12:23.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (5, NULL, 1, N'Học bổng tài năng', N'Đạt học bổng tài năng', N'Sau một năm học tập chăm chỉ và làm việc vất vả Hoàng Văn Hùng đã đạt được thành tích xuất sắc. Song song với đó, sau 1 năm hoạt động tích cực các hoạt động đoàn thể, Hùng đã tích lũy được điểm rèn luyện sinh viên ở mức rất cao. Tất cả như thế đã tạo nên một Hoàng Văn Hùng trưởng thành hơn và đạt được thành tựu cột mốc trong con đường học tập của mình.', N'/Data/images/Children/hoc-bong-tai-nang.jpg', N'/Data/images/Employee/HinhChung.jpg', N'Trương Nguyễn Khánh', CAST(N'2020-10-16T19:06:21.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (6, NULL, 1, N'Bán kết nghiên cứu khoa học EUREKA', N'Tham dự cuộc thi nghiên cứu khoa học EUREKA toàn quốc với đề tài "Xây dựng cổng thông tin hỗ trợ từ thiện"', N'Tham dự cuộc thi nghiên cứu khoa học EUREKA toàn quốc với đề tài "Xây dựng cổng thông tin hỗ trợ từ thiện"', N'/Data/images/Children/eureka-poster.jpg', N'/Data/images/Children/eureka-poster.jpg', N'Trương Nguyễn Khánh', CAST(N'2020-10-16T20:07:23.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (7, NULL, 1, N'Top 2 Youth Leader 2018 ', N'Hùng đã đạt được vị trí thứ 2 trong hoạt động lãnh đạo trẻ, Youth Leader UEF 2018', N'Hùng đã đạt được vị trí thứ 2 trong hoạt động lãnh đạo trẻ, Youth Leader UEF 2018', N'/Data/images/Children/youth-leader.jpg', N'/Data/images/Children/youth-leader.jpg', N'Trương Nguyễn Khánh', CAST(N'2018-10-16T20:10:49.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (8, NULL, 1, N'Á quân tại cuộc thi UEF TEAM RACE 2019', N'Vào năm 2019, Hùng cùng với nhóm đã giành được giải nhì với giải thưởng 1 triệu tại UEF TEAM RACE. ', N'Vào năm 2019, Hùng cùng với nhóm đã giành được giải nhì với giải thưởng 1 triệu tại UEF TEAM RACE. ', N'/Data/images/Children/uef-team-race-2019.jpg', N'/Data/images/Children/uef-team-race-2019.jpg', N'Trương Nguyễn Khánh', CAST(N'2019-10-16T20:12:23.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (9, NULL, 2, N'Học bổng tài năng', N'Đạt học bổng tài năng', N'Sau một năm học tập chăm chỉ và làm việc vất vả Hoàng Văn Hùng đã đạt được thành tích xuất sắc. Song song với đó, sau 1 năm hoạt động tích cực các hoạt động đoàn thể, Hùng đã tích lũy được điểm rèn luyện sinh viên ở mức rất cao. Tất cả như thế đã tạo nên một Hoàng Văn Hùng trưởng thành hơn và đạt được thành tựu cột mốc trong con đường học tập của mình.', N'/Data/images/Children/hoc-bong-tai-nang.jpg', N'/Data/images/Employee/HinhChung.jpg', N'Trương Nguyễn Khánh', CAST(N'2020-10-16T19:06:21.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (10, NULL, 2, N'Bán kết nghiên cứu khoa học EUREKA', N'Tham dự cuộc thi nghiên cứu khoa học EUREKA toàn quốc với đề tài "Xây dựng cổng thông tin hỗ trợ từ thiện"', N'Tham dự cuộc thi nghiên cứu khoa học EUREKA toàn quốc với đề tài "Xây dựng cổng thông tin hỗ trợ từ thiện"', N'/Data/images/Children/eureka-poster.jpg', N'/Data/images/Children/eureka-poster.jpg', N'Trương Nguyễn Khánh', CAST(N'2020-10-16T20:07:23.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-19T15:06:33.037' AS DateTime), 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (11, NULL, 2, N'Top 2 Youth Leader 2018 ', N'Hùng đã đạt được vị trí thứ 2 trong hoạt động lãnh đạo trẻ, Youth Leader UEF 2018', N'Hùng đã đạt được vị trí thứ 2 trong hoạt động lãnh đạo trẻ, Youth Leader UEF 2018', N'/Data/images/Children/youth-leader.jpg', N'/Data/images/Children/youth-leader.jpg', N'Trương Nguyễn Khánh', CAST(N'2018-10-16T20:10:49.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[DevelopmentProcess] ([ID], [Code], [ChildrenID], [Title], [MetaDescription], [Description], [Image], [Thumbnail], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (12, NULL, 2, N'Á quân tại cuộc thi UEF TEAM RACE 2019', N'Vào năm 2019, Hùng cùng với nhóm đã giành được giải nhì với giải thưởng 1 triệu tại UEF TEAM RACE. ', N'Vào năm 2019, Hùng cùng với nhóm đã giành được giải nhì với giải thưởng 1 triệu tại UEF TEAM RACE. ', N'/Data/images/Children/uef-team-race-2019.jpg', N'/Data/images/Children/uef-team-race-2019.jpg', N'Trương Nguyễn Khánh', CAST(N'2019-10-16T20:12:23.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[DevelopmentProcess] OFF
SET IDENTITY_INSERT [dbo].[Dish] ON 

INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Canh chua cá hú', N'Cá hú, cà chua, rau,..', N'Vitamin C,..', N'Không có', N'Món canh', NULL, NULL, CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Thịt kho tiêu', N'Thịt heo', N'Không biết', N'Không có', N'Món mặn', CAST(N'2021-04-01T10:05:04.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Bắp xào', N'Trống', N'Trống', NULL, N'Món xào', CAST(N'2021-04-01T10:05:46.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Thịt hầm', N'Trống', N'Trống', N'Trống', N'Món canh', CAST(N'2021-04-01T10:09:44.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Tôm ram mặn', N'Trống', N'Trống', N'Trống', N'Món mặn', CAST(N'2021-04-01T10:15:48.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'Đậu que xào thịt', N'Trống', N'Trống', N'Trống', N'Món xào', CAST(N'2021-04-01T10:16:05.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'Trứng chiên', N'Trống', N'Trống', N'Trống', N'Món mặn', CAST(N'2021-04-01T10:16:45.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'Trứng xào', N'Trống', N'Trống', N'Trống', N'Món xào', CAST(N'2021-04-01T10:16:57.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N'Canh trứng', N'Trống', N'Trống', N'Trống', N'Món canh', CAST(N'2021-04-01T10:17:04.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1002, N'Nước tắc', N'Trống', N'Trống', N'Không có', N'Đồ ăn vặt', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1003, N'Xúc xích heo', N'Trống', N'Trống', N'Không có', N'Đồ ăn vặt', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1004, N'Sữa chua trái cây', N'Trống', N'Trống', N'Không có', N'Đồ ăn vặt', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1005, N'Bánh mì ngọt 
thịnh phát', N'Trống', N'Trống', N'Không có', N'Đồ ăn vặt', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1006, N'Chanh dây', N'Trống', N'Trống', N'Không có', N'Đồ ăn vặt', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1007, N'Bánh giầy
 Chả lụa', N'Trống', N'Trống', N'Không có', N'Đồ ăn vặt', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Dish] ([ID], [Name], [Material], [Nutrition], [Note], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1008, N'Bánh
 chưng', N'Trống', N'Trống', N'Không có', N'Đồ ăn vặt', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T22:59:49.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[Dish] OFF
SET IDENTITY_INSERT [dbo].[Education] ON 

INSERT [dbo].[Education] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (22, N'CHUATH', N'Chưa học xong tiểu học', CAST(N'2021-03-24T19:33:57.603' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-24T19:33:57.603' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Education] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (23, N'TNTH', N'Tốt nghiệp tiểu học', CAST(N'2021-03-24T19:33:57.603' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-24T19:33:34.607' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Education] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (24, N'THCS', N'Tốt nghiệp trung học cơ sở', CAST(N'2021-03-24T19:33:57.603' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-24T19:33:06.583' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Education] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (25, N'THPT', N'Tốt nghiệp trung học phổ thông trở lên', CAST(N'2021-03-24T19:33:57.603' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-24T19:33:16.267' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[Education] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([ID], [Code], [IdentityCard], [Name], [Gender], [Image], [Agreement], [DateOfBirth], [Domicile], [PlaceOfBirth], [ProfessionalQualificationID], [EducationID], [MajorID], [StudiedAt], [Language], [InformationTechnology], [Job], [JobName], [Email], [Phone], [Successive], [Religion], [StartingSalagy], [GiftSalary], [AllOtherFoodExpenses], [ContractType], [WorkingContract], [WorkingDate], [StoppedWorkingDate], [WorkingHours], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N' CUNT17051988', N'34546456', N'Nguyễn Thị Cư', N'Nữ', N'/Data/images/Employee/S%C6%A1%20C%C6%B0.jpg', NULL, CAST(N'1988-05-17T00:00:00.000' AS DateTime), N'TP Hồ Chí Minh', N'Hải Dương', 4, 22, 1, NULL, N'A', N'A', N'Điều hành', N'Chủ nhiệm CS', N'cunt1982@gmail.com', N'036456489', 1, N'Thiên chúa giáo', CAST(7000000 AS Decimal(11, 0)), CAST(1 AS Decimal(11, 0)), CAST(250000 AS Decimal(11, 0)), N'Chính thức', 1, CAST(N'1960-01-01T00:00:00.000' AS DateTime), CAST(N'2100-01-01T00:00:00.000' AS DateTime), N'24/24', CAST(N'2020-09-09T14:41:11.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-19T23:11:02.043' AS DateTime), NULL, 0)
INSERT [dbo].[Employee] ([ID], [Code], [IdentityCard], [Name], [Gender], [Image], [Agreement], [DateOfBirth], [Domicile], [PlaceOfBirth], [ProfessionalQualificationID], [EducationID], [MajorID], [StudiedAt], [Language], [InformationTechnology], [Job], [JobName], [Email], [Phone], [Successive], [Religion], [StartingSalagy], [GiftSalary], [AllOtherFoodExpenses], [ContractType], [WorkingContract], [WorkingDate], [StoppedWorkingDate], [WorkingHours], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N' DUNGNTM25101980', N'46548513', N'Nguyễn Thị Mỹ Dung', N'Nữ', N'/Data/images/Children/NhatVi.png', NULL, CAST(N'1980-10-25T00:00:00.000' AS DateTime), N'TP Hồ Chí Minh', N'Hải Hưng', 4, 22, 2, NULL, N'A', N'A', N'Hỗ trợ điều hành', N'Phó CN CS HC', N'dungntm@gmail.com', N'036566490', 1, N'Thiên Chúa', CAST(7000000 AS Decimal(11, 0)), CAST(1 AS Decimal(11, 0)), CAST(250000 AS Decimal(11, 0)), N'Chính Thức', 1, CAST(N'2012-03-25T00:00:00.000' AS DateTime), CAST(N'2020-09-09T15:36:51.587' AS DateTime), N'8/24', CAST(N'2020-09-09T15:36:51.587' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-19T23:10:57.337' AS DateTime), NULL, 0)
INSERT [dbo].[Employee] ([ID], [Code], [IdentityCard], [Name], [Gender], [Image], [Agreement], [DateOfBirth], [Domicile], [PlaceOfBirth], [ProfessionalQualificationID], [EducationID], [MajorID], [StudiedAt], [Language], [InformationTechnology], [Job], [JobName], [Email], [Phone], [Successive], [Religion], [StartingSalagy], [GiftSalary], [AllOtherFoodExpenses], [ContractType], [WorkingContract], [WorkingDate], [StoppedWorkingDate], [WorkingHours], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N' TAMNT20081991', N'46541653', N'Nguyễn Thị Tâm', N'Nữ', N'/Data/images/Children/MinhPhuong.png', NULL, CAST(N'1991-08-20T00:00:00.000' AS DateTime), N'TP Hồ Chí Minh', N'Tp. Hà Tĩnh', 4, 22, 3, NULL, N'A', N'A', N'Chăm sóc sức khỏe', N'Y tế', N'tamnt@gmail.com', N'098766491', 1, N'Thiên Chúa', CAST(7000000 AS Decimal(11, 0)), CAST(1 AS Decimal(11, 0)), CAST(250000 AS Decimal(11, 0)), N'Chính Thức', 1, CAST(N'2012-12-12T00:00:00.000' AS DateTime), CAST(N'2020-09-09T15:36:52.093' AS DateTime), N'12/24', CAST(N'2020-09-09T15:36:52.093' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-19T23:10:52.140' AS DateTime), NULL, 0)
INSERT [dbo].[Employee] ([ID], [Code], [IdentityCard], [Name], [Gender], [Image], [Agreement], [DateOfBirth], [Domicile], [PlaceOfBirth], [ProfessionalQualificationID], [EducationID], [MajorID], [StudiedAt], [Language], [InformationTechnology], [Job], [JobName], [Email], [Phone], [Successive], [Religion], [StartingSalagy], [GiftSalary], [AllOtherFoodExpenses], [ContractType], [WorkingContract], [WorkingDate], [StoppedWorkingDate], [WorkingHours], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N' DUNGNTM27011990', N'648941465', N'Nguyễn Thị Mỹ Dung', N'Nữ', N'/Data/images/Employee/M%E1%BB%B9%20Dung.jpg', NULL, CAST(N'1990-01-27T00:00:00.000' AS DateTime), N'TP Hồ Chí Minh', N'Hà Tĩnh', 4, 22, 4, NULL, N'A', N'C', N'Đào tạo', N'Giáo Viên', N'dungntm1@gmail.com', N'088656649', 1, N'Thiên Chúa', CAST(7000000 AS Decimal(11, 0)), CAST(1 AS Decimal(11, 0)), CAST(250000 AS Decimal(11, 0)), N'Bán thời gian', 0, CAST(N'1965-01-27T00:00:00.000' AS DateTime), CAST(N'2020-05-25T00:00:00.000' AS DateTime), N'10/24', CAST(N'2020-09-09T15:36:52.157' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-19T23:10:47.287' AS DateTime), NULL, 0)
INSERT [dbo].[Employee] ([ID], [Code], [IdentityCard], [Name], [Gender], [Image], [Agreement], [DateOfBirth], [Domicile], [PlaceOfBirth], [ProfessionalQualificationID], [EducationID], [MajorID], [StudiedAt], [Language], [InformationTechnology], [Job], [JobName], [Email], [Phone], [Successive], [Religion], [StartingSalagy], [GiftSalary], [AllOtherFoodExpenses], [ContractType], [WorkingContract], [WorkingDate], [StoppedWorkingDate], [WorkingHours], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N' THOMTT27071991', N'56489879456', N'Trần Thị Thơm', N'Nữ', N'/Data/images/Employee/Th%E1%BB%8B%20T%C3%A2m.jpg', NULL, CAST(N'1991-07-27T00:00:00.000' AS DateTime), N'TP Hồ Chí Minh', N'Bình Long, Bình Phước', 4, 22, 5, NULL, N'A', N'A', N'Đào tạo', N'Giáo Viên', N'thomtt@gmail.com', N'031564455', 1, N'Thiên Chúa', CAST(7000000 AS Decimal(11, 0)), CAST(1 AS Decimal(11, 0)), CAST(250000 AS Decimal(11, 0)), N'Chính Thức', 1, CAST(N'2011-01-01T00:00:00.000' AS DateTime), CAST(N'2020-01-01T00:00:00.000' AS DateTime), N'24/24', CAST(N'2020-09-09T15:36:52.220' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-19T23:10:42.293' AS DateTime), NULL, 0)
INSERT [dbo].[Employee] ([ID], [Code], [IdentityCard], [Name], [Gender], [Image], [Agreement], [DateOfBirth], [Domicile], [PlaceOfBirth], [ProfessionalQualificationID], [EducationID], [MajorID], [StudiedAt], [Language], [InformationTechnology], [Job], [JobName], [Email], [Phone], [Successive], [Religion], [StartingSalagy], [GiftSalary], [AllOtherFoodExpenses], [ContractType], [WorkingContract], [WorkingDate], [StoppedWorkingDate], [WorkingHours], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N' CUNT17051988', N'34546456', N'Nguyễn Thị Cư', N'Nữ', N'/Data/images/Employee/S%C6%A1%20C%C6%B0.jpg', NULL, CAST(N'1988-05-17T00:00:00.000' AS DateTime), N'TP Hồ Chí Minh', N'Hải Dương', 4, 22, 6, NULL, N'A', N'A', N'Điều hành', N'Chủ cơ sở', N'cunt1988@gmail.com', N'036456489', 1, N'Thiên chúa giáo', CAST(7000000 AS Decimal(11, 0)), CAST(1 AS Decimal(11, 0)), CAST(250000 AS Decimal(11, 0)), N'Chính thức', 1, CAST(N'1960-01-01T00:00:00.000' AS DateTime), CAST(N'2025-01-01T00:00:00.000' AS DateTime), N'8/24', CAST(N'2020-10-18T23:32:58.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-19T23:10:35.183' AS DateTime), NULL, 0)
INSERT [dbo].[Employee] ([ID], [Code], [IdentityCard], [Name], [Gender], [Image], [Agreement], [DateOfBirth], [Domicile], [PlaceOfBirth], [ProfessionalQualificationID], [EducationID], [MajorID], [StudiedAt], [Language], [InformationTechnology], [Job], [JobName], [Email], [Phone], [Successive], [Religion], [StartingSalagy], [GiftSalary], [AllOtherFoodExpenses], [ContractType], [WorkingContract], [WorkingDate], [StoppedWorkingDate], [WorkingHours], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N' KHANHT12032021', N'34546456', N'Trương Khánh', N'Nam', N'/Data/images/Children/41.png', N'~/Data/files/DỰ ÁN SAO THIÊN VƯƠNG214658350.pdf', CAST(N'2021-03-12T00:00:00.000' AS DateTime), N'TP Hồ Chí Minh', N'Hải Dương', 1, 22, 1, NULL, N'A', N'A', N'Điều hành', N'Chủ cơ sở', N'thiennhan@gmail.com', N'0925322618', 0, N'Thiên chúa giáo', CAST(7000000 AS Decimal(11, 0)), CAST(1 AS Decimal(11, 0)), CAST(250000 AS Decimal(11, 0)), N'Chính thức', 1, CAST(N'2021-03-10T00:00:00.000' AS DateTime), CAST(N'2021-03-18T00:00:00.000' AS DateTime), NULL, CAST(N'2021-03-31T17:04:00.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T17:46:58.387' AS DateTime), NULL, 0)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([ID], [Code], [Type], [Name], [Description], [MoreInformation], [StartDate], [EndDate], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (1, N'SK01', NULL, N'Bà giáo già nuôi trẻ mồ côi', N'Ở tuổi lục tuần, nhưng bà giáo già ấy vẫn miệt mài chăm lo cho hơn chục đứa trẻ mồ côi, cơ nhỡ từng miếng cơm manh áo, lo cho chúng được cắp sách đến trường, được sum vầy trong một mái ấm yên vui.', N'Đây là sự kiện mẫu.', CAST(N'2020-10-16T19:21:00.000' AS DateTime), NULL, N'~/Assets/admin/img/doraemon.png', N'Trương Nguyễn Khánh', CAST(N'2020-10-16T19:21:00.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-16T19:39:10.017' AS DateTime), 1)
INSERT [dbo].[Event] ([ID], [Code], [Type], [Name], [Description], [MoreInformation], [StartDate], [EndDate], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (2, N'SK02', NULL, N'Dùng ATM gạo phát cho người dân nghèo', N'Trường đại học Kinh tế - Tài chính lắp ATM gạo phát cho người dân nghèo', N'Trường đại học Kinh tế - Tài chính lắp ATM gạo phát cho người dân nghèo', CAST(N'2020-10-16T19:21:00.000' AS DateTime), NULL, N'~/Assets/admin/img/doraemon.png', N'Trương Nguyễn Khánh', CAST(N'2020-10-16T22:57:42.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-16T22:58:34.147' AS DateTime), 1)
INSERT [dbo].[Event] ([ID], [Code], [Type], [Name], [Description], [MoreInformation], [StartDate], [EndDate], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (5, N'SK03', NULL, N'Tự thiện vùng Tây Nguyên', N'Tổ chức Thiện nguyện Việt Nam được đặt trên nền tảng lý luận của các nghiên cứu khoa học cơ bản và xây dựng được các kế hoạch hoạt động đa dạng phong phú với nhiều hướng tiếp cận mới phù hợp với xu thế cách mạng công nghiệp 4.0 sẽ là làn gió mới trong bối cảnh và thực trạng hiện nay của công tác thiện nguyện ở Việt Nam', N'Tự thiện vùng Tây Nguyên', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, N'~/Data/images/Event/DỰ ÁN CỘNG ĐỒNG (1)-1210013147.png', N'Trương Nguyễn Khánh', CAST(N'2020-10-18T21:22:39.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-24T14:00:13.167' AS DateTime), 0)
INSERT [dbo].[Event] ([ID], [Code], [Type], [Name], [Description], [MoreInformation], [StartDate], [EndDate], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (1006, N'SK04', NULL, N'Sự kiện thử nghiệm', N'Sự kiện thử nghiệm', N'Sự kiện thử nghiệm', CAST(N'2020-10-16T00:00:00.000' AS DateTime), NULL, N'~/Data/images/Event/rsz_service-learning-ban-giao-cong-thong-tin-uef_11212603025.jpg', N'Trương Nguyễn Khánh', CAST(N'2021-04-11T22:25:41.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-11T22:33:01.763' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Event] OFF
SET IDENTITY_INSERT [dbo].[HealthInsurance] ON 

INSERT [dbo].[HealthInsurance] ([ID], [ChildrenID], [No], [RegisteredHospital], [BoughtDate], [EndDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (1, 1, N'CNO01239128', N'Hồ Chí Minh', CAST(N'2020-10-15T00:00:00.000' AS DateTime), CAST(N'2020-10-15T00:00:00.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-13T01:01:25.000' AS DateTime), NULL, CAST(N'2021-02-24T04:04:03.140' AS DateTime), 0)
INSERT [dbo].[HealthInsurance] ([ID], [ChildrenID], [No], [RegisteredHospital], [BoughtDate], [EndDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (2, 0, N'CNO92839109', N'Hồ Chí Minh', CAST(N'2020-10-15T00:00:00.000' AS DateTime), CAST(N'2020-10-15T00:00:00.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-13T01:01:25.000' AS DateTime), NULL, CAST(N'2021-02-24T04:04:07.120' AS DateTime), 0)
INSERT [dbo].[HealthInsurance] ([ID], [ChildrenID], [No], [RegisteredHospital], [BoughtDate], [EndDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (4, 2, N'CNO23493029', N'Hồ Chí Minh', CAST(N'2021-02-24T00:00:00.000' AS DateTime), CAST(N'2021-02-24T00:00:00.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T00:56:34.000' AS DateTime), NULL, CAST(N'2021-02-24T04:03:58.337' AS DateTime), 0)
INSERT [dbo].[HealthInsurance] ([ID], [ChildrenID], [No], [RegisteredHospital], [BoughtDate], [EndDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (6, 4, N'CNO01239127', N'Hồ Chí Minh', CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-20T12:20:31.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[HealthInsurance] ([ID], [ChildrenID], [No], [RegisteredHospital], [BoughtDate], [EndDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (1006, 2005, N'CNO01239127', N'Hồ Chí Minh', CAST(N'2021-03-25T00:00:00.000' AS DateTime), CAST(N'2021-03-25T00:00:00.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-24T21:31:30.000' AS DateTime), NULL, CAST(N'2021-03-24T23:57:21.827' AS DateTime), 1)
INSERT [dbo].[HealthInsurance] ([ID], [ChildrenID], [No], [RegisteredHospital], [BoughtDate], [EndDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (2006, 3005, N'CNO01239127', N'Hồ Chí Minh City', CAST(N'2021-03-18T00:00:00.000' AS DateTime), CAST(N'2021-03-20T00:00:00.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-30T16:30:26.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[HealthInsurance] OFF
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Năm thánh lập 1995', N'Nuôi các trẻ ở vùng sâu, xa ăn học và hỗ trợ chỗ ở', CAST(N'2020-10-02T21:25:34.090' AS DateTime), N'Trương Nguyễn Khánh', NULL, N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Năm 1998', N'Bắt đầu nhận nuôi 3 trẻ sơ sinh bỉ bỏ rơi đầu tiên, Xây nhà 923/7', CAST(N'2020-10-02T21:25:48.667' AS DateTime), N'Trương Nguyễn Khánh', NULL, N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Năm 2000', N'Sau năm năm hoạt động số lượng trẻ lên tới 20 trẻ', CAST(N'2020-10-02T21:25:55.100' AS DateTime), N'Trương Nguyễn Khánh', NULL, N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Năm 2004', N'Sơ Yên tổ chức cho trẻ đi nghỉ hè ở Phan Thiết', CAST(N'2020-10-02T21:26:03.040' AS DateTime), N'Trương Nguyễn Khánh', NULL, N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Năm 2005', N'Đến thời điểm này đã có 5 trẻ giúp trong hoàn cảnh khó khăn bước vào học nghề và ra ngoài tự lập, Số lượng trẻ thời điểm này đã lên tới 50 trẻ.', CAST(N'2020-10-02T21:26:14.173' AS DateTime), N'Trương Nguyễn Khánh', NULL, N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Năm 2010', N'Đây là thời điểm có số lượng trẻ sơ sinh lên đến 10 cháu, Giai đoạn này tổng số lượng trẻ là 60 cháu, Đánh dấu cột mốc 15 năm hoạt động của mái ấm', CAST(N'2020-10-02T21:26:14.173' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:14:18.800' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'Năm 2012', N'Được các ân nhân cho mượn thêm 2 ngôi nhà liền kề để tiện cho việc sinh hoạt cho các cháu, Giai đoạn này có thêm 10 cháu được giúp đỡ ra ngoài tự lập, học nghê và đi làm', CAST(N'2020-10-02T21:26:33.060' AS DateTime), N'Trương Nguyễn Khánh', NULL, N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'Năm 2015', N'Số lượng các cháu đến thời điểm hiện tại là 40 trẻ. Đã trả trẻ còn người thân về với gia đình, Mái ấm lúc này được quy hoạch lại để chuẩn bị cho việc cấp phép hoạt động.', CAST(N'2020-10-02T21:26:43.517' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:59:51.157' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'Năm 2016', N'Mái ấm được cấp phép hoạt động, Trẻ tới tuổi được làm chứng mình nhân dân và vao đại học, Tiến hành thủ tục nhập khẩu cho trẻ', CAST(N'2020-10-02T21:26:14.173' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:14:54.253' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N'Năm 2017 - 2018', N'Xây dựng lại mái ấm, Khánh thành ngày 4/8/2018.', CAST(N'2020-10-02T21:26:14.173' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:15:23.670' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'Năm 2019', N'Ký đối tác với trường Đại Học Kinh Tế Tài Chính', CAST(N'2020-10-02T21:26:14.173' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:10:46.733' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[History] ([ID], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N'Năm 2020', N'Cột mốc 25 năm với 3 trẻ sơ sinh đầu tiên ra trường và đi làm.', CAST(N'2020-10-02T21:26:14.173' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T03:55:28.960' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[History] OFF
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Toán tin', CAST(N'2021-02-21T18:01:31.660' AS DateTime), NULL, CAST(N'2021-02-21T18:01:31.660' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Toán ứng dụng', CAST(N'2021-02-21T18:01:31.713' AS DateTime), NULL, CAST(N'2021-02-21T18:01:31.713' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Khoa học tính toán', CAST(N'2021-02-21T18:01:31.757' AS DateTime), NULL, CAST(N'2021-02-21T18:01:31.757' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Toán học', CAST(N'2021-02-21T18:01:31.800' AS DateTime), NULL, CAST(N'2021-02-21T18:01:31.800' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Thống kê', CAST(N'2021-02-21T18:01:31.847' AS DateTime), NULL, CAST(N'2021-02-21T18:01:31.847' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Thú y', CAST(N'2021-02-21T18:01:31.893' AS DateTime), NULL, CAST(N'2021-02-21T18:01:31.893' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'Quản lý bệnh viện', CAST(N'2021-02-21T18:01:31.940' AS DateTime), NULL, CAST(N'2021-02-21T18:01:31.940' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, N'Tổ chức và quản lý y tế', CAST(N'2021-02-21T18:01:31.987' AS DateTime), NULL, CAST(N'2021-02-21T18:01:31.987' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, N'Y đa khoa', CAST(N'2021-02-21T18:01:32.030' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.030' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, N'Điều dưỡng', CAST(N'2021-02-21T18:01:32.077' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.077' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, N'Hóa dược', CAST(N'2021-02-21T18:01:32.120' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.120' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, N'Dược học', CAST(N'2021-02-21T18:01:32.167' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.167' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, N'Y học cổ truyền', CAST(N'2021-02-21T18:01:32.210' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.210' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'Y học dự phòng', CAST(N'2021-02-21T18:01:32.260' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.260' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, N'Y tế công cộng', CAST(N'2021-02-21T18:01:32.303' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.303' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (16, N'Kỹ thuật phục hồi chức năng', CAST(N'2021-02-21T18:01:32.347' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.347' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (17, N'Kỹ thuật hình ảnh y học', CAST(N'2021-02-21T18:01:32.390' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.390' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (18, N'Kỹ thuật xét nghiệm y học', CAST(N'2021-02-21T18:01:32.437' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.437' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (19, N'Kỹ thuật phục hình răng', CAST(N'2021-02-21T18:01:32.480' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.480' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (20, N'Răng - Hàm - Mặt', CAST(N'2021-02-21T18:01:32.523' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.523' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (21, N'Dinh dưỡng', CAST(N'2021-02-21T18:01:32.567' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.567' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (22, N'Hộ sinh', CAST(N'2021-02-21T18:01:32.610' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.610' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (23, N'Công nghệ da giày', CAST(N'2021-02-21T18:01:32.653' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.653' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (24, N'Công nghệ vật liệu dệt, may', CAST(N'2021-02-21T18:01:32.700' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.700' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (25, N'Công nghệ sợi, dệt', CAST(N'2021-02-21T18:01:32.743' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.743' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (26, N'Công nghệ chế biến lâm sản', CAST(N'2021-02-21T18:01:32.790' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.790' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (27, N'Công nghệ dệt, may', CAST(N'2021-02-21T18:01:32.833' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.833' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (28, N'Đảm bảo chất lượng và an toàn thực phẩm', CAST(N'2021-02-21T18:01:32.880' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.880' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (29, N'Công nghệ chế biến thuỷ sản', CAST(N'2021-02-21T18:01:32.923' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.923' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (30, N'Công nghệ sau thu hoạch', CAST(N'2021-02-21T18:01:32.967' AS DateTime), NULL, CAST(N'2021-02-21T18:01:32.967' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (31, N'Kỹ thuật thực phẩm', CAST(N'2021-02-21T18:01:33.007' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.007' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (32, N'Công nghệ thực phẩm', CAST(N'2021-02-21T18:01:33.053' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.053' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (33, N'Luật quốc tế', CAST(N'2021-02-21T18:01:33.097' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.097' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (34, N'Luật kinh tế', CAST(N'2021-02-21T18:01:33.143' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.143' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (35, N'Luật', CAST(N'2021-02-21T18:01:33.190' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.190' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (36, N'Lâm sinh', CAST(N'2021-02-21T18:01:33.233' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.233' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (37, N'Quản lý thủy sản', CAST(N'2021-02-21T18:01:33.280' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.280' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (38, N'Khai thác thủy sản', CAST(N'2021-02-21T18:01:33.323' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.323' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (39, N'Bệnh học thủy sản', CAST(N'2021-02-21T18:01:33.370' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.370' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (40, N'Nuôi trồng thủy sản', CAST(N'2021-02-21T18:01:33.413' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.413' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (41, N'Phát triển nông thôn', CAST(N'2021-02-21T18:01:33.460' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.460' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (42, N'Kinh tế nông nghiệp', CAST(N'2021-02-21T18:01:33.503' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.503' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (43, N'Kinh doanh nông nghiệp', CAST(N'2021-02-21T18:01:33.550' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.550' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (44, N'Công nghệ rau hoa quả và cảnh quan', CAST(N'2021-02-21T18:01:33.593' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.593' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (45, N'Bảo vệ thực vật', CAST(N'2021-02-21T18:01:33.630' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.630' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (46, N'Khoa học cây trồng', CAST(N'2021-02-21T18:01:33.680' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.680' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (47, N'Nông học', CAST(N'2021-02-21T18:01:33.723' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.723' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (48, N'Chăn nuôi', CAST(N'2021-02-21T18:01:33.767' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.767' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (49, N'Khoa học đất', CAST(N'2021-02-21T18:01:33.810' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.810' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (50, N'Khuyến nông', CAST(N'2021-02-21T18:01:33.853' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.853' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (51, N'Nông nghiệp', CAST(N'2021-02-21T18:01:33.900' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.900' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (52, N'Lâm học', CAST(N'2021-02-21T18:01:33.943' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.943' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (53, N'Quản lý tài nguyên rừng', CAST(N'2021-02-21T18:01:33.987' AS DateTime), NULL, CAST(N'2021-02-21T18:01:33.987' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (54, N'Lâm nghiệp đô thị', CAST(N'2021-02-21T18:01:34.030' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.030' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (55, N'Ngôn ngữ Khmer', CAST(N'2021-02-21T18:01:34.073' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.073' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (56, N'Hán Nôm', CAST(N'2021-02-21T18:01:34.120' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.120' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (57, N'Tiếng Việt và văn hoá Việt Nam', CAST(N'2021-02-21T18:01:34.160' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.160' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (58, N'Văn hoá các dân tộc thiểu số Việt Nam', CAST(N'2021-02-21T18:01:34.207' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.207' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (59, N'Sáng tác Văn học', CAST(N'2021-02-21T18:01:34.247' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.247' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (60, N'Ngôn ngữ Ả Rập', CAST(N'2021-02-21T18:01:34.290' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.290' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (61, N'Ngôn ngữ Hàn Quốc', CAST(N'2021-02-21T18:01:34.337' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.337' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (62, N'Ngôn ngữ Nhật', CAST(N'2021-02-21T18:01:34.380' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.380' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (63, N'Ngôn ngữ Bồ Đào Nha', CAST(N'2021-02-21T18:01:34.423' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.423' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (64, N'Ngôn ngữ Tây Ban Nha', CAST(N'2021-02-21T18:01:34.467' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.467' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (65, N'Ngôn ngữ Trung Quốc', CAST(N'2021-02-21T18:01:34.510' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.510' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (66, N'Ngôn ngữ Đức', CAST(N'2021-02-21T18:01:34.557' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.557' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (67, N'Ngôn ngữ Pháp', CAST(N'2021-02-21T18:01:34.600' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.600' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (68, N'Ngôn ngữ Nga', CAST(N'2021-02-21T18:01:34.643' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.643' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (69, N'Ngôn ngữ Anh', CAST(N'2021-02-21T18:01:34.687' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.687' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (70, N'Quản lý văn hóa', CAST(N'2021-02-21T18:01:34.730' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.730' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (71, N'Văn hóa học', CAST(N'2021-02-21T18:01:34.773' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.773' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (72, N'Văn học', CAST(N'2021-02-21T18:01:34.817' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.817' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (73, N'Ngôn ngữ học', CAST(N'2021-02-21T18:01:34.860' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.860' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (74, N'Lịch sử', CAST(N'2021-02-21T18:01:34.903' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.903' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (75, N'Tôn giáo học', CAST(N'2021-02-21T18:01:34.967' AS DateTime), NULL, CAST(N'2021-02-21T18:01:34.967' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (76, N'Chủ nghĩa xã hội khoa học', CAST(N'2021-02-21T18:01:35.010' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.010' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (77, N'Triết học', CAST(N'2021-02-21T18:01:35.053' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.053' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (78, N'Bảo hộ lao động', CAST(N'2021-02-21T18:01:35.097' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.097' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (79, N'Quản lý đất đai', CAST(N'2021-02-21T18:01:35.140' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.140' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (80, N'Kinh tế tài nguyên thiên nhiên', CAST(N'2021-02-21T18:01:35.183' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.183' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (81, N'Quản lý tài nguyên và môi trường', CAST(N'2021-02-21T18:01:35.227' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.227' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (82, N'Kỹ thuật máy tính', CAST(N'2021-02-21T18:01:35.270' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.270' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (83, N'Kỹ thuật phần mềm', CAST(N'2021-02-21T18:01:35.313' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.313' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (84, N'Mạng máy tính và truyền thông dữ liệu', CAST(N'2021-02-21T18:01:35.357' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.357' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (85, N'Khoa học máy tính', CAST(N'2021-02-21T18:01:35.400' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.400' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (86, N'An toàn thông tin', CAST(N'2021-02-21T18:01:35.447' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.447' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (87, N'Công nghệ thông tin', CAST(N'2021-02-21T18:01:35.490' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.490' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (88, N'Kỹ thuật tuyển khoáng', CAST(N'2021-02-21T18:01:35.537' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.537' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (89, N'Kỹ thuật dầu khí', CAST(N'2021-02-21T18:01:35.580' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.580' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (90, N'Kỹ thuật mỏ', CAST(N'2021-02-21T18:01:35.623' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.623' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (91, N'Kỹ thuật địa vật lý', CAST(N'2021-02-21T18:01:35.670' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.670' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (92, N'Kỹ thuật trắc địa - bản đồ', CAST(N'2021-02-21T18:01:35.717' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.717' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (93, N'Kỹ thuật địa chất', CAST(N'2021-02-21T18:01:35.780' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.780' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (94, N'Kỹ thuật hạt nhân', CAST(N'2021-02-21T18:01:35.823' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.823' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (95, N'Vật lý kỹ thuật', CAST(N'2021-02-21T18:01:35.870' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.870' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (96, N'Kỹ thuật môi trường', CAST(N'2021-02-21T18:01:35.910' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.910' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (97, N'Kỹ thuật vật liệu kim loại', CAST(N'2021-02-21T18:01:35.953' AS DateTime), NULL, CAST(N'2021-02-21T18:01:35.953' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (98, N'Kỹ thuật vật liệu', CAST(N'2021-02-21T18:01:36.000' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.000' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (99, N'Kỹ thuật hoá học', CAST(N'2021-02-21T18:01:36.043' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.043' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (100, N'Kỹ thuật điều khiển và tự động hóa', CAST(N'2021-02-21T18:01:36.090' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.090' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (101, N'Kỹ thuật y sinh', CAST(N'2021-02-21T18:01:36.130' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.130' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (102, N'Kỹ thuật điện tử - viễn thông', CAST(N'2021-02-21T18:01:36.177' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.177' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (103, N'Kỹ thuật điện', CAST(N'2021-02-21T18:01:36.220' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.220' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (104, N'Kỹ thuật không gian', CAST(N'2021-02-21T18:01:36.263' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.263' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (105, N'Kỹ thuật hàng không', CAST(N'2021-02-21T18:01:36.307' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.307' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (106, N'Kỹ thuật hệ thống công nghiệp', CAST(N'2021-02-21T18:01:36.350' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.350' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (107, N'Kỹ thuật công nghiệp', CAST(N'2021-02-21T18:01:36.397' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.397' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (108, N'Kỹ thuật cơ khí động lực', CAST(N'2021-02-21T18:01:36.440' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.440' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (109, N'Cơ kỹ thuật', CAST(N'2021-02-21T18:01:36.487' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.487' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (110, N'Kinh tế đối ngoại', CAST(N'2021-02-21T18:01:36.530' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.530' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (111, N'Kinh tế', CAST(N'2021-02-21T18:01:36.573' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.573' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (112, N'Hệ thống thông tin', CAST(N'2021-02-21T18:01:36.620' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.620' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (113, N'Kiểm toán', CAST(N'2021-02-21T18:01:36.660' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.660' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (114, N'Bảo hiểm', CAST(N'2021-02-21T18:01:36.707' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.707' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (115, N'Kinh doanh thương mại', CAST(N'2021-02-21T18:01:36.750' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.750' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (116, N'Khoa học quản lý', CAST(N'2021-02-21T18:01:36.793' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.793' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (117, N'Hệ thống thông tin quản lý', CAST(N'2021-02-21T18:01:36.837' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.837' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (118, N'Quản lý dự án', CAST(N'2021-02-21T18:01:36.880' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.880' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (119, N'Quan hệ lao động', CAST(N'2021-02-21T18:01:36.923' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.923' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (120, N'Quản lý công', CAST(N'2021-02-21T18:01:36.970' AS DateTime), NULL, CAST(N'2021-02-21T18:01:36.970' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (121, N'Quản trị nhân lực', CAST(N'2021-02-21T18:01:37.017' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.017' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (122, N'Quản trị văn phòng', CAST(N'2021-02-21T18:01:37.060' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.060' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (123, N'Kế toán', CAST(N'2021-02-21T18:01:37.103' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.103' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (124, N'Tài chính - Ngân hàng', CAST(N'2021-02-21T18:01:37.147' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.147' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (125, N'Kinh doanh quốc tế', CAST(N'2021-02-21T18:01:37.190' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.190' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (126, N'Marketing', CAST(N'2021-02-21T18:01:37.237' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.237' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (127, N'Bất động sản', CAST(N'2021-02-21T18:01:37.487' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.487' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (128, N'Thương mại điện tử', CAST(N'2021-02-21T18:01:37.530' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.530' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (129, N'Quản trị kinh doanh', CAST(N'2021-02-21T18:01:37.573' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.573' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (130, N'Kỹ thuật xây dựng', CAST(N'2021-02-21T18:01:37.617' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.617' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (131, N'Quản lý xây dựng', CAST(N'2021-02-21T18:01:37.657' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.657' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (132, N'Kinh tế xây dựng', CAST(N'2021-02-21T18:01:37.703' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.703' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (133, N'Quy hoạch vùng và đô thị', CAST(N'2021-02-21T18:01:37.747' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.747' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (134, N'Đô thị học', CAST(N'2021-02-21T18:01:37.790' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.790' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (135, N'Kỹ thuật cấp thoát nước', CAST(N'2021-02-21T18:01:37.833' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.833' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (136, N'Kỹ thuật tài nguyên nước', CAST(N'2021-02-21T18:01:37.880' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.880' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (137, N'Địa kỹ thuật xây dựng', CAST(N'2021-02-21T18:01:37.920' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.920' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (138, N'Kỹ thuật cơ sở hạ tầng', CAST(N'2021-02-21T18:01:37.967' AS DateTime), NULL, CAST(N'2021-02-21T18:01:37.967' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (139, N'Kỹ thuật xây dựng công trình giao thông', CAST(N'2021-02-21T18:01:38.007' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.007' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (140, N'Kỹ thuật xây dựng công trình biển', CAST(N'2021-02-21T18:01:38.053' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.053' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (141, N'Kỹ thuật xây dựng công trình thủy', CAST(N'2021-02-21T18:01:38.097' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.097' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (142, N'Thiết kế nội thất', CAST(N'2021-02-21T18:01:38.143' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.143' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (143, N'Kiến trúc cảnh quan', CAST(N'2021-02-21T18:01:38.187' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.187' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (144, N'Kiến trúc', CAST(N'2021-02-21T18:01:38.230' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.230' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (145, N'Đông Nam Á học', CAST(N'2021-02-21T18:01:38.277' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.277' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (146, N'Quốc tế học', CAST(N'2021-02-21T18:01:38.320' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.320' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (147, N'Toán kinh tế', CAST(N'2021-02-21T18:01:38.367' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.367' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (148, N'Thống kê Kinh tế', CAST(N'2021-02-21T18:01:38.423' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.423' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (149, N'Kinh tế Chính trị', CAST(N'2021-02-21T18:01:38.470' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.470' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (150, N'Nhân học', CAST(N'2021-02-21T18:01:38.527' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.527' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (151, N'Xã hội học', CAST(N'2021-02-21T18:01:38.573' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.573' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (152, N'Tâm lý học giáo dục', CAST(N'2021-02-21T18:01:38.620' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.620' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (153, N'Tâm lý học', CAST(N'2021-02-21T18:01:38.677' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.677' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (154, N'Kinh tế quốc tế', CAST(N'2021-02-21T18:01:38.747' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.747' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (155, N'Kinh tế phát triển', CAST(N'2021-02-21T18:01:38.810' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.810' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (156, N'Kinh tế đầu tư', CAST(N'2021-02-21T18:01:38.857' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.857' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (157, N'Hàn Quốc học', CAST(N'2021-02-21T18:01:38.910' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.910' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (158, N'Nhật Bản học', CAST(N'2021-02-21T18:01:38.977' AS DateTime), NULL, CAST(N'2021-02-21T18:01:38.977' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (159, N'Việt Nam học', CAST(N'2021-02-21T18:01:39.050' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.050' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (160, N'Đông phương học', CAST(N'2021-02-21T18:01:39.107' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.107' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (161, N'Xây dựng Đảng và chính quyền nhà nước', CAST(N'2021-02-21T18:01:39.153' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.153' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (162, N'Quan hệ quốc tế', CAST(N'2021-02-21T18:01:39.220' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.220' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (163, N'Quản lý nhà nước', CAST(N'2021-02-21T18:01:39.290' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.290' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (164, N'Chính trị học', CAST(N'2021-02-21T18:01:39.350' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.350' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (165, N'Địa lý học', CAST(N'2021-02-21T18:01:39.397' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.397' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (166, N'Khoa học vật liệu', CAST(N'2021-02-21T18:01:39.450' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.450' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (167, N'Hóa học', CAST(N'2021-02-21T18:01:39.520' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.520' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (168, N'Cơ học', CAST(N'2021-02-21T18:01:39.590' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.590' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (169, N'Vật lý nguyên tử và hạt nhân', CAST(N'2021-02-21T18:01:39.640' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.640' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (170, N'Vật lý học', CAST(N'2021-02-21T18:01:39.687' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.687' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (171, N'Thiên văn học', CAST(N'2021-02-21T18:01:39.750' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.750' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (172, N'Hải dương học', CAST(N'2021-02-21T18:01:39.823' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.823' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (173, N'Thủy văn học', CAST(N'2021-02-21T18:01:39.880' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.880' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (174, N'Khí tượng và khí hậu học', CAST(N'2021-02-21T18:01:39.927' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.927' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (175, N'Địa lý tự nhiên', CAST(N'2021-02-21T18:01:39.980' AS DateTime), NULL, CAST(N'2021-02-21T18:01:39.980' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (176, N'Địa chất học', CAST(N'2021-02-21T18:01:40.047' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.047' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (177, N'Bản đồ học', CAST(N'2021-02-21T18:01:40.113' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.113' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (178, N'Khoa học môi trường', CAST(N'2021-02-21T18:01:40.163' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.163' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (179, N'Kỹ thuật sinh học', CAST(N'2021-02-21T18:01:40.207' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.207' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (180, N'Sinh học ứng dụng', CAST(N'2021-02-21T18:01:40.273' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.273' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (181, N'Công nghệ sinh học', CAST(N'2021-02-21T18:01:40.347' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.347' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (182, N'Sinh học', CAST(N'2021-02-21T18:01:40.403' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.403' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (183, N'Quản lý thể dục thể thao', CAST(N'2021-02-21T18:01:40.453' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.453' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (184, N'Quản trị nhà hàng và dịch vụ ăn uống', CAST(N'2021-02-21T18:01:40.507' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.507' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (185, N'Quản trị khách sạn', CAST(N'2021-02-21T18:01:40.573' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.573' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (186, N'Kinh tế gia đình', CAST(N'2021-02-21T18:01:40.647' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.647' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (187, N'Y sinh học thể dục thể thao', CAST(N'2021-02-21T18:01:40.703' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.703' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (188, N'Quản trị dịch vụ du lịch và lữ hành', CAST(N'2021-02-21T18:01:40.750' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.750' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (189, N'Du lịch', CAST(N'2021-02-21T18:01:40.810' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.810' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (190, N'Công tác thanh thiếu niên', CAST(N'2021-02-21T18:01:40.877' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.877' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (191, N'Công tác xã hội', CAST(N'2021-02-21T18:01:40.940' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.940' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (192, N'Khoa học hàng hải', CAST(N'2021-02-21T18:01:40.990' AS DateTime), NULL, CAST(N'2021-02-21T18:01:40.990' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (193, N'Kinh tế vận tải', CAST(N'2021-02-21T18:01:41.040' AS DateTime), NULL, CAST(N'2021-02-21T18:01:41.040' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (194, N'Quản lý hoạt động bay', CAST(N'2021-02-21T18:01:41.130' AS DateTime), NULL, CAST(N'2021-02-21T18:01:41.130' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (195, N'Khai thác vận tải', CAST(N'2021-02-21T18:01:41.203' AS DateTime), NULL, CAST(N'2021-02-21T18:01:41.203' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (196, N'Robot và Trí tuệ nhân tạo', CAST(N'2021-02-21T18:01:41.263' AS DateTime), NULL, CAST(N'2021-02-21T18:01:41.263' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (197, N'Công nghệ kỹ thuật điện, điện tử', CAST(N'2021-02-21T18:01:41.330' AS DateTime), NULL, CAST(N'2021-02-21T18:01:41.330' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (198, N'Kỹ thuật in', CAST(N'2021-02-21T18:01:41.407' AS DateTime), NULL, CAST(N'2021-02-21T18:01:41.407' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (199, N'Công nghệ kỹ thuật ô tô', CAST(N'2021-02-21T18:01:41.477' AS DateTime), NULL, CAST(N'2021-02-21T18:01:41.477' AS DateTime), NULL, 1)
INSERT [dbo].[Major] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (200, N'Kỹ thuật tàu thuỷ', CAST(N'2021-02-21T18:01:41.523' AS DateTime), NULL, CAST(N'2021-02-21T18:01:41.523' AS DateTime), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[MedicalCategory] ON 

INSERT [dbo].[MedicalCategory] ([ID], [Name]) VALUES (1, N'Dụng cụ cấp cứu')
INSERT [dbo].[MedicalCategory] ([ID], [Name]) VALUES (2, N'Dụng cụ thăm khám')
INSERT [dbo].[MedicalCategory] ([ID], [Name]) VALUES (3, N'Dụng cụ phẫu thuật')
INSERT [dbo].[MedicalCategory] ([ID], [Name]) VALUES (4, N'Dụng cụ khác')
INSERT [dbo].[MedicalCategory] ([ID], [Name]) VALUES (5, N'Thuốc')
SET IDENTITY_INSERT [dbo].[MedicalCategory] OFF
SET IDENTITY_INSERT [dbo].[MedicalEquipment] ON 

INSERT [dbo].[MedicalEquipment] ([ID], [Name], [Uses], [Unit], [Amount], [ManufacturingDate], [ExpiryDate], [CategoryID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Bông băng', N'Băng viết thương, giữ máu. Bảo vệ khỏi vi khuẩn và vi trùng', N'cái', 10, CAST(N'2021-04-02T00:00:00.000' AS DateTime), CAST(N'2039-04-01T00:00:00.000' AS DateTime), 4, CAST(N'2021-04-04T15:43:55.247' AS DateTime), NULL, CAST(N'2021-04-04T15:53:06.697' AS DateTime), N'Trương Nguyễn Khánh', 0)
INSERT [dbo].[MedicalEquipment] ([ID], [Name], [Uses], [Unit], [Amount], [ManufacturingDate], [ExpiryDate], [CategoryID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Thuốc đỏ', N'Vệ sinh vết thương, khử trùng', N'chai', 2, CAST(N'2021-04-02T00:00:00.000' AS DateTime), CAST(N'2039-04-01T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-04T15:41:08.000' AS DateTime), NULL, CAST(N'2021-04-04T15:41:08.000' AS DateTime), N'Trương Nguyễn Khánh', 0)
INSERT [dbo].[MedicalEquipment] ([ID], [Name], [Uses], [Unit], [Amount], [ManufacturingDate], [ExpiryDate], [CategoryID], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Cồn 90 độ', N'Vệ sinh vết thương', N'chai', 2, CAST(N'2021-04-22T00:00:00.000' AS DateTime), CAST(N'2026-04-23T00:00:00.000' AS DateTime), 1, CAST(N'2021-04-04T15:50:16.177' AS DateTime), NULL, CAST(N'2021-04-04T15:50:16.177' AS DateTime), N'Trương Nguyễn Khánh', 0)
SET IDENTITY_INSERT [dbo].[MedicalEquipment] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [Date], [MorningTapas], [MorningFry], [MorningSoup], [Brunch1], [Brunch2], [NoonTapas], [NoonFry], [NoonSoup], [Tea1], [Tea2], [AfternoonTapas], [AfternoonFry], [AfternoonSoup], [Dinner1], [Dinner2], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, CAST(N'2021-03-03T00:00:00.000' AS DateTime), 3, 4, 1, 1002, 1003, 6, 7, 5, 1004, 1005, 8, 9, 10, 1006, 1007, N'Không có', CAST(N'2021-04-01T10:17:19.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[Menu] ([ID], [Date], [MorningTapas], [MorningFry], [MorningSoup], [Brunch1], [Brunch2], [NoonTapas], [NoonFry], [NoonSoup], [Tea1], [Tea2], [AfternoonTapas], [AfternoonFry], [AfternoonSoup], [Dinner1], [Dinner2], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, CAST(N'2021-03-04T00:00:00.000' AS DateTime), 8, 9, 10, 1002, 1003, 6, 7, 5, 1004, 1005, 8, 4, 1, 1008, 1007, N'Không có ghi chú đặc biệt!', CAST(N'2021-04-24T15:15:15.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([ID], [ReceivePayAccountID], [Date], [ReceivePayID], [Amount], [AmountText], [Code], [ReceivePayObjectID], [Phone], [IDNo], [DateOfIssue], [PlaceOfIssue], [AccountNo], [AtBank], [Note], [FinancialPaper], [Reason], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, 1, CAST(N'2021-02-25T16:57:26.810' AS DateTime), 3, CAST(5000 AS Decimal(11, 0)), N'Năm ngàn', N'PC/0221/00001', 1002, N'0925322618', N'12391824940', CAST(N'2000-01-15T00:00:00.000' AS DateTime), N'Hồ Chí Minh', N'123849238', 1, N'Không có', N'Không có', NULL, N'Ngọc Trai Núi', CAST(N'2021-02-25T16:57:26.810' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-25T16:57:26.810' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Payment] ([ID], [ReceivePayAccountID], [Date], [ReceivePayID], [Amount], [AmountText], [Code], [ReceivePayObjectID], [Phone], [IDNo], [DateOfIssue], [PlaceOfIssue], [AccountNo], [AtBank], [Note], [FinancialPaper], [Reason], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, 2, CAST(N'2021-02-25T19:10:20.450' AS DateTime), 3, CAST(5000 AS Decimal(11, 0)), N'Năm ngàn', N'PC/0221/00002', 2002, N'0925322618', N'12391824940', CAST(N'2000-01-15T00:00:00.000' AS DateTime), N'Hồ Chí Minh', N'123849238', 2, N'Không có', N'Không có', NULL, N'Ngọc Trai Núi', CAST(N'2021-02-25T19:10:20.450' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-25T19:10:20.450' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Payment] ([ID], [ReceivePayAccountID], [Date], [ReceivePayID], [Amount], [AmountText], [Code], [ReceivePayObjectID], [Phone], [IDNo], [DateOfIssue], [PlaceOfIssue], [AccountNo], [AtBank], [Note], [FinancialPaper], [Reason], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, 1, CAST(N'2021-02-26T00:00:00.000' AS DateTime), 4, CAST(10000 AS Decimal(11, 0)), N'Năm ngàn', N'PC/0221/00003', 1002, N'0925322618', N'12391824940', CAST(N'2000-01-15T00:00:00.000' AS DateTime), N'Hồ Chí Minh', N'123849238', 3, N'Không có', N'Không có', NULL, N'Long Xuyên', CAST(N'2021-02-26T12:52:49.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-26T12:57:16.207' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Payment] ([ID], [ReceivePayAccountID], [Date], [ReceivePayID], [Amount], [AmountText], [Code], [ReceivePayObjectID], [Phone], [IDNo], [DateOfIssue], [PlaceOfIssue], [AccountNo], [AtBank], [Note], [FinancialPaper], [Reason], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, 1, CAST(N'2021-02-26T00:00:00.000' AS DateTime), 4, CAST(10000 AS Decimal(11, 0)), N'Năm ngàn', N'PC/0221/00004', 2002, N'0925322618', N'12391824940', CAST(N'2000-01-15T00:00:00.000' AS DateTime), N'Hồ Chí Minh', N'123849238', 4, N'Không có', N'Không có', NULL, N'Long Xuyên', CAST(N'2021-02-26T12:57:34.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-26T12:57:16.207' AS DateTime), N'Trương Nguyễn Khánh', 0)
INSERT [dbo].[Payment] ([ID], [ReceivePayAccountID], [Date], [ReceivePayID], [Amount], [AmountText], [Code], [ReceivePayObjectID], [Phone], [IDNo], [DateOfIssue], [PlaceOfIssue], [AccountNo], [AtBank], [Note], [FinancialPaper], [Reason], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, 1, CAST(N'2021-03-19T00:00:00.000' AS DateTime), 5, CAST(2000 AS Decimal(11, 0)), NULL, N'PC/0321/00005', 1002, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, N'Long Xuyên', CAST(N'2021-03-10T21:45:15.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T12:36:59.867' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Payment] ([ID], [ReceivePayAccountID], [Date], [ReceivePayID], [Amount], [AmountText], [Code], [ReceivePayObjectID], [Phone], [IDNo], [DateOfIssue], [PlaceOfIssue], [AccountNo], [AtBank], [Note], [FinancialPaper], [Reason], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, 1, CAST(N'2021-03-18T00:00:00.000' AS DateTime), 1005, CAST(3 AS Decimal(11, 0)), N'Năm ngàn', N'PC/0321/00006', 2002, N'0925322618', N'12391824940', CAST(N'2000-01-15T00:00:00.000' AS DateTime), N'Hồ Chí Minh', N'123849238', 6, N'Không có', N'Không có', NULL, N'Hà Nội', CAST(N'2021-03-10T21:47:53.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-26T12:57:16.207' AS DateTime), N'Trương Nguyễn Khánh', 0)
INSERT [dbo].[Payment] ([ID], [ReceivePayAccountID], [Date], [ReceivePayID], [Amount], [AmountText], [Code], [ReceivePayObjectID], [Phone], [IDNo], [DateOfIssue], [PlaceOfIssue], [AccountNo], [AtBank], [Note], [FinancialPaper], [Reason], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1009, 1, CAST(N'2021-04-24T00:00:00.000' AS DateTime), 1007, CAST(1000000 AS Decimal(11, 0)), NULL, N'PC/0421/00007', 1002, NULL, NULL, NULL, NULL, NULL, 0, N'Không có ghi chú đặc biệt!', NULL, N'Biếu tặng', N'643/24/3C Xô Viết Nghệ Tĩnh', CAST(N'2021-04-24T15:10:42.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Payment] OFF
SET IDENTITY_INSERT [dbo].[ProfessionalQualification] ON 

INSERT [dbo].[ProfessionalQualification] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'Sơ cấp', CAST(N'2021-02-21T17:12:27.513' AS DateTime), NULL, CAST(N'2021-02-21T17:12:27.513' AS DateTime), NULL, 1)
INSERT [dbo].[ProfessionalQualification] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'Trung cấp', CAST(N'2021-02-21T17:12:34.527' AS DateTime), NULL, CAST(N'2021-02-21T17:12:34.527' AS DateTime), NULL, 1)
INSERT [dbo].[ProfessionalQualification] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Cao đẳng', CAST(N'2021-02-21T17:12:44.940' AS DateTime), NULL, CAST(N'2021-02-21T17:12:44.940' AS DateTime), NULL, 1)
INSERT [dbo].[ProfessionalQualification] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Cử nhân đại học', CAST(N'2021-02-21T17:12:53.267' AS DateTime), NULL, CAST(N'2021-02-21T17:12:53.267' AS DateTime), NULL, 1)
INSERT [dbo].[ProfessionalQualification] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Thạc sĩ', CAST(N'2021-02-21T17:12:59.617' AS DateTime), NULL, CAST(N'2021-02-21T17:12:59.617' AS DateTime), NULL, 1)
INSERT [dbo].[ProfessionalQualification] ([ID], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'Tiến sĩ', CAST(N'2021-02-21T17:13:04.903' AS DateTime), NULL, CAST(N'2021-02-21T17:13:04.903' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[ProfessionalQualification] OFF
SET IDENTITY_INSERT [dbo].[Quote] ON 

INSERT [dbo].[Quote] ([ID], [Code], [Name], [Quote1], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Language]) VALUES (2, N' LAMLD160321', N'Lý Diệp Lam', N'Hôm nay em được ăn cá điêu hồng chiên xù, em vui lắm ạ!', N'~/Assets/admin/img/doraemon.png', CAST(N'2020-10-03T12:50:49.400' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-16T22:19:38.817' AS DateTime), N'Trương Nguyễn Khánh', 1, N'1')
INSERT [dbo].[Quote] ([ID], [Code], [Name], [Quote1], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Language]) VALUES (3, N' HIEULT160321', N'Lê Trung Hiếu', N'Hôm nay em được đi thả diều, diều bay cô dứt dây em buồn lắm!', N'~/Assets/admin/img/doraemon.png', CAST(N'2020-10-03T12:51:22.923' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-16T22:19:34.987' AS DateTime), N'Trương Nguyễn Khánh', 1, N'1')
INSERT [dbo].[Quote] ([ID], [Code], [Name], [Quote1], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Language]) VALUES (4, N' TUNGNS160321', N'Nguyễn Sơn Tùng', N'Hôm nay em được cô cho điểm 10 môn Văn, em rất tự hào!', N'~/Assets/admin/img/doraemon.png', CAST(N'2020-10-03T12:52:21.237' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-16T22:19:29.580' AS DateTime), N'Trương Nguyễn Khánh', 1, N'1')
INSERT [dbo].[Quote] ([ID], [Code], [Name], [Quote1], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Language]) VALUES (5, N' NAMNT160321', N'Nguyễn Trung Nam', N'Hôm nay em đến trường, mẹ dắt em từ bước!', N'~/Assets/admin/img/doraemon.png', CAST(N'2020-10-03T12:52:47.617' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-16T22:19:25.120' AS DateTime), N'Trương Nguyễn Khánh', 1, N'1')
INSERT [dbo].[Quote] ([ID], [Code], [Name], [Quote1], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Language]) VALUES (6, N' TIENBLT160321', N'Bạch Lê Tần Tiến', N'Hôm nay mẹ lên hướng một mình em đến lớp!', N'~/Assets/admin/img/doraemon.png', CAST(N'2020-10-03T12:52:56.693' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-16T22:40:48.923' AS DateTime), N'Trương Nguyễn Khánh', 1, N'1')
INSERT [dbo].[Quote] ([ID], [Code], [Name], [Quote1], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Language]) VALUES (1018, N' THANHVT300321', N'Võ Trúc Thanh', N'Hôm nay em được học vẽ Doraemon, một nhân vật mà em rất thích! Em vui lắm ạ!', N'~/Data/images/Quote/nobita215800134.png', CAST(N'2021-03-18T11:43:42.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-30T22:58:00.190' AS DateTime), N'Trương Nguyễn Khánh', 1, NULL)
INSERT [dbo].[Quote] ([ID], [Code], [Name], [Quote1], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Language]) VALUES (1019, N' KHANHTN300321', N'Trương Nguyễn Khánh', N'Hôm nay em được học vẽ Doraemon, một nhân vật mà em rất thích! Em vui lắm ạ!', N'~/Data/images/Quote/doraemon215634647.png', CAST(N'2021-03-18T11:49:25.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-30T22:56:34.713' AS DateTime), N'Trương Nguyễn Khánh', 1, NULL)
INSERT [dbo].[Quote] ([ID], [Code], [Name], [Quote1], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Language]) VALUES (2011, N' THANHVT300321', N'Võ Trúc Thanh', N'Hôm nay em được học vẽ Doraemon, một nhân vật mà em rất thích! Em vui lắm ạ!', N'~/Data/images/Quote/rsz_16 (1)213157337.png', CAST(N'2021-03-30T16:47:30.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-30T21:31:57.703' AS DateTime), N'Trương Nguyễn Khánh', 1, NULL)
INSERT [dbo].[Quote] ([ID], [Code], [Name], [Quote1], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [Language]) VALUES (2012, N' AIVEV220421', N'Vì Em Vì Ai', N'Hôm nay em được học vẽ Doraemon, một nhân vật mà em rất thích! Em vui lắm ạ!', N'~/Data/images/Quote/rsz_241215539627.png', CAST(N'2021-03-30T22:34:28.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-22T19:12:52.993' AS DateTime), N'Trương Khánh', 0, NULL)
SET IDENTITY_INSERT [dbo].[Quote] OFF
SET IDENTITY_INSERT [dbo].[Receipt] ON 

INSERT [dbo].[Receipt] ([ID], [ReceivePayAccountID], [Date], [ReceivePayID], [Amount], [AmountText], [Code], [ReceivePayObjectID], [Phone], [IDNo], [DateOfIssue], [PlaceOfIssue], [AccountNo], [AtBank], [FinancialPaper], [Note], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, 1, CAST(N'2021-02-26T00:00:00.000' AS DateTime), 5, CAST(10000 AS Decimal(11, 0)), NULL, N'PT/0221/00004', 1002, NULL, N'1200209474120', CAST(N'2017-03-31T00:00:00.000' AS DateTime), N'Sacombank Bình Thạnh', N'1352902878390', 1, N'Không có', N'Không có', N'Long Xuyên', CAST(N'2021-02-26T02:50:20.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-26T12:34:38.320' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Receipt] ([ID], [ReceivePayAccountID], [Date], [ReceivePayID], [Amount], [AmountText], [Code], [ReceivePayObjectID], [Phone], [IDNo], [DateOfIssue], [PlaceOfIssue], [AccountNo], [AtBank], [FinancialPaper], [Note], [Address], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2006, 2, CAST(N'2021-03-13T00:00:00.000' AS DateTime), 1005, CAST(200000 AS Decimal(11, 0)), N'Hai trăm ngàn', N'PT/0321/00005', 2002, N'0192847909', N'1902092874092', CAST(N'2021-04-10T00:00:00.000' AS DateTime), N'An Giang', N'109920918902', 17, N'Không có', NULL, N'141 Điện Biên Phủ', CAST(N'2021-03-31T11:29:37.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T11:37:25.637' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[Receipt] OFF
SET IDENTITY_INSERT [dbo].[ReceivePay] ON 

INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'Được tặng/cho', 1, N'Khách viếng thăm cho tặng', CAST(N'2021-02-25T14:57:24.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-24T15:08:43.623' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'Internet', 0, N'Tiền mạng wifi', CAST(N'2021-02-25T14:58:09.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'Lương nhân viên', 0, N'Trả tiền lương cho nhân viên', CAST(N'2021-02-25T14:58:56.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1005, N'Bán hàng', 1, N'Buôn bán có lời', CAST(N'2021-02-26T13:00:24.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1006, N'Nguồn thu khác', 1, N'giải thưởng, khen tặng,...', CAST(N'2021-02-26T13:00:39.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-24T15:08:31.803' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1007, N'Biếu tặng', 0, N'Tặng quà cho một ai đó', CAST(N'2021-02-26T13:01:12.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1008, N'Công tác phí', 0, N'Công tác phí của nhân viên', CAST(N'2021-02-26T13:01:29.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1009, N'Điện', 0, N'Tiền điện hằng tháng', CAST(N'2021-02-26T13:01:46.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1010, N'Điện thoại di động', 0, N'Tiền gọi điện thoại di động', CAST(N'2021-02-26T13:02:00.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1011, N'Du lịch', 0, N'Chi phí du lịch, vui chơi', CAST(N'2021-02-26T13:02:13.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1012, N'Mua sắm đồ đạt', 0, N'Mua sắm quần áo, nồi nêu,....', CAST(N'2021-02-26T13:02:26.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[ReceivePay] ([ID], [Name], [ReceivableIsTrue], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2005, N'Tiền chợ', 0, N'Đi chợ mua đồ ăn', CAST(N'2021-03-30T16:59:53.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ReceivePay] OFF
SET IDENTITY_INSERT [dbo].[ReceivePayAccount] ON 

INSERT [dbo].[ReceivePayAccount] ([ID], [Code], [Name], [CurrencyID], [Original], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'QTM', N'Quỹ tiền mặt', 1, CAST(10000 AS Decimal(11, 0)), NULL, CAST(N'2021-02-25T16:17:09.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[ReceivePayAccount] ([ID], [Code], [Name], [CurrencyID], [Original], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'TKNH', N'Tài khoản ngân hàng', 1, CAST(10000 AS Decimal(11, 0)), NULL, CAST(N'2021-02-25T18:49:24.907' AS DateTime), NULL, CAST(N'2021-02-25T18:49:24.907' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[ReceivePayAccount] OFF
SET IDENTITY_INSERT [dbo].[ReceivePayObject] ON 

INSERT [dbo].[ReceivePayObject] ([ID], [Code], [Name], [AffiliatedUnit], [Address], [Phone], [Fax], [Website], [Email], [BankingNumber], [BankID], [HolderName], [CategoryID], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1002, N' XUYENCTTL', N'CÔNG TY TNHH LONG XUYÊN', N'Trường Mái Ấm', N'298 Long Xuyên', N'0928192093', N'11111', N'khanhtn.com', N'khanhtn@gmail.com', N'000192091098', 13, N'1014', 2, N'Không có ghi chú gì đặc biệt!', CAST(N'2021-02-25T08:37:42.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-22T10:59:56.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[ReceivePayObject] ([ID], [Code], [Name], [AffiliatedUnit], [Address], [Phone], [Fax], [Website], [Email], [BankingNumber], [BankID], [HolderName], [CategoryID], [Note], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2002, N' KHANHT', N'Trương Khánh', N'Trường Mái Ấm', N'643/24/3C Xô Viết Nghệ Tĩnh', N'0925322618', N'11111', N'khanhtn.com', N'textcenter@gmail.com', N'09182920192', 18, N'Khánh', 2, N'Gì đó', CAST(N'2021-03-30T16:57:48.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-30T17:01:43.797' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[ReceivePayObject] OFF
SET IDENTITY_INSERT [dbo].[ReceivePayObjectCategory] ON 

INSERT [dbo].[ReceivePayObjectCategory] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'NV', N'Nhân viên', CAST(N'2021-02-25T08:36:33.197' AS DateTime), NULL, CAST(N'2021-02-25T08:36:33.197' AS DateTime), NULL, 1)
INSERT [dbo].[ReceivePayObjectCategory] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'KH', N'Khách hàng', CAST(N'2021-02-25T08:36:53.897' AS DateTime), NULL, CAST(N'2021-02-25T08:36:53.897' AS DateTime), NULL, 1)
INSERT [dbo].[ReceivePayObjectCategory] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'DT', N'Đối tác', CAST(N'2021-02-25T08:36:58.820' AS DateTime), NULL, CAST(N'2021-02-25T08:36:58.820' AS DateTime), NULL, 1)
INSERT [dbo].[ReceivePayObjectCategory] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'NN', N'Người nhà', CAST(N'2021-02-25T08:37:02.440' AS DateTime), NULL, CAST(N'2021-02-25T08:37:02.440' AS DateTime), NULL, 1)
INSERT [dbo].[ReceivePayObjectCategory] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N'TE', N'Trẻ em', CAST(N'2021-02-25T08:37:17.660' AS DateTime), NULL, CAST(N'2021-02-25T08:37:17.660' AS DateTime), NULL, 1)
INSERT [dbo].[ReceivePayObjectCategory] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, N'NB', N'Nội bộ', CAST(N'2021-02-25T08:37:26.253' AS DateTime), NULL, CAST(N'2021-02-25T08:37:26.253' AS DateTime), NULL, 1)
INSERT [dbo].[ReceivePayObjectCategory] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, N'K', N'Khác', CAST(N'2021-02-25T08:37:31.533' AS DateTime), NULL, CAST(N'2021-02-25T08:37:31.533' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[ReceivePayObjectCategory] OFF
SET IDENTITY_INSERT [dbo].[Regulation] ON 

INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (0, N'NQ01', N'Giờ giấc chỉnh sửa', N'8h30 đọc kinh tối 9h45 đóng cổng tối. Những người đi làm trễ (Đạt, Hương, Phương, Ân)sẽ được phát chìa khoá.', CAST(N'2020-09-24T21:53:42.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-30T16:12:55.353' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (3, N'NQ02', N'Quần áo nghiêm chỉnh, tác phong đúng đắn', N'đi học về đồ dơ bỏ giặt, quần áo sau khi phát xếp ngăn nắp gọn gàng.', CAST(N'2020-10-02T18:58:23.170' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T18:58:23.170' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (5, N'NQ03', N'Giầy dép để đúng nơi quy định', N'nếu không để đúng sau 3 lần nhắc nhở sẽ đem bỏ rác. Nhắc quá 3 lần sẽ họp cảnh cáo trước tập thể và nhờ chính quyền can thiệp.', CAST(N'2020-10-02T18:58:56.980' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T18:58:56.980' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (7, N'NQ04', N'Thực đẩy đủ các việc được giao như', N'dọn dẹp phòng, đi vệ sinh phải dội, tắm xong phải để quần áo vào sọt, sàn nhà luôn sạch và khô, rửa chén, quyét nhà.', CAST(N'2020-10-02T18:59:15.610' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T18:59:15.610' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (9, N'NQ05', N'Ba không', N'Không vẽ bậy lên tường, không đi chân đất ra đường, không mang dép trong nhà và lên lầu.', CAST(N'2020-10-02T18:59:43.837' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T18:59:43.837' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (11, N'NQ06', N'Quần áo nghiêm chỉnh', N'Quần áo sạch sẽ, đóng thùng ngăn nắp gọn gàng, không mặc đồ hở hang.', CAST(N'2020-10-02T19:00:17.293' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:00:17.293' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (12, N'NQ07', N'Không nấu ăn, không nhậu', N'Không nấu nướng ban đêm. Không tự ý tổ chức, tụ tập ăn nhậu ban đêm.', CAST(N'2020-10-02T19:00:46.297' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:00:46.297' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (14, N'NQ08', N'Không được vào phòng người khác', N'để sinh hoạt cá nhân.', CAST(N'2020-10-02T19:01:05.150' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:01:05.150' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (16, N'NQ09', N'Kính trên nhường dưới:', N'Biết vâng lời người lớn, ngoan ngoãn, lễ phép. Không sai khiến, chèn ép, bạo hành các em dưới mình (không sai các em phục vụ riêng cho bản thân mình).', CAST(N'2020-10-02T19:01:17.497' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:01:17.497' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (18, N'NQ10', N'Yêu thương phục vụ', N'Biết yêu thương nhau, không đánh nhau, cãi nhau, chửi thề, làm gương xấu, giúp đỡ lẫn nhau.', CAST(N'2020-10-02T19:01:31.880' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:01:31.880' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (19, N'NQ11', N'Đi thưa về trình', N'Đi học theo lịch, đi về cho đúng giờ. Trường hợp ngoại lệ phải báo với người lớn', CAST(N'2020-10-02T19:01:40.350' AS DateTime), N'Trương Nguyễn KhánhTrương Nguyễn Khánh', CAST(N'2020-10-02T19:01:40.350' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (20, N'NQ12', N'Minh bạch trong mọi vấn đề', N'Thông báo cho người quản lí biết nơi làm việc, giờ làm việc, lương….để có sự giám sát, tránh xảy ra tình trạng bị bóc lột sức lao động.', CAST(N'2020-10-02T19:01:48.813' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:01:48.813' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (21, N'NQ13', N'Không trộm cắp', N'hông được lục tủ, lấy đồ của nhau. Không được cậy ổ khoá, đập cửa.', CAST(N'2020-10-02T19:02:00.403' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:02:00.403' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (23, N'NQ14', N'Không làm các hành vi vi phạm pháp luật', N'Không thực hiện các hành vi dâm dục, Không tiếp tay thực hiện các hành vi phạm pháp luật như cầm giúp, giữ giùm, giao giúp bạn, người xa lạ các chất trái phép, vũ khí….', CAST(N'2020-10-02T19:02:17.760' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:02:17.760' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (24, N'HP01', N'Sau 3 lần nhắc nhở', N'sẽ họp cảnh cáo trước tập thể lần thứ 1, lần 2.', CAST(N'2020-10-02T19:04:47.150' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:04:47.150' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (25, N'HP02', N'Lần thứ 3', N'mời chính quyền chứng kiến, can thiệp.', CAST(N'2020-10-02T19:04:59.980' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:04:59.980' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (27, N'HP03', N' Sau những lần vi phạm', N'Sẽ giao cho cơ quan có thẩm quyền xử lí', CAST(N'2020-10-02T19:05:08.893' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-02T19:05:08.893' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
INSERT [dbo].[Regulation] ([ID], [Code], [Name], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [MetaKeyWords], [Status]) VALUES (28, N'HP04', N'Đủ tuổi tự chịu trách nhiệm', N'Những điều làm trái pháp luật thì CÁ NHÂN đủ tuổi theo pháp luật quy đinh phải tự chịu trách nhiệm. Mái ấm không bảo lãnh, không đóng phạt….và những gì liên quan khi có vấn đề khác xảy ra.', CAST(N'2020-10-02T19:05:36.740' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:57:33.237' AS DateTime), N'Trương Nguyễn Khánh', NULL, 1)
SET IDENTITY_INSERT [dbo].[Regulation] OFF
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CREATE_ACTIVITY', N'Thêm bài viết')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CREATE_CHILDREN', N'Thêm mới trẻ em')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CREATE_CHILDRENCATEGORY', N'Thêm hoàn cảnh trẻ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CREATE_EMPLOYEE', N'Thêm tình nguyện viên')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CREATE_QUOTE', N'Thêm cảm nhận')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CREATE_USER', N'Thêm user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'CREATE_VOLUNTEER', N'Thêm tình nguyện viên')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_ACTIVITY', N'Xóa bài viết')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_CHILDREN', N'Xóa trẻ em')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_CHILDRENCATEGORY', N'Xóa hoàn cảnh trẻ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_EMPLOYEE', N'Xóa tình nguyện viên')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_QUOTE', N'Xóa cảm nhận')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_USER', N'Xóa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'DELETE_VOLUNTEER', N'Xóa tình nguyện viên')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_ACTIVITY', N'Xem danh sách bài viết')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_CHILDREN', N'Xem danh sách trẻ em')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_CHILDRENCATEGORY', N'Xem danh sách hoàn cảnh trẻ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_EMPLOYEE', N'Xem danh sách tình nguyện viên')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_EVENT', N'Xem danh sách sự kiện')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_HISTORY', N'Xem lịch sử hoạt động')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_QUOTE', N'Xem danh sách cảm nhận')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_REGULATION', N'Xem danh sách quy định')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_SE', N'Xem danh sách cơ sở vật chất')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_USER', N'Xem danh sách người dùng')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'READ_VOLUNTEER', N'Xem danh sách tình nguyện viên')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'UPDATE_ACTIVITY', N'Sửa bài viết')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'UPDATE_CHILDREN', N'Sửa trẻ em')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'UPDATE_CHILDRENCATEGORY', N'Sửa hoàn cảnh trẻ')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'UPDATE_EMPLOYEE', N'Sửa tình nguyện viên')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'UPDATE_QUOTE', N'Sửa cảm nhận')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'UPDATE_USER', N'Sửa user')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'UPDATE_VOLUNTEER', N'Sửa tình nguyện viên')
SET IDENTITY_INSERT [dbo].[SchoolReport] ON 

INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, 0, N'TH1', 1, CAST(N'2021-02-23T14:23:12.770' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:03:17.550' AS DateTime), NULL, 0)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, 0, N'THCS1', 2, CAST(N'2021-02-23T14:23:25.923' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-23T14:23:25.923' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, 0, N'THPT1', 3, CAST(N'2021-02-23T14:23:42.450' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-23T14:23:42.450' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, 1, N'TH2', 1, CAST(N'2021-02-23T14:23:12.770' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-23T14:23:12.770' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, 1, N'THCS2', 2, CAST(N'2021-02-23T14:23:25.923' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-23T14:23:25.923' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, 1, N'THPT2', 3, CAST(N'2021-02-23T14:23:42.450' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-23T14:23:42.450' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, 2, N'TH3', 1, CAST(N'2021-02-23T14:23:12.770' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T00:33:23.100' AS DateTime), NULL, 0)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, 2, N'THCS3', 2, CAST(N'2021-02-23T14:23:25.923' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-23T14:23:25.923' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, 2, N'THPT3', 3, CAST(N'2021-02-23T14:23:42.450' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:03:37.970' AS DateTime), NULL, 0)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2002, 2005, N'TH4', 1, CAST(N'2021-03-24T21:31:57.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3002, 3005, N'HOCBA', 2, CAST(N'2021-03-30T16:40:18.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[SchoolReport] ([ID], [ChildrenID], [Code], [Type], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3003, 2, N'NKH01', 1, CAST(N'2021-03-31T19:29:31.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[SchoolReport] OFF
SET IDENTITY_INSERT [dbo].[SchoolReportDetails] ON 

INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, 1, N'Tiểu học Hàm Nghi', N'Lớp 1', N'Trương Nguyễn Khánh', N'9.0', N'8.7', N'9', 1, N'zczxc', NULL, NULL, CAST(N'2020-10-19T14:30:17.130' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-19T14:30:17.130' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, 1, N'Tiểu học Hàm Nghi', N'Lớp 2', N'Trương Nguyễn Khánh', N'8', N'8.9', N'8.88', 2, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:01.307' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, 1, N'Tiểu học Hàm Nghi', N'Lớp 3', N'Trương Nguyễn Khánh', N'8', N'7.8', N'8.5', 3, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:02.770' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, 1, N'Tiểu học Hàm Nghi', N'Lớp 4', N'Trương Nguyễn Khánh', N'7', N'8.7', N'7.8', 6, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:04.390' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, 1, N'Tiểu học Hàm Nghi', N'Lớp 5', N'Trương Nguyễn Khánh', N'6', N'8.9', N'7.5', 8, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:05.163' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (6, 2, N'Trung học cơ sở Bình Khánh', N'Lớp 6', N'Trương Nguyễn Khánh', N'9', N'8.7', N'8.9', 5, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:05.907' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (7, 2, N'Trung học cơ sở Bình Khánh', N'Lớp 7', N'Trương Nguyễn Khánh', N'8', N'9.7', N'9.5', 1, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:07.223' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (9, 4, N'Tiểu học Hàm Nghi', N'Lớp 1', N'Trương Nguyễn Khánh', N'9.0', N'8.7', N'9', 1, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:52:24.357' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (10, 4, N'Tiểu học Hàm Nghi', N'Lớp 2', N'Trương Nguyễn Khánh', N'8', N'8.9', N'8.88', 2, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:01.307' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (11, 4, N'Tiểu học Hàm Nghi', N'Lớp 3', N'Trương Nguyễn Khánh', N'8', N'7.8', N'8.5', 3, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:02.770' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (12, 4, N'Tiểu học Hàm Nghi', N'Lớp 4', N'Trương Nguyễn Khánh', N'7', N'8.7', N'7.8', 6, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:04.390' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (13, 4, N'Tiểu học Hàm Nghi', N'Lớp 5', N'Trương Nguyễn Khánh', N'6', N'8.9', N'7.5', 8, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:05.163' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, 5, N'Trung học cơ sở Bình Khánh', N'Lớp 6', N'Trương Nguyễn Khánh', N'9', N'8.7', N'8.9', 5, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:05.907' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (15, 5, N'Trung học cơ sở Bình Khánh', N'Lớp 7', N'Trương Nguyễn Khánh', N'8', N'9.7', N'9.5', 1, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:07.223' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (16, 5, N'Trung học cơ sở Bình Khánh', N'Lớp 8', N'Trương Nguyễn Khánh', N'8', N'9', N'8.5', 4, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:07.840' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (17, 7, N'Tiểu học Hàm Nghi', N'Lớp 1', N'Trương Nguyễn Khánh', N'9.0', N'8.7', N'9', 1, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:52:56.570' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (18, 7, N'Tiểu học Hàm Nghi', N'Lớp 2', N'Trương Nguyễn Khánh', N'8', N'8.9', N'8.88', 2, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:01.307' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (19, 7, N'Tiểu học Hàm Nghi', N'Lớp 3', N'Trương Nguyễn Khánh', N'8', N'7.8', N'8.5', 3, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:02.770' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (20, 7, N'Tiểu học Hàm Nghi', N'Lớp 4', N'Trương Nguyễn Khánh', N'7', N'8.7', N'7.8', 6, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:04.390' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (21, 7, N'Tiểu học Hàm Nghi', N'Lớp 5', N'Trương Nguyễn Khánh', N'6', N'8.9', N'8.5', 8, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T00:20:09.767' AS DateTime), N'Trương Nguyễn Khánh', 0)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (22, 8, N'Trung học cơ sở Bình Khánh', N'Lớp 6', N'Trương Nguyễn Khánh', N'9', N'8.7', N'8.9', 5, N'Rất giỏi!', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-30T16:43:44.593' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (23, 8, N'Trung học cơ sở Bình Khánh', N'Lớp 7', N'Trương Nguyễn Khánh', N'8', N'9.7', N'9.5', 1, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:07.223' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (24, 8, N'Trung học cơ sở Bình Khánh', N'Lớp 8', N'Trương Nguyễn Khánh', N'8', N'9', N'8.5', 4, N'zczxc', NULL, NULL, CAST(N'2020-10-11T20:44:12.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-11T20:50:07.840' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (30, 3, N'Trung học phổ thông Long Xuyên', N'Lớp 10', N'Huỳnh Ngọc Ý Như', N'9.0', N'9.1', N'9.1', 1, N'Rất giỏi!', NULL, NULL, CAST(N'2021-02-24T00:37:02.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (31, 2, N'Trung học cơ sở Bình Khánh', N'Lớp 8', N'Lê Thị Ngọc Phượng', N'9.0', N'9.1', N'9.1', 1, N'Rất ngoan!', NULL, NULL, CAST(N'2021-02-24T00:38:04.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (32, 2, N'Trung học cơ sở Bình Khánh', N'Lớp 9', N'Lê Thị Ngọc Phượng', N'9.0', N'9.1', N'9.1', 1, N'Rất tốt bụng!', NULL, NULL, CAST(N'2021-02-24T00:38:42.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (33, 2003, N'Trung học cơ sở Bình Khánh', N'Lớp Test', N'Trương Nguyễn Khánh', N'9.0', N'9.0', N'9.0', 5, N'Không có!', NULL, NULL, CAST(N'2021-03-24T22:56:54.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (34, 2002, N'Tiểu học Hàm Nghi', N'Lớp 1', N'Trương Nguyễn Khánh', N'1.4', N'1.3', N'1.2', 7, N'b', NULL, NULL, CAST(N'2021-03-24T23:59:50.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1033, 8, N'Trung học cơ sở Bình Khánh', N'Lớp 9', N'Trương Nguyễn Khánh', N'8.3', N'8.3', N'8.3', 1, N'Gioi', NULL, NULL, CAST(N'2021-03-30T16:43:59.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[SchoolReportDetails] ([ID], [SchoolReportID], [SchoolName], [SchoolYear], [TeacherName], [Semester1], [Semester2], [FullYear], [Rating], [TeacherEvaluation], [Image], [MetaDescriptions], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1034, 3002, N'Trung học cơ sở Bình Khánh', N'Lớp 6', N'Trương Nguyễn Khánh', N'10', N'10', N'10', 10, N'giỏi', N'~/Data/files/[15.03.2021] BIÊN BẢN HỌP DỰ ÁN SAO HẢI VƯƠNG LẦN 1 - CUONGND213153527.pdf', NULL, CAST(N'2021-03-31T19:29:56.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-31T19:31:53.577' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[SchoolReportDetails] OFF
SET IDENTITY_INSERT [dbo].[SchoolReportType] ON 

INSERT [dbo].[SchoolReportType] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'TH', N'Tiểu học', CAST(N'2021-02-23T14:22:12.253' AS DateTime), NULL, CAST(N'2021-02-23T14:22:12.253' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportType] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'THCS', N'Trung học cơ sở', CAST(N'2021-02-23T14:22:20.340' AS DateTime), NULL, CAST(N'2021-02-23T14:22:20.340' AS DateTime), NULL, 1)
INSERT [dbo].[SchoolReportType] ([ID], [Code], [Name], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'THPT', N'Trung học phổ thông', CAST(N'2021-02-23T14:22:25.587' AS DateTime), NULL, CAST(N'2021-02-23T14:22:25.587' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[SchoolReportType] OFF
SET IDENTITY_INSERT [dbo].[SECategory] ON 

INSERT [dbo].[SECategory] ([ID], [Code], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, NULL, N'Ghế', N'Không có', CAST(N'2020-09-10T22:01:31.017' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-09-23T21:00:08.690' AS DateTime), N'Nguyễn Thị Mỹ Dung', 1)
INSERT [dbo].[SECategory] ([ID], [Code], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, NULL, N'Bàn', N'Không có', CAST(N'2020-09-10T22:01:31.440' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-09-23T21:00:05.310' AS DateTime), N'Nguyễn Thị Mỹ Dung', 1)
INSERT [dbo].[SECategory] ([ID], [Code], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'XEMAY', N'Xe máy', N'Không có', CAST(N'2020-09-10T22:01:31.480' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-24T19:40:27.363' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[SECategory] ([ID], [Code], [Name], [Description], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N'MTT', N'Máy trợ thở', N'Không có', CAST(N'2020-09-10T22:01:31.557' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-24T19:40:38.663' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[SECategory] OFF
SET IDENTITY_INSERT [dbo].[SocialInsurance] ON 

INSERT [dbo].[SocialInsurance] ([ID], [EmployeeID], [No], [RegisteredHospital], [BoughtDate], [EndDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (1, 8, N'CNO01239127', N'Hồ Chí Minh', CAST(N'2020-10-07T00:00:00.000' AS DateTime), CAST(N'2021-10-07T00:00:00.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-13T00:33:26.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-13T00:36:42.287' AS DateTime), 1)
INSERT [dbo].[SocialInsurance] ([ID], [EmployeeID], [No], [RegisteredHospital], [BoughtDate], [EndDate], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (2, 9, N'CNO01239127', N'Hồ Chí Minh', CAST(N'2020-10-16T00:00:00.000' AS DateTime), CAST(N'2020-10-16T00:00:00.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2020-10-13T00:51:34.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T02:58:59.497' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[SocialInsurance] OFF
SET IDENTITY_INSERT [dbo].[SuppliesEquipment] ON 

INSERT [dbo].[SuppliesEquipment] ([ID], [Code], [Name], [Number], [BrokenNumber], [Manager], [UsageHistory], [Description], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, NULL, N'Ghế', 50, 2, N'Phòng ăn', N'Sử dụng tại nhà ăn, phòng khách, phòng hồ sơ', N'Không có', N'/Data/images/SuppliesEquipment/gh%E1%BA%BF.png', NULL, N'Trương Nguyễn Khánh', CAST(N'2021-02-24T04:09:49.000' AS DateTime), NULL, 1)
INSERT [dbo].[SuppliesEquipment] ([ID], [Code], [Name], [Number], [BrokenNumber], [Manager], [UsageHistory], [Description], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, NULL, N'Bàn', 10, 0, N'Phòng Ngủ, Phòng ăn', N'Sử dụng tại nhà ăn, phòng ngủ, phòng hồ sơ, phòng khách', N'Không có', N'/Data/images/SuppliesEquipment/B%C3%A0n(1).jpg', NULL, N'Trương Nguyễn Khánh', CAST(N'2020-09-16T23:34:13.000' AS DateTime), NULL, 1)
INSERT [dbo].[SuppliesEquipment] ([ID], [Code], [Name], [Number], [BrokenNumber], [Manager], [UsageHistory], [Description], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, NULL, N'Xe máy', 2, 1, N'Hoàng Văn Hùng', N'Xe máy được giao cho Hùng đi lại và quản lý', N'Không có', N'/Data/images/SuppliesEquipment/Xe.jpg', NULL, N'Trương Nguyễn Khánh', CAST(N'2020-09-16T23:28:59.000' AS DateTime), NULL, 1)
INSERT [dbo].[SuppliesEquipment] ([ID], [Code], [Name], [Number], [BrokenNumber], [Manager], [UsageHistory], [Description], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, NULL, N'Máy trợ thở', 2, 0, N'Máy thở được đặt tại phong y tế
', N'Máy thở được đặt tại phong y tế', N'Không có', N'/Data/images/SuppliesEquipment/may-tro-tho-flight-60.png', NULL, N'Trương Nguyễn Khánh', CAST(N'2020-09-16T23:31:50.000' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[SuppliesEquipment] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (0, N'khanhtn18', N'fOIT9I/MCjxVc2Ih16dRBA==', N'ADMIN', N'Trương Nguyễn Khánh', N'643/24/3C Xô Viết Nghệ Tĩnh', N'khanhtn18@uef.edu.vn', N'0925322618', N'/Data/images/Employee/avatar.jpg', CAST(N'2020-09-08T22:00:06.150' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-03-01T15:34:06.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N'dungntm30', N'fOIT9I/MCjxVc2Ih16dRBA==', N'EMPLOYEE', N'Nguyễn Thị Mỹ Dung', N'141 Điện Biên Phủ', N'tungns18@uef.edu.vn', N'0192847909', N'/Data/images/Employee/Th%E1%BB%8B%20T%C3%A2m.jpg', CAST(N'2020-09-08T22:00:06.150' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-02-24T05:47:01.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N'admin', N'fOIT9I/MCjxVc2Ih16dRBA==', N'ADMIN', N'Trương Khánh', N'643/24/3C Xô Viết Nghệ Tĩnh', N'textcenter@gmail.com', N'0925322618', N'/Data/files/oic-1%20(2).png', CAST(N'2021-02-24T05:32:37.000' AS DateTime), N'Truong Nguy?n Khánh', CAST(N'2021-02-24T05:46:47.000' AS DateTime), N'Truong Nguy?n Khánh', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N'thaohc19', N'fOIT9I/MCjxVc2Ih16dRBA==', N'CHILDREN', N'Hà Công Thạo', N'643/24/3C Xô Viết Nghệ Tĩnh', N'textcenter1@gmail.com', N'0925322618', N'/Data/files/oic-1%20(2).png', CAST(N'2021-02-24T05:32:37.000' AS DateTime), N'Truong Nguy?n Khánh', CAST(N'2021-02-24T05:46:47.000' AS DateTime), N'Truong Nguy?n Khánh', 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (14, N'khanhtn19', N'fOIT9I/MCjxVc2Ih16dRBA==', N'EMPLOYEE', N'Trương Khánh', N'643/24/3C Xô Viết Nghệ Tĩnh', N'khanhtn19@gmail.com', N'0925322618', N'/Data/images/Employee/avatar%20(2).jpg', CAST(N'2021-04-21T15:48:07.000' AS DateTime), N'Trương Nguyễn Khánh', NULL, NULL, 1)
INSERT [dbo].[User] ([ID], [UserName], [Password], [GroupID], [Name], [Address], [Email], [Phone], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1015, N'khanht', N'fOIT9I/MCjxVc2Ih16dRBA==', N'CHILDREN', N'Trương  Khánh', NULL, N'', NULL, N'/Assets/admin/img/doraemon.png', CAST(N'2021-04-25T17:06:18.567' AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'ADMIN', N'Quản trị')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'EMPLOYEE', N'Nhân viên')
INSERT [dbo].[UserGroup] ([ID], [Name]) VALUES (N'CHILDREN', N'Trẻ em')
SET IDENTITY_INSERT [dbo].[Visitor] ON 

INSERT [dbo].[Visitor] ([ID], [Name], [VisitReason], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2062, N'Truong Nguy?n Khánh', N'Tôi là một sinh viên và tôi muốn hỗ trợ công sức của mình', N'0925322618', N'khanhtn18@gmail.com', CAST(N'2021-04-24T15:02:25.473' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-24T15:02:25.473' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Visitor] ([ID], [Name], [VisitReason], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2063, N'Võ Thanh Trúc', N'Tôi muốn hỗ trợ thiện nguyện với khả năng tin học của mình!', N'03820920192', N'trucvothanh040600@gmail.com', CAST(N'2021-04-24T15:03:03.670' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-24T15:03:03.670' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Visitor] ([ID], [Name], [VisitReason], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2064, N'Truong Lê Hùng', N'Tôi muốn quyên góp một số thức ăn và vật dụng!', N'09283909281', N'hungtl18@uef.edu.vn', CAST(N'2021-04-24T15:06:14.750' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-24T15:06:14.750' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[Visitor] ([ID], [Name], [VisitReason], [Phone], [Email], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2065, N'Nguy?n Thi?n Nhân', N'Tôi muốn hỗ trợ một vài thứ dụng cụ y tế!', N'092893029108', N'thiennhan@gmail.com', CAST(N'2021-04-24T15:06:47.640' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-24T15:06:47.640' AS DateTime), N'Trương Nguyễn Khánh', 1)
SET IDENTITY_INSERT [dbo].[Visitor] OFF
SET IDENTITY_INSERT [dbo].[Volunteer] ON 

INSERT [dbo].[Volunteer] ([ID], [Code], [IdentityCard], [Name], [DateOfBirth], [PlaceOfBirth], [Gender], [Image], [Phone], [Email], [Nationality], [Address], [OtherFoodExpenses], [WorkingHour], [OffHour], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (1, N' UYENNTT18081998', N'78689646', N'Nguyễn Thị Tú Uyên', CAST(N'1998-08-18T00:00:00.000' AS DateTime), N'An Giang', N'Nữ', N'/Data/images/Children/6.png', N'036045814', N'uyenntt@gmail.com', N'Việt Nam', N'Thiên chúa giáo', N'2500000', 8, 8, CAST(N'2020-09-09T16:10:56.000' AS DateTime), N'KTN', CAST(N'2021-03-19T23:45:49.567' AS DateTime), N'Trương Nguyễn Khánh', 0)
INSERT [dbo].[Volunteer] ([ID], [Code], [IdentityCard], [Name], [DateOfBirth], [PlaceOfBirth], [Gender], [Image], [Phone], [Email], [Nationality], [Address], [OtherFoodExpenses], [WorkingHour], [OffHour], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, N' DUNGNA18081998', N'65484565', N'Nguyễn Anh Dũng', CAST(N'1998-08-18T00:00:00.000' AS DateTime), N'An Giang', N'Nam', N'/Data/images/Children/DuyMinh.png', N'036045815', N'dungna@gmail.com', N'Việt Nam', N'45 đường số 7 quận Bình Tân, TP Hồ Chí Minh', N'2500000', 8, 8, CAST(N'2020-09-09T17:11:59.523' AS DateTime), N'KTN', CAST(N'2021-03-19T23:45:45.533' AS DateTime), N'Trương Nguyễn Khánh', 0)
INSERT [dbo].[Volunteer] ([ID], [Code], [IdentityCard], [Name], [DateOfBirth], [PlaceOfBirth], [Gender], [Image], [Phone], [Email], [Nationality], [Address], [OtherFoodExpenses], [WorkingHour], [OffHour], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, N' NGHING18081998', N'215656162', N'Nguyễn Gia Nghi', CAST(N'1998-08-18T00:00:00.000' AS DateTime), N'An Giang', N'Nữ', N'/Data/images/Children/NhatVi.png', N'036445468', N'nghing@gmail.com', N'Việt Nam', N'455 Lý Thái Tổ Quận 6 TP Hồ Chí Minh', N'2500000', 8, 8, CAST(N'2020-09-09T17:11:59.983' AS DateTime), N'KTN', CAST(N'2021-03-19T23:45:41.870' AS DateTime), N'Trương Nguyễn Khánh', 0)
INSERT [dbo].[Volunteer] ([ID], [Code], [IdentityCard], [Name], [DateOfBirth], [PlaceOfBirth], [Gender], [Image], [Phone], [Email], [Nationality], [Address], [OtherFoodExpenses], [WorkingHour], [OffHour], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (4, N' PHUCPT18081998', N'34645968', N'Phạm Thiên Phúc', CAST(N'1998-08-18T00:00:00.000' AS DateTime), N'An Giang', N'Nam', N'/Data/images/Children/HongPhuc.png', N'098909123', N'phucpt@gmail.com', N'Việt Nam', N'30 đường số 6 quận Bình Chánh, TP Hồ Chí Minh', N'2500000', 8, 8, CAST(N'2020-09-09T17:12:00.043' AS DateTime), N'KTN', CAST(N'2021-03-19T23:45:37.057' AS DateTime), N'Trương Nguyễn Khánh', 0)
INSERT [dbo].[Volunteer] ([ID], [Code], [IdentityCard], [Name], [DateOfBirth], [PlaceOfBirth], [Gender], [Image], [Phone], [Email], [Nationality], [Address], [OtherFoodExpenses], [WorkingHour], [OffHour], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, N' TAMNT18081998', N'354648956', N'Nguyễn Thanh Tâm', CAST(N'1998-08-18T00:00:00.000' AS DateTime), N'An Giang', N'Nam', N'/Data/images/Activity/1.jpg', N'025649846', N'tamntt@gmail.com', N'Việt Nam', N'3156 Điện Biên Phủ, Quận 3 TP Hồ Chí Minh', N'2500000', 8, 8, CAST(N'2020-09-09T17:12:00.097' AS DateTime), N'KTN', CAST(N'2021-03-31T13:50:24.210' AS DateTime), N'Trương Nguyễn Khánh', 0)
SET IDENTITY_INSERT [dbo].[Volunteer] OFF
SET IDENTITY_INSERT [dbo].[Volunteer_Event] ON 

INSERT [dbo].[Volunteer_Event] ([ID], [VolunteerID], [EventID], [StartDate], [EndDate], [Note], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (19, 3, 5, CAST(N'2021-03-24T16:14:29.807' AS DateTime), NULL, N'Chưa có ghi chú đặc biệt!', N'/Data/images/Children/NhatVi.png', N'Trương Nguyễn Khánh', CAST(N'2021-03-24T16:14:29.807' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Volunteer_Event] ([ID], [VolunteerID], [EventID], [StartDate], [EndDate], [Note], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (20, 2, 5, CAST(N'2021-03-24T16:24:32.680' AS DateTime), NULL, N'Chưa có ghi chú đặc biệt!', N'/Data/images/Children/DuyMinh.png', N'Trương Nguyễn Khánh', CAST(N'2021-03-24T16:24:32.680' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Volunteer_Event] ([ID], [VolunteerID], [EventID], [StartDate], [EndDate], [Note], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (21, 1, 5, CAST(N'2021-03-24T16:29:26.017' AS DateTime), NULL, N'Chưa có ghi chú đặc biệt!', N'/Data/images/Children/6.png', N'Trương Nguyễn Khánh', CAST(N'2021-03-24T16:29:26.017' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Volunteer_Event] ([ID], [VolunteerID], [EventID], [StartDate], [EndDate], [Note], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (1013, 5, 1006, CAST(N'2021-04-11T22:29:13.550' AS DateTime), NULL, N'Chưa có ghi chú đặc biệt!', N'/Data/images/Activity/1.jpg', N'Trương Nguyễn Khánh', CAST(N'2021-04-11T22:29:13.550' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Volunteer_Event] ([ID], [VolunteerID], [EventID], [StartDate], [EndDate], [Note], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (1014, 5, 5, CAST(N'2021-04-24T14:56:28.857' AS DateTime), NULL, N'Chưa có ghi chú đặc biệt!', N'/Data/images/Activity/1.jpg', N'Trương Nguyễn Khánh', CAST(N'2021-04-24T14:56:28.857' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Volunteer_Event] ([ID], [VolunteerID], [EventID], [StartDate], [EndDate], [Note], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (1015, 5, 2, CAST(N'2021-04-24T14:56:35.507' AS DateTime), NULL, N'Chưa có ghi chú đặc biệt!', N'/Data/images/Activity/1.jpg', N'Trương Nguyễn Khánh', CAST(N'2021-04-24T14:56:35.507' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Volunteer_Event] ([ID], [VolunteerID], [EventID], [StartDate], [EndDate], [Note], [Image], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Status]) VALUES (2014, 4, 1006, CAST(N'2021-04-25T14:07:47.363' AS DateTime), NULL, N'Chưa có ghi chú đặc biệt!', N'/Data/images/Children/HongPhuc.png', N'Trương Nguyễn Khánh', CAST(N'2021-04-25T14:07:47.363' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Volunteer_Event] OFF
SET IDENTITY_INSERT [dbo].[YellowBook] ON 

INSERT [dbo].[YellowBook] ([ID], [Date], [GiverName], [Phone], [Address], [ReceiverName], [ProductName1], [Amount1], [Unit1], [Price1], [ProductName2], [Unit2], [Amount2], [Price2], [ProductName3], [Amount3], [Unit3], [Price3], [TotalMoney], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (2, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'Trúc Võ', N'0192847909', N'643/24/3C Xô Viết Nghệ Tĩnh', N'Nguyễn Thị Cư', N'Sườn cốt lết', CAST(0.30 AS Decimal(11, 2)), N'kg', CAST(32300 AS Decimal(11, 0)), NULL, NULL, CAST(0.00 AS Decimal(11, 2)), CAST(0 AS Decimal(11, 0)), NULL, CAST(0.00 AS Decimal(11, 2)), NULL, CAST(0 AS Decimal(11, 0)), CAST(9690 AS Decimal(11, 0)), CAST(N'2021-04-04T18:48:29.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-04T19:55:36.557' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[YellowBook] ([ID], [Date], [GiverName], [Phone], [Address], [ReceiverName], [ProductName1], [Amount1], [Unit1], [Price1], [ProductName2], [Unit2], [Amount2], [Price2], [ProductName3], [Amount3], [Unit3], [Price3], [TotalMoney], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (3, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'Trương Khánh', N'0192847909', N'643/24/3C Xô Viết Nghệ Tĩnh', N'Khánh', N'Cánh gà', CAST(5.00 AS Decimal(11, 2)), N'cái', CAST(15000 AS Decimal(11, 0)), N'Sườn cốt lết', N'kg', CAST(0.30 AS Decimal(11, 2)), CAST(32000 AS Decimal(11, 0)), NULL, CAST(0.00 AS Decimal(11, 2)), NULL, CAST(0 AS Decimal(11, 0)), CAST(84600 AS Decimal(11, 0)), CAST(N'2021-04-04T20:01:55.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-04T20:06:52.520' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[YellowBook] ([ID], [Date], [GiverName], [Phone], [Address], [ReceiverName], [ProductName1], [Amount1], [Unit1], [Price1], [ProductName2], [Unit2], [Amount2], [Price2], [ProductName3], [Amount3], [Unit3], [Price3], [TotalMoney], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (5, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'Trương Khánh', N'0192847909', N'643/24/3C Xô Viết Nghệ Tĩnh', N'Nguyễn Thị Cư', N'Cánh gà', CAST(5.00 AS Decimal(11, 2)), N'cái', CAST(15000 AS Decimal(11, 0)), NULL, NULL, CAST(0.00 AS Decimal(11, 2)), CAST(0 AS Decimal(11, 0)), NULL, CAST(0.00 AS Decimal(11, 2)), NULL, CAST(0 AS Decimal(11, 0)), CAST(75000 AS Decimal(11, 0)), CAST(N'2021-04-04T18:48:29.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-04T18:48:29.000' AS DateTime), N'Trương Nguyễn Khánh', 1)
INSERT [dbo].[YellowBook] ([ID], [Date], [GiverName], [Phone], [Address], [ReceiverName], [ProductName1], [Amount1], [Unit1], [Price1], [ProductName2], [Unit2], [Amount2], [Price2], [ProductName3], [Amount3], [Unit3], [Price3], [TotalMoney], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status]) VALUES (8, CAST(N'2021-04-07T00:00:00.000' AS DateTime), N'Trương Hùng', N'0321648798', N'141 Điện Biên Phủ', N'Khánh', N'Cánh gà', CAST(3.00 AS Decimal(11, 2)), N'cái', CAST(12000 AS Decimal(11, 0)), N'Sườn cốt lết', N'kg', CAST(0.50 AS Decimal(11, 2)), CAST(15000 AS Decimal(11, 0)), N'Cá điêu hồng', CAST(0.50 AS Decimal(11, 2)), N'kg', CAST(32000 AS Decimal(11, 0)), CAST(59500 AS Decimal(11, 0)), CAST(N'2021-04-04T20:02:33.000' AS DateTime), N'Trương Nguyễn Khánh', CAST(N'2021-04-04T20:07:24.653' AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[YellowBook] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_User_Email]    Script Date: 04/25/2021 5:32:23 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ_User_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_User_UserName]    Script Date: 04/25/2021 5:32:23 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UQ_User_UserName] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Activity] ADD  CONSTRAINT [DF_Activity_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Bank] ADD  CONSTRAINT [DF_Bank_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Bank] ADD  CONSTRAINT [DF_Bank_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Bank] ADD  CONSTRAINT [DF_Bank_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Children] ADD  CONSTRAINT [DF_Children_Confirmation]  DEFAULT ((1)) FOR [Confirmation]
GO
ALTER TABLE [dbo].[Children] ADD  CONSTRAINT [DF_Children_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Children] ADD  CONSTRAINT [DF_Children_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Children] ADD  CONSTRAINT [DF_Children_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Children] ADD  CONSTRAINT [DF_Children_ModifiedBy]  DEFAULT (N'Trương Nguyễn Khánh') FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Children] ADD  CONSTRAINT [DF_Children_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ChildrenCategory] ADD  CONSTRAINT [DF__ChildrenC__Creat__59FA5E80]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ChildrenCategory] ADD  CONSTRAINT [DF__ChildrenC__Modif__5AEE82B9]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ChildrenCategory] ADD  CONSTRAINT [DF_ChildrenCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Counseling] ADD  CONSTRAINT [DF_Counseling_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Counseling] ADD  CONSTRAINT [DF_Counseling_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Counseling] ADD  CONSTRAINT [DF_Counseling_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Currency] ADD  CONSTRAINT [DF_Currency_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[DevelopmentProcess] ADD  CONSTRAINT [DF_DevelopmentProcess_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Document] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Document] ADD  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DF_Document_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Education] ADD  CONSTRAINT [DF__Education__Creat__5DCAEF64]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Education] ADD  CONSTRAINT [DF__Education__Modif__5EBF139D]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Education] ADD  CONSTRAINT [DF_Education_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF__Employee__Workin__3A81B327]  DEFAULT ((1)) FOR [WorkingContract]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF__Employee__Workin__3B75D760]  DEFAULT (getdate()) FOR [WorkingDate]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF__Employee__Stoppe__3C69FB99]  DEFAULT (getdate()) FOR [StoppedWorkingDate]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF__Employee__Create__3D5E1FD2]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF__Employee__Modifi__3E52440B]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Event] ADD  CONSTRAINT [DF_Event_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[HealthInsurance] ADD  CONSTRAINT [DF_HealthInsurance_EndDate]  DEFAULT (getdate()) FOR [EndDate]
GO
ALTER TABLE [dbo].[HealthInsurance] ADD  CONSTRAINT [DF_HealthInsurance_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF_History_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[History] ADD  CONSTRAINT [DF_History_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Major] ADD  CONSTRAINT [DF_Major_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Major] ADD  CONSTRAINT [DF_Major_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Major] ADD  CONSTRAINT [DF_Major_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[MedicalEquipment] ADD  CONSTRAINT [DF_MedicalInstrument_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[MedicalEquipment] ADD  CONSTRAINT [DF_MedicalInstrument_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[MedicalEquipment] ADD  CONSTRAINT [DF_MedicalInstrument_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_ModifiedBy]  DEFAULT (N'Trương Nguyễn Khánh') FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ProfessionalQualification] ADD  CONSTRAINT [DF_ProfessionalQualification_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ProfessionalQualification] ADD  CONSTRAINT [DF_ProfessionalQualification_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ProfessionalQualification] ADD  CONSTRAINT [DF_ProfessionalQualification_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Quote] ADD  CONSTRAINT [DF_Quote_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Quote] ADD  CONSTRAINT [DF_Quote_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_ModifiedBy]  DEFAULT (N'Trương Nguyễn Khánh') FOR [ModifiedBy]
GO
ALTER TABLE [dbo].[Receipt] ADD  CONSTRAINT [DF_Receipt_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ReceivePay] ADD  CONSTRAINT [DF_ReceivePay_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReceivePay] ADD  CONSTRAINT [DF_ReceivePay_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ReceivePay] ADD  CONSTRAINT [DF_ReceivePay_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ReceivePayAccount] ADD  CONSTRAINT [DF_ReceivePayAccount_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReceivePayAccount] ADD  CONSTRAINT [DF_ReceivePayAccount_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ReceivePayAccount] ADD  CONSTRAINT [DF_ReceivePayAccount_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ReceivePayObject] ADD  CONSTRAINT [DF_ObjectRecievePay_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReceivePayObject] ADD  CONSTRAINT [DF_ObjectRecievePay_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ReceivePayObject] ADD  CONSTRAINT [DF_ObjectRecievePay_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[ReceivePayObjectCategory] ADD  CONSTRAINT [DF_ReceivePayObjectCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReceivePayObjectCategory] ADD  CONSTRAINT [DF_ReceivePayObjectCategory_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[ReceivePayObjectCategory] ADD  CONSTRAINT [DF_ReceivePayObjectCategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Regulation] ADD  CONSTRAINT [DF_Regulation_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Regulation] ADD  CONSTRAINT [DF_Regulation_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Regulation] ADD  CONSTRAINT [DF_Regulation_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SchoolReport] ADD  CONSTRAINT [DF_SchoolReport_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SchoolReport] ADD  CONSTRAINT [DF_SchoolReport_ModifiedDate_1]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[SchoolReport] ADD  CONSTRAINT [DF_SchoolReport_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SchoolReportDetails] ADD  CONSTRAINT [DF_SchoolReport_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SchoolReportDetails] ADD  CONSTRAINT [DF_SchoolReport_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[SchoolReportDetails] ADD  CONSTRAINT [DF_SchoolReportDetails_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SchoolReportType] ADD  CONSTRAINT [DF_SchoolReportType_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SchoolReportType] ADD  CONSTRAINT [DF_SchoolReportType_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[SchoolReportType] ADD  CONSTRAINT [DF_SchoolReportType_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SECategory] ADD  CONSTRAINT [DF__Item__CreatedDat__70DDC3D8]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SECategory] ADD  CONSTRAINT [DF__Item__ModifiedDa__71D1E811]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[SECategory] ADD  CONSTRAINT [DF_SECategory_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SocialInsurance] ADD  CONSTRAINT [DF_SocialInsurance_EndDate]  DEFAULT (getdate()) FOR [EndDate]
GO
ALTER TABLE [dbo].[SocialInsurance] ADD  CONSTRAINT [DF_SocialInsurance_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[SuppliesEquipment] ADD  CONSTRAINT [DF__SuppliesE__Creat__6D0D32F4]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SuppliesEquipment] ADD  CONSTRAINT [DF__SuppliesE__Modif__6E01572D]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[SuppliesEquipment] ADD  CONSTRAINT [DF_SuppliesEquipment_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_GroupID]  DEFAULT ('EMPLOYEE') FOR [GroupID]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Visitor] ADD  CONSTRAINT [DF__Visitor__Created__7B5B524B]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Visitor] ADD  CONSTRAINT [DF__Visitor__Modifie__7C4F7684]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Visitor] ADD  CONSTRAINT [DF_Visitor_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Volunteer] ADD  CONSTRAINT [DF__Volunteer__Creat__4AB81AF0]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Volunteer] ADD  CONSTRAINT [DF__Volunteer__Modif__4BAC3F29]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Volunteer] ADD  CONSTRAINT [DF_Volunteer_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Volunteer_Event] ADD  CONSTRAINT [DF_Volunteer_Event_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[XFamilyBook] ADD  CONSTRAINT [DF__XFamilyBo__Creat__01142BA1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[XFamilyBook] ADD  CONSTRAINT [DF__XFamilyBo__Modif__02084FDA]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[XFamilyBook] ADD  CONSTRAINT [DF_XFamilyBook_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[YellowBook] ADD  CONSTRAINT [DF_YellowBook_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[YellowBook] ADD  CONSTRAINT [DF_YellowBook_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[YellowBook] ADD  CONSTRAINT [DF_YellowBook_Status]  DEFAULT ((1)) FOR [Status]
GO
USE [master]
GO
ALTER DATABASE [MaiAmBaoTroXaHoi] SET  READ_WRITE 
GO
