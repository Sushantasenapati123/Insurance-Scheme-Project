USE [Insurance Policy]
GO
/****** Object:  Table [dbo].[tbl_Doctor]    Script Date: 02-07-2023 18:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Doctor](
	[Doct_ID] [int] IDENTITY(1,1) NOT NULL,
	[Hosp_ID] [int] NULL,
	[Doct_Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Doct_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Hospital]    Script Date: 02-07-2023 18:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Hospital](
	[Hosp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Hosp_Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Hosp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Insurance]    Script Date: 02-07-2023 18:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Insurance](
	[Insurance_ID] [int] IDENTITY(1,1) NOT NULL,
	[Insurance_Name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Insurance_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Insurance_Scheme]    Script Date: 02-07-2023 18:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Insurance_Scheme](
	[Insurance_Scheme_ID] [int] IDENTITY(1,1) NOT NULL,
	[Insurance_ID] [int] NULL,
	[Insurance_Scheme_Name] [varchar](100) NULL,
	[Insurance_Percentage_cover] [numeric](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Insurance_Scheme_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Patient]    Script Date: 02-07-2023 18:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Patient](
	[Patient_ID] [int] IDENTITY(1,1) NOT NULL,
	[Doct_ID] [int] NULL,
	[Patient_Name] [varchar](100) NULL,
	[Patient_Phone] [varchar](100) NULL,
	[Insurance_Scheme_ID] [int] NULL,
	[Status] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Patient_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Patient_Details]    Script Date: 02-07-2023 18:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Patient_Details](
	[Patient_Details_ID] [int] IDENTITY(1,1) NOT NULL,
	[Patient_ID] [int] NULL,
	[Admission_Date] [date] NULL,
	[Discharge_Date] [date] NULL,
	[Total_Expenses] [numeric](8, 2) NULL,
	[Insured_amount] [numeric](8, 2) NULL,
	[Total_Payble_Amount] [numeric](8, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Patient_Details_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Doctor] ON 

INSERT [dbo].[tbl_Doctor] ([Doct_ID], [Hosp_ID], [Doct_Name]) VALUES (1, 1, N'Hara Mohan Mohanty')
INSERT [dbo].[tbl_Doctor] ([Doct_ID], [Hosp_ID], [Doct_Name]) VALUES (2, 1, N'Sunil Choudhury')
INSERT [dbo].[tbl_Doctor] ([Doct_ID], [Hosp_ID], [Doct_Name]) VALUES (3, 2, N'Bibhudutta Samal')
INSERT [dbo].[tbl_Doctor] ([Doct_ID], [Hosp_ID], [Doct_Name]) VALUES (4, 2, N'Smruti Nayak')
INSERT [dbo].[tbl_Doctor] ([Doct_ID], [Hosp_ID], [Doct_Name]) VALUES (5, 2, N'Sonali Sarakar')
INSERT [dbo].[tbl_Doctor] ([Doct_ID], [Hosp_ID], [Doct_Name]) VALUES (6, 3, N'Sachin Sahoo')
INSERT [dbo].[tbl_Doctor] ([Doct_ID], [Hosp_ID], [Doct_Name]) VALUES (7, 3, N'Kabita Tripathy')
INSERT [dbo].[tbl_Doctor] ([Doct_ID], [Hosp_ID], [Doct_Name]) VALUES (8, 3, N'Komal Nath')
SET IDENTITY_INSERT [dbo].[tbl_Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Hospital] ON 

INSERT [dbo].[tbl_Hospital] ([Hosp_ID], [Hosp_Name]) VALUES (1, N'Kalinga Hospital')
INSERT [dbo].[tbl_Hospital] ([Hosp_ID], [Hosp_Name]) VALUES (2, N'Sum Hospital')
INSERT [dbo].[tbl_Hospital] ([Hosp_ID], [Hosp_Name]) VALUES (3, N'KIMS Hospital')
INSERT [dbo].[tbl_Hospital] ([Hosp_ID], [Hosp_Name]) VALUES (4, N'AMRI Hospital')
SET IDENTITY_INSERT [dbo].[tbl_Hospital] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Insurance] ON 

INSERT [dbo].[tbl_Insurance] ([Insurance_ID], [Insurance_Name]) VALUES (1, N'BSKY')
INSERT [dbo].[tbl_Insurance] ([Insurance_ID], [Insurance_Name]) VALUES (2, N'ICICI Lombard')
INSERT [dbo].[tbl_Insurance] ([Insurance_ID], [Insurance_Name]) VALUES (3, N'Star Health')
SET IDENTITY_INSERT [dbo].[tbl_Insurance] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Insurance_Scheme] ON 

INSERT [dbo].[tbl_Insurance_Scheme] ([Insurance_Scheme_ID], [Insurance_ID], [Insurance_Scheme_Name], [Insurance_Percentage_cover]) VALUES (1, 1, N'3LAC Plan', CAST(60.00 AS Numeric(8, 2)))
INSERT [dbo].[tbl_Insurance_Scheme] ([Insurance_Scheme_ID], [Insurance_ID], [Insurance_Scheme_Name], [Insurance_Percentage_cover]) VALUES (2, 1, N'5LAC Plan', CAST(70.00 AS Numeric(8, 2)))
INSERT [dbo].[tbl_Insurance_Scheme] ([Insurance_Scheme_ID], [Insurance_ID], [Insurance_Scheme_Name], [Insurance_Percentage_cover]) VALUES (3, 1, N'7LAC Plan', CAST(80.00 AS Numeric(8, 2)))
INSERT [dbo].[tbl_Insurance_Scheme] ([Insurance_Scheme_ID], [Insurance_ID], [Insurance_Scheme_Name], [Insurance_Percentage_cover]) VALUES (4, 2, N'3LAC Plan', CAST(62.00 AS Numeric(8, 2)))
INSERT [dbo].[tbl_Insurance_Scheme] ([Insurance_Scheme_ID], [Insurance_ID], [Insurance_Scheme_Name], [Insurance_Percentage_cover]) VALUES (5, 2, N'5LAC Plan', CAST(75.00 AS Numeric(8, 2)))
INSERT [dbo].[tbl_Insurance_Scheme] ([Insurance_Scheme_ID], [Insurance_ID], [Insurance_Scheme_Name], [Insurance_Percentage_cover]) VALUES (6, 2, N'7LAC Plan', CAST(90.00 AS Numeric(8, 2)))
INSERT [dbo].[tbl_Insurance_Scheme] ([Insurance_Scheme_ID], [Insurance_ID], [Insurance_Scheme_Name], [Insurance_Percentage_cover]) VALUES (7, 3, N'3LAC Plan', CAST(60.00 AS Numeric(8, 2)))
INSERT [dbo].[tbl_Insurance_Scheme] ([Insurance_Scheme_ID], [Insurance_ID], [Insurance_Scheme_Name], [Insurance_Percentage_cover]) VALUES (8, 3, N'5LAC Plan', CAST(70.00 AS Numeric(8, 2)))
INSERT [dbo].[tbl_Insurance_Scheme] ([Insurance_Scheme_ID], [Insurance_ID], [Insurance_Scheme_Name], [Insurance_Percentage_cover]) VALUES (9, 3, N'7LAC Plan', CAST(80.00 AS Numeric(8, 2)))
SET IDENTITY_INSERT [dbo].[tbl_Insurance_Scheme] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Patient] ON 

INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (1, 1, N'Barsarani Mahapatra', N'9777389809', 1, N'Inactive')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (2, 2, N'Pramod Kumar Barik', N'9861133155', 2, N'Inactive')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (3, 3, N'Falguni Barik', N'9776842628', 3, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (4, 4, N'Satyaprakash Mohanty', N'7894656945', 4, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (5, 4, N'Sarat Kumar Sahoo', N'6371097647', 5, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (6, 5, N'Adesh Patel', N'7873670001', 6, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (7, 6, N'Ambika Prasad Barik', N'8249598403', 7, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (8, 7, N'Aparna Priyadarshani', N'8260391984', 8, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (9, 8, N'Arundhatti Mahapatra', N'9439914183', 9, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (10, 1, N'Ashis Sharma', N'9348068051', 3, N'Inactive')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (11, 1, N'Ashutosh Mohanty', N'8249054037', 5, N'Inactive')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (12, 3, N'Balmukund Kumar', N'8507891818', 7, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (13, 3, N'Barsha Rani Panda', N'7894497766', 9, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (14, 5, N'Bidyadhar Muduli', N'7077538280', 2, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (15, 5, N'Bishal Ghosh', N'8274937670', 4, N'Active')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (16, 6, N'Biswajit Samal', N'9437456187', 6, N'Inactive')
INSERT [dbo].[tbl_Patient] ([Patient_ID], [Doct_ID], [Patient_Name], [Patient_Phone], [Insurance_Scheme_ID], [Status]) VALUES (17, 7, N'Biswarupa Nayak', N'9113111918', 1, N'Active')
SET IDENTITY_INSERT [dbo].[tbl_Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Patient_Details] ON 

INSERT [dbo].[tbl_Patient_Details] ([Patient_Details_ID], [Patient_ID], [Admission_Date], [Discharge_Date], [Total_Expenses], [Insured_amount], [Total_Payble_Amount]) VALUES (1, 11, CAST(N'2023-06-07' AS Date), CAST(N'2023-06-07' AS Date), CAST(12000.00 AS Numeric(8, 2)), CAST(9000.00 AS Numeric(8, 2)), CAST(3000.00 AS Numeric(8, 2)))
INSERT [dbo].[tbl_Patient_Details] ([Patient_Details_ID], [Patient_ID], [Admission_Date], [Discharge_Date], [Total_Expenses], [Insured_amount], [Total_Payble_Amount]) VALUES (2, 10, CAST(N'2023-07-01' AS Date), CAST(N'2023-07-22' AS Date), CAST(10000.00 AS Numeric(8, 2)), CAST(8000.00 AS Numeric(8, 2)), CAST(2000.00 AS Numeric(8, 2)))
SET IDENTITY_INSERT [dbo].[tbl_Patient_Details] OFF
GO
/****** Object:  StoredProcedure [dbo].[USP_HOSPITAL_PRO]    Script Date: 02-07-2023 18:01:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_HOSPITAL_PRO]
(
@Hosp_ID int =0,
@Hosp_Name Varchar(100)=NULL,
@Doct_ID int =0,
@Doct_Name Varchar(100)=NULL,
@Insurance_ID int =0,
@Insurance_Name Varchar(100)=NULL,
@Insurance_Scheme_ID int =0,
@Insurance_Scheme_Name Varchar(100)=NULL,
@Insurance_Percentage_cover Numeric(8,2)=0.0,
@Patient_ID int=0,
@Patient_Name Varchar(100)=NULL,
@Patient_Phone Varchar(100)=NULL,
@Status varchar(30)=NULL,
@Admission_Date Date=null,
@Discharge_Date Date=null,
@Total_Expenses Numeric(8,2)=0.0,
@Action varchar(4)


)

AS

 BEGIN 
 IF(@Action='FHOS')
   BEGIN
      SELECT Hosp_ID,Hosp_Name FROM tbl_Hospital
   END
 ELSE IF(@Action='FDOC')
    BEGIN
	  SELECT Doct_ID,Doct_Name  FROM tbl_Doctor WHERE Hosp_ID=@Hosp_ID
	END

 ELSE IF(@Action='FPAT')
     BEGIN
	   SELECT Patient_ID,Patient_Name FROM tbl_Patient WHERE Doct_ID=@Doct_ID
	 END

  ELSE IF(@Action='FISI')
      BEGIN
		  SELECT I.Insurance_Name, S.Insurance_Scheme_Name,s.Insurance_Scheme_ID FROM tbl_Insurance I
		  INNER JOIN tbl_Insurance_Scheme S ON I.Insurance_ID=S.Insurance_ID
		  INNER JOIN tbl_Patient P ON P.Insurance_Scheme_ID=S.Insurance_Scheme_ID WHERE P.Patient_ID=@Patient_ID
		  and p.Status='Active'
	  END
else if(@Action='Save')
	BEGIN
		 DECLARE @insuranceperAmnt Numeric(8,2)
		 declare @percov numeric(8,2)
		 declare @per Numeric(8,2)
		 DECLARE @TOTALPAYBLAmnt Numeric(8,2)
		 select @percov=ISNULL( Insurance_Percentage_cover,0 )from tbl_Insurance_Scheme WHERE Insurance_Scheme_ID=@Insurance_Scheme_ID
		 set @per=@percov/100
		 set @insuranceperAmnt=@Total_Expenses*@per
		 set @TOTALPAYBLAmnt=@Total_Expenses-@insuranceperAmnt
		 INSERT INTO tbl_Patient_Details VALUES(@Patient_ID,@Admission_Date,@Discharge_Date,@Total_Expenses,@insuranceperAmnt,@TOTALPAYBLAmnt)
		 UPDATE tbl_Patient SET Status='Inactive' where Patient_ID=@Patient_ID
	END

	else if(@Action='FLTB')
	BEGIN
		  SELECT pt.Patient_ID,D.Doct_Name,PT.Patient_Name,I.Insurance_Name,S.Insurance_Scheme_Name,PD.Admission_Date,PD.Discharge_Date,PD.Total_Expenses,PD.Insured_amount,PD.Total_Payble_Amount FROM tbl_Patient_Details PD
		  INNER JOIN  tbl_Patient PT ON PD.Patient_ID=PT.Patient_ID
		  INNER JOIN tbl_Insurance_Scheme S ON PT.Insurance_Scheme_ID=S.Insurance_Scheme_ID
		  INNER JOIN  tbl_Insurance I ON S.Insurance_ID=I.Insurance_ID
		  INNER JOIN tbl_Doctor D ON D.Doct_ID=PT.Doct_ID

	END

	ELSE IF(@Action='FCER')
	 BEGIN
	 SELECT tb.Insurance_Name,  s.Insurance_Scheme_Name,CONVERT(varchar,PD.Admission_Date,103) as  Admission_Date,CONVERT(varchar,PD.Discharge_Date,103) as Discharge_Date,H.Hosp_ID,D.Doct_ID,P.Patient_ID,H.Hosp_Name,D.Doct_Name,P.Patient_Name,PD.Total_Expenses,PD.Insured_amount,PD.Total_Payble_Amount FROM tbl_Patient_Details PD
	  INNER JOIN tbl_Patient P ON P.Patient_ID=PD.Patient_ID
	  inner join tbl_Insurance_Scheme s on s.Insurance_Scheme_ID=p.Insurance_Scheme_ID
	  inner join tbl_Insurance tb on tb.Insurance_ID=s.Insurance_ID
	  INNER JOIN tbl_Doctor D ON P.Doct_ID=D.Doct_ID 
	  INNER JOIN tbl_Hospital H ON H.Hosp_ID=D.Hosp_ID 
	  WHERE P.Patient_ID=@Patient_ID
	 END

 END


GO
