USE MASTER
GO


IF EXISTS (SELECT * FROM MASTER..SYSDATABASES WHERE NAME = 'PetShop')
	DROP DATABASE PetShop
GO
	
CREATE DATABASE PetShop
GO

USE PetShop
GO

CREATE TABLE PHANLOAI
(
	MaPL INT IDENTITY (1,1) ,
	TenPL nvarchar(50) NOT NULL,
	CONSTRAINT PK_PHANLOAI PRIMARY KEY(MaPL)
)
GO

Create Table DANHMUC
(
	MaDM INT IDENTITY (1,1),
	MaPL INT NOT NULL,
	TenDM nvarchar(50) NOT NULL,
	CONSTRAINT PK_DANHMUC PRIMARY KEY(MaDM),
	CONSTRAINT FK_DANHMUC FOREIGN KEY (MaPL) REFERENCES PHANLOAI(MaPL)
) 
GO

CREATE TABLE THONGTIN_PET
(
	MaP	varchar(10) NOT NULL,
	MaDM INT NOT NULL ,
	TenP nvarchar(100) NOT NULL,
	MoTa nvarchar(MAX) ,
	Giaban Decimal(18,0) CHECK (Giaban>=0),
	ANH nvarchar(50) NOT NULL,
	CONSTRAINT PK_THONGTIN_PET PRIMARY KEY(MaP),
	CONSTRAINT FK_THONGTIN_PET_DANHMUC FOREIGN KEY (MaDM) REFERENCES DANHMUC(MaDM)

)
go

CREATE TABLE DANGNHAP
(
	tenDN VARCHAR(10) NOT NULL,
	pass VARCHAR(10) NOT NULL,
	CONSTRAINT PK_DANGNHAP PRIMARY KEY(tenDN)
)
GO

CREATE TABLE KHACHHANG
(
	MaTK  varchar(10) NOT NULL,
	HoTen nVarchar(50) NOT NULL,
	DiachiKH nVarchar(200),
	DienthoaiKH Varchar(50),
	TenTK Varchar(50) UNIQUE,
	Matkhau Varchar(50) NOT NULL,
	Ngaysinh DATETIME ,
	Email Varchar(100) NULL,
	CONSTRAINT PK_TAI_KHOAN PRIMARY KEY(MaTK)
)
GO

CREATE TABLE NCC
(
	MaNCC VARCHAR(6) NOT NULL,
	TeNNCC NVARCHAR(30) NULL,
	DIACHI NVARCHAR(40) NULL,
	DIENTHOAI VARCHAR(11)NULL,
	CONSTRAINT PK_NCC PRIMARY KEY(MaNCC)
)
GO

CREATE TABLE DON_DAT_HANG
(
	MaDH  varchar(10) not null ,
	MaTK varchar(10) NOT NULL ,
	Ngaydat Datetime  DEFAULT GETDATE(),
	Ngaygiao Datetime DEFAULT GETDATE() ,
	Thanhtoan BIT,-- 1 đã thanh toán, 0 chưa THANH toán
	CONSTRAINT PK_DON_DAT_HANG PRIMARY KEY (MaDH),
	CONSTRAINT FK_DON_DAT_HANG_KHACHHANG FOREIGN KEY (MaTK) REFERENCES KHACHHANG(MaTK),
)
go

CREATE TABLE CT_DAT_HANG
(
	MaDH varchar(10) not null,
	MaP	 varchar(10) not null,
	SoLuong INT Check(Soluong>0),
	DonGia  varchar(50),
	CONSTRAINT PK_CT_DAT_HANG PRIMARY KEY (MaDH, MaP),
	CONSTRAINT FK_CT_DAT_HANG_DON_DAT_HANG FOREIGN KEY (MaDH) REFERENCES DON_DAT_HANG(MaDH),
	CONSTRAINT FK_CT_DAT_HANG_THONGTIN_PET FOREIGN KEY (MaP) REFERENCES THONGTIN_PET(MaP),
) 
GO

/************************************************************/
	/***********NCC**************/
INSERT INTO NCC (MaNCC, TeNNCC, DIACHI, DIENTHOAI) VALUES('NC1', N'CHÂU ÂU', N'ABCDCCL', '111555333')
INSERT INTO NCC (MaNCC, TeNNCC, DIACHI, DIENTHOAI) VALUES('NC2', N'CHÂU Á', N'QUẬN QUECTEN', '2297850')
INSERT INTO NCC (MaNCC, TeNNCC, DIACHI, DIENTHOAI) VALUES('NC3', N'CHÂU MỸ', N'NEW YORK', '013337799')
GO

/************ PHÂN LOẠI ************/
INSERT INTO PHANLOAI(TenPL) VALUES(N'GIỐNG CHÓ')
INSERT INTO PHANLOAI(TenPL) VALUES(N'GIỐNG MÈO')
INSERT INTO PHANLOAI(TenPL) VALUES(N'CỬA HÀNG PHỤ KIỆN')
GO

/************ DANH MỤC ************/
INSERT INTO DANHMUC( MaPL, TenDM) VALUES (1, N'CHÓ ALASKA ')
INSERT INTO DANHMUC( MaPL, TenDM) VALUES (1, N'CHÓ HUSKY ')
INSERT INTO DANHMUC( MaPL, TenDM) VALUES ( 1, N'CHÓ SAMOYED ')
INSERT INTO DANHMUC( MaPL, TenDM) VALUES ( 1, N'PHỐC SÓC')
INSERT INTO DANHMUC( MaPL, TenDM) VALUES ( 1, N'CHÓ NGAO Ý')
INSERT INTO DANHMUC( MaPL, TenDM) VALUES ( 1, N'CHÓ PHOODLE')
INSERT INTO DANHMUC(MaPL, TenDM) VALUES ( 2, N'MÈO BA TƯ')
INSERT INTO DANHMUC(MaPL, TenDM) VALUES ( 2, N'MÈO MUCHKIN')
INSERT INTO DANHMUC(MaPL, TenDM) VALUES ( 2, N'MÈO BENGALl')
INSERT INTO DANHMUC(MaPL, TenDM) VALUES ( 2, N'MÈO RAGROLL')
INSERT INTO DANHMUC(MaPL, TenDM) VALUES ( 3, N'Chuồng, túi')
INSERT INTO DANHMUC(MaPL, TenDM) VALUES ( 3, N'Dụng cụ vệ sinh')
INSERT INTO DANHMUC(MaPL, TenDM) VALUES ( 3, N'Đồ dùng')
INSERT INTO DANHMUC(MaPL, TenDM) VALUES ( 3, N'Thức ăn chó')
INSERT INTO DANHMUC(MaPL, TenDM) VALUES ( 3, N'Thức ăn mèo')
GO
/************ THÔNG TIN PET ************/
   /*******************************CHÓ************************************/
	/********** alaska ************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('AO0', 1, N'CHÓ ALASKA Eric', N'Tên: Eric Giống: chó Alaska Malamute Màu sắc: đen trắng Giới tính: đực
											Tuổi: 2 tháng.
											Tình trạng: có sẵn.
											Sổ sức khỏe: có
											Tiêm vacxin: 2 mũi
											Tẩy giun: lần 1', 10000000, 'A01')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('AO1', 1, N'CHÓ ALASKA Drey', N'Tên: Drey
										Giống: chó Alaska Malamute
										Màu sắc: đen trắng
										Giới tính: đực
										Tuổi: 2,5 tháng.
										Tình trạng: có sẵn.
										Sổ sức khỏe: có
										Tiêm vacxin: 2 mũi
										Tẩy giun: lần 1.', 19000000, 'A02')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('AO2', 1, N'CHÓ ALASKA Anita', N'Tên: Anita
										Giống: chó Alaska Malamute
										Màu sắc: Nâu đỏ
										Giới tính: đực
										Tuổi: 1,5 tháng.
										Tình trạng: có sẵn.
										Sổ sức khỏe: có
										Tiêm vacxin: 2 mũi
										Tẩy giun: lần 1.', 12000000, 'A03')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('AO3', 1, N'CHÓ ALASKA Selena', N'Tên: Selena
										Giống: chó Alaska Malamute
										Màu sắc: hồng phấn
										Giới tính: cái
										Tuổi: 2 tháng.
										Tình trạng: có sẵn.
										Sổ sức khỏe: có
										Tiêm vacxin: 2 mũi
										Tẩy giun: lần 1.', 10000000, 'A04')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('AO4', 1, N'CHÓ ALASKA Hana', N'Tên: Hana
Giống: chó Alaska Malamute
Màu sắc: Nâu đỏ
Giới tính: cái
Tuổi: 3 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 11000000, 'A05')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('AO5', 1, N'CHÓ ALASKA Osca', N'Tên: 
Giống: chó Alaska Malamute
Màu sắc: Nâu đỏ
Giới tính: đực
Tuổi: 2,5 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 16000000, 'A06')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('AO6', 1, N'CHÓ ALASKA Eri', N'Tên: Eri
Giống: chó Alaska Malamute
Màu sắc: Xám trắng
Giới tính: đực
Tuổi: 3,5 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 20000000, 'A07')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('AO7', 1, N'CHÓ ALASKA ', N'Tên: Yoko
Giống: chó Alaska Malamute
Màu sắc: Xám trắng
Giới tính: đực
Tuổi: 3,5 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 15000000 , 'A08')	
	/********** husky ************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('BO1', 2, N'CHÓ HUSKY Lu' , N'Tên: Lu
Giống: chó Husky Sibir.
Màu sắc: đen trắng.
Giới tính: đực
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 8000000, 'H01')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('BO2', 2, N'CHÓ HUSKY Gerda', N'Tên: Gerda
Giống: chó Husky Sibir
Màu sắc: nâu đỏ
Giới tính: đực.
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 1 mũi
Tẩy giun: lần 1.', 9000000, 'H02')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('BO3', 2, N'CHÓ HUSKY Belly', N'Tên: Belly
Giống: chó Husky Sibir
Màu sắc: xám trắng
Giới tính: đực
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 7000000, 'H03')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('BO4', 2, N'CHÓ HUSKY Lani', N'Tên: Lani
Giống: chó Husky Sibir
Màu sắc: xám trắng
Giới tính: cái
Tuổi: 1 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 1 mũi
Tẩy giun: lần 1.', 7000000, 'H04')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('BO5', 2, N'CHÓ HUSKY Max', N'Tên: Max
Giống: chó Husky Sibir
Màu sắc: đen trắng
Giới tính: đực
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi', 7000000, 'H05')

	/********** SAMOYED ************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('CO1', 3, N'CHÓ SAMOYED Moses', N'Tên: Moses
Giống: Samoyed
Màu sắc: trắng
Giới tính: đực.
Tuổi: 10 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 15000000, 'S01')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('CO2', 3, N'CHÓ SAMOYED Timer', N'Tên: Timer
Giống: Samoyed
Màu sắc: trắng
Giới tính: đực, cái
Tuổi: 4 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 20000000, 'S02')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('CO3', 3, N'CHÓ SAMOYED nhập khẩu Nga – James', N'Tên: James
Giống: Samoyed
Màu sắc: trắng
Giới tính: đực.
Tuổi: 10 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 7000000, 'S03')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('CO4', 3, N'CHÓ SAMOYED Monarch', N'Tên: Monarch
Giống: Samoyed
Màu sắc: trắng
Giới tính: đực.
Tuổi: 2,5 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 7000000, 'S04')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('CO5', 3, N'CHÓ SAMOYED Albern', N'Tên: Albern
Giống: Samoyed
Màu sắc: trắng
Giới tính: đực.
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 30000000, 'S05')

	/********** PHỐC SÓC ************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('DO1', 4, N'CHÓ PHỐC SÓC THÁI LAN – STELLA', N' Stella 2,5 tháng tuổi thuộc giống Chó Pomeranian Khỏe mạnh, đã được tẩy giun và tiêm 2 mũi vaccine phòng bệnh cho bé trước khi đến tay chủ mới.', 8000000, 'P01')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('DO2', 4, N'CHÓ PHỐC SÓC BLACK PARTY – LICA', N'Tên: Bạch Tuyết
Giống: chó Phốc sóc, Pomeranian, Pom, Boo
Màu sắc: trắng.
Giới tính: cái
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 9500000, 'P02')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('DO3', 4, N'CHÓ PHỐC SÓC Trà Sữa', N'Tên: Trà Sữa
Giống: chó Phốc sóc, Pomeranian, Pom, Boo
Màu sắc: party.
Giới tính: đực.
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 20000000, 'P03')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('DO4', 4, N'CHÓ PHỐC SÓC Bạch Tuyết', N'Tên: Bạch Tuyết
Giống: chó Phốc sóc, Pomeranian, Pom, Boo
Màu sắc: trắng.
Giới tính: cái
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 9000000, 'P04')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('DO5', 4, N'CHÓ PHỐC SÓC Common', N' Tên :Common
Giới tính: Đực
Giống: Chó Pomeranian
Tuổi: 3 tháng
Thanh toán: tiền mặt hoặc trả góp lãi suất 0%
Vaccine: đã tiêm phòng 2 mũi vaccine
Tẩy giun: đã tẩy giun', 8500000, 'P05')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('DO6', 4, N'CHÓ PHỐC SÓC RILLY', N'Giới tính: Đực
Giống: Chó Pomeranian
Tuổi: 3 tháng
Thanh toán: tiền mặt hoặc trả góp lãi suất 0%
Vaccine: đã tiêm phòng 2 mũi vaccine
Tẩy giun: đã tẩy giun', 13000000, 'P06')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('DO7', 4, N'CHÓ PHỐC SÓC Yona', N'Yona cái 2,5 tháng tuổi, thuộc giống Pomeranian. Khỏe mạnh, đã được tẩy giun và tiêm 2 mũi vaccine phòng bệnh cho bé trước khi đến tay chủ mới.', 11500000, 'P07')
	/********** NGAO Ý ************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('EO1', 5, N'CHÓ NGAO Ý Mia', N'Tên: Mia
Giống: chó Cane Corso, Ngao Ý.
Màu sắc: đen
Giới tính: đực
Tuổi: 5 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 25000000 , 'N01')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('EO2', 5, N'CHÓ NGAO Ý Isla ', N'Isla cái 6 tháng tuổi thuộc giống Cane corso – Ngao ý  Khỏe mạnh, đã được tẩy giun và tiêm 2 mũi vaccine phòng bệnh cho bé trước khi đến tay chủ mới.', 45000000 , 'N02')
	/**********  Poodle ************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('FO0', 6, N'CHÓ PHOODLE', N'Tên: Micky
Giống: chó Poodle Teacup
Màu sắc: nâu
Giới tính: đực
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 5000000, 'E01')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('FO1', 6, N'CHÓ PHOODLE Helwen', N'Tên: Helwen
Giống: chó Poodle Tiny
Màu sắc: vàng cam
Giới tính: cái
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 5000000, 'E02')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('FO2', 6, N'CHÓ PHOODLE Zamp', N'Tên: Zamp
Giống: chó Poodle Tiny
Màu sắc: Sô cô la
Giới tính: cái
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 6000000, 'E03')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('FO3', 6, N'CHÓ PHOODLE Jelly' , N'Tên: Jelly
Giống: chó Poodle Teacup
Màu sắc: bò sữa nâu
Giới tính: đực
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 7000000, 'E04')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('FO4', 6, N'CHÓ PHOODLE Coco', N'Tên: Coco
Giống: chó Poodle Toy
Màu sắc: nâu đỏ
Giới tính: cái
Tuổi: 4 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 8000000, 'E05')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('FO5', 6, N'CHÓ PHOODLE PEP', N'Tên: PEP
Giống: chó Poodle Toy
Màu sắc: nâu đỏ
Giới tính: cái
Tuổi: 4 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1', 9000000, 'E06')

	/************************MÈO******************************/
		/*********MÈO BA TƯ **********/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('GO1', 7, N'MÈO BA TƯ Gnes', N'Tên: Gnes
Giống: mèo Ba Tư (Persian, mèo 34)
Màu sắc: trắng
Giới tính: đực
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 6000000, 'B01')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('GO2', 7, N'MÈO BA TƯ Mie', N'Tên: Mie
Giống: mèo Ba Tư (Persian, mèo 34)
Màu sắc: xám trắng
Giới tính: đực
Tuổi: 7 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 6000000, 'B02')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('GO3', 7, N'MÈO BA TƯ Dora', N'Tên: Dora
Giống: mèo Ba Tư (Persian, mèo 34)
Màu sắc: hồng phấn
Giới tính: đực
Tuổi: 6 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 9000000, 'B03')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('GO4', 7, N'MÈO BA TƯ Gucci', N'Tên: Gucci
Giống: mèo Ba Tư (Persian, mèo 34)
Màu sắc: xám khói
Giới tính: đực
Tuổi: 6 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 9000000, 'B04')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('GO5', 7, N'MÈO BA TƯ LaLa', N'Tên: LaLa
Giống: mèo Ba Tư (Persian, mèo 34)
Màu sắc: xám XANH
Giới tính: đực
Tuổi: 6 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1', 9000000, 'B05')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('GO6', 7, N'MÈO BA TƯ QuaTes', N'Tên: QuaTes
Giống: mèo Ba Tư (Persian, mèo 34)
Màu sắc: khói
Giới tính: đực
Tuổi: 6 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1', 8000000, 'B06')
	/*********** Mèo Munchkin **********/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('HO1', 8, N'MÈO Munchkin Tom', N'Tên: Tom
Giống: mèo British Shorthair (mèo Anh lông ngắn, Aln), mèo Munchkin chân ngắn
Màu sắc: xám xanh (blue)
Giới tính: đực
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1. ', 18000000, 'M01')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('HO2', 8, N'MÈO Munchkin Laid' , N'Tên: Laid
Giống: mèo Munchkin chân ngắn.
Màu sắc: đực
Tuổi: 1,5 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1. ', 11000000, 'M02')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('HO3', 8, N'MÈO Munchkin Cabel', N'Tên: Cabel
Giống: mèo Munchkin chân ngắn.
Màu sắc: bicolor
Giới tính: cái
Tuổi: 5 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1. ', 16000000, 'M03')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('HO4', 8, N'MÈO Munchkin Lucas', N'Tên: Lucas
Giống: mèo Munchkin chân ngắn.
Màu sắc: Bicolor
Giới tính: cái
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1. ', 12000000, 'M04')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('HO5', 8, N'MÈO Munchkin Popy', N'Tên: Popy
Giống: mèo Munchkin chân ngắn, mèo Anh lông dài.
Màu sắc: Tricolor (tam thể)
Giới tính: cái
Tuổi: 2,5 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1. ', 20000000, 'M05')
	/*********** Mèo Bengal **********/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('IO1', 9, N'MÈO Bengal Beo', N'Tên: Beo
Giống: mèo Bengal, mèo báo
Màu sắc: brown
Giới tính: đực
Tuổi: 12 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 10000000, 'C01')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('IO2', 9, N'MÈO Bengal Sadie', N'Tên: Sadie
Giống: mèo bengal
Màu sắc: silver
Giới tính: đực
Tuổi: 3 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 1000000, 'C02')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('IO3', 9, N'MÈO Bengal Leopar', N'Tên: Leopar
Giống: mèo Bengal (mèo báo).
Màu sắc: Silver (bạc)
Giới tính: cái
Tuổi: 5 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 20000000, 'C03')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('IO4', 9, N'MÈO Bengal Nica', N'Tên: Nica
Giống: mèo Bengal (mèo báo).
Màu sắc: Silver (bạc)
Giới tính: cái
Tuổi: 3 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 20000000, 'C04')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('IO5', 9, N'MÈO Bengal MurPhy', N'Tên: MurPhy
Giống: mèo Bengal, mèo báo
Màu sắc: brown
Giới tính: đực
Tuổi: 3 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 7000000, 'C05')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('IO6', 9, N'MÈO Bengal Nick', N'Tên: Nick
Giống: mèo Bengal (mèo báo).
Màu sắc: Silver (bạc)
Giới tính: đực
Tuổi: 2 tháng.
Tình trạng: có sẵn.
Sổ sức khỏe: có
Tiêm vacxin: 2 mũi
Tẩy giun: lần 1.', 20000000, 'C06')
	/*********** Mèo RAGROLL **********/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('KO1', 10, N'MÈO RAGROLL MAGIC', N'Tên: MAGIC
Giới tính: Cái
Giống: mèo Ragdoll
Tuổi: 3 tháng
Thanh toán: tiền mặt hoặc trả góp lãi suất 0%
Vaccine: đã tiêm phòng 1 mũi vaccine
Tẩy giun: đã tẩy giun', 10000000, 'R01')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('KO2', 10, N'MÈO Ragroll WALDO', N'Tên: WALDO
Giới tính: Đực
Giống: mèo Ragdoll
Tuổi: 6 tháng
Thanh toán: tiền mặt hoặc trả góp lãi suất 0%
Vaccine: đã tiêm phòng 1 mũi vaccine
Tẩy giun: đã tẩy giun', 1000000, 'R02')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('KO3', 10, N'MÈO Ragroll BOB ', N'Bob đực 1 tháng tuổi thuộc giống mèo Ragdoll. Khỏe mạnh, đã được tẩy giun và tiêm 1 mũi vaccine phòng bệnh cho bé trước khi về nhà mới', 20000000, 'R03')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH)
	VALUES('KO4', 10, N'MÈO Ragroll LINA', N'Lina cái 5 tháng tuổi thuộc giống mèo Ragdoll. Khỏe mạnh, đã được tẩy giun và tiêm 1 mũi vaccine phòng bệnh cho bé trước khi về nhà mới', 20000000, 'R04')
	
	/*******************PHỤ KIỆN******************************/
			/*************Chuồng, LỒNG,TÚI nuôi thú cưng.*************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('A012',11,N'Túi xách mang thú cưng loại lớn',N'Tác dụng của Túi xách mang thú cưng loại lớn
Túi xách mang thú cưng loại lớn cho chó mèo kiểu dáng phong phú, đa dang. Cũng như có màu sắc đẹp, hấp dẫn thú cưng, chó mèo nhà bạn. Với chất liệu bền và rất chắc chắn.

Sản phẩm này được thiết kế rất thời trang, tiện dụng và bền chác. Với kiểu dang hiện đại dễ phối với đồ mặc của chủ nhân.

Giúp bạn đi đâu cũng có thể mang thú cưng, chó mèo đi bên cạnh mình một cách thoải mái và cực kỳ tiện lợi.

Sản phẩm được sản xuất bằng chất liệu tốt, giúp cho chó mèo, thú cưng thoải mái, không gây dị ứng, kích ứng da dẫn đến mẩn ngứa.

Túi xách tiện dụng cho các bạn trong việc mang thú cưng, chó mèo di chuyển xa. Trên những quãng đường dài.

Giúp giảm căng thẳng cho chó mèo, giúp thú cưng của bạn có cảm giác tự nhiên và thoải mái nhất.

Ngoài ra túi xách thú cưng với thiết kế hình ống như một cái hang, tạo cảm giác an toàn cho thú cưng của bạn.',190000,'AB1')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('A013',11,N'Chuồng chó inox',N'Bạn đang tìm mua chuồng chó inox cho cún cưng của mình? Bạn muốn tham khảo giá bán và các mẫu chuồng chó bằng inox phổ biến nhất? Dưới đây là tất cả những thông tin bạn đang cần!

Phong trào nuôi chó cảnh ở Việt Nam đang ngày một phát triển. Người ta không ngại bỏ ra những khoản tiền lớn để sở hữu những em chó đẹp và hiếm. Và đương nhiên, họ cũng không quản bỏ công sức và thời gian để chăm lo từ việc ăn, ngủ cho tới cả vệ sinh, làm đẹp cho cún cưng.

Trong tất cả những điều này thì việc chọn chuồng lồng để nuôi nhốt chó cảnh là một trong những vấn đề nhận được nhiều sự quan tâm hơn cả. Bởi những người yêu chó đều luôn muốn chó cưng của mình sẽ cảm thấy an toàn và thoải mái nhất có thể.

Cũng vì thế, trên thị trường bán chuồng lồng nuôi nhốt chó hiện nay có rất nhiều loại chuồng chó với đủ mọi kích cỡ, màu sắc và chất liệu khác nhau. Điều này mang đến cho các chủ nuôi chó nhiều lựa chọn nhưng cũng đôi khi khiến họ đau đầu không biết nên chọn loại chuồng nào.',593000,'AB2')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('A014',11,N'Lồng vận chuyển Ferplast – Vali Atlas Professional',N'Tác dụng của lồng vận chuyển Ferplast – Vali Atlas Professional
Vali đạt chuẩn qui định IATA giúp có thể vận chuyển dễ dàng thú cưng khi đi máy bay, tàu thủy hoặc tàu hỏa.

Với thiết kế khóa an toàn, tay cầm tiện lợi cùng với loại nhựa tốt đến từ Ý sẽ tạo sự an toàn nhất cho thú cưng.

Lồng vận chuyển được thiết kế chuyên dụng đáp ứng những nhu cầu khó khăn của các hãng hàng không.

Nên bạn không phải lo lắng đến khả năng chó của mình bị xổng ra ngoài trong chuyến bay nhé.

Kích thước: 81 x 56 x 58',2500000,'AB3')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('A015',11,N'Balo phi hành gia size lớn',N'Tác dụng của Balo phi hành gia size lớn
Sản phẩm được thiết kế mang phong cách thời trang trẻ trung, đẹp và hiện đai.  Tuy vậy nhưng vẫn mang lại cảm giác thoải mái cho thú cưng, chó mèo của bạn. Mặt trước của balo phi hành gia size lớn được sản xuất bằng chất liệu nhựa cứng bóng với những họa tiết vui nhộn, lạ mắt.

Hai bên hông sản phẩm balo phi hành gia size lớn có những lỗ tròn nhỏ thông thoáng. Phần sau lưng sản phẩm được làm bằng vải mềm tạo cảm giác thoải mái.

Mặt trước của ba lô được làm bằng nhựa trong. Giúp cho cún và mèo cưng có không gian thoáng mát. Thoải mái nhìn ngắm ra bên ngoài mà không bị tối tăm, bí bách khi cùng bạn ra ngoài.

Sản phẩm Balo phi hành gia này được thiết kế có dây móc bên trong chắc chắn. Giúp thú cưng, chó mèo ở yên một chỗ khi mở balo phi hành gia.  Đây là thiết kế tuyệt vời ngăn không cho chó mèo, thú cưng tẩu thoát khi vừa mở ba lo ra.

Balo thiết kế 2 quai mang chắc, tiện sử dụng trong việc vận chuyển thú cưng.',410000,'AB4')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('A016',11,N'Petstar – Túi vận chuyển cao su 42*28*30cm',N'',350000,'AB5')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('A017',11,N'Petstar – Túi vận chuyển cao su 32*20*22cm',N'',2500000,'AB6')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('A018',11,N'Túi đeo chéo cho chó mèo',N'Đặc điểm chính
Túi đeo chéo cho chó mèo dành cho chó mèo được làm từ chất liệu tốt, bền, đẹp và chắc chắn. Có nhiều màu sắc ưa nhìn cho bạn chọn lựa.

Túi xách rất tiện lợi, dễ dàng mang bé theo bên cạnh. Bảo vệ bé cưng của bạn khỏi ánh sáng, nắng bụi.

Thiết kế túi xách rất chắc chắn, hiện đại mang phong cách thời trang.

Giúp thú cưng cảm thấy thoải mái, không bị kích ứng da.',653000,'AB7')

			/*************DỤNG CỤ VỆ SINH.*************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('B011',12,N'Khay vệ sinh loại lớn',N'',19,'BA1')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('B012',12,N'Dầu gội trị ve cho chó',N'Dầu gội trị ve cho cún cưng Budle’Budle Flea & Tick Shampoo thuộc dòng sản phẩm dầu gội đặc trị các bệnh về da cho chó. Sự kết hợp độc đáo từ 17 loại thảo dược cổ truyền phương Đông đã được lựa chọn kỹ càng, có tác dụng hiệu quả trong việc đẩy lùi ve và bọ chét, điều trị các bệnh về da do ve rận, giảm thiểu mùi hôi và tái tạo da nổi bật, trả lại cho thú cưng một làn da khỏe mạnh và bộ lông bóng mượt.

Sử dụng cho mọi giống chó và mèo
Dùng cho thú cưng trên 12 tuần tuổi
Thành phần tự nhiên từ y học cổ truyền Phương Đông
Tiêu diệt ve, rận, bọ chét, ký sinh trùng
Diệt lui ve, bọ chét, ký sinh trùng ra khỏi cơ thể vật nuôi
Nhanh chóng làm lành vết thương, phục hồi vùng da bị bệnh
Giảm đau, ngứa rát do ve rận, giúp da thú cưng dịu mát, dễ chịu
Cải thiện tình trạng viêm da, sưng tấy, nhiễm trùng do ve rận',190000,'BA2')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('B013',12,N'Cát vệ sinh cho mèo TRIXIE Silikatstreu 5kg',N'',150000,'BA3')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('B014',12,N'Cát thủy tinh cho mèo Sanicat Silica Diamonds Lavender',N'',411000,'BA4')

			/*************ĐỒ DÙNG.*************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('C011',13,N'Bàn cào móng mèo D4',N'',250000,'CB1')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('C012',13,N'Ferplast Ergofluo – Yếm size 2 (xanh biển)',N'',250000,'CB2')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('C013',13,N'Mũ cho chó mèo AMBABY PET 1JXS071',N'',150000,'CB3')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('C014',13,N'Quần áo cho chó mèo AMBABY PET 2JXF139',N'',250000,'CB4')
		
		/*************THỨC ĂN.*************/
				/*************THỨC ĂN. CHÓ*************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('D011',14,N'Xương cho chó vị thịt bò Vegebrand Meat Beef Bone Large',N'',150000,'DB1')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('D012',14,N'Thức ăn cho chó Morando Miglior Cane Preferiti Adult',N'',350000,'DB2')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('D013',14,N'Thức ăn cho chó Fitmin Mini Performance',N'Thành phần dinh dưỡng
Thức ăn cho chó Fitmin Mini Performance bao gồm nhiều thành phần dinh dưỡng cao. Sản phẩm có thịt gia cầm, gạo, ngô, mỡ gia cầm, cá, trứng gà, nước táo, dầu cá hồi, men bia, natri cacbonat, chiết xuất cây ngọc giá, hỗn hợp chống oxy hóa tự nhiên 0,02%, chiết xuất cây hương thảo 0,01%.

Công dụng sản phẩm Fitmin Mini Performance
Thức ăn cho chó Fitmin Mini Performance với công thức chế biến riêng biệt. Nhằm đảm bảo chất lượng cho các thú cưng khi sử dụng. Chiết xuất từ cây hương thảo hỗ trợ chức năng gan và sự tiêu hóa được dễ dàng. Đặc biệt thành phần từ cây ngọc giá làm giảm mùi hôi của phân. Dễ dàng cho người nuôi thú vệ sinh. Hàm lượng thịt và trứng gà cao hỗ trợ sự phát triển về thể chất vật nuôi. Ngoài ra những đặc điểm về sản phẩm các bạn có thể tham khảo chi tiết trên bao bì mỗi sản phẩm.',234000,'DB3')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('D014',14,N'Thức ăn cho chó Morando Miglior Cane Professional Puppy',N'',630000,'DB4')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('D015',14,N'Thức ăn cho chó Royal Canin Bichon Frise trưởng thành',N'Royal Canin Bichon Frise thức ăn cho chó trưởng thành từ 10 tháng tuổi trở lên.

Thành phần dinh dưỡng
Thức ăn Royal Canin Bichon Frise giúp giải quyết các vấn đề về da thường gặp ở giống chó Bichon. Các bệnh ngoài da khiến da chó Bichon bị khô, lông rụng thành từng mảng. Hoặc lông chó bị xơ, kém bóng mượt.

Thành phần trong thức ăn bao gồm lòng trắng trứng và các vi sinh vật. Giúp nhuận tràng, tốt cho hệ tiêu hóa của chó. Đặc biệt, trong thức ăn có chứa đến 90% protein L.I.P. Hỗ trợ rất tốt cho chó hấp thu dinh dưỡng, cân bằng hệ vi sinh đường ruột, giảm lượng phân và mùi nhẹ hơn. Số lượng lợi khuẩn gia tăng, bảo vệ tốt cho đường ruột tránh khỏi các vi khuẩn có hại.

Thức ăn hạt cho chó Royal Canin Bichon Frise được chế biến theo công thức cực tốt cho da, lông và phòng bệnh sỏi thận ở chó. Giúp những bé Bichon duy trì được sự cân bằng dinh dưỡng và lông chắc khỏe, đẹp hơn. PINCH hợp chất dưỡng da cho chó: Giúp chó có làn da khỏe mạnh, lông không rụng và màu sáng. OMEGA-6: Giúp kích thích làn da tiết chất giữ ẩm, làm mềm và mượt lông.',250000,'DB4')
				/*************THỨC ĂN. CHÓ*************/
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('E011',15,N'Thức ăn cho mèo Earthborn Holistic Wild Sea Catch 2.27kg',N'',550000,'EA1')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('E012',15,N'Thức ăn cho mèo Pro Pac Ultimates Savanna Pride Indoor Formula 2kg',N'',365000,'EA2')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('E013',15,N'Thức ăn cho mèo MEC Wild Taste Limited Ingredient 2kg',N'',435000,'EA3')
INSERT INTO  THONGTIN_PET(MaP, MaDM, TenP, MoTa, Giaban, ANH) 
	VALUES('E014',15,N'Sữa bột Dr.Kyan Precaten cho mèo 400g (hộp sắt)',N'',156000,'EA4')
GO
/**********KHACHHANG********/
INSERT INTO KHACHHANG(MaTK, HoTen,DiachiKH, DienthoaiKH, TenTK, Matkhau, Ngaysinh, Email )
	VALUES ('KH01', N'Hào Côn', N'Quận 6', N'Chưa có', N'user', N'123', CAST(0x0000593100000000 AS DateTime),  N'ghcon@gmail.com')
INSERT INTO KHACHHANG(MaTK, HoTen,DiachiKH, DienthoaiKH, TenTK, Matkhau, Ngaysinh, Email)
	VALUES ('KH02', N'Nguyễn Thành Danh', N'Cộng Hòa', N'8103751', N'ntdanh', N'danh', CAST(0x0000593100000000 AS DateTime),  N'thdanh.edu.vn')
INSERT INTO KHACHHANG(MaTK, HoTen,DiachiKH, DienthoaiKH, TenTK, Matkhau, Ngaysinh, Email)
	VALUES ('KH05', N'Lê Doanh Doanh', N'2Bis Hùng Vương', N'07077865', N'lddoanh', N'doanh', CAST(0x0000593100000000 AS DateTime),  N'')
INSERT INTO KHACHHANG(MaTK, HoTen,DiachiKH, DienthoaiKH, TenTK, Matkhau, Ngaysinh, Email)
	VALUES ('KH11', N'Đòan Ngọc Minh Tâm', N'2 Đinh Tiên Hòang', N'0909092222', N'dnmtam', N'tam', CAST(0x0000593100000000 AS DateTime),  N'')
INSERT INTO KHACHHANG(MaTK, HoTen,DiachiKH, DienthoaiKH, TenTK, Matkhau, Ngaysinh, Email)
	VALUES ('KH23',  N'Phạm Văn Khoa', N'Trần Huy Liệu', N'0918062755', N'pvkhoa', N'', CAST(0x0000593100000000 AS DateTime),  N'')
go
 
 /**********DANG NHAP********/
 INSERT INTO DANGNHAP(tenDN, pass) VALUES ('admin','123')
 GO

 /********ĐƠN DẶT HÀNG********/
 INSERT INTO DON_DAT_HANG ( MaDH, MaTK, Ngaydat, Ngaygiao, ThanhToan)
	VALUES ('DH01','KH05', CAST(0x0000593100000000 AS DateTime), CAST(0x0000593100000000 AS DateTime), 0)
GO
	/******** CT_ĐƠN DẶT HÀNG********/
INSERT INTO CT_DAT_HANG (MaDH, MaP, SoLuong, DonGia)
	values('DH01', 'AO3',1, '9000000' )
INSERT INTO CT_DAT_HANG (MaDH, MaP, SoLuong, DonGia)
	values('DH01', 'B013',1, '1000000' )
INSERT INTO CT_DAT_HANG (MaDH, MaP, SoLuong, DonGia)
	values('DH01', 'D011',1, '500000' )
GO