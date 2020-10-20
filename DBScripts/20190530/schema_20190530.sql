CREATE TABLE [dbo].[HR_POLICYDOCUMENTS](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[DocumentId] [bigint] NOT NULL,
	[DocumentImage] [varbinary](max) NULL,
	[DocumentName] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


CREATE PROCEDURE [dbo].[READ_POLICYIMAGES](
@documentid BIGINT
)
AS 
BEGIN
SELECT DocumentImage, DocumentName
	FROM  HR_POLICYDOCUMENTS
	WHERE DocumentId = @documentid
		
END



GO


CREATE PROCEDURE [dbo].[CREATE_POLICY](
	@documentid BIGINT
	,@documentimage VARBINARY(max)
	,@documentname varchar(255)
)
AS
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM HR_POLICYDOCUMENTS
			WHERE DocumentId = @documentid
			)
			BEGIN
		INSERT INTO HR_POLICYDOCUMENTS
		VALUES (
			 @documentid
			,@documentimage
			,@documentname
			)
	END
	ELSE
	BEGIN
		UPDATE HR_POLICYDOCUMENTS
		SET DocumentImage = @documentimage, DocumentName = @documentname
		WHERE  DocumentId = @documentid
	END
END
	


GO


ALTER PROCEDURE [dbo].[FILTER_EMPLOYEEDETAILSONDOJ](
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
,case E.Gender when 0 then 'Male' when 1 then 'Female' else 'transgender' end as Gender_Name
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
WHERE Dateofjoin BETWEEN @fromdate AND @todate
END
Go



ALTER PROCEDURE [dbo].[READ_EMPLOYEEDETAILS]
AS
BEGIN
SELECT E.id
,E.Employee_Id
,E.Firstname
,E.Lastname
,E.Gender
,case E.Gender when 0 then 'Male' when 1 then 'Female' else 'transgender' end as Gender_Name
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

Go



ALTER Procedure [dbo].[READ_LOCATION]  
as  
Begin  
Select LocationId as LocationID
,LocationName

 from MTS_Location  
End


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





ALTER PROCEDURE [dbo].[READ_EMPLOYEEALLLEAVEBALANCE](@empid BIGINT)
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
		   E.Employee_Id,
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
		   E.Employee_Id,
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
		   E.Employee_Id,
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
		   E.Employee_Id,
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
