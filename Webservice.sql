USE [master]
GO
/****** Object:  Database [webService]    Script Date: 1/7/2019 8:25:08 PM ******/
CREATE DATABASE [webService]
GO
USE [webService]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 1/7/2019 8:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccNo] [nvarchar](30) NULL,
	[AccName] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[AvailableBalance] [float] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Merchant]    Script Date: 1/7/2019 8:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchant](
	[MerchantId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantName] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[AccountId] [int] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Merchant] PRIMARY KEY CLUSTERED 
(
	[MerchantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TransachtionBank]    Script Date: 1/7/2019 8:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransachtionBank](
	[TransachtionId] [int] IDENTITY(1,1) NOT NULL,
	[MerchantId] [int] NULL,
	[AccountId] [int] NULL,
	[BalancePayment] [float] NULL,
	[PaymentDate] [date] NULL,
	[Description] [ntext] NULL,
	[Status] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

GO
INSERT [dbo].[Account] ([AccountId], [AccNo], [AccName], [CreatedDate], [AvailableBalance], [Status]) VALUES (1, N'ACC001001', N'QuanAo', CAST(N'2012-04-04' AS Date), 21740000, 1)
GO
INSERT [dbo].[Account] ([AccountId], [AccNo], [AccName], [CreatedDate], [AvailableBalance], [Status]) VALUES (2, N'ACC001002', N'RauSach', CAST(N'2013-09-09' AS Date), 3000, 1)
GO
INSERT [dbo].[Account] ([AccountId], [AccNo], [AccName], [CreatedDate], [AvailableBalance], [Status]) VALUES (3, N'ACC001003', N'Tuyen', CAST(N'2016-02-02' AS Date), 38260000, 1)
GO
INSERT [dbo].[Account] ([AccountId], [AccNo], [AccName], [CreatedDate], [AvailableBalance], [Status]) VALUES (4, N'ACC001004', N'Nhan', CAST(N'2016-04-04' AS Date), 10000, 1)
GO
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Merchant] ON 

GO
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [CreatedDate], [AccountId], [Status]) VALUES (1, N'WebQuanAo', CAST(N'2014-04-05' AS Date), 1, 1)
GO
INSERT [dbo].[Merchant] ([MerchantId], [MerchantName], [CreatedDate], [AccountId], [Status]) VALUES (2, N'WebRauSach', CAST(N'2016-05-05' AS Date), 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Merchant] OFF
GO
SET IDENTITY_INSERT [dbo].[TransachtionBank] ON 

GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (1, 1, 2, 10000, CAST(N'2017-03-29' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (2, 2, 3, 10000, CAST(N'2017-06-14' AS Date), N'Thanh toan cho trang web quan ao', 0)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (3, 2, 3, 10000, CAST(N'2017-06-16' AS Date), N'Thanh toan cho trang web quan ao', 0)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (4, 2, 3, 1000, CAST(N'2017-06-16' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (8, 2, 3, 2000000, CAST(N'2017-06-29' AS Date), N'Thanh toan cho trang web quan ao', 0)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (11, 2, 3, 1260000, CAST(N'2017-06-29' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (12, 2, 3, 1500000, CAST(N'2017-08-03' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (13, 2, 3, 100000, CAST(N'2017-08-04' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (14, 2, 3, 1680000, CAST(N'2017-08-04' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (15, 2, 3, 280000, CAST(N'2017-08-05' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (20, 2, 3, 450000, CAST(N'2017-08-08' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (1020, 2, 3, 700000, CAST(N'2017-08-09' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (1021, 2, 3, 630000, CAST(N'2017-08-09' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (1022, 2, 3, 400000, CAST(N'2017-08-09' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (1023, 2, 3, 350000, CAST(N'2017-08-10' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (1026, 1, 3, 500000, CAST(N'2017-08-10' AS Date), N'Thanh toan cho trang web quan ao', 0)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (1027, 1, 3, 630000, CAST(N'2017-08-10' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (5, 2, 3, 10000, CAST(N'2017-06-16' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (6, 2, 3, 450, CAST(N'2017-06-17' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (1024, 2, 3, 560000, CAST(N'2017-08-10' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (7, 2, 3, 630, CAST(N'2017-06-17' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (9, 2, 3, 3000, CAST(N'2017-06-29' AS Date), N'Thanh toan cho trang web quan ao', 0)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (10, 2, 3, 960000, CAST(N'2017-06-29' AS Date), N'Thanh toan cho trang web camera', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (16, 2, 3, 90000, CAST(N'2017-08-05' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (17, 2, 3, 200000, CAST(N'2017-08-05' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (18, 2, 3, 200000, CAST(N'2017-08-05' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (19, 2, 3, 1700000, CAST(N'2017-08-05' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (1025, 2, 3, 500000, CAST(N'2017-08-10' AS Date), N'Thanh toan cho trang web quan ao', 0)
GO
INSERT [dbo].[TransachtionBank] ([TransachtionId], [MerchantId], [AccountId], [BalancePayment], [PaymentDate], [Description], [Status]) VALUES (1028, 1, 3, 50000, CAST(N'2017-08-10' AS Date), N'Thanh toan cho trang web quan ao', 1)
GO
SET IDENTITY_INSERT [dbo].[TransachtionBank] OFF
GO
/****** Object:  StoredProcedure [dbo].[CheckOrder]    Script Date: 1/7/2019 8:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CheckOrder]
@merchantName nvarchar(50),
@accNo nvarchar(30),
@accountName nvarchar(50),
@paymentAmount float,
@returncode char(2) output,
@transactionId int output
as
begin
Declare @checkMerchant int;
Declare @merchantId int;
Declare @accountId int;
Select @checkMerchant = count(*) from Merchant m where m.MerchantName = @merchantName and m.Status = 1;
if @checkMerchant > 0
	begin
		select @merchantId = m.MerchantId from Merchant m where m.MerchantName = @merchantName and m.Status = 1;
		Declare @checkAcc int;
		--kiem tra tai khoan co ton tai
		Select @checkAcc = count(*) from Account a where a.AccName = @accountName and a.AccNo = @accNo and a.Status = 1;
		if @checkAcc > 0
			begin
			--tai khoan ton tai kiem tra so du trong tai khoan
			Select @accountId = a.AccountId from Account a where a.AccName = @accountName and a.AccNo = @accNo and a.Status = 1;
			--kiem tra so du kha dung
			Declare @checkAvaillableBalance int;
			select @checkAvaillableBalance = count(*) from Account a where a.AccountId = @accountId and a.AvailableBalance > @paymentAmount;
			if @checkAvaillableBalance > 0
				set @returncode = '00';

			else
				set @returncode ='03';
			end
	   	else
		set @returncode='02';
	end
else
	set @returncode ='01';
		-- neu dieu kien thoa man tao ban ghi trong transaction
	if @returncode ='00'
		begin
			insert into TransachtionBank
			values(@merchantId,@accountId,@paymentAmount,GETDATE(),N'Thanh toan cho trang web quan ao',0);
			Commit;
			Declare @maxTrans int;
			select @maxTrans = max(t.TransachtionId) from TransachtionBank t;
			set @transactionId = @maxTrans;
		end
	else
		set @transactionId = 0;
end
GO
/****** Object:  StoredProcedure [dbo].[FinishOrder]    Script Date: 1/7/2019 8:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FinishOrder]
@transactionId int,
@merchantName nvarchar(50),
@returnCode char(2) output
as
begin
--kiem tra co transaction khong
Declare @checkTransaction int;
Declare @accountIdKH int;
Declare @accountIdWEb int;
--lay tai khoan trang web 
select @accountIdWEb = m.AccountId from Merchant m where m.MerchantName = @merchantName;
Declare @paymentAmount float;
select @checkTransaction = count(*) from TransachtionBank t where t.TransachtionId = @transactionId;
if @checkTransaction > 0
    begin
		Select @paymentAmount = t.BalancePayment from TransachtionBank t where t.TransachtionId = @transactionId;
		select @accountIdKH = t.AccountId from TransachtionBank t where t.TransachtionId = @transactionId;
		-- kiem tra so du co kha dung
		Declare @checkSDKD int;
		select @checkSDKD = count(*) from Account a where a.AccountId = @accountIdKH and a.AvailableBalance > @paymentAmount;
		if @checkSDKD >0
			begin
					-- cong vao so du tai khoan web
					Declare @mountWeb float;
					Declare @updateWeb float;
					Select @mountWeb = a.AvailableBalance from Account a where a.AccountId = @accountIdWEb;
					Set @updateWeb = @mountWeb + @paymentAmount
					update Account 
					set AvailableBalance = @updateWeb
					where AccountId = @accountIdWEb;
					-- tru vao so du tai khoan
					Declare @amountKH float;
					Declare @updateKH float;
					select @amountKH = a.AvailableBalance from Account a where a.AccountId = @accountIdKH;
					set @updateKH = @amountKH - @paymentAmount;
					update Account
					set AvailableBalance = @updateKH
					where AccountId = @accountIdKH
					--cap nhat trang thai cua transachtion
					update TransachtionBank 
					set Status = 1
					where TransachtionId = @transactionId;
					--tra ve returncode
					set @returnCode ='00';
					end
					else
					-- so du khong du de thanh toan
					set @returnCode = '02';
			
			end
		else
			--khong ton tai transachtion
			set @returnCode ='01';
	end
GO
/****** Object:  StoredProcedure [dbo].[getAllAccount]    Script Date: 1/7/2019 8:25:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getAllAccount]
as
begin
Select * from Account where Status = 'True'
end
GO
/****** Object:  StoredProcedure [dbo].[getProductNew]    Script Date: 1/7/2019 8:25:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getTotalOrder]    Script Date: 1/7/2019 8:25:08 PM ******/
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
/****** Object:  StoredProcedure [dbo].[getTotalUser]    Script Date: 1/7/2019 8:25:08 PM ******/
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
USE [master]
GO
ALTER DATABASE [webService] SET  READ_WRITE 
GO
