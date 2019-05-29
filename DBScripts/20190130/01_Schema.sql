
Alter PROCEDURE [dbo].[READ_EMPLOYEEDETAILS]
AS
BEGIN
	SELECT E.id
		,E.Employee_Id
		,E.Firstname
		,E.Lastname
		,CAST(Convert(VARCHAR(255), E.Dateofjoin, 110) AS VARCHAR(255)) AS 'Dateofjoin'
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