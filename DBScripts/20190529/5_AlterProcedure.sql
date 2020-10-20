Alter PROCEDURE [dbo].[ACTIVATEACCOUNT](@id bigint,@active bit,@inactivedate date)
as
Begin
if(@active=0)
begin
update MTS_LOGIN Set Status=8,Active=0,ResignedOn=@inactivedate where USERID=@id
select 0
End
else if(@active=1)
begin
update MTS_LOGIN Set Status=2,Active=1,ResignedOn=null where USERID=@id
select 1
end
End

GO


ALTER Procedure [dbo].[ALLEMPLOYEESINPAYSLIPTABLE](@year bigint,@month varchar(255))
AS 
BEGIN
SELECT 
		D.Designation
		,md.Department 
		,format(Dateofjoin, 'dd/MMM/yyyy') Dateofjoin
		,E.Pancard
		,ISNULL(E.PF_AccountNumber, 'Nil') AS PF_AccountNumber
		,ISNULL(E.PF_UAN,0) AS PF_UAN
		,ISNULL(E.ESI_Number,0) AS ESI_Number
		,ISNULL(EB.Bankname, 'Nil') Bankname
		,ISNULL(EB.Accountnumber, 0) Accountnumber
		,EP.Emp_No
		,EP.Employee_Name
		,EP.Month
		,EP.Year
		,EP.HRA
		,Ep.Basic
		,ISNULL(EP.Income_Tax,0) Income_Tax
		,EP.Paid_Days
		,EP.PF
		,ISNULL(EP.Prof_Dev,0) Prof_Dev 
		,EP.Special_Allowance
		,Ep.Medical_Allowance
		,Ep.Conveyance
		,ISNULL(Ep.Food_Allowance,0) Food_Allowance
		,ISNULL(Ep.Communication_Allowance,0) Communication_Allowance
		,ISNULL(Ep.Petrol_Allowance,0) Petrol_Allowance
		,ISNULL(Ep.Driver_Allowance,0) Driver_Allowance
		,ISNULL(Ep.Education_Allowance,0) Education_Allowance
		,Ep.Gross_Earnings
		,Ep.Professional_Tax
		,ISNULL(Ep.Meal_Pass,0) Meal_Pass
		,Ep.ESI
		,ISNULL(Ep.Others,0) Others
		,Ep.Total_Deduction
		,Ep.Net_Salary
		,Ep.Reimbursement

	FROM Employee_Payslip EP
	Full outer JOIN Employee E ON EP.Emp_No = E.Employee_Id
	full outer JOIN Employee_BankDetails EB ON E.id = EB.Employee_Id
	full outer JOIN MTS_Designation D ON D.id = E.Designation
	full outer Join MTS_Department md on md.id = E.DepartmentId
	where EP.Month=@month and EP.Year=@year
END
GO




Alter PROCEDURE [dbo].[CREATE_EMPLOYEE] (
	 @aadhar BIGINT
	,@dateofbirth DATE
	,@dateofjoin DATE 
	,@designation BIGINT
	,@email VARCHAR(255)
	,@empid VARCHAR(255)
	,@fathername VARCHAR(255)
	,@firstname VARCHAR(255)
	,@gender INT
	,@lastname VARCHAR(255)
	,@maritalstatus BIGINT
	,@mobile VARCHAR(15)
	,@nationality BIGINT
	,@pancard VARCHAR(255)
	,@spousename VARCHAR(255)
	,@pfaccount varchar(255)
	,@pfuan bigint
	,@esinum bigint
	,@departmentid bigint
	
	)
AS
BEGIN
	DECLARE @userid BIGINT

	SELECT @userid = USERID
	FROM MTS_LOGIN
	WHERE USERNAME = @email

	INSERT INTO Employee (
		 id
		,Employee_Id
		,Firstname
		,Lastname
		,Dateofbirth
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
		,Nationality
		,PF_AccountNumber
		,PF_UAN
		,ESI_Number
		,Createdtime
		,DepartmentId
		)
	VALUES (
		@userid
		,@empid
		,@firstname
		,@lastname
		,@dateofbirth
		,@dateofjoin
		,@fathername
		,@maritalstatus
		,@spousename
		,@email
		,@mobile
		,@aadhar
		,@pancard
		,@designation
		,@gender
		,@nationality
		,@pfaccount
		,@pfuan
		,@esinum
		,getdate()
	   ,@departmentid
		)

		EXECUTE MTS_CALCULATELEAVE_ATJOIN @userid
END

GO


Alter PROCEDURE [dbo].[Create_Leave_Report] (  
 @status INT  
 ,@leavetype BIGINT  
 ,@empid BIGINT  
 ,@year VARCHAR(255)  
 ,@month VARCHAR(255)  
 ,@leavebalance FLOAT  
 ,@numofdays FLOAT  
 )  
AS  
BEGIN  
 DECLARE @Nextmonthleavebalance FLOAT = 0  
 DECLARE @lopDays FLOAT = 0;  
  
 SELECT @lopDays = @numofdays;  
  
 IF (@status = 2)  
 BEGIN  
  SELECT @leavebalance = 0  
  
  IF NOT EXISTS (  
    SELECT *  
    FROM EmployeeLeavebalance  
    WHERE Employee_Id = @empid  
     AND LeaveType = @leavetype  
    )  
  BEGIN  
   SELECT @leavebalance = (  
     SELECT Numberofdays  
     FROM MTS_LeaveType  
     WHERE id = @leavetype  
     )  
  
   SELECT @leavebalance = @leavebalance - @numofdays  
  
   --IF (@leavebalance < 0)    
   --BEGIN    
   -- SELECT @leavebalance = 0    
   --END    
   INSERT INTO EmployeeLeavebalance  
   VALUES (  
    @empid  
    ,@leavetype  
    ,@leavebalance  
    )  
  END  
  ELSE  
  BEGIN  
   SELECT @leavebalance = (  
     SELECT leavebalance  
     FROM Employeeleavebalance  
     WHERE Employee_Id = @empid  
      AND LeaveType = @leavetype  
     )  
  
      select @lopDays =  @numofdays - @leavebalance   
   SELECT @leavebalance = @leavebalance - @numofdays  
  
   IF (@leavebalance < 0)  
   BEGIN  
    UPDATE EmployeeLeavebalance  
    SET Leavebalance = 0  
    WHERE Employee_Id = @empid  
     AND LeaveType = @leavetype  
   END  
   ELSE  
   BEGIN  
    UPDATE EmployeeLeavebalance  
    SET Leavebalance = @leavebalance  
    WHERE Employee_Id = @empid  
     AND LeaveType = @leavetype  
   END  
  END  
 END  
  
 IF EXISTS (  
   SELECT *  
   FROM LeaveReport  
   WHERE Month = @month  
    AND year = @year  
    AND Employee_Id = @empid  
    AND LeaveType = @leavetype  
   )  
 BEGIN  
  DECLARE @sumofdays FLOAT = @numofdays + (  
    SELECT Numberofdays  
    FROM LeaveReport  
    WHERE Month = @month  
     AND year = @year  
     AND Employee_Id = @empid  
     AND LeaveType = @leavetype  
    )  
  
   DECLARE @totalLOPDays FLOAT =0 
  
  IF (  
    @leavebalance < 0  
    AND @status <> 3  
    )  
  BEGIN  
  select @lopDays = (-1 * @leavebalance)  
 select @totalLOPDays = @lopDays + (  
    SELECT LOPDays  
    FROM LeaveReport  
    WHERE Month = @month  
     AND year = @year  
     AND Employee_Id = @empid  
     AND LeaveType = @leavetype  
    )  

   UPDATE LeaveReport  
   SET Numberofdays = @sumofdays  
    ,LOPDays = @totalLOPDays  
    ,Modifieddate = getdate()  
   WHERE Month = @month  
    AND year = @year  
    AND LeaveType = @leavetype  
    AND Employee_Id = @empid  
  END  
  ELSE IF (@status <> 3)  
  BEGIN  
   UPDATE LeaveReport  
   SET Numberofdays = @sumofdays  
    ,Modifieddate = getdate()  
   WHERE Month = @month  
    AND year = @year  
    AND LeaveType = @leavetype  
    AND Employee_Id = @empid  
  END  
  ELSE  
  BEGIN  
   
  select @totalLOPDays  = @numofdays + (  
    SELECT LOPDays  
    FROM LeaveReport  
    WHERE Month = @month  
     AND year = @year  
     AND Employee_Id = @empid  
     AND LeaveType = @leavetype  
    )  

   UPDATE LeaveReport  
   SET Numberofdays = @sumofdays  
    ,LOPDays = @totalLOPDays  
    ,Modifieddate = getdate()  
   WHERE Month = @month  
    AND year = @year  
    AND LeaveType = @leavetype  
    AND Employee_Id = @empid  
  END  
 END  
 ELSE  
 BEGIN  
  IF (@leavebalance < 0 AND @status <> 3)  
  BEGIN  
  select @lopDays = (-1 * @leavebalance)  
   INSERT INTO LeaveReport  
   VALUES (  
    @empid  
    ,@year  
    ,@month  
    ,@leavetype  
    ,@lopDays  
    ,@numofdays  
    ,getdate()  
    ,getdate()  
    ,NULL  
    )  
  END  
  ELSE IF (@status <> 3)  
  BEGIN  
   INSERT INTO LeaveReport  
   VALUES (  
    @empid  
    ,@year  
    ,@month  
    ,@leavetype  
    ,0  
    ,@numofdays  
    ,getdate()  
    ,getdate()  
    ,NULL  
    )  
  END  
  ELSE  
  BEGIN  
  select @lopDays = @numofdays  
   INSERT INTO LeaveReport  
   VALUES (  
    @empid  
    ,@year  
    ,@month  
    ,@leavetype  
    ,@lopDays  
    ,@numofdays  
    ,getdate()  
    ,getdate()  
    ,NULL  
    )  
  END  
 END  
END  
GO



Alter PROCEDURE [dbo].[CREATE_LEAVETYPE] (
	@leavetype VARCHAR(255)
	,@numberofdays BIGINT
	,@department BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_LeaveType
			WHERE Leavetype = @leavetype AND DepartmentId=@department
			)
	BEGIN
		INSERT INTO MTS_LeaveType
		VALUES (
			@leavetype
			,@numberofdays
			,@department
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END

GO




Alter PROCEDURE [dbo].[EMPLOYEE_LEAVEAPPLY] (
	@empid BIGINT
	,@leavetype BIGINT
	,@fromdate DATE
	,@fromsession BIGINT
	,@todate DATE
	,@tosession BIGINT
	,@reason VARCHAR(255)
	,@managerid BIGINT
	,@numberofdays FLOAT
	,@islop bit
	)
AS
BEGIN
	DECLARE @TEMPLATEID BIGINT = (
			SELECT TemplateID
			FROM MTS_EmailTemplate
			WHERE TemplateName = 'EMAIL_REQUEST_LEAVE'
			)
	DECLARE @manageremail VARCHAR(255) = (
			SELECT Email
			FROM Employee
			WHERE id = @managerid
			)
	DECLARE @empemail VARCHAR(255) = (
			SELECT Email
			FROM Employee
			WHERE id = @empid
			)
	DECLARE @employeeid VARCHAR(255) = (
			SELECT Employee_Id
			FROM Employee
			WHERE id = @empid
			)
	DECLARE @empname VARCHAR(255) = (
			SELECT Firstname + ' ' + Lastname AS EmployeeName
			FROM Employee
			WHERE id = @empid
			)
	DECLARE @dateofjoin DATE = (
			SELECT DateofJoin
			FROM Employee
			WHERE id = @empid
			)
	DECLARE @EMAILSP VARCHAR(255) = cast(@manageremail AS VARCHAR(255)) + ',' + cast(@empemail AS VARCHAR(255)) + ',' + cast(@employeeid AS VARCHAR(255)) + ',' + cast(@empname AS VARCHAR(255)) + ',' + cast(@dateofjoin AS VARCHAR(255)) + ',' + cast(@fromdate AS VARCHAR(255)) + ',' + cast(@todate AS VARCHAR(255)) + ',' + cast(@numberofdays AS VARCHAR(255)) + ',' + cast(@reason AS VARCHAR(255))

	BEGIN
		IF EXISTS (
		SELECT *
		FROM Employee_Leave
		WHERE  Approval <> 3
			AND Approval <> 4
			AND((@fromdate > FromDate AND @fromdate < ToDate AND Employee_Id = @empid)
			OR (@todate > FromDate AND @todate < ToDate AND Employee_Id = @empid)
			OR (@fromsession = LeaveFromSession AND FromDate = @fromdate AND Employee_Id = @empid)
			OR (@tosession = LeaveToSession AND ToDate = @todate AND Employee_Id = @empid))
		)
	BEGIN
		SELECT 0
	END
	
	Else
	Begin
	INSERT INTO Employee_Leave (
		Employee_Id
		,LeaveType
		,FromDate
		,LeaveFromSession
		,ToDate
		,LeaveToSession
		,Reason
		,Approval
		,Managerid
		,Numberofdays
		,isLOP
		)
	VALUES (
		@empid
		,@leavetype
		,@fromdate
		,@fromsession
		,@todate
		,@tosession
		,@reason
		,1
		,@managerid
		,@numberofdays
		,@islop
		)

	EXEC MTS_ADDEMAILMASTERENTRY @TEMPLATEID
		,@EMAILSP

	SELECT 1
	End
END
END




GO



Alter PROCEDURE [dbo].[LEAVE_APPROVE] (
	@status INT
	,@primaryid BIGINT
	,@approvedby BIGINT
	,@approval BIGINT
	,@empid BIGINT
	,@fromdate DATE
	,@todate DATE
	,@leavetype BIGINT
	,@reason VARCHAR(255)
	,@Numberofdays FLOAT
	,@year VARCHAR(255)
	,@month VARCHAR(255)
	)
AS
BEGIN
	DECLARE @TEMPLATEID BIGINT = (
			SELECT TemplateID
			FROM MTS_EmailTemplate
			WHERE TemplateName = 'EMAIL_LEAVE_APPROVE'
			)
	DECLARE @dateofjoin DATE = (
			SELECT DateofJoin
			FROM Employee
			WHERE id = @empid
			)
	DECLARE @empemail VARCHAR(255) = (
			SELECT Email
			FROM Employee
			WHERE id = @empid
			)
	DECLARE @employeeid VARCHAR(255) = (
			SELECT Employee_Id
			FROM Employee
			WHERE id = @empid
			)
	DECLARE @managerid VARCHAR(255) = (
			SELECT Employee_Id
			FROM Employee
			WHERE id = @approvedby
			)
	DECLARE @empname VARCHAR(255) = (
			SELECT Firstname + ' ' + Lastname AS EmployeeName
			FROM Employee
			WHERE id = @empid
			)
	DECLARE @managername VARCHAR(255) = (
			SELECT Firstname + ' ' + Lastname AS EmployeeName
			FROM Employee
			WHERE id = @approvedby
			)
	DECLARE @EMAILSP VARCHAR(max) = cast(@empemail AS VARCHAR(255)) + ',' + cast(@employeeid AS VARCHAR(255)) + ',' + cast(@empname AS VARCHAR(255)) + ',' + cast(@dateofjoin AS VARCHAR(255)) + ',' + cast(@fromdate AS VARCHAR(255)) + ',' + cast(@todate AS VARCHAR(255)) + ',' + cast(@leavetype AS VARCHAR(255)) + ',' + cast(@reason AS VARCHAR(255)) + ',' + cast(@approval AS VARCHAR(255)) + ',' + cast(@managerid AS VARCHAR(255)) + ',' + cast(@managername AS VARCHAR(255))
	DECLARE @leavebalance FLOAT = 0

	IF (@status = 1 or @status = 3)
	BEGIN
		IF NOT EXISTS (
				SELECT *
				FROM EmployeeLeavebalance
				WHERE Employee_Id = @empid
					AND LeaveType = @leavetype
				)
		BEGIN
			SELECT @leavebalance = (
			SELECT Numberofdays
				FROM MTS_LeaveType
				WHERE id = @leavetype
				)
				SELECT @leavebalance = @leavebalance - @Numberofdays
			INSERT INTO EmployeeLeavebalance
			VALUES (
				@empid
				,@leavetype
				,@leavebalance
				)
		END
		Else
		BEGIN
		 select @leavebalance=(select leavebalance from Employeeleavebalance where Employee_Id=@empid AND LeaveType = @leavetype) 
		 select @leavebalance=  @leavebalance - @Numberofdays

		 if(@status = 1)
		 begin
		  if(@leavebalance < 0)
		 begin
		 Update EmployeeLeavebalance set Leavebalance= 0 where Employee_Id=@empid AND LeaveType = @leavetype 
		 end
		 else
		 begin
		  Update EmployeeLeavebalance set Leavebalance=@leavebalance where Employee_Id=@empid AND LeaveType = @leavetype 
		 end
		 end
		END
		EXEC Create_Leave_Report @status
			,@leavetype
			,@empid
			,@year
			,@month
			,@leavebalance
			,@Numberofdays


			UPDATE Employee_Leave
	SET ApprovedBy = @approvedby
		,Approval = @approval
		,ApprovedDate = getdate()
		,leavebalance = @leavebalance
	WHERE Employee_Id = @empid
		AND id = @primaryid
	END
	Else
	Begin
		UPDATE Employee_Leave
	SET ApprovedBy = @approvedby
		,Approval = @approval
		,ApprovedDate = getdate()
		,leavebalance = (select Leavebalance from EmployeeLeaveBalance where Employee_id=@empid and LeaveType=@leavetype)
	WHERE Employee_Id = @empid
		AND id = @primaryid
	End
		


	EXEC MTS_ADDEMAILMASTERENTRY @TEMPLATEID
		,@EMAILSP

	SELECT 1
END




GO



Alter PROCEDURE [dbo].[READ_ALLEMPLOYEELEAVELIST] (
	@fromdate DATE
	,@todate DATE
	,@employeename BIGINT
	)
AS
BEGIN
	IF (@employeename = 0)
	BEGIN
		SET @employeename = NULL
	END

	SELECT e.Employee_Id
		,Approval
		,CAST(Convert(VARCHAR(255), l.FromDate, 110) AS VARCHAR(255)) AS 'FromDate'
		,CAST(Convert(VARCHAR(255), l.ToDate, 110) AS VARCHAR(255)) AS 'ToDate'
		,l.Numberofdays
		,ml.LeaveType
		,l.Reason
		,e.Firstname + ' ' + e.Lastname AS EmployeeName
	FROM MTS_LeaveType AS ml
	INNER JOIN Employee_Leave AS l ON ml.Id = l.LeaveType
	INNER JOIN Employee AS e ON l.Employee_Id = e.id
	WHERE ((cast(l.FromDate AS DATE) BETWEEN @fromdate
		AND @todate)
		OR (cast(l.ToDate AS DATE) BETWEEN @fromdate
		AND @todate))
		AND e.id = isnull(@employeename, e.id)
	order by l.FromDate asc
END


GO



Alter PROCEDURE [dbo].[READ_EMPLOYEE] (@empid VARCHAR(255))  
AS  
BEGIN  
 SELECT E.id  
  ,E.Firstname  
  ,E.Dateofbirth  
  ,E.Dateofjoin  
  ,E.Email  
  ,E.Fathername  
  ,ISNULL(E.Spousename, '') AS Spousename  
  ,E.Pancard  
  ,E.Mobile  
  ,m.id AS maritalid  
  ,E.Gender  
  ,dep.id  as departmentid
  ,d.id AS designationid  
  ,nat.id AS nationalityid  
  ,E.Aadhar  
  ,E.Lastname  
  ,E.Employee_Id  
  ,E.PF_AccountNumber  
  ,E.PF_UAN  
  ,E.ESI_Number    
 FROM Employee E  
 FULL OUTER JOIN Mts_Marital_status m ON m.id = E.Maritalstatus  
 FULL OUTER JOIN Mts_Designation d ON d.id = E.Designation  
 FULL OUTER JOIN Mts_Department dep ON dep.id = E.DepartmentId  
 FULL OUTER JOIN Mts_Nationality nat ON nat.id = E.Nationality  
 WHERE E.Employee_Id = @empid  
END

GO


Alter PROC [dbo].[READ_EMPLOYEE_LEAVEBALANCE] (@empid VARCHAR(255),@departmentid bigint)
AS
BEGIN
	IF EXISTS (
			SELECT Employee_Id
				,Gender
			FROM Employee
			WHERE gender = 0
				AND id = @empid
				
			)
		BEGIN

		SELECT emp.Employee_Id
			,emp.Firstname + ' ' + emp.Lastname Fullname
			,l.Leavetype
			,l.id as LeavetypeId
			,elb.Leavebalance
		FROM EmployeeLeaveBalance elb
		INNER JOIN Employee emp ON elb.Employee_Id = @empid
		INNER JOIN Mts_LeaveType l ON elb.LeaveType = l.id
		WHERE emp.id = @empid
		and l.DepartmentId=@departmentid
		
		UNION ALL
		
		SELECT e.Employee_Id
			,e.Firstname + ' ' + e.Lastname Fullname
			,m.LeaveType
			,Numberofdays AS Leavebalance
			,m.id as LeavetypeId
		FROM EmployeeLeaveBalance elb
		RIGHT JOIN Mts_Leavetype m ON m.id = elb.LeaveType
			AND Employee_Id =  @empid
		INNER JOIN Employee e ON e.id = @empid
		WHERE isnull(m.id, 0) <> isnull(elb.LeaveType, 0)
		and m.DepartmentId=@departmentid
END


	IF EXISTS (
			SELECT Employee_Id
				,Gender
			FROM Employee
			WHERE gender = 1
				AND id = @empid
				
			)
		BEGIN
		SELECT emp.Employee_Id
			,emp.Firstname + ' ' + emp.Lastname Fullname
			,l.Leavetype
			,elb.Leavebalance
			,l.id as LeavetypeId
		FROM EmployeeLeaveBalance elb
		INNER JOIN Employee emp ON elb.Employee_Id = @empid
		INNER JOIN Mts_LeaveType l ON elb.LeaveType = l.id
		WHERE emp.id =  @empid 
		and l.DepartmentId= @departmentid
		
		UNION ALL
		
		SELECT e.Employee_Id
			,e.Firstname + ' ' + e.Lastname Fullname
			,m.LeaveType
			,Numberofdays AS Leavebalance
			,m.id as LeavetypeId
		FROM EmployeeLeaveBalance elb
		RIGHT JOIN Mts_Leavetype m ON m.id = elb.LeaveType
			AND Employee_Id = @empid
		INNER JOIN Employee e ON e.id = @empid
		WHERE isnull(m.id, 0) <> isnull(elb.LeaveType, 0) and m.DepartmentId=@departmentid
	END
END


GO


Alter PROCEDURE [dbo].[READ_EMPLOYEEDETAILS]
AS
BEGIN
	SELECT E.id
		,E.Employee_Id
		,E.Firstname
		,E.Lastname
		,E.Gender
		,case E.Gender when 0 then 'Male' when 2 then 'Female' else 'transgender' end as Gender_Name
		,E.Fathername
		,CAST(Convert(VARCHAR(255), E.Dateofbirth, 110) AS VARCHAR(255)) AS 'Dateofbirth'
		,E.DepartmentId
		,Dt.Department
		,E.PF_AccountNumber
		,E.Aadhar
		,E.PF_UAN
		,E.Pancard
		,CAST(Convert(VARCHAR(255), E.Dateofjoin, 110) AS VARCHAR(255)) AS 'Dateofjoin'
		,CAST(Convert(VARCHAR(255), MTLOG.ResignedOn, 110) AS VARCHAR(255)) AS 'ResignedOn'
		,case when MTLOG.Active = 1 then
		 convert(varchar(3),DATEDIFF(MONTH, E.Dateofjoin, GETDATE())/12) +' y '+
		 convert(varchar(2),DATEDIFF(MONTH,E.Dateofjoin, GETDATE()) % 12)+ ' m' 
		 when MTLOG.Active = 0 then
		 convert(varchar(3),DATEDIFF(MONTH, E.Dateofjoin, MTLOG.ResignedOn)/12) +' y '+
		 convert(varchar(2),DATEDIFF(MONTH,E.Dateofjoin, MTLOG.ResignedOn) % 12)+ ' m' 
		 end as Experience
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
	INNER JOIN MTS_Department Dt ON Dt.id = E.DepartmentId
	INNER JOIN MTS_AUTHORITY AS MA ON E.id = MA.USERID
	INNER JOIN MTS_LOGIN as MTLOG ON MTLOG.USERID=E.id
END


GO



Alter PROCEDURE [dbo].[READ_LEAVETYPE]
AS
BEGIN
select
lev.* 
 ,dep.Department
FROM MTS_Department as dep
inner join MTS_LeaveType lev on dep.id=lev.DepartmentId;
END

GO



Alter PROC [dbo].[Read_Payslip] (@employeeid varchar(255),@year bigint,@month varchar(255))
AS
BEGIN
	SELECT 
		D.Designation
		,md.Department 
		,format(Dateofjoin, 'dd/MMM/yyyy') Dateofjoin
		,E.Pancard
		,ISNULL(E.PF_AccountNumber, 'Nil') AS PF_AccountNumber
		,ISNULL(E.PF_UAN,0) AS PF_UAN
		,ISNULL(E.ESI_Number,0) AS ESI_Number
		,ISNULL(EB.Bankname, 'Nil') Bankname
		,ISNULL(EB.Accountnumber, 0) Accountnumber
		,EP.Emp_No
		,E.Firstname +' '+E.Lastname as Employee_Name
		,EP.Month
		,EP.Year
		,EP.HRA
		,Ep.Basic
		,ISNULL(EP.Income_Tax,0) Income_Tax
		,EP.Paid_Days
		,EP.PF
		,ISNULL(EP.Prof_Dev,0) Prof_Dev 
		,EP.Special_Allowance
		,Ep.Medical_Allowance
		,Ep.Conveyance
		,ISNULL(Ep.Food_Allowance,0) Food_Allowance
		,ISNULL(Ep.Communication_Allowance,0) Communication_Allowance
		,ISNULL(Ep.Petrol_Allowance,0) Petrol_Allowance
		,ISNULL(Ep.Driver_Allowance,0) Driver_Allowance
		,ISNULL(Ep.Education_Allowance,0) Education_Allowance
		,Ep.Gross_Earnings
		,Ep.Professional_Tax
		,ISNULL(Ep.Meal_Pass,0) Meal_Pass
		,Ep.ESI
		,ISNULL(Ep.Others,0) Others
		,Ep.Total_Deduction
		,Ep.Net_Salary
		,Ep.Reimbursement

	FROM Employee_Payslip EP
	Full outer JOIN Employee E ON EP.Emp_No = E.Employee_Id
	full outer JOIN Employee_BankDetails EB ON E.id = EB.Employee_Id
	full outer JOIN MTS_Designation D ON D.id = E.Designation
	full outer Join MTS_Department md on md.id = E.DepartmentId
	where EP.Emp_No=@employeeid and EP.Month=@month and EP.Year=@year
END


GO


Alter PROCEDURE [dbo].[READ_PENDINGLEAVELIST] (@managerid BIGINT)
AS
BEGIN
	SELECT DISTINCT l.Employee_Id
		,ml.id
		,l.FromDate
		,l.ToDate
		,l.Numberofdays NumberOfDays
		,l.LeaveFromSession
		,l.LeaveToSession
		,ml.LeaveType
		,l.id AS primaryid
		,l.Reason
		,l.FromDate
		,l.ToDate
		,l.isLOP
		,(
			SELECT e.Firstname + ' ' + e.Lastname AS EmployeeName
			FROM Employee AS e
			WHERE e.id = l.Employee_Id
			) AS EmployeeName
		,(
			SELECT e.Employee_Id AS Empid
			FROM Employee AS e
			WHERE e.id = l.Employee_Id
			) AS Empid
	FROM MTS_LeaveType AS ml
	INNER JOIN Employee_Leave AS l ON ml.Id = l.LeaveType
	INNER JOIN Employee AS e ON l.Approval = 1
	WHERE l.Managerid = @managerid
END



GO


Alter PROCEDURE [dbo].[SESSIONEMPID] (@userid BIGINT)
AS
BEGIN
	SELECT e.Employee_Id
		,e.Gender
		,e.DepartmentId
	FROM MTS_Login
	INNER JOIN Employee e ON e.id = @userid
END

GO

Alter PROCEDURE [dbo].[UPDATE_EMPLOYEE] (  
 @aadhar BIGINT  
 ,@dateofbirth DATE  
 ,@dateofjoin DATE  
 ,@designation BIGINT  
 ,@department BIGINT 
 ,@email VARCHAR(255)  
 ,@empid VARCHAR(max)  
 ,@fathername VARCHAR(255)  
 ,@firstname VARCHAR(255)  
 ,@gender VARCHAR(max)  
 ,@id BIGINT  
 ,@lastname VARCHAR(255)  
 ,@maritalstatus BIGINT  
 ,@mobile VARCHAR(15)  
 ,@nationality BIGINT  
 ,@pancard VARCHAR(255)  
 ,@spousename VARCHAR(255)  
 ,@pfaccountno varchar(255)  
 ,@pfuan bigint  
 ,@esi bigint   )  
AS  
BEGIN  
 UPDATE Employee  
 SET Aadhar = @aadhar  
  ,Dateofbirth = @dateofbirth  
  ,Dateofjoin = @dateofjoin  
  ,Designation = @designation  
  ,DepartmentId = @department  
  ,Email = @email  
  ,Fathername = @fathername  
  ,Firstname = @firstname  
  ,Gender = @gender  
  ,Lastname = @lastname  
  ,Maritalstatus = @maritalstatus  
  ,Mobile = @mobile  
  ,Nationality = @nationality  
  ,Pancard = @pancard  
  ,Spousename = @spousename  
  ,PF_AccountNumber=@pfaccountno  
  ,PF_UAN=@pfuan  
  ,ESI_Number=@esi  
 WHERE id = @id  
  
 SELECT id  
 FROM Employee  
 WHERE id = @id  
END

GO



Alter PROCEDURE [dbo].[UPDATE_LEAVETYPE] (
	@id BIGINT
	,@leavetype VARCHAR(255)
	,@numberofdays BIGINT
	,@department BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_LeaveType
			WHERE Leavetype = @leavetype AND DepartmentId=@department
			)
	BEGIN
		UPDATE MTS_LeaveType
		SET Leavetype = @leavetype
			,Numberofdays = @numberofdays
			,DepartmentId=@department
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END

GO



Alter PROCEDURE [dbo].[VIEW_EMPLOYEEDETAILS] (@id BIGINT)
AS
BEGIN
	SELECT DISTINCT E.id
		,E.Firstname
		,D.Designation AS Designation
		,E.dateofbirth AS Dateofbirth
		,Dateofjoin
		,E.Email
		,MLOG.Active
		,MLOG.ResignedOn
		,E.Fathername
		,E.Spousename
		,E.Pancard
		,E.Mobile
		,E.DepartmentId
		,DEP.Department
		,nat.Nationality
		,E.Aadhar
		,E.Lastname
		,E.Employee_Id
		,B.BloodGroup
		,Q.Qualification
		,marital.Marital_status
		,E.Gender
		,DATEDIFF(hour, E.Dateofbirth, GETDATE()) / 8766.0 AS AgeYearsDecimal
		,CONVERT(BIGINT, ROUND(DATEDIFF(hour, E.Dateofbirth, GETDATE()) / 8766.0, 0)) AS Employee_Age
		,Emd.BloodGroup
		,m.Relationship AS ContactRelationship
		,EC.Emergency_ContactName
		,EC.Emergency_ContactNumber
		,EC.Employee_Alternate_Mobile
		,EC.Personal_MailId AS PersonalMail
		,a.CurrentBuilding_Plot
		,a.CurrentCity
		,a.CurrentState
		,a.CurrentPincode
		,a.PermanentBuilding_Plot
		,a.PermanentCity
		,a.PermanentState
		,a.PermanentPincode
		,Es.Skill AS Skills
		,Emd.Languagename
		,Es.Certificationname
		,EEDU.Schoolname
		,Schoolpassedoutyear
		,EEDU.Collegename
		,Collegepassedoutyear
		,EEDU.Collegename
		,EEDU.Collegepassedoutyear
		,EEDU.Qualification
		,EBank.Bankname
		,EBank.Branchname
		,EBank.Accountnumber
		,EBank.Ifsc
		,ED.Dependentname
		,R.Relationship
		,ED.Dateofbirth AS RelDateofbirth
	FROM Employee AS E
	FULL OUTER JOIN EmployeeDetails Emd ON Emd.Employee_Id = E.id
	FULL OUTER JOIN Employee_Contacts Ec ON Ec.Employee_Id = E.id
	FULL OUTER JOIN Employee_Educations EEDU ON EEDU.Employee_Id = E.id
	FULL OUTER JOIN Employee_Languages EL ON E.Employee_Id = EL.Employee_Id
	FULL OUTER JOIN Employee_Skills ES ON ES.Employee_Id = E.id
	FULL OUTER JOIN Employee_Dependents ED ON ED.Employee_Id = E.id
	FULL OUTER JOIN Employee_Address a ON a.Employee_Id = E.id
	FULL OUTER JOIN MTS_Nationality nat ON nat.id = E.Nationality
	FULL OUTER JOIN MTS_Qualification Q ON Q.id = EEDU.Qualification
	FULL OUTER JOIN MTS_Languages L ON L.id = Emd.id
	--FULL OUTER JOIN MTS_Skills s ON s.id = ES.Skill
	FULL OUTER JOIN Employee_BankDetails EBank ON EBank.Employee_Id = E.id
	FULL OUTER JOIN Mts_Marital_status marital ON marital.id = E.Maritalstatus
	FULL OUTER JOIN MTS_Designation D ON D.id = E.Designation
	FULL OUTER JOIN MTS_Department DEP ON DEP.id=E.DepartmentId
	FULL OUTER JOIN MTS_Relationship R ON R.id = ED.Relationship
	FULL OUTER JOIN MTS_Relationship m ON m.id = EC.Contact_Relationship
	FULL OUTER JOIN MTS_BloodGroup B ON B.id = Emd.BloodGroup
	Full OUTER JOIN MTS_LOGIN MLOG ON MLOG.USERID=E.id
	WHERE E.id = @id

	SELECT DISTINCT *
	FROM EmployeeDetails AS Em
	INNER JOIN MTS_Languages ml ON Employee_Id = @id
	WHERE ml.id IN (
			SELECT cast(dropdowndata AS BIGINT)
			FROM function_string_to_table(Em.Languagename, ',')
			)

	SELECT DISTINCT *
	FROM Employee_Skills AS Es
	INNER JOIN MTS_Skills ms ON Employee_Id = @id
	WHERE ms.id IN (
			SELECT cast(dropdowndata AS BIGINT)
			FROM function_string_to_table(Es.Skill, ',')
			)
END

GO


