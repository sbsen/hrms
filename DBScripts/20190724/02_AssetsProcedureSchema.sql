/****** Object:  StoredProcedure [dbo].[CREATE_AMC/INSURANCE]    Script Date: 07/24/2019 12:27:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CREATE_AMC_INSURANCE_FILES]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_AMC_INSURANCE_FILES] ( @file VARBINARY(MAX)
,@file_name VARCHAR(255))
AS
  BEGIN 
       INSERT INTO AMC_OR_INSURANCE_DETAILS VALUES (@file,@file_name)
	  SELECT 1

  END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_AMC_OR_ASSET_INSURANCE]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_AMC_OR_ASSET_INSURANCE] (        
 @assettypeid BIGINT        
 ,@assetname VARCHAR(255)       
 ,@category BIGINT        
 ,@vendor    VARCHAR (255)        
 ,@amctype   BIGINT        
 ,@insurancetype  BIGINT        
 ,@amccharges MONEY         
 ,@premiumcharges MONEY         
 ,@paymenttype VARCHAR (255)        
 ,@paymentrefdate DATE         
    ,@paymentrefnumber BIGINT        
    ,@fromdate DATE           
    ,@todate DATE         
    ,@contactperson VARCHAR (255)        
    ,@contactphone BIGINT         
    ,@Notes VARCHAR  (255)      
    ,@item_code BIGINT  
 )        
AS        
BEGIN      
INSERT INTO AMC_OR_ASSET_INSURANCE        
(        
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
 ,Item_code)    
  values(        
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
  )        
  SELECT 1    
  END 
GO
/****** Object:  StoredProcedure [dbo].[create_asset]    Script Date: 07/24/2019 12:27:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_DETAILS]    Script Date: 07/24/2019 12:27:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_MAINTENANCE]    Script Date: 07/24/2019 12:27:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_NAME]    Script Date: 07/24/2019 12:27:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CREATE_ASSET_Sale]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_ASSET_Sale] (    
@dateofsale DATE    
,@typeofsale VARCHAR (255)    
,@saleprice MONEY    
,@soldto VARCHAR (255)    
,@apporveddate DATE    
,@apporvedref VARCHAR (255)    
,@apporvedby VARCHAR (255)     
,@notes VARCHAR (255)  
,@item_code BIGINT  
,@asset_type BIGINT  
,@asset_name BIGINT    
)    
AS    
BEGIN    
INSERT INTO  ASSET_SALE
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
,@asset_name)    
SELECT 1    
END
GO


/****** Object:  StoredProcedure [dbo].[CREATE_ASSIGN_ASSET]    Script Date: 07/24/2019 12:27:25 PM ******/
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
			INSERT INTO ASSIGN_ASSET VALUES(
			@ASSETTYPEID   
			,@ASSETNAMEID    
			,@ITEMCODE  
			,@EMPLOYEEID  
			,@DEPARTMENTID  
			,@LOCATIONID  
			,@LOCATIONDETAILSID  
			,@ACTIONDATE  
			,@NOTES
			,@ASSIGNTYPEID )
	   END
	   BEGIN 
	        UPDATE ASSET_DETAILS SET CURRENTLY_ASSIGNED_TO = @EMPLOYEEID WHERE ID = @ITEMCODE
       END
	   SELECT 1
 END





GO


/****** Object:  StoredProcedure [dbo].[CREATE_INVOICE]    Script Date: 07/24/2019 12:27:25 PM ******/
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
			SELECT 1
		END
  END

GO


/****** Object:  StoredProcedure [dbo].[CREATE_VENDORDETAILS]    Script Date: 07/24/2019 12:27:25 PM ******/
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

--Select *   from MTS_VENDORS where id=1

--alter table MTS_VENDORS alter column Email VARCHAR(max) not null


GO


/****** Object:  StoredProcedure [dbo].[FILTER_ASSETS]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FILTER_ASSETS]
(@FROMDATE DATE
,@TODATE DATE)
AS
BEGIN

SELECT 
 AD.ID
 ,VENDOR_ID
 ,MTSV.NAME AS  VENDOR_NAME
 , PURCHASE_ORDER_NUMBER
 , PURCHASED_ON
 , BILL_NUMBER
 , BILL_DATE
 , ACAT.CATEGORYNAME AS ASSET_TYPE
 , AST.ASSETNAME AS ASSET_NAME
 , ASSET_DESCRIPTION
 , COST
 , COST_TYPE
 , MAKE
 , MODEL
 , SERIAL_NUMBER
 , IDENTIFICATION_CODE
 , WARRANTY_MONTHS
 , WARRANTY_STARTDATE
 , WARRANTY_ENDDATE
 , INVOICE_ID
 , ASSETTYPE_ID
 , ASSETNAME_ID

 FROM ASSET_DETAILS AD
 LEFT JOIN MTS_ASSET_NAME AST ON AD.ASSET_NAMEID=AST.ID
 LEFT JOIN MTS_ASSETCATEGORIES ACAT ON AD.ASSET_TYPEID = ACAT.CATEGORYID
 LEFT JOIN MTS_VENDORS MTSV ON MTSV.ID=AD.VENDOR_ID
 WHERE PURCHASED_ON BETWEEN @FROMDATE AND @TODATE

 END

 
GO




/****** Object:  StoredProcedure [dbo].[FILTERED_ON_PURCHASED_DATE]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FILTERED_ON_PURCHASED_DATE]( @fromdate DATE,@todate DATE )  
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
 ,name.Assetname AS AssetName        
    ,Ass.ASSET_DESCRIPTION        
 ,year(Ass.PURCHASED_ON) as Purchased_year      
 ,t.totalcost        
 ,Ass.MAKE        
 ,emp.Firstname + emp.Lastname AS AssignedTo        
 ,Ass.SERIAL_NUMBER    
,ins.Category        
 from ASSET_DETAILS as Ass        
 INNER JOIN  MTS_ASSET_NAME name on Ass.ASSET_NAMEID=name.id        
 INNER JOIN MTS_AssetCategories cat on Ass.ASSET_TYPEID=cat.CategoryId        
 LEFT JOIN Employee emp on Ass.CURRENTLY_ASSIGNED_TO=emp.id       
 LEFT JOIN AMC_OR_ASSET_INSURANCE ins on Ass.ID=ins.Item_code  
 LEFT JOIN total t on Ass.ID=t.ID
 WHERE Ass.PURCHASED_ON BETWEEN @fromdate AND @todate   
END


/****** Object:  StoredProcedure [dbo].[READ_ALLASSETCATEGORIES]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ALLASSETCATEGORIES]
AS
BEGIN

SELECT CategoryId,CategoryName FROM MTS_AssetCategories

END
GO



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ALLASSETENTRIES]
AS
BEGIN

SELECT 
 AD.ID
 ,VENDOR_ID
 ,MTSV.NAME AS  VENDOR_NAME
 , PURCHASE_ORDER_NUMBER
 , PURCHASED_ON
 , BILL_NUMBER
 , BILL_DATE
 , ACAT.CATEGORYNAME AS ASSET_TYPE
 , AST.ASSETNAME AS ASSET_NAME
 , ASSET_DESCRIPTION
 , COST
 , COST_TYPE
 , MAKE
 , MODEL
 , SERIAL_NUMBER
 , IDENTIFICATION_CODE
 , WARRANTY_MONTHS
 , WARRANTY_STARTDATE
 , WARRANTY_ENDDATE
 , INVOICE_ID
 , ASSETTYPE_ID
 , ASSETNAME_ID

 FROM ASSET_DETAILS AD
 LEFT JOIN MTS_ASSET_NAME AST ON AD.ASSET_NAMEID=AST.ID
 LEFT JOIN MTS_ASSETCATEGORIES ACAT ON AD.ASSET_TYPEID = ACAT.CATEGORYID
 LEFT JOIN MTS_VENDORS MTSV ON MTSV.ID=AD.VENDOR_ID

 END

 
GO
/****** Object:  StoredProcedure [dbo].[READ_ALLASSETNAMES]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ALLASSETNAMES]
AS
BEGIN
SELECT ID,Assetname FROM MTS_ASSET_NAME
END
GO
/****** Object:  StoredProcedure [dbo].[READ_ALLEMPLOYEELEAVELIST]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Object:  StoredProcedure [dbo].[READ_AMC_DETAILS]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[READ_AMC_DETAILS]
(@ITEMCODE BIGINT)
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
			 ,AMC.AmcCharges
			 ,AMC.PremiumCharges
			 ,AMC.PaymentType
			 ,AMC.PaymentRefDate
			 ,AMC.PaymentRefNumber
			 ,AMC.FromDate
			 ,AMC.ToDate
			 ,AMC.ContactPerson
			 ,AMC.ContactPhone
			 ,AMC.Notes 
			 FROM [dbo].[AMC_OR_ASSET_INSURANCE] AS AMC			 
			 LEFT JOIN MTS_AssetCategories AS AC ON AMC.AssetTypeId=AC.CategoryId
			 LEFT JOIN [dbo].[MTS_ASSET_NAME] AS AN ON AMC.AssetName=AN.Id
			 LEFT JOIN MTS_VENDORS AS VM ON AMC.Vendor =VM.ID			 
			 WHERE AMC.Item_code = @ITEMCODE
   END 

   



GO
/****** Object:  StoredProcedure [dbo].[READ_AMC_INSURANCE]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_AMC_INSURANCE](
@id VARCHAR(255)
)
AS
BEGIN
SELECT 
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
,FromDate
,ToDate
,ContactPerson
,ContactPhone
,Notes From AMC_OR_ASSET_INSURANCE where Item_code=@id
END
GO
/****** Object:  StoredProcedure [dbo].[READ_AMC_OR_ASSET_INSURANCE]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[READ_AMC_OR_ASSET_INSURANCE]
AS
BEGIN
select * from AMC_OR_ASSET_INSURANCE
END
GO



/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCDE]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE procedure [dbo].[READ_ASSET_MAINTENANCE_DETAILS]
AS
BEGIN
  SELECT *
	FROM Asset_Maintenance 
	
END

GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_MAINTENANCE]    Script Date: 07/24/2019 12:27:25 PM ******/
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
		,AM.Dateofpurchase
		,MV.NAME
		,AM.MaintenanceCarried_out
		,AM.Cost
		,AM.Item_code
		,AM.Notes
		FROM Asset_Maintenance AS AM
		INNER JOIN MTS_AssetCategories AS MAC ON MAC.CategoryId=AM.AssettypeId
		INNER JOIN MTS_ASSET_NAME AS MAN ON MAN.Id =AM.Assetname 
		INNER JOIN MTS_VENDORS AS MV ON MV.ID  = AM.Vendor
		WHERE Item_code = @ITEMCODE
	END



GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_MASTER]    Script Date: 07/24/2019 12:27:25 PM ******/
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
			  FROM MTS_ASSETS AS MA
			  INNER JOIN MTS_AssetCategories AS MAC ON MAC.CategoryId=MA.AssettypeId
			  INNER JOIN MTS_ASSET_NAME AS MAN ON MAN.Id =MA.Assetname
 END
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_REPORT]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ASSET_REPORT]      
AS      
BEGIN      
SELECT   
 DET.PURCHASED_ON   
,VEN.NAME AS SUPPLIER_NAME      
,LOC.LOCATION_NAME +'('+LOC.PLACE_NAME+')' AS LOCATION       
,cat.CategoryName as ASSET_TYPE       
,name.Assetname AS ASSET_NAME     
,DET.IDENTIFICATION_CODE AS ASSET_NUMBER      
,DET.ASSET_DESCRIPTION AS ITEM_DESCRIPTION      
,DET.COST AS PURCHASE_VALUE      
,ASS.Depreciation       
,SALE.DateOfSale    
,CASE WHEN (SALE.DateOfSale IS NOT NULL) THEN    
(SELECT DATEDIFF(year, DET.PURCHASED_ON, SALE.DateOfSale) )    
WHEN (SALE.DateOfSale IS NULL)THEN    
(SELECT DATEDIFF(year, DET.PURCHASED_ON, GETDATE()) )    
END AS LIFE_IN_YRS    
,SALE.SalePrice    
FROM ASSET_DETAILS AS DET      
LEFT JOIN MTS_VENDORS VEN ON DET.VENDOR_ID=VEN.ID      
LEFT JOIN LOCATION_DETAILS LOC ON DET.CURRENTLY_ASSIGNED_TO=LOC.LOCATION_ID      
INNER JOIN MTS_AssetCategories cat on DET.ASSET_TYPEID=cat.CategoryId       
INNER JOIN  MTS_ASSET_NAME name on DET.ASSET_NAMEID=name.id       
INNER JOIN MTS_ASSETS ASS ON DET.ASSET_TYPEID=ASS.AssetTypeId and DET.ASSET_NAMEID=ASS.Assetname      
LEFT JOIN ASSET_SALE SALE ON DET.ASSET_TYPEID=SALE.Asset_Type and DET.ASSET_NAMEID=SALE.Asset_Name       
END
GO
/****** Object:  StoredProcedure [dbo].[READ_ASSET_SALE]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ASSET_SALE]
(@ITEMCODE BIGINT)
AS
  BEGIN
       SELECT Id
	          ,DateOfSale
			  ,TypeOfSale
			  ,SalePrice
			  ,SoldTo
			  ,ApporvedDate
			  ,ApporvedRef
			  ,ApporvedBy
			  ,Notes
			  FROM [dbo].[ASSET_SALE]
			  WHERE Item_code = @ITEMCODE
END

GO



/****** Object:  StoredProcedure [dbo].[READ_ASSETDETAILS]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[READ_ASSETDETAILS]         
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
 ,name.Assetname AS AssetName        
   ,Ass.ASSET_DESCRIPTION        
 ,year(Ass.PURCHASED_ON) as Purchased_year      
 ,t.totalcost        
 ,Ass.MAKE        
 ,emp.Firstname + emp.Lastname AS AssignedTo        
 ,Ass.SERIAL_NUMBER    
,ins.Category        
 from ASSET_DETAILS as Ass        
 INNER JOIN  MTS_ASSET_NAME name on Ass.ASSET_NAMEID=name.id        
 INNER JOIN MTS_AssetCategories cat on Ass.ASSET_TYPEID=cat.CategoryId        
 LEFT JOIN Employee emp on Ass.CURRENTLY_ASSIGNED_TO=emp.id       
 LEFT JOIN AMC_OR_ASSET_INSURANCE ins on Ass.ID=ins.Item_code  
 LEFT JOIN total t on Ass.ID=t.ID      
     
END


GO
/****** Object:  StoredProcedure [dbo].[READ_ASSIGN_ASSET]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ASSIGN_ASSET]
(@ITEMCODE BIGINT)
AS
BEGIN
	BEGIN
	       DECLARE @IDENTIFICATIONCODE VARCHAR(255)=(SELECT IDENTIFICATION_CODE FROM ASSET_DETAILS WHERE ID = @ITEMCODE)
	END
  BEGIN
       SELECT  AA.ID
	          ,MAC.CategoryName
			  ,MAN.Assetname
			  ,AA.ITEM_CODE
			  ,E.Firstname+' '+E.Fathername AS EMPLOYEE_NAME
			  ,MD.Department
			  ,ML.LocationName
			  ,LD.PLACE_NAME
			  ,AA.ACTION_DATE
			  ,AA.NOTES
			  ,ASSIGN_TYPEID
			  FROM ASSIGN_ASSET AA
			  LEFT JOIN MTS_AssetCategories MAC ON MAC.CategoryId=AA.ASSET_TYPEID
			  LEFT JOIN MTS_ASSET_NAME MAN ON MAN.Id=AA.ASSET_NAMEID
			  LEFT JOIN Employee E ON E.id = AA.EMPLOYEE_ID
			  LEFT JOIN MTS_Location ML ON ML.LocationID = AA.LOCATION_ID
			  LEFT JOIN LOCATION_DETAILS LD ON LD.ID =AA.LOCATION_DETAILS_ID
			  LEFT JOIN MTS_Department MD ON MD.id = AA.DEPARTMENT_ID
			  WHERE AA.ITEM_CODE = CAST(@ITEMCODE AS VARCHAR)
			  END
 END
GO



/****** Object:  StoredProcedure [dbo].[READ_CURRENTLY_ASSIGNED_EMPLOYEE]    Script Date: 07/24/2019 12:27:25 PM ******/
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
      WHERE AD.IDENTIFICATION_CODE = @ITEMCODE	  
  END

  
GO




/****** Object:  StoredProcedure [dbo].[READ_FILTERED_ASSET_NAME]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_FILTERED_ASSET_NAME](@assettype BIGINT )
AS
BEGIN
select name.Id
,  name.Assetname
  from MTS_Assets as asset
  inner join MTS_ASSET_NAME name on asset.Assetname=name.Id  where AssettypeId=@assettype ;
END
GO


/****** Object:  StoredProcedure [dbo].[READ_INVOICE_IMAGES]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_INVOICE_IMAGES]
(@ASSETCODE VARCHAR(MAX))
AS
  BEGIN
       DECLARE @INVOICEID BIGINT = (SELECT INVOICE_ID FROM ASSET_DETAILS WHERE ID = @ASSETCODE)
       SELECT INVOICE
	         ,INVOICE_NAME 
			  FROM ASSET_INVOICE_DETAILS
			  WHERE ID = @INVOICEID
  END


GO
/****** Object:  StoredProcedure [dbo].[READ_ITEMCODE]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ITEMCODE]
(@assettypeid BIGINT,@assetnameid BIGINT)
AS
BEGIN
SELECT 
ID
,identification_code  +'('+ ASSET_DESCRIPTION +')' as Item
FROM ASSET_DETAILS where ASSET_TYPEID=@assettypeid AND ASSET_NAMEID=@assetnameid
END
GO



/****** Object:  StoredProcedure [dbo].[READ_LASTINVOICEID]    Script Date: 07/24/2019 12:27:25 PM ******/
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



/****** Object:  StoredProcedure [dbo].[READ_MTS_ASSET]    Script Date: 07/24/2019 12:27:25 PM ******/
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
  from MTS_ASSETS as asset
  inner join MTS_ASSET_NAME name on asset.Assetname=name.id
  inner join MTS_AssetCategories cat on asset.AssettypeId=cat.CategoryId
END
GO



/****** Object:  StoredProcedure [dbo].[READ_SELECTED_ASSET_ITEM_CODE]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_SELECTED_ASSET_ITEM_CODE]
(@ASSETNAMEID BIGINT)
AS
  BEGIN
       SELECT IDENTIFICATION_CODE FROM ASSET_DETAILS WHERE ASSET_NAMEID = @ASSETNAMEID
  END
GO
/****** Object:  StoredProcedure [dbo].[READ_SELECTED_ITEM_DESCRIPTION]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_SELECTED_ITEM_DESCRIPTION]
(@ITEMCODE VARCHAR(255))
AS
  BEGIN 
       SELECT ASSET_DESCRIPTION FROM ASSET_DETAILS WHERE IDENTIFICATION_CODE = @ITEMCODE
  END
GO



/****** Object:  StoredProcedure [dbo].[READ_SPECIFIC_ASSET_NAME]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_SPECIFIC_ASSET_NAME](@assetname bigint)
AS
BEGIN
SELECT * FROM MTS_ASSET_NAME where Id=@assetname
END
GO



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
/****** Object:  StoredProcedure [dbo].[READ_VENDORNAMES]    Script Date: 07/24/2019 12:27:25 PM ******/
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



GO
/****** Object:  StoredProcedure [dbo].[UPDATE_ASSET]    Script Date: 07/24/2019 12:27:25 PM ******/
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
/****** Object:  StoredProcedure [dbo].[UPDATE_ASSET_DETAILS]    Script Date: 07/24/2019 12:27:25 PM ******/
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


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[VIEW_ASSETDETAILS](@aid bigint)
AS 
BEGIN
 
       Select * from MTS_AssetDetails where id = @aid 
END
GO
/****** Object:  StoredProcedure [dbo].[VIEW_EMPLOYEEDETAILS]    Script Date: 07/24/2019 12:27:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

