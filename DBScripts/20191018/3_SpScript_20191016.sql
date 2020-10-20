SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[ASSIGN_EMPLOYEE_REPORTING_MANAGER] @EmployeeId BIGINT
	,@ManagerId BIGINT
	,@Active BIGINT
AS
BEGIN
	IF EXISTS (
			SELECT *
			FROM Employee_Reporting_Managers
			WHERE EmployeeId = @EmployeeId
				AND ManagerId = @ManagerId
			) AND @Active = 0
	BEGIN
		DELETE
		FROM Employee_Reporting_Managers
		WHERE EmployeeId = @EmployeeId
			AND ManagerId = @ManagerId
	END

	IF NOT EXISTS (
			SELECT *
			FROM Employee_Reporting_Managers
			WHERE EmployeeId = @EmployeeId
				AND ManagerId = @ManagerId
			) AND @Active = 1
	BEGIN
		INSERT INTO Employee_Reporting_Managers
		VALUES (
			@EmployeeId
			,@ManagerId
			) 			
	END
END


GO



/****** Object:  StoredProcedure [dbo].[CREATE_AMC/INSURANCE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_AMC/INSURANCE] ( @file VARBINARY(MAX)
,@file_name VARCHAR(255))
AS
  BEGIN 
       INSERT INTO AMC_OR_INSURANCE_DETAILS VALUES (@file,@file_name)
	  SELECT 1

  END

GO
/****** Object:  StoredProcedure [dbo].[CREATE_AMC_INSURANCE_FILES]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CREATE_AMC_INSURANCE_FILES] ( @file VARBINARY(MAX)
,@file_name VARCHAR(255))
AS
  BEGIN 
       INSERT INTO AMC_OR_INSURANCE_DETAILS VALUES (@file,@file_name)
	 	BEGIN   
			SELECT SCOPE_IDENTITY()
		END

  END


GO
/****** Object:  StoredProcedure [dbo].[CREATE_AMC_OR_ASSET_INSURANCE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_AMC_OR_ASSET_INSURANCE] (
	@assettypeid BIGINT
	,@assetname VARCHAR(255)
	,@category BIGINT
	,@vendor VARCHAR(255)
	,@amctype BIGINT
	,@insurancetype BIGINT
	,@amccharges MONEY
	,@premiumcharges MONEY
	,@paymenttype VARCHAR(255)
	,@paymentrefdate DATE
	,@paymentrefnumber BIGINT
	,@fromdate DATE
	,@todate DATE
	,@contactperson VARCHAR(255)
	,@contactphone BIGINT
	,@Notes VARCHAR(255)
	,@item_code BIGINT
	,@amc_invoice BIGINT
	)
AS
BEGIN
	INSERT INTO AMC_OR_ASSET_INSURANCE (
		AssetTypeId
		,AssetName
		,Category
		,Vendor
		,Amctype
		,Insurancetype
		,AmcCharges
		,PremiumCharges
		,PaymentType
		,PaymentRefDate
		,PaymentRefNumber
		,FromDate
		,ToDate
		,ContactPerson
		,ContactPhone
		,Notes
		,Item_code
		,Amc_document_id
		)
	VALUES (
		@assettypeid
		,@assetname
		,@category
		,@vendor
		,@amctype
		,@insurancetype
		,@amccharges
		,@premiumcharges
		,@paymenttype
		,@paymentrefdate
		,@paymentrefnumber
		,@fromdate
		,@todate
		,@contactperson
		,@contactphone
		,@Notes
		,@item_code
		,@amc_invoice
		)

	SELECT 1
END

GO
/****** Object:  StoredProcedure [dbo].[create_asset]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[create_asset](@assettype BIGINT,@assetname VARCHAR(100),@depreciation  DECIMAL(4,2),@expectedlife BIGINT,@salvagevalue BIGINT )
AS
BEGIN
INSERT INTO MTS_ASSETS 
VALUES(
@assettype
,@assetname
,@depreciation
,@expectedlife
,@salvagevalue)
select 1
END

GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_DETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[CREATE_ASSET_DETAILS](
@id BIGINT
, @vendorid BIGINT 
, @purchaseordernumber VARCHAR(255)
,@purchasedon DATE
,@billnumber VARCHAR(255)
,@billdate DATE
,@assettypeid BIGINT
,@assetnameid BIGINT
,@assetdescription VARCHAR(255)
,@costinrs DECIMAL(18,2)
,@costtype INT
,@make VARCHAR(255)
,@model VARCHAR(255)
,@serialnumber VARCHAR(255)
,@identificationcode VARCHAR(255)
,@warrantymonths BIGINT
,@warrantystartdate DATE
,@warrantyenddate DATE
,@invoiceid BIGINT
,@assettype_id BIGINT
,@assetname_id BIGINT
,@inuse BIGINT
)
AS
BEGIN
      IF NOT EXISTS
	  (SELECT * FROM ASSET_DETAILS 
	  WHERE IDENTIFICATION_CODE=@identificationcode)

      BEGIN
	       IF NOT EXISTS(SELECT * FROM ASSET_DETAILS WHERE ID =@id)
		    BEGIN
			INSERT INTO ASSET_DETAILS 
			(VENDOR_ID
			,PURCHASE_ORDER_NUMBER
			,PURCHASED_ON
			,BILL_NUMBER
			,BILL_DATE
			,ASSET_TYPEID
			,ASSET_NAMEID
			,ASSET_DESCRIPTION
			,COST
			,COST_TYPE
			,MAKE
			,MODEL
			,SERIAL_NUMBER
			,IDENTIFICATION_CODE
			,WARRANTY_MONTHS
			,WARRANTY_STARTDATE
			,WARRANTY_ENDDATE
			,INVOICE_ID
			,ASSETTYPE_ID
			,ASSETNAME_ID
			,IN_USE)
		VALUES(
			@vendorid  
			, @purchaseordernumber
			,@purchasedon 
			,@billnumber 
			,@billdate 
			,@assettypeid
			,@assetnameid 
			,@assetdescription 
			,@costinrs
			,@costtype 
			,@make 
			,@model 
			,@serialnumber
			,@identificationcode 
			,@warrantymonths 
			,@warrantystartdate
			,@warrantyenddate 
			,@invoiceid
			,@assettype_id
			,@assetname_id
			,@inuse
	)
	       END

	BEGIN
    		 SELECT 1
	 END

	END
	
ELSE	
	 BEGIN
	     SELECT 2
	 END
 END
 




GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_MAINTENANCE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_ASSET_MAINTENANCE](   
 @assettypeid INT  
,@assetname VARCHAR (255)  
,@dateofpurchase date  
,@vendor varchar(255)  
,@maintenancecarried_out varchar(255)  
,@cost money  
,@notes varchar(255)  
,@item_code BIGINT  
   )  
AS  
BEGIN  
INSERT INTO Asset_Maintenance  
(  
AssettypeId  
,Assetname  
,Dateofpurchase  
,Vendor  
,MaintenanceCarried_out  
,Cost  
,Notes  
,Item_code   
)  
VALUES(  
@assettypeid  
,@assetname   
,@dateofpurchase  
,@vendor  
,@maintenancecarried_out  
,@cost  
,@notes  
,@item_code) 
SELECT 1 
END

GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_NAME]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_ASSET_NAME](@assetname VARCHAR(100) )
AS
BEGIN
INSERT INTO MTS_ASSET_NAME 
VALUES(
@assetname)
select 1
END

GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_Sale]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_ASSET_Sale] (
	@dateofsale DATE
	,@typeofsale VARCHAR(255)
	,@saleprice MONEY
	,@soldto VARCHAR(255)
	,@apporveddate DATE
	,@apporvedref VARCHAR(255)
	,@apporvedby VARCHAR(255)
	,@notes VARCHAR(255)
	,@item_code BIGINT
	,@asset_type BIGINT
	,@asset_name BIGINT
	)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN TRANSALE

		UPDATE ASSET_DETAILS
		SET [active] = 0
		WHERE id = @item_code

		INSERT INTO ASSET_SALE
		--(
		--DateOfSale
		--,TypeOfSale
		--,SalePrice
		--,SoldTo
		--,ApprovedDate
		--,ApprovedRef
		--,ApprovedBy
		--,Notes
		--,Item_code
		--,Asset_Type
		--,Asset_Name
		--)    
		VALUES (
			@dateofsale
			,@typeofsale
			,@saleprice
			,@soldto
			,@apporveddate
			,@apporvedref
			,@apporvedby
			,@notes
			,@item_code
			,@asset_type
			,@asset_name
			)

		COMMIT

		SELECT 1
	END TRY

	BEGIN CATCH
		SELECT 0

		ROLLBACK TRAN TRANSALE
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSETDETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_ASSETDETAILS] (
	@name VARCHAR(255)
	,@product VARCHAR(255)
	,@categoryid BIGINT
	,@make VARCHAR(255)
	,@model VARCHAR(255)
	,@serialNumber VARCHAR(255)
	,@purchasedOn DATETIME
	,@locationId BIGINT
	,@assignedTo BIGINT
	,@discardedOn DATETIME
	,@notes VARCHAR(max)
	,@billDate DATETIME
	,@billNumber VARCHAR(255)
	,@saleCompany VARCHAR(255)
	,@inUse BIT
	)
AS
BEGIN
	INSERT INTO MTS_AssetDetails
	VALUES (
		@name
		,@product
		,@categoryid
		,@make
		,@model
		,@serialNumber
		,@purchasedOn
		,@locationId
		,@assignedTo
		,@discardedOn
		,@notes
		,@billDate
		,@billNumber
		,@saleCompany
		,@inUse
		)
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_ASSIGN_ASSET]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_ASSIGN_ASSET] (
	@ASSETTYPEID BIGINT
	,@ASSETNAMEID BIGINT
	,@ITEMCODE VARCHAR(MAX)
	,@EMPLOYEEID BIGINT
	,@DEPARTMENTID BIGINT
	,@LOCATIONID BIGINT
	,@LOCATIONDETAILSID BIGINT
	,@ACTIONDATE DATE
	,@NOTES VARCHAR(MAX)
	,@ASSIGNTYPEID BIGINT
	)
AS
BEGIN
	BEGIN
		UPDATE ASSIGN_ASSET
		SET UNASSIGNED_DATE = @ACTIONDATE
		WHERE ASSET_TYPEID = @ASSETTYPEID
			AND ASSET_NAMEID = @ASSETNAMEID
			AND ITEM_CODE = @ITEMCODE
			AND UNASSIGNED_DATE IS NULL
	END

	BEGIN
		INSERT INTO ASSIGN_ASSET
		VALUES (
			@ASSETTYPEID
			,@ASSETNAMEID
			,@ITEMCODE
			,@EMPLOYEEID
			,@DEPARTMENTID
			,@LOCATIONID
			,@LOCATIONDETAILSID
			,@ACTIONDATE
			,@NOTES
			,@ASSIGNTYPEID
			,NULL
			)
	END

	BEGIN
		UPDATE ASSET_DETAILS
		SET CURRENTLY_ASSIGNED_TO = @EMPLOYEEID
		WHERE ID = @ITEMCODE
	END

	SELECT 1
END

GO


/****** Object:  StoredProcedure [dbo].[CREATE_INVOICE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[CREATE_INVOICE] ( @invoice VARBINARY(MAX)
,@invoice_name VARCHAR(255))
AS
  BEGIN 
       INSERT INTO ASSET_INVOICE_DETAILS VALUES (@invoice,@invoice_name)
		BEGIN   
			SELECT SCOPE_IDENTITY()
		END
  END



GO



Alter PROC [dbo].[CREATE_MESSAGES] (
	@employeeid BIGINT
	,@fromdate DATETIME
	,@todate DATETIME
	,@messageheader VARCHAR(255)
	,@messagetitle VARCHAR(255)
	,@message NVARCHAR(MAX)
	,@roleid BIGINT
	,@messagestatus BIGINT
	,@postedby BIGINT
	,@templatetype BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Employee_ID
				,FromDate
				,ToDate
				,MessageHeader
				,MessageTitle
				,Message
				,Role_id
				,MessageStatus
				,TemplateId
			FROM MTS_MESSAGES
			WHERE Employee_Id = @employeeid
				AND FromDate = @fromdate
				AND ToDate = @todate
				AND MessageHeader = @messageheader
				AND MessageTitle = @messagetitle
				AND Message = @message
				AND Role_id = @roleid
				AND MessageStatus = @messagestatus
			)
	BEGIN
		INSERT INTO MTS_MESSAGES (
			Employee_Id
			,FromDate
			,ToDate
			,MessageHeader
			,MessageTitle
			,Message
			,Role_id
			,MessageStatus
			,PostedDate
			,PostedBy
			,TemplateId
			)
		VALUES (
			@employeeid
			,@fromdate
			,@todate
			,@messageheader
			,@messagetitle
			,@message
			,@roleid
			,@messagestatus
			,GETDATE()
			,@postedby
			,@templatetype
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO


/****** Object:  StoredProcedure [dbo].[CREATE_VENDORDETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_VENDORDETAILS] (
	@vendor_Type INT
	,@name VARCHAR(255)
	,@vendor_Address VARCHAR(max)
	,@phone VARCHAR(255)
	,@contact_Person VARCHAR(max)
	,@mobile_No VARCHAR(max)
	,@email VARCHAR(max)	
	)
AS
BEGIN
	INSERT INTO MTS_VENDORS
		(
		 VENDOR_TYPE
		,NAME
		,VENDOR_ADDRESS
		,PHONE
		,CONTACT_PERSON
		,MOBILE_NO
		,EMAIL)
	VALUES (
	     @vendor_Type
	    ,@name
		,@vendor_Address
		,@phone	
		,@contact_Person
		,@mobile_No
		,@email		
		)
     BEGIN		
		  SELECT 1
     END   
END

Go


/****** Object:  StoredProcedure [dbo].[Display_New_Joiners]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Display_New_Joiners]
AS
BEGIN
	SELECT Employee.id
		,Gender
		,UPPER(CONCAT (
				Firstname
				,' '
				,Lastname
				)) AS Name
		,MD.Designation AS Designation
		,Email
		,CONVERT(VARCHAR(10), Dateofjoin, 103) AS Dateofjoin
		,EI.IMAGE AS [Image]
	FROM Employee
	LEFT JOIN MTS_Designation MD ON MD.id = Employee.Designation
	LEFT JOIN EmployeeImage EI ON EI.Employee_Id = Employee.id
	WHERE Dateofjoin > DATEADD(month, - 1, GETDATE())
END

GO


Create PROCEDURE [dbo].[DISPLAY_ALL_MESSAGES] (@messageStatus BIGINT)
AS
BEGIN
SELECT TOP 15 MSG.id
,MessageHeader
,MessageTitle
,Message AS [Message]
,convert(VARCHAR(20), MSG.PostedDate, 100) AS PostedDate
,EI.IMAGE AS [Image]
,CONCAT (
E.Firstname
,' '
,E.Lastname
) AS Firstname
,E.Gender
,TemplateId
FROM MTS_MESSAGES MSG
LEFT JOIN Employee E ON E.id = MSG.Employee_Id
LEFT JOIN EmployeeImage EI ON EI.Employee_Id = E.id
WHERE CAST(GETDATE() AS DATE) BETWEEN Fromdate
AND ToDate
AND STATUS = 1
AND MSG.MessageStatus = @messageStatus
GROUP BY MSG.MessageStatus
,MSG.id
,MessageHeader
,MessageTitle
,MessageTitle
,Message
,PostedDate
,EI.IMAGE
,E.Firstname
,E.Lastname
,E.Gender
,TemplateId
ORDER BY MSG.PostedDate DESC
END

Go



/****** Object:  StoredProcedure [dbo].[FILTER_ASSETS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FILTER_ASSETS] (
	@FROMDATE DATE
	,@TODATE DATE
	)
AS
BEGIN
	SELECT AD.ID
		,VENDOR_ID
		,MTSV.NAME AS VENDOR_NAME
		,PURCHASE_ORDER_NUMBER
		,PURCHASED_ON
		,BILL_NUMBER
		--,BILL_DATE
		,format( BILL_DATE, 'MM/dd/yyyy') as BILL_DATE
		,ACAT.CATEGORYNAME AS ASSET_TYPE
		,AST.ASSETNAME AS ASSET_NAME
		,ASSET_DESCRIPTION
		,COST
		,COST_TYPE
		,MAKE
		,MODEL
		,SERIAL_NUMBER
		,IDENTIFICATION_CODE
		,WARRANTY_MONTHS
		,WARRANTY_STARTDATE
		,WARRANTY_ENDDATE
		,INVOICE_ID
		,ASSETTYPE_ID
		,ASSETNAME_ID
	FROM ASSET_DETAILS AD WITH (NOLOCK)
	LEFT JOIN MTS_ASSET_NAME AST WITH (NOLOCK) ON AD.ASSET_NAMEID = AST.ID
	LEFT JOIN MTS_ASSETCATEGORIES ACAT WITH (NOLOCK) ON AD.ASSET_TYPEID = ACAT.CATEGORYID
	LEFT JOIN MTS_VENDORS MTSV WITH (NOLOCK) ON MTSV.ID = AD.VENDOR_ID
	WHERE BILL_DATE BETWEEN @FROMDATE
			AND @TODATE
		AND active = 1
END


GO


/****** Object:  StoredProcedure [dbo].[FILTERED_ON_PURCHASED_DATE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[FILTERED_ON_PURCHASED_DATE] (
	@fromdate DATE
	,@todate DATE
	)
AS
BEGIN
	WITH total
	AS (
		SELECT Item_code AS ID
			,sum(cost) AS totalcost
		FROM asset_maintenance WITH (NOLOCK)
		GROUP BY Item_code
		)
	SELECT Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id AS AssetnameId
		,cat.CategoryName AS AssetType
		,name.Assetname AS AssetName
		,Ass.ASSET_DESCRIPTION
		--,year(Ass.BILL_DATE) AS Purchased_year
		,format(Ass.BILL_DATE,'yyyy') as Purchased_year
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname + emp.Lastname AS AssignedTo
		,Ass.SERIAL_NUMBER
		,STUFF((
				SELECT ',' + CAST(AAS.Category AS VARCHAR)
				FROM AMC_OR_ASSET_INSURANCE AAS WITH (NOLOCK)
				WHERE AAS.Item_code = Ass.ID
					AND AAS.ToDate >= cast(GETDATE() as date)
				GROUP BY AAS.Item_code
					,AAS.Category
				FOR XML PATH('')
				), 1, 1, '') AS Category
	FROM ASSET_DETAILS Ass WITH (NOLOCK)
	INNER JOIN MTS_ASSET_NAME name WITH (NOLOCK) ON Ass.ASSET_NAMEID = name.id
	INNER JOIN MTS_AssetCategories cat WITH (NOLOCK) ON Ass.ASSET_TYPEID = cat.CategoryId
	LEFT JOIN Employee emp WITH (NOLOCK) ON Ass.CURRENTLY_ASSIGNED_TO = emp.id
	--LEFT JOIN AMC_OR_ASSET_INSURANCE ins ON Ass.ID = ins.Item_code
	LEFT JOIN total t ON Ass.ID = t.ID
	WHERE Ass.BILL_DATE BETWEEN @fromdate
			AND @todate
		AND Ass.active = 1
	GROUP BY Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id
		,cat.CategoryName
		,name.Assetname
		,Ass.ASSET_DESCRIPTION
		,Ass.BILL_DATE
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname
		,emp.Lastname
		,Ass.SERIAL_NUMBER
END


GO
/****** Object:  StoredProcedure [dbo].[Get_Employee]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_Employee]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	-- Insert statements for procedure here
	SELECT Employee_Id
		,Firstname
		,Lastname
		,Dateofjoin
		,Fathername
		,Maritalstatus
		,Spousename
		,Email
		,Mobile
		,Aadhar
		,Pancard
		,Designation
		,Gender
		,Dateofbirth
		,Nationality
		,Createdtime
		,PF_AccountNumber
		,PF_UAN
		,ESI_Number
		,DepartmentId
	FROM Employee
END

GO


/****** Object:  StoredProcedure [dbo].[MTS_EDITROLE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_EDITROLE] (
	@userid BIGINT
	,@roleid BIGINT
	)
AS
BEGIN
	UPDATE MTS_AUTHORITY

	SET ROLEID = @roleid
	WHERE USERID = @userid

	BEGIN
		SELECT 1
	END
END

GO


/****** Object:  StoredProcedure [dbo].[MTS_GETEMPLOYEEROLE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETEMPLOYEEROLE] @employeeid BIGINT
AS
BEGIN
	SELECT R.ROLE_NAME
	FROM MTS_ROLES R WITH (NOLOCK)
	INNER JOIN MTS_AUTHORITY A WITH (NOLOCK) ON A.ROLEID = R.ROLEID
		AND A.USERID = @employeeid
END

GO



/****** Object:  StoredProcedure [dbo].[MTS_READROLES]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_READROLES]
AS
BEGIN
	SELECT ROLEID
		,ROLE_NAME
	FROM MTS_ROLES
END

GO


/****** Object:  StoredProcedure [dbo].[READ_ACTIVE_EMPLOYEE_NAMES]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ACTIVE_EMPLOYEE_NAMES] 
AS
  BEGIN
       SELECT 
	        E.id
		    ,E.Firstname + ' ' + E.Lastname AS EmployeeName
	        FROM Employee AS E
	        INNER JOIN Mts_Login M ON E.id = M.USERID
	        WHERE M.ACTIVE = 1
  END

GO



Alter PROC [dbo].[READ_ALL_MESSAGES](@roleid bigint)
AS
BEGIN
if(@roleid<>1)
begin
SELECT MSG.id
   ,MSG.FromDate
,ToDate
,MessageHeader
,MessageTitle
,Message AS [Message]
,Status AS [Status]
,CONCAT(E.Firstname,' ',E.Lastname) AS PostedBy
,TemplateId
,MessageStatus
FROM MTS_MESSAGES MSG
inner join Employee E on E.id = MSG.Employee_Id where CAST(GETDATE() AS DATE) between Fromdate and ToDate
end
else
begin
SELECT MSG.id
   ,FromDate
,ToDate
,MessageHeader
,MessageTitle
,Message AS [Message]
,Status AS [Status]
,CONCAT(E.Firstname,' ',E.Lastname) AS PostedBy
,TemplateId
,MessageStatus
FROM MTS_MESSAGES MSG
inner join Employee E on E.id = MSG.Employee_Id order by MSG.FromDate desc
end
END

GO


/****** Object:  StoredProcedure [dbo].[READ_ALLASSETCATEGORIES]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ALLASSETCATEGORIES]
AS
BEGIN
	SELECT CategoryId
		,CategoryName
	FROM MTS_AssetCategories WITH (NOLOCK)
END





GO
/****** Object:  StoredProcedure [dbo].[READ_ALLASSETENTRIES]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[READ_ALLASSETENTRIES]
AS
BEGIN
	SELECT AD.ID
		,VENDOR_ID
		,MTSV.NAME AS VENDOR_NAME
		,PURCHASE_ORDER_NUMBER
		,PURCHASED_ON
		,BILL_NUMBER
		,format(BILL_DATE,'MM/dd/yyyy') as BILL_DATE
		,ACAT.CATEGORYNAME AS ASSET_TYPE
		,AST.ASSETNAME AS ASSET_NAME
		,ASSET_DESCRIPTION
		,COST
		,COST_TYPE
		,MAKE
		,MODEL
		,SERIAL_NUMBER
		,IDENTIFICATION_CODE
		,WARRANTY_MONTHS
		,format(WARRANTY_STARTDATE,'MM/dd/yyyy') as WARRANTY_STARTDATE
		,format(WARRANTY_ENDDATE,'MM/dd/yyyy') as WARRANTY_ENDDATE
		,INVOICE_ID
		,ASSETTYPE_ID
		,ASSETNAME_ID
	FROM ASSET_DETAILS AD WITH (NOLOCK)
	LEFT JOIN MTS_ASSET_NAME AST WITH (NOLOCK) ON AD.ASSET_NAMEID = AST.ID
	LEFT JOIN MTS_ASSETCATEGORIES ACAT WITH (NOLOCK) ON AD.ASSET_TYPEID = ACAT.CATEGORYID
	LEFT JOIN MTS_VENDORS MTSV WITH (NOLOCK) ON MTSV.ID = AD.VENDOR_ID
	WHERE AD.ACTIVE = 1
END




GO
/****** Object:  StoredProcedure [dbo].[READ_ALLASSETNAMES]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ALLASSETNAMES]
AS
BEGIN
	SELECT ID
		,Assetname
	FROM MTS_ASSET_NAME WITH (NOLOCK)
END



GO


/****** Object:  StoredProcedure [dbo].[READ_AMC_DETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[READ_AMC_DETAILS] (@ITEMCODE BIGINT)
AS
BEGIN
	SELECT AMC.Id
		,AC.CategoryName AS Assettype
		,AN.Assetname AS Assetname
		,AMC.Category
		,AMC.Item_code
		,VM.NAME AS Vendor
		,AMC.AmcType
		,AMC.Insurancetype
		,CASE AMC.Category
			WHEN 1
				THEN AMC.AmcCharges
			WHEN 2
				THEN AMC.PremiumCharges
			END CHARGES
		,AMC.PremiumCharges
		,format(AMC.PaymentRefDate, 'MM/dd/yyyy') AS PaymentRefDate
		,AMC.PaymentRefNumber
		,format(AMC.FromDate, 'MM/dd/yyyy') AS FromDate
		,format(AMC.ToDate, 'MM/dd/yyyy') AS ToDate
		,AMC.ContactPerson
		,AMC.ContactPhone
		,AMC.Notes
	FROM AMC_OR_ASSET_INSURANCE AMC WITH (NOLOCK)
	LEFT JOIN MTS_AssetCategories AC WITH (NOLOCK) ON AMC.AssetTypeId = AC.CategoryId
	LEFT JOIN MTS_ASSET_NAME AN WITH (NOLOCK) ON AMC.AssetName = AN.Id
	LEFT JOIN MTS_VENDORS VM WITH (NOLOCK) ON AMC.Vendor = VM.ID
	WHERE AMC.Item_code = @ITEMCODE
END


GO
/****** Object:  StoredProcedure [dbo].[READ_Amc_IMAGES]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[READ_Amc_IMAGES] (@ASSETCODE BIGINT)
AS
BEGIN
	DECLARE @INVOICEID BIGINT = (
			SELECT Amc_document_id
			FROM AMC_OR_ASSET_INSURANCE WITH (NOLOCK)
			WHERE ID = @ASSETCODE
			)

	SELECT [FILE]
		,FILE_NAME
	FROM AMC_OR_INSURANCE_DETAILS WITH (NOLOCK)
	WHERE ID = @INVOICEID
END


GO
/****** Object:  StoredProcedure [dbo].[READ_AMC_INSURANCE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_AMC_INSURANCE] (@id VARCHAR(255))
AS
BEGIN
	SELECT AssetTypeId
		,AssetName
		,Category
		,Vendor
		,Amctype
		,Insurancetype
		,AmcCharges
		,PremiumCharges
		,PaymentType
		,PaymentRefDate
		,FromDate
		,ToDate
		,ContactPerson
		,ContactPhone
		,Notes
	FROM AMC_OR_ASSET_INSURANCE WITH (NOLOCK)
	WHERE Item_code = @id
END


GO
/****** Object:  StoredProcedure [dbo].[READ_AMC_OR_ASSET_INSURANCE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_AMC_OR_ASSET_INSURANCE]
AS
BEGIN
	SELECT Id
		,AssetTypeId
		,AssetName
		,Category
		,Vendor
		,Amctype
		,Insurancetype
		,AmcCharges
		,PremiumCharges
		,PaymentType
		,PaymentRefDate
		,PaymentRefNumber
		,FromDate
		,ToDate
		,ContactPerson
		,ContactPhone
		,Notes
		,item_code
		,AMC_DOCUMENT_ID
	FROM AMC_OR_ASSET_INSURANCE WITH (NOLOCK)
END
GO


/****** Object:  StoredProcedure [dbo].[READ_ASSET_CLASSIFICATION_COUNT]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_CLASSIFICATION_COUNT] @AssetTypeId BIGINT
AS
BEGIN
	WITH DISTINCT_ASSET_NAME
	AS (
		SELECT AssettypeId AS ASSET_TYPEID
			,Assetname AS ASSET_NAMEID
		FROM MTS_ASSETS WITH (NOLOCK)
		WHERE AssettypeId = @AssetTypeId
			AND Assetname IS NOT NULL
		GROUP BY AssettypeId
			,Assetname
		)
	SELECT ANC.ASSET_TYPEID
		,ANC.ASSET_NAMEID
		,MAC.CategoryName
		,MAN.Assetname
		,COUNT(AD.ID) AS COUNT
	FROM DISTINCT_ASSET_NAME ANC
	LEFT JOIN ASSET_DETAILS AD WITH (NOLOCK) ON AD.ASSET_TYPEID = ANC.ASSET_TYPEID
		AND AD.ASSET_NAMEID = ANC.ASSET_NAMEID
		AND AD.active = 1
	LEFT JOIN MTS_AssetCategories MAC WITH (NOLOCK) ON ANC.ASSET_TYPEID = MAC.CategoryId
	LEFT JOIN MTS_ASSET_NAME MAN WITH (NOLOCK) ON ANC.ASSET_NAMEID = MAN.Id
	GROUP BY ANC.ASSET_TYPEID
		,ANC.ASSET_NAMEID
		,MAC.CategoryName
		,MAN.Assetname
	ORDER BY ANC.ASSET_TYPEID
		,ANC.ASSET_NAMEID
END


GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_DASHBOARD_DETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_DASHBOARD_DETAILS]
AS
BEGIN
	SELECT MAC.CategoryId AS ASSET_TYPEID
		,MAC.CategoryName
		,SUM(CASE 
				WHEN MAC.CategoryId = AD.ASSET_TYPEID
					THEN 1
				ELSE 0
				END) AS COUNT 
	FROM MTS_AssetCategories MAC  with (nolock)
	LEFT JOIN ASSET_DETAILS AD with (nolock) ON MAC.CategoryId = AD.ASSET_TYPEID
		AND AD.active = 1
	GROUP BY MAC.CategoryId
		,MAC.CategoryName
END


GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_DASHBOARD_TABLE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_DASHBOARD_TABLE] @AssetTypeId BIGINT
	,@AssetNameId BIGINT
AS
BEGIN
	WITH total 
	AS (
		SELECT Item_code AS ID
			,sum(cost) AS totalcost
		FROM asset_maintenance WITH (NOLOCK)
		GROUP BY Item_code
		)
	SELECT Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id AS AssetnameId
		,cat.CategoryName AS AssetType
		,name.Assetname AS AssetName
		,Ass.ASSET_DESCRIPTION
		-- ,year(Ass.BILL_DATE) as Purchased_year   
		,format(Ass.BILL_DATE, 'yyyy') AS Purchased_year
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname + emp.Lastname AS AssignedTo
		,Ass.SERIAL_NUMBER
		,STUFF((
				SELECT ',' + CAST(AAS.Category AS VARCHAR)
				FROM AMC_OR_ASSET_INSURANCE AAS
				WHERE AAS.Item_code = Ass.ID
					AND AAS.ToDate >= cast(GETDATE() AS DATE)
				GROUP BY AAS.Item_code
					,AAS.Category
				FOR XML PATH('')
				), 1, 1, '') AS Category
	FROM ASSET_DETAILS Ass WITH (NOLOCK)
	INNER JOIN MTS_ASSET_NAME name WITH (NOLOCK) ON Ass.ASSET_NAMEID = name.id
	INNER JOIN MTS_AssetCategories cat WITH (NOLOCK) ON Ass.ASSET_TYPEID = cat.CategoryId
	LEFT JOIN Employee emp WITH (NOLOCK) ON Ass.CURRENTLY_ASSIGNED_TO = emp.id
	LEFT JOIN total t ON Ass.ID = t.ID
	WHERE Ass.active = 1
		AND (
			(
				Ass.ASSET_TYPEID = @AssetTypeId
				AND Ass.ASSET_NAMEID = @AssetNameId
				)
			OR (
				Ass.ASSET_TYPEID = @AssetTypeId
				AND @AssetNameId = 0
				)
			)
	GROUP BY Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id
		,cat.CategoryName
		,name.Assetname
		,Ass.ASSET_DESCRIPTION
		,Ass.BILL_DATE
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname
		,emp.Lastname
		,Ass.SERIAL_NUMBER
END


GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCDE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_MAINTENANCDE]
AS
BEGIN
	SELECT *
	FROM Asset_Maintenance
END

GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[READ_ASSET_MAINTENANCE]
(@ITEMCODE BIGINT)
AS
   BEGIN
        SELECT AM.Id
		,MAC.CategoryName
		,MAN.Assetname
		,format(AM.Dateofpurchase,'MM/dd/yyyy') as Dateofpurchase
		,MV.NAME
		,AM.MaintenanceCarried_out
		,AM.Cost
		,AM.Item_code
		,AM.Notes
		FROM Asset_Maintenance AM with (nolock)
		INNER JOIN MTS_AssetCategories MAC with (nolock) ON MAC.CategoryId=AM.AssettypeId
		INNER JOIN MTS_ASSET_NAME MAN with (nolock) ON MAN.Id =AM.Assetname 
		INNER JOIN MTS_VENDORS MV with (nolock) ON MV.ID  = AM.Vendor
		WHERE Item_code = @ITEMCODE
	END

GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCE_DETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[READ_ASSET_MAINTENANCE_DETAILS]
AS
BEGIN
  SELECT Id
		,AssettypeId
		,Assetname
		,Dateofpurchase
		,Vendor
		,MaintenanceCarried_out
		,Cost
		,Notes
		,Item_code
	FROM Asset_Maintenance with (nolock)
	
END

GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_MASTER]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ASSET_MASTER]
AS
  BEGIN
       SELECT MA.Id
	          ,MA.AssetCode
			  ,MAC.CategoryName
			  ,MAN.Assetname
			  ,MA.Depreciation
			  ,MA.Expectedlife
			  ,MA.Salvagevalue
			  FROM MTS_ASSETS MA with (nolock)
			  INNER JOIN MTS_AssetCategories MAC with (nolock) ON MAC.CategoryId=MA.AssettypeId
			  INNER JOIN MTS_ASSET_NAME MAN with (nolock) ON MAN.Id =MA.Assetname
 END

GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_REPORT]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_REPORT]
AS
BEGIN
	SELECT format(DET.BILL_DATE, 'MM/dd/yyyy') AS PURCHASED_ON
		,VEN.NAME AS SUPPLIER_NAME
		,STUFF((
				SELECT TOP 1 ',' + CASE 
						WHEN ASSIGN.ASSIGN_TYPEID = 1
							THEN DEP.Department
						WHEN ASSIGN.ASSIGN_TYPEID = 2
							THEN LOC.PLACE_NAME
						END
				FROM ASSIGN_ASSET ASSIGN WITH (NOLOCK)
				LEFT JOIN ASSET_DETAILS AD WITH (NOLOCK) ON AD.ID = ASSIGN.ITEM_CODE
				LEFT JOIN LOCATION_DETAILS LOC WITH (NOLOCK) ON ASSIGN.LOCATION_ID = LOC.LOCATION_ID
					AND ASSIGN.LOCATION_DETAILS_ID = LOC.PLACE_ID
				LEFT JOIN Employee E WITH (NOLOCK) ON E.id = ASSIGN.EMPLOYEE_ID
				LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
				WHERE ASSIGN.ITEM_CODE = DET.ID
					AND AD.active = 1
				GROUP BY ASSIGN.ITEM_CODE
					,ASSIGN.ASSIGN_TYPEID
					,LOC.PLACE_NAME
					,DEP.Department
					,ASSIGN.ID
				ORDER BY ASSIGN.ID DESC
				FOR XML path('')
				), 1, 1, '') AS [LOCATION]
		,cat.CategoryName AS ASSET_TYPE
		,name.Assetname AS ASSET_NAME
		,DET.IDENTIFICATION_CODE AS ASSET_NUMBER
		,DET.ASSET_DESCRIPTION AS ITEM_DESCRIPTION
		,DET.COST AS PURCHASE_VALUE
		--,ASS.Depreciation       
		,format(SALE.DateOfSale, 'MM/dd/yyyy') AS DateOfSale
		,CASE 
			WHEN (SALE.DateOfSale IS NOT NULL)
				THEN
					--(SELECT DATEDIFF(MONTH, DET.BILL_DATE, SALE.DateOfSale) )    
					(
						SELECT convert(VARCHAR(3), DATEDIFF(MONTH, DET.BILL_DATE, SALE.DateOfSale) / 12) + ' y ' + convert(VARCHAR(2), DATEDIFF(MONTH, DET.BILL_DATE, SALE.DateOfSale) % 12) + ' m'
						)
			WHEN (SALE.DateOfSale IS NULL)
				THEN
					--(SELECT DATEDIFF(MONTH, DET.BILL_DATE, GETDATE()) )    
					(
						SELECT convert(VARCHAR(3), DATEDIFF(MONTH, DET.BILL_DATE, GETDATE()) / 12) + ' y ' + convert(VARCHAR(2), DATEDIFF(MONTH, DET.BILL_DATE, GETDATE()) % 12) + ' m'
						)
			END AS LIFE_IN_YRS
		,SALE.SalePrice
		,DET.ID
	FROM ASSET_DETAILS DET WITH (NOLOCK)
	LEFT JOIN MTS_VENDORS VEN WITH (NOLOCK) ON DET.VENDOR_ID = VEN.ID
	LEFT JOIN MTS_AssetCategories cat WITH (NOLOCK) ON DET.ASSET_TYPEID = cat.CategoryId
	LEFT JOIN MTS_ASSET_NAME name WITH (NOLOCK) ON DET.ASSET_NAMEID = name.id
	LEFT JOIN MTS_ASSETS ASS WITH (NOLOCK) ON DET.ASSET_TYPEID = ASS.AssetTypeId --and DET.ASSET_NAMEID=ASS.Assetname
	LEFT JOIN ASSET_SALE SALE WITH (NOLOCK) ON DET.ASSET_TYPEID = SALE.Asset_Type
		AND DET.ASSET_NAMEID = SALE.Asset_Name
		AND DET.ID = SALE.Item_code
	LEFT JOIN ASSIGN_ASSET AA WITH (NOLOCK) ON CAST(DET.ID AS VARCHAR) = AA.ITEM_CODE
	GROUP BY DET.BILL_DATE
		,VEN.NAME
		,cat.CategoryName
		,name.Assetname
		,DET.IDENTIFICATION_CODE
		,DET.ASSET_DESCRIPTION
		,DET.COST
		,SALE.DateOfSale
		,SALE.SalePrice
		,DET.ID
	ORDER BY DET.BILL_DATE
END

GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_SALE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[READ_ASSET_SALE]
(@ITEMCODE BIGINT)
AS
  BEGIN
       SELECT Id
	          ,format(DateOfSale,'MM/dd/yyyy') as DateOfSale
			  ,TypeOfSale
			  ,SalePrice
			  ,SoldTo
			  ,format(ApporvedDate,'MM/dd/yyyy') as ApporvedDate
			  ,ApporvedRef
			  ,ApporvedBy
			  ,Notes
			  FROM ASSET_SALE WITH (NOLOCK)
			  WHERE Item_code = @ITEMCODE
END



GO
/****** Object:  StoredProcedure [dbo].[READ_ASSETCATEGORY_DETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSETCATEGORY_DETAILS]
AS
BEGIN
	SELECT CategoryId
		,CategoryName
	FROM MTS_AssetCategories WITH (NOLOCK)
END

GO
/****** Object:  StoredProcedure [dbo].[READ_ASSETDETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[READ_ASSETDETAILS]
AS
BEGIN
	WITH total
	AS
	(
		SELECT Item_code AS ID
			,sum(cost) AS totalcost
		FROM asset_maintenance WITH (NOLOCK)
		GROUP BY Item_code
		)
	SELECT Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id AS AssetnameId
		,cat.CategoryName AS AssetType
		,name.Assetname AS AssetName
		,Ass.ASSET_DESCRIPTION
		,year(Ass.BILL_DATE) AS Purchased_year
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname + ' ' + emp.Lastname AS AssignedTo
		,Ass.SERIAL_NUMBER
		,STUFF((
				SELECT ',' + CAST(AAS.Category AS VARCHAR)
				FROM AMC_OR_ASSET_INSURANCE AAS
				WHERE AAS.Item_code = Ass.ID
					AND AAS.ToDate >= cast(GETDATE() AS DATE)
				GROUP BY AAS.Item_code
					,AAS.Category
				FOR XML PATH('')
				), 1, 1, '') AS Category
	FROM ASSET_DETAILS Ass WITH (NOLOCK)
	INNER JOIN MTS_ASSET_NAME name WITH (NOLOCK) ON Ass.ASSET_NAMEID = name.id
	INNER JOIN MTS_AssetCategories cat WITH (NOLOCK) ON Ass.ASSET_TYPEID = cat.CategoryId
	LEFT JOIN Employee emp WITH (NOLOCK) ON Ass.CURRENTLY_ASSIGNED_TO = emp.id
	--INNER JOIN Employee emp on Ass.CURRENTLY_ASSIGNED_TO=emp.id
	--LEFT JOIN AMC_OR_ASSET_INSURANCE ins ON Ass.ID = ins.Item_code
	LEFT JOIN total t ON Ass.ID = t.ID
	WHERE Ass.active = 1
	GROUP BY Ass.ID
		,Ass.ASSET_TYPEID
		,Ass.IDENTIFICATION_CODE
		,name.Id
		,cat.CategoryName
		,name.Assetname
		,Ass.ASSET_DESCRIPTION
		,Ass.BILL_DATE
		,t.totalcost
		,Ass.MAKE
		,emp.Firstname
		,emp.Lastname
		,Ass.SERIAL_NUMBER
END


GO
/****** Object:  StoredProcedure [dbo].[READ_ASSETDETAILSBYID]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[READ_ASSETDETAILSBYID]     
@Id Bigint    
AS        
BEGIN        
 WITH total(ID, totalcost) as        
    (SELECT Item_code, sum(cost)        
    FROM asset_maintenance        
    GROUP BY Item_code)        
    SELECT Ass.ID        
  ,Ass.ASSET_TYPEID      
  ,Ass.IDENTIFICATION_CODE      
  ,name.Id as AssetnameId      
   ,cat.CategoryName as AssetType     
   , case when Ass.active=1 then 1 else 0 end as [ACTIVE]	           
 ,name.Assetname AS AssetName        
   ,Ass.ASSET_DESCRIPTION        
-- ,year(Ass.BILL_DATE) as Purchased_year 
,format(Ass.BILL_DATE,'yyyy') as Purchased_year   
,format(Ass.BILL_DATE,'MM/dd/yyyy') as Purchased_Date      
 ,t.totalcost        
 ,Ass.MAKE        
 ,emp.Firstname +' '+ emp.Lastname AS AssignedTo        
 ,Ass.SERIAL_NUMBER    
,STUFF((SELECT ',' + CAST(AAS.Category AS VARCHAR)
	FROM AMC_OR_ASSET_INSURANCE AAS
	WHERE AAS.Item_code=Ass.ID and AAS.ToDate>=cast(GETDATE() as date)
	GROUP BY AAS.Item_code
	,AAS.Category
	FOR XML PATH ('')
	), 1, 1, '') AS Category 
 from ASSET_DETAILS as Ass
 INNER JOIN  MTS_ASSET_NAME name on Ass.ASSET_NAMEID=name.id        
 INNER JOIN MTS_AssetCategories cat on Ass.ASSET_TYPEID=cat.CategoryId        
 LEFT JOIN Employee emp on Ass.CURRENTLY_ASSIGNED_TO=emp.id       
 --INNER JOIN Employee emp on Ass.CURRENTLY_ASSIGNED_TO=emp.id
 LEFT JOIN AMC_OR_ASSET_INSURANCE ins on Ass.ID=ins.Item_code  
 LEFT JOIN total t on Ass.ID=t.ID  where Ass.id=@Id 
 group by Ass.ID        
  ,Ass.ASSET_TYPEID      
  ,Ass.IDENTIFICATION_CODE      
  ,name.Id    
   ,cat.CategoryName    
    ,Ass.active
 ,name.Assetname         
   ,Ass.ASSET_DESCRIPTION        
 ,Ass.BILL_DATE      
 ,t.totalcost        
 ,Ass.MAKE        
 ,emp.Firstname
 ,emp.Lastname         
 ,Ass.SERIAL_NUMBER 
     
     
END




GO
/****** Object:  StoredProcedure [dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE] @employeeid BIGINT
AS
BEGIN
	SELECT MAC.CategoryName AS CLASSIFICATION
		,MAN.Assetname AS CATEGORY
		,ISNULL(AD.IDENTIFICATION_CODE, 'Not available') AS ITEM_CODE
		,AD.ASSET_TYPEID
		,AD.ASSET_NAMEID
		,AD.ID AS Item_Id
		,@employeeid AS Employee_id
		,AA.ACTION_DATE
	FROM ASSET_DETAILS AD WITH (NOLOCK)
	LEFT JOIN MTS_AssetCategories MAC WITH (NOLOCK) ON AD.ASSET_TYPEID = MAC.CategoryId
	LEFT JOIN MTS_ASSET_NAME MAN WITH (NOLOCK) ON AD.ASSETNAME_ID = MAN.Id
	LEFT JOIN ASSIGN_ASSET AA WITH (NOLOCK) ON CAST(AA.ITEM_CODE AS BIGINT) = AD.ID
		AND AA.UNASSIGNED_DATE IS NULL
	WHERE (
			AD.CURRENTLY_ASSIGNED_TO = @employeeid
			AND AD.active = 1
			)
		OR (
			AD.CURRENTLY_ASSIGNED_TO IS NULL
			AND @employeeid IS NULL
			AND AD.active = 1
			)
END

GO
/****** Object:  StoredProcedure [dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE_COUNTS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSETS_ASSIGNED_TO_EMPLOYEE_COUNTS]
AS
BEGIN
	SELECT ISNULL(E.Employee_Id, 'NOT ASSIGNED') AS Employee_Id
		,AD.CURRENTLY_ASSIGNED_TO AS id
		,ISNULL(E.Firstname + ' ' + E.Lastname, 'NOT ASSIGNED') AS NAME
		,ISNULL(MD.Department, 'NOT ASSIGNED') AS Department
		,ISNULL(DESIG.Designation, 'NOT ASSIGNED') AS Designation
		,COUNT(AD.ID) AS COUNT
	FROM ASSET_DETAILS AD WITH (NOLOCK)
	LEFT JOIN Employee E WITH (NOLOCK) ON AD.CURRENTLY_ASSIGNED_TO = E.id
	LEFT JOIN MTS_Department MD WITH (NOLOCK) ON MD.id = E.DepartmentId
	LEFT JOIN MTS_Designation DESIG WITH (NOLOCK) ON DESIG.id = E.Designation
	WHERE AD.active = 1
	GROUP BY E.Employee_Id
		,AD.CURRENTLY_ASSIGNED_TO
		,E.Firstname
		,E.Lastname
		,MD.Department
		,DESIG.Designation
	ORDER BY Employee_Id
END


GO
/****** Object:  StoredProcedure [dbo].[READ_ASSIGN_ASSET]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSIGN_ASSET] (@ITEMCODE BIGINT)
AS
BEGIN
	BEGIN
		DECLARE @IDENTIFICATIONCODE VARCHAR(255) = (
				SELECT IDENTIFICATION_CODE
				FROM ASSET_DETAILS
				WHERE ID = @ITEMCODE
				)
	END

	BEGIN
		SELECT AA.ID
			,MAC.CategoryName
			,MAN.Assetname
			,AA.ITEM_CODE
			,E.Firstname + ' ' + E.Fathername AS EMPLOYEE_NAME
			,MD.Department
			,ML.LocationName
			,LD.PLACE_NAME
			,format(AA.ACTION_DATE, 'MM/dd/yyyy') AS ACTION_DATE
			,format(AA.UNASSIGNED_DATE, 'MM/dd/yyyy') AS UNASSIGN_DATE
			,AA.NOTES
			,ASSIGN_TYPEID
		FROM ASSIGN_ASSET AA WITH (NOLOCK)
		LEFT JOIN MTS_AssetCategories MAC WITH (NOLOCK) ON MAC.CategoryId = AA.ASSET_TYPEID
		LEFT JOIN MTS_ASSET_NAME MAN WITH (NOLOCK) ON MAN.Id = AA.ASSET_NAMEID
		LEFT JOIN Employee E WITH (NOLOCK) ON E.id = AA.EMPLOYEE_ID
		LEFT JOIN MTS_Location ML WITH (NOLOCK) ON ML.LocationID = AA.LOCATION_ID
		LEFT JOIN LOCATION_DETAILS LD WITH (NOLOCK) ON LD.ID = AA.LOCATION_DETAILS_ID
		LEFT JOIN MTS_Department MD WITH (NOLOCK) ON MD.id = AA.DEPARTMENT_ID
		WHERE AA.ITEM_CODE = CAST(@ITEMCODE AS VARCHAR)
	END
END


GO


Alter Procedure [dbo].[READ_BIRTHDAYS]
as
Begin
Declare @date date=getdate();
WITH Employee_CTE (Name,Month,Day,Active)
As
(
select E.Firstname + ' ' +E.Lastname,month(Dateofbirth) as Month, Day(Dateofbirth) as day,MTLOG.ACTIVE from Employee as E
INNER JOIN MTS_LOGIN as MTLOG ON MTLOG.USERID=E.id
)  
select Name from Employee_CTE where Month=month(@date) and Day=day(@date) and Active=1
End

GO


/****** Object:  StoredProcedure [dbo].[READ_CURRENTLY_ASSIGNED_EMPLOYEE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_CURRENTLY_ASSIGNED_EMPLOYEE] 
(@ITEMCODE VARCHAR(MAX))
AS 
  BEGIN 
	  SELECT E.Firstname +''+ E.Lastname AS EMPLOYEE_NAME FROM Employee AS E
	  INNER JOIN ASSET_DETAILS AS AD ON E.id = AD.CURRENTLY_ASSIGNED_TO
      WHERE AD.ID = CAST(@ITEMCODE AS BIGINT)  
  END

GO
/****** Object:  StoredProcedure [dbo].[READ_DEPARTMENT]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_ASSIGNED_MANAGERS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_EMPLOYEE_ASSIGNED_MANAGERS] @EmployeeId BIGINT
AS
BEGIN
	SELECT E.Firstname + ' ' + E.Lastname AS EmployeeName
		,MA.USERID AS id
		,CASE 
			WHEN ERM.MANAGERID IS NOT NULL
				THEN 1
			ELSE 0
			END AS ACTIVE
	FROM MTS_AUTHORITY MA WITH (NOLOCK)
	LEFT JOIN EMPLOYEE E WITH (NOLOCK) ON MA.USERID = E.id
	LEFT JOIN Employee_Reporting_Managers ERM WITH (NOLOCK) ON ERM.MANAGERID = MA.USERID
		AND ERM.EMPLOYEEID = @EmployeeId
	INNER JOIN MTS_LOGIN MTLOG WITH (NOLOCK) ON MTLOG.USERID = E.id
		AND MTLOG.ACTIVE = 1
	WHERE (
			MA.ROLEID = 3
			OR MA.ROLEID = 1
			)
		AND E.id <> @EmployeeId
	GROUP BY E.FIRSTNAME
		,E.Lastname
		,MA.USERID
		,ERM.MANAGERID
END

GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_ENTRY_DETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_ENTRY_DETAILS] @id VARCHAR(30)
	,@date DATE
	,@time BIGINT
AS
BEGIN
	SELECT attn.EmployeeCode AS EmployeeCode
		,(E.Firstname + ' ' + E.Lastname) AS EmployeeName
		,DEP.Department AS Department
		,D.Designation AS Designation
		,format(attn.InDateTime, 'MM/dd/yyyy') AS EntryDate
		,attn.InDeviceName
		,attn.OutDeviceName
		,format(attn.InDateTime, 'hh:mm tt') AS InDateTime
		,format(attn.OutDateTime, 'hh:mm tt') AS OutDateTime
		,attn.Duration / 60 AS HOURS
		,attn.Duration % 60 AS MINUTES
		,convert(VARCHAR(10), (attn.Duration / 60)) + ' hrs ' + convert(VARCHAR(10), (attn.Duration % 60)) + ' mins ' AS WorkingHours
		,attn.StatusCode
		,attn.PunchRecords
		,format(attn.InDateTime, 'dddd') AS day
	FROM MTS_ATTENDANCE attn WITH (NOLOCK)
	LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = convert(VARCHAR(10), attn.EmployeeCode)
	LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
	LEFT JOIN MTS_Designation D WITH (NOLOCK) ON D.id = E.Designation
	WHERE @id = attn.EmployeeCode
		AND format(@date, 'MM/yy') = format(attn.InDateTime, 'MM/yy')
		AND (
			(
				(@time <> 0)
				AND (attn.Duration / 60) < @time
				)
			OR @time = 0
			)
END

GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_ID]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_ID] (
	@empid VARCHAR(50)
	,@empname VARCHAR(50)
	)
	--(@empid VARCHAR(50),@empname varchar(50))
AS
BEGIN
	SELECT CASE 
			WHEN EXISTS (
					SELECT Employee_Id
					FROM Employee
					WHERE Employee_Id = @empid
					)
				THEN cast(1 AS BIT)
			ELSE cast(0 AS BIT)
			END

	SELECT Employee_Id
		,CONCAT (
			Firstname
			,' '
			,Lastname
			) AS Employee_Name
	FROM Employee
	WHERE Employee_Id = @empid
		AND CONCAT (
			Firstname
			,' '
			,Lastname
			) = @empname
END

GO



/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEROLE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEEROLE] @employeeid BIGINT
AS
BEGIN
	SELECT R.ROLE_NAME
	FROM MTS_ROLES R WITH (NOLOCK)
	INNER JOIN MTS_AUTHORITY A WITH (NOLOCK) ON A.ROLEID = R.ROLEID
		AND A.USERID = @employeeid
END

GO
/****** Object:  StoredProcedure [dbo].[READ_FILTERED_ASSET_NAME]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_FILTERED_ASSET_NAME] (@assettype BIGINT)
AS
BEGIN
	SELECT DISTINCT name.Id
		,name.Assetname
	FROM MTS_Assets AS asset
	INNER JOIN MTS_ASSET_NAME name ON asset.Assetname = name.Id
	WHERE AssettypeId = @assettype;
END
GO
/****** Object:  StoredProcedure [dbo].[Read_Filtered_LeaveType]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Object:  StoredProcedure [dbo].[READ_INVOICE_IMAGES]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_INVOICE_IMAGES] (@ASSETCODE BIGINT)
AS
BEGIN
	DECLARE @INVOICEID BIGINT = (
			SELECT INVOICE_ID
			FROM ASSET_DETAILS
			WHERE ID = @ASSETCODE
			)

	SELECT INVOICE
		,INVOICE_NAME
	FROM ASSET_INVOICE_DETAILS
	WHERE ID = @INVOICEID
END

GO
/****** Object:  StoredProcedure [dbo].[READ_ITEMCODE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ITEMCODE] (
	@assettypeid BIGINT
	,@assetnameid BIGINT
	)
AS
BEGIN
	SELECT ID
		,CONCAT (
			isnull(identification_code, 'Asset Code N/A')
			,' ( '
			,ASSET_DESCRIPTION
			,' )'
			) AS Item
	FROM ASSET_DETAILS
	WHERE ASSET_TYPEID = @assettypeid
		AND ASSET_NAMEID = @assetnameid
		AND active = 1
END
GO
/****** Object:  StoredProcedure [dbo].[READ_ITEMCODE_AMCINSURANCE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ITEMCODE_AMCINSURANCE] (
	@assettypeid BIGINT
	,@assetnameid BIGINT
	,@categoryid BIGINT
	)
AS
BEGIN
	SELECT AD.ID
		,CONCAT (
			isnull(AD.identification_code, 'Asset Code N/A')
			,' ( '
			,AD.ASSET_DESCRIPTION
			,' )'
			) AS Item
	FROM ASSET_DETAILS AS AD
	LEFT JOIN AMC_OR_ASSET_INSURANCE AS AAI ON AAI.AssetTypeId = AD.ASSET_TYPEID
	WHERE AD.ASSET_TYPEID = @assettypeid
		AND AD.ASSET_NAMEID = @assetnameid
		AND AD.ID NOT IN (
			SELECT item_code
			FROM AMC_OR_ASSET_INSURANCE
			WHERE Category = @categoryid
				AND item_code = AD.ID
				AND ToDate >= CAST(GETDATE() AS DATE)
			)
		AND AD.active = 1
	GROUP BY AD.ID
		,Ad.identification_code
		,AD.ASSET_DESCRIPTION
END

GO


/****** Object:  StoredProcedure [dbo].[READ_LASTINVOICEID]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select * from ASSET_DETAILS

--alter table ASSET_DETAILS add ASSETNAME_ID BIGINT

CREATE PROCEDURE [dbo].[READ_LASTINVOICEID]
AS
BEGIN
     SELECT TOP 1 ID FROM ASSET_INVOICE_DETAILS ORDER BY ID DESC
END

GO



Alter PROCEDURE [dbo].[READ_LOCATION]
AS
BEGIN
	SELECT *
	FROM MTS_Location
END

GO




/****** Object:  StoredProcedure [dbo].[READ_MONTHLY_ATTENDANCE_DETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_MONTHLY_ATTENDANCE_DETAILS] @DATE DATETIME
AS
BEGIN
	SELECT E.Employee_Id
		,E.Firstname + ' ' + E.Lastname AS Employee_Name
		,DEPT.Department
		,DESIG.Designation
	FROM Employee E
	LEFT JOIN MTS_Department DEPT ON E.DepartmentId = DEPT.id
	LEFT JOIN MTS_Designation DESIG ON E.Designation = DESIG.id
END

GO
/****** Object:  StoredProcedure [dbo].[READ_MONTHLY_ATTENDANCE_LOG]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_MONTHLY_ATTENDANCE_LOG] @month DATE
	,@RoleId BIGINT
	,@UserId BIGINT
AS
BEGIN
	/****** Calculate monthly intime duration for all employee ******/
	WITH durations
	AS (
		SELECT al.EmployeeCode AS EmployeeCode
			,(
				SELECT SUM(AL1.Duration)
				FROM MTS_ATTENDANCE AL1 WITH (NOLOCK)
				WHERE AL1.EmployeeCode = al.EmployeeCode
					AND MONTH(AL1.Month) = MONTH(@month)
					AND YEAR(AL1.Month) = YEAR(@month)
					AND (
						AL1.StatusCode = 'P'
						OR AL1.StatusCode = 'Â½P'
						)
				) AS Duration
		FROM MTS_ATTENDANCE AL WITH (NOLOCK)
		GROUP BY al.EmployeeCode
		)
		,
		Total_status_counts
		AS
		(
		SELECT EmployeeCode AS EmployeeCode
		,(SELECT COUNT(ALOG.StatusCode) 
		FROM MTS_ATTENDANCE ALOG WITH (NOLOCK)
		WHERE MONTH(ALOG.Month) = MONTH(@month)
			AND YEAR(ALOG.Month) = YEAR(@month)
			AND ALOG.StatusCode = 'P'
			AND MA.EmployeeCode = ALOG.EmployeeCode) AS PresentDays
		,(SELECT COUNT(ALOG1.StatusCode) 
		FROM MTS_ATTENDANCE ALOG1 WITH (NOLOCK)
		WHERE MONTH(ALOG1.Month) = MONTH(@month)
			AND YEAR(ALOG1.Month) = YEAR(@month)
			AND ALOG1.StatusCode = 'A'
			AND MA.EmployeeCode = ALOG1.EmployeeCode) AS AbsentDays
		,(SELECT COUNT(ALOG2.StatusCode) 
		FROM MTS_ATTENDANCE ALOG2 WITH (NOLOCK)
		WHERE MONTH(ALOG2.Month) = MONTH(@month)
			AND YEAR(ALOG2.Month) = YEAR(@month)
			AND ALOG2.StatusCode = 'Â½P'
			AND MA.EmployeeCode = ALOG2.EmployeeCode) AS HalfDays
		,(SELECT COUNT(ALOG3.StatusCode) 
		FROM MTS_ATTENDANCE ALOG3 WITH (NOLOCK)
		WHERE MONTH(ALOG3.Month) = MONTH(@month)
			AND YEAR(ALOG3.Month) = YEAR(@month)
			AND ALOG3.StatusCode <> 'Â½P'
			AND ALOG3.StatusCode <> 'A'
			AND ALOG3.StatusCode <> 'P'
			AND MA.EmployeeCode = ALOG3.EmployeeCode) AS OtherStatusCodes
		FROM MTS_ATTENDANCE MA WITH (NOLOCK)
		GROUP BY EmployeeCode
		)
	/****** Output ******/
	SELECT attendance_Log.EmployeeCode
		,(E.Firstname + ' ' + E.Lastname) AS EmployeeName
		,department.Department
		,(CONVERT(VARCHAR(4), durations.Duration / 60) + 'hr' + CONVERT(VARCHAR(2), durations.Duration % 60) + 'min') AS Duration
		,CASE 
			WHEN PresentDays IS NOT NULL
				AND HalfDays IS NOT NULL
				THEN CAST(PresentDays AS FLOAT) + CAST(HalfDays AS FLOAT) / 2.0
			WHEN PresentDays IS NOT NULL
				AND HalfDays IS NULL
				THEN CAST(PresentDays AS FLOAT)
			WHEN PresentDays IS NULL
				AND HalfDays IS NOT NULL
				THEN CAST(HalfDays AS FLOAT) / 2.0
			END AS PresentDays
		,CASE 
			WHEN AbsentDays IS NOT NULL
				AND HalfDays IS NOT NULL
				THEN CAST(AbsentDays AS FLOAT) + CAST(HalfDays AS FLOAT) / 2.0
			WHEN AbsentDays IS NOT NULL
				AND HalfDays IS NULL
				THEN CAST(AbsentDays AS FLOAT)
			WHEN AbsentDays IS NULL
				AND HalfDays IS NOT NULL
				THEN CAST(HalfDays AS FLOAT) / 2.0
			END AS AbsentDays
		,OtherStatusCodes
		,PresentDays AS PresentDaysOnly
		,AbsentDays AS AbsentDaysOnly
		,HalfDays
		,(
			SELECT TOP 1 MA.InDateTime
			FROM MTS_ATTENDANCE MA
			WHERE MONTH(MA.Month) = MONTH(@month)
				AND YEAR(MA.Month) = YEAR(@month)
			ORDER BY MA.InDateTime DESC
			) AS ATTENDANCE_UPTO
	FROM MTS_ATTENDANCE attendance_Log WITH (NOLOCK)
	INNER JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = cast(attendance_Log.EmployeeCode AS VARCHAR(10))
	LEFT JOIN MTS_Department department WITH (NOLOCK) ON E.DepartmentId = department.id
	LEFT JOIN Durations durations ON attendance_Log.EmployeeCode = durations.EmployeeCode
	LEFT JOIN Total_status_counts ST ON ST.EmployeeCode = attendance_Log.EmployeeCode
	LEFT JOIN Employee_Reporting_Managers ERM WITH (NOLOCK) ON E.id = ERM.EmployeeId
	WHERE MONTH(attendance_Log.Month) = MONTH(@month)
		AND YEAR(attendance_Log.Month) = YEAR(@month)
		AND (
			(
				(
					@RoleId = 1
					OR @RoleId = 4
					)
				AND (E.id = E.id)
				)
			OR (
				(@RoleId = 3)
				AND (ERM.ManagerId = @UserId)
				)
			)
	GROUP BY attendance_Log.EmployeeCode
		,E.Firstname
		,E.Lastname
		,department.Department
		,durations.Duration
		,PresentDays
		,AbsentDays
		,HalfDays
		,OtherStatusCodes
END

GO
/****** Object:  StoredProcedure [dbo].[READ_MTS_ASSET]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 CREATE procedure [dbo].[READ_MTS_ASSET]
AS
BEGIN
  SELECT asset.* 
 ,  name.Assetname as Asset_Name
 ,cat.CategoryName as Asset_type
  from MTS_ASSETS as asset WITH (NOLOCK)
  inner join MTS_ASSET_NAME name WITH (NOLOCK) on asset.Assetname=name.id
  inner join MTS_AssetCategories cat WITH (NOLOCK) on asset.AssettypeId=cat.CategoryId
END


GO


/****** Object:  StoredProcedure [dbo].[READ_SELECTED_ASSET_ITEM_CODE]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_SELECTED_ASSET_ITEM_CODE]
(@ASSETNAMEID BIGINT)
AS
  BEGIN
       SELECT IDENTIFICATION_CODE FROM ASSET_DETAILS WITH (NOLOCK) WHERE ASSET_NAMEID = @ASSETNAMEID
  END


GO
/****** Object:  StoredProcedure [dbo].[READ_SELECTED_ITEM_DESCRIPTION]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_SELECTED_ITEM_DESCRIPTION] (@ITEMCODE VARCHAR(255))
AS
BEGIN
	SELECT ASSET_DESCRIPTION
		,(
			SELECT TOP 1 ISNULL(unassigned_date, ACTION_DATE)
			FROM ASSIGN_ASSET
			WHERE ITEM_CODE = CAST(@ITEMCODE AS BIGINT)
			ORDER BY ID DESC
			) AS [date]
	FROM ASSET_DETAILS
	WHERE ID = CAST(@ITEMCODE AS BIGINT)
END
GO


/****** Object:  StoredProcedure [dbo].[READ_SPECIFIC_ASSET_NAME]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_SPECIFIC_ASSET_NAME] (@assetname BIGINT)
AS
BEGIN
	SELECT Id
		,Assetname
	FROM MTS_ASSET_NAME WITH (NOLOCK)
	WHERE Id = @assetname
END

GO
/****** Object:  StoredProcedure [dbo].[READ_VENDOR_NAME]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE PROCEDURE [dbo].[READ_VENDOR_NAME]
AS
BEGIN
    select ID,Name from MTS_VENDORS; 
	
END

GO
/****** Object:  StoredProcedure [dbo].[READ_VENDORNAMES]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_VENDORNAMES]
AS
BEGIN
    SELECT ID,NAME FROM MTS_VENDORS
END



GO



Alter PROCEDURE [dbo].[SESSIONEMPID] (@userid BIGINT)
AS
BEGIN
	SELECT e.Employee_Id
		,e.Gender
		,e.DepartmentId
		,R.ROLE_NAME
	FROM MTS_Login
	INNER JOIN Employee e ON e.id = @userid
	LEFT JOIN MTS_AUTHORITY AS A ON A.USERID=@userid 
	LEFT JOIN MTS_ROLES AS R ON R.ROLEID=A.ROLEID
END

GO


/****** Object:  StoredProcedure [dbo].[UPDATE_ASSET]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_ASSET](@id bigint,@assettype BIGINT,@assetname VARCHAR(100),@depreciation  DECIMAL(4,2),@expectedlife BIGINT,@salvagevalue BIGINT)
AS
BEGIN 
update MTS_ASSETS set AssettypeId=@assettype,Assetname=@assetname,Depreciation=@depreciation,ExpectedLife=@expectedlife,SalvageValue=@salvagevalue where Id=@id
select 1
END

GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ASSET_DETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_ASSET_DETAILS](
@id BIGINT
, @vendorid BIGINT 
, @purchaseordernumber VARCHAR(255)
,@purchasedon DATE
,@billnumber VARCHAR(255)
,@billdate DATE
,@assettypeid BIGINT
,@assetnameid BIGINT
,@assetdescription VARCHAR(255)
,@costinrs DECIMAL(18,2)
,@costtype INT
,@make VARCHAR(255)
,@model VARCHAR(255)
,@serialnumber VARCHAR(255)
,@identificationcode VARCHAR(255)
,@warrantymonths BIGINT
,@warrantystartdate DATE
,@warrantyenddate DATE
,@invoiceid BIGINT
,@assettype_id BIGINT
,@assetname_id BIGINT
,@inuse BIGINT
)
AS
  BEGIN
       UPDATE ASSET_DETAILS SET
		VENDOR_ID=@vendorid
		,PURCHASE_ORDER_NUMBER=@purchaseordernumber
		,PURCHASED_ON=@purchasedon
		,BILL_NUMBER=@billnumber
		,BILL_DATE=@billdate
		,ASSET_TYPEID=@assettypeid
		,ASSET_NAMEID=@assetnameid
		,ASSET_DESCRIPTION=@assetdescription
		,COST=@costinrs
		,COST_TYPE=@costtype
		,MAKE=@make
		,MODEL=@model
		,SERIAL_NUMBER=@serialnumber
		,IDENTIFICATION_CODE=@identificationcode
		,WARRANTY_MONTHS=@warrantymonths
		,WARRANTY_STARTDATE=@warrantystartdate
		,WARRANTY_ENDDATE=@warrantyenddate
		,INVOICE_ID=@invoiceid
		,ASSETTYPE_ID=@assettype_id
		,ASSETNAME_ID=@assetname_id
		,IN_USE =@inuse
		 WHERE ID =@id
		
		BEGIN
		    SELECT 1
        END

 END
     


-- GO
-- /****** Object:  StoredProcedure [dbo].[UPDATE_ASSETDETAILS]    Script Date: 07/24/2019 12:27:25 PM ******/
-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO

-- create proc [dbo].[UPDATE_ASSETDETAILS](
 -- @aid bigint,
 -- @Name varchar(255),
 -- @Product varchar(255),
 -- @CategoryID bigint,
 -- @Make varchar(255),
 -- @Modle varchar(255),
 -- @SerialNumber varchar(255),
 -- @PurchasedOn datetime,
 -- @LocationId bigint,
 -- @AssignedTo bigint,
 -- @DiscardedOn datetime,
 -- @Notes varchar(max),
 -- @BillDate Datetime,
 -- @BillNumber varchar(255),
 -- @SaleCompany varchar(255),
 -- @InUse bit)  
-- as
-- begin
   
      -- update MTS_AssetDetails set Name = @Name, Product = @Product, CategoryID = @CategoryID, Make = @Make, Model = @Modle, SerialNumber = @SerialNumber, 
	                              -- PurchasedOn = @PurchasedOn, LocationId = @LocationId, AssignedTo = @AssignedTo, DiscardedOn = @DiscardedOn, Notes = @Notes,
							      -- BillDate =@BillDate, BillNumber =@BillNumber,SaleCompany = @SaleCompany, InUse = @InUse where id = @aid

-- End


-- GO


/****** Object:  StoredProcedure [dbo].[UPDATE_MESSAGE_STATUS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_MESSAGE_STATUS](
	@id BIGINT
	,@status BIT
	)
AS
BEGIN
	update MTS_MESSAGES set Status=@status where id =@id
END

GO


Alter PROC [dbo].[UPDATE_MESSAGES] (
	@id BIGINT
	,@fromdate DATE
	,@todate DATE
	,@messageheader VARCHAR(255)
	,@messagetitle VARCHAR(255)
	,@message NVARCHAR(MAX)
	,@templatetype BIGINT
	)
AS
BEGIN
	UPDATE MTS_MESSAGES
	SET FromDate = @fromdate
		,ToDate = @todate
		,MessageHeader = @messageheader
		,MessageTitle = @messagetitle
		,Message = @message
		,PostedDate =  GETDATE()
		,TemplateId = @templatetype
	WHERE id = @id
END

GO


/****** Object:  StoredProcedure [dbo].[UPDATE_UNASSIGN_ASSET]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPDATE_UNASSIGN_ASSET] @ASSET_TYPEID BIGINT
	,@ASSET_NAMEID BIGINT
	,@ASSETID BIGINT
	,@EMPLOYEEID BIGINT
	,@UNASSIGNED_DATE DATE
AS
BEGIN
	UPDATE ASSET_DETAILS
	SET CURRENTLY_ASSIGNED_TO = NULL
	WHERE ID = @ASSETID
END

BEGIN
	UPDATE ASSIGN_ASSET
	SET UNASSIGNED_DATE = @UNASSIGNED_DATE
	WHERE ASSET_TYPEID = @ASSET_TYPEID
		AND ASSET_NAMEID = @ASSET_NAMEID
		AND ITEM_CODE = @ASSETID
		AND EMPLOYEE_ID = @EMPLOYEEID
		AND UNASSIGNED_DATE IS NULL
END

GO


/****** Object:  StoredProcedure [dbo].[UPLOAD_ATTENDANCE_DATA]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UPLOAD_ATTENDANCE_DATA] (
	@employeecode VARCHAR(10)
	,@employeename VARCHAR(50)
	,@InDeviceName VARCHAR(50)
	,@OutDeviceName VARCHAR(50)
	,@StatusCode NVARCHAR(50)
	,@Duration BIGINT NULL
	,@PunchRecords NVARCHAR(MAX)
	,@InDateTime DATETIME NULL
	,@OutDateTime DATETIME NULL
	,@Month DATETIME NULL
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_ATTENDANCE
			WHERE EmployeeCode = @employeecode
				AND CAST(InDateTime AS DATE) = CAST(@InDateTime AS DATE)
				AND CAST(OutDateTime AS DATE)  = CAST(@OutDateTime AS DATE)
			)
	BEGIN
		INSERT INTO MTS_ATTENDANCE (
			EmployeeCode
			,EmployeeName
			,InDeviceName
			,OutDeviceName
			,StatusCode
			,Duration
			,PunchRecords
			,InDateTime
			,OutDateTime
			,[Month]
			)
		VALUES (
			@employeecode
			,@employeename
			,@InDeviceName
			,@OutDeviceName
			,@StatusCode
			,@Duration
			,@PunchRecords
			,@InDateTime
			,@OutDateTime
			,@Month
			)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[VIEW_ASSETDETAILS]    Script Date: 10/16/2019 01:14:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[VIEW_ASSETDETAILS] (@aid BIGINT)
AS
BEGIN
	SELECT id
		,Name
		,Product
		,CategoryID
		,Make
		,Model
		,SerialNumber
		,PurchasedOn
		,LocationId
		,AssignedTo
		,DiscardedOn
		,Notes
		,BillDate
		,BillNumber
		,SaleCompany
		,InUse
	FROM MTS_AssetDetails WITH (NOLOCK)
	WHERE id = @aid
END

GO

