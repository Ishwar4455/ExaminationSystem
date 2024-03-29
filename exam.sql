USE [master]
GO
/****** Object:  Database [ExaminationSystem]    Script Date: 05-11-2019 02:21:59 AM ******/
CREATE DATABASE [ExaminationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExaminationSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ExaminationSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ExaminationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ExaminationSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ExaminationSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExaminationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExaminationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExaminationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExaminationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExaminationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExaminationSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExaminationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExaminationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExaminationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExaminationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExaminationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExaminationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExaminationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExaminationSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExaminationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ExaminationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExaminationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExaminationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExaminationSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ExaminationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ExaminationSystem]
GO
/****** Object:  Table [dbo].[Batch]    Script Date: 05-11-2019 02:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Batch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BatchName] [nvarchar](50) NULL,
	[Course] [nvarchar](50) NULL,
	[NoOfCandidate] [int] NULL,
 CONSTRAINT [PK_Batch] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 05-11-2019 02:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RegisterationID] [int] NULL,
	[CandidateName] [nvarchar](50) NULL,
	[FatherName] [nvarchar](50) NULL,
	[MotherName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](50) NULL,
 CONSTRAINT [PK_Candidate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestSchedule]    Script Date: 05-11-2019 02:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestSchedule](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CandidateID] [int] NULL,
	[BatchID] [int] NULL,
	[TestName] [nvarchar](50) NULL,
	[TimeAllowed] [nvarchar](50) NULL,
	[NumberOfQuestions] [nvarchar](50) NULL,
	[TestStartDate] [datetime] NULL,
	[TestEndDate] [datetime] NULL,
	[MaxMarks] [decimal](18, 0) NULL,
	[PassMarks] [decimal](18, 0) NULL,
 CONSTRAINT [PK_TestSchedule] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 05-11-2019 02:21:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserLogin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Batch] ON 

GO
INSERT [dbo].[Batch] ([ID], [BatchName], [Course], [NoOfCandidate]) VALUES (1, N'Evening', N'Btech', 26)
GO
INSERT [dbo].[Batch] ([ID], [BatchName], [Course], [NoOfCandidate]) VALUES (2, N'Morning', N'MCA', 23)
GO
SET IDENTITY_INSERT [dbo].[Batch] OFF
GO
SET IDENTITY_INSERT [dbo].[Candidate] ON 

GO
INSERT [dbo].[Candidate] ([ID], [RegisterationID], [CandidateName], [FatherName], [MotherName], [Mobile]) VALUES (0, 11, N'Nirmal', N'Abc', N'bcd', N'1234556789')
GO
SET IDENTITY_INSERT [dbo].[Candidate] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

GO
INSERT [dbo].[UserLogin] ([ID], [UserName], [Password]) VALUES (1, N'Admin', N'Admin')
GO
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
GO
ALTER TABLE [dbo].[TestSchedule]  WITH CHECK ADD  CONSTRAINT [FK_TestSchedule_Batch] FOREIGN KEY([BatchID])
REFERENCES [dbo].[Batch] ([ID])
GO
ALTER TABLE [dbo].[TestSchedule] CHECK CONSTRAINT [FK_TestSchedule_Batch]
GO
ALTER TABLE [dbo].[TestSchedule]  WITH CHECK ADD  CONSTRAINT [FK_TestSchedule_Candidate] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[Candidate] ([ID])
GO
ALTER TABLE [dbo].[TestSchedule] CHECK CONSTRAINT [FK_TestSchedule_Candidate]
GO
USE [master]
GO
ALTER DATABASE [ExaminationSystem] SET  READ_WRITE 
GO
