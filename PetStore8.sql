USE PetStore8
GO
create table Employee
(
	Id int identity primary key,
	Position nvarchar(50),
	UserId nvarchar(128) references AspNetUsers(Id)
)
go
create table Customer
(
	Id int identity primary key,
	UserId nvarchar(128) references AspNetUsers(Id)
)
go

CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL primary key,
	[Date] [datetime] NOT NULL,
	[Status] [varchar](30) NULL,
	[CustomerId] [int] NOT NULL references Customer(Id),
	[EmployeeId] [int] NOT NULL references Employee(Id)
)
GO
CREATE TABLE [dbo].Category(
	[Id] [int] IDENTITY(1,1) NOT NULL primary key,
	Name [varchar](50) NOT NULL
)
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL primary key,
	[Description] [varchar](50) NOT NULL,
	[Price] [float] NOT NULL,
	[Discount] [float] NOT NULL,
	[CategoryId] [int] NOT NULL references Category(Id)
)
GO
CREATE TABLE [dbo].[OrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL primary key,
	[OrderId] [int] NOT NULL references [Order](Id),
	[ProductId] [int] NOT NULL references [Product](Id),
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Discount] [float] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[Category] ON 
INSERT [dbo].[Category] ([id], [name]) VALUES (1, N'Dog')
INSERT [dbo].[Category] ([id], [name]) VALUES (2, N'Cat')
INSERT [dbo].[Category] ([id], [name]) VALUES (3, N'Parrot')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (1, N'Dog 1', 204.99, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (2, N'Dog 2', 73.94, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (3, N'Dog 3', 74.11, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (4, N'Dog 4', 52.73, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (5, N'Dog 5', 171.13, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (6, N'Dog 6', 140.55, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (7, N'Dog 7', 56.01, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (8, N'Dog 8', 48.17, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (9, N'Dog 9', 62.03, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (10, N'Dog 10', 88.19, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (11, N'Dog 11', 20.31, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (12, N'Dog 12', 96.47, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (13, N'Dog 13', 155.58, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (14, N'Dog 14', 204.26, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (15, N'Dog 15', 148.25, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (16, N'Dog 16', 209.9, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (17, N'Dog 17', 104.29, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (18, N'Dog 18', 146.36, 0, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (19, N'Dog 19', 154.76, 0.15, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (20, N'Dog 20', 135.82, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (21, N'Dog 21', 158.46, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (22, N'Dog 22', 165.89, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (23, N'Dog 23', 95.7, 0.1, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (24, N'Dog 24', 80.16, 0.05, 1)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (25, N'Cat 25', 19.25, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (26, N'Cat 26', 171.36, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (27, N'Cat 27', 35.08, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (28, N'Cat 28', 57.92, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (29, N'Cat 29', 157.81, 0, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (30, N'Cat 30', 151, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (31, N'Cat 31', 126.34, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (32, N'Cat 32', 170.23, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (33, N'Cat 33', 136.5, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (34, N'Cat 34', 24.68, 0.1, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (35, N'Cat 35', 88.71, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (36, N'Cat 36', 190.43, 0.05, 2)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (37, N'Parrot 37', 14, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (38, N'Parrot 38', 206.57, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (39, N'Parrot 39', 163.48, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (40, N'Parrot 40', 92.3, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (41, N'Parrot 41', 168.69, 0.1, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (42, N'Parrot 42', 117.89, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (43, N'Parrot 43', 56.34, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (44, N'Parrot 44', 158.61, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (45, N'Parrot 45', 209.96, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (46, N'Parrot 46', 176.24, 0, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (47, N'Parrot 47', 174.28, 0.05, 3)
INSERT [dbo].[Product] ([id], [description], [price], [discount], [CategoryId]) VALUES (48, N'Parrot 48', 70.65, 0, 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
raiserror('The PetStore database in now ready for use....',0,1)