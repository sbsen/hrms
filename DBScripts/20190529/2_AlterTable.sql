

Alter table Employee add DepartmentId bigint null
Go
update Employee set DepartmentId = t.id  from MTS_Department t inner join Employee e on t.Department = e.Department
Go
alter table Employee drop column Department
Go

Alter table Employee_Leave add isLOP bit 
GO


Alter Table MTS_LEavetype add DepartmentId bigint








