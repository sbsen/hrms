/****** Object:  StoredProcedure [dbo].[Get_Employee_Reporting_Managers]    Script Date: 2020-03-17 13:18:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[Get_Employee_Reporting_Managers] @EmployeeId BIGINT
AS
BEGIN
	;With Manager_Details
	AS
	( 
	SELECT emp.id,emp.Firstname,emp.Lastname FROM Employee_Reporting_Managers erm
	inner join Employee emp on emp.id = erm.ManagerId
	 WHERE EmployeeId=@EmployeeId

	 union all

	 SELECT MA.Manager_Id AS id, E.Firstname, E.Lastname AS EmployeeName
	FROM EMPLOYEE E WITH (NOLOCK)
	INNER JOIN MTS_APPRAISAL_EMPLOYEE_RATING_TABLE MA ON E.id = MA.Manager_Id
	WHERE MA.Employee_Id = @EmployeeId

	)
	select * from Manager_Details
END


GO


