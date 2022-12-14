USE [master]
GO
/****** Object:  Database [VacationManager]    Script Date: 11/29/2022 12:51:32 PM ******/
CREATE DATABASE [VacationManager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VacationManager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VacationManager.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VacationManager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\VacationManager_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VacationManager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VacationManager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VacationManager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VacationManager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VacationManager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VacationManager] SET ARITHABORT OFF 
GO
ALTER DATABASE [VacationManager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VacationManager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VacationManager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VacationManager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VacationManager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VacationManager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VacationManager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VacationManager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VacationManager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VacationManager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VacationManager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VacationManager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VacationManager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VacationManager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VacationManager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VacationManager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VacationManager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VacationManager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [VacationManager] SET  MULTI_USER 
GO
ALTER DATABASE [VacationManager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VacationManager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VacationManager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VacationManager] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [VacationManager] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VacationManager]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 11/29/2022 12:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/29/2022 12:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsAdmin] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 11/29/2022 12:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[TeamLeaderId] [int] NOT NULL,
 CONSTRAINT [PK_Teams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamsProjects]    Script Date: 11/29/2022 12:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamsProjects](
	[TeamId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamsUsers]    Script Date: 11/29/2022 12:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamsUsers](
	[TeamId] [int] NOT NULL,
	[UserId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/29/2022 12:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRoles]    Script Date: 11/29/2022 12:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vacantions]    Script Date: 11/29/2022 12:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacantions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[DateRequest] [date] NOT NULL,
	[HalfDay] [bit] NOT NULL,
	[Accepted] [bit] NOT NULL,
	[ApplicantId] [int] NOT NULL,
 CONSTRAINT [PK_Vacantions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Teams]  WITH CHECK ADD  CONSTRAINT [FK_Teams_Users] FOREIGN KEY([TeamLeaderId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Teams] CHECK CONSTRAINT [FK_Teams_Users]
GO
ALTER TABLE [dbo].[TeamsProjects]  WITH CHECK ADD  CONSTRAINT [FK_TeamsProjects_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[TeamsProjects] CHECK CONSTRAINT [FK_TeamsProjects_Projects]
GO
ALTER TABLE [dbo].[TeamsProjects]  WITH CHECK ADD  CONSTRAINT [FK_TeamsProjects_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[TeamsProjects] CHECK CONSTRAINT [FK_TeamsProjects_Teams]
GO
ALTER TABLE [dbo].[TeamsUsers]  WITH CHECK ADD  CONSTRAINT [FK_TeamsUsers_Teams] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([Id])
GO
ALTER TABLE [dbo].[TeamsUsers] CHECK CONSTRAINT [FK_TeamsUsers_Teams]
GO
ALTER TABLE [dbo].[TeamsUsers]  WITH CHECK ADD  CONSTRAINT [FK_TeamsUsers_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[TeamsUsers] CHECK CONSTRAINT [FK_TeamsUsers_Users]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Roles]
GO
ALTER TABLE [dbo].[UsersRoles]  WITH CHECK ADD  CONSTRAINT [FK_UsersRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersRoles] CHECK CONSTRAINT [FK_UsersRoles_Users]
GO
ALTER TABLE [dbo].[Vacantions]  WITH CHECK ADD  CONSTRAINT [FK_Vacantions_Users] FOREIGN KEY([ApplicantId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Vacantions] CHECK CONSTRAINT [FK_Vacantions_Users]
GO
USE [master]
GO
ALTER DATABASE [VacationManager] SET  READ_WRITE 
GO
