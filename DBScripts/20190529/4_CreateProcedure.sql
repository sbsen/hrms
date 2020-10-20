CREATE PROCEDURE [dbo].[CREATE_DEPARTMENT] (@department VARCHAR(255))
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


CREATE PROCEDURE [dbo].[CREATE_LOCATION] (@location VARCHAR(255))
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



CREATE PROCEDURE [dbo].[Experienced](@empid varchar)
AS
BEGIN
if exists (select Dateofjoin from Employee where Employee_Id=@empid and Dateofjoin>=DATEADD(day,-365,GETDATE()))
begin
select
lev.* 
 ,dep.Department
FROM MTS_Department as dep
inner join MTS_LeaveType lev on dep.id=lev.DepartmentId where not lev.Leavetype= ('Earned');
SELECT 1
END
else 
begin
select
lev.* 
 ,dep.Department
FROM MTS_Department as dep
inner join MTS_LeaveType lev on dep.id=lev.DepartmentId;
SELECT 0
end
END

GO


CREATE PROCEDURE [dbo].[FILTER_BANKDETAILS]
(@fromdate DATE
,@todate DATE
)  
AS  
BEGIN  
 select   
 eb.id  
 ,eb.Employee_Id  
 ,ISNULL(eb.Bankname, 'Nil') as Bankname  
 ,ISNULL(eb.Branchname, 'Nil') as Branchname  
 ,ISNULL(eb.Accountnumber,0) as Accountnumber  
 ,ISNULL(eb.Ifsc,'Nil') as Ifsc  
 ,e.Firstname +' '+ e.Lastname Name  
 ,e.Pancard  
 --,e.Dateofjoin
 ,MTLOG.ACTIVE   
 from Employee as e   
 INNER JOIN Employee_BankDetails eb on e.id = eb.Employee_Id  
 INNER JOIN MTS_LOGIN MTLOG on e.id=MTLOG.USERID  
 WHERE e.Dateofjoin BETWEEN @fromdate AND @todate 
 END
GO



CREATE PROCEDURE [dbo].[FILTER_EMPLOYEEDETAILSONDOJ](
@fromdate DATE,
@todate DATE
)
AS
BEGIN
	SELECT E.id
		,E.Employee_Id
		,E.Firstname
		,E.Lastname
		,E.Gender
		,CAST(Convert(VARCHAR(255), E.Dateofjoin, 110) AS VARCHAR(255)) AS 'Dateofjoin'
		,E.ResignedOn
		,convert(varchar(3),DATEDIFF(MONTH, E.Dateofjoin, GETDATE())/12) +' years '+
		 convert(varchar(2),DATEDIFF(MONTH,E.Dateofjoin, GETDATE()) % 12)+ ' months' as Experience
		,D.Designation
		,MA.ROLEID
		,MTLOG.Active
		,STUFF((
				SELECT ', ' + ml.Languagename
				FROM EmployeeDetails AS Em
				INNER JOIN MTS_Languages ml ON Employee_Id = E.id
				WHERE ml.id IN (
						SELECT cast(dropdowndata AS BIGINT)
						FROM function_string_to_table(Em.Languagename, ',') AS Languages
						)
				FOR XML PATH('')
				), 1, 1, '') AS Languages
		,STUFF((
				SELECT DISTINCT ', ' + ms.Skills
				FROM Employee_Skills AS Es
				INNER JOIN MTS_Skills ms ON Es.Employee_Id = E.id
				WHERE ms.id IN (
						SELECT cast(dropdowndata AS BIGINT)
						FROM function_string_to_table(Es.Skill, ',') AS Skills
						)
				FOR XML PATH('')
				), 1, 1, '') AS Skills
	FROM Employee AS E
	INNER JOIN MTS_Designation D ON D.id = E.Designation
	INNER JOIN MTS_AUTHORITY AS MA ON E.id = MA.USERID
	INNER JOIN MTS_LOGIN as MTLOG ON MTLOG.USERID=E.id
	WHERE Dateofjoin BETWEEN @fromdate AND @todate
END


GO


CREATE PROCEDURE [dbo].[GETPENDINGLEAVES] (
	@empid BIGINT
	,@leavetype BIGINT
	,@approval BIGINT
	)
AS
BEGIN
	DECLARE @NumberOfDays BIGINT = (
			SELECT sum(numberofdays)
			FROM Employee_Leave
			WHERE Employee_Id = @empid
				AND LeaveType = @leavetype
				AND Approval = @approval
			)

	SELECT ISNULL(@NumberOfDays, 0)
END

GO


CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_ALLEMPLOYEE_YEARLYONCE]
AS
BEGIN
	DECLARE @EMPLOYEEID BIGINT, @JOINDATE DATE, @DEPARTMENT BIGINT, @GENDER BIGINT, @MARITALSTATUS BIGINT
	DECLARE @LEAVETYPES TABLE(LEAVETYPE VARCHAR(50), NUMBEROFDAYS BIGINT)

	DECLARE LEAVECALC_CURSOR CURSOR FOR
	SELECT id, Dateofjoin, DepartmentId,  Gender,  MaritalStatus from Employee

	OPEN LEAVECALC_CURSOR
	FETCH NEXT FROM LEAVECALC_CURSOR INTO @EMPLOYEEID, @JOINDATE, @DEPARTMENT, @GENDER, @MARITALSTATUS

	WHILE @@FETCH_STATUS = 0
	BEGIN
		DECLARE @EARNED_LEAVE BIGINT = 0
		IF EXISTS(SELECT * FROM EmployeeLeaveBalance WHERE Employee_Id = @EMPLOYEEID)
		BEGIN
		IF EXISTS(SELECT * FROM 
			EmployeeLeaveBalance
			WHERE LeaveType IN 
			(SELECT id from MTS_LeaveType WHERE DepartmentId = @DEPARTMENT 
			AND UPPER(Leavetype) = 'EARNED')
			AND Employee_Id = @EMPLOYEEID)
			BEGIN
				SELECT @EARNED_LEAVE = ISNULL(LEAVEBALANCE,0)  FROM 
				EmployeeLeaveBalance
				WHERE LeaveType IN 
				(SELECT id from MTS_LeaveType WHERE DepartmentId =  @DEPARTMENT AND UPPER(Leavetype) = 'EARNED'
				AND Employee_Id = @EMPLOYEEID)
			END 
			
			DELETE FROM EmployeeLeaveBalance WHERE Employee_Id = @EMPLOYEEID
		END

		INSERT INTO
			@LEAVETYPES
		SELECT id
		,CASE WHEN ((UPPER(LEAVETYPE) = 'CASUAL') OR (UPPER(LEAVETYPE) = 'SICK')) THEN LT.Numberofdays
		WHEN (UPPER(LEAVETYPE) = 'EARNED') AND ISNULL(@EARNED_LEAVE,0) <> 0 AND  (ISNULL(@EARNED_LEAVE,0)+LT.Numberofdays) < 24 THEN (ISNULL(@EARNED_LEAVE,0)+LT.Numberofdays)
		WHEN (UPPER(LEAVETYPE) = 'EARNED') AND ISNULL(@EARNED_LEAVE,0) <> 0 AND  (ISNULL(@EARNED_LEAVE,0)+LT.Numberofdays) > 24 THEN 24
		WHEN (UPPER(LEAVETYPE) = 'EARNED') AND ISNULL(@EARNED_LEAVE,0) = 0 AND  DATEDIFF(YEAR,@JOINDATE, GETDATE()) > 1 THEN 12
		WHEN (UPPER(LEAVETYPE) = 'EARNED') AND ISNULL(@EARNED_LEAVE,0) = 0 AND  DATEDIFF(YEAR,@JOINDATE, GETDATE()) < 1 THEN 0
		WHEN UPPER(LEAVETYPE) = 'PATERNITY' AND @GENDER = 0 AND @MARITALSTATUS = 2 THEN LT.Numberofdays
		WHEN UPPER(LEAVETYPE) = 'MATERNITY' AND @GENDER = 1 AND @MARITALSTATUS = 2 THEN LT.Numberofdays 
		ELSE 0
		END AS NUMBEROFDAYS
		FROM
		MTS_LeaveType LT
		WHERE DEPARTMENTID = @DEPARTMENT

		INSERT INTO EmployeeLeaveBalance
		SELECT
		@EMPLOYEEID,
		LEAVETYPE,
		NUMBEROFDAYS
		FROM @LEAVETYPES

		DELETE FROM @LEAVETYPES

	FETCH NEXT FROM LEAVECALC_CURSOR INTO @EMPLOYEEID, @JOINDATE, @DEPARTMENT, @GENDER, @MARITALSTATUS
	END

	CLOSE LEAVECALC_CURSOR
	DEALLOCATE LEAVECALC_CURSOR
END

--EXEC MTS_CALCULATELEAVE_ALLEMPLOYEE_YEARLYONCE


GO


CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_ATJOIN](@EMPLOYEEID BIGINT)
AS
BEGIN
	DECLARE @JOINDATE DATE, @DEPARTMENT BIGINT, @GENDER BIGINT, @MARITALSTATUS BIGINT
	DECLARE @LEAVETYPES TABLE(LEAVETYPE VARCHAR(50), NUMBEROFDAYS BIGINT)
	SELECT @JOINDATE = Dateofjoin, @DEPARTMENT = DepartmentId, @GENDER = Gender, @MARITALSTATUS = MaritalStatus from Employee where id = @EMPLOYEEID
	INSERT INTO @LEAVETYPES

	SELECT id
		,CASE WHEN ((UPPER(LEAVETYPE) = 'CASUAL') OR (UPPER(LEAVETYPE) = 'SICK')) AND DATEPART(MONTH,@JOINDATE)-1 <> 0  THEN ((CONVERT(DECIMAL(18,2),LT.Numberofdays)/12) * (12-(DATEPART(MONTH,@JOINDATE)-1)))
		WHEN ((UPPER(LEAVETYPE) = 'CASUAL') OR (UPPER(LEAVETYPE) = 'SICK')) AND DATEPART(MONTH,@JOINDATE)-1 = 0 THEN LT.Numberofdays
		WHEN (UPPER(LEAVETYPE) = 'EARNED') THEN 0
		WHEN UPPER(LEAVETYPE) = 'PATERNITY' AND @GENDER = 0 AND @MARITALSTATUS = 2 THEN LT.Numberofdays
		WHEN UPPER(LEAVETYPE) = 'MATERNITY' AND @GENDER = 1 AND @MARITALSTATUS = 2 THEN LT.Numberofdays 
		WHEN UPPER(LEAVETYPE) = 'LOP' THEN 0
		END AS NUMBEROFDAYS
		FROM
		MTS_LeaveType LT
		WHERE DEPARTMENTID = @DEPARTMENT

		INSERT INTO EmployeeLeaveBalance
		SELECT
		@EMPLOYEEID,
		LEAVETYPE,
		NUMBEROFDAYS
		FROM @LEAVETYPES
END

--EXEC MTS_CALCULATELEAVE_ATJOIN 30116

GO


CREATE PROCEDURE [dbo].[MTS_CALCULATELEAVE_EARNEDMONTHLY]
AS
BEGIN
	DECLARE @EMPLOYEEID BIGINT, @JOINDATE DATE, @DEPARTMENT BIGINT
	DECLARE @LEAVETYPES TABLE(LEAVETYPE VARCHAR(50), NUMBEROFDAYS BIGINT)

	DECLARE LEAVECALC_CURSOR CURSOR FOR
	SELECT id, Dateofjoin, DepartmentId from Employee

	OPEN LEAVECALC_CURSOR
	FETCH NEXT FROM LEAVECALC_CURSOR INTO @EMPLOYEEID, @JOINDATE, @DEPARTMENT

	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF EXISTS(SELECT * FROM EmployeeLeaveBalance WHERE Employee_Id = @EMPLOYEEID)
		BEGIN
		IF EXISTS(SELECT * FROM 
			EmployeeLeaveBalance
			WHERE LeaveType IN 
			(SELECT id from MTS_LeaveType WHERE DepartmentId = @DEPARTMENT 
			AND UPPER(Leavetype) = 'EARNED')
			AND Employee_Id = @EMPLOYEEID)
			BEGIN
				IF NOT EXISTS(SELECT * FROM  Employee_leave
				WHERE Employee_Id = @EMPLOYEEID 
				AND LeaveType IN 
				(SELECT id from MTS_LeaveType WHERE DepartmentId = @DEPARTMENT 
				AND UPPER(Leavetype) = 'EARNED')
				AND DATEPART(YEAR,FromDate) = DATEPART(YEAR, GETDATE()))
				BEGIN
					UPDATE EmployeeLeaveBalance
					SET Leavebalance = CEILING(ISNULL(
					CASE WHEN (DATEPART(MONTH,GETDATE())-1 = 0 AND (UPPER(LT.Leavetype) = 'EARNED') AND  DATEDIFF(MONTH,@JOINDATE, GETDATE()) >= 12
					 AND Leavebalance = 0
					 )
						THEN 12
					WHEN (DATEPART(MONTH,GETDATE())-1 <> 0 AND (UPPER(LT.Leavetype) = 'EARNED') AND  DATEDIFF(MONTH,@JOINDATE, GETDATE()) >= 12 
					AND Leavebalance = 0
					)
						THEN ((CONVERT(DECIMAL(18,2),LT.Numberofdays)/12) * (12-(DATEPART(MONTH,GETDATE())-1))) 
					ELSE EmployeeLeaveBalance.Leavebalance
						END, 0))
					FROM MTS_LeaveType LT
					WHERE Employee_Id = @EMPLOYEEID
					AND EmployeeLeaveBalance.LeaveType = LT.id
					AND LT.DepartmentId = @DEPARTMENT
					AND UPPER(LT.Leavetype) = 'EARNED'
				END
			END 
			ELSE
				BEGIN
					INSERT INTO
						@LEAVETYPES
					SELECT id,
					 CASE WHEN DATEPART(MONTH,GETDATE())-1 = 0 AND (UPPER(LT.Leavetype) = 'EARNED') AND  DATEDIFF(MONTH,@JOINDATE, GETDATE()) >= 12 
									THEN 12
								WHEN (DATEPART(MONTH,GETDATE())-1 <> 0) AND (UPPER(LT.Leavetype) = 'EARNED') AND  DATEDIFF(MONTH,@JOINDATE, GETDATE()) >= 12 
									THEN ((CONVERT(DECIMAL(18,2),LT.Numberofdays)/12) * (12-(DATEPART(MONTH,@JOINDATE)-1))) END AS NUMBEROFDAYS
					FROM
					MTS_LeaveType LT
					WHERE DEPARTMENTID = @DEPARTMENT
					AND LT.Leavetype = 'EARNED'

					INSERT INTO EmployeeLeaveBalance
					SELECT
					@EMPLOYEEID,
					LEAVETYPE,
					NUMBEROFDAYS
					FROM @LEAVETYPES

					DELETE FROM @LEAVETYPES
				END
			
		END

		

	FETCH NEXT FROM LEAVECALC_CURSOR INTO @EMPLOYEEID, @JOINDATE, @DEPARTMENT
	END

	CLOSE LEAVECALC_CURSOR
	DEALLOCATE LEAVECALC_CURSOR
END
GO


CREATE PROCEDURE [dbo].[MTS_READ_ALLPOLICIES]
AS
BEGIN 
SELECT ID,POLICYNAME FROM MTS_HRPOLICIES
END

GO



CREATE PROCEDURE [dbo].[READ_DEPARTMENT]
AS
BEGIN
	SELECT *
	FROM Mts_Department
END


GO




CREATE PROCEDURE [dbo].[READ_EMPLOYEEALLLEAVEBALANCE](@empid BIGINT)
AS 
  BEGIN
		DECLARE @GENDER BIGINT, @MARITALSTATUS BIGINT

		SELECT @GENDER = gender, @MARITALSTATUS = maritalstatus
		FROM Employee where id=@empid
	IF @GENDER = 1
	BEGIN
		IF @MARITALSTATUS = 1
		BEGIN
		   SELECT E.Firstname+' '+E.Lastname AS Fullname,
		   E.id AS Employee_Id,
		   Lt.id as LeaveTypeID,
		   LT.Leavetype,
		   ELB.Leavebalance AS Leavebalance
		   FROM EmployeeLeaveBalance ELB
		   INNER JOIN MTS_LeaveType LT ON LT.id=ELB.LeaveType
		   INNER JOIN Employee E ON E.id=ELB.Employee_Id
		   WHERE ELB.Employee_Id=@empid
		   AND UPPER(LT.Leavetype) <> 'MATERNITY'
		   AND UPPER(LT.Leavetype) <> 'PATERNITY'
		END
		ELSE IF @MARITALSTATUS <> 1
		BEGIN
		SELECT E.Firstname+' '+E.Lastname AS Fullname,
		   E.id AS Employee_Id,
		    Lt.id as LeaveTypeID,
		   LT.Leavetype,
		   ELB.Leavebalance AS Leavebalance
		   FROM EmployeeLeaveBalance ELB
		   INNER JOIN MTS_LeaveType LT ON LT.id=ELB.LeaveType
		   INNER JOIN Employee E ON E.id=ELB.Employee_Id
		   WHERE ELB.Employee_Id=@empid
		   AND UPPER(LT.Leavetype) <> 'PATERNITY'
		END
	 END
	 ELSE
	 	BEGIN
		IF @MARITALSTATUS = 1
		BEGIN
		 SELECT E.Firstname+' '+E.Lastname AS Fullname,
		   E.id AS Employee_Id,
		    Lt.id as LeaveTypeID,
		   LT.Leavetype,
		   ELB.Leavebalance AS Leavebalance
		   FROM EmployeeLeaveBalance ELB
		   INNER JOIN MTS_LeaveType LT ON LT.id=ELB.LeaveType
		   INNER JOIN Employee E ON E.id=ELB.Employee_Id
		   WHERE ELB.Employee_Id=@empid
		   AND UPPER(LT.Leavetype) <> 'MATERNITY'
		   AND UPPER(LT.Leavetype) <> 'PATERNITY'
		END
		ELSE
		BEGIN IF @MARITALSTATUS <> 1
		 SELECT E.Firstname+' '+E.Lastname AS Fullname,
		   E.id AS Employee_Id,
		    Lt.id as LeaveTypeID,
		   LT.Leavetype,
		   ELB.Leavebalance AS Leavebalance
		   FROM EmployeeLeaveBalance ELB
		   INNER JOIN MTS_LeaveType LT ON LT.id=ELB.LeaveType
		   INNER JOIN Employee E ON E.id=ELB.Employee_Id
		   WHERE ELB.Employee_Id=@empid
		   AND UPPER(LT.Leavetype) <> 'MATERNITY'
		END
	END
END


GO



CREATE PROCEDURE [dbo].[Read_Filtered_LeaveType](@empid BIGINT,@department BIGINT)
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



Create procedure [dbo].[READ_LEAVETYPENAME] @leavetypeid bigint,@deptid bigint
as
begin
select Leavetype from MTS_LeaveType where id = @leavetypeid and DepartmentId = @deptid
end
GO
/****** Object:  StoredProcedure [dbo].[READ_LOCATION]    Script Date: 05/28/2019 07:07:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[READ_LOCATION]
as
Begin
Select * from MTS_Location
End
GO



CREATE PROCEDURE [dbo].[READ_LOCATION_DETAILS]
(@LOCATIONID BIGINT)
AS
  BEGIN
       SELECT PLACE_ID,PLACE_NAME FROM LOCATION_DETAILS WHERE LOCATION_ID = @LOCATIONID
  END


GO


CREATE PROCEDURE [dbo].[RESTRICT_EMPLOYEELEAVES] (  
 @empid BIGINT  
 ,@departmentId INT  
 ,@leaveTypeID BIGINT  
 ,@fromdate DATE  
 ,@todate DATE  
 ,@nextdate DATE  
 )  
AS  
BEGIN  
 DECLARE @leaveTypeName VARCHAR(255) = (  
   SELECT Leavetype  
   FROM MTS_LeaveType  
   WHERE DepartmentId = @departmentId  
    AND id = @leaveTypeID  
   )  
  
   DECLARE @masterLeaveTypeID bigint = (  
   SELECT id  
   FROM MTS_LeaveType  
   WHERE DepartmentId = @departmentId  
    AND Leavetype = 'casual'  
   )  
  
 IF (Upper(@leaveTypeName) = 'CASUAL')  
 BEGIN  
  IF EXISTS (  
    SELECT *  
    FROM Employee_Leave  
    WHERE  
      (FromDate = @fromdate  
	 OR ToDate = @fromdate  
     OR ToDate = @todate  
     OR ToDate = @nextdate
	 OR FromDate = @nextdate) and  Employee_Id = @empid  
    )  
  BEGIN  
   SELECT 2  
  END  
  ELSE  
  Begin  
  SELECT 1  
  End  
 END  
 ELSE IF EXISTS (  
   SELECT *  
   FROM Employee_Leave  
   WHERE
     ((FromDate = @fromdate And LeaveType = @masterLeaveTypeID )  
	 OR(ToDate = @fromdate And LeaveType = @masterLeaveTypeID)
    OR (ToDate = @todate AND LeaveType = @masterLeaveTypeID)  
    OR (ToDate = @nextdate AND LeaveType = @masterLeaveTypeID)
	 OR (FromDate = @nextdate AND LeaveType = @masterLeaveTypeID)) and Employee_Id = @empid  
   )  
 BEGIN  
  SELECT 2  
 END  
 ELSE  
 BEGIN  
  SELECT 1  
 END  
END  

GO



CREATE PROCEDURE [dbo].[UPDATE_DEPARTMENT] (
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



CREATE PROCEDURE [dbo].[UPDATE_LOCATION] (
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

