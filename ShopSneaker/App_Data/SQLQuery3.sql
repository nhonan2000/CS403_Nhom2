USE [master]
GO
CREATE DATABASE [SHOP1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SHOP1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL1\MSSQL\DATA\SHOP1.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SHOP1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQL1\MSSQL\DATA\SHOP1_log.ldf' , SIZE = 3456KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SHOP1] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SHOP1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SHOP1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SHOP1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SHOP1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SHOP1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SHOP1] SET ARITHABORT OFF 
GO
ALTER DATABASE [SHOP1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SHOP1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SHOP1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SHOP1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SHOP1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SHOP1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SHOP1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SHOP1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SHOP1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SHOP1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SHOP1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SHOP1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SHOP1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SHOP1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SHOP1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SHOP1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SHOP1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SHOP1] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SHOP1] SET  MULTI_USER 
GO
ALTER DATABASE [SHOP1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SHOP1] SET CHAINING OFF 
GO
ALTER DATABASE [SHOP1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SHOP1] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [SHOP1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_vardecimal_storage_format N'SHOP1', N'ON'
GO
ALTER DATABASE [SHOP1] SET QUERY_STORE = OFF
GO
USE [SHOP1]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SHOP1]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[MaSP] [int] NOT NULL,
	[MaDonDatHang] [int] NOT NULL,
	[SoLuongDat] [int] NULL,
	[DonGiaDat] [float] NULL,
 CONSTRAINT [PK_ChiTietDonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaHD] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [float] NULL,
 CONSTRAINT [PK_ChiTietDonHang_1] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DangKy](
	[TenDangNhap] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[EmailDK] [varchar](50) NULL,
	[DiaChiDK] [nvarchar](100) NULL,
	[TenDayDu] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[GioiTinhDK] [nchar](10) NULL,
	[MaQuyen] [int] NULL,
 CONSTRAINT [PK_DangKy] PRIMARY KEY CLUSTERED 
(
	[TenDangNhap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[MaDM] [int] IDENTITY(1,1) NOT NULL,
	[TenDM] [nvarchar](50) NULL,
	[ThuTu] [int] NULL,
	[MaDMCha] [int] NULL,
 CONSTRAINT [PK_DanhMuc] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDonDatHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [datetime] NULL,
	[ThanhTienDH] [float] NULL,
	[TinhTrangDonHang] [nvarchar](300) NULL,
	[MaKH] [int] NULL,
	[TenKH] [nvarchar](50) NULL,
	[sdtKH] [varchar](15) NULL,
	[EmailKH] [varchar](50) NULL,
	[PhuongThucThanhToan] [varchar](50) NULL
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayLap] [datetime] NULL,
	[ThanhTien] [float] NULL,
	[MaNV] [int] NULL,
	[TenNV] [nvarchar](70) NULL,
	[MaKH] [int] NULL,
	[TenKH] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[TenKh] [nvarchar](50) NULL,
	[DiaChiKH] [nvarchar](100) NULL,
	[sdtKH] [varchar](15) NULL,
	[EmailKH] [varchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mau](
	[MauID] [int] IDENTITY(1,1) NOT NULL,
	[TenMau] [nvarchar](50) NULL,
 CONSTRAINT [PK_Mau] PRIMARY KEY CLUSTERED 
(
	[MauID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhomSanPham](
	[NhomID] [int] IDENTITY(1,1) NOT NULL,
	[TenNhom] [nvarchar](100) NULL,
	[ThuTu] [int] NULL,
	[SoSPHienThi] [int] NULL,
 CONSTRAINT [PK_NhomSanPham] PRIMARY KEY CLUSTERED 
(
	[NhomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyenDangNhap](
	[MaQuyen] [int] IDENTITY(1,1) NOT NULL,
	[TenQuyen] [varchar](10) NULL,
 CONSTRAINT [PK_QuyenDangNhap] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[MauID] [int] NULL,
	[SizeID] [int] NULL,
	[AnhSP] [nvarchar](100) NULL,
	[SoLuongSP] [int] NULL,
	[GiaSP] [float] NULL,
	[MaDM] [int] NULL,
	[NhomID] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[TenSize] [varchar](10) NULL,
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (2, 1, 1, 500000)
INSERT [dbo].[ChiTietDonDatHang] ([MaSP], [MaDonDatHang], [SoLuongDat], [DonGiaDat]) VALUES (2, 2, 1, 500000)
GO
INSERT [dbo].[DangKy] ([TenDangNhap], [MatKhau], [EmailDK], [DiaChiDK], [TenDayDu], [NgaySinh], [GioiTinhDK], [MaQuyen]) VALUES (N'admin', N'8a1148a74ba479fcaca5e34f5de73d45', N'admin@gmail.com', N'quảng ngãi', N'bích điền', CAST(N'2000-08-02' AS Date), N'Nam       ', 1)
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM], [ThuTu], [MaDMCha]) VALUES (1, N'Vans', 1, 0)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM],  [ThuTu], [MaDMCha]) VALUES (2, N'Balenciaga', 2, 0)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM],  [ThuTu], [MaDMCha]) VALUES (3, N'Adidas', 3, 0)
INSERT [dbo].[DanhMuc] ([MaDM], [TenDM],  [ThuTu], [MaDMCha]) VALUES (4, N'Jando', 4, 0)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
SET IDENTITY_INSERT [dbo].[Mau] ON 

INSERT [dbo].[Mau] ([MauID], [TenMau]) VALUES (1, N'Xanh')
INSERT [dbo].[Mau] ([MauID], [TenMau]) VALUES (2, N'Đỏ')
INSERT [dbo].[Mau] ([MauID], [TenMau]) VALUES (3, N'Trắng')
INSERT [dbo].[Mau] ([MauID], [TenMau]) VALUES (4, N'Đen')
INSERT [dbo].[Mau] ([MauID], [TenMau]) VALUES (5, N'Vàng')
SET IDENTITY_INSERT [dbo].[Mau] OFF
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang],[PhuongThucThanhToan], [MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (1, CAST(N'2021-10-31T06:01:13.000' AS DateTime), 500000, N'Đang chờ duyệt', N'Thanh toán sau khi nhận hàng', 3, N'trần hải', N'987994431', N'ngochai777890@gmail.com')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [NgayTao], [ThanhTienDH], [TinhTrangDonHang], [PhuongThucThanhToan],[MaKH], [TenKH], [sdtKH], [EmailKH]) VALUES (2, CAST(N'2021-10-31T11:46:37.000' AS DateTime), 500000, N'Đang chờ duyệt', N'Thanh toán sau khi nhận hàng', 3, N'trần hải', N'987994431', N'ngochai777890@gmail.com')
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 
INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (1,N'Van3',1,2,N'13.jpg',N'1',N'500000',1,1)
	
	SET IDENTITY_INSERT [dbo].[SanPham] OFF 
	SET IDENTITY_INSERT [dbo].[SanPham] ON 
INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (2,N'Vans1',1,2,N'15.jpg',N'1',N'500000',1,1)
	
	SET IDENTITY_INSERT [dbo].[SanPham] OFF 
	SET IDENTITY_INSERT [dbo].[SanPham] ON 
INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (3,N'Balenciaga2',2,1,N'25.jpg',N'1',N'500000',2,1)
	INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (4,N'Adidas2',1,2,N'29.jpg',N'1',N'400000',3,1)
	INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (5,N'Adidas3',1,2,N'27.jpg',N'1',N'350000',3,1)
	INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (6,N'Vansdubai1',1,2,N'21.jpg',N'1',N'350000',1,1)
	INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (8,N'Balenciaga3',1,2,N'17.jpg',N'1',N'300000',2,1)
	INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (9,N'Balenciaga4',1,2,N'19.jpg',N'1',N'300000',2,1)
	INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (10,N'Adidas5',1,2,N'15.jpg',N'1',N'300000',3,1)
	INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (11,N'Jando1',1,2,N'2.jpg',N'1',N'300000',4,1)
	INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (12,N'Jando2',1,2,N'1.jpg',N'1',N'300000',4,1)
	INSERT [dbo].[SanPham](
	[MaSP],
	[TenSP] ,
	[MauID] ,
	[SizeID] ,
	[AnhSP] ,
	[SoLuongSP] ,
	[GiaSP] ,
	[MaDM] ,
	[NhomID]) VALUES (13,N'Jando3',1,2,N'1.jpg',N'1',N'300000',4,1)
	
	SET IDENTITY_INSERT [dbo].[SanPham] OFF 
SET IDENTITY_INSERT [dbo].[NhomSanPham] ON 

INSERT [dbo].[NhomSanPham] ([NhomID], [TenNhom], [ThuTu], [SoSPHienThi]) VALUES (1, N'Sản Phẩm Nổi Bật', 1, 100)



SET IDENTITY_INSERT [dbo].[NhomSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [TenKh], [DiaChiKH], [sdtKH], [EmailKH], [MatKhau]) VALUES (3, N'khachhang', N'quangnam', N'0987654231', N'khachhang@gmail.com', N'be8a6e19c968ff48e71b4e19c7d5ac98')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[QuyenDangNhap] ON 

INSERT [dbo].[QuyenDangNhap] ([MaQuyen], [TenQuyen]) VALUES (1, N'admin')
SET IDENTITY_INSERT [dbo].[QuyenDangNhap] OFF
SET IDENTITY_INSERT [dbo].[Size] ON 

INSERT [dbo].[Size] ([SizeID], [TenSize]) VALUES (1, N'35')
INSERT [dbo].[Size] ([SizeID], [TenSize]) VALUES (2, N'36')
INSERT [dbo].[Size] ([SizeID], [TenSize]) VALUES (3, N'37')
INSERT [dbo].[Size] ([SizeID], [TenSize]) VALUES (4, N'38')
INSERT [dbo].[Size] ([SizeID], [TenSize]) VALUES (5, N'39')
INSERT [dbo].[Size] ([SizeID], [TenSize]) VALUES (6, N'40')
INSERT [dbo].[Size] ([SizeID], [TenSize]) VALUES (7, N'41')
SET IDENTITY_INSERT [dbo].[Size] OFF
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang] FOREIGN KEY([MaDonDatHang])
REFERENCES [dbo].[DonDatHang] ([MaDonDatHang])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_SanPham]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[DangKy]  WITH CHECK ADD  CONSTRAINT [FK_DangKy_QuyenDangNhap] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QuyenDangNhap] ([MaQuyen])
GO
ALTER TABLE [dbo].[DangKy] CHECK CONSTRAINT [FK_DangKy_QuyenDangNhap]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_DanhMuc] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DanhMuc] ([MaDM])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_DanhMuc]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Mau] FOREIGN KEY([MauID])
REFERENCES [dbo].[Mau] ([MauID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Mau]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhomSanPham] FOREIGN KEY([NhomID])
REFERENCES [dbo].[NhomSanPham] ([NhomID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhomSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Size] FOREIGN KEY([SizeID])
REFERENCES [dbo].[Size] ([SizeID])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Size]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Chitietdondathang_Delete]
@masp int,
@madondathang int
AS
BEGIN
	delete ChiTietDonDatHang where MaSP=@masp and MaDonDatHang=@madondathang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Chitietdondathang_Insert]
@masp int,
@madondathang int,
@soluongdat int,
@dongiadat float,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from ChiTietDonDatHang where @masp=MaSP and @madondathang=MaDonDatHang))
	begin
	insert into ChiTietDonDatHang(MaSP,MaDonDatHang,SoLuongDat,DonGiaDat) values(@masp,@madondathang,@soluongdat,@dongiadat)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Chitietdondathang_Update]
@masp int,
@madondathang int,
@soluongdat int,
@dongiadat float
AS
BEGIN
	update ChiTietDonDatHang set SoLuongDat=@soluongdat,DonGiaDat=@dongiadat where MaSP=@masp and MaDonDatHang=@madondathang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Chitietdonhang_Delete]
@masp int,
@mahoadon int
AS
BEGIN
	delete ChiTietDonHang where MaSP=@masp and MaHD=@mahoadon
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Chitietdonhang_Insert]
@masp int,
@mahoadon int,
@soluong int,
@dongia float,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from ChiTietDonHang where @masp=MaSP and @mahoadon=MaHD))
	begin
	insert into ChiTietDonHang(MaHD,MaSP,SoLuong,DonGia) values(@mahoadon,@masp,@soluong,@dongia)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Chitietdonhang_Update]
@masp int,
@mahoadon int,
@soluong int,
@dongia float
AS
BEGIN
	update ChiTietDonHang set SoLuong=@soluong,DonGia=@dongia where MaSP=@masp and MaHD=@mahoadon
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DangKy_Delete]
@tendangnhap varchar(50)
AS
BEGIN
	delete from DangKy where TenDangNhap=@tendangnhap
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DangKy_Insert]
@tendangnhap varchar(50),
@matkhau varchar(50) ,
@emaildk varchar(50),
@diachidk nvarchar(50),
@tendaydu nvarchar(50),
@ngaysinh date,
@gioitinhdk nvarchar(10),
@maquyen int,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from DangKy where @tendangnhap=TenDangNhap))
	begin
	insert into DangKy(TenDangNhap,MatKhau,EmailDK,DiaChiDK,TenDayDu,NgaySinh,GioiTinhDK,MaQuyen) values(@tendangnhap,@matkhau,@emaildk,@diachidk,@tendaydu,@ngaysinh,@gioitinhdk,@maquyen)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DangKy_Update]
@tendangnhap varchar(50),
@matkhau varchar(50) ,
@emaildk varchar(50),
@diachidk nvarchar(50),
@tendaydu nvarchar(50),
@ngaysinh date,
@gioitinhdk nvarchar(10),
@maquyen int
AS
BEGIN
	update DangKy set MatKhau=@matkhau,EmailDK=@emaildk,DiaChiDK=@diachidk,TenDayDu=@tendaydu,NgaySinh=@ngaysinh,GioiTinhDK=@gioitinhdk,MaQuyen=@maquyen where TenDangNhap=@tendangnhap
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhMuc_Delete]
@madm int
AS
BEGIN
	delete from DanhMuc where MaDM=@madm
	delete from SanPham where MaDM=@madm
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhMuc_Insert]
@tendm nvarchar(50),
@thutu int,
@maDMcha int,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from DanhMuc where @tendm=TenDM))
	begin
	insert into DanhMuc(TenDM,ThuTu,MaDMCha) values(@tendm,@thutu,@maDMcha)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DanhMuc_Update]
@madm int,
@tendm nvarchar(50),
@thutu int,
@maDMcha int
AS
BEGIN
	update DanhMuc set TenDM=@tendm,ThuTu=@thutu,MaDMCha=@maDMcha where MaDM=@madm
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Dondathang_Delete]
@madondathang int
AS
BEGIN
	delete from ChiTietDonDatHang where MaDonDatHang=@madondathang
	delete from DonDatHang where MaDonDatHang=@madondathang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Dondathang_Insert]
@ngaytao datetime,
@thanhtienhd float,
@tinhtrangdonhang nvarchar(300),
@makh int,
@tenkh nvarchar(50),
@sdtkh varchar(15),
@emailkh varchar(50),
@phuongthucthanhtoan varchar(50),
@ret int out
AS
BEGIN
	set @ret=1
	begin
	insert into DonDatHang(NgayTao,ThanhTienDH,TinhTrangDonHang,MaKH,TenKH,sdtKH,EmailKH, PhuongThucThanhToan) values(@ngaytao,@thanhtienhd,@tinhtrangdonhang,@makh,@tenkh,@sdtkh,@emailkh,@phuongthucthanhtoan)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Dondathang_Update]
@madondathang int,
@ngaytao datetime,
@thanhtienhd float,
@tinhtrangdonhang nvarchar(300),
@makh int,
@tenkh nvarchar(50),
@sdtkh varchar(15),
@emailkh varchar(50),
@phuongthucthanhtoan varchar(50)
AS
BEGIN
	update DonDatHang set NgayTao=@ngaytao,ThanhTienDH=@thanhtienhd,TinhTrangDonHang=@tinhtrangdonhang,MaKH=@makh,TenKH=@tenkh,sdtKH=@sdtkh,EmailKH=@emailkh,PhuongThucThanhToan=@phuongthucthanhtoan where MaDonDatHang=@madondathang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Hoadon_Delete]
@mahoadon int
AS
BEGIN
	delete from HoaDon where MaHD=@mahoadon
	delete from ChiTietDonHang where MaHD=@mahoadon
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Hoadon_Insert]
@ngaylap datetime,
@thanhtien float,
@manv int,
@tennv nvarchar(70),
@makh int,
@tenkh nvarchar(70),
@ret int out
AS
BEGIN
	set @ret=1
	begin
	insert into HoaDon(NgayLap,ThanhTien,MaNV,TenNV,MaKH,TenKH) values(@ngaylap,@thanhtien,@manv,@tennv,@makh,@makh)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Hoadon_Update]
@mahoadon int,
@ngaylap datetime,
@thanhtien float,
@manv int,
@tennv nvarchar(70),
@makh int,
@tenkh nvarchar(70)
AS
BEGIN
	update HoaDon set NgayLap=@ngaylap,ThanhTien=@thanhtien,MaNV=@manv,TenNV=@tennv,MaKH=@makh,TenKH=@tenkh where MaHD=@mahoadon
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Khachhang_Delete]
@makh int
AS
BEGIN
	delete from KhachHang where MaKH=@makh
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Khachhang_Insert]
@tenkh nvarchar(50),
@diachikh nvarchar(100),
@sdtkh varchar(15),
@emailkh varchar(50),
@matkhau nvarchar(50),
@ret int out
AS
BEGIN
	set @ret=1
	begin
	insert into KhachHang(TenKh,DiaChiKH,sdtKH,EmailKH,MatKhau) values(@tenkh,@diachikh,@sdtkh,@emailkh,@matkhau)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Khachang_Update]
@makh int,
@tenkh nvarchar(50),
@diachikh nvarchar(100),
@sdtkh varchar(15),
@emailkh varchar(50),
@matkhau nvarchar(50)
AS
BEGIN
	update KhachHang set TenKh=@tenkh,DiaChiKH=@diachikh,sdtKH=@sdtkh,EmailKH=@emailkh, MatKhau=@matkhau where MaKH=@makh
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mau_Delete]
@mauid int
AS
BEGIN
	delete from Mau where MauID=@mauid
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mau_Inser]
@tenmau nvarchar(50),
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from Mau where @tenmau=TenMau))
	begin
	insert into Mau(TenMau) values(@tenmau)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Mau_Update]
@mauid int,
@tenmau nvarchar(50)
AS
BEGIN
	update Mau set TenMau=@tenmau where MauID=@mauid
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Quyendangnhap_Delete]
@quyenid int
AS
BEGIN
	delete from QuyenDangNhap where MaQuyen=@quyenid
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Quyendangnhap_Insert]
@tenquyen varchar(10),
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from QuyenDangNhap where @tenquyen=TenQuyen))
	begin
	insert into QuyenDangNhap(TenQuyen) values(@tenquyen)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Quyendangnhap_Update]
@maquyen int,
@tenquyen varchar(100)
AS
BEGIN
	update QuyenDangNhap set TenQuyen=@tenquyen where MaQuyen=@maquyen
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sanpham_Delete]
@masp int
AS
BEGIN
	delete from SanPham where MaSP=@masp
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sanpham_Insert]
@tensp nvarchar(100),
@mauID int,
@sizeID int,
@anhsanpham nvarchar(100),
@soluongsp int,
@giasp float,
@maDM int,
@nhomID int,
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from SanPham where @tensp=TenSP))
	begin
	insert into SanPham(TenSP,MauID,SizeID,AnhSP,SoLuongSP,GiaSP,MaDM,NhomID) values(@tensp,@mauID,@sizeID,@anhsanpham,@soluongsp,@giasp,@maDM,@nhomID)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sanpham_Update]
@masp int,
@tensp nvarchar(100),
@mauid int,
@sizeid int,
@anhsp nvarchar(100),
@soluongsp int,
@giasp float,
@madm int,
@nhomid int
AS
BEGIN
	update SanPham set TenSP=@tensp,MauID=@mauid,SizeID=@sizeid,AnhSP=@anhsp,SoLuongSP=@soluongsp,GiaSP=@giasp,MaDM=@madm,NhomID=@nhomid where MaSP=@masp
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Size_Delete]
@sizeid int
AS
BEGIN
	delete from Size where SizeID=@sizeid
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Size_Insert]
@tensize varchar(10),
@ret int out
AS
BEGIN
	set @ret=1
	if(not exists(select * from Size where @tensize=TenSize ))
	begin
	insert into Size(TenSize) values(@tensize)
	set @ret=2
	end
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Size_Update]
@sizeid int,
@tensize varchar(10)
AS
BEGIN
	update Size set TenSize=@tensize where SizeID=@sizeid
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Chitietdondathang]
AS
BEGIN
	select * from ChiTietDonDatHang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Chitietdondathang_TongSoLuong]

AS
BEGIN
	SELECT SUM(SoLuongDat)
FROM ChiTietDonDatHang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Chitietdondathang_By_Madondathang]
(
@madondathang int
)
AS
BEGIN
	select * from ChiTietDonDatHang where MaDonDatHang=@madondathang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Chitietdonhang]
AS
BEGIN
	select * from ChiTietDonHang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Dangky]
AS
BEGIN
	select * from DangKy
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Dangky_By_Id]
@TenDangNhap varchar(50)
AS
BEGIN
	select * from DangKy where TenDangNhap=@TenDangNhap
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Dangky_By_Id_Matkhau]
@TenDangNhap varchar(50),
@MatKhau varchar(50)
AS
BEGIN
	select * from DangKy where TenDangNhap=@TenDangNhap and MatKhau=@MatKhau
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Danhmuc]
AS
BEGIN
	select * from DanhMuc order by ThuTu
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[Thongtin_Danhmuc_By_Id]
(
@MaDM INT
)
AS
BEGIN
	select * from DanhMuc where MaDM=@MaDM
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[Thongtin_Danhmuc_By_MaDMCha]
(
@MaDMCha INT
)
AS
BEGIN
	select * from DanhMuc where MaDMCha=@MaDMCha
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Dondathang]
AS
BEGIN
	select * from DonDatHang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Dondathang_By_Id]
@MaDonDatHang int
AS
BEGIN
	select * from DonDatHang where MaDonDatHang=@MaDonDatHang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Dondathang_By_Mathanhtoan]
@tinhtrangdonhang nvarchar(300)
AS
BEGIN
	select * from DonDatHang where TinhTrangDonHang=@tinhtrangdonhang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Thongtin_Dondathang_Desc]
AS
BEGIN
	select * from DonDatHang order by MaDonDatHang desc
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Hoadon]
AS
BEGIN
	select * from HoaDon
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Khachhang]
AS
BEGIN
	select * from KhachHang
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Khachhang_By_Emailkh]
@emailkh nvarchar(50)
AS
BEGIN
	select * from KhachHang where EmailKH=@emailkh
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Khachhang_By_Emailkh_Matkhau]
@emailkh nvarchar(50),
@matkhau nvarchar(50)
AS
BEGIN
	select * from KhachHang where EmailKH=@emailkh and MatKhau=@matkhau
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Khachhang_By_Matkhau_DoiMatkhau]
@email varchar(50),
@matkhaumoi nvarchar(50),
@nhaplaimatkhaumoi nvarchar(50)
AS
BEGIN
	select * from KhachHang where EmailKH=@email and MatKhau=@matkhaumoi and MatKhau=@nhaplaimatkhaumoi
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Khachhang_By_Makh]
@makh nvarchar(50)
AS
BEGIN
	select * from KhachHang where MaKH=@makh
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Mau]
AS
BEGIN
	select * from Mau
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Mau_By_Id]
@MauID INT
AS
BEGIN
	select * from Mau where MauID=@MauID
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Nhanvien]
AS
BEGIN
	select * from NhanVien
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Nhomsp]
AS
BEGIN
	select * from NhomSanPham order by ThuTu
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Nhomsp_By_Id]
@NhomID int
AS
BEGIN
	select * from NhomSanPham where NhomID=@NhomID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Quyendangnhap]
AS
BEGIN
	select * from QuyenDangNhap
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Quyendangnhap_By_Id]
@MaQuyen int
AS
BEGIN
	select * from QuyenDangNhap where MaQuyen=@MaQuyen
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Sanpham]
AS
BEGIN
	select * from SanPham
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Sanpham_By_Id]
@MaSP INT
AS
BEGIN
	select * from SanPham where MaSP=@MaSP
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Sanpham_By_Madm]
@MaMD INT
AS
BEGIN
	select top 3 * from SanPham where MaDM=@MaMD
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Sanpham_By_Madm_Tatca]
@MaMD INT
AS
BEGIN
	select * from SanPham where MaDM=@MaMD
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Sanpham_By_Nhomid]
@NhomID INT,
@SoSPHienThi INT
AS
BEGIN
	declare @sql nvarchar(300)
	set @sql='select top '+ CAST(@SoSPHienThi as varchar(10)) +' * from SanPham where NhomID='+CAST(@NhomID as varchar(10))
	exec sp_executesql @sql
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Sanpham_By_Tukhoa]
@TuKhoa nvarchar(100)
AS
BEGIN
	select * from SanPham where TenSP like N'%'+@TuKhoa+'%'
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Thongtin_Sanpham_By_Gia]
@gia nvarchar(100)
AS
BEGIN
	select * from SanPham where GiaSP like N'%'+@gia+'%'
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Size]
AS
BEGIN
	select * from Size
END

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Thongtin_Size_By_Id]
@SizeID INT
AS
BEGIN
	select * from Size where SizeID=@SizeID
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
USE [master]
GO
ALTER DATABASE [SHOP1] SET  READ_WRITE 
GO