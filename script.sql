USE [QLBX]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 3/24/2022 4:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaDV] [nchar](10) NOT NULL,
	[TenDV] [text] NULL,
	[Gia] [int] NULL,
 CONSTRAINT [PK_DichVu] PRIMARY KEY CLUSTERED 
(
	[MaDV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoDich]    Script Date: 3/24/2022 4:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDich](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaGD] [nchar](10) NOT NULL,
	[BKS] [text] NULL,
	[TenDVVT] [text] NULL,
	[GioVaoBen] [datetime] NULL,
	[GioRaBen] [datetime] NULL,
	[TenDV] [text] NULL,
	[SoLuong] [int] NULL,
	[Gia] [int] NULL,
	[TongTien] [int] NULL,
	[LaiXe] [text] NULL,
	[PhuXe] [text] NULL,
	[TenHinhThuc] [text] NULL,
	[TrangThai] [text] NULL,
 CONSTRAINT [PK_GiaoDich] PRIMARY KEY CLUSTERED 
(
	[MaGD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoDichVe]    Script Date: 3/24/2022 4:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoDichVe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaVe] [nchar](10) NOT NULL,
	[LoaiVe] [text] NULL,
	[BKS] [nchar](9) NULL,
	[NguoiBan] [text] NULL,
	[NgayBan] [date] NULL,
	[SoLuong] [int] NULL,
	[TongTien] [nchar](10) NULL,
 CONSTRAINT [PK_GiaoDichVe] PRIMARY KEY CLUSTERED 
(
	[MaVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HinhThucThanhToan]    Script Date: 3/24/2022 4:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhThucThanhToan](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaHinhThuc] [nchar](10) NOT NULL,
	[TenHinhThuc] [text] NULL,
 CONSTRAINT [PK_HinhThucThanhToan] PRIMARY KEY CLUSTERED 
(
	[MaHinhThuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiVe]    Script Date: 3/24/2022 4:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiVe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaLoaiVe] [nchar](10) NOT NULL,
	[LoaiVe] [text] NULL,
	[Gia] [int] NULL,
 CONSTRAINT [PK_LoaiVe] PRIMARY KEY CLUSTERED 
(
	[MaLoaiVe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TT_DVVT]    Script Date: 3/24/2022 4:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_DVVT](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaDVVT] [nchar](10) NOT NULL,
	[TenDVVT] [text] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_TT_DVVT] PRIMARY KEY CLUSTERED 
(
	[MaDVVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TT_Xe]    Script Date: 3/24/2022 4:41:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TT_Xe](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaXe] [nchar](10) NOT NULL,
	[MaDVVT] [nchar](10) NULL,
	[BKS] [nchar](10) NULL,
	[SoGhe] [int] NULL,
	[SoGiuong] [int] NULL,
	[LaiXe] [text] NULL,
	[PhuXe] [text] NULL,
 CONSTRAINT [PK_TT_Xe] PRIMARY KEY CLUSTERED 
(
	[MaXe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DichVu] ON 

INSERT [dbo].[DichVu] ([id], [MaDV], [TenDV], [Gia]) VALUES (1, N'DV01      ', N'Hoa hong ve', 10000)
INSERT [dbo].[DichVu] ([id], [MaDV], [TenDV], [Gia]) VALUES (2, N'DV02      ', N'Phu phi', 5000)
SET IDENTITY_INSERT [dbo].[DichVu] OFF
GO
SET IDENTITY_INSERT [dbo].[GiaoDich] ON 

INSERT [dbo].[GiaoDich] ([id], [MaGD], [BKS], [TenDVVT], [GioVaoBen], [GioRaBen], [TenDV], [SoLuong], [Gia], [TongTien], [LaiXe], [PhuXe], [TenHinhThuc], [TrangThai]) VALUES (7, N'GD)5      ', N'20B-12345 ', N'Manh Ha', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Hoa hong ve', 2, NULL, 20000, N'Nguyen Van Dung', N'Dinh Van Tung', N'Tien mat', N'Chua thanh toán')
INSERT [dbo].[GiaoDich] ([id], [MaGD], [BKS], [TenDVVT], [GioVaoBen], [GioRaBen], [TenDV], [SoLuong], [Gia], [TongTien], [LaiXe], [PhuXe], [TenHinhThuc], [TrangThai]) VALUES (3, N'GD01      ', N'20C-12345 ', N'Ha Lan', CAST(N'2022-03-23T10:20:00.000' AS DateTime), CAST(N'2022-03-23T11:20:00.000' AS DateTime), N'Phu phi', 4, NULL, 20000, N'Nguyen Van Dung', N'Dinh Van Tung', N'VIETTELPAY', N'Chua thanh toán')
INSERT [dbo].[GiaoDich] ([id], [MaGD], [BKS], [TenDVVT], [GioVaoBen], [GioRaBen], [TenDV], [SoLuong], [Gia], [TongTien], [LaiXe], [PhuXe], [TenHinhThuc], [TrangThai]) VALUES (4, N'GD02      ', N'20C-12345', N'Ha Lan', CAST(N'2022-03-23T20:00:00.000' AS DateTime), CAST(N'2022-03-23T21:00:00.000' AS DateTime), N'Hoa hong ve', 5, NULL, 50000, N'Tran Ngoc Khue', N'Phan Tien Thu', N'VNPTPAY', N'Chua thanh toan')
INSERT [dbo].[GiaoDich] ([id], [MaGD], [BKS], [TenDVVT], [GioVaoBen], [GioRaBen], [TenDV], [SoLuong], [Gia], [TongTien], [LaiXe], [PhuXe], [TenHinhThuc], [TrangThai]) VALUES (5, N'GD04      ', N'20B-12345 ', N'Manh Ha', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Hoa hong ve', 0, NULL, 0, N'Nguyen Van Dung', N'Dinh Van Tung', N'Tien mat', N'Ðã thanh toán')
INSERT [dbo].[GiaoDich] ([id], [MaGD], [BKS], [TenDVVT], [GioVaoBen], [GioRaBen], [TenDV], [SoLuong], [Gia], [TongTien], [LaiXe], [PhuXe], [TenHinhThuc], [TrangThai]) VALUES (6, N'GD09      ', N'20B-12345 ', N'Manh Ha', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Hoa hong ve', 0, NULL, 0, N'Nguyen Van Dung', N'Dinh Van Tung', N'Tien mat', N'Chua thanh toán')
SET IDENTITY_INSERT [dbo].[GiaoDich] OFF
GO
SET IDENTITY_INSERT [dbo].[GiaoDichVe] ON 

INSERT [dbo].[GiaoDichVe] ([id], [MaVe], [LoaiVe], [BKS], [NguoiBan], [NgayBan], [SoLuong], [TongTien]) VALUES (1, N'MV01      ', N'Giuong nam', N'20B-12345', N'Ph?m Nguy?t Thu', CAST(N'2022-03-24' AS Date), 2, N'140000    ')
INSERT [dbo].[GiaoDichVe] ([id], [MaVe], [LoaiVe], [BKS], [NguoiBan], [NgayBan], [SoLuong], [TongTien]) VALUES (5, N'MV04      ', N'Ghe ngoi', N'20B-12345', N'Ðinh Van Tùng', CAST(N'2022-03-24' AS Date), 3, N'180000    ')
SET IDENTITY_INSERT [dbo].[GiaoDichVe] OFF
GO
SET IDENTITY_INSERT [dbo].[HinhThucThanhToan] ON 

INSERT [dbo].[HinhThucThanhToan] ([id], [MaHinhThuc], [TenHinhThuc]) VALUES (1, N'TIENMAT   ', N'Tien mat')
INSERT [dbo].[HinhThucThanhToan] ([id], [MaHinhThuc], [TenHinhThuc]) VALUES (2, N'VIETTEL   ', N'VIETTELPAY')
INSERT [dbo].[HinhThucThanhToan] ([id], [MaHinhThuc], [TenHinhThuc]) VALUES (3, N'VNPT      ', N'VNPTPAY')
SET IDENTITY_INSERT [dbo].[HinhThucThanhToan] OFF
GO
SET IDENTITY_INSERT [dbo].[LoaiVe] ON 

INSERT [dbo].[LoaiVe] ([id], [MaLoaiVe], [LoaiVe], [Gia]) VALUES (1, N'GIUONG    ', N'Giuong nam', 70000)
INSERT [dbo].[LoaiVe] ([id], [MaLoaiVe], [LoaiVe], [Gia]) VALUES (3, N'HANG      ', N'Gui hang', 50000)
INSERT [dbo].[LoaiVe] ([id], [MaLoaiVe], [LoaiVe], [Gia]) VALUES (2, N'NGOI      ', N'Ghe ngoi', 60000)
SET IDENTITY_INSERT [dbo].[LoaiVe] OFF
GO
SET IDENTITY_INSERT [dbo].[TT_DVVT] ON 

INSERT [dbo].[TT_DVVT] ([id], [MaDVVT], [TenDVVT], [SoLuong]) VALUES (1, N'DVVT01    ', N'Manh Ha', 10)
INSERT [dbo].[TT_DVVT] ([id], [MaDVVT], [TenDVVT], [SoLuong]) VALUES (2, N'DVVT02    ', N'Ha Lan', 10)
SET IDENTITY_INSERT [dbo].[TT_DVVT] OFF
GO
SET IDENTITY_INSERT [dbo].[TT_Xe] ON 

INSERT [dbo].[TT_Xe] ([id], [MaXe], [MaDVVT], [BKS], [SoGhe], [SoGiuong], [LaiXe], [PhuXe]) VALUES (1, N'Xe01      ', N'DVVT01    ', N'20B-12345 ', 30, 10, N'Nguyen Van Dung', N'Dinh Van Tung')
INSERT [dbo].[TT_Xe] ([id], [MaXe], [MaDVVT], [BKS], [SoGhe], [SoGiuong], [LaiXe], [PhuXe]) VALUES (2, N'Xe02      ', N'DVVT02    ', N'20C-12345 ', 45, 0, N'Tran Ngoc Khue', N'Phan Tien Thu')
SET IDENTITY_INSERT [dbo].[TT_Xe] OFF
GO
