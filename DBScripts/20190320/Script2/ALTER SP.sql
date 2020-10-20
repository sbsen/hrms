ALTER PROCEDURE [dbo].[ACTIVATEACCOUNT](@id bigint,@active bit,@inactivedate date)
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

ALTER PROCEDURE [dbo].[CREATE_EMPLOYEE] (
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
		SET @userid=@@IDENTITY
		EXECUTE MTS_CALCULATELEAVE_ATJOIN @userid
END
GO

ALTER PROCEDURE [dbo].[CREATE_LEAVETYPE] (
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

ALTER PROCEDURE [dbo].[READ_BANKDETAILS]
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
 ,MTLOG.ACTIVE 
 from Employee as e 
 INNER JOIN Employee_BankDetails eb on e.id = eb.Employee_Id
 INNER JOIN MTS_LOGIN MTLOG on e.id=MTLOG.USERID
 END
GO

ALTER PROCEDURE [dbo].[READ_EMPLOYEE] (@empid VARCHAR(255))
AS
BEGIN
	SELECT E.id
		,E.Firstname
		,Dateofbirth
		,Dateofjoin
		,E.Email
		,E.Fathername
		,ISNULL(E.Spousename, '') AS Spousename
		,E.Pancard
		,E.Mobile
		,m.id AS maritalid
		,E.Gender
		,dep.Department
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
	WHERE Employee_Id = @empid
END
GO

ALTER PROCEDURE [dbo].[READ_EMPLOYEEDETAILS]
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
END
GO

ALTER PROCEDURE [dbo].[READ_LEAVETYPE]
AS
BEGIN
select
lev.* 
 ,dep.Department
FROM MTS_Department as dep
inner join MTS_LeaveType lev on dep.id=lev.DepartmentId;
END
GO

ALTER PROCEDURE [dbo].[SESSIONEMPID] (@userid BIGINT)
AS
BEGIN
	SELECT e.Employee_Id
		,e.Gender
		,e.DepartmentId
	FROM MTS_Login
	INNER JOIN Employee e ON e.id = @userid
END
GO

ALTER PROCEDURE [dbo].[VIEW_EMPLOYEEDETAILS] (@id BIGINT)
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