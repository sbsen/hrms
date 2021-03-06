USE [MTSIN_HR]
GO
/****** Object:  UserDefinedFunction [dbo].[function_string_to_table]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[function_string_to_table] (
	@string VARCHAR(MAX)
	,@delimiter CHAR(1)
	)
RETURNS @output TABLE (Dropdowndata VARCHAR(256))

BEGIN
	DECLARE @start INT
		,@end INT

	SELECT @start = 1
		,@end = CHARINDEX(@delimiter, @string)

	WHILE @start < LEN(@string) + 1
	BEGIN
		IF @end = 0
			SET @end = LEN(@string) + 1

		INSERT INTO @output (Dropdowndata)
		VALUES (SUBSTRING(@string, @start, @end - @start))

		SET @start = @end + 1
		SET @end = CHARINDEX(@delimiter, @string, @start)
	END

	RETURN
END
GO
/****** Object:  UserDefinedFunction [dbo].[NumberOfDays]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE function [dbo].[NumberOfDays](@leavefromdate datetime,@leavetodate datetime,@fromsession varchar(255),@tosession varchar(255))
	  returns float(4)
	  as
	  begin
		declare @numofday float = 0 
		set @numofday=
			((select ((datediff(day,@leavefromdate,@leavetodate)-1)
						+ case when @fromsession = 1 and (datediff(day,@leavefromdate,@leavetodate) <> 0 or datediff(day,@leavefromdate,@leavetodate) = 0) then 1 else 0.5 end
						+ case when @tosession = 1 and datediff(day,@leavefromdate,@leavetodate) <> 0 then 1 else 0.5 end
						+ case when datediff(day,@leavefromdate,@leavetodate) = 0  then 0.5 else 0 end)) 
						- (dbo.weekend (@leavefromdate,@leavetodate)))
					return @numofday
				end
GO
/****** Object:  UserDefinedFunction [dbo].[Weekend]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[Weekend] (@fromdate datetime,@todate datetime)
	  returns varchar(4)
	  as
	  begin
		declare @days int = 0
		set @days =
			((DATEDIFF(wk, @fromdate, @todate) * 2)
			
			+(CASE WHEN DATENAME(dw, @fromdate) = 'Sunday' THEN 1 ELSE 0 END)
			+(CASE WHEN DATENAME(dw, @todate)   = 'Saturday' THEN 1 ELSE 0 END)
			+(CASE WHEN @fromdate <= '12-15-2017' AND @todate>= '12-17-2017' THEN 1 ELSE 0 END)
			+(CASE WHEN @fromdate <= '12-18-2017' AND @todate>= '12-19-2017' THEN 1 ELSE 0 END)
			)
		return cast(@days as varchar )
	  End
GO
/****** Object:  StoredProcedure [dbo].[ACTIVATEACCOUNT]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ACTIVATEACCOUNT](@id bigint,@active bit)
as
Begin
if(@active=0)
begin
update MTS_LOGIN Set Status=8,Active=0,ResignedOn=GETDATE() where USERID=@id
select 0
End
else if(@active=1)
begin
update MTS_LOGIN Set Status=2,Active=1,ResignedOn=null where USERID=@id
select 1
end
End
GO
/****** Object:  StoredProcedure [dbo].[ALLEMPLOYEESINPAYSLIPTABLE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ALLEMPLOYEESINPAYSLIPTABLE](@year bigint,@month varchar(255))
AS 
BEGIN
SELECT 
		D.Designation
		,E.Department
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
	where EP.Month=@month and EP.Year=@year
END
GO
/****** Object:  StoredProcedure [dbo].[CHECKUSERID]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[CHECKUSERID](@userid bigint)
as
Begin
if exists(select * from SeecuredAuthorization where Employee_Id=@userid)
begin
select 1
End
else
begin
select 0
End
End
GO
/****** Object:  StoredProcedure [dbo].[CREATE_BLOODGROUP]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_BLOODGROUP] (@bloodgroup VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT BloodGroup
			FROM MTS_BloodGroup
			WHERE BloodGroup = @bloodgroup
			)
	BEGIN
		INSERT INTO MTS_BloodGroup
		VALUES (@bloodgroup)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_DESIGNATION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_DESIGNATION] (@designation VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Designation
			FROM Mts_Designation
			WHERE Designation = @designation
			)
	BEGIN
		INSERT INTO Mts_Designation
		VALUES (@designation)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_EMPLOYEE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CREATE_EMPLOYEE] (
	 @aadhar BIGINT
	,@dateofbirth DATE
	,@dateofjoin DATE 
	,@designation BIGINT
	,@department varchar(255)
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
		,Department
		,Gender
		,Nationality
		,PF_AccountNumber
		,PF_UAN
		,ESI_Number
		,Createdtime
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
		,@department
		,@gender
		,@nationality
		,@pfaccount
		,@pfuan
		,@esinum
		,getdate()
		)
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_EMPLOYEE_DOCUMENTS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATE_EMPLOYEE_DOCUMENTS] (
	@empid BIGINT
	,@documentid BIGINT
	,@documentimage VARBINARY(max)
	,@documentname varchar(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM Employee_documents
			WHERE DocumentId = @documentid
				AND Employee_Id = @empid
			)
	BEGIN
		INSERT INTO Employee_documents
		VALUES (
			@empid
			,@documentid
			,@documentimage
			,@documentname
			)
	END
	ELSE
	BEGIN
		UPDATE Employee_documents
		SET DocumentImage = @documentimage, DocumentName = @documentname
		WHERE Employee_Id = @empid
			AND DocumentId = @documentid
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_EMPLOYEE_IMAGE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_EMPLOYEE_IMAGE] (
	@empid BIGINT
	,@image VARBINARY(max)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM EmployeeImage
			WHERE Employee_Id = @empid
			)
	BEGIN
		INSERT INTO EmployeeImage (
			Employee_ID
			,IMAGE
			)
		VALUES (
			@empid
			,@image
			)
	END
	ELSE IF EXISTS (
			SELECT Employee_Id
			FROM EmployeeImage
			WHERE Employee_Id = @empid
			)
	BEGIN
		UPDATE EmployeeImage
		SET IMAGE = @image
		WHERE Employee_Id = @empid
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_GOVERNMENT_ID]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_GOVERNMENT_ID] (@idname VARCHAR(max))
AS
BEGIN
	IF NOT EXISTS (
			SELECT IdName
			FROM Mts_Government_Id
			WHERE IdName = @idname
			)
	BEGIN
		INSERT INTO MTS_Government_Id
		VALUES (@idname)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_HOLIDAYS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[CREATE_HOLIDAYS] (
	@yearofholiday VARCHAR(255)
	,@holidayreason VARCHAR(255)
	,@dateofholiday DATE
	,@dayname VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT YearOfHoliday
				,HolidayReason
				,DateOfHoliday
			FROM HolidaysList
			WHERE YearOfHoliday = @yearofholiday
				OR HolidayReason = @holidayreason
				OR DateOfHoliday = @dateofholiday
			)
	BEGIN
		INSERT INTO HolidaysList (
			YearOfHoliday
			,HolidayReason
			,DateOfHoliday
			,DayNameofDate
			)
		VALUES (
			@yearofholiday
			,@holidayreason
			,@dateofholiday
			,@dayname
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_LANGUAGES]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_LANGUAGES] (@languagename VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Languagename
			FROM MTS_Languages
			WHERE Languagename = @languagename
			)
	BEGIN
		INSERT INTO MTS_Languages
		VALUES (@languagename)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Create_Leave_Report]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Create_Leave_Report] (
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
			--	SELECT @leavebalance = 0
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
		 select @leavebalance=(select leavebalance from Employeeleavebalance where Employee_Id=@empid AND LeaveType = @leavetype) 
		 select @leavebalance=  @leavebalance - @numofdays
		Update EmployeeLeavebalance set Leavebalance=@leavebalance where Employee_Id=@empid AND LeaveType = @leavetype 
		END
		--BEGIN
		--	IF EXISTS (
		--			SELECT TOP 1 leavebalance
		--			FROM LeaveReport
		--			WHERE Employee_Id = @empid
		--				AND Leavetype = @leavetype
		--				AND Month = @month
		--				AND year = @year
		--			ORDER BY Approveddate DESC
		--			)
		--	BEGIN
		--		SELECT @leavebalance = (
		--				SELECT TOP 1 leavebalance
		--				FROM LeaveReport
		--				WHERE Employee_Id = @empid
		--					AND Leavetype = @leavetype
		--					AND Month = @month
		--					AND year = @year
		--				ORDER BY Approveddate DESC
		--				)

		--		SELECT @leavebalance = @leavebalance - @numofdays
		--	END
		--	ELSE
		--	BEGIN
		--		SELECT @leavebalance = (
		--				SELECT TOP 1 leavebalance
		--				FROM LeaveReport
		--				WHERE Employee_Id = @empid
		--					AND Leavetype = @leavetype
		--				ORDER BY Approveddate DESC
		--				)

		--		SELECT @leavebalance = @leavebalance - @numofdays
		--	END

		--	IF EXISTS (
		--			SELECT TOP 1 *
		--			FROM Leavereport
		--			WHERE year > @year
		--			ORDER BY year
		--				,Approveddate
		--			)
		--	BEGIN
		--		SELECT @Nextmonthleavebalance = @leavebalance - (
		--				SELECT TOP 1 Numberofdays
		--				FROM LeaveReport
		--				WHERE year < @year
		--				ORDER BY ApprovedDate DESC
		--				)

		--		IF (@Nextmonthleavebalance < 0)
		--		BEGIN
		--			SELECT @Nextmonthleavebalance = 0
		--		END

		--		UPDATE LeaveReport
		--		SET Leavebalance = @Nextmonthleavebalance
		--			,ModifiedDate = getdate()
		--	END
		--	ELSE
		--	BEGIN
		--		IF (@leavebalance < 0)
		--		BEGIN
		--			SELECT @leavebalance = 0
		--		END

		--		UPDATE EmployeeLeavebalance
		--		SET Leavebalance = @leavebalance
		--		WHERE Employee_Id = @empid
		--			AND Leavetype = @leavetype
		--	END
		--END
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

		UPDATE LeaveReport
			set Numberofdays = @sumofdays
			,Modifieddate = getdate()
		WHERE Month = @month
			AND year = @year
			AND LeaveType = @leavetype
			AND Employee_Id = @empid

	--	IF EXISTS (
	--			SELECT *
	--			FROM LeaveReport
	--			WHERE Employee_Id = @empid
	--				AND LeaveType = @leavetype
	--				AND ModifiedDate IS NULL
	--			)
	--	BEGIN
	--		DECLARE @templeavebalance FLOAT = (
	--				SELECT TOP 1 LeaveBalance
	--				FROM LeaveReport
	--				WHERE Employee_Id = @empid
	--				ORDER BY ModifiedDate DESC
	--				)

	--		UPDATE LeaveReport
	--		SET Modifieddate = getdate()
	--			,LeaveBalance = @leavebalance - @templeavebalance
	--		WHERE Employee_Id = @empid
	--			AND LeaveType = @LeaveType
	--			AND Modifieddate IS NULL

	--		UPDATE EmployeeLeaveBalance
	--		SET LeaveBalance = (
	--				SELECT TOP 1 LeaveBalance
	--				FROM LeaveReport
	--				WHERE Employee_Id = @empid
	--					AND Leavetype = @leavetype
	--				ORDER BY createddate DESC
	--				) WHERE Employee_Id = @empid
	--				AND Leavetype = @leavetype
	--	END
	--END
	End
	ELSE
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
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_LEAVESESSION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_LEAVESESSION] (@session VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Session
			FROM Mts_Session
			WHERE Session = @session
			)
	BEGIN
		INSERT INTO Mts_Session
		VALUES (@session)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_LEAVETYPE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_LEAVETYPE] (
	@leavetype VARCHAR(255)
	,@numberofdays BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_LeaveType
			WHERE Leavetype = @leavetype
			)
	BEGIN
		INSERT INTO MTS_LeaveType
		VALUES (
			@leavetype
			,@numberofdays
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_MARITAL_STATUS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_MARITAL_STATUS] (@marital_status VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM Mts_Marital_status
			WHERE Marital_status = @marital_status
			)
	BEGIN
		INSERT INTO Mts_Marital_status
		VALUES (@marital_status)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_MESSAGES]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[CREATE_MESSAGES] (
	@employeeid BIGINT
	,@fromdate DATETIME
	,@todate DATETIME
	,@messageheader VARCHAR(255)
	,@messagetitle VARCHAR(255)
	,@message VARCHAR(255)
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
			FROM MTS_MESSAGES
			WHERE Employee_Id = @employeeid
				AND FromDate = @fromdate
				AND ToDate = @todate
				AND MessageHeader = @messageheader
				AND MessageTitle = @messagetitle
				AND Message = @message
			)
	BEGIN
		INSERT INTO MTS_MESSAGES (
			Employee_Id
			,FromDate
			,ToDate
			,MessageHeader
			,MessageTitle
			,Message
			)
		VALUES (
			 @employeeid
			,@fromdate
			,@todate
			,@messageheader
			,@messagetitle
			,@message
			)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_NATIONALITY]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_NATIONALITY] (@nationality VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_Nationality
			WHERE Nationality = @nationality
			)
	BEGIN
		INSERT INTO MTS_Nationality
		VALUES (@nationality)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_QUALIFICATION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_QUALIFICATION] (@qualification VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Qualification
			FROM MTS_Qualification
			WHERE Qualification = @qualification
			)
	BEGIN
		INSERT INTO MTS_Qualification
		VALUES (@qualification)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_RELATIONSHIP]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_RELATIONSHIP] (@relationship VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Relationship
			FROM Mts_Relationship
			WHERE Relationship = @relationship
			)
	BEGIN
		INSERT INTO Mts_Relationship
		VALUES (@relationship)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_SKILLS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_SKILLS] (@skills VARCHAR(255))
AS
BEGIN
	IF NOT EXISTS (
			SELECT Skills
			FROM MTS_Skills
			WHERE Skills = @skills
			)
	BEGIN
		INSERT INTO MTS_Skills
		VALUES (@skills)

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_USER_CONTACTS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_USER_CONTACTS] (
	@employeeid VARCHAR(max)
	,@alternatemobile VARCHAR(max)
	,@personalmail VARCHAR(max)
	,@contactname VARCHAR(max)
	,@contactnumber VARCHAR(max)
	,@relationship BIGINT
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM Employee_Contacts
			WHERE Employee_Id = @employeeid
				AND Employee_Alternate_Mobile = @alternatemobile
				AND Personal_MailId = @personalmail
				AND Emergency_ContactName = @contactname
				AND Emergency_ContactNumber = @contactnumber
				AND Contact_Relationship = @relationship
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM Employee_Contacts
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE Employee_Contacts
		SET Employee_Id = @employeeid
			,Employee_Alternate_Mobile = @alternatemobile
			,Personal_MailId = @personalmail
			,Emergency_ContactName = @contactname
			,Emergency_ContactNumber = @contactnumber
			,Contact_Relationship = @relationship
		WHERE Employee_Id = @employeeid

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO Employee_Contacts (
			Employee_Id
			,Employee_Alternate_Mobile
			,Personal_MailId
			,Emergency_ContactName
			,Emergency_ContactNumber
			,Contact_Relationship
			)
		VALUES (
			@employeeid
			,@alternatemobile
			,@personalmail
			,@contactname
			,@contactnumber
			,@relationship
			)

		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_USER_DEPENDENTS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_USER_DEPENDENTS] (
	@employeeid BIGINT
	,@dependentname VARCHAR(255)
	,@relationship BIGINT
	,@dateofbirth DATE
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM Employee_Dependents
			WHERE Employee_Id = @employeeid
				AND Dependentname = @dependentname
				AND Relationship = @relationship
				AND Dateofbirth = @dateofbirth
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM Employee_Dependents
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE Employee_Dependents
		SET Employee_Id = @employeeid
			,Dependentname = @dependentname
			,Relationship = @relationship
			,Dateofbirth = @dateofbirth

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO Employee_Dependents (
			Employee_Id
			,Dependentname
			,Relationship
			,Dateofbirth
			)
		VALUES (
			@employeeid
			,@dependentname
			,@relationship
			,@dateofbirth
			)

		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATE_USER_SKILLS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CREATE_USER_SKILLS] (
	@employeeid BIGINT
	,@skill VARCHAR(255)
	,@certificatename VARCHAR(255)
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM Employee_Skills
			WHERE Employee_Id = @employeeid
				AND Skill = @skill
				AND Certificationname = @certificatename
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM Employee_Skills
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE Employee_Skills
		SET Employee_Id = @employeeid
			,Skill = @skill
			,Certificationname = @certificatename
		WHERE Employee_Id = @employeeid

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO Employee_Skills (
			Employee_Id
			,Skill
			,Certificationname
			)
		VALUES (
			@employeeid
			,@skill
			,@certificatename
			)

		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CREATESALARYDETAILS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[CREATESALARYDETAILS](
 @Details Payslip READONLY)
   as
   Begin
   MERGE Employee_Payslip AS TARGET
USING @Details AS SOURCE 
ON (TARGET.Emp_No = SOURCE.Emp_No and TARGET.Month=SOURCE.Month and TARGET.Year=SOURCE.Year )   
   WHEN NOT MATCHED BY TARGET THEN 
   Insert   
   (
   Emp_No ,
   Employee_Name ,
   Month ,
   Year ,
   Basic ,
   HRA ,
   Special_Allowance ,
   Prof_Dev ,
   Medical_Allowance ,
   Conveyance ,
   Food_Allowance ,
   Communication_Allowance ,
   Petrol_Allowance ,
   Driver_Allowance ,
   Education_Allowance,
   Gross_Earnings ,
   PF ,
   Income_Tax ,
   Professional_Tax ,
   Meal_Pass ,
   ESI ,
   Others ,
   Total_Deduction ,
   Net_Salary ,
   Reimbursement,
   Paid_Days
   )
   values(
    Source.Emp_No ,
   Source.Employee_Name ,
     Source.Month ,
     Source.Year ,
    Source.Basic ,
     Source.HRA ,
     Source.Special_Allowance ,
    Source.Prof_Dev ,
     Source.Medical_Allowance ,
     Source.Conveyance ,
     Source.Food_Allowance ,
    Source.Communication_Allowance ,
    Source.Petrol_Allowance ,
     Source.Driver_Allowance ,
     Source.Education_Allowance,
    Source.Gross_Earnings ,
    Source.PF ,
     Source.Income_Tax ,
     Source.Professional_Tax ,
    Source.Meal_Pass ,
    Source.ESI ,
     Source.Others ,
     Source.Total_Deduction ,
     Source.Net_Salary ,
     Source.Reimbursement,
     Source.Paid_Days)
	 output 1
	 ;
   End
  
GO
/****** Object:  StoredProcedure [dbo].[CREATEUPDATE_BANKDETAILS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CREATEUPDATE_BANKDETAILS] (
	@accountnum VARCHAR(255)
	,@bankname VARCHAR(255)
	,@branchname VARCHAR(255)
	,@empid BIGINT
	,@flag BIT
	,@ifsc VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM Employee_BankDetails
			WHERE Employee_Id = @empid
			)
	BEGIN
		INSERT INTO Employee_BankDetails (
			Accountnumber
			,Bankname
			,Branchname
			,Employee_Id
			,Ifsc
			)
		VALUES (
			@accountnum
			,@bankname
			,@branchname
			,@empid
			,@ifsc
			)

		SELECT 1
	END
	ELSE IF (@flag != 1)
	BEGIN
		IF EXISTS (
				SELECT Accountnumber
					,Bankname
					,Branchname
					,Employee_Id
					,Ifsc
				FROM Employee_BankDetails
				WHERE Employee_Id = @empid
				)
		BEGIN
			UPDATE Employee_BankDetails
			SET Accountnumber = @accountnum
				,Bankname = @bankname
				,Branchname = @branchname
				,Employee_Id = @empid
				,Ifsc = @ifsc
			WHERE Employee_Id = @empid

			SELECT 2
		END
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[EMPLOYEE_LEAVEAPPLY]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EMPLOYEE_LEAVEAPPLY] (
	@empid BIGINT
	,@leavetype BIGINT
	,@fromdate DATE
	,@fromsession BIGINT
	,@todate DATE
	,@tosession BIGINT
	,@reason VARCHAR(255)
	,@managerid BIGINT
	,@numberofdays FLOAT
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
				WHERE FromDate = @fromdate
					AND ToDate = @todate
					And Employee_Id=@empid And Approval <> 3 and Approval <> 4
				)
				Begin
			SELECT 0
			End
	
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
		)

	EXEC MTS_ADDEMAILMASTERENTRY @TEMPLATEID
		,@EMAILSP

	SELECT 1
	End
END
END
GO
/****** Object:  StoredProcedure [dbo].[EMPLOYEE_LEAVECANCEL]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[EMPLOYEE_LEAVECANCEL] (
	@id BIGINT
	,@approval BIGINT
	,@empid BIGINT
	)
AS
BEGIN

	UPDATE Employee_Leave
	SET CanceledBy = @empid
		,Approval = @approval
		,CanceledDate = getdate()
	WHERE Employee_Id = @empid
          and id=@id 
	SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[GET_EMPLOYEEID]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_EMPLOYEEID] (
	@empid VARCHAR(255)
	,@email VARCHAR(255)
	)
AS
BEGIN
	DECLARE @value VARCHAR(255)
		,@value2 VARCHAR(255)

	SELECT @value = Employee_Id
	FROM Employee
	WHERE Employee_Id = @empid

	SELECT @value2 = Email
	FROM Employee
	WHERE Email = @email

	IF (
			@value IS NOT NULL
			OR @value != ''
			OR @value2 IS NOT NULL
			OR @value2 != ''
			)
	BEGIN
		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GETLASTEMPLOYEEID]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GETLASTEMPLOYEEID]
AS
BEGIN
	SELECT TOP 1 Employee_Id
	FROM Employee
	ORDER BY Employee_Id DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GETNUMBEROFDAYS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GETNUMBEROFDAYS] (
	@leavefromdate DATETIME
	,@leavetodate DATETIME
	,@fromsession VARCHAR(255)
	,@tosession VARCHAR(255)
	)
AS
BEGIN
	SELECT dbo.NumberOfDays(@leavefromdate, @leavetodate, @fromsession, @tosession)
END
GO
/****** Object:  StoredProcedure [dbo].[GETUSERID]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GETUSERID] (@empid VARCHAR(255))
AS
BEGIN
	SELECT id
	FROM Employee
	WHERE Employee_Id = @empid
END
GO
/****** Object:  StoredProcedure [dbo].[ID_NAME]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ID_NAME] (@email VARCHAR(255))
AS
BEGIN
	SELECT e.Employee_Id
	FROM Employee AS e
	WHERE (e.Email = @email)

	SELECT *
	FROM MTS_Session
END
GO
/****** Object:  StoredProcedure [dbo].[LEAVE_APPROVE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[LEAVE_APPROVE] (
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

	--IF NOT EXISTS (
	--		SELECT *
	--		FROM EmployeeLeavebalance
	--		WHERE Employee_Id = @empid
	--			AND LeaveType = @leavetype
	--		)
	--BEGIN
	--	SELECT @leavebalance = (
	--			SELECT Numberofdays
	--			FROM MTS_LeaveType
	--			WHERE id = @leavetype
	--			)

	--	SELECT @leavebalance = @leavebalance - @Numberofdays
	--END
	--ELSE
	--BEGIN
	--	IF EXISTS (
	--			SELECT TOP 1 leavebalance
	--			FROM LeaveReport
	--			WHERE Employee_Id = @empid
	--				AND Leavetype = @leavetype
	--				AND Month = @month
	--				AND year = @year
	--			ORDER BY Approveddate DESC
	--			)
	--	BEGIN
	--		SELECT @leavebalance = (
	--				SELECT TOP 1 leavebalance
	--				FROM LeaveReport
	--				WHERE Employee_Id = @empid
	--					AND Leavetype = @leavetype
	--					AND Month = @month
	--					AND year = @year
	--				ORDER BY Approveddate DESC
	--				)
	--	END
	--	ELSE
	--	BEGIN
	--		SELECT @leavebalance = (
	--				SELECT TOP 1 leavebalance
	--				FROM LeaveReport
	--				WHERE Employee_Id = @empid
	--					AND Leavetype = @leavetype
	--				ORDER BY Approveddate DESC
	--				)
	--	END

	--	SELECT @leavebalance = @leavebalance - @Numberofdays
	--END

	--IF (@leavebalance < 0)
	--BEGIN
	--	SELECT @leavebalance = 0
	--END

	IF (@status = 1)
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
		Update EmployeeLeavebalance set Leavebalance=@leavebalance where Employee_Id=@empid AND LeaveType = @leavetype 
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
/****** Object:  StoredProcedure [dbo].[LEAVETYPE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LEAVETYPE]
AS
BEGIN
	SELECT Id
		,LeaveType
	FROM MTS_LeaveType

	SELECT *
	FROM MTS_Session
END
GO
/****** Object:  StoredProcedure [dbo].[MANAGER_LEAVECANCEL]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[MANAGER_LEAVECANCEL] (
	@canceledby BIGINT
	,@approval BIGINT
	,@empid BIGINT
	,@fromdate DATE
	,@todate DATE
	,@leavetype BIGINT
	,@reason VARCHAR(255)
	)
AS
BEGIN
	DECLARE @TEMPLATEID BIGINT = (
			SELECT TemplateID
			FROM MTS_EmailTemplate
			WHERE TemplateName = 'EMAIL_LEAVE_CANCEL'
			)
	DECLARE @dateofjoin DATE = (
			SELECT DateofJoin
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
	DECLARE @empemail VARCHAR(255) = (
			SELECT Email
			FROM Employee
			WHERE id = @empid
			)
	DECLARE @managerid VARCHAR(255) = (
			SELECT Employee_Id
			FROM Employee
			WHERE id = @canceledby
			)
	DECLARE @managername VARCHAR(255) = (
			SELECT Firstname + ' ' + Lastname AS EmployeeName
			FROM Employee
			WHERE id = @canceledby
			)
	DECLARE @EMAILSP VARCHAR(max) = cast(@empemail AS VARCHAR(255)) + ',' + cast(@employeeid AS VARCHAR(255)) + ',' + cast(@empname AS VARCHAR(255)) + ',' + cast(@dateofjoin AS VARCHAR(255)) + ',' + cast(@fromdate AS VARCHAR(255)) + ',' + cast(@todate AS VARCHAR(255)) + ',' + cast(@leavetype AS VARCHAR(255)) + ',' + cast(@reason AS VARCHAR(255)) + ',' + cast(@approval AS VARCHAR(255)) + ',' + cast(@managerid AS VARCHAR(255)) + ',' + cast(@managername AS VARCHAR(255))

	UPDATE Employee_Leave
	SET CanceledBy = @canceledby
		,Approval = @approval
		,CanceledDate = getdate()
	WHERE Employee_Id = @empid
		AND FromDate = @fromdate
		AND ToDate = @todate
		AND Reason = @reason
		AND LeaveType = @leavetype

	EXEC MTS_ADDEMAILMASTERENTRY @TEMPLATEID
		,@EMAILSP

	SELECT 1
END
GO
/****** Object:  StoredProcedure [dbo].[MTS_ADDAUDIT]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_ADDAUDIT] 
(	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@USERID BIGINT,		
	@AUDIT_INFO VARCHAR(255)
)
AS
BEGIN
	-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM
	-- INTERFERING WITH SELECT STATEMENTS.
	SET NOCOUNT ON;
BEGIN TRAN 

	 
	 
	  
		  
		  INSERT INTO [MTS_AUDIT] 
		 (
		 [USERID],[AUDIT_DATETIME],[AUDIT_INFO]
		 ) 
		 VALUES 
		 (
		 @USERID,GETDATE(),@AUDIT_INFO
		 )
		  	          
	  
	 

	 
	 
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END
			
COMMIT
RETURN 1
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_ADDEMAILMASTERENTRY]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_ADDEMAILMASTERENTRY] 
	@TEMPLATEID BIGINT,
	@EMAILSP VARCHAR(200)
 	
AS
BEGIN	
	SET NOCOUNT ON;
 
	INSERT INTO MTS_EMAILMASTER 
	(
		TEMPLATEID,
		EMAILSP,
		REQUESTTIME,
		STATUS
		
	)
	VALUES
	(
		@TEMPLATEID ,
	    @EMAILSP ,
	    GETDATE(),
	    0 
	)
	
		

END

GO
/****** Object:  StoredProcedure [dbo].[MTS_ADDQA]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		PRATHEESH.CM
-- CREATE DATE: 04.06.2012
-- DESCRIPTION:	INSERT FOR SEQURITYQUESTION
-- =============================================
CREATE PROCEDURE [dbo].[MTS_ADDQA] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@QUESTION VARCHAR(255) 
	
AS
BEGIN
	-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM
	-- INTERFERING WITH SELECT STATEMENTS.
	SET NOCOUNT ON;
BEGIN TRAN
    -- INSERT STATEMENTS FOR PROCEDURE HERE
    IF NOT EXISTS (SELECT 1 FROM MTS_Q_A WITH(NOLOCK)  WHERE QUESTION=@QUESTION)
    BEGIN
	INSERT INTO MTS_Q_A 
	(
		QUESTION
		,BUSINESSID
		,CLIENTID
		,LOCATIONID
		,COMPANYID
		,DEPARTMENTID
	)
	VALUES
	(
		@QUESTION
		,1
		,1
		,1
		,1
		,1
		
	)
	
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN
			RETURN -1
		END
	END
	ELSE
	BEGIN
		COMMIT
		RETURN 1
	END		
	
COMMIT
RETURN 0

END

GO
/****** Object:  StoredProcedure [dbo].[MTS_ADDUSER]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_ADDUSER] @USERNAME VARCHAR(30)
	,@PASSWORD VARCHAR(50)
	,@FIRSTNAME VARCHAR(30)
	,@LASTNAME VARCHAR(30)
	,@EMAIL VARCHAR(50)
	,@ROLE BIGINT
	,@ACTIVE BIT
	,@STATUS TINYINT
	,@LOCKED BIT
AS
DECLARE @KEYID BIGINT
DECLARE @CONTACTID BIGINT
DECLARE @HASHPASSWORD VARCHAR(50)

BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	IF NOT EXISTS (
			SELECT 1
			FROM MTS_LOGIN
			WHERE USERNAME = @USERNAME
			)
	BEGIN
		SET @PASSWORD = @PASSWORD + CAST(IDENT_CURRENT('MTS_LOGIN') + 1 AS VARCHAR(50))
		SET @HASHPASSWORD = SUBSTRING(SYS.FN_VARBINTOHEXSTR(HASHBYTES('SHA1', @PASSWORD)), 3, 50)

		INSERT INTO MTS_LOGIN (
			USERNAME
			,PASSWORD
			,STATUS
			,LOCKED
			,NO_OF_ATTEMPTS
			,ACTIVE
			,FIRSTNAME
			,LASTNAME
			)
		VALUES (
			@USERNAME
			,@HASHPASSWORD
			,@STATUS
			,@LOCKED
			,0
			,@ACTIVE
			,@FIRSTNAME
			,@LASTNAME
			)

		IF @@ERROR <> 0
		BEGIN
			--RAISERROR 50000 'USER INSERTION FAILED.'
			ROLLBACK TRANSACTION

			RETURN - 1
		END
		ELSE
		BEGIN
			SET @KEYID = @@IDENTITY
		END

		--INSERT IN MTS_USERCONTACTS
		INSERT INTO MTS_USERCONTACTS (
			EMAIL
			,USERID
			)
		VALUES (
			@EMAIL
			,@KEYID
			)

		IF @@ERROR <> 0
		BEGIN
			--RAISERROR 50000 'USER CONTACT INSERTION FAILED.'
			ROLLBACK TRANSACTION

			RETURN - 1
		END
		ELSE
		BEGIN
			SET @CONTACTID = @@IDENTITY
		END

		INSERT INTO MTS_AUTHORITY (
			USERID
			,ROLEID
			)
		VALUES (
			@KEYID
			,@ROLE
			)

		IF @@ERROR <> 0
		BEGIN
			--RAISERROR 50000 'AUTHORITY INSERTION FAILED.'
			ROLLBACK TRANSACTION

			RETURN - 1
		END
	END
	ELSE
	BEGIN
		COMMIT

		RETURN 1
	END

	COMMIT

	RETURN 0
END
-------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[MTS_CHECK_EXISTS_USEREMAIL]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_CHECK_EXISTS_USEREMAIL]
(
 @EMAIL VARCHAR(100),
@USERID BIGINT 
)
AS 
BEGIN 
  IF EXISTS(SELECT 1 FROM MTS_USERCONTACTS WITH(NOLOCK) WHERE EMAIL=@EMAIL AND USERID<>@USERID)
  BEGIN 
  RETURN 1
  END 
  ELSE 
  BEGIN
   RETURN 0
  END 
 END

GO
/****** Object:  StoredProcedure [dbo].[MTS_CHECK_EXISTS_USERNAME]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_CHECK_EXISTS_USERNAME]
(
 @USERNAME VARCHAR(30)
)
AS 
BEGIN 
  IF EXISTS(SELECT 1 FROM MTS_LOGIN WITH(NOLOCK) WHERE USERNAME=@USERNAME)
  BEGIN 
  RETURN 1
  END 
  ELSE 
  BEGIN
   RETURN 0
  END 
 END

GO
/****** Object:  StoredProcedure [dbo].[MTS_FORGOTPASSWORD]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_FORGOTPASSWORD] 
(
	@USERID BIGINT,  
	@PASSWORD VARCHAR(50)
)
AS
--DECLARE @HASHPASSWORD VARCHAR(50)

BEGIN
   
  -- SET  @HASHPASSWORD=SUBSTRING(SYS.FN_VARBINTOHEXSTR(HASHBYTES('SHA1', @PASSWORD)),3,50)
	SET NOCOUNT ON;
	      
	      UPDATE MTS_LOGIN SET 
	            PASSWORD=@PASSWORD
	            ,LAST_PWD_CHANGE=GETDATE()
	            WHERE 
	            USERID=@USERID
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETACTIVESECURITYQUESTIONS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_GETACTIVESECURITYQUESTIONS] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT QUESTIONID,QUESTION FROM MTS_Q_A WITH(NOLOCK) 
	WHERE ACTIVE=1
END
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETAPPCONFIG]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_GETAPPCONFIG]
AS
BEGIN
        SET NOCOUNT ON;
        SELECT
               CONFIGKEY
              ,CONFIGVALUE 
          FROM MTS_APPCONFIG WITH ( NOLOCK )
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETCREATEUSER]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		PRAKASH.T
-- CREATE DATE: 21.05.2012
-- DESCRIPTION:	GET DETAILS TO FILL DROPDOWN.
-- =============================================
CREATE PROCEDURE [dbo].[MTS_GETCREATEUSER]
AS
BEGIN
	--GET CARD TYPE
	--SELECT 
	--     CARDTYPE
	--     ,CARDID
	--      FROM 
	--      CARDMASTER AS CARDDETAILS WITH(NOLOCK)
	--      WHERE ACTIVE=1
	
	----GET BUDGETCENTERS
	--SELECT 
	--      BUDGETCENTERNAME
	--      ,BUDGETCENTERID
	--       FROM CUS_BUDGETCENTER WITH (NOLOCK)	
	--       WHERE ACTIVE=1


	--GET CLIENT	
	 SELECT 1,1,1
	
	--GETBUSINESS
	 SELECT 1,1 
	
	
	--GET DEPARTMENTS
	SELECT 1,1,1 

	--GET LOCATIONS
	SELECT  1,1,1
	
	--GET ROLES
	SELECT ROLE_NAME,ROLEID,BUSINESSID,CLIENTID,LOCATIONID,COMPANYID,DEPARTMENTID FROM MTS_ROLES WITH(NOLOCK) 
		WHERE 
			AUTHORITY_LEVEL < 100 
			AND AUTHORITY_LEVEL > 0 
			AND ACTIVE = 1

	--GET REPORTING PERSONS
	   --SELECT U.LASTNAME + ',' + U.FIRSTNAME AS NAME,U.USERID FROM MTS_USERTABLE U WITH (NOLOCK)
    --  INNER JOIN DBO.MTS_LOGIN L WITH (NOLOCK) ON U.USERID = L.USERID 
    --   WHERE
    --        U.USERID IN (SELECT USERID FROM MTS_AUTHORITY A WITH(NOLOCK) 
    --                          INNER JOIN MTS_ROLES R WITH(NOLOCK)  
    --                          ON R.ROLEID = A.ROLEID 
    --                          WHERE R.ROLE_NAME='MANAGER' AND L.ACTIVE=1)
	--SELECT L.USERNAME+','+U.FIRSTNAME+' '+U.LASTNAME AS NAME,U.USERID FROM MTS_USERTABLE U WITH (NOLOCK)
	--INNER JOIN DBO.MTS_LOGIN L WITH (NOLOCK) ON U.USERID = L.USERID  
	-- WHERE 
	--	U.USERID IN (SELECT USERID FROM MTS_AUTHORITY A
	--				 INNER JOIN MTS_ROLES R ON R.ROLEID = A.ROLEID WHERE R.ROLE_NAME='MANAGER')
					 
	SELECT 1,1,1
	

END

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETDETAILVIEW]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GETDETAILVIEW 4
CREATE PROCEDURE [dbo].[MTS_GETDETAILVIEW]
	@USERID BIGINT
AS

BEGIN
	SET NOCOUNT ON;
	
	SELECT L.USERNAME,L.USERID,L.FIRSTNAME,L.LASTNAME,C.EMAIL
			,C.ADD1,C.ADD2,C.CITY,C.STATE,C.COUNTRY,C.ZIPCODE
			,C.PHONE,C.MOBILE
	FROM MTS_LOGIN L WITH(NOLOCK)
	--INNER JOIN MTS_USERTABLE U WITH(NOLOCK) ON U.USERID=L.USERID
	INNER JOIN MTS_USERCONTACTS C WITH(NOLOCK) ON C.USERID=L.USERID 
	WHERE L.USERID=@USERID
		
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILSCHEDULE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MTS_GETEMAILSCHEDULE]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SCHEDULEID
		,TEMPLATEID
		,SENDBY
		,DAY
		,[TIME]
	FROM MTS_EMAILSCHEDULE WITH (NOLOCK)
	WHERE SENDBY = 1;
END;







GO
/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILSCHEDULEFORTIMESCHEDULER]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MTS_GETEMAILSCHEDULEFORTIMESCHEDULER]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SCHEDULEID
		,TEMPLATEID
		,SENDBY
		,DAY
		,[TIME]
	FROM MTS_EMAILSCHEDULE WITH (NOLOCK)
	WHERE SENDBY <> 1;
END;







GO
/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILSWAITINGTOBESEND]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_GETEMAILSWAITINGTOBESEND]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ID
		,TEMPLATEID
		,EMAILSP
	FROM MTS_EMAILMASTER WITH (NOLOCK)
	WHERE STATUS = 0;
END;








GO
/****** Object:  StoredProcedure [dbo].[MTS_GETEMAILTEMPLATE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MTS_GETEMAILTEMPLATE]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT TEMPLATEID
		,TEMPLATENAME
		,XMLTEMPLATE
		,SMTPID
		,ACTIVE
		,HTMLPAGE
	FROM MTS_EMAILTEMPLATE WITH (NOLOCK);
END;







GO
/****** Object:  StoredProcedure [dbo].[MTS_GETPASSWORDHISTORY]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_GETPASSWORDHISTORY]
                
  (
   @USERID BIGINT 
    
  )
  AS 
	
  BEGIN

 SET NOCOUNT ON; 


          SELECT PH_ID,PASSWORD FROM MTS_PASSWORDHISTORY WITH(NOLOCK) WHERE USERID=@USERID
  
  END

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETPASSWORDPOLICY]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		PRATHEESH.C
-- CREATE DATE: 07/06/2012
-- DESCRIPTION:	GET DEPARTMENTS
-- =============================================
CREATE PROCEDURE [dbo].[MTS_GETPASSWORDPOLICY] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
AS
BEGIN
	-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM
	-- INTERFERING WITH SELECT STATEMENTS.
	SET NOCOUNT ON;

    -- INSERT STATEMENTS FOR PROCEDURE HERE
	SELECT PASSWORDPOLICYID,PASSWORDCHANGEDAYS,PASSWORDCOUNT
	,MAXIMUM_ATTEMPTS,PASSWORDREGEX,MINIMUM_LENGTH,MAXIMUM_LENGH FROM MTS_PASSWORD_POLICY WITH(NOLOCK) 
		
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETQA]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:	    PRATHEESH.CM
-- CREATE DATE: 04/06/2012
-- DESCRIPTION:	GETBUDGETCENTER
-- =============================================
CREATE PROCEDURE [dbo].[MTS_GETQA] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT QUESTIONID,QUESTION,ACTIVE FROM MTS_Q_A WITH(NOLOCK) 
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETQABASEDONID]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_GETQABASEDONID]
	@QUESTIONID BIGINT
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT QUESTION,ACTIVE,QUESTIONID FROM MTS_Q_A WITH(NOLOCK) WHERE QUESTIONID=@QUESTIONID
	
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETROLE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_GETROLE] 	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT ROLEID,ROLE_NAME [Role],C.COMPANYNAME [Department]  FROM MTS_ROLES R WITH(NOLOCK) 
	INNER JOIN MTS_COMPANY C WITH (NOLOCK) ON R.COMPANYID=C.COMPANYID AND ROLEID<>1 --Role id 1 is Super admin so restricted
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETSECURITYQUESTIONS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_GETSECURITYQUESTIONS] 
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT QUESTIONID,QUESTION FROM MTS_Q_A WITH(NOLOCK) 
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETSERVICECONFIG]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[MTS_GETSERVICECONFIG]
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SERVICENAME
		,SERVICEDISPLAYNAME
		,SERVICEDESCRIPTION
		,SERVICEINVOKETYPE
		,SERVICEPARAMS
		,[TIME]
	FROM MTS_SERVICECONFIG WITH (NOLOCK)
	--WHERE ENVIRONMENT IS NULL OR ENVIRONMENT=1
	ORDER BY [SERVICEID] ASC
END;

--SELECT * FROM MTS_EmailMaster ORDER BY 1 DESC








GO
/****** Object:  StoredProcedure [dbo].[MTS_GETSERVICECONFIGFORSERVICE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[MTS_GETSERVICECONFIGFORSERVICE] @Servicename VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT SERVICENAME
		,SERVICEDISPLAYNAME
		,SERVICEDESCRIPTION
		,SERVICEINVOKETYPE
		,DLLNAME
		,SERVICEPARAMS
		,[TIME]
		,RETRYCOUNT
		,MAXERRORS
	FROM [MTS_SERVICECONFIG] WITH (NOLOCK)
	WHERE SERVICENAME = @Servicename;
END;








GO
/****** Object:  StoredProcedure [dbo].[MTS_GETSTMPDETAILS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MTS_GETSTMPDETAILS]
AS
BEGIN
	OPEN SYMMETRIC KEY PASSWORDKEY DECRYPTION BY CERTIFICATE SMTP;

	SELECT SMTPID
		,SMTPCLIENTHOST
		,SMTPCLIENTPORT
		,USERNAME
		,CONVERT(VARCHAR, DECRYPTBYKEY(PASSWORD)) AS PASSWORD
		,DOMAIN
		,ENABLESSL
		,TIMEOUT
		,SMTPDELIVERYMETHOD
		,USEDEFAULTCREDENTIALS
	FROM MTS_SMTPDETAILS WITH (NOLOCK);
END;







GO
/****** Object:  StoredProcedure [dbo].[MTS_GETTEMPLATEIDFROMSCHEDULEID]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MTS_GETTEMPLATEIDFROMSCHEDULEID] @Scheduleid INT
AS
BEGIN
	SELECT TEMPLATEID
	FROM EMAILSCHEDULE WITH (NOLOCK)
	WHERE SCHEDULEID = @Scheduleid;
END;







GO
/****** Object:  StoredProcedure [dbo].[MTS_GETUSER]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_GETUSER]
  (
    @LOGIN VARCHAR(30) 
  )
  AS 
	
  BEGIN

 SET NOCOUNT ON; 

		 SELECT L.USERID,L.USERNAME,L.PASSWORD,L.QUESTIONID,L.SEC_A,L.STATUS,L.LOCKED,L.LAST_LOGIN,
		 GETDATE() LAST_PWD_CHANGE,L.NO_OF_ATTEMPTS,L.MENURANGE,L.FIRSTNAME,L.LASTNAME,L.ACTIVE
		 ,UC.EMAIL
		 ,ROLEID= (SELECT AUTHORITY_LEVEL FROM MTS_ROLES WITH(NOLOCK)  WHERE ROLEID=AUTH.ROLEID),ROLENAME = (SELECT ROLE_NAME FROM MTS_ROLES WITH(NOLOCK)  WHERE ROLEID=AUTH.ROLEID)
		 FROM MTS_LOGIN L WITH(NOLOCK) 
			 LEFT JOIN MTS_AUTHORITY AUTH WITH(NOLOCK)  
			 ON AUTH.USERID=L.USERID
			 LEFT JOIN MTS_USERCONTACTS UC WITH(NOLOCK)  
			 ON L.USERID=UC.USERID
			 WHERE L.USERNAME=@LOGIN 

		 SELECT TOP(1) PWDPSY.PASSWORDPOLICYID, PWDPSY.BUSINESSID,PWDPSY.CLIENTID,PWDPSY.LOCATIONID
		 ,PWDPSY.COMPANYID,PWDPSY.DEPARTMENTID,PWDPSY.PASSWORDCHANGEDAYS,PWDPSY.PASSWORDCOUNT
		 ,PWDPSY.MAXIMUM_ATTEMPTS,PWDPSY.PASSWORDREGEX,PWDPSY.MINIMUM_LENGTH,PWDPSY.MAXIMUM_LENGH 
		 FROM MTS_PASSWORD_POLICY PWDPSY WITH(NOLOCK)		
		 WHERE PWDPSY.BUSINESSID=1

  END
GO
/****** Object:  StoredProcedure [dbo].[MTS_GETUSERDETAILS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MTS_GETUSERDETAILS] @USERID BIGINT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT L.USERNAME
		,L.FIRSTNAME
		,L.LASTNAME
		,C.EMAIL
		,L.USERID
		,L.LOCKED
		,A.ROLEID
		,ROLE_NAME
		,L.ACTIVE
	FROM MTS_LOGIN L WITH (NOLOCK)
	INNER JOIN MTS_USERCONTACTS C WITH (NOLOCK) ON C.USERID = L.USERID
	INNER JOIN MTS_AUTHORITY A WITH (NOLOCK) ON A.USERID = L.USERID
	INNER JOIN MTS_ROLES R WITH (NOLOCK) ON R.ROLEID = A.ROLEID
	WHERE L.USERID = @USERID
END

---------------------------------------------------------------------------------------------------------------------

/****** Object:  StoredProcedure [dbo].[MTS_ADDUSER]    Script Date: 08/12/2013 18:23:25 ******/
SET ANSI_NULLS ON

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETUSERLIST]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_GETUSERLIST]
AS
BEGIN
	--GET CARD TYPE
	SELECT L.USERID
		,L.USERNAME
		,L.FIRSTNAME
		,L.LASTNAME
		,C.EMAIL
		,R.ROLE_NAME
	FROM MTS_LOGIN L WITH (NOLOCK)
	--INNER JOIN MTS_USERTABLE U ON U.USERID=L.USERID
	INNER JOIN MTS_USERCONTACTS C WITH (NOLOCK) ON C.USERID = L.USERID
	INNER JOIN MTS_AUTHORITY A WITH (NOLOCK) ON A.USERID = L.USERID
	INNER JOIN MTS_ROLES R WITH (NOLOCK) ON R.ROLEID = A.ROLEID

	SELECT COUNT(USERID) AS TOTAL_USERS
	FROM MTS_LOGIN WITH (NOLOCK)
	WHERE ACTIVE = 1
END

----------------------------------------------------------------------------------------------------------------

GO
/****** Object:  StoredProcedure [dbo].[MTS_GETUSERS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		PRAKASH.T
-- CREATE DATE: 04-07-2012
-- DESCRIPTION:	GET USERS OF ROLE 'USER'
-- =============================================
CREATE PROCEDURE [dbo].[MTS_GETUSERS]
AS
BEGIN
		
		SELECT L.USERID,L.USERNAME,L.FIRSTNAME,L.LASTNAME FROM MTS_LOGIN L WITH (NOLOCK)
		INNER JOIN MTS_AUTHORITY A WITH(NOLOCK) ON A.USERID=L.USERID 
		--INNER JOIN MTS_USERTABLE UT WITH(NOLOCK) ON UT.USERID=L.USERID
		WHERE A.ROLEID = (SELECT ROLEID FROM MTS_ROLES WHERE ROLE_NAME='USER')
		
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_RESETPASSWORD]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_RESETPASSWORD]( @Userid BIGINT ,
                                        @Password VARCHAR( 50 ) ,
                                        @Status TINYINT )
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE DBO.MTS_LOGIN
    SET
        PASSWORD = @Password
      ,
        STATUS = @Status
      ,
        LAST_PWD_CHANGE = GETDATE( )
      ,
        LOCKED = 0
      ,
        NO_OF_ATTEMPTS = 0
    WHERE
          USERID = @Userid;
    SET NOCOUNT OFF;
END;

GO
/****** Object:  StoredProcedure [dbo].[MTS_SMTPDETAIL]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[MTS_SMTPDETAIL]( @Sptype BIGINT ,
                                  @Smtpid BIGINT = NULL ,
                                  @Smtpname VARCHAR( 30 ) = NULL ,
                                  @Smtpclienthost VARCHAR( 50 ) = NULL ,
                                  @Smtpclientport INT = NULL ,
                                  @Username VARCHAR( 100 ) = NULL ,
                                  @Domain VARCHAR( 100 ) = NULL ,
                                  @Password VARCHAR( 100 ) = NULL ,
                                  @Enablessl BIT = NULL ,
                                  @Timeout INT = NULL ,
                                  @Smtpdeliverymethod TINYINT = NULL ,
                                  @Defaultcredentials BIT = NULL )
AS
BEGIN
    BEGIN TRAN;
    OPEN SYMMETRIC KEY PASSWORDKEY DECRYPTION BY CERTIFICATE SMTP;

    IF @Sptype = 0

        BEGIN
            SELECT
                   SMTPID
                 , SMTPNAME
                 , SMTPCLIENTHOST
                 , SMTPCLIENTPORT
                 , USERNAME
                 , DOMAIN
                 , ENABLESSL
                 , TIMEOUT
                 , SMTPDELIVERYMETHOD
                 , USEDEFAULTCREDENTIALS
              FROM MTS_SMTPDETAILS;

        END;
    ELSE
        BEGIN
            IF @Sptype = 1
                BEGIN
                    SELECT
                           SMTPID
                         , SMTPNAME
                         , SMTPCLIENTHOST
                         , SMTPCLIENTPORT
                         , USERNAME
                         , CONVERT( VARCHAR , DECRYPTBYKEY( PASSWORD ))AS PASSWORD
                         , DOMAIN
                         , ENABLESSL
                         , TIMEOUT
                         , SMTPDELIVERYMETHOD
                         , USEDEFAULTCREDENTIALS
                      FROM MTS_SMTPDETAILS
                      WHERE SMTPID = @Smtpid;

                END;
            ELSE
                BEGIN
                    IF @Sptype = 2
                        BEGIN

                            IF NOT EXISTS( SELECT
                                                  1
                                             FROM MTS_SMTPDETAILS WITH ( NOLOCK )
                                             WHERE
                                                  SMTPNAME = @Smtpname )
                                BEGIN
                                    INSERT INTO MTS_SMTPDETAILS(
                                                SMTPNAME
                                              , SMTPCLIENTHOST
                                              , SMTPCLIENTPORT
                                              , USERNAME
                                              , PASSWORD
                                              , DOMAIN
                                              , ENABLESSL
                                              , TIMEOUT
                                              , SMTPDELIVERYMETHOD
                                              , USEDEFAULTCREDENTIALS )
                                    VALUES( @Smtpname
                                          , @Smtpclienthost
                                          , @Smtpclientport
                                          , @Username
                                          , ENCRYPTBYKEY( KEY_GUID( 'PasswordKey' ) , @Password )
                                          , @Domain
                                          , @Enablessl
                                          , @Timeout
                                          , @Smtpdeliverymethod
                                          , @Defaultcredentials );

                                    IF @@Error <> 0
                                        BEGIN
                                            ROLLBACK TRAN;
                                            RETURN -1;
                                        END;

                                END;
                            ELSE
                                BEGIN
                                    COMMIT;
                                    RETURN 1;
                                END;

                        END;
                    ELSE
                        BEGIN
                            IF @Sptype = 3
                                BEGIN

                                    IF NOT EXISTS( SELECT
                                                          1
                                                     FROM MTS_SMTPDETAILS WITH ( NOLOCK )
                                                     WHERE
                                                          SMTPNAME = @Smtpname
                                                      AND
                                                          SMTPID <> @Smtpid )
                                        BEGIN
                                            UPDATE MTS_SMTPDETAILS
                                            SET
                                                SMTPNAME = @Smtpname
                                              ,
                                                SMTPCLIENTHOST = @Smtpclienthost
                                              ,
                                                SMTPCLIENTPORT = @Smtpclientport
                                              ,
                                                USERNAME = @Username
                                              ,[Password]=EncryptByKey(Key_GUID('PasswordKey'),@PASSWORD)
                                              ,
                                                DOMAIN = @Domain
                                              ,
                                                ENABLESSL = @Enablessl
                                              ,
                                                TIMEOUT = @Timeout
                                              ,
                                                SMTPDELIVERYMETHOD = @Smtpdeliverymethod
                                              ,
                                                USEDEFAULTCREDENTIALS = @Defaultcredentials
                                            WHERE
                                                  SMTPID = @Smtpid;

                                            IF @@Error <> 0
                                                BEGIN
                                                    ROLLBACK TRAN;
                                                    RETURN -1;
                                                END;

                                        END;
                                    ELSE
                                        BEGIN
                                            COMMIT;
                                            RETURN 1;
                                        END;
                                END;
                            ELSE
                                BEGIN
                                    IF @Sptype = 4
                                        BEGIN
                                            UPDATE MTS_SMTPDETAILS
                                            SET
                                                PASSWORD = ENCRYPTBYKEY( KEY_GUID( 'PasswordKey' ) , @Password )
                                            WHERE
                                                  SMTPID = @Smtpid;

                                            IF @@Error <> 0
                                                BEGIN
                                                    ROLLBACK TRAN;
                                                    RETURN -1;
                                                END;

                                        END;
                                    ELSE
                                        BEGIN
                                            COMMIT;
                                            RETURN 1;
                                        END;;
                                END;
                        END;
                END;
        END;
    COMMIT;
    RETURN 0;

END;

GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEANONYMSATTEMPTS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[MTS_UPDATEANONYMSATTEMPTS] ANONYMOUS ATTEMPT
CREATE PROCEDURE [dbo].[MTS_UPDATEANONYMSATTEMPTS] 
(
@AUDIT_INFO VARCHAR(255)
)
AS
BEGIN
	
	SET NOCOUNT ON;
BEGIN TRAN 

		 INSERT INTO MTS_AUDIT 
		 (
		 [USERID],[AUDIT_DATETIME],[AUDIT_INFO]
		 ) 
		 VALUES 
		 (
		 NULL,GETDATE(),@AUDIT_INFO
		 )
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END
			
COMMIT
RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEDETAILVIEW]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_UPDATEDETAILVIEW]
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@USERID		BIGINT,
	@FIRSTNAME	VARCHAR(30),
	@LASTNAME	VARCHAR(30),
	@EMAIL		VARCHAR(50),
	@ADD1		VARCHAR(30),
	@ADD2		VARCHAR(30),
	@CITY		VARCHAR(30),
	@STATE		VARCHAR(30),
	@COUNTRY	VARCHAR(30),
	@ZIPCODE	VARCHAR(30),
	@PHONE		VARCHAR(30),
	@MOBILE		VARCHAR(30)	
AS
BEGIN
	-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM
	-- INTERFERING WITH SELECT STATEMENTS.
	SET NOCOUNT ON;
BEGIN TRAN

	--UPDATE IN MTS_USERCONTACTS
	UPDATE MTS_USERCONTACTS
	SET
		EMAIL=@EMAIL,
		ADD1=@ADD1,
		ADD2=@ADD2,
		CITY=@CITY,
		STATE=@STATE,
		COUNTRY=@COUNTRY,
		ZIPCODE=@ZIPCODE,
		PHONE=@PHONE,
		MOBILE=@MOBILE
	WHERE USERID=@USERID
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END
	
	UPDATE MTS_LOGIN
	SET
		FIRSTNAME=@FIRSTNAME,
		LASTNAME=@LASTNAME
	WHERE 
		USERID=@USERID		
		
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END		
	
	--UPDATE MTS_USERTABLE
	--SET
	--	FIRSTNAME=@FIRSTNAME,
	--	LASTNAME=@LASTNAME
	--WHERE 
	--	USERID=@USERID		
		
	--IF @@ERROR <> 0
	--BEGIN
	--	ROLLBACK TRAN
	--	RETURN -1
	--END		
	
		
COMMIT
RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEEMAILSTATUS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_UPDATEEMAILSTATUS] (
	@Id BIGINT
	,@Status TINYINT
	)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE MTS_EmailMaster
	WITH (ROWLOCK)

	SET STATUS = @Status
	WHERE ID = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATELASTPWDCHANGE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_UPDATELASTPWDCHANGE] 
(	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@USERID BIGINT
)
AS
BEGIN
	-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM
	-- INTERFERING WITH SELECT STATEMENTS.
	SET NOCOUNT ON;
BEGIN TRAN 

		  UPDATE MTS_LOGIN SET LAST_PWD_CHANGE=GETDATE() WHERE 
		  USERID=@USERID

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END
			
COMMIT
RETURN 1
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATELOCKUSER]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_UPDATELOCKUSER] 
	@USERID BIGINT,
	@STATUS TINYINT,
	@AUDIT_INFO VARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;
BEGIN TRAN 

	 UPDATE [MTS_LOGIN] SET [LOCKED]=1 ,STATUS=@STATUS WHERE 
	  [USERID]=@USERID
	  
	 INSERT INTO [MTS_AUDIT] 
	 (
	 [USERID],[AUDIT_DATETIME],[AUDIT_INFO]
	 ) 
	 VALUES 
	 (
	 @USERID,GETDATE(),@AUDIT_INFO
	 )
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END
			
COMMIT
RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEPASSWORD]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_UPDATEPASSWORD] 
(	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@USERID BIGINT,
	@NEWPASSWORD VARCHAR(50),
	@PH_ID BIGINT
	
)
AS
BEGIN
      -- DECLARE @HASHPASSWORD VARCHAR(50)
	-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM
	-- INTERFERING WITH SELECT STATEMENTS.
	SET NOCOUNT ON;
BEGIN TRAN 
        
        --SET @NEWPASSWORD=@NEWPASSWORD+CAST(@USERID AS VARCHAR(50))
        --SET  @HASHPASSWORD=SUBSTRING(SYS.FN_VARBINTOHEXSTR(HASHBYTES('SHA1', @NEWPASSWORD)),3,50)
	 
	  IF ( @PH_ID <> 0)
	  BEGIN
	  
	      DELETE FROM MTS_PASSWORDHISTORY WHERE PH_ID =@PH_ID
		  INSERT INTO MTS_PASSWORDHISTORY (USERID,PASSWORD) VALUES (@USERID ,@NEWPASSWORD)
		  UPDATE MTS_LOGIN SET PASSWORD=@NEWPASSWORD, LAST_LOGIN=GETDATE(), LAST_PWD_CHANGE=GETDATE(),STATUS=2 WHERE USERID=@USERID
		  INSERT INTO [MTS_AUDIT] 
		 (
		 [USERID],[AUDIT_DATETIME],[AUDIT_INFO]
		 ) 
		 VALUES 
		 (
		 @USERID,GETDATE(),'PASSWORD CHANGED'
		 )
		  	          
	  END
	  ELSE
		BEGIN
		print 5
		INSERT INTO MTS_PASSWORDHISTORY (USERID,PASSWORD) VALUES (@USERID ,@NEWPASSWORD)
		UPDATE MTS_LOGIN SET PASSWORD=@NEWPASSWORD,LAST_LOGIN=GETDATE(),LAST_PWD_CHANGE=GETDATE(),STATUS=2 WHERE USERID=@USERID	
		 INSERT INTO [MTS_AUDIT] 
		 (
		 [USERID],[AUDIT_DATETIME],[AUDIT_INFO]
		 ) 
		 VALUES 
		 (
		 @USERID,GETDATE(),'PASSWORD CHANGED'
		 )
		END 
	 
	
	IF @@ERROR <> 0
	BEGIN
	print 1
		ROLLBACK TRAN
		RETURN -1
	END
			
COMMIT
print 2

RETURN 1

END

GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEQA]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- AUTHOR:		PRATHEESH.CM
-- CREATE DATE: 04.06.2012
-- DESCRIPTION:	UPDATE FOR BUDGETCENTER
-- =============================================
CREATE PROCEDURE [dbo].[MTS_UPDATEQA]
	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@QUESTION VARCHAR(255), 
	@ACTIVE BIT,
	@QUESTIONID BIGINT
AS
BEGIN
	-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM
	-- INTERFERING WITH SELECT STATEMENTS.
	SET NOCOUNT ON;
BEGIN TRAN
    -- INSERT STATEMENTS FOR PROCEDURE HERE
    IF NOT EXISTS (SELECT 1 FROM MTS_Q_A WITH(NOLOCK)  WHERE QUESTION=@QUESTION AND QUESTIONID<>@QUESTIONID)
    BEGIN
    
    UPDATE MTS_Q_A
    SET
		QUESTION=@QUESTION,
		ACTIVE=@ACTIVE
	WHERE 
		QUESTIONID=@QUESTIONID
				
		IF @@ERROR <> 0
		BEGIN
			ROLLBACK TRAN
			RETURN -1
		END
	END
	ELSE
	BEGIN
		COMMIT
		RETURN 1
	END		
	
COMMIT
RETURN 0

END

GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATESECURITYQUESTION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_UPDATESECURITYQUESTION] 
(	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@USERID BIGINT,
	--@NEWPASSWORD VARCHAR(50),
	@QUESTIONID BIGINT,
	@SEC_A VARCHAR(255)
	
)
AS
BEGIN
	-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM
	-- INTERFERING WITH SELECT STATEMENTS.
	SET NOCOUNT ON;
BEGIN TRAN 

	 
	  --  INSERT INTO PASSWORDHISTORY (USERID,PASSWORD) VALUES (@USERID ,@NEWPASSWORD)
		UPDATE MTS_LOGIN SET 
		            --PASSWORD=@NEWPASSWORD,
		            -- LAST_PWD_CHANGE=GETDATE(),
		            -- STATUS=2,
		            LAST_LOGIN=GETDATE(),
		             QUESTIONID=@QUESTIONID,
		             SEC_A=@SEC_A
		              WHERE		
		             USERID=@USERID	
		
		INSERT INTO [MTS_AUDIT] 
		 (
		 [USERID],[AUDIT_DATETIME],[AUDIT_INFO]
		 ) 
		 VALUES 
		 (
		 @USERID,GETDATE(),'PASSWORD CHANGED'
		 )
	 
	 
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END
			
COMMIT

END

GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATESERVICECONFIG]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[MTS_UPDATESERVICECONFIG] @Servicename VARCHAR(50)
	,@Servicedisplayname VARCHAR(50)
	,@Servicedescription VARCHAR(255)
	,@Serviceinvoketype VARCHAR(1)
	,@Serviceparams VARCHAR(MAX)
	,@Time VARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE MTS_SERVICECONFIG
	SET SERVICEDISPLAYNAME = @Servicedisplayname
		,SERVICEDESCRIPTION = @Servicedescription
		,SERVICEINVOKETYPE = @Serviceinvoketype
		,SERVICEPARAMS = @Serviceparams
		,[TIME] = @Time
	WHERE SERVICENAME = @Servicename;
END;







GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATESERVICESTATUS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[MTS_UPDATESERVICESTATUS] @Servicename VARCHAR(50)
	,@Status TINYINT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE MTS_SERVICECONFIG
	SET STATUS = @Status
	WHERE SERVICENAME = @Servicename;
END;








GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATESTATUS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[MTS_UPDATESTATUS] 
(	-- ADD THE PARAMETERS FOR THE STORED PROCEDURE HERE
	@USERID BIGINT,	
	@STATUS TINYINT,
	@AUDIT_INFO VARCHAR(255)
)
AS
BEGIN
	-- SET NOCOUNT ON ADDED TO PREVENT EXTRA RESULT SETS FROM
	-- INTERFERING WITH SELECT STATEMENTS.
	SET NOCOUNT ON;
BEGIN TRAN 
	      
		  UPDATE MTS_LOGIN SET STATUS=@STATUS WHERE 
		  USERID=@USERID
		  
		  INSERT INTO [MTS_AUDIT] 
		 (
		 [USERID],[AUDIT_DATETIME],[AUDIT_INFO]
		 ) 
		 VALUES 
		 (
		 @USERID,GETDATE(),@AUDIT_INFO
		 )
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END
			
COMMIT
RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEUSER]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[MTS_UPDATEUSER] @USERID BIGINT
	,@FIRSTNAME VARCHAR(30)
	,@LASTNAME VARCHAR(30)
	,@EMAIL VARCHAR(50)
	,@ROLE BIGINT
	,@ACTIVE BIT
	,@LOCKED BIT
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRANSACTION

	UPDATE MTS_LOGIN
	SET FIRSTNAME = @FIRSTNAME
		,LASTNAME = @LASTNAME
		,ACTIVE = @ACTIVE
		,LOCKED = @LOCKED
	WHERE USERID = @USERID

	UPDATE MTS_USERCONTACTS
	SET EMAIL = @EMAIL
	WHERE USERID = @USERID

	UPDATE MTS_AUTHORITY
	SET ROLEID = @ROLE
	WHERE USERID = @USERID
	
	IF @LOCKED=0 AND EXISTS(SELECT 1 FROM MTS_LOGIN WHERE USERID = @USERID AND STATUS=3)
	BEGIN
	 UPDATE MTS_LOGIN SET NO_OF_ATTEMPTS=0,STATUS=2 WHERE USERID = @USERID
	END

	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRANSACTION

		RETURN - 1
	END

	COMMIT

	RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_UPDATEUSERATTEMPTS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_UPDATEUSERATTEMPTS] 
(
	
	@USERID BIGINT,
	@NO_OF_ATTEMPTS TINYINT
)
AS
BEGIN
	
	SET NOCOUNT ON;
BEGIN TRAN 

     IF (@NO_OF_ATTEMPTS <> 0)
       BEGIN
	     UPDATE [MTS_LOGIN] SET [NO_OF_ATTEMPTS]=@NO_OF_ATTEMPTS  WHERE 
	     [USERID]=@USERID	  		  
	
		 INSERT INTO [MTS_AUDIT] 
		 (
		 [USERID],[AUDIT_DATETIME],[AUDIT_INFO]
		 ) 
		 VALUES 
		 (
		 @USERID,GETDATE(),'LOGIN FAILED'
		 )
	  END
	  
	  ELSE
	   BEGIN
	   
	    UPDATE [MTS_LOGIN] SET [NO_OF_ATTEMPTS]=0,[LAST_LOGIN]=GETDATE()  WHERE 
	     [USERID]=@USERID	
	     
	     INSERT INTO [MTS_AUDIT] 
		 (
		 [USERID],[AUDIT_DATETIME],[AUDIT_INFO]
		 ) 
		 VALUES 
		 (
		 @USERID,GETDATE(),'LOGINED SUCCESSFULLY'
		 )
	   END
	
	IF @@ERROR <> 0
	BEGIN
		ROLLBACK TRAN
		RETURN -1
	END
			
COMMIT
RETURN 0
END

GO
/****** Object:  StoredProcedure [dbo].[MTS_USERPASSWORDEMAIL]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MTS_USERPASSWORDEMAIL] @To AS VARCHAR( 50 ) ,
                                           @Firstname AS VARCHAR( 30 ) ,
                                           @Lastname AS VARCHAR( 30 ) ,
                                           @Userid AS VARCHAR( 30 ) ,
                                           @Password AS VARCHAR( 50 ) 

AS
BEGIN

    

    SELECT
           @To AS 'To'
         , @Firstname + ' ' + @Lastname AS USERNAME
         , @Userid AS USERID
         , @Password AS 'PASSWORD'
		 ,(SELECT TOP 1 ROLE_NAME FROM MTS_LOGIN AS L WITH (NOLOCK)
			INNER JOIN MTS_AUTHORITY AS A WITH (NOLOCK) ON L.USERID=A.USERID
			INNER JOIN MTS_ROLES AS R WITH (NOLOCK) ON R.ROLEID=A.ROLEID
			WHERE USERNAME=@Userid) AS ROLE
         
END;

GO
/****** Object:  StoredProcedure [dbo].[READ_ALL_DisableHOLIDAYDATES]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[READ_ALL_DisableHOLIDAYDATES](@year bigint)
AS
BEGIN
SELECT DATEOFHOLIDAY
	FROM HOLIDAYSLIST
	WHERE year(DATEOFHOLIDAY)=@year 
END
GO
/****** Object:  StoredProcedure [dbo].[READ_ALL_HOLIDAYDATES]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[READ_ALL_HOLIDAYDATES] (
	@FROMDATE DATE
	,@TODATE DATE
	)
AS
BEGIN
	SELECT DATEOFHOLIDAY
	FROM HOLIDAYSLIST
	WHERE DATEOFHOLIDAY BETWEEN @FROMDATE
			AND @TODATE
END
GO
/****** Object:  StoredProcedure [dbo].[READ_ALL_HOLIDAYSLIST]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[READ_ALL_HOLIDAYSLIST] (@yearofholiday VARCHAR(255))
AS
BEGIN
	SELECT id
		,DateOfHoliday
		,HolidayReason
		,YearOfHoliday
		,DayNameofDate
	FROM HolidaysList
	WHERE YearOfHoliday = @yearofholiday
END
GO
/****** Object:  StoredProcedure [dbo].[READ_ALL_MESSAGES]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[READ_ALL_MESSAGES](@roleid bigint)
AS
BEGIN
declare @currentdate date=(select GETDATE())
if(@roleid<>1)
begin
	SELECT id
	    ,FromDate
		,ToDate
		,MessageHeader
		,MessageTitle
		,Message
	FROM MTS_MESSAGES where @currentdate between Fromdate and ToDate
	end
	else
	begin
	SELECT top 10  id
	    ,FromDate
		,ToDate
		,MessageHeader
		,MessageTitle
		,Message
	FROM MTS_MESSAGES order by FromDate desc 
	end
END
GO
/****** Object:  StoredProcedure [dbo].[READ_ALLEMPLOYEELEAVELIST]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_ALLEMPLOYEELEAVELIST] (
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
	WHERE cast(l.FromDate AS DATE) >= @fromdate
		AND cast(l.FromDate AS DATE) <= @todate
		AND e.id = isnull(@employeename, e.id)
END
GO
/****** Object:  StoredProcedure [dbo].[READ_ALLEMPLOYEENAMES]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_ALLEMPLOYEENAMES]
AS
BEGIN
		SELECT id
		,FirstName + ' ' + LastName AS EmployeeName
	FROM Employee
END
GO
/****** Object:  StoredProcedure [dbo].[READ_APPROVEDLEAVELIST]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_APPROVEDLEAVELIST] (@managerid BIGINT,@fromDate date,@todate date)
AS
BEGIN
	SELECT DISTINCT l.Employee_Id
		,CAST(Convert(VARCHAR(255), l.FromDate, 110) AS VARCHAR(255)) AS 'FromDate'
		,CAST(Convert(VARCHAR(255), l.ToDate, 110) AS VARCHAR(255)) AS 'ToDate'
		,l.NumberOfDays
		,ml.LeaveType
		,l.Reason
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
	INNER JOIN Employee AS e ON l.Approval = 2
	WHERE FromDate between @fromdate and @todate
		  and Managerid = @managerid order by FromDate 
END

GO
/****** Object:  StoredProcedure [dbo].[READ_APPROVEDLEAVELISTFOREXPORT]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
	
CREATE PROCEDURE [dbo].[READ_APPROVEDLEAVELISTFOREXPORT] (
	@month INT
	,@year VARCHAR(255)
	)
AS
BEGIN
	--SELECT emp.Employee_Id
	--	,emp.Firstname + ' ' + emp.Lastname Fullname
	--	,year
	--	,Month
	--	,lt.LeaveType
	--	,LeaveBalance
	--	,Lev.Numberofdays
	--FROM LeaveReport Lev
	--INNER JOIN Employee emp ON emp.id = Lev.Employee_Id
	--INNER JOIN Mts_LeaveType lt ON lev.LeaveType = lt.id
	--WHERE year = @year
	--	AND Month = @month
	

SELECT emp.Employee_Id
	,lt.LeaveType
	,@month AS Month
	,emp.Firstname + ' ' + emp.Lastname Fullname
	,year
	,sum(r.Numberofdays)  AS Numberofdays
	,lt.Numberofdays - sum(r.Numberofdays) + sum(lopdays) AS LeaveBalance
FROM LeaveReport r
INNER JOIN mts_leaveType lt ON r.leaveType = lt.ID
INNER JOIN Employee emp ON emp.id = r.Employee_Id
WHERE Month <= @month
	AND Year = @year
GROUP BY emp.Employee_Id
	,emp.Firstname
	,emp.Lastname
	,lt.LeaveType
	,year
	,lt.Numberofdays;
END

GO
/****** Object:  StoredProcedure [dbo].[READ_AUTHORIZATION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[READ_AUTHORIZATION]
as
Begin
select Url from SeecuredAuthorization
End
GO
/****** Object:  StoredProcedure [dbo].[READ_BIRTHDAYS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
  
  Create Procedure [dbo].[READ_BIRTHDAYS]
as
Begin
Declare @date date=getdate();
WITH Employee_CTE (Name,Month,Day)
As
(
select Firstname + ' ' +Lastname,month(Dateofbirth) as Month, Day(Dateofbirth) as Year from Employee
)  
select Name from Employee_CTE where Month=month(@date) and Day=day(@date)
End
GO
/****** Object:  StoredProcedure [dbo].[READ_BLOODGROUP]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_BLOODGROUP]
AS
BEGIN
	SELECT *
	FROM MTS_BloodGroup
END
GO
/****** Object:  StoredProcedure [dbo].[READ_DESIGNATION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_DESIGNATION]
AS
BEGIN
	SELECT *
	FROM Mts_Designation
END
GO
/****** Object:  StoredProcedure [dbo].[Read_Document_Images]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Read_Document_Images] (
	@documentid BIGINT
	,@empid BIGINT
	)
AS
BEGIN
	SELECT DocumentImage, DocumentName
	FROM Employee_Documents
	WHERE DocumentId = @documentid
		AND Employee_Id = @empid
END
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_EMPLOYEE] (@empid VARCHAR(255))
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
		,E.Department
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
	FULL OUTER JOIN Mts_Nationality nat ON nat.id = E.Nationality
	WHERE Employee_Id = @empid
END



/****** Object:  StoredProcedure [dbo].[Read_Payslip]    Script Date: 03/06/2018 PM 5:56:36 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_IMAGE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEE_IMAGE] (@empid BIGINT)
AS
BEGIN
	SELECT IMAGE
	FROM EmployeeImage
	WHERE Employee_Id = @empid
END
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_LEAVEBALANCE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[READ_EMPLOYEE_LEAVEBALANCE] (@empid VARCHAR(255))
AS
BEGIN
	IF EXISTS (
			SELECT Employee_Id
				,Gender
			FROM Employee
			WHERE gender = 0
				AND id = @empid
			)
		SELECT emp.Employee_Id
			,emp.Firstname + ' ' + emp.Lastname Fullname
			,l.Leavetype
			,elb.Leavebalance
		FROM EmployeeLeaveBalance elb
		INNER JOIN Employee emp ON elb.Employee_Id = @empid
		INNER JOIN Mts_LeaveType l ON elb.LeaveType = l.id
		WHERE emp.id = @empid
		
		UNION ALL
		
		SELECT e.Employee_Id
			,e.Firstname + ' ' + e.Lastname Fullname
			,m.LeaveType
			,Numberofdays AS Leavebalance
		FROM EmployeeLeaveBalance elb
		RIGHT JOIN Mts_Leavetype m ON m.id = elb.LeaveType
			AND Employee_Id = @empid
		INNER JOIN Employee e ON e.id = @empid
		WHERE isnull(m.id, 0) <> isnull(elb.LeaveType, 3)
END

BEGIN
	IF EXISTS (
			SELECT Employee_Id
				,Gender
			FROM Employee
			WHERE gender = 1
				AND id = @empid
			)
		SELECT emp.Employee_Id
			,emp.Firstname + ' ' + emp.Lastname Fullname
			,l.Leavetype
			,elb.Leavebalance
		FROM EmployeeLeaveBalance elb
		INNER JOIN Employee emp ON elb.Employee_Id = @empid
		INNER JOIN Mts_LeaveType l ON elb.LeaveType = l.id
		WHERE emp.id = @empid
		
		UNION ALL
		
		SELECT e.Employee_Id
			,e.Firstname + ' ' + e.Lastname Fullname
			,m.LeaveType
			,Numberofdays AS Leavebalance
		FROM EmployeeLeaveBalance elb
		RIGHT JOIN Mts_Leavetype m ON m.id = elb.LeaveType
			AND Employee_Id = @empid
		INNER JOIN Employee e ON e.id = @empid
		WHERE isnull(m.id, 0) <> isnull(elb.LeaveType, 0)
END
GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEDETAILS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[READ_EMPLOYEEDETAILS]
AS
BEGIN
	SELECT E.id
		,E.Employee_Id
		,E.Firstname
		,E.Lastname
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
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEEDOCUMENTS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_EMPLOYEEDOCUMENTS]
AS
BEGIN
	SELECT *
	FROM MTS_EmployeeDocuments
END
GO
/****** Object:  StoredProcedure [dbo].[READ_GOVERNMENT_ID]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_GOVERNMENT_ID]
AS
BEGIN
	SELECT *
	FROM MTS_Government_Id
END
GO
/****** Object:  StoredProcedure [dbo].[READ_LANGUAGES]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LANGUAGES]
AS
BEGIN
	SELECT *
	FROM MTS_Languages
END
GO
/****** Object:  StoredProcedure [dbo].[READ_LEAVESESSION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LEAVESESSION]
AS
BEGIN
	SELECT *
	FROM Mts_Session
END
GO
/****** Object:  StoredProcedure [dbo].[READ_LEAVETYPE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_LEAVETYPE]
AS
BEGIN
	SELECT *
	FROM MTS_LeaveType
END
GO
/****** Object:  StoredProcedure [dbo].[READ_MANAGERNAMES]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[READ_MANAGERNAMES]
As
BEGIN
	SELECT id
		,FirstName + ' ' + LastName AS EmployeeName
	FROM Employee E Inner Join MTS_AUthority auth on auth.USERID=E.id where auth.Roleid=3 or auth.Roleid=1
END
GO
/****** Object:  StoredProcedure [dbo].[READ_MARITAL_STATUS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_MARITAL_STATUS]
AS
BEGIN
	SELECT *
	FROM Mts_Marital_status
END
GO
/****** Object:  StoredProcedure [dbo].[READ_NATIONALITY]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_NATIONALITY]
AS
BEGIN
	SELECT *
	FROM MTS_Nationality
END
GO
/****** Object:  StoredProcedure [dbo].[Read_Payslip]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Read_Payslip] (@employeeid varchar(255),@year bigint,@month varchar(255))
AS
BEGIN
	SELECT 
		D.Designation
		,E.Department
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
	where EP.Emp_No=@employeeid and EP.Month=@month and EP.Year=@year
END
GO
/****** Object:  StoredProcedure [dbo].[READ_PENDINGLEAVELIST]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_PENDINGLEAVELIST] (@managerid BIGINT)
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
/****** Object:  StoredProcedure [dbo].[READ_QUALIFICATION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_QUALIFICATION]
AS
BEGIN
	SELECT *
	FROM MTS_Qualification
END
GO
/****** Object:  StoredProcedure [dbo].[READ_RELATIONSHIP]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_RELATIONSHIP]
AS
BEGIN
	SELECT *
	FROM Mts_Relationship
END
GO
/****** Object:  StoredProcedure [dbo].[READ_SKILLS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[READ_SKILLS]
AS
BEGIN
	SELECT *
	FROM MTS_Skills
END
GO
/****** Object:  StoredProcedure [dbo].[SESSIONEMPID]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SESSIONEMPID] (@userid BIGINT)
AS
BEGIN
	SELECT e.Employee_Id
		,e.Gender
	FROM MTS_Login
	INNER JOIN Employee e ON e.id = @userid
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_BANKDETAILS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_BANKDETAILS] (
	@accountnumber BIGINT
	,@bankname VARCHAR(255)
	,@branchname VARCHAR(255)
	,@empid BIGINT
	,@ifsc VARCHAR(255)
	)
AS
BEGIN
	UPDATE Employee_BankDetails
	SET Accountnumber = @accountnumber
		,Bankname = @bankname
		,Branchname = @branchname
		,Employee_Id = @empid
		,Ifsc = @ifsc
	WHERE Employee_Id = @empid
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_BLOODGROUP]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_BLOODGROUP] (
	@id BIGINT
	,@bloodgroup VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_Bloodgroup
			WHERE Bloodgroup = @bloodgroup
			)
	BEGIN
		UPDATE MTS_Bloodgroup
		SET Bloodgroup = @bloodgroup
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_DESIGNATION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_DESIGNATION] (
	@id BIGINT
	,@designation VARCHAR(max)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Designation
			FROM Mts_Designation
			WHERE Designation = @designation
			)
	BEGIN
		UPDATE Mts_Designation
		SET Designation = @designation
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_EMPLOYEE] (
	@aadhar BIGINT
	,@dateofbirth DATE
	,@dateofjoin DATE
	,@designation BIGINT
	,@department VARCHAR(255)
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
		,Department = @department
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
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEE_EDUCATIONS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_EMPLOYEE_EDUCATIONS] (
	@employeeid BIGINT
	,@schoolname VARCHAR(255)
	,@schoolpassoutyear DATE
	,@collegename VARCHAR(255)
	,@collegepassoutyear DATE
	,@qualification BIGINT
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM Employee_Educations
			WHERE Employee_Id = @employeeid
				AND Schoolname = @schoolname
				AND Schoolpassedoutyear = @schoolpassoutyear
				AND Collegename = @collegename
				AND Collegepassedoutyear = @collegepassoutyear
				AND Qualification = @qualification
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM Employee_Educations
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE Employee_Educations
		SET Schoolname = @schoolname
			,Schoolpassedoutyear = @schoolpassoutyear
			,Collegename = @collegename
			,Collegepassedoutyear = @collegepassoutyear
			,Qualification = @qualification
		WHERE Employee_Id = @employeeid

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO Employee_Educations (
			Employee_Id
			,Schoolname
			,Schoolpassedoutyear
			,Collegename
			,Collegepassedoutyear
			,Qualification
			)
		VALUES (
			@employeeid
			,@schoolname
			,@schoolpassoutyear
			,@collegename
			,@collegepassoutyear
			,@qualification
			)

		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEEADDRESS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_EMPLOYEEADDRESS] (
	@employeeid BIGINT
	,@Currentbuilding VARCHAR(255)
	,@currentcity VARCHAR(255)
	,@currentstate VARCHAR(255)
	,@currentpincode BIGINT
	,@permanentbuilding VARCHAR(255)
	,@permanentcity VARCHAR(255)
	,@permanentstate VARCHAR(255)
	,@permanentpincode BIGINT
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM Employee_Address
			WHERE Employee_Id = @employeeid
				AND CurrentBuilding_Plot = @Currentbuilding
				AND CurrentCity = @currentcity
				AND CurrentState = @currentstate
				AND CurrentPincode = @currentpincode
				AND PermanentBuilding_Plot = @permanentbuilding
				AND PermanentCity = @permanentcity
				AND PermanentState = @permanentstate
				AND PermanentPincode = @permanentpincode
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM Employee_Address
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE Employee_Address
		SET Employee_Id = @employeeid
			,CurrentBuilding_Plot = @Currentbuilding
			,CurrentCity = @currentcity
			,CurrentState = @currentstate
			,CurrentPincode = @currentpincode
			,PermanentBuilding_Plot = @permanentbuilding
			,PermanentCity = @permanentcity
			,PermanentState = @permanentstate
			,PermanentPincode = @permanentpincode
		WHERE Employee_Id = @employeeid

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO Employee_Address (
			Employee_Id
			,CurrentBuilding_Plot
			,CurrentCity
			,CurrentState
			,CurrentPincode
			,PermanentBuilding_Plot
			,PermanentCity
			,PermanentState
			,PermanentPincode
			)
		VALUES (
			@employeeid
			,@Currentbuilding
			,@currentcity
			,@currentstate
			,@currentpincode
			,@permanentbuilding
			,@permanentcity
			,@permanentstate
			,@permanentpincode
			)

		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_EMPLOYEEDETAILS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_EMPLOYEEDETAILS] (
	@employeeid BIGINT
	,@bloodgroup BIGINT
	,@languagename VARCHAR(255)
	)
AS
BEGIN
	IF EXISTS (
			SELECT 1
			FROM EmployeeDetails
			WHERE Employee_Id = @employeeid
				AND BloodGroup = @bloodgroup
				AND Languagename = @languagename
			)
	BEGIN
		SELECT 0
	END
	ELSE IF EXISTS (
			SELECT 1
			FROM EmployeeDetails
			WHERE Employee_Id = @employeeid
			)
	BEGIN
		UPDATE EmployeeDetails
		SET BloodGroup = @bloodgroup
			,Languagename = @languagename
		WHERE Employee_Id = @employeeid

		SELECT 1
	END
	ELSE
	BEGIN
		INSERT INTO EmployeeDetails (
			Employee_Id
			,BloodGroup
			,Languagename
			)
		VALUES (
			@employeeid
			,@bloodgroup
			,@languagename
			)

		SELECT 1
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_GOVERNMENT_ID]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_GOVERNMENT_ID] (
	@id BIGINT
	,@idname VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT IdName
			FROM Mts_Government_Id
			WHERE IdName = @idname
			)
	BEGIN
		UPDATE MTS_Government_Id
		SET Idname = @idname
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_HOLIDAYS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UPDATE_HOLIDAYS] (
	@id BIGINT
	,@yearofholiday VARCHAR(255)
	,@holidayreason VARCHAR(255)
	,@dateofholiday DATE
	,@dayname VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT 1
			FROM HolidaysList
			WHERE YearOfHoliday = @yearofholiday
				AND HolidayReason = @holidayreason
				AND DateOfHoliday = @dateofholiday
			)
	BEGIN
		UPDATE HolidaysList
		SET YearOfHoliday = @yearofholiday
			,HolidayReason = @holidayreason
			,DateOfHoliday = @dateofholiday
			,DayNameofDate = @dayname
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_LANGUAGES]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_LANGUAGES] (
	@id BIGINT
	,@languagename VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Languagename
			FROM MTS_Languages
			WHERE Languagename = @languagename
			)
	BEGIN
		UPDATE MTS_Languages
		SET Languagename = @languagename
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_LEAVETYPE]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_LEAVETYPE] (
	@id BIGINT
	,@leavetype VARCHAR(255)
	,@numberofdays BIGINT
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_LeaveType
			WHERE Leavetype = @leavetype
			)
	BEGIN
		UPDATE MTS_LeaveType
		SET Leavetype = @leavetype
			,Numberofdays = @numberofdays
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_MARITAL_STATUS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_MARITAL_STATUS] (
	@id BIGINT
	,@marital_status VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM Mts_Marital_status
			WHERE Marital_status = @marital_status
			)
	BEGIN
		UPDATE Mts_Marital_status
		SET Marital_status = @marital_status
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_MESSAGES]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UPDATE_MESSAGES] (
	@id BIGINT
	,@fromdate date
	,@todate date
	,@messageheader varchar(255)
	,@messagetitle varchar(255)
	,@message varchar(255)
	)
AS
BEGIN
update MTS_MESSAGES set FromDate=@fromdate, ToDate=@todate, MessageHeader=@messageheader, MessageTitle=@messagetitle, Message=@message where id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_NATIONALITY]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_NATIONALITY] (
	@id BIGINT
	,@nationality VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT *
			FROM MTS_Nationality
			WHERE Nationality = @nationality
			)
	BEGIN
		UPDATE MTS_Nationality
		SET Nationality = @nationality
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_QUALIFICATION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_QUALIFICATION] (
	@id BIGINT
	,@qualification VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Qualification
			FROM MTS_Qualification
			WHERE Qualification = @qualification
			)
	BEGIN
		UPDATE MTS_Qualification
		SET Qualification = @qualification
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_RELATIONSHIP]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_RELATIONSHIP] (
	@id BIGINT
	,@relationship VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Relationship
			FROM Mts_Relationship
			WHERE Relationship = @relationship
			)
	BEGIN
		UPDATE Mts_Relationship
		SET Relationship = @relationship
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_SESSION]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_SESSION] (
	@id BIGINT
	,@session VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Session
			FROM Mts_Session
			WHERE Session = @session
			)
	BEGIN
		UPDATE Mts_Session
		SET Session = @session
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATE_SKILLS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UPDATE_SKILLS] (
	@id BIGINT
	,@skills VARCHAR(255)
	)
AS
BEGIN
	IF NOT EXISTS (
			SELECT Skills
			FROM MTS_Skills
			WHERE Skills = @skills
			)
	BEGIN
		UPDATE MTS_Skills
		SET Skills = @skills
		WHERE id = @id

		SELECT 1
	END
	ELSE
	BEGIN
		SELECT 0
	END
END
GO
/****** Object:  StoredProcedure [dbo].[UPDATELOPDAYS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create Procedure [dbo].[UPDATELOPDAYS] (@empid bigint,@leavetype bigint,@month varchar(255),@year varchar(255),@lopdays float)
As
Begin
Update LeaveReport set LopDays=@lopdays where Employee_id=@empid and Month=@month and year=@year and LeaveType=@leavetype
End
GO
/****** Object:  StoredProcedure [dbo].[VIEW_EMPLOYEEDETAILS]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[VIEW_EMPLOYEEDETAILS] (@id BIGINT)
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
		,E.Department
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
/****** Object:  StoredProcedure [dbo].[VIEW_EMPLOYEELEAVELIST]    Script Date: 1/7/2019 4:07:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[VIEW_EMPLOYEELEAVELIST] (@empid BIGINT)
AS
BEGIN
	SELECT Employee_Id
	    ,l.id
		,ml.id
		,Approval
		,AppliedDate
		,l.FromDate AS 'FromDate'
		,l.ToDate AS 'ToDate'
		,l.Numberofdays
		,ml.LeaveType
		,l.Reason
	FROM Employee_Leave AS l
	FULL OUTER JOIN MTS_LeaveType AS ml ON l.LeaveType = ml.id
	WHERE l.Employee_Id = @empid
END
GO
