
/****** Object:  StoredProcedure [dbo].[READ_BIRTHDAYS]    Script Date: 3/16/2020 6:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[READ_BIRTHDAYS] (@isUpcommingBD BIT)
AS
BEGIN
	IF (@isUpcommingBD = 0)
	BEGIN
		DECLARE @date DATE = getdate();

		WITH Employee_CTE (
			Name
			,Month
			,Day
			,Active
			,Email
			,Department
			)
		AS (
			SELECT E.Firstname + ' ' + E.Lastname
				,month(Dateofbirth) AS Month
				,Day(Dateofbirth) AS day
				,MTLOG.ACTIVE
				,E.Email AS Email
				,MD.Department AS Department
			FROM Employee AS E WITH(NOLOCK)
			INNER JOIN MTS_LOGIN AS MTLOG WITH(NOLOCK) ON MTLOG.USERID = E.id
			INNER JOIN MTS_Department MD WITH(NOLOCK) ON E.DepartmentId = MD.id
			)
		SELECT TOP(15) Name
			,Email
			,Department
		FROM Employee_CTE WITH(NOLOCK)
		WHERE Month = month(@date)
			AND Day = day(@date)
			AND Active = 1
	END
	ELSE
	BEGIN
		DECLARE @CurrentMth INT = MONTH(getdate());
		DECLARE @TodayDate INT = DAY(getdate());
		DECLARE @MthEndtDate INT = DAY(EOMONTH(GETDATE()));
		DECLARE @MthName VARCHAR(15) = DATENAME(MONTH, GETDATE());

		IF EXISTS (
				SELECT *
				FROM EMPLOYEE E WITH(NOLOCK)
				WHERE month(E.Dateofbirth) > @CurrentMth
				)
		BEGIN
			SELECT TOP (5)
			 E.Firstname + ' ' + E.Lastname AS Name
				,E.Email AS Email
				,Day(E.Dateofbirth) AS [Day]
				,DATENAME(MONTH, E.Dateofbirth) AS MthName
				,MD.Department AS Department
			FROM Employee AS E WITH(NOLOCK)
			INNER JOIN MTS_LOGIN AS MTLOG WITH(NOLOCK) ON MTLOG.USERID = E.id
			INNER JOIN MTS_Department MD WITH(NOLOCK) ON E.DepartmentId = MD.id
			WHERE  MTLOG.Active = 1
					AND (( MONTH(E.Dateofbirth) = @CurrentMth
						AND Day(E.Dateofbirth) > @TodayDate ) 
					OR
					( MONTH(E.Dateofbirth) > @CurrentMth 
						AND MONTH(E.Dateofbirth) <= 12 ))
				
			ORDER BY MONTH(E.Dateofbirth)
				,Day(E.Dateofbirth)
				,E.Firstname
		END
		ELSE IF EXISTS (
				SELECT *
				FROM EMPLOYEE E WITH(NOLOCK)
				WHERE MONTH(E.Dateofbirth) BETWEEN MONTH(E.Dateofbirth)
						AND DATEADD(MONTH, 12, GETDATE())
				)
		BEGIN
			SELECT TOP (5)
			 E.Firstname + ' ' + E.Lastname AS Name
				,E.Email AS Email
				,Day(E.Dateofbirth) AS [Day]
				,DATENAME(MONTH, E.Dateofbirth) AS MthName
				,MD.Department AS Department
			FROM Employee AS E WITH(NOLOCK)
			INNER JOIN MTS_LOGIN AS MTLOG WITH(NOLOCK) ON MTLOG.USERID = E.id
			INNER JOIN MTS_Department MD WITH(NOLOCK) ON E.DepartmentId = MD.id
			WHERE MTLOG.Active = 1
				AND (month(E.Dateofbirth) BETWEEN month(E.Dateofbirth)
					AND DATEADD(MONTH, 12, GETDATE()))
			ORDER BY month(E.Dateofbirth)
				,Day(E.Dateofbirth)
				,E.Firstname
		END
		ELSE
		BEGIN
			SELECT 0
		END
				
	END
END



GO
/****** Object:  StoredProcedure [dbo].[READ_EMPLOYEE_ENTRY_DETAILS]    Script Date: 3/16/2020 6:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[READ_EMPLOYEE_ENTRY_DETAILS] @id VARCHAR(30)
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
		,RIGHT('0' + CAST((attn.Duration / 60) AS VARCHAR(2)), 2) + 'h ' + RIGHT('0' + CAST((attn.Duration % 60) AS VARCHAR(2)), 2) + 'm' AS WorkingHours
		,attn.StatusCode
		,attn.PunchRecords
		,attn.Duration AS DurationInMins
		,format(attn.InDateTime, 'dddd') AS day
	FROM MTS_ATTENDANCE attn WITH (NOLOCK)
	LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = convert(VARCHAR(10), attn.EmployeeCode)
	LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
	LEFT JOIN MTS_Designation D WITH (NOLOCK) ON D.id = E.Designation
	WHERE attn.EmployeeCode = @id
		--AND format(@date, 'MM/yy') = format(attn.InDateTime, 'MM/yy')
		AND (
			(
				(@time <> 0)
				AND (attn.Duration / 60) < @time
				)
			OR @time = 0
			)
		AND (
			(
				E.DepartmentId <> 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @date), 0) AS DATE)
					AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @date) + 1, - 1) AS DATE)
				AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
				AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
				AND CAST(InDateTime AS DATE) NOT IN (
					SELECT CAST(DateOfHoliday AS DATE)
					FROM HolidaysList WITH (NOLOCK)
					)
				)
			OR (
				E.DepartmentId = 2
				AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @date), 0) AS DATE)
					AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @date) + 1, - 1) AS DATE)
				)
			)

END


GO
/****** Object:  StoredProcedure [dbo].[READ_MONTHLY_ATTENDANCE_LOG]    Script Date: 3/16/2020 6:47:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[READ_MONTHLY_ATTENDANCE_LOG] @month DATE
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
				LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = AL1.EmployeeCode
				LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
				WHERE AL1.EmployeeCode = al.EmployeeCode
					--AND MONTH(AL1.Month) = MONTH(@month)
					--AND YEAR(AL1.Month) = YEAR(@month)
					AND (
						AL1.StatusCode = 'P'
						OR AL1.StatusCode = 'Â½P'
						)
					AND (
						(
							E.DepartmentId <> 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
							AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
							AND CAST(InDateTime AS DATE) NOT IN (
								SELECT CAST(DateOfHoliday AS DATE)
								FROM HolidaysList WITH (NOLOCK)
								)
							)
						OR (
							E.DepartmentId = 2
							AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
								AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
							)
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
				LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = ALOG.EmployeeCode
				LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
		WHERE 
			--MONTH(ALOG.Month) = MONTH(@month)
			--AND YEAR(ALOG.Month) = YEAR(@month)
			 (
			 (
			 	E.DepartmentId <> 2
			 	AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
			 		AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
			 	AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
			 	AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
			 	AND CAST(InDateTime AS DATE) NOT IN (
			 		SELECT CAST(DateOfHoliday AS DATE)
			 		FROM HolidaysList WITH (NOLOCK)
			 		)
			 	)
			 OR (
			 	E.DepartmentId = 2
			 	AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
			 		AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
			 	)
			 )
			AND ALOG.StatusCode = 'P'
			AND MA.EmployeeCode = ALOG.EmployeeCode) AS PresentDays
		,(SELECT COUNT(ALOG1.StatusCode) 
		FROM MTS_ATTENDANCE ALOG1 WITH (NOLOCK)
		LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = ALOG1.EmployeeCode
		LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
		WHERE 
			--MONTH(ALOG1.Month) = MONTH(@month)
			--AND YEAR(ALOG1.Month) = YEAR(@month)
			(
			 (
			 	E.DepartmentId <> 2
			 	AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
			 		AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
			 	AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
			 	AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
			 	AND CAST(InDateTime AS DATE) NOT IN (
			 		SELECT CAST(DateOfHoliday AS DATE)
			 		FROM HolidaysList WITH (NOLOCK)
			 		)
			 	)
			 OR (
			 	E.DepartmentId = 2
			 	AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
			 		AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
			 	)
			 )
			AND ALOG1.StatusCode = 'A'
			AND MA.EmployeeCode = ALOG1.EmployeeCode) AS AbsentDays
		,(SELECT COUNT(ALOG2.StatusCode) 
		FROM MTS_ATTENDANCE ALOG2 WITH (NOLOCK)
		LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = ALOG2.EmployeeCode
		LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
		WHERE 
			--MONTH(ALOG2.Month) = MONTH(@month)
			--AND YEAR(ALOG2.Month) = YEAR(@month)
			(
			 (
			 	E.DepartmentId <> 2
			 	AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
			 		AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
			 	AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
			 	AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
			 	AND CAST(InDateTime AS DATE) NOT IN (
			 		SELECT CAST(DateOfHoliday AS DATE)
			 		FROM HolidaysList WITH (NOLOCK)
			 		)
			 	)
			 OR (
			 	E.DepartmentId = 2
			 	AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
			 		AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
			 	)
			 )
			AND ALOG2.StatusCode = 'Â½P'
			AND MA.EmployeeCode = ALOG2.EmployeeCode) AS HalfDays
		,(SELECT COUNT(ALOG3.StatusCode) 
		FROM MTS_ATTENDANCE ALOG3 WITH (NOLOCK)
		LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = ALOG3.EmployeeCode
		LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
		WHERE 
			--MONTH(ALOG3.Month) = MONTH(@month)
			--AND YEAR(ALOG3.Month) = YEAR(@month)
			(
			 (
			 	E.DepartmentId <> 2
			 	AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
			 		AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
			 	AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
			 	AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
			 	AND CAST(InDateTime AS DATE) NOT IN (
			 		SELECT CAST(DateOfHoliday AS DATE)
			 		FROM HolidaysList WITH (NOLOCK)
			 		)
			 	)
			 OR (
			 	E.DepartmentId = 2
			 	AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
			 		AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
			 	)
			 )
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
		--,RIGHT('0' + CAST((durations.Duration / 60) AS VARCHAR(2)), 2) + 'h ' + RIGHT('0' + CAST((durations.Duration % 60) AS VARCHAR(2)), 2) + 'm' AS Duration
		,RIGHT('00' + CONVERT(VARCHAR(4), durations.Duration / 60), 3) + 'h ' + RIGHT('0' + CONVERT(VARCHAR(2), durations.Duration % 60), 3) + 'm' AS Duration
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
			FROM MTS_ATTENDANCE MA WITH(NOLOCK)
			LEFT JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = MA.EmployeeCode
			LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
			WHERE 
				--MONTH(MA.Month) = MONTH(@month)
				--AND YEAR(MA.Month) = YEAR(@month)
				(
				 (
			 		E.DepartmentId <> 2
			 		AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
			 			AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
			 		AND FORMAT(InDateTime, 'dddd') <> 'Sunday'
			 		AND FORMAT(InDateTime, 'dddd') <> 'Saturday'
			 		AND CAST(InDateTime AS DATE) NOT IN (
			 			SELECT CAST(DateOfHoliday AS DATE)
			 			FROM HolidaysList WITH (NOLOCK)
			 			)
			 		)
				 OR (
			 		E.DepartmentId = 2
			 		AND CAST(InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
			 			AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
			 		)
				 )
			ORDER BY MA.InDateTime DESC
			) AS ATTENDANCE_UPTO
		,durations.Duration AS DurationInMins
		--, CONCAT( DATENAME(MONTH, MONTH(attendance_Log.InDateTime)) , '/', YEAR(attendance_Log.InDateTime) ) AS Nameofthemonth
	FROM MTS_ATTENDANCE attendance_Log WITH (NOLOCK)
	INNER JOIN Employee E WITH (NOLOCK) ON E.Employee_Id = cast(attendance_Log.EmployeeCode AS VARCHAR(10))
	LEFT JOIN MTS_Department DEP WITH (NOLOCK) ON DEP.id = E.DepartmentId
	LEFT JOIN MTS_Department department WITH (NOLOCK) ON E.DepartmentId = department.id
	LEFT JOIN Durations durations ON attendance_Log.EmployeeCode = durations.EmployeeCode
	LEFT JOIN Total_status_counts ST ON ST.EmployeeCode = attendance_Log.EmployeeCode
	LEFT JOIN Employee_Reporting_Managers ERM WITH (NOLOCK) ON E.id = ERM.EmployeeId
	WHERE 
		--MONTH(attendance_Log.Month) = MONTH(@month)
		--AND YEAR(attendance_Log.Month) = YEAR(@month)
		(
		(
		 E.DepartmentId <> 2
		 AND CAST(attendance_Log.InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
		 	AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
		 AND FORMAT(attendance_Log.InDateTime, 'dddd') <> 'Sunday'
		 AND FORMAT(attendance_Log.InDateTime, 'dddd') <> 'Saturday'
		 AND CAST(attendance_Log.InDateTime AS DATE) NOT IN (
		 	SELECT CAST(DateOfHoliday AS DATE)
		 	FROM HolidaysList WITH (NOLOCK)
		 	)
		 )
		OR (
		 E.DepartmentId = 2
		 AND CAST(attendance_Log.InDateTime AS DATE) BETWEEN CAST(DATEADD(mm, DATEDIFF(mm, 0, @month), 0) AS DATE)
		 	AND CAST(DATEADD(mm, DATEDIFF(mm, 0, @month) + 1, - 1) AS DATE)
		 )
		)
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
