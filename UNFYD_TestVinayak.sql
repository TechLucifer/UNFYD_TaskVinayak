USE [master]
GO
/****** Object:  Database [UNFYD_TestVinayak]    Script Date: 22-05-2024 17:39:02 ******/
CREATE DATABASE [UNFYD_TestVinayak]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UNFYD_TestVinayak', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UNFYD_TestVinayak.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UNFYD_TestVinayak_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UNFYD_TestVinayak_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UNFYD_TestVinayak] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UNFYD_TestVinayak].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UNFYD_TestVinayak] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET ARITHABORT OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET  MULTI_USER 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UNFYD_TestVinayak] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UNFYD_TestVinayak] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UNFYD_TestVinayak] SET QUERY_STORE = OFF
GO
USE [UNFYD_TestVinayak]
GO
/****** Object:  Table [dbo].[tblAppointmentSlot]    Script Date: 22-05-2024 17:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAppointmentSlot](
	[AppointmentSlotID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorID] [int] NULL,
	[AppointmentSlot] [date] NULL,
 CONSTRAINT [PK__tblAppoi__DC860C096FA29BBC] PRIMARY KEY CLUSTERED 
(
	[AppointmentSlotID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDoc]    Script Date: 22-05-2024 17:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDoc](
	[DoctorID] [int] IDENTITY(1,1) NOT NULL,
	[DoctorName] [varchar](100) NULL,
 CONSTRAINT [PK__TblDoc__2DC00EDFCA586FEF] PRIMARY KEY CLUSTERED 
(
	[DoctorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPatientBooking]    Script Date: 22-05-2024 17:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPatientBooking](
	[PatientID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[MobileNo] [nvarchar](15) NULL,
	[EmailID] [nvarchar](50) NULL,
	[DoctorID] [int] NOT NULL,
	[AppointmentSlotID] [int] NULL,
 CONSTRAINT [PK_tbltblPatientBooking] PRIMARY KEY CLUSTERED 
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblAppointmentSlot] ON 

INSERT [dbo].[tblAppointmentSlot] ([AppointmentSlotID], [DoctorID], [AppointmentSlot]) VALUES (1, 1, CAST(N'2024-05-26' AS Date))
INSERT [dbo].[tblAppointmentSlot] ([AppointmentSlotID], [DoctorID], [AppointmentSlot]) VALUES (2, 1, CAST(N'2024-05-28' AS Date))
INSERT [dbo].[tblAppointmentSlot] ([AppointmentSlotID], [DoctorID], [AppointmentSlot]) VALUES (3, 1, CAST(N'2000-12-30' AS Date))
INSERT [dbo].[tblAppointmentSlot] ([AppointmentSlotID], [DoctorID], [AppointmentSlot]) VALUES (4, 2, CAST(N'2024-06-01' AS Date))
INSERT [dbo].[tblAppointmentSlot] ([AppointmentSlotID], [DoctorID], [AppointmentSlot]) VALUES (5, 2, CAST(N'2024-06-02' AS Date))
INSERT [dbo].[tblAppointmentSlot] ([AppointmentSlotID], [DoctorID], [AppointmentSlot]) VALUES (6, 2, CAST(N'2024-06-03' AS Date))
INSERT [dbo].[tblAppointmentSlot] ([AppointmentSlotID], [DoctorID], [AppointmentSlot]) VALUES (7, 3, CAST(N'2024-06-04' AS Date))
INSERT [dbo].[tblAppointmentSlot] ([AppointmentSlotID], [DoctorID], [AppointmentSlot]) VALUES (8, 3, CAST(N'2024-06-06' AS Date))
INSERT [dbo].[tblAppointmentSlot] ([AppointmentSlotID], [DoctorID], [AppointmentSlot]) VALUES (9, 3, CAST(N'2024-06-08' AS Date))
SET IDENTITY_INSERT [dbo].[tblAppointmentSlot] OFF
GO
SET IDENTITY_INSERT [dbo].[TblDoc] ON 

INSERT [dbo].[TblDoc] ([DoctorID], [DoctorName]) VALUES (1, N'Dr.Jagatap')
INSERT [dbo].[TblDoc] ([DoctorID], [DoctorName]) VALUES (2, N'Dr.Agrawal')
INSERT [dbo].[TblDoc] ([DoctorID], [DoctorName]) VALUES (3, N'Dr.Kadam')
SET IDENTITY_INSERT [dbo].[TblDoc] OFF
GO
SET IDENTITY_INSERT [dbo].[tblPatientBooking] ON 

INSERT [dbo].[tblPatientBooking] ([PatientID], [FirstName], [LastName], [DOB], [MobileNo], [EmailID], [DoctorID], [AppointmentSlotID]) VALUES (2, N'Anu', N'Jadhav', CAST(N'1999-05-12' AS Date), N'9876543212', N'anu@gmail.com', 1, 2)
INSERT [dbo].[tblPatientBooking] ([PatientID], [FirstName], [LastName], [DOB], [MobileNo], [EmailID], [DoctorID], [AppointmentSlotID]) VALUES (3, N'Shivansh', N'Patil', CAST(N'2001-07-21' AS Date), N'9876543212', N'shiv@gmail.com', 1, 3)
INSERT [dbo].[tblPatientBooking] ([PatientID], [FirstName], [LastName], [DOB], [MobileNo], [EmailID], [DoctorID], [AppointmentSlotID]) VALUES (5, N'Poonam', N'Joshi', CAST(N'2024-01-29' AS Date), N'9876543212', N'poonam@gmail.com', 3, 6)
INSERT [dbo].[tblPatientBooking] ([PatientID], [FirstName], [LastName], [DOB], [MobileNo], [EmailID], [DoctorID], [AppointmentSlotID]) VALUES (7, N'Tushar ', N'Pimpare', CAST(N'2024-05-24' AS Date), N'5432123454', N'tushar@gmail.com', 3, 8)
INSERT [dbo].[tblPatientBooking] ([PatientID], [FirstName], [LastName], [DOB], [MobileNo], [EmailID], [DoctorID], [AppointmentSlotID]) VALUES (8, N'Pramod ', N'Hajare', CAST(N'1999-02-25' AS Date), N'8765432341', N'pramod@gmail.com', 3, 8)
SET IDENTITY_INSERT [dbo].[tblPatientBooking] OFF
GO
ALTER TABLE [dbo].[tblAppointmentSlot]  WITH CHECK ADD  CONSTRAINT [fk_DoctorID] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[TblDoc] ([DoctorID])
GO
ALTER TABLE [dbo].[tblAppointmentSlot] CHECK CONSTRAINT [fk_DoctorID]
GO
ALTER TABLE [dbo].[tblPatientBooking]  WITH CHECK ADD  CONSTRAINT [FK_tbltblPatientBooking_TblDoc] FOREIGN KEY([DoctorID])
REFERENCES [dbo].[TblDoc] ([DoctorID])
GO
ALTER TABLE [dbo].[tblPatientBooking] CHECK CONSTRAINT [FK_tbltblPatientBooking_TblDoc]
GO
ALTER TABLE [dbo].[tblPatientBooking]  WITH CHECK ADD  CONSTRAINT [FK_tbltblPatientBooking_tbltblPatientBooking] FOREIGN KEY([AppointmentSlotID])
REFERENCES [dbo].[tblAppointmentSlot] ([AppointmentSlotID])
GO
ALTER TABLE [dbo].[tblPatientBooking] CHECK CONSTRAINT [FK_tbltblPatientBooking_tbltblPatientBooking]
GO
/****** Object:  StoredProcedure [dbo].[UNFYD_SP]    Script Date: 22-05-2024 17:39:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UNFYD_SP]
(
@PatientID int = null,
@DoctorID int = null,
@AppointmentSlotID int = null,
@FirstName nvarchar(50) = null,
@LastName nvarchar(50) = null,
@DoctorName nvarchar(50) = null,
@DOB date = null,
@AppointmentSlot date = null,
@MobileNo nvarchar(20) = null,
@EmailID nvarchar(20) = null,
@Flag nvarchar(50) = null
)
as 
begin 
if(@Flag='GetPatientData')
begin
select pb.PatientID,pb.FirstName,pb.LastName,pb.DOB,pb.MobileNo,pb.EmailID,doc.DoctorName,aps.AppointmentSlot from tblPatientBooking as pb 
inner join TblDoc as doc on doc.DoctorID = pb.DoctorID
inner join tblAppointmentSlot as aps on aps.AppointmentSlotID = pb.AppointmentSlotID
end
if(@Flag='GetDocData')
begin
select * from TblDoc
end
if(@Flag='GetAppointmentSlotByID')
begin
select AppointmentSlotID,AppointmentSlot from tblAppointmentSlot where DoctorID=@DoctorID
end
if(@Flag='AddPatientData')
begin
insert tblPatientBooking values (@FirstName,@LastName,@DOB,@MobileNo,@EmailID,@DoctorID,@AppointmentSlotID)
end
if(@Flag='DeletePatientData')
begin
delete from tblPatientBooking where PatientID=@PatientID
end
end
GO
USE [master]
GO
ALTER DATABASE [UNFYD_TestVinayak] SET  READ_WRITE 
GO
