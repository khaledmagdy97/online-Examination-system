USE [master]
GO
/****** Object:  Database [ITI_Exams_UML]    Script Date: 1/13/2023 9:28:47 PM ******/
CREATE DATABASE [ITI_Exams_UML]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ITI_Exams_UML', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ITI_Exams_UML.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ITI_Exams_UML_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ITI_Exams_UML_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITI_Exams_UML].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ITI_Exams_UML] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET ARITHABORT OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ITI_Exams_UML] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ITI_Exams_UML] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ITI_Exams_UML] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ITI_Exams_UML] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET RECOVERY FULL 
GO
ALTER DATABASE [ITI_Exams_UML] SET  MULTI_USER 
GO
ALTER DATABASE [ITI_Exams_UML] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ITI_Exams_UML] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ITI_Exams_UML] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ITI_Exams_UML] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ITI_Exams_UML] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ITI_Exams_UML', N'ON'
GO
ALTER DATABASE [ITI_Exams_UML] SET QUERY_STORE = OFF
GO
USE [ITI_Exams_UML]
GO
/****** Object:  Table [dbo].[Choice]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Choice](
	[Question_ID] [int] NOT NULL,
	[A] [varchar](5000) NULL,
	[B] [varchar](5000) NULL,
	[C] [varchar](5000) NULL,
	[D] [varchar](5000) NULL,
 CONSTRAINT [PK_Choice_1] PRIMARY KEY CLUSTERED 
(
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](128) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Instructor]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Instructor](
	[Course_ID] [int] NOT NULL,
	[Instructor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Course_Instructor] PRIMARY KEY CLUSTERED 
(
	[Course_ID] ASC,
	[Instructor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department_Manager]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_Manager](
	[Department_ID] [int] NOT NULL,
	[Instructor_ID] [int] NOT NULL,
 CONSTRAINT [PK_Department_Manager] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC,
	[Instructor_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Course_ID] [int] NULL,
	[Author_ID] [int] NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam_Question]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Question](
	[Exam_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
 CONSTRAINT [PK_Exam_Question] PRIMARY KEY CLUSTERED 
(
	[Exam_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Instructor]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](32) NOT NULL,
	[Department_ID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[IsAdmin] [bit] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](3) NOT NULL,
	[Statement] [varchar](max) NOT NULL,
	[Course_ID] [int] NOT NULL,
	[Answer] [varchar](1) NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [varchar](16) NOT NULL,
	[LName] [varchar](16) NOT NULL,
	[Gender] [varchar](1) NOT NULL,
	[Phone] [varchar](13) NULL,
	[Address] [varchar](256) NULL,
	[University] [varchar](128) NULL,
	[Faculty] [varchar](128) NULL,
	[GradYear] [varchar](4) NULL,
	[Grade] [varchar](2) NULL,
	[Department_ID] [int] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Course]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Course](
	[Student_ID] [int] NOT NULL,
	[Course_ID] [int] NOT NULL,
 CONSTRAINT [PK_Student_Course] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Course_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Exam]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Exam](
	[Student_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Grade] [float] NULL,
 CONSTRAINT [PK_Student_Exam] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Exam_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Exam_Question_Solution]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Exam_Question_Solution](
	[Student_ID] [int] NOT NULL,
	[Exam_ID] [int] NOT NULL,
	[Question_ID] [int] NOT NULL,
	[Answer] [int] NULL,
 CONSTRAINT [PK_Student_Exam_Question_Solution] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC,
	[Exam_ID] ASC,
	[Question_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](16) NOT NULL,
	[Course_ID] [int] NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (1, N'C++ is an object oriented programming language', N'C++ is a procedural programming language', N'C++ supports both procedural and object oriented programming language', N'C++ is a functional programming language')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (2, N'#include [userdefined]', N'#include â€œuserdefinedâ€‌', N'#include <userdefined.h>', N'#include <userdefined>')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (3, N'/* comment */', N'// comment */', N'// comment', N'both // comment or /* comment */')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (4, N'hg', N'cpp', N'h', N'hf')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (5, N'VAR_1234', N'$var_name', N'7VARNAME', N'7var_name')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (6, N'Default constructor', N'Parameterized constructor', N'Copy constructor', N'Friend constructor')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (7, N'Left-right', N'Right-left', N'Bottom-up', N'Top-down')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (8, N'C++ technique to enhance multiple inheritance', N'C++ technique to ensure that a private member of the base class can be accessed somehow', N'C++ technique to avoid multiple inheritances of classes', N'C++ technique to avoid multiple copies of the base class into children/derived class')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (9, N'The program is not semantically correct', N'The program is compiled and executed successfully', N'The program gives a compile-time error', N'The program compiled successfully but throws an error during run-time')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (10, N'Hello', N'World', N'Error', N'Hello World')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (11, N'delete is syntactically correct but delete[] is wrong and hence will give an error if used in any case', N'delete is used to delete normal objects whereas delete[] is used to pointer objects', N'delete is a keyword whereas delete[] is an identifier', N'delete is used to delete single object whereas delete[] is used to multiple(array/pointer of) objects')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (12, N'Error in C and successful execution in C++', N'Error in both C and C++', N'Error in C++ and successful execution in C', N'A successful run in both C and C++')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (13, N'Outputs Hello twice in both C and C++', N'Error in C and successful execution in C++', N'Error in C++ and successful execution in C', N'Error in both C and C++')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (14, N'this pointer is passed as a hidden argument in all static variables of a class', N'this pointer is passed as a hidden argument in all the functions of a class', N'this pointer is passed as a hidden argument in all non-static functions of a class', N'this pointer is passed as a hidden argument in all static functions of a class')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (15, N'spacesintext', N'spaces in text', N'spaces', N'spaces in')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (16, N'Code 1 only', N'Neither code 1 nor code 2', N'Both code 1 and code 2', N'Code 2 only')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (17, N'double', N'float', N'int', N'bool')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (18, N'12', N'0', N'2', N'16')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (19, N'Binary', N'VTC', N'Text', N'ISCII')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (35, N'Data of Binary Management System', N'Database Management System', N'Database Management Service', N'Data Backup Management System')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (36, N'Image', N'Text', N'Table', N'Graph')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (37, N'Data and the DBMS', N'Application and SQL', N'Database application and the database', N'he user and the software')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (38, N'Primary Key', N'Foreign key', N'Super key', N'Candidate key')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (39, N'4NF', N'2NF', N'3NF', N'5NF')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (40, N'Greater Entity Count', N'Minimum cardinality', N'Maximum cardinality', N'ERD')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (41, N'db_sysadmin', N'db_accessadmin', N'db_securityadmin', N'db_setupadmin')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (42, N'Network model between the tables that connect them', N'Parent-Child relationship between the tables that connects them', N'One to many relationship between the tables that connects them', N'All of the mentioned')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (43, N'Pointers are used to maintain transactional integrity and consistency', N'Cursors are used to maintain transactional integrity and consistency', N'Locks are used to maintain transactional integrity and consistency', N'Triggers are used to maintain transactional integrity and consistency')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (44, N'can be used as it is by the DBMS', N'stored on disk in an ASCII text format', N'all of the mentioned', N'none of the mentioned')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (45, N'Create table . . . as', N'Create view as', N'Create table . . .like', N'With data')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (46, N'Dot representation', N'Concatenation', N'Relational-and', N'All of the mentioned')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (47, N'Primary key', N'Authorised key', N'Encryption key', N'Decryption key')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (48, N'Dicing', N'Pivoting', N'Slicing', N'Both Pivoting and Dicing')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (55, N'<javascript>', N'<js>', N'<src>', N'<script>')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (56, N'Both the head section and the body section are correct', N'The head section', N'The body section', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (57, N'Yes', N'No', N'Depends on the type of include', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (58, N'<script name="gfg.js">', N'<script href="gfg.js">', N'<script src="gfg.js">', N'None of these')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (59, N'Only one', N'Three', N'Infinitely many', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (60, N'Yes', N'No', N'Only when we use ''strict''', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (61, N'true', N'{}', N'[]', N'All of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (62, N'''boolean''', N'''string''', N'''number''', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (63, N'None of the above', N'''number''', N'''integer''', N'''string')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (64, N'document.getElementById("demo").innerHTML = "Hola!";', N'document.getElement("p").innerHTML = "Hola!";', N'#demo.innerHTML = "Hola!";', N'document.getElementByName("p").innerHTML = "Hola!";')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (65, N'() [] . ++', N'++ . [] ()', N'. ++ [] ()', N'() ++ . []')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (66, N'o', N'f', N'k', N's')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (67, N'8', N'0  ', N'-1', N'2')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (68, N'false', N''' ''', N'undefined', N'All of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (75, N'Hyper Text Markup Language', N'Holistick Technical Method Library', N'Hyper Tax Makes Line', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (76, N'Web browser', N'text editor', N'Both [A] and [B]', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (77, N'<i>', N'<italic>', N'<it>', N'<il>')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (78, N'Long break', N'Paragraph break', N'Line break', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (79, N'A frame', N'A link', N'A picture', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (80, N'<CAPTION>', N'<TD>', N'<TR>', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (81, N'A graphics program', N'Any text editor', N'HTML -development suite 4', N'All of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (82, N'Top and bottom', N'Body and frameset', N'Head and body', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (83, N'<ol>', N'<ul>', N'<il>', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (84, N'Increase the softness of your site', N'Increase the space between cells', N'Increase the distance between cell and content', N'All of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (85, N'<bd>', N'<bold>', N'<bl>', N'<b>')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (86, N'<tr> and </tr>', N'<th> and </th>', N'<td> and </td>', N'None of the above')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (87, N'<ul "round">', N'<ul type="circle">', N'<ul type="round">', N'<ul ="round">')
GO
INSERT [dbo].[Choice] ([Question_ID], [A], [B], [C], [D]) VALUES (88, N'save it with binary file', N'save it with WMF file', N'save it with ASCII text file', N'All of the above')
GO
SET IDENTITY_INSERT [dbo].[Course] ON 
GO
INSERT [dbo].[Course] ([ID], [Name]) VALUES (1, N'C++')
GO
INSERT [dbo].[Course] ([ID], [Name]) VALUES (2, N'Databases Fundamentals')
GO
INSERT [dbo].[Course] ([ID], [Name]) VALUES (3, N'Advanced Database')
GO
INSERT [dbo].[Course] ([ID], [Name]) VALUES (4, N'HTML5')
GO
INSERT [dbo].[Course] ([ID], [Name]) VALUES (5, N'Javascript Fundamentals')
GO
INSERT [dbo].[Course] ([ID], [Name]) VALUES (6, N'Operating Systems')
GO
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (1, 6)
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (2, 1)
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (2, 7)
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (3, 2)
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (3, 8)
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (4, 3)
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (4, 9)
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (5, 4)
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (5, 10)
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (6, 5)
GO
INSERT [dbo].[Course_Instructor] ([Course_ID], [Instructor_ID]) VALUES (6, 15)
GO
SET IDENTITY_INSERT [dbo].[Department] ON 
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (1, N'D1')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (2, N'D2')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (3, N'D3')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (4, N'D4')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (5, N'D5')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (6, N'D6')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (7, N'D7')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (8, N'D8')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (9, N'D9')
GO
INSERT [dbo].[Department] ([ID], [Name]) VALUES (10, N'D10')
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Instructor] ON 
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (1, N'Walid Ahmed', 3, N'Walid_Ahmed1', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (2, N'Ahmed Ali', 1, N'Ahmed_Ali2', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (3, N'Wael Ali', 2, N'Wael_Ali3', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (4, N'Rami Mohamed', 3, N'Rami_Mohamed4', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (5, N'Hany Alaa', 4, N'Hany_Alaa5', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (6, N'Yasser Ali', 5, N'Yasser_Ali6', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (7, N'Marwa Ahmed', 6, N'Marwa_Ahmed7', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (8, N'Basma Ali', 7, N'Basma_Ali8', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (9, N'Hadeer Ali', 8, N'Hadeer_Ali9', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (10, N'Mariam Ibrahim', 9, N'Mariam_Ibrahim10', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (11, N'Hagar Ali', 10, N'Hagar_Ali11', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (12, N'Mostafa Ali', 1, N'Mostafa_Ali12', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (13, N'Nada Ali', 1, N'Nada_Ali13', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (14, N'Samy Ali', 2, N'Samy_Ali14', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (15, N'Rami Adel', 3, N'Rami_Adel15', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (16, N'Ahmed Alaa', 4, N'Ahmed_Alaa16', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (17, N'Ahmed Safwat', 5, N'Ahmed_Safwat17', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (18, N'Mohamed Ahmed', 6, N'Mohamed_Ahmed18', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (19, N'Basma Wael', 7, N'Basma_Wael19', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (20, N'Ali Youssef', 8, N'Ali_Youssef20', N'123', NULL)
GO
INSERT [dbo].[Instructor] ([ID], [Name], [Department_ID], [Username], [Password], [IsAdmin]) VALUES (21, N'Ibrahim Wael', 9, N'Ibrahim_Wael21', N'123', NULL)
GO
SET IDENTITY_INSERT [dbo].[Instructor] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (1, N'MCQ', N'What is C++?', 1, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (2, N'MCQ', N'Which of the following is the correct syntax of including a user defined header files in C++?', 1, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (3, N'MCQ', N'Which of the following is used for comments in C++?', 1, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (4, N'MCQ', N'Which of the following user-defined header file extension used in c++?', 1, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (5, N'MCQ', N'Which of the following is a correct identifier in C++?', 1, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (6, N'MCQ', N'Which of the following is not a type of Constructor in C++?', 1, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (7, N'MCQ', N'Which of the following approach is used by C++?', 1, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (8, N'MCQ', N'What is virtual inheritance in C++?', 1, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (9, N'MCQ', N'What happens if the following C++ statement is compiled and executed?
int *ptr = NULL;
delete ptr;', 1, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (10, N'MCQ', N'What will be the output of the following C++ code?

#include <iostream> 
#include <string>
using namespace std; 
int main(int argc, char const *argv[])
{
	char s1[6] = "Hello";
	char s2[6] = "World";
	char s3[12] = s1 + " " + s2;
	cout<<s3;
	return 0;
}', 1, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (11, N'MCQ', N'What is the difference between delete and delete[] in C++?', 1, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (12, N'MCQ', N'What happens if the following program is executed in C and C++?

#include <stdio.h> 
int main(voi
{ 
	int new = 5;
	printf("%d", new); 
}', 1, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (13, N'MCQ', N'What happens if the following program is executed in C and C++?

#include <stdio.h> 
void func(void)
{
	printf("Hello");
}
void main() 
{ 
	func();
	func(2);
}', 1, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (14, N'MCQ', N'Which of the following is correct about this pointer in C++?', 1, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (15, N'MCQ', N'What will be the output of the following C++ code?

    #include <iostream>
    #include <string>
    #include <algorithm>
    using namespace std;
    int main() 
    {
        string s = "spaces in text";
        s.erase(remove(s.begin(), s.end(), '' '' ), s.end() ) ;
        cout << s << endl;
    }', 1, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (16, N'MCQ', N'Which of the following C++ code will give error on compilation?

================code 1=================
#include <iostream>
using namespace std;
int main(int argc, char const *argv[])
{
	cout<<"Hello World";
	return 0;
}

================code 2=================
#include <iostream>
int main(int argc, char const *argv[])
{
	std::cout<<"Hello World";
	return 0;
}', 1, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (17, N'MCQ', N'Which of the following type is provided by C++ but not C?', 1, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (18, N'MCQ', N'What is the value of p in the following C++ code snippet?

    #include <iostream>
    using namespace std;
    int main()
    {
        int p;
        bool a = true;
        bool b = false;
        int x = 10;
        int y = 5;
        p = ((x | y) + (a + b));
        cout << p;
        return 0;
    }', 1, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (19, N'MCQ', N'By default, all the files in C++ are opened in _________ mode.', 1, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (20, N'MTF', N'The computer will carry out the instructions that follow the symbol //', 1, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (21, N'MTF', N'A program must have a main function.', 1, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (22, N'MTF', N'The following is an example of a declaration statement:
cout << "Enter a number: ";', 1, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (23, N'MTF', N'An identifier must start with a letter or an underscore.', 1, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (24, N'MTF', N'It is best to use very short identifiers.', 1, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (25, N'MTF', N'In the statement below: "Hello!" is called a string literal.
cout << "Hello!"', 1, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (26, N'MTF', N'There is no limit on the size of the numbers that can be stored in the int data type.', 1, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (27, N'MTF', N'76.45e-2 is a valid value for a float data type.', 1, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (28, N'MTF', N'There are only two possible values for the bool data type.', 1, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (29, N'MTF', N'All data types take up the same amount of storage.', 1, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (30, N'MTF', N'It is good program style to put spaces between words and symbols.', 1, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (31, N'MTF', N'A C++ statement cannot extend over more than one line.', 1, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (32, N'MTF', N'In C++ addition is always evaluated before subtraction.', 1, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (33, N'MTF', N'The value of 3/7 is 0.', 1, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (34, N'MTF', N'>> is used for output.', 1, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (35, N'MCQ', N'What is the full form of DBMS?', 2, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (36, N'MCQ', N'In which of the following formats data is stored in the database management system?', 2, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (37, N'MCQ', N'The DBMS acts as an interface between ________________ and ________________ of an enterprise-class system', 2, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (38, N'MCQ', N' ______________ is a set of one or more attributes taken collectively to uniquely identify a record.', 2, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (39, N'MCQ', N'Which forms have a relation that contains information about a single entity?', 2, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (40, N'MCQ', N'_______ indicates the maximum number of entities that can be involved in a relationship.', 2, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (41, N'MCQ', N'The user IDs can be added or removed using which of the following fixed roles?', 2, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (42, N'MCQ', N'What does a foreign key combined with a primary key create?', 2, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (43, N'MCQ', N'Which of the following is correct according to the technology deployed by DBMS?', 2, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (44, N'MCQ', N'Which of the following is correct regarding the file produced by a spreadsheet?', 2, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (45, N'MCQ', N'______ resembles Create view.', 2, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (46, N'MCQ', N'Which of the following is the best way to represent the attributes in a large db?', 2, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (47, N'MCQ', N'Which of the following key is required in to handle the data when the encryption is applied to the data so that the unauthorised usercannot access the data?', 2, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (48, N'MCQ', N'Which of the following is known as the process of viewing cross-tab with a fixed value of one attribute?', 2, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (49, N'MTF', N'Properties of an object are stored as rows in a table', 2, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (50, N'MTF', N'DBMS stores data efficiently with little wasted space', 2, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (51, N'MTF', N'A primary goal of a database system is to share data with multiple users', 2, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (52, N'MTF', N'Multiple constraints can be included in a single query', 2, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (53, N'MTF', N'The primary key does not necessarily have to be unique for a given table', 2, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (54, N'MTF', N'Validation can make sure that your data is correct. a or b?', 2, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (55, N'MCQ', N'Inside which HTML element do we put the JavaScript?', 4, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (56, N'MCQ', N'Where is the correct place to insert a JavaScript?', 4, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (57, N'MCQ', N'Is it necessary for the external script file to contain a <script> tag?', 4, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (58, N'MCQ', N'What is the correct syntax for referring to an external script called ''gfg.js''?', 4, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (59, N'MCQ', N'How many ways are there with which we can declare a variable in javascript?', 4, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (60, N'MCQ', N'Is a variable named ''apple'' same as ''Apple'' in javascript?', 4, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (61, N'MCQ', N'Which of the following represent truthy values in javascript?', 4, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (62, N'MCQ', N'What will be the output of the following code?
< script >
document.write( typeof( ''1'' + 2) );
</ script >', 4, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (63, N'MCQ', N'What will be the output of the following code?
< script>
let ans = 6 / "3";
document.write ( typeof ans );
< /script>', 4, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (64, N'MCQ', N'What is the correct JavaScript syntax to change the content of the HTML element below?
<p id="demo">May the code be with you.</p>', 4, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (65, N'MCQ', N'What is the correct precedence of the operator in javascript?', 4, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (66, N'MCQ', N'What will be the output of the following code snippet let gfg = â€‌GeeksforGeeksâ€‌ console.log(gfg.charAt(4))?', 4, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (67, N'MCQ', N'What will be the output of the following code snippet let gfg=â€‌GeeksforGeeksâ€‌ console.log(gfg.indexOf(â€کGâ€™))?', 4, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (68, N'MCQ', N'Which of the following represent falsy values in javascript?', 4, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (69, N'MTF', N'You can use a text string as a literal value or assign it to a variable', 4, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (70, N'MTF', N'The statement document.write("This is a text string.");
prints "This is a text string".', 4, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (71, N'MTF', N'JavaScript can be used to delete persistent cookies in a program.', 4, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (72, N'MTF', N'To round a number to the next highest integer you will use the round(x) Math class method.', 4, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (73, N'MTF', N'In JavaScript code, you use the words yes and no to indicate Boolean values.', 4, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (74, N'MTF', N'When you add a new property to an object that has been instantiated from a constructor function, the new property is available to all objects.', 4, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (75, N'MCQ', N'What does the abbreviation HTML stand for?', 3, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (76, N'MCQ', N'To create HTML page, you need _____', 3, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (77, N'MCQ', N'Choose the correct HTML tag to make a text italic', 3, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (78, N'MCQ', N'What does the <br> tag add to your webpage?', 3, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (79, N'MCQ', N'Adding a border to your image helps the visitor to recognize it as what?', 3, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (80, N'MCQ', N'The tag which allows you to nest other HTML tags within the description', 3, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (81, N'MCQ', N'Which program do you need to write HTML?', 3, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (82, N'MCQ', N'All normal webpages consists of ______.', 3, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (83, N'MCQ', N'To created a bulleted list, use _____.', 3, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (84, N'MCQ', N'Increasing the cellpadding means __________.', 3, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (85, N'MCQ', N'Choose the correct HTML tag to make a text bold', 3, N'D')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (86, N'MCQ', N'Which tag will add rows to your tables?', 3, N'A')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (87, N'MCQ', N'To start a list using circles, use_____.', 3, N'B')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (88, N'MCQ', N'If you create an HTML page in word processor,____.', 3, N'C')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (89, N'MTF', N'Are HTML tags case sensitive?', 3, N'F')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (90, N'MTF', N'Is HTML5 backward compatible with old browsers?', 3, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (91, N'MTF', N'Inline elements are normally displayed without starting a new line.', 3, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (92, N'MTF', N'An <iframe> is used to display a web page within a web page.', 3, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (93, N'MTF', N'In HTML, you can embed SVG elements directly into an HTML page.', 3, N'T')
GO
INSERT [dbo].[Question] ([ID], [Type], [Statement], [Course_ID], [Answer]) VALUES (94, N'MTF', N'An <iframe> is used to display a web page within a web page.', 3, N'T')
GO
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (1, N'Hagar', N'Mostafa', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Hagar_Mostafa1', N'Mostafa_Hagar1')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (2, N'Sara', N'Mohamed', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 2, N'Sara_Mohamed2', N'Mohamed_Sara2')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (3, N'Eman', N'Mohammed', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 3, N'Eman_Mohammed3', N'Mohammed_Eman3')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (4, N'Bassant', N'Mahgoub', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 4, N'Bassant_Mahgoub4', N'Mahgoub_Bassant4')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (5, N'Hafsa', N'Ebrahim', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 5, N'Hafsa_Ebrahim5', N'Ebrahim_Hafsa5')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (6, N'Dina', N'Samir', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 6, N'Dina_Samir6', N'Samir_Dina6')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (7, N'Khaled', N'Ayman', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 7, N'Khaled_Ayman7', N'Ayman_Khaled7')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (8, N'Ahmed', N'Muhammed', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 8, N'Ahmed_Muhammed8', N'Muhammed_Ahmed8')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (9, N'Ahmed', N'Negmeldin', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 9, N'Ahmed_Negmeldin9', N'Negmeldin_Ahmed9')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (10, N'Raouf', N'Alaadin', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 10, N'Raouf_Alaadin10', N'Alaadin_Raouf10')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (11, N'Karim', N'Eid', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Karim_Eid11', N'Eid_Karim11')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (12, N'Shrief', N'Hesham', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 2, N'Shrief_Hesham12', N'Hesham_Shrief12')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (13, N'Abdallah', N'Mohamed', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 3, N'Abdallah_Mohamed13', N'Mohamed_Abdallah13')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (14, N'Mina', N'Yossry', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 4, N'Mina_Yossry14', N'Yossry_Mina14')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (15, N'Hossam', N'Mahmoud', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 5, N'Hossam_Mahmoud15', N'Mahmoud_Hossam15')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (16, N'Maged', N'Samir', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 6, N'Maged_Samir16', N'Samir_Maged16')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (17, N'Mohaned', N'Saudi', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 7, N'Mohaned_Saudi17', N'Saudi_Mohaned17')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (18, N'Asmaa', N'Mohamed', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 8, N'Asmaa_Mohamed18', N'Mohamed_Asmaa18')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (19, N'Zeinab', N'Mahmoud', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 9, N'Zeinab_Mahmoud19', N'Mahmoud_Zeinab19')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (20, N'Shahenda', N'Hamdy', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 10, N'Shahenda_Hamdy20', N'Hamdy_Shahenda20')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (21, N'Heba', N'Allah', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Heba_Allah21', N'Allah_Heba21')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (22, N'Maha', N'Yehia', N'F', NULL, NULL, NULL, NULL, NULL, NULL, 2, N'Maha_Yehia22', N'Yehia_Maha22')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (23, N'Mohamed', N'Refaat', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 3, N'Mohamed_Refaat23', N'Refaat_Mohamed23')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (24, N'Youssef', N'Ehab', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 4, N'Youssef_Ehab24', N'Ehab_Youssef24')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (25, N'Omar', N'Mosaad', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 5, N'Omar_Mosaad25', N'Mosaad_Omar25')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (26, N'Amr', N'Sherif', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 6, N'Amr_Sherif26', N'Sherif_Amr26')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (27, N'Khaled', N'Magdy', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 7, N'Khaled_Magdy27', N'Magdy_Khaled27')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (28, N'Mahmoud', N'Sherif', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 8, N'Mahmoud_Sherif28', N'Sherif_Mahmoud28')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (29, N'Mohamed', N'Abdelfattah', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 9, N'Mohamed_Abdelfattah29', N'Abdelfattah_Mohamed29')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (30, N'Hesham', N'Essam', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 10, N'Hesham_Essam30', N'Essam_Hesham30')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (31, N'Ahmed', N'Taha', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 1, N'Ahmed_Taha31', N'Taha_Ahmed31')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (32, N'Ahmed', N'Mohamed', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 2, N'Ahmed_Mohamed32', N'Mohamed_Ahmed32')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (33, N'Mahmoud', N'Hossam', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 3, N'Mahmoud_Hossam33', N'Hossam_Mahmoud33')
GO
INSERT [dbo].[Student] ([ID], [FName], [LName], [Gender], [Phone], [Address], [University], [Faculty], [GradYear], [Grade], [Department_ID], [Username], [Password]) VALUES (34, N'Mohammed', N'Ahmed', N'M', NULL, NULL, NULL, NULL, NULL, NULL, 4, N'Mohammed_Ahmed34', N'Ahmed_Mohammed34')
GO
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (1, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (1, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (1, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (1, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (1, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (2, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (2, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (2, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (2, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (2, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (3, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (3, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (3, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (3, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (3, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (4, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (4, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (4, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (4, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (4, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (5, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (5, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (5, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (5, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (5, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (6, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (6, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (6, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (6, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (6, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (7, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (7, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (7, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (7, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (7, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (8, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (8, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (8, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (8, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (8, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (9, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (9, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (9, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (9, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (9, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (10, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (10, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (10, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (10, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (10, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (11, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (11, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (11, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (11, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (11, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (12, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (12, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (12, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (12, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (12, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (13, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (13, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (13, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (13, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (13, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (14, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (14, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (14, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (14, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (14, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (15, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (15, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (15, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (15, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (15, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (16, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (16, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (16, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (16, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (16, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (17, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (17, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (17, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (17, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (17, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (18, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (18, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (18, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (18, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (18, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (19, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (19, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (19, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (19, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (19, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (20, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (20, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (20, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (20, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (20, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (21, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (21, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (21, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (21, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (21, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (22, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (22, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (22, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (22, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (22, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (23, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (23, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (23, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (23, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (23, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (24, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (24, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (24, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (24, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (24, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (25, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (25, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (25, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (25, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (25, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (26, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (26, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (26, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (26, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (26, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (27, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (27, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (27, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (27, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (27, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (28, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (28, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (28, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (28, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (28, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (29, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (29, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (29, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (29, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (29, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (30, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (30, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (30, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (30, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (30, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (31, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (31, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (31, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (31, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (31, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (32, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (32, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (32, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (32, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (32, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (33, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (33, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (33, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (33, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (33, 5)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (34, 1)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (34, 2)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (34, 3)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (34, 4)
GO
INSERT [dbo].[Student_Course] ([Student_ID], [Course_ID]) VALUES (34, 5)
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 
GO
INSERT [dbo].[Topic] ([ID], [Name], [Course_ID]) VALUES (1, N'OOP', 1)
GO
INSERT [dbo].[Topic] ([ID], [Name], [Course_ID]) VALUES (2, N'Databases', 2)
GO
INSERT [dbo].[Topic] ([ID], [Name], [Course_ID]) VALUES (3, N'CST', 3)
GO
INSERT [dbo].[Topic] ([ID], [Name], [Course_ID]) VALUES (4, N'Programming', 4)
GO
INSERT [dbo].[Topic] ([ID], [Name], [Course_ID]) VALUES (5, N'OS', 5)
GO
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [Unique_Topic_Name]    Script Date: 1/13/2023 9:28:47 PM ******/
ALTER TABLE [dbo].[Topic] ADD  CONSTRAINT [Unique_Topic_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Exam] ADD  CONSTRAINT [DF_Exam_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Choice]  WITH CHECK ADD  CONSTRAINT [FK_Choice_Question] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[Choice] CHECK CONSTRAINT [FK_Choice_Question]
GO
ALTER TABLE [dbo].[Course_Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Course_Instructor_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Course_Instructor] CHECK CONSTRAINT [FK_Course_Instructor_Course]
GO
ALTER TABLE [dbo].[Course_Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Course_Instructor_Instructor] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructor] ([ID])
GO
ALTER TABLE [dbo].[Course_Instructor] CHECK CONSTRAINT [FK_Course_Instructor_Instructor]
GO
ALTER TABLE [dbo].[Department_Manager]  WITH CHECK ADD  CONSTRAINT [FK_Department_Manager_Department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Department_Manager] CHECK CONSTRAINT [FK_Department_Manager_Department]
GO
ALTER TABLE [dbo].[Department_Manager]  WITH CHECK ADD  CONSTRAINT [FK_Department_Manager_Instructor] FOREIGN KEY([Instructor_ID])
REFERENCES [dbo].[Instructor] ([ID])
GO
ALTER TABLE [dbo].[Department_Manager] CHECK CONSTRAINT [FK_Department_Manager_Instructor]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Course]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Instructor] FOREIGN KEY([Author_ID])
REFERENCES [dbo].[Instructor] ([ID])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Instructor]
GO
ALTER TABLE [dbo].[Exam_Question]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Question_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[Exam_Question] CHECK CONSTRAINT [FK_Exam_Question_Exam]
GO
ALTER TABLE [dbo].[Exam_Question]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Question_Question] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[Exam_Question] CHECK CONSTRAINT [FK_Exam_Question_Question]
GO
ALTER TABLE [dbo].[Instructor]  WITH CHECK ADD  CONSTRAINT [FK_Instructor_Department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Instructor] CHECK CONSTRAINT [FK_Instructor_Department]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
ALTER TABLE [dbo].[Student_Course]  WITH CHECK ADD  CONSTRAINT [FK_Student_Course_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Student_Course] CHECK CONSTRAINT [FK_Student_Course_Course]
GO
ALTER TABLE [dbo].[Student_Course]  WITH CHECK ADD  CONSTRAINT [FK_Student_Course_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Student_Course] CHECK CONSTRAINT [FK_Student_Course_Student]
GO
ALTER TABLE [dbo].[Student_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[Student_Exam] CHECK CONSTRAINT [FK_Student_Exam_Exam]
GO
ALTER TABLE [dbo].[Student_Exam]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Student_Exam] CHECK CONSTRAINT [FK_Student_Exam_Student]
GO
ALTER TABLE [dbo].[Student_Exam_Question_Solution]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Question_Solution_Exam] FOREIGN KEY([Exam_ID])
REFERENCES [dbo].[Exam] ([ID])
GO
ALTER TABLE [dbo].[Student_Exam_Question_Solution] CHECK CONSTRAINT [FK_Student_Exam_Question_Solution_Exam]
GO
ALTER TABLE [dbo].[Student_Exam_Question_Solution]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Question_Solution_Question] FOREIGN KEY([Question_ID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[Student_Exam_Question_Solution] CHECK CONSTRAINT [FK_Student_Exam_Question_Solution_Question]
GO
ALTER TABLE [dbo].[Student_Exam_Question_Solution]  WITH CHECK ADD  CONSTRAINT [FK_Student_Exam_Question_Solution_Student] FOREIGN KEY([Student_ID])
REFERENCES [dbo].[Student] ([ID])
GO
ALTER TABLE [dbo].[Student_Exam_Question_Solution] CHECK CONSTRAINT [FK_Student_Exam_Question_Solution_Student]
GO
ALTER TABLE [dbo].[Topic]  WITH CHECK ADD  CONSTRAINT [FK_Topic_Course] FOREIGN KEY([Course_ID])
REFERENCES [dbo].[Course] ([ID])
GO
ALTER TABLE [dbo].[Topic] CHECK CONSTRAINT [FK_Topic_Course]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [CK_Question_Type] CHECK  (([Type]='MTF' OR [Type]='MCQ'))
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [CK_Question_Type]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CK_Student_Gender] CHECK  (([Gender] like '[MF]'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CK_Student_Gender]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [CK_Student_Grade] CHECK  (([Grade]='G' OR [Grade]='VG' OR [Grade]='E'))
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [CK_Student_Grade]
GO
/****** Object:  StoredProcedure [dbo].[DeleteAnswer]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteAnswer] @qid int
as
	begin try
		delete from Question_Answer where Question_ID = @qid
	end try

	begin catch
		select 'Couldn''t delete answer is refrenced in another table.'
	end catch







GO
/****** Object:  StoredProcedure [dbo].[DeleteChoice]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteChoice] @qid int
as
	begin try
		delete from Choice where Question_ID = @qid
	end try

	begin catch
		select 'Couldn''t delete choice is refrenced in another table.'
	end catch
GO
/****** Object:  StoredProcedure [dbo].[DeleteQuestion]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DeleteQuestion] @qid int, @force bit = 0
as
	if @force = 1
	begin
		--Deleting dependents of Question
		delete from Choice where Question_ID = @qid
		delete from Question_Answer where Question_ID = @qid
		delete from Exam_Question where Question_ID = @qid
		delete from Choice where Question_ID = @qid

		declare @t table(Exam_ID int)

		--Deleting dependents of Exam
		insert into @t
		select Exam_ID from Student_Exam_Question_Solution where Question_ID = @qid
		delete from Student_Exam_Question_Solution where Question_ID = @qid
		delete from Student_Exam where Exam_ID in (select * from @t)
		

		delete from Exam where ID in (select * from @t)
		delete from Question where ID = @qid
	end

	else
	begin
		begin try
			delete from Question where ID = @qid
		end try

		begin catch
			select 'The question is refrenced in another table.
			If you want to force delete pass a second parameter with a value of 1'
		end catch
	end
GO
/****** Object:  StoredProcedure [dbo].[InsertChoice]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertChoice] @qid int, @c1 varchar(5000), @c2 varchar(5000), @c3 varchar(5000), @c4 varchar(5000)
as
	insert into Choice values(@qid,@c1,@c2,@c3,@c4)
	Return
;
GO
/****** Object:  StoredProcedure [dbo].[InsertQuestion]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertQuestion] @type varchar(3), @statment varchar(MAX), @cid int, @answer varchar(1), @id int OUTPUT
as
	insert into Question (Type,Statement,Course_ID,Answer) values(@type,@statment,@cid,@answer)
	select @id = IDENT_CURRENT('Question')
;
GO
/****** Object:  StoredProcedure [dbo].[InsertQuestionWithChoices]    Script Date: 1/13/2023 9:28:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertQuestionWithChoices] @type varchar(3), @statment varchar(MAX), @cid int, @answer varchar(1),
									  @c1 varchar(5000) = NULL, @c2 varchar(5000) = NULL, @c3 varchar(5000) = NULL, @c4 varchar(5000) = NULL
as
	declare @qid int;
	
	exec InsertQuestion @type,@statment,@cid,@answer,@qid output

	
	if @type = 'MCQ'
	begin
		exec InsertChoice  @qid, @c1, @c2, @c3, @c4
	end
GO
USE [master]
GO
ALTER DATABASE [ITI_Exams_UML] SET  READ_WRITE 
GO
