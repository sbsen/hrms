


INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (4, N'Backup storage')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (5, N'Laptop')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (6, N'Monitor')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (7, N'Router')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (8, N'Server')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (9, N'Chair')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (10, N'Storage racks')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (11, N'Car')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (12, N'Two Wheeler')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (13, N'LCD Display')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (14, N'Printer')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (15, N'Projector')
INSERT [dbo].[MTS_ASSET_NAME] ([Id], [Assetname]) VALUES (16, N'Table')


SET IDENTITY_INSERT [dbo].[MTS_ASSET_NAME] OFF
SET IDENTITY_INSERT [dbo].[MTS_AssetCategories] ON 

INSERT [dbo].[MTS_AssetCategories] ([CategoryId], [CategoryName]) VALUES (10002, N'Computer Equipment')
INSERT [dbo].[MTS_AssetCategories] ([CategoryId], [CategoryName]) VALUES (10003, N'Furniture & Fixtures')
INSERT [dbo].[MTS_AssetCategories] ([CategoryId], [CategoryName]) VALUES (10004, N'Motor Vehicles')
INSERT [dbo].[MTS_AssetCategories] ([CategoryId], [CategoryName]) VALUES (10005, N'Office Equipment')
SET IDENTITY_INSERT [dbo].[MTS_AssetCategories] OFF
SET IDENTITY_INSERT [dbo].[MTS_ASSETS] ON 

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (28, 10002, N'4', CAST(70.00 AS Decimal(4, 2)), 60, 100)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (28, 10002, N'5', CAST(70.00 AS Decimal(4, 2)), 60, 100)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (28, 10002, N'6', CAST(70.00 AS Decimal(4, 2)), 60, 100)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (28, 10002, N'7', CAST(70.00 AS Decimal(4, 2)), 60, 100)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (28, 10002, N'8', CAST(70.00 AS Decimal(4, 2)), 60, 100)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (29, 10003, N'9', CAST(70.00 AS Decimal(4, 2)), 60, 100)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (29, 10003, N'10', CAST(70.00 AS Decimal(4, 2)), 60, 100)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (29, 10003, N'16', CAST(70.00 AS Decimal(4, 2)), 60, 100)


INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (30, 10004, N'11', CAST(70.00 AS Decimal(4, 2)), 60, 44)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (30, 10004, N'12', CAST(70.00 AS Decimal(4, 2)), 60, 44)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (31, 10005, N'13', CAST(45.00 AS Decimal(4, 2)), 60, 100)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (31, 10005, N'14', CAST(45.00 AS Decimal(4, 2)), 60, 100)

INSERT [dbo].[MTS_ASSETS] ([Id], [AssettypeId], [Assetname], [Depreciation], [Expectedlife], [Salvagevalue]) VALUES (31, 10005, N'15', CAST(45.00 AS Decimal(4, 2)), 60, 100)
SET IDENTITY_INSERT [dbo].[MTS_ASSETS] OFF
