CREATE PROCEDURE CREATE_AMC_OR_ASSET_INSURANCE (
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
    ,@Notes VARCHAR
	)
AS
BEGIN
INSERT INTO AMC_OR_ASSET_INSURANCE values(
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
		,@Notes)
		SELECT 1
		END
		GO



CREATE procedure READ_AMC_OR_ASSET_INSURANCE
AS
BEGIN
select * from AMC_OR_ASSET_INSURANCE
END
GO

CREATE PROCEDURE CREATE_ASSET_MAINTENANCE( 
 @assettypeid INT
,@assetname VARCHAR (255)
,@dateofpurchase date
,@vendor varchar(255)
,@maintenancecarried_out varchar(255)
,@cost money
,@notes varchar(255)
   )
AS
BEGIN
INSERT INTO Asset_Maintenance
VALUES(
@assettypeid
,@assetname 
,@dateofpurchase
,@vendor
,@maintenancecarried_out
,@cost
,@notes)
END	
GO

CREATE procedure READ_ASSET_MAINTENANCDE
AS
BEGIN
  SELECT *
	FROM Asset_Maintenance 
	
END
GO

CREATE PROCEDURE CREATE_ASSET_NAME(@assetname VARCHAR(100) )
AS
BEGIN
INSERT INTO MTS_ASSET_NAME 
VALUES(
@assetname)
select 1
END
GO


CREATE procedure READ_ASSET_SALE
AS
BEGIN
select * from ASSET_SALE
END
GO

CREATE PROCEDURE create_asset(@assettype BIGINT,@assetname VARCHAR(100),@depreciation  DECIMAL(4,2),@expectedlife BIGINT,@salvagevalue BIGINT )
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

 CREATE procedure READ_MTS_ASSET
AS
BEGIN
  SELECT asset.* 
 ,  name.Assetname as Name
  from MTS_Assets as asset
  inner join MTS_ASSET_NAME name on asset.Id=name.id;
END
GO

CREATE PROCEDURE UPDATE_ASSET(@id bigint,@assettype BIGINT,@assetname VARCHAR(100),@depreciation  DECIMAL(4,2),@expectedlife BIGINT,@salvagevalue BIGINT)
AS
BEGIN 
update MTS_ASSETS set AssettypeId=@assettype,Assetname=@assetname,Depreciation=@depreciation,ExpectedLife=@expectedlife,SalvageValue=@salvagevalue where Id=@id
select 1
END
GO

CREATE DEPARTMENT:
CREATE PROCEDURE CREATE_DEPARTMENT (@department VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Department
			FROM Mts_Department
			WHERE Department = @department
			)
	BEGIN
		INSERT INTO Mts_Department
		VALUES (@department)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

READ DEPARETMENT:
CREATE PROCEDURE READ_DEPARTMENT
AS
BEGIN
	SELECT *
	FROM Mts_Department
END
GO

UPDATE DEPARTMENT:
CREATE PROCEDURE UPDATE_DEPARTMENT (
	@id BIGINT
	,@department VARCHAR(max)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Department
			FROM Mts_Department
			WHERE Department = @department
			)
	BEGIN
		UPDATE Mts_Department
		SET Department = @department
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO



CREATE PROCEDURE CREATE_LOCATION (@location VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT LocationName
			FROM Mts_Location
			WHERE LocationName = @location
			)
	BEGIN
		INSERT INTO Mts_Location
		VALUES (@location)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

Create Procedure READ_LOCATION
as
Begin
Select * from MTS_Location
End
GO


CREATE PROCEDURE UPDATE_LOCATION (
	@id BIGINT
	,@location VARCHAR(max)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT LocationName
			FROM Mts_Location
			WHERE LocationName = @location
			)
	BEGIN
		UPDATE Mts_Location
		SET LocationName = @location
		WHERE LocationID = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO

CREATE procedure READ_ASSETDETAILS 
AS
BEGIN
	SELECT Ass.Id
	,Ass.AssettypeId
	,Ass.Assetname as AssetId
	,cat.CategoryName as AssetType
	,name.Assetname 
	,Ass.Depreciation
	,Ass.Expectedlife
	,Ass.Salvagevalue
	,Det.PurchasedOn
	,Det.Make
	,Det.Name		
	from MTS_Assets as Ass
	inner join MTS_AssetDetails Det on Ass.id=Det.id
	inner join 	MTS_ASSET_NAME name on Ass.Assetname=name.id
	inner join MTS_AssetCategories cat on Ass.AssettypeId=cat.CategoryId
END
GO

CREATE PROCEDURE READ_FILTERED_ASSET_NAME(@assettype BIGINT )
AS
BEGIN
select name.Id
,  name.Assetname
  from MTS_Assets as asset
  inner join MTS_ASSET_NAME name on asset.Assetname=name.Id  where AssettypeId=@assettype ;
END
GO

CREATE PROCEDURE READ_ASSET_NAME
AS
BEGIN
 SELECT Id ,Assetname
	FROM MTS_ASSET_NAME  
	
END
GO

CREATE PROCEDURE Read_Filtered_LeaveType(@empid BIGINT,@department BIGINT)
AS
BEGIN
DECLARE
@maritalstatus int =(select Maritalstatus from Employee where id=@empid),
@gender int=(select Gender from Employee where id=@empid)
if exists (select Dateofjoin from Employee where id=@empid and Dateofjoin>=DATEADD(day,-365,GETDATE()) )
begin 
if  @maritalstatus=2
begin
if @gender=0
begin
select
lev.* 
 ,dep.Department
FROM MTS_Department as dep
inner join MTS_LeaveType lev on dep.id=lev.DepartmentId where not lev.Leavetype= ('Earned') and lev.DepartmentId=@department and not lev.Leavetype= ('Maternity');
end
ELSE
if @gender=1
begin 
select
lev.* 
 ,dep.Department
FROM MTS_Department as dep
inner join MTS_LeaveType lev on dep.id=lev.DepartmentId where not lev.Leavetype= ('Earned') and lev.DepartmentId=@department and not lev.Leavetype= ('Paternity');
END
END
ELSE
if  @maritalstatus=1
BEGIN
select
lev.* 
 ,dep.Department
FROM MTS_Department as dep
inner join MTS_LeaveType lev on dep.id=lev.DepartmentId where not lev.Leavetype= ('Earned') and lev.DepartmentId=@department and not lev.Leavetype= ('Maternity')and not lev.Leavetype= ('Paternity');
END
END
ELSE
if @maritalstatus=2
begin
if @gender =0
BEGIN
select
lev.* 
 ,dep.Department
FROM MTS_LeaveType as lev
inner join MTS_Department dep on lev.DepartmentId=dep.id where lev.DepartmentId=@department and not lev.Leavetype= ('Maternity');
END
ELSE
if @gender = 1
BEGIN
select
lev.* 
 ,dep.Department
FROM MTS_LeaveType as lev
inner join MTS_Department dep on lev.DepartmentId=dep.id where lev.DepartmentId=@department and not lev.Leavetype= ('Paternity');
END
END
ELSE
if @maritalstatus=1
begin
select
lev.* 
 ,dep.Department
FROM MTS_Department as dep
inner join MTS_LeaveType lev on dep.id=lev.DepartmentId where lev.DepartmentId=@department and not lev.Leavetype= ('Maternity')and not lev.Leavetype= ('Paternity');
END
END
GO

