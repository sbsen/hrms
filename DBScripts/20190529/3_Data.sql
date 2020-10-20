

Insert into MTS_Department values('Information Technology')

Insert into MTS_Department values('Business Process Outsourcing')

Insert into MTS_Department values('Human Resource')



--TRUNCATE TABLE [MTS_LeaveType]
 
SET IDENTITY_INSERT [dbo].[MTS_LeaveType] ON 

GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (1, N'Casual', 6, 1)
GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (2, N'Sick', 6, 1)
GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (3, N'Earned', 12, 1)
GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (4, N'Maternity', 182, 1)
GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (5, N'Paternity', 5, 1)
GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (6, N'Casual', 12, 2)
GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (7, N'Sick', 12, 2)
GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (8, N'Earned', 12, 2)
GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (9, N'Maternity', 182, 2)
GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (10, N'Paternity', 5, 2)
GO
INSERT [dbo].[MTS_LeaveType] ([id], [Leavetype], [Numberofdays], [DepartmentId]) VALUES (11, N'Casual', 12, 3)
GO
SET IDENTITY_INSERT [dbo].[MTS_LeaveType] OFF
GO

