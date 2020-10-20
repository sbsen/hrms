CREATE TABLE [dbo].[AMC_OR_ASSET_INSURANCE] (
    [Id]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [AssetTypeId]      BIGINT        NOT NULL,
    [AssetName]        VARCHAR (255) NOT NULL,
    [Category]         BIGINT        NOT NULL,
    [Vendor]           VARCHAR (255) NOT NULL,
    [Amctype]          BIGINT        NULL,
    [Insurancetype]    BIGINT        NULL,
    [AmcCharges]       MONEY         NULL,
    [PremiumCharges]   MONEY         NULL,
    [PaymentType]      BIGINT        NULL,
    [PaymentRefDate]   DATE          NULL,
    [PaymentRefNumber] BIGINT        NULL,
    [FromDate]         DATE          NULL,
    [ToDate]           DATE          NULL,
    [ContactPerson]    VARCHAR (255) NULL,
    [ContactPhone]     BIGINT        NULL,
    [Notes]            VARCHAR (255) NULL,
    CONSTRAINT [PK_AMC_OR_ASSET_INSURANCE] PRIMARY KEY CLUSTERED ([Id] ASC)
);


CREATE TABLE [dbo].[ASSET_DETAILS] (
    [ID]                    BIGINT          IDENTITY (1, 1) NOT NULL,
    [VENDOR_ID]             BIGINT          NOT NULL,
    [PURCHASE_ORDER_NUMBER] VARCHAR (255)   NULL,
    [PURCHASED_ON]          DATE            NULL,
    [BILL_NUMBER]           VARCHAR (255)   NOT NULL,
    [BILL_DATE]             DATE            NOT NULL,
    [ASSET_TYPEID]          BIGINT          NOT NULL,
    [ASSET_NAMEID]          BIGINT          NOT NULL,
    [ASSET_DESCRIPTION]     VARCHAR (255)   NOT NULL,
    [COST]                  DECIMAL (18, 2) NULL,
    [COST_TYPE]             INT             NULL,
    [MAKE]                  VARCHAR (255)   NULL,
    [MODEL]                 VARCHAR (255)   NULL,
    [SERIAL_NUMBER]         VARCHAR (255)   NULL,
    [IDENTIFICATION_CODE]   VARCHAR (255)   NULL,
    [WARRANTY_MONTHS]       BIGINT          NULL,
    [WARRANTY_STARTDATE]    DATE            NULL,
    [WARRANTY_ENDDATE]      DATE            NULL,
    [INVOICE_ID]            BIGINT          NULL,
    [ASSETTYPE_ID]          BIGINT          NULL,
    [ASSETNAME_ID]          BIGINT          NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);
CREATE TABLE [dbo].[Asset_Maintenance] (
    [Id]                     BIGINT        IDENTITY (1, 1) NOT NULL,
    [AssettypeId]            BIGINT        NULL,
    [Assetname]              VARCHAR (255) NULL,
    [Dateofpurchase]         DATE          NULL,
    [Vendor]                 VARCHAR (255) NULL,
    [MaintenanceCarried_out] VARCHAR (255) NULL,
    [Cost]                   MONEY         NULL,
    [Notes]                  VARCHAR (255) NULL,
    CONSTRAINT [PK_Asset_Maintenance] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[ASSET_SALE] (
    [Id]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [DateOfSale]   DATE          NULL,
    [TypeOfSale]   VARCHAR (255) NULL,
    [SalePrice]    MONEY         NULL,
    [SoldTo]       VARCHAR (255) NULL,
    [ApporvedDate] DATE          NULL,
    [ApporvedRef]  VARCHAR (255) NULL,
    [ApporvedBy]   VARCHAR (255) NULL,
    [Notes]        VARCHAR (255) NULL,
    CONSTRAINT [PK_ASSET_SALE] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[MTS_ASSET_NAME] (
    [Id]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [Assetname] VARCHAR (100) NULL,
    CONSTRAINT [PK_MTS_ASSET_NAME] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[MTS_Department] (
    [id]         BIGINT        IDENTITY (1, 1) NOT NULL,
    [Department] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);

CREATE TABLE [dbo].[MTS_Location] (
    [LocationID]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [LocationName] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([LocationID] ASC)
);

CREATE TABLE [dbo].[MTS_LeaveType] (
    [id]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [Leavetype]    VARCHAR (255) NOT NULL,
    [Numberofdays] BIGINT        NULL,
    [DepartmentId] BIGINT        NULL
);

CREATE TABLE [dbo].[MTS_ASSETS] (
    [Id]           BIGINT         IDENTITY (1, 1) NOT NULL,
    [Assetcode]    AS             ('A'+right('000'+CONVERT([char](4),[Id]),(4))) PERSISTED NOT NULL,
    [AssettypeId]  BIGINT         NOT NULL,
    [Assetname]    VARCHAR (100)  NULL,
    [Depreciation] DECIMAL (4, 2) NULL,
    [Expectedlife] BIGINT         NULL,
    [Salvagevalue] BIGINT         NULL,
    CONSTRAINT [PK_MTS_ASSETS] PRIMARY KEY CLUSTERED ([Assetcode] ASC),
    UNIQUE NONCLUSTERED ([Id] ASC)
);

