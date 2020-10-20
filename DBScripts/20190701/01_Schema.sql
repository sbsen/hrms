Create Procedure READEMPLOYEE_PANNUMBER (@empid varchar(255))
AS
BEGIN
select Pancard from Employee where Employee_Id = @empid 
END
