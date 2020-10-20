SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMC_OR_ASSET_INSURANCE](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssetTypeId] [bigint] NOT NULL,
	[AssetName] [varchar](255) NOT NULL,
	[Category] [bigint] NOT NULL,
	[Vendor] [varchar](255) NOT NULL,
	[Amctype] [bigint] NULL,
	[Insurancetype] [bigint] NULL,
	[AmcCharges] [money] NULL,
	[PremiumCharges] [money] NULL,
	[PaymentType] [bigint] NULL,
	[PaymentRefDate] [date] NULL,
	[PaymentRefNumber] [bigint] NULL,
	[FromDate] [date] NULL,
	[ToDate] [date] NULL,
	[ContactPerson] [varchar](255) NULL,
	[ContactPhone] [bigint] NULL,
	[Notes] [varchar](255) NULL,
	[item_code] [bigint] NULL,
	[AMC_DOCUMENT_ID] [bigint] NULL,
 CONSTRAINT [PK_AMC_OR_ASSET_INSURANCE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AMC_OR_INSURANCE_DETAILS]    Script Date: 10/16/2019 01:07:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AMC_OR_INSURANCE_DETAILS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[FILE] [varbinary](max) NULL,
	[FILE_NAME] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ASSET_DETAILS]    Script Date: 10/16/2019 01:07:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASSET_DETAILS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[VENDOR_ID] [bigint] NOT NULL,
	[PURCHASE_ORDER_NUMBER] [varchar](255) NULL,
	[PURCHASED_ON] [date] NULL,
	[BILL_NUMBER] [varchar](255) NOT NULL,
	[BILL_DATE] [date] NOT NULL,
	[ASSET_TYPEID] [bigint] NOT NULL,
	[ASSET_NAMEID] [bigint] NOT NULL,
	[ASSET_DESCRIPTION] [varchar](255) NULL,
	[COST] [decimal](18, 2) NULL,
	[COST_TYPE] [int] NULL,
	[MAKE] [varchar](255) NULL,
	[MODEL] [varchar](255) NULL,
	[SERIAL_NUMBER] [varchar](255) NULL,
	[IDENTIFICATION_CODE] [varchar](255) NULL,
	[WARRANTY_MONTHS] [bigint] NULL,
	[WARRANTY_STARTDATE] [date] NULL,
	[WARRANTY_ENDDATE] [date] NULL,
	[INVOICE_ID] [bigint] NULL,
	[ASSETTYPE_ID] [bigint] NULL,
	[ASSETNAME_ID] [bigint] NULL,
	[CURRENTLY_ASSIGNED_TO] [bigint] NULL,
	[IN_USE] [bigint] NULL,
	[ACTIVE] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ASSET_INVOICE_DETAILS]    Script Date: 10/16/2019 01:07:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASSET_INVOICE_DETAILS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[INVOICE] [varbinary](max) NULL,
	[INVOICE_NAME] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Asset_Maintenance]    Script Date: 10/16/2019 01:07:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asset_Maintenance](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[AssettypeId] [bigint] NULL,
	[Assetname] [bigint] NULL,
	[Dateofpurchase] [date] NULL,
	[Vendor] [bigint] NULL,
	[MaintenanceCarried_out] [varchar](255) NULL,
	[Cost] [money] NULL,
	[Notes] [varchar](255) NULL,
	[Item_code] [bigint] NULL,
 CONSTRAINT [PK_Asset_Maintenance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ASSET_SALE]    Script Date: 10/16/2019 01:07:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASSET_SALE](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DateOfSale] [date] NULL,
	[TypeOfSale] [varchar](255) NULL,
	[SalePrice] [money] NULL,
	[SoldTo] [varchar](255) NULL,
	[ApporvedDate] [date] NULL,
	[ApporvedRef] [varchar](255) NULL,
	[ApporvedBy] [varchar](255) NULL,
	[Notes] [varchar](255) NULL,
	[Item_code] [varchar](255) NULL,
	[Asset_Type] [bigint] NULL,
	[Asset_Name] [bigint] NULL,
 CONSTRAINT [PK_ASSET_SALE] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ASSIGN_ASSET]    Script Date: 10/16/2019 01:07:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASSIGN_ASSET](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ASSET_TYPEID] [bigint] NOT NULL,
	[ASSET_NAMEID] [bigint] NOT NULL,
	[ITEM_CODE] [varchar](max) NOT NULL,
	[EMPLOYEE_ID] [bigint] NOT NULL,
	[DEPARTMENT_ID] [bigint] NOT NULL,
	[LOCATION_ID] [bigint] NOT NULL,
	[LOCATION_DETAILS_ID] [bigint] NOT NULL,
	[ACTION_DATE] [date] NOT NULL,
	[NOTES] [varchar](max) NULL,
	[ASSIGN_TYPEID] [bigint] NULL,
	[UNASSIGNED_DATE] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attendance_Log]    Script Date: 10/16/2019 01:07:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance_Log](
	[EmployeeCode] [bigint] NOT NULL,
	[EmployeeName] [varchar](50) NOT NULL,
	[InDeviceName] [varchar](50) NULL,
	[OutDeviceName] [varchar](50) NULL,
	[StatusCode] [nvarchar](50) NULL,
	[Duration] [bigint] NULL,
	[PunchRecords] [nvarchar](max) NULL,
	[InDateTime] [datetime] NULL,
	[OutDateTime] [datetime] NULL,
	[Month] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Reporting_Managers](
	[EmployeeId] [bigint] NOT NULL,
	[ManagerId] [bigint] NOT NULL
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[MTS_ASSET_NAME]    Script Date: 10/16/2019 01:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_ASSET_NAME](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Assetname] [varchar](100) NULL,
 CONSTRAINT [PK_MTS_ASSET_NAME] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MTS_AssetCategories]    Script Date: 10/16/2019 01:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_AssetCategories](
	[CategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[MTS_AssetDetails]    Script Date: 10/16/2019 01:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_AssetDetails](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Product] [varchar](255) NULL,
	[CategoryID] [bigint] NULL,
	[Make] [varchar](255) NULL,
	[Model] [varchar](255) NULL,
	[SerialNumber] [varchar](255) NULL,
	[PurchasedOn] [datetime] NULL,
	[LocationId] [bigint] NULL,
	[AssignedTo] [bigint] NULL,
	[DiscardedOn] [datetime] NULL,
	[Notes] [varchar](max) NULL,
	[BillDate] [datetime] NULL,
	[BillNumber] [varchar](255) NULL,
	[SaleCompany] [varchar](255) NULL,
	[InUse] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MTS_ASSETS]    Script Date: 10/16/2019 01:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ARITHABORT ON
GO
CREATE TABLE [dbo].[MTS_ASSETS](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Assetcode]  AS ('A'+right('0'+CONVERT([varchar](100),[id]),(6))) PERSISTED NOT NULL,
	[AssettypeId] [bigint] NULL,
	[Assetname] [varchar](255) NULL,
	[Depreciation] [decimal](4, 2) NULL,
	[Expectedlife] [bigint] NULL,
	[Salvagevalue] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Assetcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MTS_ATTENDANCE]    Script Date: 10/16/2019 01:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_ATTENDANCE](
	[EmployeeCode] [varchar](10) NULL,
	[EmployeeName] [varchar](50) NOT NULL,
	[InDeviceName] [varchar](50) NULL,
	[OutDeviceName] [varchar](50) NULL,
	[StatusCode] [nvarchar](50) NULL,
	[Duration] [bigint] NULL,
	[PunchRecords] [nvarchar](max) NULL,
	[InDateTime] [datetime] NULL,
	[OutDateTime] [datetime] NULL,
	[Month] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[MTS_VENDORS]    Script Date: 10/16/2019 01:07:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MTS_VENDORS](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[VENDOR_TYPE] [int] NOT NULL,
	[NAME] [varchar](max) NOT NULL,
	[VENDOR_ADDRESS] [varchar](max) NOT NULL,
	[PHONE] [varchar](max) NOT NULL,
	[CONTACT_PERSON] [varchar](max) NOT NULL,
	[MOBILE_NO] [varchar](max) NOT NULL,
	[EMAIL] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
