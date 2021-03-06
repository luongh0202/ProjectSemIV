create database [Clothes]
go
USE [Clothes]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 1/7/2019 8:08:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banner](
	[BannerId] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[DisplayNumber] [int] NULL,
	[Status] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cards]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cards](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[CardSeri] [varchar](25) NULL,
	[CardNumber] [varchar](25) NULL,
	[PriceUnit] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[CatalogId] [int] IDENTITY(1,1) NOT NULL,
	[CatalogName] [nvarchar](100) NULL,
	[Descriptions] [nvarchar](100) NULL,
	[ParentId] [int] NULL,
	[Status] [bit] NULL,
	[Images] [nvarchar](100) NULL,
	[DisplayNumber] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CatalogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CatalogPost]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatalogPost](
	[CatalogPostId] [int] IDENTITY(1,1) NOT NULL,
	[CatalogPostName] [nvarchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_CatalogNew] PRIMARY KEY CLUSTERED 
(
	[CatalogPostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorId] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nvarchar](100) NULL,
	[Status] [bit] NULL,
	[Natation] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[data]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[data](
	[DataId] [int] IDENTITY(1,1) NOT NULL,
	[DataName] [ntext] NULL,
	[Content] [ntext] NULL,
	[Created] [date] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[DataId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Feeback]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feeback](
	[FeebackId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functions]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[FunctionId] [int] IDENTITY(1,1) NOT NULL,
	[FunctionName] [nvarchar](100) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[FunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GroupFunction]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupFunction](
	[GroupFunctionId] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NULL,
	[FunctionId] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupFunctionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](100) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ImageLink]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImageLink](
	[ImageLinkId] [int] IDENTITY(1,1) NOT NULL,
	[ImageLinkName] [nvarchar](100) NULL,
	[ProductId] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageLinkId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[ProductId] [int] NULL,
	[Amount] [float] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
	[Status] [int] NULL,
	[Note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderName] [nvarchar](100) NULL,
	[OrderNumber] [varchar](50) NULL,
	[Phone] [varchar](15) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[TotalAmount] [float] NULL,
	[PaymentDate] [date] NULL,
	[CreatedDate] [date] NULL,
	[Status] [int] NULL,
	[UserId] [int] NULL,
	[PaymentMethod] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PackageHistory]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageHistory](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[PackageId] [int] NULL,
	[CardId] [int] NULL,
	[Amount] [float] NULL,
	[Created] [date] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Packages]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[PackageId] [int] IDENTITY(1,1) NOT NULL,
	[PackageName] [nvarchar](100) NULL,
	[Amount] [float] NULL,
	[UserId] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentType](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeName] [nvarchar](100) NULL,
	[Descriptions] [nvarchar](100) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[PostTitle] [nvarchar](100) NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
	[DisplayNumber] [int] NULL,
	[CatalogPostId] [int] NULL,
	[Created] [date] NULL,
	[ContentDetail] [ntext] NULL,
	[Images] [nvarchar](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[ProductContent] [ntext] NULL,
	[ProductContentDetail] [ntext] NULL,
	[Images] [nvarchar](100) NULL,
	[View] [int] NULL DEFAULT ((0)),
	[BuyItem] [int] NULL DEFAULT ((0)),
	[PriceInput] [float] NULL,
	[PriceOutput] [float] NULL,
	[Quantity] [int] NULL,
	[CatalogId] [int] NULL,
	[ProviderId] [int] NULL,
	[Created] [date] NULL,
	[Status] [bit] NULL,
	[ImageHover] [nvarchar](100) NULL,
	[Discount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[ProductColorId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[ColorId] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[ProductSizeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[SizeId] [int] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductSizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provider]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderId] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProviderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Size]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](100) NULL,
	[Descriptions] [nvarchar](100) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](15) NULL,
	[GroupId] [int] NULL,
	[Status] [bit] NULL,
	[Created] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Banner] ON 

GO
INSERT [dbo].[Banner] ([BannerId], [Image], [DisplayNumber], [Status]) VALUES (1, N'slideshow1.jpg', 1, 1)
GO
INSERT [dbo].[Banner] ([BannerId], [Image], [DisplayNumber], [Status]) VALUES (2, N'slideshow2.jpg', 2, 1)
GO
INSERT [dbo].[Banner] ([BannerId], [Image], [DisplayNumber], [Status]) VALUES (3, N'fb1-f315ced7-980c-4c78-8a58-48d5ef4c7bd8.jpg', 4, 1)
GO
INSERT [dbo].[Banner] ([BannerId], [Image], [DisplayNumber], [Status]) VALUES (4, N'fb3.jpg', 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Banner] OFF
GO
SET IDENTITY_INSERT [dbo].[Cards] ON 

GO
INSERT [dbo].[Cards] ([CardId], [CardSeri], [CardNumber], [PriceUnit], [Status]) VALUES (1, N'ffff', N'bbbbb', 50000, 0)
GO
INSERT [dbo].[Cards] ([CardId], [CardSeri], [CardNumber], [PriceUnit], [Status]) VALUES (2, N'000000', N'222220', 100000, 1)
GO
INSERT [dbo].[Cards] ([CardId], [CardSeri], [CardNumber], [PriceUnit], [Status]) VALUES (3, N'000001', N'222221', 200000, 1)
GO
INSERT [dbo].[Cards] ([CardId], [CardSeri], [CardNumber], [PriceUnit], [Status]) VALUES (4, N'000002', N'222222', 500000, 1)
GO
INSERT [dbo].[Cards] ([CardId], [CardSeri], [CardNumber], [PriceUnit], [Status]) VALUES (5, N'000003', N'222223', 1000000, 1)
GO
SET IDENTITY_INSERT [dbo].[Cards] OFF
GO
SET IDENTITY_INSERT [dbo].[Catalog] ON 

GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (1, N'Đồ nam', N'Quần áo nam', 0, 1, N'banner-1.jpg', 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (2, N'Đồ nữ', N'Quần áo nữ', 0, 1, N'banner-2.jpg', 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (3, N'Đồ trẻ em', N'Quần áo trẻ em', 0, 1, N'banner-3.jpg', 3)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (4, N'Giầy nam', N'Giầy dép của nam', 0, 1, N'banner-5.jpg', 4)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (5, N'Giầy nữ', N'Giầy dép của nữ', 0, 1, N'banner-4.jpg', 5)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (6, N'Phụ kiện', N'Phụ kiện thời trang', 0, 1, N'banner-6.jpg', 6)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (7, N'Túi xách', N'Túi xách, túi thời trang', 0, 1, N'banner-7.jpg', 7)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (8, N'Đồng hồ', N'Đồng hồ đeo tay nam nữ', 0, 1, N'banner-subcate-7.jpg', 8)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (9, N'Làm đẹp', N'Mỹ phẩm', 0, 1, N'banner-subcate-6.jpg', 9)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (10, N'QUẦN NAM', N'Quần của nam', 1, 1, NULL, 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (11, N'ÁO NAM', N'Áo của nam', 1, 1, NULL, 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (12, N'ÁO KHOÁC NAM', N'Áo khoác của nam', 1, 1, NULL, 3)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (13, N'ÁO NỮ', N'Áo của nữ', 2, 1, NULL, 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (14, N'QUẦN NỮ', N'Quần của nữ', 2, 1, NULL, 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (15, N'VÁY', N'Sản phẩm váy nữ', 2, 1, NULL, 3)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (16, N'QUẦN ÁO BÉ TRAI', N'Quần áo bé trai', 3, 1, NULL, 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (17, N'QUẦN ÁO BÉ GÁI', N'Quần áo bé gái', 3, 1, NULL, 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (18, N'GIẦY DA', N'Giầy da nam', 4, 1, NULL, 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (19, N'GIẦY VẢI', N'Giầy vải nam', 4, 1, NULL, 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (20, N'DÉP', N'Dép của nam', 4, 1, NULL, 3)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (21, N'SANDAL', N'Dép sandal của nam', 4, 1, NULL, 4)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (22, N'GIẦY CAO GÓT', N'Giầy cao gót của nữ', 5, 1, NULL, 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (23, N'GIẦY BÚT BÊ', N'Giầy bút bê của nữ', 5, 1, NULL, 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (24, N'Dép đế xuông', N'Dép của nữ', 5, 1, NULL, 3)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (25, N'TRANG SỨC', N'Trang sức', 6, 1, NULL, 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (26, N'KÍNH MẮT', N'Kính mắt', 6, 1, NULL, 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (27, N'KHĂN CHOÀNG', N'Khăn choàng', 6, 1, NULL, 3)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (28, N'ĐỒ LÓT NAM', N'Đồ lót nam', 1, 1, NULL, 4)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (29, N'SẢN PHẨM KHUYẾN MÃI', N'Sản phẩm khuyến mãi', 1, 1, NULL, 5)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (30, N'ĐỒ LÓT NỮ', N'Đồ lót nữ', 2, 1, NULL, 4)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (31, N'HÀNG GIẢM GIÁ', N'Hàng giảm giá', 2, 1, NULL, 5)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (32, N'GIẦY LƯỜI', N'Giầy lười', 4, 1, NULL, 5)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (33, N'QUẦN ÁO TRẺ SƠ SINH', N'Quần áo trẻ sơ sinh', 3, 1, NULL, 3)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (34, N'ĐỒ CHƠI', N'Đồ chơi', 3, 1, NULL, 4)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (35, N'Cà vạt', N'Cà vạt', 6, 1, NULL, 4)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (36, N'Áo vest', N'Áo vest', 12, 1, NULL, 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (37, N'Áo khoác có mũ', N'Áo khoác có mũ', 12, 1, NULL, 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (38, N'Áo sơ mi', N'Áo sơ mi nữ', 13, 1, NULL, 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (39, N'Áo thun', N'Áo thun nữ', 13, 1, NULL, 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (40, N'Áo tay ngắn', N'Áo nữ tay ngắn', 13, 1, NULL, 3)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (41, N'Quần jean nữ', N'Quần jean nữ', 14, 1, NULL, 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (42, N'Quần sort nữ', N'Quần sort nữ', 14, 1, NULL, 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (43, N'Quần tây nữ', N'Quàn tây nữ', 14, 1, NULL, 3)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (44, N'Túi cầm tay', N'', 7, 1, NULL, 1)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (45, N'Ví nữ', N'', 7, 1, NULL, 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (46, N'Ví nam', N'', 7, 1, NULL, 3)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (47, N'Sản phẩm hot', N'', 3, 1, NULL, 5)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (48, N'Giầy mọi nữ', N'', 5, 1, NULL, 4)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (49, N'Dép nữ', N'', 5, 1, NULL, 5)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (50, N'Balo', N'', 7, 1, NULL, 4)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (51, N'Túi đeo chéo', N'ggg', 7, 1, N'0', 5)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (52, N'Dây nịt', NULL, 6, 1, NULL, 5)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (53, N'fdsfs', N'dfs bb', 3, 1, N'hoa24.jpg', 2)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (54, N'fd fgtg', N'ss dg', 11, 1, N'hoa11.jpg', 18)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (55, N'df fggg', N'ff fff', 12, 1, N'hoa1.jpg', 12)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (56, N'dghh ff', N'dd fff fff', 0, 1, N'hoa12.jpg', 15)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (57, N'aaaaa', N'bbbb bbbb', 0, 1, N'hoa24.jpg', 23)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (58, N'Äá» nam', N'ghhh', 0, 0, N'hoacuc.jpg', 15)
GO
INSERT [dbo].[Catalog] ([CatalogId], [CatalogName], [Descriptions], [ParentId], [Status], [Images], [DisplayNumber]) VALUES (59, N'Danh muc', N'dddÄ ddd', 0, 1, N'fb1.jpg', 15)
GO
SET IDENTITY_INSERT [dbo].[Catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[CatalogPost] ON 

GO
INSERT [dbo].[CatalogPost] ([CatalogPostId], [CatalogPostName], [Status]) VALUES (1, N'Thời trang trong nước', 1)
GO
INSERT [dbo].[CatalogPost] ([CatalogPostId], [CatalogPostName], [Status]) VALUES (2, N'Thời trang quốc tế', 1)
GO
INSERT [dbo].[CatalogPost] ([CatalogPostId], [CatalogPostName], [Status]) VALUES (3, N'Xu hướng năm', 1)
GO
SET IDENTITY_INSERT [dbo].[CatalogPost] OFF
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (1, N'Màu đỏ', 1, N'red')
GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (2, N'Màu xanh', 1, N'blue')
GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (3, N'Màu đen', 1, N'black')
GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (4, N'Màu trắng', 1, N'white')
GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (5, N'Màu hồng', 1, N'pink')
GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (6, N'Màu vàng', 1, N'yellow')
GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (7, N'Xanh', 1, N'green')
GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (8, N'Tím', 1, N'purple')
GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (9, N'Xám', 1, N'grey')
GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (10, N'Cam', 1, N'orange')
GO
INSERT [dbo].[Color] ([ColorId], [ColorName], [Status], [Natation]) VALUES (11, N'Nâu', 1, N'brown')
GO
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Feeback] ON 

GO
INSERT [dbo].[Feeback] ([FeebackId], [Name], [Email], [Content], [Status]) VALUES (2, N'Nguyen Thi Tuyen', N'nguyenthituyenlcs1995@gmail.com', N'Hello', 0)
GO
INSERT [dbo].[Feeback] ([FeebackId], [Name], [Email], [Content], [Status]) VALUES (3, N'Nguyen Thi Tuyen', N'nguyenthituyenlcs1995@gmail.com', N'Xin chào', 0)
GO
INSERT [dbo].[Feeback] ([FeebackId], [Name], [Email], [Content], [Status]) VALUES (4, N'Nguyen Thi Tuyen', N'nguyenthituyenlcs1995@gmail.com', N'Xin chào bạn', 1)
GO
INSERT [dbo].[Feeback] ([FeebackId], [Name], [Email], [Content], [Status]) VALUES (5, N'Nguyen Thi Tuyen', N'nguyenthituyenlcs1995@gmail.com', N'Xin chào', 0)
GO
INSERT [dbo].[Feeback] ([FeebackId], [Name], [Email], [Content], [Status]) VALUES (6, N'Pham Trang', N'nguyenthituyenlcs1995@gmail.com', N'Xin Chào', 0)
GO
INSERT [dbo].[Feeback] ([FeebackId], [Name], [Email], [Content], [Status]) VALUES (7, N'Nguyen Ming', N'nguyenthituyenlcs1995@gmail.com', N'Xin chao', 0)
GO
INSERT [dbo].[Feeback] ([FeebackId], [Name], [Email], [Content], [Status]) VALUES (8, N'', N'', N'', 0)
GO
INSERT [dbo].[Feeback] ([FeebackId], [Name], [Email], [Content], [Status]) VALUES (9, N'dd', N'y@gmail.com', N'vvvv', 0)
GO
INSERT [dbo].[Feeback] ([FeebackId], [Name], [Email], [Content], [Status]) VALUES (10, N'Nguyen Ming', N'b@gmail.com', N'cdvc', 0)
GO
SET IDENTITY_INSERT [dbo].[Feeback] OFF
GO
SET IDENTITY_INSERT [dbo].[Functions] ON 

GO
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Status]) VALUES (1, N'Quản lí nhà cung cấp', 1)
GO
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Status]) VALUES (2, N'Quản lí sản phẩm', 1)
GO
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Status]) VALUES (3, N'Quản lí màu sắc', 1)
GO
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Status]) VALUES (4, N'Quản lí đơn hàng', 1)
GO
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Status]) VALUES (5, N'Quản lí người dùng', 1)
GO
INSERT [dbo].[Functions] ([FunctionId], [FunctionName], [Status]) VALUES (6, N'Quản lí ví tiền', 1)
GO
SET IDENTITY_INSERT [dbo].[Functions] OFF
GO
SET IDENTITY_INSERT [dbo].[Groups] ON 

GO
INSERT [dbo].[Groups] ([GroupId], [GroupName], [Status]) VALUES (1, N'Quản trị', 1)
GO
INSERT [dbo].[Groups] ([GroupId], [GroupName], [Status]) VALUES (2, N'Khách hàng', 1)
GO
INSERT [dbo].[Groups] ([GroupId], [GroupName], [Status]) VALUES (3, N'Nhân viên', 1)
GO
INSERT [dbo].[Groups] ([GroupId], [GroupName], [Status]) VALUES (4, N'b', 1)
GO
SET IDENTITY_INSERT [dbo].[Groups] OFF
GO
SET IDENTITY_INSERT [dbo].[ImageLink] ON 

GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (1, N'image1xxl-1-3e2ac7ae-9be1-42c3-a715-bb170691b9aa.jpg', 2, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (2, N'image2xxl-4d9b959a-d93c-499d-8af0-6dd43213d212.jpg', 2, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (3, N'image4xxl-65038dcc-4ebd-47ce-926f-0a6b76d7f09f.jpg', 2, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (4, N'image1xxl-68298f67-067e-4690-a22a-8fed852b6499', 2, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (5, N'image4xxl-8.jpg', 1, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (6, N'image4xxl-7.jpg', 1, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (7, N'image2xxl-7.jpg', 1, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (8, N'image1xxl-6.jpg', 1, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (9, N'quan4.jpg', 3, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (10, N'quan7.jpg', 3, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (11, N'quan6.jpg', 3, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (12, N'quan5.jpg', 3, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (13, N'quan10.jpg', 4, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (14, N'quan9.jpg', 4, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (15, N'quan8.jpg', 4, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (16, N'quan3.jpg', 5, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (17, N'quan2.jpg', 5, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (18, N'quan1.jpg', 5, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (19, N'image1xxl-3.jpg', 6, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (20, N'image3xxl-3.jpg', 6, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (21, N'image4xxl-3.jpg', 6, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (22, N'image2xxl-3.jpg', 6, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (23, N'aonu24.jpg', 7, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (24, N'aonu23.jpg', 7, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (25, N'aonu22.jpg', 7, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (26, N'aonu21.jpg', 8, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (27, N'aonu20.jpg', 8, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (28, N'image2xxl-3005b340-9c34-41b3-94c7-a69a9ff3dbca,jpg', 8, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (29, N'aonu19.jpg', 8, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (30, N'aonu15.jpg', 9, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (31, N'aonu14.jpg', 9, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (32, N'aonu13.jpg', 9, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (33, N'aonu12.jpg', 9, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (34, N'aonu11.jpg', 10, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (35, N'aonu8.jpg', 10, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (36, N'aonu10.jpg', 10, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (37, N'image1xxl-25d4d081-699d-49ad-b05c-0535ab4f3b6b.jpg', 10, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (38, N'aonu5.jpg', 11, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (39, N'aonu4.jpg', 11, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (40, N'aonu3.jpg', 11, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (41, N'aonu2.jpg', 11, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (42, N'quannu19', 12, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (43, N'quannu18.jpg', 12, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (44, N'quannu17.jpg', 12, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (45, N'quannu16.jpg', 12, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (46, N'quannu12.jpg', 13, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (47, N'quannu11.jpg', 13, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (48, N'quannu10.jpg', 13, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (49, N'quannu9.jpg', 13, 1)
GO
INSERT [dbo].[ImageLink] ([ImageLinkId], [ImageLinkName], [ProductId], [Status]) VALUES (50, N'', 53, NULL)
GO
SET IDENTITY_INSERT [dbo].[ImageLink] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (3, 1, 24, 250000, 250000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (4, 1, 22, 2000000, 400000, 5, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (16, 47, 7, 2400000, 800000, 3, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (17, 48, 5, 960000, 480000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (18, 49, 5, 960000, 480000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (19, 50, 5, 960000, 480000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (20, 51, 10, 1260000, 630000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (21, 52, 22, 800000, 400000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (22, 53, 22, 800000, 400000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (23, 54, 22, 800000, 400000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (24, 55, 22, 800000, 400000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (25, 56, 22, 800000, 400000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (26, 57, 5, 960000, 480000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (27, 58, 5, 480000, 480000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (28, 59, 2, 750000, 750000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (29, 60, 2, 750000, 750000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (30, 61, 27, 500000, 500000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (31, 62, 32, 760000, 380000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (32, 63, 30, 1200000, 600000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (33, 64, 10, 630000, 630000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (34, 65, 44, 1100000, 550000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (35, 66, 2, 750000, 750000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (36, 67, 11, 1008000, 504000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (37, 68, 21, 486000, 162000, 3, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (38, 69, 21, 486000, 162000, 3, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (39, 70, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (40, 71, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (41, 72, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (42, 73, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (43, 74, 1, 1120000, 560000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (44, 75, 5, 960000, 480000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (45, 76, 5, 960000, 480000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (46, 77, 31, 900000, 300000, 3, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (47, 78, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (48, 80, 7, 800000, 800000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (49, 81, 7, 800000, 800000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (50, 82, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (51, 83, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (52, 84, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (53, 85, 7, 800000, 800000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (54, 86, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (55, 87, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (56, 88, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (57, 89, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (58, 90, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (59, 91, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (60, 92, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (61, 93, 2, 1500000, 750000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (62, 94, 1, 1680000, 560000, 3, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (63, 95, 19, 187000, 187000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (64, 96, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (65, 97, 4, 1700000, 850000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (66, 98, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (67, 99, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (68, 100, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (69, 101, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (70, 102, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (71, 103, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (72, 104, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (73, 105, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (74, 106, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (75, 107, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (76, 108, 21, 162000, 162000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (77, 109, 9, 1440000, 720000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (78, 111, 1, 560000, 560000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (79, 112, 28, 450000, 450000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (80, 113, 20, 400000, 200000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (81, 114, 11, 504000, 504000, 1, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (82, 115, 11, 1008000, 504000, 2, 1, NULL)
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (83, 116, 2, 750000, 750000, 1, 1, N'Size: S; Color: Màu đen')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (84, 117, 2, 700000, 700000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (85, 118, 2, 700000, 700000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (86, 119, 5, 480000, 480000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (87, 119, 1, 560000, 560000, 1, 1, N'Size: S; Color: Màu xanh')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (88, 120, 39, 700000, 350000, 2, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (89, 121, 10, 630000, 630000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (90, 122, 21, 162000, 162000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (91, 123, 20, 400000, 200000, 2, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (92, 124, 7, 800000, 800000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (93, 125, 1, 1120000, 560000, 2, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (94, 126, 1, 1120000, 560000, 2, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (95, 127, 2, 750000, 750000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (96, 128, 2, 750000, 750000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (97, 129, 2, 750000, 750000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (98, 129, 3, 800000, 800000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (99, 130, 2, 750000, 750000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (100, 130, 3, 800000, 800000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (101, 131, 5, 480000, 480000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (102, 132, 5, 480000, 480000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (103, 133, 7, 800000, 800000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (104, 134, 25, 350000, 350000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (105, 135, 1, 560000, 560000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (106, 136, 10, 630000, 630000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (107, 137, 1, 560000, 560000, 1, 1, N'Size: S; Color: Màu đỏ')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (108, 137, 21, 162000, 162000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (109, 138, 1, 560000, 560000, 1, 1, N'Size: S; Color: Màu đỏ')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (110, 138, 21, 162000, 162000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (111, 139, 1, 560000, 560000, 1, 1, N'Size: S; Color: Màu đỏ')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (112, 139, 21, 162000, 162000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (113, 140, 2, 1500000, 750000, 2, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (114, 141, 8, 800000, 800000, 1, 1, N'')
GO
INSERT [dbo].[OrderDetail] ([OrderDetailId], [OrderId], [ProductId], [Amount], [Price], [Quantity], [Status], [Note]) VALUES (115, 142, 40, 6000000, 1200000, 5, 1, N'')
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (1, N'c ccc', N'556', N'4566', NULL, N'bh', 2250000, NULL, CAST(N'2017-06-23' AS Date), 3, 1, N'Thanh toán trực tiếp khi nhận hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (2, N'c ccc', N'556', N'4566', NULL, N'bh', 2250000, NULL, CAST(N'2017-06-23' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (3, N'ffg', N'556', N'6876', NULL, N'jgjtyy', 2250000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (4, N'ghjgfd', N'556', N'3556', NULL, N'fghjh', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (5, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (6, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (7, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (8, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (9, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (10, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (11, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (12, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (13, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (14, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (15, N'ggfff', N'556', N'4567', NULL, N'hjjj', 1400000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (16, N'gứgdgf', N'556', N'23456', NULL, N'sdfg', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (17, N'gứgdgf', N'556', N'23456', NULL, N'sdfg', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (18, N'gứgdgf', N'556', N'23456', NULL, N'sdfg', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (19, N'gứgdgf', N'556', N'23456', NULL, N'sdfg', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (20, N'gứgdgf', N'556', N'23456', NULL, N'sdfg', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (21, N'gứgdgf', N'556', N'23456', NULL, N'sdfg', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (22, N'gứgdgf', N'556', N'23456', NULL, N'sdfg', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (23, N'gứgdgf', N'556', N'23456', NULL, N'sdfg', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (24, N'gứgdgf', N'556', N'23456', NULL, N'sdfg', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (25, N'gứgdgf', N'556', N'23456', NULL, N'sdfg', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (26, N'sssss', N'556', N'98765', NULL, N'22bv', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (27, N'sssss', N'556', N'98765', NULL, N'22bv', 2000000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (28, N'gngg fggf', N'556', N'4567', NULL, N'rtytr', 1800000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (29, N'gngg fggf', N'556', N'4567', NULL, N'rtytr', 1800000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (30, N'gngg fggf', N'556', N'4567', NULL, N'rtytr', 1800000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (31, N'tyt fff567', N'556', N'4566', NULL, N'fgh ghh', 1890000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (32, N'tyt fff567', N'556', N'4566', NULL, N'fgh ghh', 1890000, NULL, CAST(N'2017-06-24' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (33, N'dđ', N'556', N'555', NULL, N'ghgfh', 400000, NULL, CAST(N'2017-06-25' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (34, N'ffgds', N'556', N'3456', NULL, N'ưefgh', 2100000, NULL, CAST(N'2017-06-26' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (35, N'Ha Linh', N'556', N'345', NULL, N'Dhnv', 700000, NULL, CAST(N'2017-06-26' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (36, N'Pham Minh Trang', N'556', N'09563456', NULL, N'HA Noi', 1800000, NULL, CAST(N'2017-06-26' AS Date), 1, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (37, N'Pham Minh Long', N'556', N'0977', NULL, N'Ha Noi', 1110000, NULL, CAST(N'2017-06-26' AS Date), 3, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (38, N'', N'556', N'', NULL, N'', 1200000, NULL, CAST(N'2017-06-26' AS Date), 3, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (39, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 0, NULL, CAST(N'2017-06-26' AS Date), 3, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (40, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 0, NULL, CAST(N'2017-06-26' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (41, N'sdfgf gb', NULL, N'467', NULL, N'ffgh', 1600000, NULL, CAST(N'2017-06-26' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (42, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 0, NULL, CAST(N'2017-06-27' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (43, N'tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 0, NULL, CAST(N'2017-06-27' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (44, N'tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 0, NULL, CAST(N'2017-06-27' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (45, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 0, NULL, CAST(N'2017-06-27' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (46, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 0, NULL, CAST(N'2017-06-27' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (47, N'tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 2400000, NULL, CAST(N'2017-06-27' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (48, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1200000, NULL, CAST(N'2017-06-27' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (49, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1200000, NULL, CAST(N'2017-06-27' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (50, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1200000, NULL, CAST(N'2017-06-27' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (51, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1260000, CAST(N'2017-06-28' AS Date), CAST(N'2017-06-28' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (52, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1520000, CAST(N'2017-06-28' AS Date), CAST(N'2017-06-28' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (53, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1520000, CAST(N'2017-06-28' AS Date), CAST(N'2017-06-28' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (54, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1520000, CAST(N'2017-06-28' AS Date), CAST(N'2017-06-28' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (55, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1520000, CAST(N'2017-06-28' AS Date), CAST(N'2017-06-28' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (56, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1520000, CAST(N'2017-06-28' AS Date), CAST(N'2017-06-28' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (57, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1200000, CAST(N'2017-06-28' AS Date), CAST(N'2017-06-28' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (58, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 600000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (59, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1650000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (60, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1650000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (61, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 500000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (62, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 760000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (63, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1200000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (64, N'Minh Thanh', NULL, N'09546789', NULL, N'Ha Noi', 630000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (65, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1100000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (66, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 750000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (67, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1120000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (68, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 540000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (69, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 540000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (70, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 700000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (71, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1900000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (72, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1900000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (73, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1900000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (74, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 2600000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (75, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1200000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (76, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1200000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (77, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ 1', 1560000, CAST(N'2017-06-29' AS Date), CAST(N'2017-06-29' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (78, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (79, NULL, NULL, NULL, NULL, NULL, 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 0, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (80, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 800000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (81, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 800000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (82, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (83, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (84, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (85, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 800000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (86, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (87, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (88, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (89, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (90, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (91, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (92, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-06-30' AS Date), CAST(N'2017-06-30' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (93, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 1500000, CAST(N'2017-08-03' AS Date), CAST(N'2017-08-03' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (94, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 2100000, CAST(N'2017-08-04' AS Date), CAST(N'2017-08-04' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (95, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 220000, CAST(N'2017-08-05' AS Date), CAST(N'2017-08-05' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (96, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-08-05' AS Date), CAST(N'2017-08-05' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (97, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 1700000, CAST(N'2017-08-05' AS Date), CAST(N'2017-08-05' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (98, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (99, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 1450000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (100, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 1450000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (101, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (102, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (103, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (104, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (105, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (106, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (107, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (108, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 180000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (109, N'Nguyen VanPhuc', NULL, N'0967345674', NULL, N'Phu tho', 1440000, CAST(N'2017-08-07' AS Date), CAST(N'2017-08-07' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (110, N'Nguyen VanPhuc', NULL, N'0967345674', NULL, N'Phu tho', 1440000, CAST(N'2017-08-08' AS Date), CAST(N'2017-08-08' AS Date), 1, 0, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (111, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 700000, CAST(N'2017-08-08' AS Date), CAST(N'2017-08-08' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (112, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 450000, CAST(N'2017-08-08' AS Date), CAST(N'2017-08-08' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (113, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 400000, CAST(N'2017-08-08' AS Date), CAST(N'2017-08-08' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (114, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 504000, CAST(N'2017-08-08' AS Date), CAST(N'2017-08-08' AS Date), 1, 1, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (115, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 1008000, NULL, CAST(N'2017-08-08' AS Date), 2, 28, N'Thanh toán trực tiếp khi nhận hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (116, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 1380000, NULL, CAST(N'2017-08-08' AS Date), 2, 28, N'Thanh toán trực tiếp khi nhận hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (117, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 2300000, NULL, CAST(N'2017-08-08' AS Date), 2, 28, N'Thanh toán trực tiếp khi nhận hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (118, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 2300000, NULL, CAST(N'2017-08-08' AS Date), 2, 28, N'Thanh toán trực tiếp khi nhận hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (119, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 1040000, NULL, CAST(N'2017-08-08' AS Date), 3, 28, N'Thanh toán trực tiếp khi nhận hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (120, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 700000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 28, N'Thẻ ngân hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (121, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 630000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 28, N'Thẻ ngân hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (122, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 162000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 28, N'Thẻ ngân hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (123, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 400000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 28, N'Thẻ ngân hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (124, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 800000, NULL, CAST(N'2017-08-09' AS Date), 2, 28, N'Thanh toán trực tiếp khi nhận hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (125, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 1120000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 28, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (126, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 1120000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 28, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (127, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 750000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 28, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (128, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 750000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 28, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (129, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 1550000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 28, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (130, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 1550000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 28, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (131, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 480000, NULL, CAST(N'2017-08-09' AS Date), 2, 28, N'Thanh toán trực tiếp khi nhận hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (132, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 480000, NULL, CAST(N'2017-08-09' AS Date), 2, 1, N'Thanh toán trực tiếp khi nhận hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (133, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 800000, CAST(N'2017-08-09' AS Date), CAST(N'2017-08-09' AS Date), 1, 1, N'Thẻ ngân hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (134, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 350000, CAST(N'2017-08-10' AS Date), CAST(N'2017-08-10' AS Date), 1, 28, N'Thẻ ngân hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (135, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 560000, CAST(N'2017-08-10' AS Date), CAST(N'2017-08-10' AS Date), 1, 1, N'Thẻ ngân hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (136, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 630000, CAST(N'2017-08-10' AS Date), CAST(N'2017-08-10' AS Date), 1, 1, N'Thẻ ngân hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (137, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 722000, CAST(N'2017-08-11' AS Date), CAST(N'2017-08-11' AS Date), 1, 28, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (138, N'Phuc', NULL, N'0978564321', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', 722000, CAST(N'2017-08-11' AS Date), CAST(N'2017-08-11' AS Date), 1, 28, NULL)
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (139, N'Pham Minh Thanh', NULL, N'0978564234', NULL, N'Hà Nội', 722000, NULL, CAST(N'2017-08-11' AS Date), 2, 28, N'Thanh toán trực tiếp khi nhận hàng')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (140, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 1500000, CAST(N'2017-08-11' AS Date), CAST(N'2017-08-11' AS Date), 1, 1, N'Ví điện tử')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (141, N'Tuyen', NULL, N'0987654234', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', 800000, CAST(N'2017-08-11' AS Date), CAST(N'2017-08-11' AS Date), 1, 1, N'Ví điện tử')
GO
INSERT [dbo].[Orders] ([OrderId], [OrderName], [OrderNumber], [Phone], [Email], [Address], [TotalAmount], [PaymentDate], [CreatedDate], [Status], [UserId], [PaymentMethod]) VALUES (142, N'tester', NULL, N'0123456789', N'tester@gmail.com', N'Ha Noi', 6000000, CAST(N'2018-06-25' AS Date), CAST(N'2018-06-25' AS Date), 1, 30, N'Ví điện tử')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Packages] ON 

GO
INSERT [dbo].[Packages] ([PackageId], [PackageName], [Amount], [UserId], [Status]) VALUES (1, N'ffff', 1000, 2, 1)
GO
INSERT [dbo].[Packages] ([PackageId], [PackageName], [Amount], [UserId], [Status]) VALUES (3, N'TuyenCoi', 10000000, 1, 1)
GO
INSERT [dbo].[Packages] ([PackageId], [PackageName], [Amount], [UserId], [Status]) VALUES (4, N'Ha ha', 100000, 3, 1)
GO
INSERT [dbo].[Packages] ([PackageId], [PackageName], [Amount], [UserId], [Status]) VALUES (5, N'ghnh', 100000, 4, 1)
GO
INSERT [dbo].[Packages] ([PackageId], [PackageName], [Amount], [UserId], [Status]) VALUES (8, N'Mai Lan', NULL, 1, 1)
GO
INSERT [dbo].[Packages] ([PackageId], [PackageName], [Amount], [UserId], [Status]) VALUES (9, N'Hoa Hoa', NULL, 1, 1)
GO
INSERT [dbo].[Packages] ([PackageId], [PackageName], [Amount], [UserId], [Status]) VALUES (10, N'An', NULL, 1, 1)
GO
INSERT [dbo].[Packages] ([PackageId], [PackageName], [Amount], [UserId], [Status]) VALUES (11, N'Phuc', NULL, 1, 1)
GO
INSERT [dbo].[Packages] ([PackageId], [PackageName], [Amount], [UserId], [Status]) VALUES (12, N'AnNguyen', NULL, 1, 1)
GO
INSERT [dbo].[Packages] ([PackageId], [PackageName], [Amount], [UserId], [Status]) VALUES (13, N'tester', NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Packages] OFF
GO
SET IDENTITY_INSERT [dbo].[PaymentType] ON 

GO
INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentTypeName], [Descriptions], [Status]) VALUES (1, N'COD', N'Thanh toán trực tiếp khi nhận hàng', 1)
GO
INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentTypeName], [Descriptions], [Status]) VALUES (2, N'Card', N'Thanh toán qua thẻ nạp', 1)
GO
INSERT [dbo].[PaymentType] ([PaymentTypeId], [PaymentTypeName], [Descriptions], [Status]) VALUES (3, N'Internet Banking', N'Thanh toán qua tài khoản ngân hàng', 1)
GO
SET IDENTITY_INSERT [dbo].[PaymentType] OFF
GO
SET IDENTITY_INSERT [dbo].[Post] ON 

GO
INSERT [dbo].[Post] ([PostId], [PostTitle], [Content], [Status], [DisplayNumber], [CatalogPostId], [Created], [ContentDetail], [Images]) VALUES (1, N'VDFW 2016: HÀNH TRÌNH TỪ VÙNG ĐẤT KINH BẮC ĐẾN ĐẢO HOA SỨ', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Post] ([PostId], [PostTitle], [Content], [Status], [DisplayNumber], [CatalogPostId], [Created], [ContentDetail], [Images]) VALUES (2, N'VDFW 2016: HÀNH TRÌNH TỪ VÙNG ĐẤT KINH BẮC ĐẾN ĐẢO HOA SỨ', N'2 ngày đầu tiên của VDFW 2016 đã gây ấn tượng mạnh với 4 bộ sưu tập mang phong cách đầy khác biệt của Kelly Bùi, Xita, Huy Võ và Lea by Le Ha.', 1, 0, 1, CAST(N'2017-06-21' AS Date), N'<p style="margin-left:0px; margin-right:0px; text-align:start"><strong>2 ng&agrave;y đầu ti&ecirc;n của VDFW 2016 đ&atilde; g&acirc;y ấn tượng mạnh với 4 bộ sưu tập mang phong c&aacute;ch đầy kh&aacute;c biệt của Kelly B&ugrave;i, Xita, Huy V&otilde; v&agrave; Lea by Le Ha.</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:start"><strong>Kelly B&ugrave;i</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:start">L&agrave; ph&aacute;t s&uacute;ng khai mạc của VDFW 2016, BST &quot;Tonkin&quot; của NTK Kelly B&ugrave;i đ&atilde; để lại những ấn tượng mạnh trong l&ograve;ng giới mộ điệu. &quot;Tonkin&quot; của Kelly B&ugrave;i l&agrave; ngồn ngộn những gi&aacute; trị văn h&oacute;a, lịch sử c&ugrave;ng thời trang của một giai đoạn đ&uacute;c kết trong 33 thiết kế. Với t&ocirc;ng m&agrave;u đen chủ đạo, tr&ecirc;n nền chất liệu nhung, đũi, voan xuy&ecirc;n thấu, Kelly B&ugrave;i đ&atilde; ph&aacute;c họa n&ecirc;n h&igrave;nh ảnh những c&ocirc; g&aacute;i Kinh Bắc với chiếc khăn mỏ quạ c&aacute;ch điệu, &aacute;o d&agrave;i hay những chiếc v&aacute;y đụp mớ ba mớ bảy, họa tiết tranh d&acirc;n gian Đ&ocirc;ng Hồ.</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Nhưng kh&ocirc;ng chỉ t&aacute;i hiện h&igrave;nh ảnh Bắc Kỳ thuở xưa, &quot;Tonkin&quot; của Kelly B&ugrave;i c&ograve;n thấm đẫm tinh thần đương đại với c&aacute;c thiết kế khỏe khoắn, mang hơi hướng thể thao như crop top, bomber jacket hay tr&ecirc;n nền chất liệu da, ren lưới. T&iacute;nh đương đại h&ograve;a quyện c&ugrave;ng truyền thống l&agrave;m n&ecirc;n một bộ sưu tập đủ đầy, vừa bay bổng vừa ứng dụng, vừa gợi cảm lại e ấp, vừa nhẹ nh&agrave;ng nhưng lại đặc sệt c&aacute; t&iacute;nh.</p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/t5a2789-copy-1463175133413.jpg?v=1463384286756" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/kiengcan-7-1-1463175133645.jpg?v=1463384305028" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/kiengcan-1-2-1463175133506.jpg?v=1463384316740" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/kiengcan-0-1-1463175133487.jpg?v=1463384328295" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:start"><strong>Huy V&otilde;</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Được thiết kế v&agrave; lấy cảm hứng từ vẻ đẹp của Nam Phương Ho&agrave;ng hậu v&agrave; Madam Nhu Trần Lệ Xu&acirc;n, BST của NTK Huy V&otilde; mang phong c&aacute;ch cổ điển đưa kh&aacute;n giả v&agrave;o c&acirc;u chuyện t&igrave;nh l&atilde;ng mạn của Vua Bảo Đại v&agrave; Nam Phương Ho&agrave;ng Hậu. Tr&ecirc;n đường băng VDFW 2016, từng n&agrave;ng thơ của Huy V&otilde; lần lượt xuất hiện trong gam m&agrave;u nhẹ nh&agrave;ng huyền ảo tựa sương kh&oacute;i, h&ograve;a quyện trong l&agrave;n gi&oacute; biển v&agrave; tiết trời se lạnh của Đ&agrave; Lạt.&nbsp;</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Vẻ đẹp mong manh v&agrave; thần th&aacute;i của người phụ nữ Đ&ocirc;ng Dương được Huy V&otilde; gửi gắm v&agrave;o t&aacute;c phẩm của m&igrave;nh qua chất liệu mượt m&agrave;, sang trọng của vải satin; c&aacute; t&iacute;nh trong suốt của voan chiffon, oganza, vải cotton lạnh Ai Cập v&agrave; sự tươi mới của phong c&aacute;ch trung t&iacute;nh &ndash; gam m&agrave;u đậm v&agrave; chất liệu vải gabardine m&ugrave;a h&egrave;. Một n&eacute;t th&uacute; vị nữa l&agrave; sự chuyển mạch liền lạc từ ng&agrave;y sang đ&ecirc;m, lấy trắng, xanh bầu trời l&agrave;m m&agrave;u nền để t&ocirc;n l&ecirc;n nhưng gam nổi bật như đỏ, xanh ngọc lục bảo...</p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/kiengcan-2-1463175081369.jpg?v=1463384416255" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/kiengcan-1-1-1463175081330.jpg?v=1463384430749" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/kiengcan-0-1463175081291.jpg?v=1463384444561" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:start"><strong>Xita</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Lần đầu ti&ecirc;n xuất hiện tại VDFW 2016, Xita của NTK Katy Nguyễn vẫn c&ograve;n kh&aacute; mới lạ với phần đ&ocirc;ng kh&aacute;n giả v&agrave; những người y&ecirc;u thời trang ph&iacute;a Nam. Tuy nhi&ecirc;n, sau khi BST &quot;Plumeria Island &ndash; Đảo hoa sứ&quot; được ra mắt th&igrave; chắc chắn Xita l&agrave; một c&aacute;i t&ecirc;n đ&aacute;ng nhớ.</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">&quot;Plumeria Island &ndash; Đảo hoa sứ&quot; l&agrave; một BST thuần ứng dụng. Ở đ&oacute;, người ta bắt gặp c&aacute;c thiết kế đầm maxi, jumpsuit hay c&aacute;c thiết kế kho&eacute;t ngực s&acirc;u, crop top đầy t&iacute;nh năng động. Kh&ocirc;ng chỉ g&oacute;i gọn trong hoa sứ, Xita c&ograve;n chấm ph&aacute; cho BST với họa tiết nhiệt đới: những c&agrave;nh cọ xanh mướt, c&aacute;c ch&uacute; chim thi&ecirc;n điểu đầy sắc m&agrave;u cuộc sống.&nbsp;</p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/kiengcan-0-1463175007606.jpg?v=1463384488844" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/kiengcan-2-1463175007722.jpg?v=1463384507955" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>
', N'fb7.jpg')
GO
INSERT [dbo].[Post] ([PostId], [PostTitle], [Content], [Status], [DisplayNumber], [CatalogPostId], [Created], [ContentDetail], [Images]) VALUES (3, N'NHỮNG KHOẢNH KHẮC ĐẸP MÊ HỒN BẠN CHỈ CÓ THỂ BẮT GẶP TẠI CÁC SHOW THỜI TRANG VIỆT', N'Nhìn những hình ảnh dưới đây, chắc chắn trong bạn sẽ nổi dậy khát khao muốn được tận mắt thấy những thứ đã, đang và sẽ diễn ra trên các "đường băng" nổi tiếng nhất Việt Nam.', 1, 0, 1, CAST(N'2017-06-23' AS Date), N'<p style="margin-left:0px; margin-right:0px; text-align:start"><strong>Nh&igrave;n những h&igrave;nh ảnh dưới đ&acirc;y, chắc chắn trong bạn sẽ nổi dậy kh&aacute;t khao muốn được tận mắt thấy những thứ đ&atilde;, đang v&agrave; sẽ diễn ra tr&ecirc;n c&aacute;c &quot;đường băng&quot; nổi tiếng nhất Việt Nam.​</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Với l&agrave;ng mốt Việt, những show diễn thời trang - fashion show l&agrave; một kh&aacute;i niệm vừa lạ lại vừa quen. Quen l&agrave; bởi, giờ đ&acirc;y kh&ocirc;ng qu&aacute; kh&oacute; để được thưởng ngoạn thời trang tr&ecirc;n những đường băng danh tiếng. M&agrave; cũng lạ l&agrave; bởi, đến v&agrave;i năm đổ lại đ&acirc;y th&igrave; c&aacute;c show diễn thời trang mới được tổ chức một c&aacute;ch b&agrave;i bản v&agrave; quy củ, lối tr&igrave;nh diễn của c&aacute;c người mẫu ng&agrave;y c&agrave;ng chuy&ecirc;n nghiệp hơn v&agrave; s&acirc;n khấu cũng ng&agrave;y c&agrave;ng ho&agrave;nh tr&aacute;ng hơn.</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">C&oacute; người đến với c&aacute;c show diễn thời trang để t&igrave;m đến thứ quan trọng nhất c&oacute; trong t&ecirc;n của n&oacute;: thời trang, yếu tố được t&ocirc;n vinh m&atilde;nh liệt nhất. Nhưng tất nhi&ecirc;n, thời trang l&agrave; thứ ph&ugrave; phiếm m&agrave; kh&ocirc;ng phải ai cũng c&oacute; thể thẩm thấu trọn vẹn. N&ecirc;n phần đa kh&aacute;n giả chỉ cảm nhận được một điều r&otilde; r&agrave;ng m&agrave; ai ai cũng biết - c&aacute;i đẹp.</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Dưới đ&acirc;y, h&atilde;y tận hưởng những c&aacute;i đẹp, c&aacute;i lạ, c&aacute;i độc nhất v&ocirc; nhị trong những show diễn thời trang danh tiếng của Việt Nam:</p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/tuan-le-thoi-trang-15-1461077114469.jpg?v=1463383067692" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><em>Hậu trường trang điểm trước giờ diễn BST L&uacute;ng Liếng của NTK Thủy Nguyễn tại Tuần lễ thời trang quốc tế Việt Nam 2015. Ngay cả c&aacute;ch trang điểm m&aacute; đ&agrave;o cũng rất l&uacute;ng liếng!</em></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/tuan-le-thoi-trang-6-1461077116976.jpg?v=1463383105815" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><em>Cũng tại Tuần lễ thời trang quốc tế Việt Nam 2015 (VIFW 2015), NTK Li Lam lại g&acirc;y ấn tượng kh&ocirc;ng k&eacute;m với &quot;Nguy&ecirc;n bản&quot;. Show diễn mở đầu với n&agrave;ng mẫu bất ngờ bước ra uyển chuyển với những động t&aacute;c cơ thể mềm mại t&ocirc;n vinh thời trang.</em></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/tuan-le-thoi-trang-7-1461077114947.png?v=1463383135385" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><em>Những người phụ nữ &quot;nguy&ecirc;n bản&quot; của Li Lam c&oacute; một kh&iacute; chất ri&ecirc;ng biệt, từng trải v&agrave; biết họ muốn g&igrave; trong cuộc sống, với lối ăn mặc gọn g&agrave;ng, thanh lịch nhưng kh&ocirc;ng k&eacute;m phần y&ecirc;u kiều.</em></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/tuan-le-thoi-trang-8-1461077114643.jpg?v=1463383165519" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><em>Trước &quot;Nguy&ecirc;n bản&quot;, Li Lam từng ghi dấu ấn mạnh tại Tuần lễ thời trang quốc tế Việt Nam 2014 với &quot;Everything will be alright&quot;, thể hiện sự đam m&ecirc; d&agrave;nh cho thi&ecirc;n nhi&ecirc;n.</em></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/tuan-le-thoi-trang-16-1461077114495.jpg?v=1463383194421" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><em>Những người mẫu t&acirc;y c&ugrave;ng d&agrave;n &Aacute; Hậu, Hoa hậu xinh đẹp trong show diễn &quot;San h&ocirc; đỏ&quot; của NTK Vincent Đo&agrave;n.</em></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/tuan-le-thoi-trang-23-1461077114593.jpg?v=1463383232900" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><em>Thương hiệu Issue từ Th&aacute;i Lan mang đến một l&agrave;n gi&oacute; mới cho Tuần lễ thời trang quốc tế Việt Nam</em></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><em><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/tuan-le-thoi-trang-31-1461080719788.jpg?v=1463383269175" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></em></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><em>Haute Couture đ&iacute;ch thực đến từ NTK Alexis Mabille. Trong hậu trường, c&aacute;c ch&acirc;n d&agrave;i vẫn thực hiện lễ nghi c&uacute;ng b&aacute;i theo đ&uacute;ng truyền thống Việt Nam trước mẫu show diễn. (Ảnh: Kim B&aacute;nh Tr&ocirc;i Nước)​</em></p>
', N'fb6.jpg')
GO
INSERT [dbo].[Post] ([PostId], [PostTitle], [Content], [Status], [DisplayNumber], [CatalogPostId], [Created], [ContentDetail], [Images]) VALUES (4, N'50 NĂM TRƯỚC, CÁC BÀ CÁC MẸ CỦA CHÚNG MÌNH ĐÃ TỪNG "CHẤT" THẾ NÀY CƠ MÀ!', N'Nếu bạn nghĩ rằng các bà các mẹ của chúng mình thật "lỗi thời" thì xin thưa rằng, họ cũng đã từng có lúc sành điệu chẳng kém gì chúng ta bây giờ. Thậm chí nhiều xu hướng hiện tại mà chúng ta áp dụng vốn đã được ưa chuộng từ tận nửa thế kỷ trước.', 1, -1, 1, CAST(N'2017-06-24' AS Date), N'<p style="margin-left:0px; margin-right:0px; text-align:start"><strong>Nếu bạn nghĩ rằng c&aacute;c b&agrave; c&aacute;c mẹ của ch&uacute;ng m&igrave;nh thật &quot;lỗi thời&quot; th&igrave; xin thưa rằng, họ cũng đ&atilde; từng c&oacute; l&uacute;c s&agrave;nh điệu chẳng k&eacute;m g&igrave; ch&uacute;ng ta b&acirc;y giờ. Thậm ch&iacute; nhiều xu hướng hiện tại m&agrave; ch&uacute;ng ta &aacute;p dụng vốn đ&atilde; được ưa chuộng từ tận nửa thế kỷ trước.</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Bạn c&oacute; đang xỏ ch&acirc;n v&agrave;o một đ&ocirc;i gi&agrave;y đế th&ocirc;? Bạn đứng trước tủ v&agrave; chọn cho m&igrave;nh một chiếc v&aacute;y su&ocirc;ng vừa thoải m&aacute;i lại hợp mốt? Bạn bước ra phố với đ&ocirc;i mắt m&egrave;o được t&ocirc; vẽ tỉ mỉ, rồi vội v&atilde; đeo l&ecirc;n chiếc k&iacute;nh r&acirc;m s&agrave;nh điệu?&nbsp;</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Tất cả những g&igrave; bạn chọn đều chứng tỏ rằng, bạn l&agrave; một c&ocirc; n&agrave;ng thời thượng, v&agrave; chẳng kh&aacute;c mấy c&aacute;c b&agrave; c&aacute;c mẹ của m&igrave;nh từ tận... 50 năm trước. Xưa chưa bao giờ l&agrave; cũ. Điều n&agrave;y trong thời trang lu&ocirc;n lu&ocirc;n đ&uacute;ng. Đừng vội nghĩ rằng l&agrave; thời nay m&igrave;nh thật s&agrave;nh điệu v&agrave; c&aacute;c b&agrave; c&aacute;c mẹ thật lỗi thời bởi ngay từ xưa, những bậc sinh th&agrave;nh của ch&uacute;ng m&igrave;nh vốn cũng từng &quot;chất&quot; v&agrave; o&aacute;ch chẳng k&eacute;m g&igrave; ch&uacute;ng m&igrave;nh b&acirc;y giờ đ&acirc;u.</p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/2-1458883436598.jpg?v=1463382501294" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/945255-963258757061822-5646594411777494046-n-1458884161903.jpg?v=1463382514372" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/12107820-962625350458496-2161362393729439483-n-1458884161901.jpg?v=1463382527064" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Kh&ocirc;ng tin ư, h&atilde;y c&ugrave;ng ngh&iacute;a qua một số xu hướng dưới đ&acirc;y từ S&agrave;i G&ograve;n xưa những năm 60, để rồi bạn sẽ thấy l&agrave;, đ&uacute;ng l&agrave; giống thật!</p>

<p style="margin-left:0px; margin-right:0px; text-align:start"><strong>V&aacute;y su&ocirc;ng ngắn</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Cứ mỗi khi h&egrave; về l&agrave; c&aacute;c n&agrave;ng lại lao ngay ra shop, mua về một cơ man n&agrave;o l&agrave; v&aacute;y su&ocirc;ng v&agrave; v&aacute;y d&aacute;ng chữ A thoải m&aacute;i. Đ&uacute;ng l&agrave; rất hợp mốt, nhưng c&acirc;u chuyện về những chiếc v&aacute;y ngắn đầy nữ t&iacute;nh như thế n&agrave;y đ&atilde; bắt đầu từ thời b&agrave; v&agrave; mẹ của ch&uacute;ng m&igrave;nh cơ.</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Nhắc đến thời trang những năm 50s-60s, đặc biệt l&agrave; những năm cuối của thập ni&ecirc;n n&agrave;y th&igrave; chắc hẳn kh&ocirc;ng thể kh&ocirc;ng nhắc đến những chiếc v&aacute;y d&aacute;ng su&ocirc;ng rộng r&atilde;i - trang phục vốn được coi l&agrave; một sự c&aacute;ch t&acirc;n mang t&iacute;nh lịch sử trong ng&agrave;nh thời trang l&uacute;c bấy giờ. Kiểu v&aacute;y n&agrave;y mang lại cho người mặc cảm gi&aacute;c v&ocirc; c&ugrave;ng thoải m&aacute;i, m&agrave; vẫn thanh lịch v&agrave; mang ch&uacute;t cổ điển.</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Ng&agrave;y nay v&aacute;y su&ocirc;ng được biến tấu với đủ chất liệu v&agrave; chi tiết bắt mắt, nhưng nh&igrave;n chung, ch&uacute;ng cũng kh&ocirc;ng qu&aacute; kh&aacute;c biệt so với kiểu d&aacute;ng ng&agrave;y xưa l&agrave; mấy.</p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/dam-suong-4-1458836923888.jpg?v=1463382580447" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/12800246-962625170458514-1017148049950337644-n-1458839381369.jpg?v=1463382592395" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/12241485-962625097125188-3591749962229108825-n-1458839906246.jpg?v=1463382602910" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:start"><strong>Block heels</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Từ trước khi nhường chỗ cho những đ&ocirc;i gi&agrave;y g&oacute;t nhọn hoắt đầy gợi cảm, gi&agrave;y đế th&ocirc; l&agrave; phụ kiện mang t&iacute;nh &quot;quốc d&acirc;n&quot; của phụ nữ S&agrave;i G&ograve;n xưa. Kiểu gi&agrave;y n&agrave;y đi rất vững ch&acirc;n m&agrave; tr&ocirc;ng lại c&aacute; t&iacute;nh v&ocirc; c&ugrave;ng.&nbsp;</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Ng&agrave;y nay, gi&agrave;y đế th&ocirc; đ&atilde; được c&aacute;ch t&acirc;n với phần để loe ra&nbsp;để tr&ocirc;ng &quot;mềm d&aacute;ng&quot; v&agrave; mới lạ hơn.</p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/de-tho-1-1458837074543.jpg?v=1463382649448" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/de-tho-3-1458837069214.jpg?v=1463382661482" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>

<p style="margin-left:0px; margin-right:0px; text-align:start"><strong>Kitten Heels với v&aacute;y ngắn/quần loe</strong></p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Từ năm 2013, cả thế giới ph&aacute;t cuồng l&ecirc;n v&igrave; những đ&ocirc;i gi&agrave;y kitten heels với&nbsp;phần mũi nhọn,g&oacute;t thấp v&agrave; nhỏ nhắn. Kiểu gi&agrave;y n&agrave;y chinh phục giới thời trang bởi n&eacute;t xinh xắn, trẻ trung nhưng lại sang chảnh v&agrave; kh&aacute; dễ diện đồ. Mẫu gi&agrave;y huyền thoại n&agrave;y đ&atilde; được ph&aacute;t triển th&agrave;nh nhiều kiểu d&aacute;ng đa dạng hơn, với đủ thiết kế từ tối giản cho qu&yacute; c&ocirc; thanh lịch cho đến ph&aacute; c&aacute;ch c&ugrave;ng chi tiết đinh t&aacute;n, color block, in họa tiết... cho những c&ocirc; n&agrave;ng mạnh mẽ.</p>

<p style="margin-left:0px; margin-right:0px; text-align:start">Thực chất kitten heels cực thịnh v&agrave;o những năm 60. Cứ sải bước ra phố ở S&agrave;i G&ograve;n l&agrave; lại bắt gặp c&aacute;c qu&yacute; c&ocirc; ăn vận chỉnh tề, thong dong sải bước trong đ&ocirc;i kitten heels. Cũng ch&iacute;nh v&igrave; gắn liền với thời gian đ&oacute; n&ecirc;n mỗi khi nhắc đến kitten heels th&igrave; ấn tượng đầu ti&ecirc;n lu&ocirc;n l&agrave; &quot;vintage&quot;.</p>

<p style="margin-left:0px; margin-right:0px; text-align:center"><img src="https://bizweb.dktcdn.net/thumb/grande/100/087/870/files/kitten-heel-1-1458837038517.jpg?v=1463382703312" style="border:0px; box-sizing:border-box; max-width:100%; vertical-align:middle" /></p>
', N'fb4.jpg')
GO
SET IDENTITY_INSERT [dbo].[Post] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (1, N'Quần Jean rạch gối bó', N'Quần Denim của Asos đem đến sự tự tin và sành điệu với gam màu hồng hiện đại, xu hướng màu mới dành cho những tín đồ thời trang. Đăc điểm: - Vải Denim kéo giản - Di chuyển, hoạt động thoải mái - Co giãn với kích thước cơ thể -...', N'Quần Denim của Asos đem đến sự tự tin và sành điệu với gam màu hồng hiện đại, xu hướng màu mới dành cho những tín đồ thời trang.

Đăc điểm:

- Vải Denim kéo giản

- Di chuyển, hoạt động thoải mái

- Co giãn với kích thước cơ thể

- Cắt chặt chẽ với cơ thể

- Có thể sử dụng máy giặt để giặt

- 91% Cotton, 7% Polyester, 2% elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Có nhiều màu sắc để lựa chọn

- Xuất xứ: Nhập khẩu

', N'image4xxl-8.jpg', 10, 36, 600000, 700000, 20, 10, 2, CAST(N'2017-06-07' AS Date), 1, N'image4xxl-7.jpg', 20)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (2, N'Quần short bò', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang. Đăc điểm: - Vải Denim kéo giản - Có dây kéo thắt lưng - Có túi chức năng - Thoải mái cho...', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang.

Đăc điểm:

- Vải Denim kéo giản

- Có dây kéo thắt lưng

- Có túi chức năng

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 100% Cotton

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Màu xanh nhạt

- Xuất xứ: Nhập khẩu', N'image1xxl-1-3e2ac7ae-9be1-42c3-a715-bb170691b9aa.jpg', 3, 10, 700000, 750000, 15, 10, 8, CAST(N'2017-06-07' AS Date), 1, N'image1xxl-68298f67-067e-4690-a22a-8fed852b6499.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (3, N'Quần short Chno màu trắng', N'Quần short Chino của Asos đem đến sự tự tin và sành điệu với gam màu trắng hiện đại. Đăc điểm: - Vải Denim kéo giản - Có túi nghiêng đựng - Thoải mái cho bạn vận động - Co giãn với kích thước cơ thể - Có thể sử dụng...', N'Quần short Chino của Asos đem đến sự tự tin và sành điệu với gam màu trắng hiện đại.

Đăc điểm:

- Vải Denim kéo giản

- Có túi nghiêng đựng

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'quan4.jpg', 0, 2, 730000, 800000, 10, 10, 8, CAST(N'2017-06-07' AS Date), 1, N'quan7.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (4, N'Quần dàn gi Asos', N'Quần dàn gi của Asos đem đến sự tự tin và mạnh mẽ trong bộ đò lính, phù hợp với những người muốn thay đổi phong cách. Đăc điểm: - Vải Denim kéo giản - Có túi đựng - Thoải mái cho bạn vận động - Co giãn với kích thước...', N'Quần dàn gi của Asos đem đến sự tự tin và mạnh mẽ trong bộ đò lính, phù hợp với những người muốn thay đổi phong cách.

Đăc điểm:

- Vải Denim kéo giản

- Có túi đựng 

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Xuất xứ: Nhập khẩu

', N'quan10.jpg', 6, 1, 800000, 850000, 7, 10, 8, CAST(N'2017-06-07' AS Date), 1, N'quan9.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (5, N'Quần kaki mỏng Asos', N'Quần Denim của Asos đem đến sự tự tin và sành điệu với gam màu hồng hiện đại, xu hướng màu mới dành cho những tín đồ thời trang. Đăc điểm: - Vải Denim kéo giản - Có túi đựng - Thoải mái cho bạn vận động - Co giãn với...', N'Quần Denim của Asos đem đến sự tự tin và sành điệu với gam màu hồng hiện đại, xu hướng màu mới dành cho những tín đồ thời trang.

Đăc điểm:

- Vải Denim kéo giản

- Có túi đựng 

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Nhiều loại màu cho bạn lựa chọn

- Xuất xứ: Nhập khẩu', N'quan3.jpg', 8, 5, 550000, 600000, 12, 10, 1, CAST(N'2017-06-08' AS Date), 1, N'quan2.jpg', 20)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (6, N'Quần Denim mỏng màu hường', N'Quần Denim của Asos đem đến sự tự tin và sành điệu với gam màu hồng hiện đại, xu hướng màu mới dành cho những tín đồ thời trang. Đăc điểm: - Chất vải mềm mại, dễ thấm mồ hôi - Có túi đựng - Thoải mái cho bạn vận động ...', N'Quần Denim của Asos đem đến sự tự tin và sành điệu với gam màu hồng hiện đại, xu hướng màu mới dành cho những tín đồ thời trang.

Đăc điểm:

- Chất vải mềm mại, dễ thấm mồ hôi

- Có túi đựng 

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 100% Cotton

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Màu hường

- Xuất xứ: Nhập khẩu', N'image1xxl-3.jpg', 0, 0, 650000, 700000, 13, 10, 8, CAST(N'2017-06-08' AS Date), 1, N'image3xxl-3.jpg', 15)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (7, N'Áo Denim Asos', N'Áo Denim Asos của Asos đem đến cá tính và tự tin. Đăc điểm: - Chất vải Denim - Có cúc áo - Có túi ngực - Đúng với kích thước - Có thể sử dụng máy giặt để giặt - 100% Cotton - Màu xanh - Xuất...', N'Áo Denim Asos của Asos đem đến cá tính và tự tin.

Đăc điểm:

- Chất vải Denim

- Có cúc áo

- Có túi ngực

- Đúng với kích thước

- Có thể sử dụng máy giặt để giặt

- 100% Cotton

- Màu xanh

- Xuất xứ: Nhập khẩu

', N'aonu24.jpg', 4, 5, 750000, 800000, 10, 13, 8, CAST(N'2017-06-07' AS Date), 1, N'aonu23.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (8, N'Áo voan cộc tay cao cổ', N'Áo voan cộc tay cao cổ Asos của Asos đem đến sự thoải mái và tự tin. Đăc điểm: - Chất vải voan mỏng nhẹ - Áo cao cổ - Đúng với kích thước - Có thể sử dụng máy giặt để giặt - 100% Polyester - Màu đen ...', N'Áo voan cộc tay cao cổ Asos của Asos đem đến sự thoải mái và tự tin.

Đăc điểm:

- Chất vải voan mỏng nhẹ

- Áo cao cổ

- Đúng với kích thước

- Có thể sử dụng máy giặt để giặt

- 100% Polyester

- Màu đen

- Xuất xứ: Nhập khẩu', N'aonu21.jpg', 1, 1, 900000, 1000000, 5, 13, 9, CAST(N'2017-06-07' AS Date), 1, N'aonu20.jpg', 20)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (9, N'Áo xếp li Collar & Ruffle', N'Áo xếp li Collar & Ruffle của Asos đem đến sự thoải mái và tự tin với màu hồng nữ tính. Đăc điểm: - Vải voan mỏng nhẹ - Viền cổ áo với cà vạt - Dài đến túi quần - Đúng với kích thước - Có thể sử dụng máy...', N'Áo xếp li Collar & Ruffle của Asos đem đến sự thoải mái và tự tin với màu hồng nữ tính.

Đăc điểm:

- Vải voan mỏng nhẹ

- Viền cổ áo với cà vạt

- Dài đến túi quần

- Đúng với kích thước

- Có thể sử dụng máy giặt để giặt

- 100% Polyester

- Màu hồng

- Xuất xứ: Nhập khẩu

', N'aonu15.jpg', 0, 1, 700000, 720000, 8, 13, 8, CAST(N'2017-06-07' AS Date), 1, N'aonu14.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (10, N'Áo voan cộc tay Asos', N'Áo hoa trà Asos của Asos đem đến sự thoải mái và tự tin. Đăc điểm: - Chất vải mỏng nhẹ - Áo dài tới túi quần - Đúng với kích thước - Có thể sử dụng máy giặt để giặt - 100% Polyester - Màu vàng - Xuất...', N'Áo hoa trà Asos của Asos đem đến sự thoải mái và tự tin.

Đăc điểm:

- Chất vải mỏng nhẹ

- Áo dài tới túi quần

- Đúng với kích thước

- Có thể sử dụng máy giặt để giặt

- 100% Polyester

- Màu vàng

- Xuất xứ: Nhập khẩu

', N'aonu11.jpg', 8, 2, 600000, 630000, 5, 13, 6, CAST(N'2017-06-07' AS Date), 1, N'aonu10.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (11, N'Áo hoa trà Asos', N'Áo hoa trà Asos của Asos đem đến sự thoải mái và tự tin. Đăc điểm: - Chất vải mỏng nhẹ - Họa tiết hoa trà in - Cổ khoét chữ V - Đúng với kích thước - Có thể sử dụng máy giặt để giặt - 100% Viscose ...', N'Áo hoa trà Asos của Asos đem đến sự thoải mái và tự tin.

Đăc điểm:

- Chất vải mỏng nhẹ

- Họa tiết hoa trà in

- Cổ khoét chữ V

- Đúng với kích thước

- Có thể sử dụng máy giặt để giặt

- 100% Viscose

- 2 màu lựa chọn

- Xuất xứ: Nhập khẩu', N'aonu4.jpg', 0, 3, 500000, 560000, 13, 13, 6, CAST(N'2017-06-07' AS Date), 1, N'aonu3.jpg', 10)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (12, N'Quần jean bóng', N'Quần jean bóng đem đến sự nổi bật và tự tin. Đăc điểm: - Chất vải jean bóng - Có túi - Sử dụng khuy - Đúng với kích thước - Có thể sử dụng máy giặt để giặt - 80% Cotton, 17% Nylon, 3% elastane - Màu...', N'Quần jean bóng đem đến sự nổi bật và tự tin.

Đăc điểm:

- Chất vải jean bóng

-  Có túi

- Sử dụng khuy

- Đúng với kích thước

- Có thể sử dụng máy giặt để giặt

- 80% Cotton, 17% Nylon, 3% elastane

- Màu xám

- Xuất xứ: Nhập khẩu

', N'quannu19.jpg', 0, 0, 800000, 900000, 12, 14, 3, CAST(N'2017-06-07' AS Date), 1, N'quannu18.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (13, N'Quần cạp cao Rivington', N'Quần cạp cao Rivington đem đến sự quyến rũ và tự tin. Quần dành cho những bạn nữ tự tin vào vóc dáng của mình Đăc điểm: - Chất vải nhẹ mịn - Hai túi để đảo ngược - Sử dụng khuy - Đúng với kích thước - Có thể...', N'Quần cạp cao Rivington đem đến sự quyến rũ và tự tin. Quần dành cho những bạn nữ tự tin vào vóc dáng của mình

Đăc điểm:

- Chất vải nhẹ mịn

-  Hai túi để đảo ngược

- Sử dụng khuy

- Đúng với kích thước

- Có thể sử dụng máy giặt để giặt

- 66% Cotton, 30% Polyester, 4% elastane

- Màu trắng

- Xuất xứ: Nhập khẩu

', N'quannu12.jpg', 0, 0, 700000, 780000, 8, 14, 6, CAST(N'2017-06-07' AS Date), 1, N'quannu11.jpg', 25)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (14, N'Áo thun Nike cổ tròn', N'Áo thun Nike xanh đem đến sự thoải mái và mát mẻ với gam màu lạnh và dễ dàng kết hợp với các phụ kiện khác nhau. - Áo vải mềm mại, thấm mồ hôi - Cổ tròn - Tay áo Raglan - Logo Nike in - Áo co giãn phù hợp với...', N'Áo thun Nike xanh đem đến sự thoải mái và mát mẻ với gam màu lạnh và dễ dàng kết hợp với các phụ kiện khác nhau.

- Áo vải mềm mại, thấm mồ hôi

- Cổ tròn 

- Tay áo Raglan

- Logo Nike in

- Áo co giãn phù hợp với cơ thể

- Có thể sử dụng máy giặt để giặt áo

- Phù hợp với người có chiều cao bình thường đén 188cm

- Màu xanh bắt mắt

- Xuất xứ: Nhập khẩu

', N'image4xxl-1.jpg', 0, 0, 600000, 650000, 10, 11, 2, CAST(N'2017-06-14' AS Date), 1, N'image3xxl-1.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (15, N'Áo sơ mi nam dài tay VŨ TUẤN sọc 2 màu 2802 SID62524', N'Áo sơ mi nam dài tay VŨ TUẤN sọc 2 màu 2802: Chất liệu cotton thấm hút độ ẩm cao, mát mẻ cho chàng tự tin di chuyển hay hoạt động, thích hợp trong mọi thời tiết. Thiết kế đơn giản cho phái mạnh thoải mái diện khi đi làm, đi chơi hay đi dự tiệc', N'Áo sơ mi nam dài tay VŨ TUẤN sọc 2 màu 2802 được thiết kế đơn giản cho phái mạnh thoải mái diện khi đi làm, đi chơi hay đi dự tiệc
Thiết kế cổ bẻ, tay dài cùng form dáng vừa vặn cho bạn thêm thanh lịch, chỉn chu khi kết hợp với các món đồ khác
Họa tiết sọc dọc đều đặn, tinh tế tạo sự nổi bật cho người mặc khi diện sản phẩm, thêm thu hút, phong cách
Chất liệu cotton thấm hút độ ẩm cao, mát mẻ cho chàng tự tin di chuyển hay hoạt động, thích hợp trong mọi thời tiết
Có thể dễ dàng kết hợp với quần tây, kaki hay bụi bặm và phá cách hơn với quần jean hay short trẻ trung... rất phù hợp', N'ao_so_mi_nam_dai_tay_vu_tuan_soc_2_mau_2802_f3ca.jpg', 5, 0, 300000, 350000, 7, 11, 1, CAST(N'2017-06-12' AS Date), 1, N'ao_so_mi_nam_dai_tay_vu_tuan_soc_2_mau_2802_e95a.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (16, N'Áo thun nam cổ tròn Benplay đơn giản SID61205', N'Áo thun nam cổ tròn Benplay đơn giản: Chất liệu thun mềm mại, co giãn, thấm hút mồ hôi tốt. Thiết kế kiểu dáng đơn giản, thời trang, phối logo Benplay bên ngực trái mang tới sự nam tính, mạnh mẽ cho bạn', N'Áo thun nam cổ tròn Benplay đơn giản thiết kế với kiểu dáng đơn giản, thời trang mang lại cho bạn trai sự nam tính, trẻ trung.
Phối logo Benplay bên ngực trái thể hiện đẳng cấp và nam tính của người mặc sản phẩm.
Màu xanh đen nam tính và đơn giản dễ dàng kết hợp với nhiều loại trang phục khác
Chất liệu thun mềm mại, co giãn, thấm hút mồ hôi tốt cho bạn luôn thoải mái khi mặc.
Có thể phối cùng nhiều trang phục khác nhau như quần jean, quần short, giày thể thao, sandal..', N'ao_thun_nam_co_tron_benplay_don_gian_6357.jpg', 0, 0, 180000, 200000, 8, 11, 2, CAST(N'2017-06-12' AS Date), 1, N'ao_thun_nam_co_tron_benplay_don_gian_39da.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (17, N'Áo sơ mi nam ngắn tay họa tiết lá TIX SID63602', N'Áo sơ mi nam ngắn tay họa tiết lá TIX: Chất liệu cotton thấm hút mồ hôi tốt, thông thoáng giúp người mặc tự tin trong các hoạt động. Thiết kế cổ bẻ, tay ngắn cùng họa tiết bắt mắt mang đến vẻ ngoài năng động, nổi bật cho phái mạnh khi diện', N'Áo sơ mi nam ngắn tay họa tiết lá TIX với thiết kế tinh tế, mang đến vẻ ngoài năng động, nổi bật cho phái mạnh khi diện
Kiểu dáng cổ điển cổ bẻ, tay ngắn cá tính, thích hợp diện trong thời tiết mùa hè nóng bức này
Nhấn nhá họa tiết lá đầy mới lạ và nổi bật  tạo cảm giác tươi mát và đầy thời trang cho các anh chàng khi diện
Đường chỉ may tỉ mỉ cùng nút áo phía trước chắc chắn cho phái nam thoải mái diện, tự tin thể hiện phong cách
Màu xanh đầy mới lạ, tươi mát dễ dàng kết hợp với nhiều loại trang phục khác nhau
Chất liệu cotton thấm hút mồ hôi tốt, mang đến cảm giác mát mẻ, thông thoáng giúp người mặc tự tin hoạt động
Sản phẩm có thể mix cùng quần jean, quần tây hay quần short nhằm tạo phong cách riêng, ấn tượng', N'ao_so_mi_nam_ngan_tay_hoa_tiet_la_tix_6d05.jpg', 0, 0, 330000, 360000, 9, 11, 3, CAST(N'2017-04-05' AS Date), 1, N'ao_so_mi_nam_ngan_tay_hoa_tiet_la_tix_c408.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (18, N'Áo sơ mi nam tay ngắn phối sọc thời trang SID63700', N'Áo sơ mi nam tay ngắn phối sọc thời trang: Chất liệu cotton thông thoáng, khả năng hút ẩm cao cho chàng luôn cảm thấy thoải mái và dễ chịu khi mặc, bất kể màu nào trong năm. Thiết kế tay ngắn năng động mang đến vẻ ngoài phong cách, cá tính cho phái mạnh', N'Áo sơ mi nam tay ngắn phối sọc thời trang với thiết kế tay ngắn năng động mang đến vẻ ngoài phong cách, cá tính cho phái mạnh
Áo thiết kế phối sọc cùng màu tinh tế, tạo ấn tượng nổi bật cho sản phẩm, mang đến vẻ ngoài chỉn chu, cho chàng thêm phong cách
Có nhiều màu sắc cho bạn nam thoải mái lựa chọn, tự tin thể hiện gu thời trang riêng, dễ dàng mix cùng các item khác nhau
Áo có nút gài phía trước chắc chắn cùng đường chỉ may tỉ mỉ cho phái nam dễ dàng mặc vào hay thay ra tiện dụng
Chất liệu cotton thông thoáng, khả năng hút ẩm cao cho chàng luôn cảm thấy thoải mái và dễ chịu khi mặc, bất kể màu nào trong năm
Có thể dễ dàng kết hợp với quần tây, kaki hay bụi bặm và phá cách hơn với quần jean hay short trẻ trung', N'ao_so_mi_nam_tay_ngan_phoi_soc_thoi_trang_683e.jpg', 0, 0, 150000, 180000, 12, 11, 4, CAST(N'2017-05-04' AS Date), 1, N'ao_so_mi_nam_tay_ngan_phoi_soc_thoi_trang_0782.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (19, N'Áo thun nam cổ tròn ECO JEAN NUNADYE SID63729', N'Áo thun nam cổ tròn ECO JEAN NUNADYE: Chất liệu vải cotton thấm hút mồ hôi cực nhanh, đem lại sự thoáng mát, cho nam giới thêm tự tin, thỏa sức vận động. Thiết kế cổ tròn, tay ngắn, thể hiện sự mạnh mẽ đẳng cấp của phái mạnh', N'Áo thun nam cổ tròn ECO JEAN NUNADYE với thiết kế cổ tròn, tay ngắn, thể hiện sự mạnh mẽ đẳng cấp của phái mạnh
Họa tiết mới lạ độc đáo thể hiện sự năng động, mạnh mẽ, một phong cách thời trang trẻ trung và hiện đại
Màu xanh dương và xanh ngọc trẻ trung, đơn giản dễ dàng kết hợp với nhiều trang phục khác nhau, thay đổi phong cách
Chất liệu vải cotton thấm hút mồ hôi cực nhanh, đem lại sự thoáng mát, cho nam giới thêm tự tin, thỏa sức vận động
Kết hợp cùng các item như giày thể thao, túi đeo chéo, quần jeans để tạo phong cách trẻ trung, năng động, hay quần kaki để trông thật lịch lãm', N'ao_thun_nam_co_tron_eco_jean_nunadye_396d.jpg', 9, 1, 200000, 220000, 6, 11, 4, CAST(N'2017-05-06' AS Date), 1, N'ao_thun_nam_co_tron_eco_jean_nunadye_2e07.jpg', 15)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (20, N'Áo sơ mi sọc ngang', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang. Đăc điểm: - Vải Denim kéo giản - Có dây kéo thắt lưng - Có túi chức năng - Thoải mái cho...', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang.

Đăc điểm:

- Vải Denim kéo giản

- Có dây kéo thắt lưng

- Có túi chức năng

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 100% Cotton

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Màu xanh nhạt

- Xuất xứ: Nhập khẩu', N'treem10.jpg', 0, 2, 180000, 200000, 7, 16, 3, CAST(N'2017-05-07' AS Date), 1, N'treem11.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (21, N'Áo T-shirt ngắn tay trẻ em Asos', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang. Đăc điểm: - Vải Denim kéo giản - Có dây kéo thắt lưng - Có túi chức năng - Thoải mái cho...', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang.

Đăc điểm:

- Vải Denim kéo giản

- Có dây kéo thắt lưng

- Có túi chức năng

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 100% Cotton

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Màu xanh nhạt

- Xuất xứ: Nhập khẩu', N'treem8.jpg', 0, 7, 150000, 180000, 16, 16, 6, CAST(N'2017-04-08' AS Date), 1, N'treem9.jpg', 10)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (22, N'Áo T-shirt viền caro', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang. Đăc điểm: - Vải Denim kéo giản - Có dây kéo thắt lưng - Có túi chức năng - Thoải mái cho...', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang.

Đăc điểm:

- Vải Denim kéo giản

- Có dây kéo thắt lưng

- Có túi chức năng

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 100% Cotton

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Màu xanh nhạt

- Xuất xứ: Nhập khẩu', N'treem6.jpg', 0, 0, 380000, 400000, 4, 16, 3, CAST(N'2017-05-23' AS Date), 1, N'treem7.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (24, N'Áo ba lỗ sọc ngang', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang. Đăc điểm: - Vải Denim kéo giản - Có dây kéo thắt lưng - Có túi chức năng - Thoải mái cho...', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang.

Đăc điểm:

- Vải Denim kéo giản

- Có dây kéo thắt lưng

- Có túi chức năng

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 100% Cotton

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Màu xanh nhạt

- Xuất xứ: Nhập khẩu

', N'treem4.jpg', 0, 0, 220000, 250000, 12, 16, 5, CAST(N'2017-05-12' AS Date), 1, N'treem5.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (25, N'Áo T-shirt in hoa lá', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang. Đăc điểm: - Vải Denim kéo giản - Có dây kéo thắt lưng - Có túi chức năng - Thoải mái cho...', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang.

Đăc điểm:

- Vải Denim kéo giản

- Có dây kéo thắt lưng

- Có túi chức năng

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 100% Cotton

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Màu xanh nhạt

- Xuất xứ: Nhập khẩu

', N'treem1.jpg', 0, 1, 300000, 350000, 4, 16, 5, CAST(N'2017-05-12' AS Date), 1, N'treem2.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (26, N'Áo sơ mi trẻ em', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang. Đăc điểm: - Vải Denim kéo giản - Có dây kéo thắt lưng - Có túi chức năng - Thoải mái cho...', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang.

Đăc điểm:

- Vải Denim kéo giản

- Có dây kéo thắt lưng

- Có túi chức năng

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 100% Cotton

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Màu xanh nhạt

- Xuất xứ: Nhập khẩu

', N'2015-children-s-clothing-child-shirt-boys-shirt-white-long-sleeve-shirt.jpg', 0, 0, 280000, 300000, 5, 16, 6, CAST(N'2017-06-03' AS Date), 1, N'2015-children-s-clothing-child-shirt-boys-shirt-white-long-sleeve-shirt-1.jpg', 10)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (27, N'Giày cao gót mũi nhọn', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang. Đăc điểm: - Vải Denim kéo giản - Có dây kéo thắt lưng - Có túi chức năng - Thoải mái cho...', N'Quần short bò xanh của Asos đem đến sự tự tin và sành điệu với gam màu xanh năng động, xu hướng màu dành cho những tín đồ thời trang.

Đăc điểm:

- Vải Denim kéo giản

- Có dây kéo thắt lưng

- Có túi chức năng

- Thoải mái cho bạn vận động

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 100% Cotton

- Phù hợp với thân hình có kích thước nhỏ hơn 185cm

- Màu xanh nhạt

- Xuất xứ: Nhập khẩu

', N'caogot16.jpg', 0, 0, 500000, 500000, 6, 22, 5, CAST(N'2017-06-04' AS Date), 1, N'caogot18.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (28, N'Giày cao gót đính đá mủi hở', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'caogot15.jpg', 0, 1, 400000, 450000, 7, 22, 2, CAST(N'2017-05-04' AS Date), 1, N'caogot13.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (29, N'Giày cao gót đính đá', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'caogot12.jpg', 0, 0, 45000, 500000, 8, 22, 5, CAST(N'2017-06-08' AS Date), 1, N'caogot10.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (30, N'Giày cao gót in họa tiết', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'caogot7.jpg', 0, 0, 550000, 600000, 6, 22, 2, CAST(N'2017-06-08' AS Date), 1, N'caogot9.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (31, N'Giày cao gót dây buộc Asos', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'caogot4.jpg', 0, 1, 300000, 400000, 6, 22, 6, CAST(N'2017-06-08' AS Date), 1, N'caogot6.jpg', 25)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (32, N'Giày cao gót có ren', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'caogot1.jpg', 0, 0, 350000, 380000, 9, 22, 4, CAST(N'2017-06-08' AS Date), 1, N'caogot3.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (33, N'Giày da lộn CS Fashion', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'giaynam16.jpg', 0, 0, 600000, 650000, 7, 18, 4, CAST(N'2017-06-08' AS Date), 1, N'giaynam18.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (34, N' Giáy da lộn Zilandi Giáy da lộn Zilandi
Giáy da lộn Zilandi', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'giaynam15.jpg', 0, 0, 500000, 600000, 7, 18, 7, CAST(N'2017-06-08' AS Date), 1, N'giaynam14.jpg', 20)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (35, N'Giày tây dây cột Glado', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'giaynam12.jpg', 0, 0, 400000, 500000, 8, 18, 9, CAST(N'2017-06-08' AS Date), 1, N'giaynam11.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (36, N'Giáy da mềm Asos', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'giaynam8.jpg', 0, 0, 600000, 650000, 6, 18, 3, CAST(N'2016-05-12' AS Date), 1, N'giaynam9.jpg', 10)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (37, N'Giày nhung đỏ Asos', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'giaynam4.jpg', 0, 0, 400000, 450000, 8, 18, 5, CAST(N'2016-05-12' AS Date), 1, N'giaynam5.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (38, N'Giày da nâu Asos', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'giaynam2.jpg', 0, 0, 450000, 500000, 6, 18, 1, CAST(N'2016-05-12' AS Date), 1, N'giaynam2.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (39, N'Túi xách vải đen thời trang', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'tuixach18.jpg', 0, 1, 300000, 350000, 8, 44, 4, CAST(N'2016-05-12' AS Date), 1, N'tuixach17.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (40, N'
Nhẫn 7 sắc cầu vồng Nhẫn 7 sắc cầu vồng
Nhẫn 7 sắc cầu vồng', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'phukien18.jpg', 0, 1, 1000000, 1200000, 8, 25, 2, CAST(N'2016-05-12' AS Date), 1, N'phukien17.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (41, N'Nhẫn đầu lâu', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'phukien15.jpg', 0, 0, 2000000, 2000000, 3, 25, 5, CAST(N'2016-05-12' AS Date), 1, N'phukien14.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (42, N'Dây chuyền đầu trâu', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'phukien12.jpg', 0, 0, 750000, 800000, 7, 25, 1, CAST(N'2016-05-12' AS Date), 1, N'phukien11.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (43, N'Dây chuyền mặt mỏ neo Asos', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'phukien9.jpg', 0, 0, 650000, 700000, 6, 25, 5, CAST(N'2016-05-12' AS Date), 1, N'phukien8.jpg', 10)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (44, N'Vòng chân Asos', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'phukien6.jpg', 0, 1, 500000, 550000, 4, 25, 2, CAST(N'2016-05-12' AS Date), 1, N'phukien5.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (45, N'Vòng tay Asos', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'phukien3.jpg', 0, 0, 350000, 400000, 5, 25, 2, CAST(N'2017-06-14' AS Date), 1, N'phukien2.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (46, N'Túi vải xách tay thời trang', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'tuixach15.jpg', 0, 0, 500000, 550000, 7, 44, 1, CAST(N'2017-06-14' AS Date), 1, N'tuixach14.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (47, N'Túi xách du lịch da cao cấp', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'tuixach12.jpg', 0, 0, 500000, 550000, 7, 44, 4, CAST(N'2017-06-14' AS Date), 1, N'tuixach11.jpg', 15)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (48, N'Áo T-shirt nam với hoa hồng in', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách Đăc điểm: - Áo mỏng nhẹ - Khuy tới tẩn cổ áo - Có túi ngực - Co giãn với kích thước cơ...', N'Áo T-shirt nam với hoa hồng in của Asos đem đến sự tự tin và mới lạ dành cho những tín đồ thời trang muốn thay đổi phong cách

Đăc điểm:

- Áo mỏng nhẹ

- Khuy tới tẩn cổ áo

- Có túi ngực

- Co giãn với kích thước cơ thể

- Có thể sử dụng máy giặt để giặt

- 98% Cotton, 2% Elastane

- Phù hợp với thân hình có kích thước nhỏ hơn 178cm

- Màu trắng

- Xuất xứ: Nhập khẩu', N'image4xxl-5.jpg', 0, 0, 550000, 600000, 5, 11, 6, CAST(N'2017-06-14' AS Date), 1, N'image3xxl-5.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (49, N'Áo khoác đen in logo Nike', N'Áo khoác đen in logo Nike đem đến sự năng động và sành điệu với gam màu đen huyền bí sẽ giúp bạn tự tin khi ra đường vào mỗi ngày Đăc điểm: - Chất liệu vải mềm mại - Có dây kéo - Có mũ trùm đầu - Logo in...', N'Áo khoác đen in logo Nike  đem đến sự năng động và sành điệu với gam màu đen huyền bí sẽ giúp bạn tự tin khi ra đường vào mỗi ngày

Đăc điểm:

- Chất liệu vải mềm mại

- Có dây kéo

- Có mũ trùm đầu

- Logo in

- Có túi đựng

- Có thể sử dụng máy giặt để giặt

- 78% Cotton, 22% Polyester

- Phù hợp với thân hình có kích thước nhỏ hơn 188cm

- Màu đen

- Xuất xứ: Nhập khẩu', N'aokhoac16.jpg', 0, 0, 250000, 300000, 6, 12, 5, NULL, 1, N'aokhoac14.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (50, N'Áo dài', N'<p>frrr</p>
', N'<p>ffff</p>
', N'fb1-f315ced7-980c-4c78-8a58-48d5ef4c7bd8.jpg', 0, 0, 450000, 500000, 5, 9, 8, CAST(N'2017-06-23' AS Date), 1, N'', 20)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (51, N'gnhgfdfgr', N'<p>vvvfdf</p>
', N'<p>fdfesdew</p>
', N'hoadongtien1.jpg', 0, 0, 400000, 450000, 45, 14, 3, CAST(N'2017-06-23' AS Date), 1, N'hoaly.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (52, N'ssff', N'<p>vvđ</p>
', N'<p>ffddđ</p>
', N'hoatinhyeu2.jpg', 0, 0, 64, 89, 45, 15, 1, CAST(N'2017-06-24' AS Date), 1, N'hoadongtien6.jpg', 0)
GO
INSERT [dbo].[Product] ([ProductId], [ProductName], [ProductContent], [ProductContentDetail], [Images], [View], [BuyItem], [PriceInput], [PriceOutput], [Quantity], [CatalogId], [ProviderId], [Created], [Status], [ImageHover], [Discount]) VALUES (53, N'LÃ m Äáº¹p', N'<p>Ä&acirc;y l&agrave; sáº£n pháº©m l&agrave;m Äáº¹p tá»± nhi&ecirc;n</p>
', N'<p>Ä&acirc;y l&agrave; sáº£n pháº©m l&agrave;m Äáº¹p tá»± nhi&ecirc;n</p>
', N'vinu2.jpg', 0, 0, 320000, 350000, 0, 9, 1, CAST(N'2017-08-09' AS Date), 1, N'vinu3.jpg', 0)
GO
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColor] ON 

GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorId], [Status]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorId], [Status]) VALUES (2, 1, 2, 1)
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorId], [Status]) VALUES (3, 1, 3, 1)
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorId], [Status]) VALUES (4, 2, 2, 1)
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorId], [Status]) VALUES (5, 2, 3, 1)
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorId], [Status]) VALUES (6, 2, 5, 1)
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorId], [Status]) VALUES (7, 3, 7, 1)
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorId], [Status]) VALUES (8, 1, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSize] ON 

GO
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductId], [SizeId], [Status]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductId], [SizeId], [Status]) VALUES (2, 1, 2, 1)
GO
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductId], [SizeId], [Status]) VALUES (3, 1, 3, 1)
GO
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductId], [SizeId], [Status]) VALUES (4, 2, 4, 1)
GO
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductId], [SizeId], [Status]) VALUES (5, 2, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[ProductSize] OFF
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

GO
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [Address], [Email], [Phone], [Status]) VALUES (1, N'Adiddas', N'Hà Nội', N'adiddas@gmail.com', N'0423456786', 1)
GO
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [Address], [Email], [Phone], [Status]) VALUES (2, N'Lego', N'Hà Nội', N'lego@gmail.com', N'0487656987', 1)
GO
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [Address], [Email], [Phone], [Status]) VALUES (3, N'Nike', N'Hà Nội', N'nike@gmail.com', N'0487645632', 1)
GO
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [Address], [Email], [Phone], [Status]) VALUES (4, N'Tommy', N'Hồ Chí Minh', N'tommy@gmail.com', N'0867854321', 1)
GO
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [Address], [Email], [Phone], [Status]) VALUES (5, N'CS Fashion', N'Hồ Chí Minh', N'fashion@gmail.com', N'0845678398', 1)
GO
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [Address], [Email], [Phone], [Status]) VALUES (6, N'Religion', N'Hồ Chí Minh', N'religion@gmail.com', N'0856743965', 1)
GO
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [Address], [Email], [Phone], [Status]) VALUES (7, N'Nestle', N'Hà Nội', N'nestle@gmail.com', N'0435673198', 1)
GO
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [Address], [Email], [Phone], [Status]) VALUES (8, N'Asos', N'Hồ Chí Minh', N'asos@gmail.com', N'0856789345', 1)
GO
INSERT [dbo].[Provider] ([ProviderId], [ProviderName], [Address], [Email], [Phone], [Status]) VALUES (9, N'Nem', N'Hà Nội', N'nem@gmail.com', N'0498754612', 1)
GO
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Size] ON 

GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (1, N'S', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (2, N'M', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (3, N'L', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (4, N'XL', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (5, N'XXL', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (6, N'26', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (7, N'27', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (8, N'28', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (9, N'29', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (10, N'30', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (11, N'31', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (12, N'32', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (13, N'33', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (14, N'34', NULL, 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (15, N'1', N'Dưới 5 Kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (16, N'2', N'Dưới 6 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (17, N'3', N'8-10 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (18, N'4', N'11-13 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (19, N'5', N'14-16 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (20, N'6', N'17-19 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (21, N'7', N'20-22 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (22, N'8', N'22-25 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (23, N'9', N'25-27 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (24, N'10', N'27-30 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (25, N'11', N'30-33 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (26, N'12', N'34-37 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (27, N'13', N'37 -40 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (28, N'14', N'40-43 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (29, N'15', N'43-46 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (30, N'16', N'46-50 kg', 1)
GO
INSERT [dbo].[Size] ([SizeId], [SizeName], [Descriptions], [Status]) VALUES (31, N'bbb', N'hhh', 0)
GO
SET IDENTITY_INSERT [dbo].[Size] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (1, N'Tuyen', N'Tuyen', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', N'0987654234', 1, 1, CAST(N'2017-04-06' AS Date))
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (2, N'Trang', N'123', N'h@gmail.com', NULL, NULL, 2, 1, CAST(N'2017-05-05' AS Date))
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (3, N'Linh', N'12', N'linh@gmail.com', N'', N'', 2, 1, CAST(N'2017-06-06' AS Date))
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (4, N'Hue', N'123', N'hue@gmail.com', N'', N'', 2, 1, CAST(N'2017-06-08' AS Date))
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (5, N'', N'', N'', N'', N'', 2, 1, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (6, N'tes', N'123', N'n@gmail.com', N'dđ', N'2345', 2, 1, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (7, NULL, NULL, NULL, NULL, NULL, 2, 1, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (10, N'ghhj', N'123', N'nguyenthituyenlcs1995@gmail.com', N'hrhe', N'123', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (11, N'fdaweq', N'123', N'nguyenthituyenlcs1995@gmail.com', N'rtbff', N'2345', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (12, N'ggd', N'123', N'nguyenthituyenlcs1995@gmail.com', N'gg gg', N'987654', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (13, N'Minh Le', N'123', N'minh@gmail.com', N'Ha Noi', N'12345677', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (14, N'Ha Trang', N'123', N'trang@gmail.com', N'Phu Tho', N'4567885', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (15, N'Ha Linh', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Hà Nội', N'12345678', 2, 1, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (16, N'Phuc Le', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Ha Noi', N'1234567', 2, 1, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (17, N'Tuan', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Ha Nam', N'123456', 2, 1, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (18, N'Chien Thang', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Hà Nội', N'0987564345', 2, 1, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (19, N'Trong veo', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Phú Thọ', N'0987564321', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (20, N'hhhhhhhhh', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Ha Noi', N'0978564321', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (21, N'ghg', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Hải Phòng', N'12345678', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (22, N'ccccc', N'1223', N'nguyenthituyenlcs1995@gmail.com', N'Hải Dương', N'2345678912', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (23, N'Phuc Phuc', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Hà Nội', N'456533554', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (24, N'Ha Ha', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Hải Phòng', N'1234568', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (25, N'Mai Lan', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Hà Nội', N'09876543', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (26, N'Hoa Hoa', N'123', N'nguyenthituyenlcs1995@gmail.com', N'Ha Noi', N'123456789', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (27, N'An', N'12345678', N'nguyenan1605.mta@gmail.com', N'số 26, ngách 108 ngõ 351', N'0968109199', 2, 0, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (28, N'Phuc', N'phuc', N'nguyenthituyenlcs1995@gmail.com', N'Phu Tho', N'0978564321', 2, 1, NULL)
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (29, N'AnNguyen', N'123456', N'nguyenan16053.mta@gmail.com', N'Hưng yên', N'0976453123', 2, 1, CAST(N'2017-08-11' AS Date))
GO
INSERT [dbo].[Users] ([UserId], [UserName], [Password], [Email], [Address], [Phone], [GroupId], [Status], [Created]) VALUES (30, N'tester', N'1234', N'tester@gmail.com', N'Ha Noi', N'0123456789', 2, 1, CAST(N'2018-06-25' AS Date))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[GroupFunction]  WITH CHECK ADD FOREIGN KEY([FunctionId])
REFERENCES [dbo].[Functions] ([FunctionId])
GO
ALTER TABLE [dbo].[GroupFunction]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
GO
ALTER TABLE [dbo].[ImageLink]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[PackageHistory]  WITH CHECK ADD FOREIGN KEY([CardId])
REFERENCES [dbo].[Cards] ([CardId])
GO
ALTER TABLE [dbo].[PackageHistory]  WITH CHECK ADD FOREIGN KEY([PackageId])
REFERENCES [dbo].[Packages] ([PackageId])
GO
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([CatalogId])
REFERENCES [dbo].[Catalog] ([CatalogId])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Provider] ([ProviderId])
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD FOREIGN KEY([ColorId])
REFERENCES [dbo].[Color] ([ColorId])
GO
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([GroupId])
REFERENCES [dbo].[Groups] ([GroupId])
GO
/****** Object:  StoredProcedure [dbo].[activeAccount]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[activeAccount]
@id int
as
begin
update Users set [Status] = 'True' where UserId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[addMoneyPackage]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[addMoneyPackage]
 @money int,
 @id int
 as
 begin
 Update Packages set Amount = Amount + @money
                  where PackageId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[checkCardNumber]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkCardNumber]
@cardNumber varchar(25),
@re bit output
as
begin
if exists(select @cardNumber from Cards where CardNumber = @cardNumber)
	set @re = 'True'
else
	set @re = 'False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkCardSeri]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkCardSeri]
@cardSeri varchar(25),
@re bit output
as
begin
if exists(select @cardSeri from Cards where CardSeri = @cardSeri)
	set @re = 'True'
else
	set @re = 'False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkColorName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkColorName]
@name nvarchar(100),
@re bit output
as
begin
   if EXISTS(SELECT @name FROM Color where ColorName = @name)
      set @re = 'True'
   else 
      set @re = 'False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkExistsCardNumber]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkExistsCardNumber]
@id int,
@number nvarchar(100),
@re bit output
as
begin
if EXISTS(SELECT @number FROM Cards where CardNumber = @number and CardId <> @id)
    set @re = 'True'
else
   set @re ='False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkExistsCardSeri]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkExistsCardSeri]
@id int,
@seri nvarchar(100),
@re bit output
as
begin
if EXISTS(SELECT @seri FROM Cards where CardSeri = @seri and CardId <> @id)
    set @re = 'True'
else
   set @re ='False'
end

GO
/****** Object:  StoredProcedure [dbo].[checkExistsColorName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkExistsColorName]
@id int,
@name nvarchar(100),
@re bit output
as
begin
if EXISTS(SELECT @name FROM Color where ColorName = @name and ColorId <> @id)
    set @re = 'True'
else
   set @re ='False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkExistsFunctionName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkExistsFunctionName]
@id int,
@name nvarchar(100),
@re bit output
as
begin
if EXISTS(SELECT @name FROM Functions where FunctionName = @name and FunctionId <> @id)
    set @re = 'True'
else
   set @re ='False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkExistsGroupName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkExistsGroupName]
@id int,
@name nvarchar(100),
@re bit output
as
begin
if EXISTS(SELECT @name FROM Groups where GroupName = @name and GroupId <> @id)
    set @re = 'True'
else
   set @re ='False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkExistsPackageName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkExistsPackageName]
@id int,
@name nvarchar(100),
@re bit output
as
begin
if EXISTS(SELECT @name FROM Packages where PackageName = @name and PackageId <> @id)
    set @re = 'True'
else
   set @re ='False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkExistsSizeName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkExistsSizeName]
@id int,
@name nvarchar(100),
@re bit output
as
begin
if EXISTS(SELECT @name FROM Size where SizeName = @name and SizeId <> @id)
    set @re = 'True'
else
   set @re ='False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkExistsUserEmail]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkExistsUserEmail]
@id int,
@mail nvarchar(100),
@re bit output
as
begin
if EXISTS(SELECT @mail FROM Users where Email = @mail and UserId <> @id)
    set @re = 'True'
else
   set @re ='False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkExistsUserName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkExistsUserName]
@id int,
@name nvarchar(100),
@re bit output
as
begin
if EXISTS(SELECT @name FROM Users where UserName = @name and UserId <> @id)
    set @re = 'True'
else
   set @re ='False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkFunctionName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkFunctionName]
@name nvarchar(100),
@re bit output
as
begin
   if EXISTS(SELECT @name FROM Functions where FunctionName = @name)
      set @re = 'True'
   else 
      set @re = 'False'
end

GO
/****** Object:  StoredProcedure [dbo].[checkGroupName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkGroupName]
@name nvarchar(100),
@re bit output
as
begin
   if EXISTS(SELECT @name FROM Groups where GroupName = @name)
      set @re = 'True'
   else 
      set @re = 'False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkLogin]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[checkLogin]
@name nvarchar(100),
@password nvarchar(100)
as
begin
select * from Users where UserName = @name and [Password] = @password and [Status] = 'True'
end
GO
/****** Object:  StoredProcedure [dbo].[checkPackage]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[checkPackage]
@package nvarchar(100),
@total float,
@out bit output
as
begin
Declare @tam float
Select @tam = Amount from Packages where PackageName = @package and [Status] = 'True'
if @tam > @total
   set @out ='True'
else
	set @out ='False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkPackageName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkPackageName]
@name nvarchar(100),
@re bit output
as
begin
   if EXISTS(SELECT @name FROM Packages where PackageName = @name)
      set @re = 'True'
   else 
      set @re = 'False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkUserEmail]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkUserEmail]
@mail nvarchar(100),
@re bit output
as
begin
if exists(select @mail from Users where Email = @mail)
	set @re = 'True'
else
	set @re = 'False'
end
GO
/****** Object:  StoredProcedure [dbo].[checkUserName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkUserName]
@name nvarchar(100),
@re bit output
as
begin
   if EXISTS(SELECT @name FROM Users where UserName = @name)
      set @re = 'True'
   else 
      set @re = 'False'
end
GO
/****** Object:  StoredProcedure [dbo].[confirmOrder]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[confirmOrder]
@id int
as
begin
Update Orders set   Status = 3
				where OrderId = @id
				end
GO
/****** Object:  StoredProcedure [dbo].[deleteBanner]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteBanner]
@id int
as
begin 
Update Banner set Status = 'False'
				  where BannerId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deleteCard]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteCard]
@id int
as
begin
update  Cards set Status = 'False'
				  where CardId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deleteCatalog]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteCatalog]
@id int
as
begin
update Catalog set [Status] = 'False'
			   where CatalogId = @id
end

GO
/****** Object:  StoredProcedure [dbo].[deleteColor]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteColor]
@id int
as
begin
Update Color set Status ='False' where ColorId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deleteFunction]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteFunction]
@id int
as
begin 
update Functions set Status = 'False' where FunctionId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deleteGroup]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteGroup]
@id int
as
begin
update Groups set  [Status] = 'False'
			  where GroupId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deletePackage]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deletePackage]
@id int
as
begin
Update Packages set Status = 'False' where PackageId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deletePaymentType]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deletePaymentType]
@id int
as
begin
update PaymentType set  Status = 'False'
					where PaymentTypeId = @id

end

GO
/****** Object:  StoredProcedure [dbo].[deletePost]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deletePost]
@id int
as
begin 
Update Post set Status = 'False'
            where PostId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deleteProduct]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteProduct]
@id int
as
begin
update Product set [Status] ='False' where ProductId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deleteProvider]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteProvider]
@id int
as
begin
update Provider set Status = 'False' where ProviderId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deleteSize]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteSize]
@id int
as
begin
update Size set 	[Status] = 'False'
			where SizeId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[deleteUser]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[deleteUser]
@id int
as
begin
Update Users set Status = 'False' where UserId = @id
end

GO
/****** Object:  StoredProcedure [dbo].[finishPackage]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[finishPackage]
@package nvarchar(100),
@total float
as
begin
update Packages set Amount = Amount - @total 
                 where PackageName = @package
end

GO
/****** Object:  StoredProcedure [dbo].[getAllBanner]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllBanner]
as
begin
Select * from Banner where Status = 'True'
end
GO
/****** Object:  StoredProcedure [dbo].[getAllCard]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getAllCard]
as
begin
select * from Cards where Status = 'True'
end
GO
/****** Object:  StoredProcedure [dbo].[getAllCatalog]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[getAllCatalog]
 as
 begin
 Select * from Catalog where Status = 'True'
 end
GO
/****** Object:  StoredProcedure [dbo].[getAllCatalogPost]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllCatalogPost]
as
begin
Select * from CatalogPost where Status = 'True'
end
GO
/****** Object:  StoredProcedure [dbo].[getAllColor]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllColor]
as
begin

	select * from Color where Status = 'True' order by ColorId
end
GO
/****** Object:  StoredProcedure [dbo].[getAllFeeback]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllFeeback]
as
begin
Select * from Feeback order by FeebackId desc
end
GO
/****** Object:  StoredProcedure [dbo].[getAllFunction]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllFunction]
as
begin
Select * from Functions where Status ='True'
end
GO
/****** Object:  StoredProcedure [dbo].[getAllGroup]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllGroup]
as
begin
Select * from Groups where [Status] ='True'
end
GO
/****** Object:  StoredProcedure [dbo].[getAllOrder]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getAllOrder]
as
begin
Select * from Orders order by OrderId desc
end
GO
/****** Object:  StoredProcedure [dbo].[getAllPackage]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllPackage]
as
begin
Select * from Packages where Status = 'True'
end

GO
/****** Object:  StoredProcedure [dbo].[getAllPaymentType]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllPaymentType]
as
begin
select * from PaymentType where Status = 'True'
end
GO
/****** Object:  StoredProcedure [dbo].[getAllPost]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllPost]
as
begin
Select * from Post where Status = 'True'
end
GO
/****** Object:  StoredProcedure [dbo].[getAllPostByCatalogPostId]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllPostByCatalogPostId]
@id int
as
begin
Select * from Post where CatalogPostId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getAllProduct]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllProduct]
as
begin

   select * from Product where Status = 'True'
end

GO
/****** Object:  StoredProcedure [dbo].[getAllProvider]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllProvider]
as
begin
	Select * from Provider where Status ='True'
end
GO
/****** Object:  StoredProcedure [dbo].[getAllSize]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllSize]
as
begin
Select * from Size where [Status] = 'True'
end
GO
/****** Object:  StoredProcedure [dbo].[getAllUser]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllUser]
as
begin
Select * from Users where Status = 'True'
end
GO
/****** Object:  StoredProcedure [dbo].[getBanner]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getBanner]
as
begin 
Select top 2 * from Banner where Status ='True' order by DisplayNumber asc
end
GO
/****** Object:  StoredProcedure [dbo].[getBannerById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getBannerById]
@id int
as
begin
Select * from Banner where BannerId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getCardByCardNumber]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getCardByCardNumber]
@cardNumber varchar(25)
as
begin
Select * from Cards where CardNumber = @cardNumber
end


GO
/****** Object:  StoredProcedure [dbo].[getCardById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getCardById]
@id int
as
begin
select * from Cards where CardId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getCatalogById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getCatalogById]
@id int
as
begin
Select * from Catalog where CatalogId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getCatalogChild]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getCatalogChild]
@id int
as
begin
select top 5 * from Catalog where ParentId = @id and [Status] = 'True' order by DisplayNumber asc
end
GO
/****** Object:  StoredProcedure [dbo].[getCatalogChildFirst]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getCatalogChildFirst]
@id int,
@child int output
as
begin
Select @child = CatalogId from Catalog where ParentId = @id and DisplayNumber = 1
end
GO
/****** Object:  StoredProcedure [dbo].[getCatalogRoot]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getCatalogRoot]
as
begin
Select top 9 * from Catalog where ParentId = 0 and [Status] = 'True' order by DisplayNumber asc
end

GO
/****** Object:  StoredProcedure [dbo].[getColorById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[getColorById]
@id int
as
begin
Select * from Color where ColorId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getFunctionById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getFunctionById]
@id int
as
begin
Select * from Functions where FunctionId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getGroupById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getGroupById]
@id int
as
begin
Select * from Groups where GroupId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getImageProduct]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getImageProduct]
@id int
as
begin
select * from Imagelink where ProductId = @id
end

GO
/****** Object:  StoredProcedure [dbo].[getMoney]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getMoney]
as
begin
select sum(TotalAmount) from Orders where MONTH(CreatedDate) = MONTH(getDate())
end
GO
/****** Object:  StoredProcedure [dbo].[getOrderByUserId]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getOrderByUserId]
@id int
as
begin
Select OrderId, OrderName, OrderNumber, TotalAmount,CreatedDate,PaymentDate,o.Status, o.PaymentMethod from Orders o
where  o.UserId = @id  order by orderId desc
end
GO
/****** Object:  StoredProcedure [dbo].[getOrderDetailById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getOrderDetailById]
@id int
as
begin
Select OrderDetailId,OrderId,ProductName, Note,Price, o.Quantity,o.ProductId,Amount, o.Status from OrderDetail o,Product p where o.ProductId = p.ProductId and o.OrderId = @id order by OrderId desc
end
GO
/****** Object:  StoredProcedure [dbo].[getOrderDetailByUserId]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getOrderDetailByUserId]
@id int
as
begin
Select  od.OrderId, OrderName, OrderNumber, TotalAmount, od.ProductId, ProductName,Note, od.Price,od.Quantity, od.Status, o.Phone , o.Address, o.Email,  u.UserName, u.Phone as 'PhoneBuy',u.Email as 'EmailBuy',u.Address as 'AddressBuy', o.PaymentMethod  from OrderDetail od, Product p, Orders o, Users u
where od.ProductId = p.ProductId and o.OrderId = od.OrderId and u.UserId = o.UserId
end
GO
/****** Object:  StoredProcedure [dbo].[getOrderIdNew]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getOrderIdNew]
@id int output
as
begin
Select top 1 @id = OrderId from Orders order by OrderId desc
end
GO
/****** Object:  StoredProcedure [dbo].[getOrderIdNewByUserId]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getOrderIdNewByUserId]
@id int,
@out int output
as
begin
Select @out = OrderId from Orders where UserId = @id order by OrderId asc
end
GO
/****** Object:  StoredProcedure [dbo].[getOrderNew]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getOrderNew]
as
begin
Select * from Orders where Status = '1'
end

GO
/****** Object:  StoredProcedure [dbo].[getPackageById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPackageById]
@id int
as
begin 
Select * from Packages where PackageId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getPackageByUserId]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPackageByUserId]
@id int
as
begin
Select * from Packages where UserId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getPaymentTypeById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPaymentTypeById]
@id int
as
begin
Select * from PaymentType
end
GO
/****** Object:  StoredProcedure [dbo].[getPostById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPostById]
@id int
as
begin
Select * from Post where PostId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getPostNew]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPostNew]
as
begin
Select top 3 * from Post where Status = 'True' order by Created desc
end

GO
/****** Object:  StoredProcedure [dbo].[getPostRef]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getPostRef]
@id int,
@idCata int
as
begin
Select * from Post where CatalogPostId = @idCata and PostId != @id
end
GO
/****** Object:  StoredProcedure [dbo].[getProductByCatalog]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getProductByCatalog]
@id int
as
begin
Select top 6  p.ProductId, p.ProductName, p.ProductContent, p.ProductContentDetail, p.BuyItem, p.[View],p.CatalogId, p.ImageHover, 
p.Images, p.PriceInput, p.PriceOutput, p.ProviderId, p.Quantity,p.Created, p.Status, p.Discount from Product p, Catalog c where p.CatalogId = c.CatalogId and c.ParentId = @id or p.CatalogId = c.CatalogId and p.CatalogId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getProductByCatalogId]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getProductByCatalogId]
@id int
as
begin
Select  p.ProductId, p.ProductName, p.ProductContent, p.ProductContentDetail, p.BuyItem, p.[View],p.CatalogId, p.ImageHover, 
p.Images, p.PriceInput, p.PriceOutput, p.ProviderId, p.Quantity,p.Created, p.Status,p.Discount from Product p, Catalog c where p.CatalogId = c.CatalogId and c.ParentId = @id or p.CatalogId = @id and p.CatalogId = c.CatalogId
end
GO
/****** Object:  StoredProcedure [dbo].[getProductByColorId]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductByColorId]
@id int
as
Begin
select * from Product, ProductColor where Product.ProductId = ProductColor.ProductId and ProductColor.ColorId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getProductById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductById]
@id int
as
begin
Select * from Product where ProductId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getProductByProviderId]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductByProviderId]
@id int
as
begin
Select * from Product where ProviderId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getProductColor]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getProductColor]
@id int
as
begin
Select p.ProductColorId, c.ColorId,c.ColorName, p.ProductId,p.Status, c.Natation from Color as c,ProductColor as p where 
c.ColorId = p.ColorId and p.ProductId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getProductHot]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductHot]
as
begin
Select top 6 * from Product order by [View] desc
end
GO
/****** Object:  StoredProcedure [dbo].[getProductIdNew]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductIdNew]
@id int output
as
begin
Select top 1 @id = ProductId from Product order by ProductId desc
end
GO
/****** Object:  StoredProcedure [dbo].[getProductNew]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductNew]
as
begin
select top 6 * from Product order by Created desc
end
GO
/****** Object:  StoredProcedure [dbo].[getProductReferen]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductReferen]
@id int,
@idCata int
as
begin
Select * from Product where CatalogId = @idCata and ProductId != @id
end
GO
/****** Object:  StoredProcedure [dbo].[getProductShare]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductShare]
as
begin
Select * from Product where Discount > 0 and Status ='True'
end
GO
/****** Object:  StoredProcedure [dbo].[getProductSize]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProductSize]
@id int
as
begin
Select p.ProductSizeId, s.SizeId,s.SizeName, p.ProductId,s.Status from Size as s,ProductSize as p where 
s.SizeId = p.SizeId and p.ProductId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getProviderById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getProviderById]
@id int
as
begin
Select * from Provider where ProviderId = @id
end

GO
/****** Object:  StoredProcedure [dbo].[getSizeById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getSizeById]
@id int
as
begin
Select * from Size where SizeId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getTotalMoney]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getTotalMoney]
@total float output
as
begin
select @total = Sum(TotalAmount) from Orders where MONTH(CreatedDate) = MONTH(getDate())
end
GO
/****** Object:  StoredProcedure [dbo].[getTotalOrder]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getTotalOrder]
@total int output
as
begin
Select @total = COUNT(OrderId) from Orders where MONTH(CreatedDate) = MONTH(getDate())
end

GO
/****** Object:  StoredProcedure [dbo].[getTotalUser]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[getTotalUser]
@total int output
as
begin
Select @total = COUNT(UserId) from Users 
end
GO
/****** Object:  StoredProcedure [dbo].[getUserByEmail]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getUserByEmail]
@email nvarchar(100)
as
begin
Select * from Users where Email = @email
end
GO
/****** Object:  StoredProcedure [dbo].[getUserById]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getUserById]
@id int
as
begin
Select * from Users where UserId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[getUserByName]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getUserByName]
@name nvarchar(100)
as
begin
Select * from Users where UserName = @name
end
GO
/****** Object:  StoredProcedure [dbo].[getUserIdNew]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getUserIdNew]
@id int output
as
begin
Select @id = UserId from Users order by UserId desc
end
GO
/****** Object:  StoredProcedure [dbo].[inserCard]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[inserCard]
@cardSeri varchar(25),
@cardNumber varchar(25),
@priceUnit int
as
begin
insert into Cards(CardSeri,CardNumber,PriceUnit,Status) 
values(@cardSeri,@cardNumber,@priceUnit,'True')
end
GO
/****** Object:  StoredProcedure [dbo].[insertAcount]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertAcount]
@name nvarchar(100),
@pass nvarchar(100),
@phone varchar(15),
@email nvarchar(100),
@address nvarchar(100)
as
begin
Insert into Users(UserName,[Password],Phone,Email,[Address],GroupId,[Status],Created)
values (@name,@pass,@phone,@email,@address,2,'True',getDate())
end
GO
/****** Object:  StoredProcedure [dbo].[insertBanner]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertBanner]
@image nvarchar(100),
@dis int
as
begin
Insert into Banner(Image,DisplayNumber,Status) values(@image,@dis,'True')
end
GO
/****** Object:  StoredProcedure [dbo].[insertCatalog]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertCatalog]
@name nvarchar(100),
@des nvarchar(100),
@pare int = 0,
@img nvarchar(100),
@dis int

as
begin
if @pare != 0
	insert into Catalog(CatalogName,Descriptions,ParentId,Images,DisplayNumber, [Status]) values(@name,@des,@pare,@img,@dis,'True')
else
   insert into Catalog(CatalogName,Descriptions,ParentId,Images,DisplayNumber,[Status]) values(@name,@des,0,@img,@dis,'True')
end

GO
/****** Object:  StoredProcedure [dbo].[insertColor]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertColor]
@name nvarchar(100),
@na nvarchar(100)
as
begin
insert into Color(ColorName,Natation,Status) values(@name,@na,'1')
end
GO
/****** Object:  StoredProcedure [dbo].[insertFeeback]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertFeeback]
@name nvarchar(100),
@email nvarchar(100),
@content ntext
as
begin
Insert into Feeback(Name,Email,Content,Status) 
values(@name,@email,@content,'False')
end
GO
/****** Object:  StoredProcedure [dbo].[insertFunction]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertFunction]
@name nvarchar(100)
as
begin
insert into Functions(FunctionName,Status) values (@name,'True')
end
GO
/****** Object:  StoredProcedure [dbo].[insertGroup]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- insert group 
create proc [dbo].[insertGroup]
@name nvarchar(100)
as
begin
Insert into Groups(GroupName, [Status]) values(@name,'True')
end
GO
/****** Object:  StoredProcedure [dbo].[insertImageLink]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertImageLink]
@idProduct int,
@imageName nvarchar(100)
as
begin
insert into ImageLink(ProductId,ImageLinkName) 
values(@idProduct,@imageName)
end

GO
/****** Object:  StoredProcedure [dbo].[insertOrder]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertOrder]
@orderName nvarchar(100),
@orderNumber nvarchar(100),
@phone varchar(15),
@email nvarchar(100),
@address nvarchar(100),
@total float,
@idUser int
as
begin
Insert into Orders(OrderName,OrderNumber,Phone,Email,[Address],TotalAmount,CreatedDate,PaymentDate,[Status],UserId)
values(@orderName,@orderNumber,@phone,@email,@address,@total,GETDATE(),getDate(),1,@idUser)
end
GO
/****** Object:  StoredProcedure [dbo].[insertOrderDetail]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertOrderDetail]
@id int,
@idProduct int,
@maount float,
@price float,
@quan int,
@note nvarchar(100)
as
begin
Insert into OrderDetail(OrderId,ProductId,Amount,Price,Quantity,Note,[Status])
values(@id,@idProduct,@maount,@price,@quan,@note,1)
end
GO
/****** Object:  StoredProcedure [dbo].[insertPackage]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertPackage]
@name nvarchar(200),
@userId int
as
begin
insert into Packages(PackageName,UserId,Status)
values(@name, @userId,'True')
end

GO
/****** Object:  StoredProcedure [dbo].[insertPackageHistory]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[insertPackageHistory]
 @packageId int ,
 @cardId int,
 @mout float
 as
 begin
 Insert into PackageHistory values(@packageId,@cardId,@mout,getDate(),'True')
 end
GO
/****** Object:  StoredProcedure [dbo].[insertPaymentType]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertPaymentType]
@name nvarchar(100),
@des nvarchar(100)
as
begin
insert into PaymentType(PaymentTypeName,Descriptions,Status)
values (@name,@des,'True')
end

GO
/****** Object:  StoredProcedure [dbo].[insertPost]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertPost]
@title nvarchar(100),
@content ntext,
@contentDetail ntext,
@images nvarchar(100),
@catalogPostId int,
@displayNumber int
as
begin
Insert into Post(PostTitle,Content,ContentDetail,Images,CatalogPostId,DisplayNumber,Created,Status)
  values(@title,@content,@contentDetail,@images,@catalogPostId,@displayNumber,getDate(),'True')
  end

GO
/****** Object:  StoredProcedure [dbo].[insertProduct]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertProduct]
@name nvarchar(100),
@catalogid int,
@content ntext,
@contentDetail ntext,
@image nvarchar(100),
@imageHover nvarchar(100),
@priceInput float,
@priceOutput float,
@quantity int,
@provider int,
@discount int
as
begin
insert into Product(ProductName,CatalogId,ProductContent,ProductContentDetail,Images,ImageHover, PriceInput,PriceOutput,Quantity,ProviderId,Created,Status,Discount)
values(@name,@catalogid,@content,@contentDetail,@image,@imageHover,@priceInput,@priceOutput,@quantity,@provider,GETDATE(),'True',@discount)
end
GO
/****** Object:  StoredProcedure [dbo].[insertProvider]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertProvider]
@name nvarchar(100),
@add nvarchar(100),
@email nvarchar(100),
@phone varchar(15)
as
begin
Insert into Provider(ProviderName,[Address],Email,Phone,[Status]) values(@name,@add,@email,@phone,'True');
end
GO
/****** Object:  StoredProcedure [dbo].[insertSize]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertSize]
@name nvarchar(100),
@des nvarchar(100)
as
begin
insert into Size(SizeName,Descriptions,[Status]) values(@name,@des,'True')
end
GO
/****** Object:  StoredProcedure [dbo].[insertUser]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertUser]
@name nvarchar(100),
@pass nvarchar(100),
@phone varchar(15),
@email nvarchar(100),
@address nvarchar(100),
@groupId int
as
begin
Insert into Users(UserName,[Password],Phone,Email,[Address],GroupId,[Status])
values (@name,@pass,@phone,@email,@address,@groupId,'True')
end
GO
/****** Object:  StoredProcedure [dbo].[productShare]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[productShare]
as
begin
Select * from Product where [Status] = 'True' and Discount > 0 
end
GO
/****** Object:  StoredProcedure [dbo].[recoverPassword]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[recoverPassword]
@id int,
@pas nvarchar(100)
as
begin
Update Users set Password = @pas
             where UserId = @id
			 end
GO
/****** Object:  StoredProcedure [dbo].[searchDownPrice]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[searchDownPrice]
@price float
as
begin
Select * from Product where PriceOutput < @price
end
GO
/****** Object:  StoredProcedure [dbo].[searchProduct]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[searchProduct]
@stri nvarchar(100)
as
begin
Select * from Product where ProductName like N'%'+ @stri + N'%' or PriceOutput like N'%'+ @stri + N'%' 
end
GO
/****** Object:  StoredProcedure [dbo].[searchProductByColor]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[searchProductByColor]
@colorId int
as
begin
Select * from Product, ProductColor where Product.ProductId = ProductColor.ProductId and ColorId = @colorId
end
GO
/****** Object:  StoredProcedure [dbo].[searchProductByPrice]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[searchProductByPrice]
@start float,
@end float
as
begin
Select * from Product where PriceOutput between @start and @end
end

GO
/****** Object:  StoredProcedure [dbo].[searchProductByProvider]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[searchProductByProvider]
@providerId int
as
begin
Select * from Product where ProviderId = @providerId
end
GO
/****** Object:  StoredProcedure [dbo].[searchTopPrice]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[searchTopPrice]
@price float
as
begin
Select * from Product where PriceOutput > @price
end
GO
/****** Object:  StoredProcedure [dbo].[SP_DisplayPageNo]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DisplayPageNo]
@CurrentPage int ,
@PageSize int,
@table nvarchar(200),
@actionName nvarchar(100),
@sql nvarchar(4000) OUTPUT
AS
BEGIN
--Khai báo và lấy tổng số bản ghi lấy về
DECLARE @TotalRecord int;
DECLARE @sqlString nvarchar(200);
SET @sqlString = N'SELECT @TotalRecord=Count(*) FROM '+@table;
execute sp_executesql @sqlString,N'@TotalRecord int out',@TotalRecord out;
--Khai báo và set tổng số trang cần phân ra dựa vào tổng số bản ghi và số bản ghi trên 1 trang
DECLARE @TotalPage int;
IF @TotalRecord%@PageSize>0
SET @TotalPage=(@TotalRecord/@PageSize)+1;
ELSE
SET @TotalPage=@TotalRecord/@PageSize;
--Xử lý trường hợp nếu trang đang chọn truyền vào nhỏ hơn 1Spring Web MVC
IF @CurrentPage<1
SET @CurrentPage=1;
--Xử lý trường hợp nếu trang đang chọn truyền vào lớn hơn tổng số trang được chia
IF @CurrentPage>@TotalPage
SET @CurrentPage=@TotalPage
--Set nội dung cho link phân trang
SET @sql=''
IF @CurrentPage>1
BEGIN
SET @sql=@sql+ N' <a href="'+@actionName+'?page=1" title="Trang đầu">&lt;&lt;</a>'
SET @sql=@sql+ ' <a href="'+@actionName+'?page='+ Cast((@CurrentPage-1) AS
nvarchar(4))+N'" title="Trang trước">&lt;</a>'
END
DECLARE @i int
SET @i=1
WHILE @i<=@TotalPage
BEGIN
IF @i=@CurrentPage
SET @sql=@sql+'  <a href="'+@actionName+'?page='+Cast(Cast(@i AS int) AS nvarchar(4))+'  class="active">' + Cast(Cast(@i AS int) AS nvarchar(4))+'</a> '
ELSE
SET @sql=@sql+' <a href="'+@actionName+'?page='+Cast(@i AS nvarchar(4))+'">'
+Cast(@i AS nvarchar(4))+'</a> '
SET @i=@i+1
END
IF @CurrentPage<@TotalPage
BEGIN
SET @sql=@sql+ N' <a href="'+@actionName+'?page='+Cast((@CurrentPage+1) AS
nvarchar(4))+N'" title="Trang sau">&gt;</a>'
SET @sql=@sql+ N' <a href="'+@actionName+'?page='+cast(@TotalPage AS nvarchar(6))+ N'"
title="Trang cuối">&gt;&gt;</a>'
END
SELECT @sql AS Paging
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Paging]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_Paging]
@CurrentPage int,
@PageSize int,
@table nvarchar(200),
@tableId nvarchar(100)
AS
Begin
-- Tính tổng số bản ghi
DECLARE @TotalRecord int, @TotalPage int
--khai bao cau lenh va thuc thi cau lenh lay tong so ban ghi cua bang can phan trang
DECLARE @SqlString nvarchar(500);
DECLARE @SqlString1 nvarchar(500);
SET @SqlString = N'SELECT @TotalRecord=Count(*) FROM '+@table;
execute sp_executesql @SqlString,N'@TotalRecord int out',@TotalRecord out;
-- Tính tổng số trang
IF @TotalRecord%@PageSize>0
SET @TotalPage=(@TotalRecord/@PageSize)+1
ELSE
SET @TotalPage=@TotalRecord/@PageSize
--Xử lý trường hợp @CurrentPage<1
IF @CurrentPage<1
SET @CurrentPage=1
--Xử lý trường hợp @CurrentPage>@Tolal
IF @CurrentPage>@TotalPage
SET @CurrentPage=@TotalPage
--Xử lý lấy dữ liệu của trang hiện tại
SET @SqlString1 = 'Begin WITH temp AS (SELECT ROW_NUMBER() OVER(ORDER BY
'+@tableId+') AS RowNum, * FROM '+@table+') Select * From temp Where RowNum Between
('+CAST(@CurrentPage AS nvarchar(10))+' - 1)*'+CAST(@PageSize AS nvarchar(10))+'+1 AND
'+CAST(@CurrentPage AS nvarchar(10))+'*'+CAST(@PageSize AS nvarchar(10))+' END;'
execute sp_executesql @SqlString1;
END
GO
/****** Object:  StoredProcedure [dbo].[totalFeeback]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[totalFeeback]
@total int output
as
begin
select @total = count(FeebackId) from Feeback where [Status] ='False'
end
GO
/****** Object:  StoredProcedure [dbo].[updateAccount]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[updateAccount]
@id int,
@name nvarchar(100),
@pass nvarchar(100),
@phone varchar(15),
@email nvarchar(100),
@address nvarchar(100)
as
begin
Update Users set UserName = @name,
			[Password] = @pass,
			Phone = @phone,
			Email = @email,
			[Address] = @address
			where UserId = @id
end

GO
/****** Object:  StoredProcedure [dbo].[updateBanner]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateBanner]
@id int,
@image nvarchar(100),
@dis int,
@status bit
as
begin
Update Banner set Image = @image,
				  DisplayNumber = @dis,
				  Status = @status
				  where BannerId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[updateBuyItem]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateBuyItem]
@id int
as 
begin
update Product set BuyItem = BuyItem + 1 where ProductId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[updateCard]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateCard]
@cardId int,
@cardSeri varchar(25),
@cardNumber varchar(25),
@priceUnit int,
@status bit
as
begin
update  Cards set CardSeri = @cardSeri,
				  CardNumber = @cardNumber,
				  PriceUnit = @priceUnit,
				  Status = @status
				  where CardId = @cardId
end
GO
/****** Object:  StoredProcedure [dbo].[updateCatalog]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateCatalog]
@id int,
@name nvarchar(100),
@des nvarchar(100),
@pare int,
@img nvarchar(100),
@dis int,
@status bit
as
begin
update Catalog set CatalogName = @name,
				   Descriptions = @des,
				   ParentId = @pare,
				   Images = @img,
				   DisplayNumber = @dis,
				   [Status] = @status
			   where CatalogId = @id
end

GO
/****** Object:  StoredProcedure [dbo].[updateColor]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateColor]
@id int,
@name nvarchar(100),
@na nvarchar(100),
@status bit
as
begin
update Color set ColorName = @name,
             Natation = @na,
			Status = @status
			where ColorId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[updateFeeback]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateFeeback]
@id int
as
begin
Update Feeback set   Status = 1
				where FeebackId = @id
				end
GO
/****** Object:  StoredProcedure [dbo].[updateFunction]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateFunction]
@id int,
@name nvarchar(100),
@status bit
as
begin
Update Functions set FunctionName = @name,
				  Status = @status
				  where FunctionId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[updateGroup]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateGroup]
@id int,
@name nvarchar(100),
@status bit
as
begin
update Groups set GroupName = @name,
				  [Status] = @status
			  where GroupId = @id
			  end
GO
/****** Object:  StoredProcedure [dbo].[updateOrder]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateOrder]
@id int
as
begin
Update Orders set  PaymentDate = null, Status = 2
				where OrderId = @id
				end
GO
/****** Object:  StoredProcedure [dbo].[updateOrderCod]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateOrderCod]
@id int
as
begin
Update Orders set Status = 3
				where OrderId = @id
				end
GO
/****** Object:  StoredProcedure [dbo].[updatePaymentMethod]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[updatePaymentMethod]
@id int,
@name nvarchar(100)
as
begin
Update Orders set PaymentMethod = @name
                   where Orderid = @id
				   end
GO
/****** Object:  StoredProcedure [dbo].[updatePaymentType]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatePaymentType]
@id int,
@name nvarchar(100),
@des nvarchar(100),
@status bit
as
begin
update PaymentType set PaymentTypeName = @name,
					   Descriptions = @des,
					   Status = @status
					where PaymentTypeId = @id

end
GO
/****** Object:  StoredProcedure [dbo].[updatePost]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updatePost]
@id int,
@title nvarchar(100),
@content ntext,
@contentDetail ntext,
@images nvarchar(100),
@catalogPostId int,
@displayNumber int,
@status bit
as
begin
Update Post set PostTitle = @title,
                Content = @content,
				ContentDetail = @contentDetail,
				Images = @images,
				CatalogPostId = @catalogPostId,
				DisplayNumber -= @displayNumber,
				Status = @status
				where PostId = @id
end

GO
/****** Object:  StoredProcedure [dbo].[updateProduct]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[updateProduct]
@id int,
@name nvarchar(100),
@catalogid int,
@content ntext,
@contentDetail ntext,
@image nvarchar(100),
@imageHover nvarchar(100),
@priceInput float,
@priceOutput float,
@quantity int,
@provider int,
@discount int,
@status bit

as
begin
update Product set ProductName = @name,
				   CatalogId = @catalogid,
				   ProductContent = @content,
				   ProductContentDetail = @contentDetail,
				   Images = @image,
				   ImageHover = @imageHover,			
				   Quantity = @quantity,
				   ProviderId = @provider,
				   PriceInput = @priceInput,
				   PriceOutput = @priceOutput,
				   Discount = @discount,
				   Status = @status
				   where ProductId = @id

end

GO
/****** Object:  StoredProcedure [dbo].[updateProvider]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateProvider]
@id int,
@name nvarchar(100),
@add nvarchar(100),
@email nvarchar(100),
@phone varchar(15),
@status bit
as
begin
Update Provider set  ProviderName = @name, 
                    [Address] = @add, 
					Email = @email, 
					Phone = @phone, 
					[Status] = @status where ProviderId = @id
end
GO
/****** Object:  StoredProcedure [dbo].[updateSize]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateSize]
@id int,
@name nvarchar(100),
@des nvarchar(100),
@status bit
as
begin
update Size set SizeName = @name,
                Descriptions = @des,
				[Status] = @status
			where SizeId = @id
end

GO
/****** Object:  StoredProcedure [dbo].[updateUser]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateUser]
@id int,
@name nvarchar(100),
@pass nvarchar(100),
@phone varchar(15),
@email nvarchar(100),
@address nvarchar(100),
@groupId int,
@status bit
as
begin
Update Users set UserName = @name,
			[Password] = @pass,
			Phone = @phone,
			Email = @email,
			[Address] = @address,
			GroupId = @groupId,
			[Status] = @status 
			where UserId = @id
end

GO
/****** Object:  StoredProcedure [dbo].[updateView]    Script Date: 1/7/2019 8:08:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[updateView]
@id int
as
begin
update Product set [View] = [View] +1 where ProductId = @id
end
GO
