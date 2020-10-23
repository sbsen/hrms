/****** Object:  Table [dbo].[MTS_Appraisal_Designation_Mapping]    Script Date: 3/18/2020 04:34:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_Appraisal_Designation_Mapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PerformanceTypeID] [bigint] NOT NULL,
	[Description] [bigint] NOT NULL,
	[Weightage] [float] NOT NULL,
	[Designation] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_APPRAISAL_EMPLOYEE_MANAGER_SUMMARY](
	[Employee_Id] [bigint] NOT NULL,
	[Manager_Id] [bigint] NULL,
	[Self_Summary] [varchar](max) NULL,
	[Manager_Summary] [varchar](max) NULL,
	[Employee_Mapping_Id] [bigint] NOT NULL,
	[Created_Date] [datetime] NULL,
	[FinalEvaluator_Id] [bigint] NULL,
	[FinalEvaluator_Summary] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_Appraisal_Employee_Mapping]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_Appraisal_Employee_Mapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Employee_Id] [varchar](255) NOT NULL,
	[PerformanceTypeID] [bigint] NOT NULL,
	[Description] [bigint] NOT NULL,
	[Weightage] [float] NOT NULL,
	[Designation] [bigint] NOT NULL,
	[EmployeeWeightage] [float] NULL,
	[ManagerWeightage] [float] NULL,
	[ManagerId] [bigint] NULL,
	[EmployeeSubmitted_On] [datetime] NULL,
	[ManagerModified_On] [datetime] NULL,
	[FinalRating] [bigint] NULL,
	[RatingTablePeriod] [bigint] NOT NULL,
	[Appraisal_Process_Period_Id] [bigint] NULL,
	[FinalEvaluatorWeightage] [float] NULL,
	[PERFORMANCE_RATING] [bigint] NULL,
	[POTENTIAL_RATING] [bigint] NULL,
	[OVERALL_RATING] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_APPRAISAL_EMPLOYEE_RATING_TABLE]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_APPRAISAL_EMPLOYEE_RATING_TABLE](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Employee_Id] [bigint] NOT NULL,
	[Appraisal_Process_Period_Id] [bigint] NULL,
	[Manager_Id] [bigint] NULL,
	[Staging] [int] NULL,
	[Final_Evaluator_Id] [bigint] NULL,
	[Self_KRA_Rating] [float] NULL,
	[Evaluator_KRA_Rating] [float] NULL,
	[Self_Skill_Rating] [float] NULL,
	[Evaluator_Skill_Rating] [float] NULL,
	[Final_Evaluator_KRA_Rating] [float] NULL,
	[Final_Evaluator_Skill_Rating] [float] NULL,
	[PERFORMANCE_RATING] [bigint] NULL,
	[POTENTIAL_RATING] [bigint] NULL,
	[OVERALL_RATING] [bigint] NULL,
	[Self_Rating_Completion] [datetime] NULL,
	[Evaluator_Rating_Completion] [datetime] NULL,
	[Final_Rating_Completion] [datetime] NULL,
	[FEEDBACK_CATEGORY] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_APPRAISAL_KRA_PERFORMANCE_RATING_CATEGORY]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_APPRAISAL_KRA_PERFORMANCE_RATING_CATEGORY](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PERFORMANCE_TYPE] [bigint] NOT NULL,
	[PERFORMANCE_TYPE_NAME] [varchar](255) NOT NULL,
	[RANGE_FROM] [decimal](18, 2) NOT NULL,
	[RANGE_TO] [decimal](18, 2) NOT NULL,
	[RATING_DESCRIPTION] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_APPRAISAL_MANAGERS_FEEDBACK]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_APPRAISAL_MANAGERS_FEEDBACK](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[EMPLOYEE_ID] [bigint] NULL,
	[POSTED_USER_ID] [bigint] NULL,
	[FEEDBACK] [varchar](max) NOT NULL,
	[CREATED_ON] [datetime] NOT NULL,
	[APPRAISAL_FEEDBACK_ID] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_APPRAISAL_OVERALL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PERFORMANCE_ID] [bigint] NOT NULL,
	[POTENTIAL_ID] [bigint] NOT NULL,
	[RANK_DESCRIPTION] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_APPRAISAL_PERFORMANCE_POTENTIAL_RANK_DESCRIPTION](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TYPEID] [bigint] NOT NULL,
	[TYPENAME] [varchar](255) NOT NULL,
	[RANK_DESCRIPTION_ID] [bigint] NOT NULL,
	[RANK_DESCRIPTION_NAME] [varchar](50) NOT NULL,
	[RANGE_FROM] [float] NOT NULL,
	[RANGE_TO] [float] NOT NULL,
	[RANK_DESCRIPTION] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_Appraisal_PerformanceType]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_Appraisal_PerformanceType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PerformanceType] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_APPRAISAL_PROCESS_DETAILS]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_APPRAISAL_PROCESS_DETAILS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Appraisal_Process_Period] [nvarchar](max) NOT NULL,
	[From_Date] [date] NULL,
	[To_Date] [date] NULL,
	[Until] [date] NULL,
	[Evaluator] [bigint] NOT NULL,
	[Maximum_Rating] [int] NOT NULL,
	[Active] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_Appraisal_SkillKRAMapping]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_Appraisal_SkillKRAMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PerformanceTypeID] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_APPRAISAL_SUMMARY_FEEDBACK_CATEGORY]    Script Date: 3/18/2020 04:34:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_APPRAISAL_SUMMARY_FEEDBACK_CATEGORY](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FEEDBACK_CATEGORY_ID] [bigint] NULL,
	[FEEDBACK_CATEGORY] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MTS_FunctionalRole]    Script Date: 3/18/2020 04:34:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_FunctionalRole](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Role_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MTS_APPRAISAL_PROCESS_DETAILS] ADD  DEFAULT ((1)) FOR [Active]
GO
