USE [master]
GO
/****** Object:  Database [MMRMS]    Script Date: 12/20/2024 11:43:59 AM ******/
CREATE DATABASE [MMRMS]
GO

USE [MMRMS]
GO
/****** Object:  Schema [HangFire]    Script Date: 12/20/2024 11:43:59 AM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AvatarImg] [nvarchar](255) NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[DateBirth] [datetime2](7) NULL,
	[Gender] [int] NULL,
	[Username] [nvarchar](100) NULL,
	[PasswordHash] [varbinary](max) NULL,
	[PasswordSalt] [varbinary](max) NULL,
	[OtpNumber] [nvarchar](10) NULL,
	[FirebaseMessageToken] [nvarchar](max) NULL,
	[TokenRefresh] [nvarchar](max) NULL,
	[TokenDateExpire] [datetime2](7) NULL,
	[MembershipRankId] [int] NULL,
	[MoneySpent] [float] NULL,
	[DateCreate] [datetime2](7) NULL,
	[DateExpire] [datetime2](7) NULL,
	[RoleId] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[IsDelete] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountBusiness]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountBusiness](
	[AccountBusinessId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[Company] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[Position] [nvarchar](255) NULL,
	[TaxNumber] [nvarchar](100) NULL,
 CONSTRAINT [PK_AccountBusiness] PRIMARY KEY CLUSTERED 
(
	[AccountBusinessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[AddressBody] [nvarchar](500) NULL,
	[District] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Coordinates] [nvarchar](100) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NULL,
	[DateCreate] [datetime2](7) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Component]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Component](
	[ComponentId] [int] IDENTITY(1,1) NOT NULL,
	[ComponentName] [nvarchar](100) NULL,
	[AvailableQuantity] [int] NULL,
	[Price] [float] NULL,
	[DateCreate] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
	[QuantityOnHold] [int] NULL,
 CONSTRAINT [PK_Component] PRIMARY KEY CLUSTERED 
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentReplacementTicket]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentReplacementTicket](
	[ComponentReplacementTicketId] [nvarchar](100) NOT NULL,
	[EmployeeCreateId] [int] NULL,
	[MachineTaskCreateId] [int] NULL,
	[ContractId] [nvarchar](100) NULL,
	[ComponentId] [int] NULL,
	[InvoiceId] [nvarchar](100) NULL,
	[MachineSerialNumberComponentId] [int] NULL,
	[ComponentPrice] [float] NULL,
	[AdditionalFee] [float] NULL,
	[TotalAmount] [float] NULL,
	[Quantity] [int] NULL,
	[DateCreate] [datetime2](7) NULL,
	[DateRepair] [datetime2](7) NULL,
	[Type] [nvarchar](100) NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_ComponentReplacementTicket] PRIMARY KEY CLUSTERED 
(
	[ComponentReplacementTicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentReplacementTicketLog]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentReplacementTicketLog](
	[ComponentReplacementTicketLogId] [int] IDENTITY(1,1) NOT NULL,
	[ComponentReplacementTicketId] [nvarchar](100) NULL,
	[AccountTriggerId] [int] NULL,
	[Action] [nvarchar](255) NULL,
	[DateCreate] [datetime2](7) NULL,
 CONSTRAINT [PK_ComponentReplacementTicketLog] PRIMARY KEY CLUSTERED 
(
	[ComponentReplacementTicketLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content](
	[ContentId] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](255) NULL,
	[Summary] [nvarchar](max) NULL,
	[ContentBody] [nvarchar](max) NULL,
	[Title] [nvarchar](255) NULL,
	[DateCreate] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
	[AccountId] [int] NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contract]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contract](
	[ContractId] [nvarchar](100) NOT NULL,
	[ContractName] [nvarchar](100) NULL,
	[AccountSignId] [int] NULL,
	[RentingRequestId] [nvarchar](100) NOT NULL,
	[RentPrice] [float] NULL,
	[DepositPrice] [float] NULL,
	[RentPeriod] [int] NULL,
	[TotalRentPrice] [float] NULL,
	[Content] [nvarchar](max) NULL,
	[RefundShippingPrice] [float] NULL,
	[DateCreate] [datetime2](7) NULL,
	[DateSign] [datetime2](7) NULL,
	[DateStart] [datetime2](7) NULL,
	[DateEnd] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
	[SerialNumber] [nvarchar](100) NOT NULL,
	[BaseContractId] [nvarchar](100) NULL,
	[IsExtended] [bit] NULL,
 CONSTRAINT [PK_Contract] PRIMARY KEY CLUSTERED 
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractDelivery]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractDelivery](
	[ContractDeliveryId] [int] IDENTITY(1,1) NOT NULL,
	[ContractId] [nvarchar](100) NULL,
	[DeliveryTaskId] [int] NULL,
	[PictureUrl] [nvarchar](100) NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_ContractDelivery] PRIMARY KEY CLUSTERED 
(
	[ContractDeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractPayment]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractPayment](
	[ContractPaymentId] [int] IDENTITY(1,1) NOT NULL,
	[ContractId] [nvarchar](100) NULL,
	[InvoiceId] [nvarchar](100) NULL,
	[Title] [nvarchar](max) NULL,
	[Amount] [float] NULL,
	[CustomerPaidDate] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
	[Type] [nvarchar](100) NULL,
	[DateFrom] [datetime2](7) NULL,
	[DateTo] [datetime2](7) NULL,
	[Period] [int] NULL,
	[DateCreate] [datetime2](7) NULL,
	[DueDate] [datetime2](7) NULL,
	[IsFirstRentalPayment] [bit] NULL,
 CONSTRAINT [PK_ContractPayment] PRIMARY KEY CLUSTERED 
(
	[ContractPaymentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContractTerm]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContractTerm](
	[ContractTermId] [int] IDENTITY(1,1) NOT NULL,
	[ContractId] [nvarchar](100) NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[DateCreate] [datetime2](7) NULL,
 CONSTRAINT [PK_ContractTerm] PRIMARY KEY CLUSTERED 
(
	[ContractTermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryTask]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryTask](
	[DeliveryTaskId] [int] IDENTITY(1,1) NOT NULL,
	[StaffId] [int] NULL,
	[ManagerId] [int] NULL,
	[DateShip] [datetime2](7) NULL,
	[DateCreate] [datetime2](7) NULL,
	[DateCompleted] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[ConfirmationPictureUrl] [nvarchar](255) NULL,
	[ReceiverName] [nvarchar](100) NULL,
	[DeliveryVehicleCounter] [int] NULL,
 CONSTRAINT [PK_DeliveryTask] PRIMARY KEY CLUSTERED 
(
	[DeliveryTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryTaskLog]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryTaskLog](
	[DeliveryTaskLogId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryTaskId] [int] NULL,
	[AccountTriggerId] [int] NULL,
	[Action] [nvarchar](255) NULL,
	[DateCreate] [datetime2](7) NULL,
 CONSTRAINT [PK_DeliveryTaskLog] PRIMARY KEY CLUSTERED 
(
	[DeliveryTaskLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DigitalTransactions]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DigitalTransactions](
	[DigitalTransactionId] [nvarchar](100) NOT NULL,
	[InvoiceId] [nvarchar](100) NULL,
	[AccountNumber] [nvarchar](100) NULL,
	[AccountName] [nvarchar](100) NULL,
	[BankCode] [nvarchar](100) NULL,
	[BankName] [nvarchar](100) NULL,
	[Amount] [float] NULL,
	[Description] [nvarchar](max) NULL,
	[TransactionDate] [datetime2](7) NULL,
	[PayOsOrderId] [nvarchar](100) NULL,
 CONSTRAINT [PK_DigitalTransactions] PRIMARY KEY CLUSTERED 
(
	[DigitalTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoices]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoices](
	[InvoiceId] [nvarchar](100) NOT NULL,
	[AccountPaidId] [int] NULL,
	[ComponentReplacementTicketId] [nvarchar](100) NULL,
	[DigitalTransactionId] [nvarchar](100) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[Amount] [float] NULL,
	[DateCreate] [datetime2](7) NULL,
	[DatePaid] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
	[Type] [nvarchar](100) NULL,
	[Note] [nvarchar](max) NULL,
	[PayOsOrderId] [nvarchar](100) NULL,
	[PaymentConfirmationUrl] [nvarchar](255) NULL,
 CONSTRAINT [PK_Invoices] PRIMARY KEY CLUSTERED 
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogDetail]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogDetail](
	[LogDetailId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[Action] [nvarchar](255) NULL,
	[DateCreate] [datetime2](7) NULL,
 CONSTRAINT [PK_LogDetail] PRIMARY KEY CLUSTERED 
(
	[LogDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Machine]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Machine](
	[MachineId] [int] IDENTITY(1,1) NOT NULL,
	[MachineName] [nvarchar](255) NULL,
	[RentPrice] [float] NULL,
	[Weight] [float] NULL,
	[MachinePrice] [float] NULL,
	[Model] [nvarchar](100) NULL,
	[Origin] [nvarchar](100) NULL,
	[CategoryId] [int] NULL,
	[Description] [nvarchar](max) NULL,
	[DateCreate] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Machine] PRIMARY KEY CLUSTERED 
(
	[MachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineAttribute]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineAttribute](
	[MachineAttributeId] [int] IDENTITY(1,1) NOT NULL,
	[MachineId] [int] NULL,
	[AttributeName] [nvarchar](100) NULL,
	[Specifications] [nvarchar](255) NULL,
	[Unit] [nvarchar](max) NULL,
 CONSTRAINT [PK_MachineAttribute] PRIMARY KEY CLUSTERED 
(
	[MachineAttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineCheckCriteria]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineCheckCriteria](
	[MachineCheckCriteriaId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_MachineCheckCriteria] PRIMARY KEY CLUSTERED 
(
	[MachineCheckCriteriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineCheckRequest]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineCheckRequest](
	[MachineCheckRequestId] [nvarchar](100) NOT NULL,
	[ContractId] [nvarchar](100) NULL,
	[MachineTaskId] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[DateCreate] [datetime2](7) NULL,
 CONSTRAINT [PK_MachineCheckRequest] PRIMARY KEY CLUSTERED 
(
	[MachineCheckRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineCheckRequestCriteria]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineCheckRequestCriteria](
	[MachineCheckRequestCriteriaId] [int] IDENTITY(1,1) NOT NULL,
	[MachineCheckRequestId] [nvarchar](100) NULL,
	[CriteriaName] [nvarchar](100) NULL,
	[CustomerNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_MachineCheckRequestCriteria] PRIMARY KEY CLUSTERED 
(
	[MachineCheckRequestCriteriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineComponent]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineComponent](
	[MachineComponentId] [int] IDENTITY(1,1) NOT NULL,
	[MachineId] [int] NULL,
	[ComponentId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_MachineComponent] PRIMARY KEY CLUSTERED 
(
	[MachineComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineImage]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineImage](
	[MachineImageId] [int] IDENTITY(1,1) NOT NULL,
	[MachineId] [int] NULL,
	[MachineImageUrl] [nvarchar](255) NULL,
	[IsThumbnail] [bit] NULL,
 CONSTRAINT [PK_MachineImage] PRIMARY KEY CLUSTERED 
(
	[MachineImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineSerialNumber]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineSerialNumber](
	[SerialNumber] [nvarchar](100) NOT NULL,
	[MachineId] [int] NULL,
	[ActualRentPrice] [float] NULL,
	[MachineConditionPercent] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[DateCreate] [datetime2](7) NULL,
	[ExpectedAvailableDate] [datetime2](7) NULL,
	[RentDaysCounter] [int] NULL,
 CONSTRAINT [PK_MachineSerialNumber] PRIMARY KEY CLUSTERED 
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineSerialNumberComponent]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineSerialNumberComponent](
	[MachineSerialNumberComponentId] [int] IDENTITY(1,1) NOT NULL,
	[SerialNumber] [nvarchar](100) NULL,
	[MachineComponentId] [int] NULL,
	[Quantity] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[DateModified] [datetime2](7) NULL,
 CONSTRAINT [PK_MachineSerialNumberComponent] PRIMARY KEY CLUSTERED 
(
	[MachineSerialNumberComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineSerialNumberLog]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineSerialNumberLog](
	[MachineSerialNumberLogId] [int] IDENTITY(1,1) NOT NULL,
	[SerialNumber] [nvarchar](100) NULL,
	[MachineSerialNumberComponentId] [int] NULL,
	[AccountTriggerId] [int] NULL,
	[Type] [nvarchar](100) NULL,
	[DateCreate] [datetime2](7) NULL,
	[Action] [nvarchar](255) NULL,
 CONSTRAINT [PK_MachineSerialNumberLog] PRIMARY KEY CLUSTERED 
(
	[MachineSerialNumberLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineTask]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineTask](
	[MachineTaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskTitle] [nvarchar](100) NULL,
	[ContractId] [nvarchar](100) NULL,
	[MachineCheckRequestId] [nvarchar](100) NULL,
	[Content] [nvarchar](max) NULL,
	[StaffId] [int] NULL,
	[ManagerId] [int] NULL,
	[DateStart] [datetime2](7) NULL,
	[DateCreate] [datetime2](7) NULL,
	[DateCompleted] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
	[Note] [nvarchar](max) NULL,
	[Type] [nvarchar](100) NULL,
	[ConfirmationPictureUrl] [nvarchar](255) NULL,
 CONSTRAINT [PK_MachineTask] PRIMARY KEY CLUSTERED 
(
	[MachineTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineTaskLog]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineTaskLog](
	[MachineTaskLogId] [int] IDENTITY(1,1) NOT NULL,
	[MachineTaskId] [int] NULL,
	[AccountTriggerId] [int] NULL,
	[Action] [nvarchar](max) NULL,
	[DateCreate] [datetime2](7) NULL,
 CONSTRAINT [PK_MachineTaskLog] PRIMARY KEY CLUSTERED 
(
	[MachineTaskLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MachineTerm]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineTerm](
	[MachineTermId] [int] IDENTITY(1,1) NOT NULL,
	[MachineId] [int] NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_MachineTerm] PRIMARY KEY CLUSTERED 
(
	[MachineTermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipRank]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipRank](
	[MembershipRankId] [int] IDENTITY(1,1) NOT NULL,
	[MembershipRankName] [nvarchar](100) NULL,
	[MoneySpent] [float] NULL,
	[DiscountPercentage] [float] NULL,
	[Content] [nvarchar](max) NULL,
	[DateCreate] [datetime2](7) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_MembershipRank] PRIMARY KEY CLUSTERED 
(
	[MembershipRankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipRankLog]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipRankLog](
	[MembershipRankLogId] [int] IDENTITY(1,1) NOT NULL,
	[MembershipRankId] [int] NULL,
	[AccountId] [int] NULL,
	[Action] [nvarchar](255) NULL,
	[DateCreate] [datetime2](7) NULL,
 CONSTRAINT [PK_MembershipRankLog] PRIMARY KEY CLUSTERED 
(
	[MembershipRankLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [int] IDENTITY(1,1) NOT NULL,
	[AccountReceiveId] [int] NULL,
	[NotificationType] [nvarchar](100) NULL,
	[NotificationTitle] [nvarchar](100) NULL,
	[MessageNotification] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[DateCreate] [datetime2](7) NULL,
	[DateRead] [datetime2](7) NULL,
	[DetailId] [nvarchar](100) NULL,
	[DetailIdName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentingRequest]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentingRequest](
	[RentingRequestId] [nvarchar](100) NOT NULL,
	[AccountOrderId] [int] NULL,
	[DateCreate] [datetime2](7) NULL,
	[TotalRentPrice] [float] NULL,
	[TotalDepositPrice] [float] NULL,
	[TotalServicePrice] [float] NULL,
	[ShippingPrice] [float] NULL,
	[DiscountPrice] [float] NULL,
	[TotalAmount] [float] NULL,
	[IsOnetimePayment] [bit] NULL,
	[Note] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[AccountNumber] [nvarchar](100) NULL,
	[BeneficiaryBank] [nvarchar](100) NULL,
	[BeneficiaryName] [nvarchar](100) NULL,
	[ShippingDistance] [float] NULL,
	[ShippingPricePerKm] [float] NULL,
 CONSTRAINT [PK_RentingRequest] PRIMARY KEY CLUSTERED 
(
	[RentingRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentingRequestAddress]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentingRequestAddress](
	[RentingRequestId] [nvarchar](100) NOT NULL,
	[AddressBody] [nvarchar](500) NULL,
	[District] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Coordinates] [nvarchar](100) NULL,
 CONSTRAINT [PK_RentingRequestAddress] PRIMARY KEY CLUSTERED 
(
	[RentingRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentingService]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentingService](
	[RentingServiceId] [int] IDENTITY(1,1) NOT NULL,
	[RentingServiceName] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NULL,
	[IsOptional] [bit] NULL,
 CONSTRAINT [PK_RentingService] PRIMARY KEY CLUSTERED 
(
	[RentingServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceRentingRequest]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceRentingRequest](
	[ServiceRentingRequestId] [int] IDENTITY(1,1) NOT NULL,
	[RentingServiceId] [int] NULL,
	[RentingRequestId] [nvarchar](100) NULL,
	[ServicePrice] [float] NULL,
 CONSTRAINT [PK_ServiceRentingRequest] PRIMARY KEY CLUSTERED 
(
	[ServiceRentingRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Term]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Term](
	[TermId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NULL,
	[Title] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
 CONSTRAINT [PK_Term] PRIMARY KEY CLUSTERED 
(
	[TermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 12/20/2024 11:43:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241203071226_init', N'8.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241203081945_updateAccount', N'8.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241211021205_addPaymentConfirmationUrlToTableInvoice', N'8.0.5')
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (1, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Nguyễn Anh Tú', N'trivm182003@gmail.com', N'0798078551', CAST(N'2024-07-02T01:00:00.0000000' AS DateTime2), 2, NULL, 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, N'476256', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2024-08-15T20:09:37.7150000' AS DateTime2), NULL, 4, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (2, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Nguyên Cần', N'nguyencan123@gmail.com', N'0909601346', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), 1, N'nguyencanqn123', 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, NULL, N'ftK14At2i04zz-sCcs5cg3:APA91bGHPNUoNL63gkvOru-wNFUcGa8wsSXX6jTYg2_jW1fA0KUGGJyuvZN3T3X5JMgB62kJMLXtVPcJIMPaBCnH-_drFZeObb7Veuf-8cNlaaoYkunL3nA', N'GMwfcNZlchSiv3JTO0ComBvs11huBoy1D9D7V2MzZNA=', CAST(N'2024-12-27T04:39:21.7060367' AS DateTime2), NULL, NULL, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), CAST(N'2025-11-29T17:00:00.0000000' AS DateTime2), 1, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (3, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1733908424/fc7ebavcr8x1q4bvjheb.png', N'Nguyen Van Hoang Minh', N'ngminh3004@gmail.com', N'0964715877', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), 1, N'hoangminhng', 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, NULL, NULL, N'fcSz7s5CEatk+BRXpxMrBblkIDFtHZBt1SNo7+vT5Gk=', CAST(N'2024-12-25T12:49:45.5577482' AS DateTime2), NULL, NULL, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), CAST(N'2025-01-30T17:00:00.0000000' AS DateTime2), 3, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (4, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Võ Đức Nguyên', N'nguyennmse17@fpt.edu.vn', N'0775030455', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), 1, N'TriDT123', 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, NULL, NULL, N'F3j6M2MIY4MyxwS3CY18Mh9y7F6A9UN0G1BNUW4ZNNQ=', CAST(N'2024-12-21T02:21:33.9408748' AS DateTime2), NULL, NULL, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), CAST(N'2025-11-29T17:00:00.0000000' AS DateTime2), 2, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (5, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Khoa', N'khoamanager@yopmail.com', N'0123456789', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), 1, N'khoamanager', 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, NULL, N'ftK14At2i04zz-sCcs5cg3:APA91bHvDCENH-kRCv_f4IpES5AteMcp18ULdI5tjsYir0djjJSS857ICCjzJxJzGog9kVVLPoCqyiqGcGb5CGBrIrj2_8la1x6WN48kWC36QcZSqZXRVSg', N'eRPpasdCFT3hwRHc7rvLO/+WE+7jY5/NSwjSxNx5cUg=', CAST(N'2024-12-25T13:13:11.5613519' AS DateTime2), NULL, NULL, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), CAST(N'2025-11-07T17:00:00.0000000' AS DateTime2), 1, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (6, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Khoa Nhân Viên', N'khoawebstaff@yopmail.com', N'0881144550', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), 1, N'khoawebstaff', 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, NULL, NULL, N'r/93FSgpk7kyny6wJkoylkj1hjhR/fqjkeNLXulvLAU=', CAST(N'2024-12-20T12:13:01.3963745' AS DateTime2), NULL, NULL, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), CAST(N'2025-11-07T17:00:00.0000000' AS DateTime2), 3, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (7, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Khoa Kĩ Thuật', N'Khoa Kĩ Thuật@yopmail.com', N'0123456789', CAST(N'2001-01-01T00:00:00.0000000' AS DateTime2), 1, N'Khoa Kĩ Thuật', 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, NULL, NULL, N'LFQlWRb9VagUa5kPnwKuockLAqxC3h/Ehs6Yh2MQ3+Q=', CAST(N'2024-12-22T09:16:37.2124928' AS DateTime2), NULL, NULL, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), CAST(N'2025-11-07T17:00:00.0000000' AS DateTime2), 2, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (8, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Đăng Khoa', N'khoa@yopmail.com', N'0192887465', CAST(N'2004-11-13T10:00:00.0000000' AS DateTime2), 1, NULL, 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, N'453999', N'cKAvnOTXuy8Hc_uTlEl-He:APA91bEb2Du_5RERttVKpwkoLozE0lLYcISER-cuwESJDPTtWChwAEGiIVaSDYUZ9TGizjpHnmt96Y5QQJGbqgL6dWYC8i_v_3-JHyOzgSxXYeHr7xwjgW8', N'7rP4lZr4yL+sx1yHDWHhZ32TVrz6lR/9EREq7EmGESY=', CAST(N'2024-12-23T03:12:09.4533511' AS DateTime2), 6, 472121000, CAST(N'2024-11-02T20:09:37.7150000' AS DateTime2), NULL, 4, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (9, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Tuấn Trần', N'nguyen123@gmail.com', N'0123123122', CAST(N'2004-11-06T03:00:00.0000000' AS DateTime2), 1, NULL, 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, N'865816', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 6, 4502021700, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), NULL, 4, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (10, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Nguyễn Minh Hoàng', N'nguyencanqn@gmail.com', N'0976564739', CAST(N'2000-03-07T17:00:00.0000000' AS DateTime2), 1, NULL, 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, N'954896', NULL, NULL, NULL, 1, 0, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), NULL, 4, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (11, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Nguyễn Hoàng Long', N'nguyennmse1721@fpt.edu.vn', N'0463748364', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'longhn123', 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, NULL, N'fLSZMRgWTNuxG1012sd4PF:APA91bEMeBKvjsYIgwhc080X2kCn1JZyAFuxfc9wqYXlFEXT-AZf1XiZsn5m_KYdFXDZ5itPDBCxg9dQLTVKMUjC2r0XcSKgqRY7vKyKVZ1zK1jeZeWyq-8', N'xSaR7ie/zNZquARgYRqhfGUw52//Qw45AUorFWR1RGo=', CAST(N'2024-12-23T02:08:47.9680389' AS DateTime2), NULL, NULL, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), CAST(N'2025-11-29T17:00:00.0000000' AS DateTime2), 2, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (14, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Hoàng Viết Nam', N'nguyencanqn123@gmail.com', N'0775030435', CAST(N'2000-01-11T17:00:00.0000000' AS DateTime2), 1, NULL, 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, N'581200', NULL, N'H/0+iEzKNWcrttESvGgWFFHObhvD116kx335q39KVPU=', CAST(N'2024-12-01T01:36:14.4166933' AS DateTime2), 1, 0, CAST(N'2024-07-01T20:09:37.7150000' AS DateTime2), NULL, 4, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (15, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Trần Anh Lâm', N'lam@yopmail.com', N'0798645213', CAST(N'2004-11-24T13:24:00.0000000' AS DateTime2), 1, NULL, 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, N'612397', NULL, NULL, NULL, 1, 0, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), NULL, 4, N'Inactive', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (16, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Trần Minh Quang', N'quang@yopmail.com', N'0494744561', CAST(N'2000-01-07T17:00:00.0000000' AS DateTime2), 1, NULL, 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, N'309879', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 0, CAST(N'2024-07-20T20:09:37.7150000' AS DateTime2), NULL, 4, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (17, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Nguyễn Hoàng Nam', N'nam@yopmail.com', N'0895747784', CAST(N'2001-09-22T17:00:00.0000000' AS DateTime2), 1, NULL, 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, N'165314', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 6, 683250600, CAST(N'2024-08-28T20:09:37.7150000' AS DateTime2), NULL, 4, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (19, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Nguyễn Hoàng', N'hoang@yopmail.com', N'0210963425', CAST(N'1998-11-03T17:00:00.0000000' AS DateTime2), 1, NULL, 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, N'203170', NULL, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 6, 808577800, CAST(N'2024-10-14T20:09:37.7150000' AS DateTime2), NULL, 4, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (20, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Đinh Hoàng Thái', N'thaihoang123@gmail.com', N'0945675848', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'thaihoang123', 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, NULL, N'fLSZMRgWTNuxG1012sd4PF:APA91bG3K_4DIZGSUK_bU3cvfYL_YW7uE4fxuhCc5UqxtdhQGQDvWigwP4MjmmVRHCBe2yStMp_oT7cd4Tav8P-WMVxBHZcSClek-pp2YjoUViUV_gmYP08', N'op4EAymUBUwS/5nMVlgOD/W3e+mtUS6mTBhuNVKfROA=', CAST(N'2024-12-25T07:59:26.5307152' AS DateTime2), NULL, NULL, CAST(N'2024-08-01T20:09:37.7150000' AS DateTime2), CAST(N'2025-11-29T17:00:00.0000000' AS DateTime2), 2, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (22, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Trần Phước Khoa', N'phuockhoa123@gmail.com', N'0945675848', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, N'phuockhoa123', 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, NULL, NULL, N'DMDYk4AtNep5+akhEjb80+R9PPzjz7D0c10vnhd237Q=', CAST(N'2024-12-17T16:21:14.4045858' AS DateTime2), NULL, NULL, CAST(N'2024-09-01T20:09:37.7150000' AS DateTime2), CAST(N'2025-11-29T17:00:00.0000000' AS DateTime2), 2, N'Active', 0)
INSERT [dbo].[Account] ([AccountId], [AvatarImg], [Name], [Email], [Phone], [DateBirth], [Gender], [Username], [PasswordHash], [PasswordSalt], [OtpNumber], [FirebaseMessageToken], [TokenRefresh], [TokenDateExpire], [MembershipRankId], [MoneySpent], [DateCreate], [DateExpire], [RoleId], [Status], [IsDelete]) VALUES (24, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1728103743/MMRMS/qbjsfiyperlviohymsmv.png', N'Khang Bùi', N'khangpro592@gmail.com', N'0982898897', CAST(N'2000-01-04T17:00:00.0000000' AS DateTime2), 1, NULL, 0x5ACC2A94EADC6C72A9713A4B53797E78EEB4ED24FCA34DB9326A9E09F6D8C0B36F043029C79900EF38EB5FBB27ACF12BAEDB27A89F58C76D81CBC062D61D2342, 0xFE6A98AB32C084F574E1263FA4CF376AF51E7926F83DEBB05AD1FD47E9C464BE25042A3F2E95AA2B67BB028CFDACCB1334A8D927EFAB648B58D1F166C7CEAC712D03A45FE61B04E6551E5D6B957ED3A96C44FF2AB54AA2BF6487E6E9FB3D9BA4EE7552E1EF3B771706D4E463AB304EA8BCA877E2D4E3F339F1A6D9B464676168, N'455321', N'eTrKN2XIP2CWhyeUTD0mPu:APA91bFNwyvniex2QoN-DXPHmg9BNS7Nbeh7wb7Ovuy3u3vH3kI7aYwNJFSQXCO8IGw61kwE99528-xWz3yZniO2z2hbtyTf3G77SNd1-je6GkLKFjMsngk', N'v07GCAv4tMsi7xKov5QDA3b9J87hrlqRuJcpTUtnHmA=', CAST(N'2024-12-26T10:13:49.9930481' AS DateTime2), 6, 2674695800, CAST(N'2024-06-05T09:15:41.9540000' AS DateTime2), NULL, 4, N'Active', 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountBusiness] ON 

INSERT [dbo].[AccountBusiness] ([AccountBusinessId], [AccountId], [Company], [Address], [Position], [TaxNumber]) VALUES (1, 1, N'CÔNG TY TNHH HẢO HÁN LOGISTICS', N'Số 56,  Đường Số 19, Phường Hiệp Bình Phước, Quận Thủ Đức, Thành phố Hồ Chí Minh, Việt Nam', N'Quản lý', N'0315833051')
INSERT [dbo].[AccountBusiness] ([AccountBusinessId], [AccountId], [Company], [Address], [Position], [TaxNumber]) VALUES (2, 8, N'CÔNG TY TNHH SOR''S TATTOO', N'409/7 Lê Quang Định, Phường 5, Quận Bình Thạnh, Thành phố Hồ Chí Minh, Việt Nam', N'Nhân viên', N'0318754665')
INSERT [dbo].[AccountBusiness] ([AccountBusinessId], [AccountId], [Company], [Address], [Position], [TaxNumber]) VALUES (4, 10, N'CÔNG TY CỔ PHẦN BỆNH VIỆN ĐA KHOA QUỐC TẾ VINMEC', N'Số 458, phố Minh Khai, Phường Vĩnh Tuy, Quận Hai Bà Trưng, Thành phố Hà Nội, Việt Nam', N'Quản lý', N'0106050554')
INSERT [dbo].[AccountBusiness] ([AccountBusinessId], [AccountId], [Company], [Address], [Position], [TaxNumber]) VALUES (6, 14, N'CÔNG TY CỔ PHẦN HỌC VIỆN DOANH NHÂN READI', N'85/29/7 Trần Xuân Soạn, Khu phố 1, Phường Tân Thuận Tây, Quận 7, Thành phố Hồ Chí Minh, Việt Nam', N'Giám đốc', N'0318759938')
INSERT [dbo].[AccountBusiness] ([AccountBusinessId], [AccountId], [Company], [Address], [Position], [TaxNumber]) VALUES (7, 15, N'CÔNG TY TNHH ANH LÂM', N'KM 5, Thị Trấn Thiên Tôn, Huyện Hoa Lư, Tỉnh Ninh Bình, Việt Nam', N'Nhân viên', N'2700343126')
INSERT [dbo].[AccountBusiness] ([AccountBusinessId], [AccountId], [Company], [Address], [Position], [TaxNumber]) VALUES (8, 16, N'CÔNG TY TNHH TMĐT TRẦN GIA BẢO 99', N'Số 2 đường Nam Kỳ Khởi Nghĩa, Phường Thắng Tam, Thành phố Vũng Tàu, Tỉnh Bà Rịa - Vũng Tàu, Việt Nam', N'Quản lý', N'3502532892')
INSERT [dbo].[AccountBusiness] ([AccountBusinessId], [AccountId], [Company], [Address], [Position], [TaxNumber]) VALUES (9, 17, N'CÔNG TY TNHH TMĐT TRẦN GIA BẢO 99', N'Số 2 đường Nam Kỳ Khởi Nghĩa, Phường Thắng Tam, Thành phố Vũng Tàu, Tỉnh Bà Rịa - Vũng Tàu, Việt Nam', N'Nhân viên', N'3502532892')
INSERT [dbo].[AccountBusiness] ([AccountBusinessId], [AccountId], [Company], [Address], [Position], [TaxNumber]) VALUES (11, 19, N'VĂN PHÒNG ĐẠI DIỆN CÔNG TY CỔ PHẦN ĐẦU TƯ VÀ PHÁT TRIỂN GIÁO DỤC EDUGLOBAL', N'Tổ 2, Phường Tân Thịnh, Thành phố Thái Nguyên, Tỉnh Thái Nguyên, Việt Nam', N'Giám đốc', N'0108942045-001')
INSERT [dbo].[AccountBusiness] ([AccountBusinessId], [AccountId], [Company], [Address], [Position], [TaxNumber]) VALUES (13, 24, N'CÔNG TY TNHH THƯƠNG MẠI DỊCH VỤ SẢN XUẤT BAO BÌ CAO TIẾN', N'F6/37V, Ấp 6, Xã Vĩnh Lộc B, Huyện Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', N'Quản lý', N'0318771406 ')
INSERT [dbo].[AccountBusiness] ([AccountBusinessId], [AccountId], [Company], [Address], [Position], [TaxNumber]) VALUES (14, 9, N'CÔNG TY TNHH THƯƠNG MẠI DỊCH VỤ SẢN XUẤT BAO BÌ CAO TIẾN', N'F6/37V, Ấp 6, Xã Vĩnh Lộc B, Huyện Bình Chánh, Thành phố Hồ Chí Minh, Việt Nam', N'Quản lý', N'0318771406 ')
SET IDENTITY_INSERT [dbo].[AccountBusiness] OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (2, 8, N'70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh', N'Quận 4', N'Hồ Chí Minh', N'10.756061014000068,106.70365711300008')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (3, 1, N'130 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh', N'Quận 4', N'Hồ Chí Minh', N'10.756099088000042,106.70507435000007')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (4, 9, N'120 An Bình, Phường 5, Quận 5, Hồ Chí Minh', N'Quận 5', N'Hồ Chí Minh', N'10.752328870000042,106.67238617000004')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (5, 9, N'70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh', N'Quận 4', N'Hồ Chí Minh', N'10.756061014000068,106.70365711300008')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (19, 8, N'Tan Son Nhat Air Cargo Terminal, Cảng hàng không Quốc tế Tân Sơn Nhất, Nguyễn Văn Vĩnh, Phường 4, Tân Bình, Hồ Chí Minh', N'Tân Bình', N'Hồ Chí Minh', N'10.8079208,106.6591579')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (22, 14, N'620 Phạm Văn Chiêu, Phường 13, Gò Vấp, Hồ Chí Minh', N'Gò Vấp', N'Hồ Chí Minh', N'10.85268859200005,106.66147336500006')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (23, 9, N'Thảo Cầm Viên Sài Gòn, 2 Nguyễn Bỉnh Khiêm, Bến Nghé, Quận 1, Hồ Chí Minh', N'Quận 1', N'Hồ Chí Minh', N'10.787944526000047,106.70572826200004')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (24, 8, N'Bến Thành Mart, 683 Âu Cơ, Tân Thành, Tân Phú, Hồ Chí Minh', N'Tân Phú', N'Hồ Chí Minh', N'10.788421663000065,106.64067861800004')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (25, 16, N'Đại học Kinh tế, Vo Thi Sau Ward, Quận 3, Hồ Chí Minh', N'Quận 3', N'Hồ Chí Minh', N'10.7831284,106.6943674')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (27, 24, N'Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh', N'Bình Chánh', N'Hồ Chí Minh', N'10.814768081000068,106.57723605300004')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (29, 9, N'143bis Đ. Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh', N'Quận 4', N'Hồ Chí Minh', N'10.7564597,106.7054908')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (30, 9, N'Công ty cổ phần giám định World Control, Tầng 2, Tòa nhà Lộc Thiên Ân, 49 Lê Quốc Hưng, Phường 13, Quận 4, Hồ Chí Minh', N'Quận 4', N'Hồ Chí Minh', N'10.765306517000056,106.70302014900005')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (31, 17, N'AEON TÂN PHÚ, Bờ Bao Tân Thắng, Celadon City, Sơn Kỳ, Tân Phú, Hồ Chí Minh', N'Tân Phú', N'Hồ Chí Minh', N'10.8011622,106.6173945')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (32, 19, N'The Coffee House, 17 Út Tịch, Phường 4, Tân Bình, Hồ Chí Minh', N'Tân Bình', N'Hồ Chí Minh', N'10.796150397000076,106.65878023500005')
INSERT [dbo].[Address] ([AddressId], [AccountId], [AddressBody], [District], [City], [Coordinates]) VALUES (33, 1, N'The Coffee House - Út Tịch, Út Tịch, Phường 4, Tân Bình, Hồ Chí Minh', N'Tân Bình', N'Hồ Chí Minh', N'10.7958266,106.6589046')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (1, N'Máy khoan', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (2, N'Máy tiện', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (3, N'Máy bào', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (4, N'Máy phay', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (5, N'Máy mài', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (6, N'Máy cưa', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (7, N'Máy hàn', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (8, N'Máy ép', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (9, N'Máy cắt', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (10, N'Máy xay', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (16, N'Máy dập', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [DateCreate]) VALUES (17, N'Máy mài gỗ', CAST(N'2024-09-14T20:09:05.5400000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Component] ON 

INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (88, N'Bàn máy', 9, 20000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', 0)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (89, N'Vít me bi', 10, 70000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (90, N'Bộ thay dao tự động (ATC)', 9, 50000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', 0)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (91, N'Bảng điều khiển (Màn hình)', 10, 20000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (92, N'Hệ thống thu gom phoi', 10, 50000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (93, N'Khung máy', 10, 50000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (94, N'Động cơ trục chính', 10, 50000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (95, N'Trục chính', 10, 50000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (96, N'Hệ thống bôi trơn tự động', 10, 50000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (97, N'Hệ thống bảo vệ (Chắn an toàn)', 10, 50000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (98, N'Hệ thống điều khiển', 9, 50000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', 0)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (99, N'Mâm cặp', 10, 12000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (100, N'Băng máy', 10, 500000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (101, N'Hệ thống làm mát', 10, 34000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (102, N'Đầu dao tự động', 10, 20000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (103, N'Đèn làm việc', 10, 5000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (104, N'Hệ thống thủy lực', 9, 10000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', 0)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (105, N'Băng tải phoi', 10, 70000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (106, N'Bộ điều khiển CNC', 100, 50000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (107, N'Hệ thống bôi trơn', 9, 2000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', 0)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (108, N'Bảng điều khiển', 10, 30000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (109, N'Bơm làm mát', 9, 15000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', 0)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (110, N'Dây điện và cảm biến', 10, 10000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (111, N'Hệ thống dẫn hướng', 10, 70000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (112, N'Đá mài', 9, 5000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', 0)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (113, N'Cảm biến vị trí', 10, 15000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (114, N'Tủ điện và dây cáp', 10, 50000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (115, N'Khung thân C', 10, 60000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (116, N'Ly hợp và phanh', 10, 20000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (117, N'Bộ điều khiển điện', 10, 20000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (118, N'Động cơ chính', 10, 15000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (119, N'Cảm biến an toàn', 10, 2000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', NULL)
INSERT [dbo].[Component] ([ComponentId], [ComponentName], [AvailableQuantity], [Price], [DateCreate], [Status], [QuantityOnHold]) VALUES (120, N'Tủ điện và dây dẫn', 9, 15000000, CAST(N'2024-06-04T00:43:16.6210000' AS DateTime2), N'Active', 0)
SET IDENTITY_INSERT [dbo].[Component] OFF
GO
INSERT [dbo].[ComponentReplacementTicket] ([ComponentReplacementTicketId], [EmployeeCreateId], [MachineTaskCreateId], [ContractId], [ComponentId], [InvoiceId], [MachineSerialNumberComponentId], [ComponentPrice], [AdditionalFee], [TotalAmount], [Quantity], [DateCreate], [DateRepair], [Type], [Note], [Status]) VALUES (N'CRT20240821NO001', 4, 11, N'CON20240714NO0002', 98, N'INV20240821NO001', 623, 50000000, 111000, 50111000, 1, CAST(N'2024-08-21T16:17:29.0590000' AS DateTime2), NULL, N'RentingTicket', N'Thay thế thành phần Hệ thống điều khiển với số lượng là 1', N'Completed')
INSERT [dbo].[ComponentReplacementTicket] ([ComponentReplacementTicketId], [EmployeeCreateId], [MachineTaskCreateId], [ContractId], [ComponentId], [InvoiceId], [MachineSerialNumberComponentId], [ComponentPrice], [AdditionalFee], [TotalAmount], [Quantity], [DateCreate], [DateRepair], [Type], [Note], [Status]) VALUES (N'CRT20240911NO001', 11, 8, N'CON20240612NO0001', 120, N'INV20240911NO001', 496, 15000000, 111000, 15111000, 1, CAST(N'2024-09-11T15:20:24.6760000' AS DateTime2), NULL, N'RentingTicket', N'Thay thế thành phần Tủ điện và dây dẫn với số lượng là 1', N'Completed')
INSERT [dbo].[ComponentReplacementTicket] ([ComponentReplacementTicketId], [EmployeeCreateId], [MachineTaskCreateId], [ContractId], [ComponentId], [InvoiceId], [MachineSerialNumberComponentId], [ComponentPrice], [AdditionalFee], [TotalAmount], [Quantity], [DateCreate], [DateRepair], [Type], [Note], [Status]) VALUES (N'CRT20240916NO001', 7, 8, N'CON20240705NO0001', 88, N'INV20240916NO001', 479, 20000000, 111000, 20111000, 1, CAST(N'2024-09-16T16:17:29.0590000' AS DateTime2), NULL, N'RentingTicket', N'Thay thế thành phần Bàn máy với số lượng là 1', N'Completed')
INSERT [dbo].[ComponentReplacementTicket] ([ComponentReplacementTicketId], [EmployeeCreateId], [MachineTaskCreateId], [ContractId], [ComponentId], [InvoiceId], [MachineSerialNumberComponentId], [ComponentPrice], [AdditionalFee], [TotalAmount], [Quantity], [DateCreate], [DateRepair], [Type], [Note], [Status]) VALUES (N'CRT20241021NO001', 11, 6, N'CON20240915NO0003', 90, N'INV20241021NO001', 47, 50000000, 111000, 50111000, 1, CAST(N'2024-10-21T15:02:15.9010000' AS DateTime2), NULL, N'RentingTicket', N'Thay thế thành phần Bộ thay dao tự động (ATC) với số lượng là 1', N'Completed')
INSERT [dbo].[ComponentReplacementTicket] ([ComponentReplacementTicketId], [EmployeeCreateId], [MachineTaskCreateId], [ContractId], [ComponentId], [InvoiceId], [MachineSerialNumberComponentId], [ComponentPrice], [AdditionalFee], [TotalAmount], [Quantity], [DateCreate], [DateRepair], [Type], [Note], [Status]) VALUES (N'CRT20241116NO001', 11, 4, N'CON20240915NO0002', 88, N'INV20241116NO001', 371, 20000000, 111000, 20111000, 1, CAST(N'2024-11-16T15:52:10.3130000' AS DateTime2), CAST(N'2024-11-16T16:40:10.3130000' AS DateTime2), N'RentingTicket', N'Thay thế thành phần Bàn máy với số lượng là 1', N'Completed')
INSERT [dbo].[ComponentReplacementTicket] ([ComponentReplacementTicketId], [EmployeeCreateId], [MachineTaskCreateId], [ContractId], [ComponentId], [InvoiceId], [MachineSerialNumberComponentId], [ComponentPrice], [AdditionalFee], [TotalAmount], [Quantity], [DateCreate], [DateRepair], [Type], [Note], [Status]) VALUES (N'CRT20241216NO001', 7, 5, N'CON20241118NO0001', 112, N'INV20241216NO001', 408, 5000000, 111000, 5111000, 1, CAST(N'2024-12-16T16:17:29.0590000' AS DateTime2), NULL, N'RentingTicket', N'Thay thế thành phần Đá mài với số lượng là 1', N'Completed')
GO
SET IDENTITY_INSERT [dbo].[ComponentReplacementTicketLog] ON 

INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1, N'CRT20241116NO001', 11, N'Ticket được tạo mới', CAST(N'2024-11-16T15:52:10.3130000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (2, N'CRT20241116NO001', 9, N'Thay đổi trạng thái từ [Chưa thanh toán] trở thành [Đã thanh toán]', CAST(N'2024-11-16T15:59:10.3130000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (3, N'CRT20241116NO001', 11, N'Thay đổi trạng thái từ [Đã thanh toán] trở thành [Đã hoàn thành]', CAST(N'2024-11-16T16:40:10.3130000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (4, N'CRT20241216NO001', 7, N'Ticket được tạo mới', CAST(N'2024-12-16T16:17:29.0590000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (5, N'CRT20241216NO001', 17, N'Thay đổi trạng thái từ [Chưa thanh toán] trở thành [Đã thanh toán]', CAST(N'2024-12-16T16:18:15.6120000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (6, N'CRT20241216NO001', 7, N'Thay đổi trạng thái từ [Đã thanh toán] trở thành [Đã hoàn thành]', CAST(N'2024-12-16T16:19:12.9790000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (7, N'CRT20241021NO001', 11, N'Ticket được tạo mới', CAST(N'2024-10-21T15:02:15.9010000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (8, N'CRT20241021NO001', 9, N'Thay đổi trạng thái từ [Chưa thanh toán] trở thành [Đã thanh toán]', CAST(N'2024-10-21T15:03:00.2120000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (9, N'CRT20241021NO001', 11, N'Thay đổi trạng thái từ [Đã thanh toán] trở thành [Đã hoàn thành]', CAST(N'2024-10-21T16:03:18.8460000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (10, N'CRT20240911NO001', 11, N'Ticket được tạo mới', CAST(N'2024-09-11T15:20:24.6760000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (11, N'CRT20240911NO001', 24, N'Thay đổi trạng thái từ [Chưa thanh toán] trở thành [Đã thanh toán]', CAST(N'2024-09-11T15:21:25.9150000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (12, N'CRT20240911NO001', 11, N'Thay đổi trạng thái từ [Đã thanh toán] trở thành [Đã hoàn thành]', CAST(N'2024-09-11T16:21:36.4420000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (13, N'CRT20240916NO001', 7, N'Ticket được tạo mới', CAST(N'2024-09-16T16:17:29.0590000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (14, N'CRT20240916NO001', 9, N'Thay đổi trạng thái từ [Chưa thanh toán] trở thành [Đã thanh toán]', CAST(N'2024-09-16T16:30:45.2220000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (15, N'CRT20240916NO001', 7, N'Thay đổi trạng thái từ [Đã thanh toán] trở thành [Đã hoàn thành]', CAST(N'2024-09-16T16:40:45.2220000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (16, N'CRT20240821NO001', 4, N'Ticket được tạo mới', CAST(N'2024-08-21T16:17:29.0590000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (17, N'CRT20240821NO001', 9, N'Thay đổi trạng thái từ [Chưa thanh toán] trở thành [Đã thanh toán]', CAST(N'2024-08-21T16:30:45.2220000' AS DateTime2))
INSERT [dbo].[ComponentReplacementTicketLog] ([ComponentReplacementTicketLogId], [ComponentReplacementTicketId], [AccountTriggerId], [Action], [DateCreate]) VALUES (18, N'CRT20240821NO001', 4, N'Thay đổi trạng thái từ [Đã thanh toán] trở thành [Đã hoàn thành]', CAST(N'2024-08-21T16:40:45.2220000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ComponentReplacementTicketLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ContentId], [ImageUrl], [Summary], [ContentBody], [Title], [DateCreate], [Status], [AccountId]) VALUES (1, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1731468747/MMRMS/sj4tisbi4e7z8iwdrowz.jpg', N'VinFast công bố đã bàn giao hơn 9.300 xe cho khách hàng trong tháng 9, cao gần gấp rưỡi so với hãng xe xếp thứ hai và vươn lên thành vị trí số 1 Việt Nam. Đánh dấu bước tiến mới của công nghiệp ô tô Việt Nam.', N'<p class="ql-align-justify">VinFast là công ty thành viên của Tập đoàn Vingroup, được thành lập vào năm 2017. Với tầm nhìn trở thành thương hiệu xe điện thông minh thúc đẩy mạnh mẽ cuộc cách mạng xe điện toàn cầu, VinFast sở hữu tổ hợp nhà máy sản xuất ô tô hiện đại, có quy mô hàng đầu khu vực đặt tại Hải Phòng, Việt Nam với mức độ tự động hóa lên đến 90%.&nbsp;</p><p class="ql-align-justify">Cùng với quy trình sản xuất hiện đại và đội ngũ nhân sự có trình độ cao, nhà máy lắp ráp ô tô VinFast tại Hải Phòng đã rút ngắn thời gian sản xuất và nhanh chóng cho ra thị trường những mẫu xe đa dạng phân khúc. Các mẫu xe hơi được VinFast đầu tư và lựa chọn rất kỹ từ đối tác thiết kế để tạo nên những sản phẩm chất lượng hàng đầu như VinFast Fadil, VinFast Lux A2.0, VinFast Lux SA2.0, VinFast VF e34, VinFast VF 8, VinFast VF 9….&nbsp;</p><p class="ql-align-justify">Nhà máy VinFast không chỉ đảm bảo đúng quy định về tiêu chuẩn doanh nghiệp sản xuất, lắp ráp ô tô mà còn ứng dụng công nghệ số hóa đầu tiên tại Đông Nam Á. Toàn bộ quy trình sản xuất linh kiện ô tô, lắp ráp hoàn toàn được đồng bộ và khép kín, điều hành bằng hệ thống máy móc thông minh, hiện đại và tự động hoá thông qua robot.&nbsp;</p><p class="ql-align-justify">Với sự đầu tư bài bản từ nhà máy lắp ráp ô tô, VinFast đã cho ra những chiếc xe đẳng cấp, an toàn và được sự đón nhận tích cực từ người tiêu dùng, tạo nền móng vững chắc cho tiến trình tự chủ sản xuất ô tô tại Việt Nam.</p><p class="ql-align-justify">Cam kết mạnh mẽ với sứ mệnh vì một tương lai xanh cho mọi người, VinFast không ngừng sáng tạo mang đến sản phẩm chất lượng đẳng cấp, nền tảng dịch vụ thông minh, trải nghiệm khách hàng, cùng chiến lược giá dành cho tất cả để truyền cảm hứng đến khách hàng toàn cầu cùng chung tay cho một tương lai di chuyển thông minh và một hành tinh phát triển bền vững.&nbsp;</p><p class="ql-align-justify">Thông qua lĩnh vực sản xuất ô tô, xe máy, Tập đoàn Vingroup cũng mong muốn góp phần tạo động lực, thúc đẩy công nghiệp nặng, công nghiệp chế tạo, công nghiệp phụ trợ tại Việt Nam phát triển hơn nữa.</p><p class="ql-align-justify">Doanh số hơn 9.300 xe bàn giao cho khách hàng tại Việt Nam trong tháng 9 của VinFast có sự đóng góp của tất cả các dòng xe điện gồm: VF e34, VF 3, VF 5, VF 6, VF 7, VF 8 và VF 9, góp phần đẩy nhanh tốc độ chuyển đổi xanh, đưa Việt Nam trở thành một trong những quốc gia hiếm hoi trên thế giới ghi nhận sự thắng thế của xe điện so với xe xăng ở thời điểm hiện tại.</p><p class="ql-align-justify">Doanh số cao nhất thị trường của VinFast cũng đánh dấu mốc son mới trong ngành công nghiệp ô tô Việt Nam. Lần đầu tiên, thương hiệu ô tô điện nội địa vượt qua tất cả các thương hiệu xe xăng và điện quốc tế, trở thành hãng xe bán chạy nhất thị trường, đặc biệt chỉ sau hơn 2 năm chính thức chuyển đổi thành hãng xe hoàn toàn thuần điện.</p><p><br></p><p class="ql-align-justify">Ông Vũ Anh Tuấn - Giám đốc Điều hành VinFast Ô tô Việt Nam cho biết: “Chúng tôi xin trân trọng cảm ơn các khách hàng và các đại lý đã tin tưởng, ủng hộ và đồng hành cùng với VinFast tạo ra kỳ tích này. Với sự ủng hộ mạnh mẽ của khách hàng, chúng tôi tự tin sẽ hoàn thành được kế hoạch 2024 đã đặt ra, đưa VinFast thành hãng xe bán chạy nhất cả năm 2024”.</p><p class="ql-align-justify">Hiện nay, VinFast đang triển khai chương trình “Mãnh liệt Tinh thần Việt Nam - Vì tương lai xanh” nhằm kêu gọi toàn thể cộng đồng chung tay phát triển thương hiệu xe điện Việt, góp phần thúc đẩy quá trình chuyển đổi xanh vì hôm nay và mai sau, đã nhận được sự ủng hộ của các khách hàng, doanh nghiệp vì tính nhân văn cao của chương trình.</p><p class="ql-align-justify">Sau gần 2 năm chuyển sang thuần điện 100%, VinFast sở hữu dải sản phẩm thuần điện phủ khắp các phân khúc, đáp ứng đa dạng nhu cầu sử dụng của người tiêu dùng. Không chỉ tiên phong, dẫn dắt xu hướng “xanh hóa” giao thông, VinFast cũng được coi là biểu tượng “Mãnh liệt tinh thần Việt Nam” đạt đẳng cấp quốc tế trong lĩnh vực công nghiệp, công nghệ cao thế giới.</p>', N'Doanh nghiệp VinFast vươn lên dẫn đầu thị trường ô tô điện Việt Nam', CAST(N'2024-11-13T10:32:27.8810000' AS DateTime2), N'Active', 3)
INSERT [dbo].[Content] ([ContentId], [ImageUrl], [Summary], [ContentBody], [Title], [DateCreate], [Status], [AccountId]) VALUES (2, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1731468980/MMRMS/h4luykvh4u9jrianmtfy.jpg', N'Với chủ đề “Tạo đà vươn xa”, triển lãm quốc tế lần thứ 20 về công nghiệp ô tô, xe máy, xe điện và công nghiệp hỗ trợ (Autotech & Accessories 2024) sẽ được tổ chức tại Trung tâm Hội chợ và Triển lãm Sài Gòn (SECC), TP. Hồ Chí Minh.', N'<p class="ql-align-justify">Theo Ban tổ chức cho biết, Triển lãm Autotech &amp; Accessories 2024 dự kiến có khoảng 300 doanh nghiệp từ các quốc gia và vùng lãnh thổ như: Trung Quốc, Nhật Bản, Hàn Quốc, Malaysia, Đài Loan (Trung Quốc), Thái Lan... tham gia, thu hút 15.000 khách tham quan trong nước và quốc tế.</p><p class="ql-align-justify"><br></p><p class="ql-align-center"><em style="color: rgb(33, 37, 41);"><img src="https://cokhivietnam.vn/storage/photos/8/Ngay2403071.jpg" height="681" width="1024"></em></p><p class="ql-align-center"><em>Triển lãm quốc tế về công nghiệp ô tô, xe máy, xe điện, công nghiệp hỗ trợ năm 2023.</em></p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Các doanh nghiệp dự kiến mang đến triển lãm các sản phẩm chất lượng cao, ứng dụng công nghệ tiên tiến từ các lĩnh vực trưng bày đa dạng tại triển lãm, gồm: xe nguyên chiếc, xe chuyên dụng, linh kiện, phụ tùng, bảo trì bảo dưỡng, điện, điện tử, hệ thống quản lý giao thông.</p><p class="ql-align-justify">Nắm bắt xu thế phát triển của thị trường, bên cạnh các sản phẩm – dịch vụ liên quan đến các loại xe có động cơ sử dụng nhiên liệu xăng dầu, Autotech &amp; Accessories 2024 sẽ tập trung mở rộng các sản phẩm – dịch vụ trong hệ sinh thái xe điện với những giải pháp, sáng kiến về pin, trạm sạc, các công nghệ ứng dụng trên xe...</p><p class="ql-align-justify">Bên cạnh hoạt động trưng bày, trong khuôn khổ Autotech &amp; Accessories 2024 còn có các hoạt động bên lề dành cho các doanh nghiệp và khách tham quan như sự kiện kết nối giao thương, hội thảo chuyên ngành, hoạt động lái thử xe, trình diễn và biểu diễn xe.</p><p class="ql-align-justify">Đây cũng sẽ là nơi các doanh nghiệp có thể tìm kiếm và gặp gỡ các đối tác mới, cùng nhau chia sẻ kiến thức, kinh nghiệm và đưa ra các giải pháp để cải tiến và phát triển, đồng thời còn là cơ hội để các đơn vị sản xuất tiếp cận và lắng nghe phản hồi từ người tiêu dùng.</p><p class="ql-align-justify">Nhiều năm qua, với sự hỗ trợ của chính sách quốc gia và tăng trưởng của thị trường ô tô trong nước, ngành công nghiệp hỗ trợ ô tô, xe máy của Việt Nam ngày càng phát triển, nhiều dự án công nghiệp hỗ trợ dự kiến đi vào hoạt động nhằm đáp ứng chuỗi sản xuất, lắp ráp xe của nhiều thương hiệu lớn cả trong và ngoài nước. Vì vậy, doanh nghiệp ở Việt Nam cần nâng cao khả năng cạnh tranh, mở rộng quy mô sản xuất và tập trung nhiều hơn vào phát triển các sản phẩm công nghệ cao.</p><p class="ql-align-justify">Với chủ đề “Tạo đà vươn xa”, Ban tổ chức Triển lãm Autotech &amp; Accessories 2024 mong muốn trở thành cầu nối giao thương, thúc đẩy hoạt động&nbsp;xúc tiến thương mại&nbsp;và đầu tư giữa doanh nghiệp Việt Nam và doanh nghiệp quốc tế trong lĩnh vực công nghiệp ô tô, xe máy, xe điện và công nghiệp hỗ trợ; giúp doanh nghiệp dễ dàng tiếp cận xu hướng công nghệ mới, khám phá các sản phẩm sáng tạo, công nghệ tiên tiến và phương pháp mới trong sản xuất, kinh doanh lĩnh vực công nghiệp ô tô, xe máy, xe điện, công nghiệp hỗ trợ, từ đó đón đầu cơ hội để phát triển, tham gia sâu vào chuỗi cung ứng toàn cầu.</p>', N'Chuyển động Cơ khí - Tạo đà cho công nghiệp ô tô, xe máy, xe điện và công nghiệp hỗ trợ phát triển', CAST(N'2024-11-13T10:36:20.5060000' AS DateTime2), N'Active', 3)
INSERT [dbo].[Content] ([ContentId], [ImageUrl], [Summary], [ContentBody], [Title], [DateCreate], [Status], [AccountId]) VALUES (3, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1731469174/MMRMS/jhjuxsytdoj2zcbkg0xw.jpg', N'Năm học 2024 - 2025, Đại học Công nghiệp Hà Nội (HaUI) tiếp tục tuyển sinh hệ đại học chính quy ngành Thiết kế cơ khí và kiểu dáng công nghiệp.', N'<p class="ql-align-justify"><em>Nhu cầu sử dụng lao động liên quan đến lĩnh vực Thiết kế cơ khí và kiểu dáng công nghiệp trong các doanh nghiệp hiện tại và tương lai là rất lớn. Đón đầu xu thế đó, năm học 2024 - 2025, Đại học Công nghiệp Hà Nội (HaUI) tiếp tục tuyển sinh hệ đại học chính quy ngành Thiết kế cơ khí và kiểu dáng công nghiệp.</em></p><p class="ql-align-justify"><br></p><p class="ql-align-justify">Lĩnh vực cơ khí là trụ cột sự phát triển của một đất nước, là nền tảng và động lực để phát triển các ngành công nghiệp khác. Thiết kế sản phẩm cơ khí được nhận định là một trong những ngành nghề xương sống, cơ hội phát triển tốt trong thời đại 4.0 đặc biệt khi ứng dụng các công nghệ tiên tiến vào quá trình thiết kế và chế tạo các sản phẩm cơ khí sẽ nâng cao đang kể năng lực cạnh tranh trên thị trường trong và ngoài nước. Cuộc cách mạng công nghiệp lần thứ tư và việc ứng dụng máy tính để tự động hóa quá trình thiết kế và chế tạo sản phẩm cơ khí đã phá vỡ phương thức thiết kế và sản xuất truyền thống. Các sản phẩm cơ khí được thiết kế tối ưu về kiểu dáng, kích thước, kết cấu và vòng đời sản phẩm.</p><p class="ql-align-justify">Kiểu dáng là một thuộc tính của sản phẩm, kiểu dáng công nghiệp quyết định diện mạo, phương thức sản xuất, tính cạnh tranh của sản phẩm. Kiểu dáng công nghiệp hiện nay đã phát triển và thành một ngành nghiên cứu độc lập, có vai trò ngày càng quan trọng và mang lại giá trị cộng thêm rất cao cho mỗi sản phẩm. Thiết kế sản phẩm cơ khí là thiết kế kiểu dáng và kết cấu của sản phẩm, khi mà người tiêu dùng luôn coi hình dáng, tính mỹ thuật của sản phẩm là một trong những tiêu chí quan trọng khi lựa chọn, bên cạnh chất lượng sản phẩm.</p><p class="ql-align-justify">Nắm bắt nhu cầu sử dụng lao động liên quan đến lĩnh vực Thiết kế cơ khí và kiểu dáng công nghiệp trong các doanh nghiệp trong và ngoài nước ở hiện tại và trong tương lai là rất lớn, HaUI tiếp tục tuyển sinh hệ đại học chính quy ngành Thiết kế cơ khí và kiểu dáng công nghiệp.</p><p class="ql-align-justify">Sinh viên theo học ngành này được trang bị các kiến thức chuyên môn sâu vế thiết kế, mô phỏng và phân tích về kết cấu và kiểu dáng công nghiệp trên máy tính thích ứng với môi trường làm việc và sự phát triển không ngừng của khoa học công nghệ và là nền tảng để tự động hóa thiết kế kết cấu và kiểu dáng công nghiệp đối với các sản phẩm cơ khí; Có kiến thức khoa học cơ bản để tiếp thu, vận dụng và phát triển tri thức trong lĩnh vực thiết kế cơ khí và kiểu dáng công nghiệp; Có các kiến thức cơ sở kỹ thuật nói chung và kiến thức chuyên ngành thiết kế cơ khí và kiểu dáng công nghiệp nói riêng.</p><p class="ql-align-justify">Ngoài các kiến thức chuyên môn, sinh viên còn được đào tạo các kỹ năng như làm việc độc lập, làm việc nhóm ở môi trường làm việc trong nước và quốc tế; Có kỹ năng giải quyết vấn đề liên quan đến thiết kế kết cấu và kiểu dáng các sản phẩm công nghiệp trong lĩnh vực cơ khí; Có kiến thức cơ bản trong lĩnh vực khoa học - xã hội và nhân văn phù hợp với chuyên ngành đào tạo nhằm đóng góp hữu hiệu vào sự phát triển bền vững của xã hội, cộng đồng.</p><p class="ql-align-justify">Thời gian đào tạo hệ đại học chính quy ngành Thiết kế cơ khí và kiểu dáng công nghiệp tại HaUI là&nbsp;4 năm. Sau khi tốt nghiệp đại học ngành Thiết kế Cơ khí và kiểu dáng công nghiệp, sinh viên có thể công tác trong các lĩnh vực sau: Thiết kế sản phẩm (sản phẩm cơ khí, điện tử, sản phẩm gia dụng, ô tô - xe máy…); quản lý thiết kế; giám sát và đánh giá sản phẩm; chuyên gia nghiên cứu tại các viện, phòng nghiên cứu và phát triển sản phẩm (R&amp;D) của các doanh nghiệp; giảng dạy tại các trường đại học, cao đẳng…</p><p><img src="https://cokhivietnam.vn/storage/photos/8/Ng%C3%A0y%202411052.jpg"></p><p><br></p><p class="ql-align-center">Trong ch<em>uỗi Ngày hội tư vấn tuyển sinh tại các trường THPT năm 2024, ngành Thiết kế cơ khí và kiểu dáng công nghiệp thu hút lượng lớn thí sinh tìm hiểu thông tin.</em></p><p><br></p><p class="ql-align-justify">Đội ngũ giảng viên của ngành Thiết kế cơ khí và kiểu dáng công nghiệp tại Trường Cơ khí - Ô tô, HaUI là một trong những yếu tố then chốt góp phần tạo nên uy tín và chất lượng của chương trình đào tạo. Với trình độ chuyên môn cao, kinh nghiệm thực tiễn phong phú và sự tận tâm trong giảng dạy, các giảng viên không chỉ truyền đạt kiến thức mà còn truyền cảm hứng và động lực cho sinh viên.</p><p class="ql-align-justify">Nhà trường đầu tư mạnh mẽ vào cơ sở vật chất phục vụ hoạt động đào tạo và nghiên cứu khoa học. Môi trường giáo dục của nhà trường được đánh giá là hiện đại, thông minh. Hệ thống phòng học, thư viện, quần thể các công trình thể thao, văn hóa khép kín, đa chức năng với nhiều tiện ích hứa hẹn đem đến trải nghiệm tốt nhất cho người học.</p><p><img src="https://cokhivietnam.vn/storage/photos/8/Ng%C3%A0y%202411053.jpg"></p><p><br></p><p class="ql-align-center">Trung <em>tâm nghiên cứu nhà máy thông minh, Trường Cơ khí - Ô tô, Đại học Công nghiệp Hà Nội.</em></p><p><br></p><p class="ql-align-justify">Các phòng thực hành/thí nghiệm CAD/CAM-CNC, đo lường chính xác, Rô bốt công nghiệp, phòng thí nghiệm vật liệu, phòng thí nghiệm sức bền vật liệu, phòng thí nghiệm nguyên lý - chi tiết máy, thiết kế ngược và tạo mẫu nhanh, phòng thí nghiệm rung động và đặc biệt là trung tâm công nghệ 4.0 với 5 phòng Lab hiện đại được trang bị hệ thống phần mềm, phần cứng đồng bộ từ Siemens (Đức), đáp ứng được nhu cầu đào tạo chuyên sâu về thiết kế, mô phỏng, phân tích trong lĩnh vực Thiết kế cơ khí và kiểu dáng công nghiệp.</p><p><img src="https://cokhivietnam.vn/storage/photos/8/Ng%C3%A0y%202411054.jpg"></p><p><br></p><p class="ql-align-center">Sinh<em> viên thực hành thiết kế mô phỏng tại trung tâm 4.0, Đại học Công nghiệp Hà Nội.</em></p><p><br></p><p class="ql-align-justify">Đến với ngành học Thiết kế cơ khí và kiểu dáng công nghiệp tại Đại học Công nghiệp Hà Nội, sinh viên làm chủ được các ứng dụng thiết kế trên máy tính; công nghệ thiết kế, mô phỏng và phân tích quá trình thiết kế sản phẩm (AutoCAD, SolidWorks, CATIA, ANSYS, COMSOL Multiphysics); công nghệ In 3D và tạo mẫu nhanh; công nghệ thiết kế và lập trình đồ họa (Adobe Illustrator và Photoshop, Blender và 3ds Max); công nghệ quản lý dự án (Microsoft Project) và công nghệ tự động hóa quá trình thiết kế trong sản xuất ô tô xe máy, máy móc công nghiệp, thiết bị y tế, thiết bị điện máy, và thiết bị đồ gia dụng…</p>', N'Đào tạo nhân lực ngành Thiết kế cơ khí và kiểu dáng công nghiệp tại Trường Cơ khí - Ô tô, HaUI', CAST(N'2024-11-13T10:39:35.1110000' AS DateTime2), N'Active', 3)
INSERT [dbo].[Content] ([ContentId], [ImageUrl], [Summary], [ContentBody], [Title], [DateCreate], [Status], [AccountId]) VALUES (4, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1732520779/MMRMS/ttqwqnuh3kirb843hk4v.jpg', N'Công nghệ hóa, hiện đại hóa đất nước từ việc sử dụng sức lao động thủ công là chính sang sử dụng một cách phổ biến sức lao động cùng công nghệ, phương tiện tiên tiến, hiện đại nhằm tạo ra năng suất lao động cao ngày một lan rộng và ứng dụng rộng rãi', N'<p class="ql-align-justify">Sự xuất hiện ngày một nhiều các dòng máy CNC như Hyundai Wia, HK Laser, Flow, Komatsu, AiDa….đã góp phần tăng năng xuất và hiệu suất sản xuất, giảm thiểu sai sót trong gia công, chế tạo sản phẩm. Do phải vận hành, làm việc liên tục trong thời gian dài, các&nbsp;<em>máy cnc&nbsp;</em>cũng không tránh khỏi hư hỏng, trục trặc về kỹ thuật….</p><p class="ql-align-justify">Chính vì vậy việc sửa chữa, bảo dưỡng, bảo trì máy cnc, khắc phục sự cố các loại máy móc thiết bị cũng ngày được quan tâm nhiều hơn nhằm đảm bảo máy luôn có tính năng kỹ thuật tốt, giảm cường độ hao mòn của các chi tiết, ngăn ngừa và phát hiện kịp thời các hư hỏng và sai lệch kỹ thuật để khắc phục kịp thời, nâng cao năng suất quá trình sản xuất.</p><p class="ql-align-justify">Với phương trâm&nbsp;<strong>“ Uy tín tạo thành công ” -</strong>&nbsp;TATMachinery luôn cam kết phục vụ khách hàng 24/7 Tận Tâm, Chu Đáo, Chất Lượng Hàng Đầu, Giá Thành Tốt Nhất. Lấy khách hàng làm trung tâm, trước khi tiến hành bảo dưỡng, sửa chữa, thay mới phụ tùng… các kỹ sư của TATMachinery kiểm tra tổng thể hoạt động làm việc của máy, đánh giá tình trạng của máy, đưa ra phương án bảo dưỡng tối ưu.</p><p class="ql-align-center"><em><img src="https://www.tatmachinery.com/upload/content/202006/tat-sua-may-cnc-552702.jpg" alt="Sửa chữa máy cnc"></em></p><p class="ql-align-center"><em>Kỹ sư TATMachinery sửa chữa máy cnc</em></p><p class="ql-align-justify">TATMachinery chuyên&nbsp;dịch vụ&nbsp;sửa chữa máy cnc&nbsp;24/7:</p><p class="ql-align-justify">- Dịch vụ kiểm tra, sửa chữa, thay thế các loại máy dùng bộ điều khiển CNC FANUC, SIEMENS, Heidenhain-Đức.</p><p class="ql-align-justify">- Dịch vụ kiểm tra, sửa chữa, lập trình Ladder máy dùng bộ điều khiển CNC FANUC các đời.</p><p class="ql-align-justify">- Dịch vụ kiểm tra, sửa chữa, thay thế các Driver servo, motor servo, spindle, phụ tùng máy….</p><p class="ql-align-justify">TATMachinery – 20 năm kinh nghiệm trong lĩnh vực cung cấp máy công cụ và&nbsp;</p><p class="ql-align-justify">dị<em>ch vụ kỹ thuật&nbsp;</em></p><p class="ql-align-justify">như lắp đặt, sửa chữa, bảo trì máy gia công cơ khí, máy gia công cnc…giúp khách hàng giảm thiểu chi phí thay mới, bảo hành dài hạn, phụ tùng thay thế chính hãng 100%.</p><p class="ql-align-center"><img src="https://www.tatmachinery.com/upload/content/202006/ky-su-sua-chua-tat-970147.jpg"></p><p class="ql-align-center"><br></p><p class="ql-align-center"><em>Cố vấn chuyên môn Hyundai Wia - Hàn Quốc</em></p><p class="ql-align-justify">Tất cả đội ngũ kỹ sưa của TATMachinery đều có tay nghề cao, được đào tạo bài bản và chuyên tu nghiệp vụ từ nhiều quốc gia có nền công nghiệp phát triển như Nhật Bản, Hàn Quốc và Thụy Sĩ…</p><p class="ql-align-justify">Thiết bị sửa chữa, kiểm tra hiện đại phù hợp với mọi loại máy cnc. Các phụ tùng thay thế luôn sẵn sàng, đảm bảo chính hãng và đúng chất lượng.</p>', N'DỊCH VỤ SỬA CHỮA MÁY CNC 24/7', CAST(N'2024-11-25T14:46:20.3702176' AS DateTime2), N'Active', 6)
SET IDENTITY_INSERT [dbo].[Content] OFF
GO
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20240612NO0001', N'Hợp đồng thuê máy MD-01-2024-00004', 24, N'REH20240612NO001', 480000, 360373000, 181, 87840000, N'Hoàn trả tiền vận chuyển tạm tính là: 373,000 ₫ vào tiền đặt cọc ban đầu: 360,000,000 ₫, tiền đặt cọc mới là 360,373,000 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 373000, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-12T15:35:51.8410000' AS DateTime2), CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-22T00:00:00.0000000' AS DateTime2), N'Renting', N'MD-01-2024-00004', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20240612NO0002', N'Hợp đồng thuê máy MD-01-2024-00005', 24, N'REH20240612NO001', 1080000, 360373000, 181, 197640000, N'Hoàn trả tiền vận chuyển tạm tính là: 373,000 ₫ vào tiền đặt cọc ban đầu: 360,000,000 ₫, tiền đặt cọc mới là 360,373,000 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 373000, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-12T15:35:51.9350000' AS DateTime2), CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-22T00:00:00.0000000' AS DateTime2), N'Renting', N'MD-01-2024-00005', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20240705NO0001', N'Hợp đồng thuê máy MD-01-2024-00003', 9, N'REH20240705NO001', 840000, 360000000, 122, 102480000, N'', 0, CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-12-18T14:56:26.0590573' AS DateTime2), CAST(N'2024-07-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-15T00:00:00.0000000' AS DateTime2), N'Completed', N'MD-01-2024-00003', NULL, 1)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20240714NO0001', N'Hợp đồng thuê máy MT-02-2024-00008', 9, N'REH20240714NO001', 320000, 240000000, 122, 39040000, N'', 0, CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-14T09:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), N'Completed', N'MT-02-2024-00008', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20240714NO0002', N'Hợp đồng thuê máy MT-02-2024-00014', 9, N'REH20240714NO001', 320000, 240000000, 122, 39040000, N'', 0, CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-14T09:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), N'Completed', N'MT-02-2024-00014', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20240805NO0001', N'Hợp đồng thuê máy MD-01-2024-00014', 19, N'REH20240805NO001', 600000, 360269000, 244, 146400000, N'Hoàn trả tiền vận chuyển tạm tính là: 269,000 ₫ vào tiền đặt cọc ban đầu: 360,000,000 ₫, tiền đặt cọc mới là 360,269,000 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 269000, CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-05T09:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-25T00:00:00.0000000' AS DateTime2), N'Renting', N'MD-01-2024-00014', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20240805NO0002', N'Hợp đồng thuê máy MK-01-2024-00003', 19, N'REH20240805NO001', 420000, 180269000, 244, 102480000, N'Hoàn trả tiền vận chuyển tạm tính là: 269,000 ₫ vào tiền đặt cọc ban đầu: 180,000,000 ₫, tiền đặt cọc mới là 180,269,000 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 269000, CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-05T09:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-25T00:00:00.0000000' AS DateTime2), N'Renting', N'MK-01-2024-00003', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20240915NO0001', N'Hợp đồng thuê máy MM-01-2024-00010', 9, N'REH20240915NO001', 720000, 240221700, 91, 65520000, N'Hoàn trả tiền vận chuyển tạm tính là: 221,700 ₫ vào tiền đặt cọc ban đầu: 240,000,000 ₫, tiền đặt cọc mới là 240,221,700 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 221700, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2024-09-15T16:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-30T00:00:00.0000000' AS DateTime2), N'Renting', N'MM-01-2024-00010', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20240915NO0002', N'Hợp đồng thuê máy MM-01-2024-00002', 9, N'REH20240915NO001', 760000, 240221700, 121, 91960000, N'Hoàn trả tiền vận chuyển tạm tính là: 221,700 ₫ vào tiền đặt cọc ban đầu: 240,000,000 ₫, tiền đặt cọc mới là 240,221,700 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 221700, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2024-09-15T16:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), N'Renting', N'MM-01-2024-00002', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20240915NO0003', N'Hợp đồng thuê máy MP-02-2024-00005', 9, N'REH20240915NO001', 340000, 255221700, 121, 41140000, N'Hoàn trả tiền vận chuyển tạm tính là: 221,700 ₫ vào tiền đặt cọc ban đầu: 255,000,000 ₫, tiền đặt cọc mới là 255,221,700 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 221700, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2024-09-15T16:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), N'Renting', N'MP-02-2024-00005', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241011NO0001', N'Hợp đồng thuê máy MD-01-2024-00012', 8, N'REH20241011NO001', 1200000, 360000000, 91, 109200000, N'', 0, CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2), NULL, CAST(N'2024-10-16T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-16T00:00:00.0000000' AS DateTime2), N'Canceled', N'MD-01-2024-00012', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241013NO0001', N'Hợp đồng thuê máy MK-01-2024-00004', 8, N'REH20241013NO001', 600000, 180380000, 91, 54600000, N'Hoàn trả tiền vận chuyển tạm tính là: 380,000 ₫ vào tiền đặt cọc ban đầu: 180,000,000 ₫, tiền đặt cọc mới là 180,380,000 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 380000, CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-13T09:00:00.0000000' AS DateTime2), CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-24T00:00:00.0000000' AS DateTime2), N'Renting', N'MK-01-2024-00004', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241013NO0002', N'Hợp đồng thuê máy MK-01-2024-00001', 8, N'REH20241013NO001', 600000, 180380000, 91, 54600000, N'Hoàn trả tiền vận chuyển tạm tính là: 380,000 ₫ vào tiền đặt cọc ban đầu: 180,000,000 ₫, tiền đặt cọc mới là 180,380,000 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 380000, CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-13T09:00:00.0000000' AS DateTime2), CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-24T00:00:00.0000000' AS DateTime2), N'Renting', N'MK-01-2024-00001', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241110NO0001', N'Hợp đồng thuê máy MD-01-2024-00003', 9, N'REH20240705NO001', 840000, 360000000, 63, 52920000, N'', 0, CAST(N'2024-11-10T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-10T15:16:23.1830000' AS DateTime2), CAST(N'2024-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2), N'Renting', N'MD-01-2024-00003', N'CON20240705NO0001', 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241118NO0001', N'Hợp đồng thuê máy MM-01-2024-00005', 17, N'REH20241118NO001', 320000, 240385000, 244, 78080000, N'Hoàn trả tiền vận chuyển tạm tính là: 385,000 ₫ vào tiền đặt cọc ban đầu: 240,000,000 ₫, tiền đặt cọc mới là 240,385,000 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 385000, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-18T09:00:00.0000000' AS DateTime2), CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), N'Renting', N'MM-01-2024-00005', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241118NO0002', N'Hợp đồng thuê máy MM-01-2024-00006', 17, N'REH20241118NO001', 480000, 240385000, 244, 117120000, N'Hoàn trả tiền vận chuyển tạm tính là: 385,000 ₫ vào tiền đặt cọc ban đầu: 240,000,000 ₫, tiền đặt cọc mới là 240,385,000 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 385000, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-18T09:00:00.0000000' AS DateTime2), CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), N'Renting', N'MM-01-2024-00006', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241205NO0001', N'Hợp đồng thuê máy MP-02-2024-00001', 24, N'REH20241205NO001', 850000, 255000000, 152, 129200000, N'', 0, CAST(N'2024-12-05T11:56:58.8669754' AS DateTime2), CAST(N'2024-12-05T11:58:15.1334540' AS DateTime2), CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), N'Renting', N'MP-02-2024-00001', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241205NO0002', N'Hợp đồng thuê máy MP-02-2024-00008', 24, N'REH20241205NO001', 850000, 255000000, 152, 129200000, N'', 0, CAST(N'2024-12-05T11:56:59.0485931' AS DateTime2), CAST(N'2024-12-05T11:58:15.1754907' AS DateTime2), CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), N'Renting', N'MP-02-2024-00008', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241209NO0001', N'Hợp đồng thuê máy MD-01-2024-00015', 9, N'REH20241209NO001', 840000, 360665000, 183, 153720000, N'Hoàn trả tiền vận chuyển tạm tính là: 665,000 ₫ vào tiền đặt cọc ban đầu: 360,000,000 ₫, tiền đặt cọc mới là 360,665,000 ₫ sẽ được hoàn trả khi tất toán hợp đồng', 665000, CAST(N'2024-12-09T08:15:59.2054649' AS DateTime2), CAST(N'2024-12-09T08:16:42.9412642' AS DateTime2), CAST(N'2024-12-17T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-17T00:00:00.0000000' AS DateTime2), N'Renting', N'MD-01-2024-00015', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241213NO0001', N'Hợp đồng thuê máy MM-01-2024-00004', 24, N'REH20241213NO001', 640000, 240000000, 122, 78080000, N'', 0, CAST(N'2024-12-13T21:03:59.7645570' AS DateTime2), CAST(N'2024-12-13T21:04:44.9307249' AS DateTime2), CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), N'Shipping', N'MM-01-2024-00004', NULL, 0)
INSERT [dbo].[Contract] ([ContractId], [ContractName], [AccountSignId], [RentingRequestId], [RentPrice], [DepositPrice], [RentPeriod], [TotalRentPrice], [Content], [RefundShippingPrice], [DateCreate], [DateSign], [DateStart], [DateEnd], [Status], [SerialNumber], [BaseContractId], [IsExtended]) VALUES (N'CON20241213NO0002', N'Hợp đồng thuê máy MM-01-2024-00009', 24, N'REH20241213NO001', 640000, 240000000, 122, 78080000, N'', 0, CAST(N'2024-12-13T21:03:59.8447585' AS DateTime2), CAST(N'2024-12-13T21:04:45.0582464' AS DateTime2), CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), N'Shipping', N'MM-01-2024-00009', NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[ContractDelivery] ON 

INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1006, N'CON20241205NO0001', 1005, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734142659/sk7lyq7uszqjzbli0934.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1007, N'CON20241205NO0002', 1005, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734142659/sk7lyq7uszqjzbli0934.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1010, N'CON20241209NO0001', 1007, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734142659/sk7lyq7uszqjzbli0934.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1011, N'CON20240612NO0001', 1008, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1733992921/lalxkg1h7pbgl6swi9jh.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1012, N'CON20240612NO0002', 1008, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1733992927/lumyghwae1nagspxmntu.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1013, N'CON20241013NO0001', 1009, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734093905/avewjo8li6zfkhbpb01z.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1014, N'CON20241013NO0002', 1009, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734093911/kr5zs1qkuqqffcsmhhbm.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1015, N'CON20241118NO0001', 1010, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734095938/sp1bijdwyxml66bomsdl.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1016, N'CON20241118NO0002', 1010, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734095952/o1kkqimnnrri3zjzdn6n.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1017, N'CON20240805NO0001', 1011, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734097547/arqr03grjxg6ltulv99z.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1018, N'CON20240805NO0002', 1011, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734097564/lcwysfvoihfcvo5w1j4b.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1019, N'CON20240714NO0001', 1012, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734142659/sk7lyq7uszqjzbli0934.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1020, N'CON20240714NO0002', 1012, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734142678/nwfpxeerfs2p2xejgo1r.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1021, N'CON20240915NO0001', 1013, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734251138/fr03nnhswnneoz7yjuhb.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1022, N'CON20240915NO0002', 1013, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734251125/geh8rwe3e68kqi3nlrgt.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1023, N'CON20240915NO0003', 1013, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734251112/xub3scdpq8uuvewktb4a.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1024, N'CON20240705NO0001', 1014, N'https://res.cloudinary.com/dfdwupiah/image/upload/v1734508805/MMRMS/soxcjqjdmtejq2edsukh.jpg', N'', N'Success')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1025, N'CON20241213NO0001', 1015, NULL, NULL, N'Pending')
INSERT [dbo].[ContractDelivery] ([ContractDeliveryId], [ContractId], [DeliveryTaskId], [PictureUrl], [Note], [Status]) VALUES (1026, N'CON20241213NO0002', 1015, NULL, NULL, N'Pending')
SET IDENTITY_INSERT [dbo].[ContractDelivery] OFF
GO
SET IDENTITY_INSERT [dbo].[ContractPayment] ON 

INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (19, N'CON20241205NO0001', N'INV20241205NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241205NO0001', 255000000, CAST(N'2024-12-05T11:58:04.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), 152, CAST(N'2024-12-05T11:56:58.8894096' AS DateTime2), CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (20, N'CON20241205NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241205NO0001', 255000000, NULL, N'Pending', N'Refund', CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), 152, CAST(N'2024-12-05T11:56:58.8897684' AS DateTime2), CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (21, N'CON20241205NO0001', N'INV20241205NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241205NO0001', 129200000, CAST(N'2024-12-05T11:58:04.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), 152, CAST(N'2024-12-05T11:56:58.8897975' AS DateTime2), CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (22, N'CON20241205NO0002', N'INV20241205NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241205NO0002', 255000000, CAST(N'2024-12-05T11:58:04.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), 152, CAST(N'2024-12-05T11:56:59.0571026' AS DateTime2), CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (23, N'CON20241205NO0002', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241205NO0002', 255000000, NULL, N'Pending', N'Refund', CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), 152, CAST(N'2024-12-05T11:56:59.0571077' AS DateTime2), CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (24, N'CON20241205NO0002', N'INV20241205NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241205NO0002', 129200000, CAST(N'2024-12-05T11:58:04.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-13T00:00:00.0000000' AS DateTime2), 152, CAST(N'2024-12-05T11:56:59.0571101' AS DateTime2), CAST(N'2024-12-13T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (37, N'CON20241209NO0001', N'INV20241209NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241209NO0001', 360000000, CAST(N'2024-12-09T08:16:33.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-12-17T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-17T00:00:00.0000000' AS DateTime2), 183, CAST(N'2024-12-09T08:15:59.2236717' AS DateTime2), CAST(N'2024-12-17T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (38, N'CON20241209NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241209NO0001', 360000000, NULL, N'Pending', N'Refund', CAST(N'2025-06-17T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-17T00:00:00.0000000' AS DateTime2), 183, CAST(N'2024-12-09T08:15:59.2240399' AS DateTime2), CAST(N'2025-06-17T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (39, N'CON20241209NO0001', N'INV20241209NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241209NO0001', 153720000, CAST(N'2024-12-09T08:16:33.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-12-17T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-17T00:00:00.0000000' AS DateTime2), 183, CAST(N'2024-12-09T08:15:59.2240731' AS DateTime2), CAST(N'2024-12-17T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1055, N'CON20241011NO0001', N'INV20241011NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241211NO0001', 360000000, NULL, N'Canceled', N'Deposit', CAST(N'2024-10-16T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-16T00:00:00.0000000' AS DateTime2), 91, CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1056, N'CON20241011NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241211NO0001', 360000000, NULL, N'Canceled', N'Refund', CAST(N'2025-01-16T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-16T00:00:00.0000000' AS DateTime2), 91, CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2), CAST(N'2025-01-16T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1057, N'CON20241011NO0001', N'INV20241011NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241211NO0001', 109200000, NULL, N'Canceled', N'Rental', CAST(N'2024-10-16T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-16T00:00:00.0000000' AS DateTime2), 91, CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-11T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1073, N'CON20240612NO0001', N'INV20240612NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20240612NO0001', 360000000, CAST(N'2024-06-12T15:35:43.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-22T00:00:00.0000000' AS DateTime2), 183, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1074, N'CON20240612NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241212NO0001', 360000000, NULL, N'Pending', N'Refund', CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-22T00:00:00.0000000' AS DateTime2), 183, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-12-22T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1075, N'CON20240612NO0001', N'INV20240612NO001', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0001 - Lần 1', 5760000, CAST(N'2024-06-12T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), 12, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1076, N'CON20240612NO0001', N'INV20240612NO002', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0001 - Lần 2', 14880000, CAST(N'2024-06-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), 31, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1077, N'CON20240612NO0001', N'INV20240612NO003', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0001 - Lần 3', 13440000, CAST(N'2024-07-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-08-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 31, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1078, N'CON20240612NO0001', N'INV20240612NO004', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0001 - Lần 4', 14880000, CAST(N'2024-08-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 30, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-09-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1079, N'CON20240612NO0001', N'INV20240612NO005', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0001 - Lần 5', 14400000, CAST(N'2024-10-05T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-10-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-31T00:00:00.0000000' AS DateTime2), 31, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1080, N'CON20240612NO0001', N'INV20240612NO006', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0001- Lần 6', 14880000, CAST(N'2024-10-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-30T00:00:00.0000000' AS DateTime2), 30, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1081, N'CON20240612NO0001', N'INV20240612NO007', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0001 - Lần 7', 9600000, CAST(N'2024-11-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-22T00:00:00.0000000' AS DateTime2), 22, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-12-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1082, N'CON20240612NO0002', N'INV20240612NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20240612NO0002', 360000000, CAST(N'2024-06-12T15:35:43.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-22T00:00:00.0000000' AS DateTime2), 183, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1084, N'CON20240612NO0002', N'INV20240612NO001', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0002- Lần 1', 12960000, CAST(N'2024-12-12T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), 12, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1085, N'CON20240612NO0002', N'INV20240612NO002', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0002- Lần 2', 33480000, CAST(N'2024-06-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), 31, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1086, N'CON20240612NO0002', N'INV20240612NO003', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0002- Lần 3', 30240000, CAST(N'2024-07-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-08-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 31, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1087, N'CON20240612NO0002', N'INV20240612NO004', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0002- Lần 4', 33480000, CAST(N'2024-08-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 30, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-09-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1088, N'CON20240612NO0002', N'INV20240612NO005', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0002- Lần 5', 32400000, CAST(N'2024-10-05T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-10-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-31T00:00:00.0000000' AS DateTime2), 31, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1089, N'CON20240612NO0002', N'INV20240612NO006', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0002 - Lần 6', 33480000, CAST(N'2024-10-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-30T00:00:00.0000000' AS DateTime2), 30, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1090, N'CON20240612NO0002', N'INV20240612NO007', N'Thanh toán tiền thuê cho hợp đồng CON20240612NO0002 - Lần 7', 21600000, CAST(N'2024-11-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-12-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-22T00:00:00.0000000' AS DateTime2), 22, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-12-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1093, N'CON20240612NO0001', NULL, N'Tiền phạt do đóng tiền thuê trễ hạn cho hợp đồng CON20240612NO0001 ', 500000, NULL, N'Pending', N'Fine', CAST(N'2024-10-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-05T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-10-05T15:35:43.0000000' AS DateTime2), CAST(N'2024-10-05T15:35:43.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1094, N'CON20240612NO0002', NULL, N'Tiền phạt do đóng tiền thuê trễ hạn cho hợp đồng CON20240612NO0002', 500000, NULL, N'Pending', N'Fine', CAST(N'2024-10-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-05T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-10-05T15:35:43.0000000' AS DateTime2), CAST(N'2024-10-05T15:35:43.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1095, N'CON20240612NO0002', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241212NO0002', 360000000, NULL, N'Pending', N'Refund', CAST(N'2024-06-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-22T00:00:00.0000000' AS DateTime2), 183, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-12-22T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1096, N'CON20241013NO0001', N'INV20241013NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241213NO0001', 180000000, CAST(N'2024-10-13T09:00:00.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-24T00:00:00.0000000' AS DateTime2), 91, CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1097, N'CON20241013NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241213NO0001', 180000000, NULL, N'Pending', N'Refund', CAST(N'2025-01-24T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-24T00:00:00.0000000' AS DateTime2), 91, CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1098, N'CON20241013NO0001', N'INV20241013NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0001', 54600000, CAST(N'2024-10-13T09:00:00.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-24T00:00:00.0000000' AS DateTime2), 91, CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1099, N'CON20241013NO0002', N'INV20241013NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241213NO0002', 180000000, CAST(N'2024-10-13T09:00:00.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-24T00:00:00.0000000' AS DateTime2), 91, CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1100, N'CON20241013NO0002', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241213NO0002', 180000000, NULL, N'Pending', N'Refund', CAST(N'2025-01-24T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-24T00:00:00.0000000' AS DateTime2), 91, CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1101, N'CON20241013NO0002', N'INV20241013NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0002', 54600000, CAST(N'2024-10-13T09:00:00.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-24T00:00:00.0000000' AS DateTime2), 91, CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-24T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1102, N'CON20241118NO0001', N'INV20241118NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241213NO0001', 240000000, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1103, N'CON20241118NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241213NO0001', 240000000, NULL, N'Pending', N'Refund', CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1104, N'CON20241118NO0001', N'INV20241118NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0001', 78080000, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1105, N'CON20241118NO0002', N'INV20241118NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241213NO0002', 240000000, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1106, N'CON20241118NO0002', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241213NO0002', 240000000, NULL, N'Pending', N'Refund', CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1107, N'CON20241118NO0002', N'INV20241118NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0002', 117120000, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-27T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1108, N'CON20240805NO0001', N'INV20240805NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241213NO0001', 360000000, CAST(N'2024-12-13T20:41:45.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-25T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1109, N'CON20240805NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241213NO0001', 360000000, NULL, N'Pending', N'Refund', CAST(N'2025-04-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-25T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1110, N'CON20240805NO0001', N'INV20240805NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0001', 146400000, CAST(N'2024-12-13T20:41:45.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-25T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1111, N'CON20240805NO0002', N'INV20240805NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241213NO0002', 180000000, CAST(N'2024-12-13T20:41:45.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-25T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1112, N'CON20240805NO0002', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241213NO0002', 180000000, NULL, N'Pending', N'Refund', CAST(N'2025-04-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-25T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1113, N'CON20240805NO0002', N'INV20240805NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0002', 102480000, CAST(N'2024-12-13T20:41:45.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-25T00:00:00.0000000' AS DateTime2), 244, CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1114, N'CON20241213NO0001', N'INV20241213NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241213NO0001', 240000000, CAST(N'2024-12-13T21:04:34.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-12-13T21:03:59.7735596' AS DateTime2), CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1115, N'CON20241213NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241213NO0001', 240000000, NULL, N'Pending', N'Refund', CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-12-13T21:03:59.7735898' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1116, N'CON20241213NO0001', N'INV20241213NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0001 - Lần 1', 5760000, CAST(N'2024-12-13T21:04:34.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-31T00:00:00.0000000' AS DateTime2), 9, CAST(N'2024-12-13T21:03:59.7738949' AS DateTime2), CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1117, N'CON20241213NO0001', N'INV20241213NO002', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0001 - Lần 2', 19840000, NULL, N'Pending', N'Rental', CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-31T00:00:00.0000000' AS DateTime2), 31, CAST(N'2024-12-13T21:03:59.7739233' AS DateTime2), CAST(N'2025-01-16T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1118, N'CON20241213NO0001', N'INV20241213NO003', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0001 - Lần 3', 17920000, NULL, N'Pending', N'Rental', CAST(N'2025-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-28T00:00:00.0000000' AS DateTime2), 28, CAST(N'2024-12-13T21:03:59.7739492' AS DateTime2), CAST(N'2025-02-16T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1119, N'CON20241213NO0001', N'INV20241213NO004', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0001 - Lần 4', 19840000, NULL, N'Pending', N'Rental', CAST(N'2025-03-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-03-31T00:00:00.0000000' AS DateTime2), 31, CAST(N'2024-12-13T21:03:59.7739531' AS DateTime2), CAST(N'2025-03-16T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1120, N'CON20241213NO0001', N'INV20241213NO005', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0001 - Lần 5', 14720000, NULL, N'Pending', N'Rental', CAST(N'2025-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), 23, CAST(N'2024-12-13T21:03:59.7739541' AS DateTime2), CAST(N'2025-04-16T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1121, N'CON20241213NO0002', N'INV20241213NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241213NO0002', 240000000, CAST(N'2024-12-13T21:04:34.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-12-13T21:03:59.8530302' AS DateTime2), CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1122, N'CON20241213NO0002', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241213NO0002', 240000000, NULL, N'Pending', N'Refund', CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-12-13T21:03:59.8530392' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1123, N'CON20241213NO0002', N'INV20241213NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0002 - Lần 1', 5760000, CAST(N'2024-12-13T21:04:34.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-31T00:00:00.0000000' AS DateTime2), 9, CAST(N'2024-12-13T21:03:59.8530459' AS DateTime2), CAST(N'2024-12-23T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1124, N'CON20241213NO0002', N'INV20241213NO002', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0002 - Lần 2', 19840000, NULL, N'Pending', N'Rental', CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-31T00:00:00.0000000' AS DateTime2), 31, CAST(N'2024-12-13T21:03:59.8530512' AS DateTime2), CAST(N'2025-01-16T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1125, N'CON20241213NO0002', N'INV20241213NO003', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0002 - Lần 3', 17920000, NULL, N'Pending', N'Rental', CAST(N'2025-02-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-02-28T00:00:00.0000000' AS DateTime2), 28, CAST(N'2024-12-13T21:03:59.8530531' AS DateTime2), CAST(N'2025-02-16T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1126, N'CON20241213NO0002', N'INV20241213NO004', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0002 - Lần 4', 19840000, NULL, N'Pending', N'Rental', CAST(N'2025-03-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-03-31T00:00:00.0000000' AS DateTime2), 31, CAST(N'2024-12-13T21:03:59.8530550' AS DateTime2), CAST(N'2025-03-16T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1127, N'CON20241213NO0002', N'INV20241213NO005', N'Thanh toán tiền thuê cho hợp đồng CON20241213NO0002 - Lần 5', 14720000, NULL, N'Pending', N'Rental', CAST(N'2025-04-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), 23, CAST(N'2024-12-13T21:03:59.8530567' AS DateTime2), CAST(N'2025-04-16T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1128, N'CON20240714NO0001', N'INV20240714NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241214NO0001', 240000000, CAST(N'2024-07-14T09:12:40.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1129, N'CON20240714NO0001', N'INV20241125NO002', N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241214NO0001', 240000000, CAST(N'2024-11-25T09:12:40.0000000' AS DateTime2), N'Paid', N'Refund', CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1130, N'CON20240714NO0001', N'INV20240714NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241214NO0001', 39040000, CAST(N'2024-07-14T09:12:40.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1131, N'CON20240714NO0002', N'INV20240714NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241214NO0002', 240000000, CAST(N'2024-07-14T09:12:40.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1132, N'CON20240714NO0002', N'INV20241125NO001', N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241214NO0002', 240000000, CAST(N'2024-11-25T09:12:40.0000000' AS DateTime2), N'Paid', N'Refund', CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1133, N'CON20240714NO0002', N'INV20240714NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241214NO0002', 39040000, CAST(N'2024-07-14T09:12:40.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1134, N'CON20240915NO0001', N'INV20240915NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241215NO0001', 240000000, CAST(N'2024-09-15T16:00:40.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 121, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1135, N'CON20240915NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241215NO0001', 240000000, NULL, N'Pending', N'Refund', CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 121, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1136, N'CON20240915NO0001', N'INV20240915NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241215NO0001', 65520000, CAST(N'2024-09-15T16:00:40.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-30T00:00:00.0000000' AS DateTime2), 121, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1137, N'CON20240915NO0002', N'INV20240915NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241215NO0002', 240000000, CAST(N'2024-09-15T16:00:40.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 121, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1138, N'CON20240915NO0002', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241215NO0002', 240000000, NULL, N'Pending', N'Refund', CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 121, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1139, N'CON20240915NO0002', N'INV20240915NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241215NO0002', 91960000, CAST(N'2024-09-15T16:00:40.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 121, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1140, N'CON20240915NO0003', N'INV20240915NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241215NO0003', 255000000, CAST(N'2024-09-15T16:00:40.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 121, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1141, N'CON20240915NO0003', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241215NO0003', 255000000, NULL, N'Pending', N'Refund', CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 121, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1142, N'CON20240915NO0003', N'INV20240915NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241215NO0003', 41140000, CAST(N'2024-09-15T16:00:40.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-30T00:00:00.0000000' AS DateTime2), 121, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2024-09-30T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1143, N'CON20240705NO0001', N'INV20240705NO001', N'Thanh toán tiền đặt cọc cho hợp đồng CON20241218NO0001', 360000000, CAST(N'2024-07-05T14:56:15.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-07-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-15T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1144, N'CON20240705NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241218NO0001', 360000000, NULL, N'Paid', N'Refund', CAST(N'2024-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-15T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-15T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1145, N'CON20240705NO0001', N'INV20240705NO001', N'Thanh toán tiền thuê cho hợp đồng CON20241218NO0001', 102480000, CAST(N'2024-07-05T14:56:15.0000000' AS DateTime2), N'Paid', N'Rental', CAST(N'2024-07-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-15T00:00:00.0000000' AS DateTime2), 122, CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1146, N'CON20241110NO0001', N'INV20241110NO001', N'Thanh toán tiền gia hạn thuê cho hợp đồng CON20241110NO0001', 52920000, CAST(N'2024-11-10T09:00:00.0000000' AS DateTime2), N'Paid', N'Extend', CAST(N'2024-11-10T08:00:00.0000000' AS DateTime2), CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2), 63, CAST(N'2024-11-10T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-10T08:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1149, N'CON20241110NO0001', NULL, N'Thanh toán tiền đặt cọc cho hợp đồng CON20241110NO0001', 360000000, CAST(N'2024-11-10T09:00:00.0000000' AS DateTime2), N'Paid', N'Deposit', CAST(N'2024-11-10T08:00:00.0000000' AS DateTime2), CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2), 63, CAST(N'2024-11-10T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-10T08:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[ContractPayment] ([ContractPaymentId], [ContractId], [InvoiceId], [Title], [Amount], [CustomerPaidDate], [Status], [Type], [DateFrom], [DateTo], [Period], [DateCreate], [DueDate], [IsFirstRentalPayment]) VALUES (1150, N'CON20241110NO0001', NULL, N'Hoàn trả tiền đặt cọc cho hợp đồng CON20241110NO0001', 360000000, NULL, N'Pending', N'Refund', CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2), 63, CAST(N'2024-11-10T08:00:00.0000000' AS DateTime2), CAST(N'2025-01-15T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[ContractPayment] OFF
GO
SET IDENTITY_INSERT [dbo].[ContractTerm] ON 

INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (55, N'CON20241205NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-12-05T11:56:58.8669754' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (56, N'CON20241205NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-12-05T11:56:58.8669754' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (57, N'CON20241205NO0001', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-12-05T11:56:58.8669754' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (58, N'CON20241205NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-12-05T11:56:58.8669754' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (59, N'CON20241205NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-12-05T11:56:58.8669754' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (60, N'CON20241205NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-12-05T11:56:58.8669754' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (61, N'CON20241205NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-12-05T11:56:58.8669754' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (62, N'CON20241205NO0002', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-12-05T11:56:59.0485931' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (63, N'CON20241205NO0002', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-12-05T11:56:59.0485931' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (64, N'CON20241205NO0002', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-12-05T11:56:59.0485931' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (65, N'CON20241205NO0002', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-12-05T11:56:59.0485931' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (66, N'CON20241205NO0002', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-12-05T11:56:59.0485931' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (67, N'CON20241205NO0002', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-12-05T11:56:59.0485931' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (68, N'CON20241205NO0002', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-12-05T11:56:59.0485931' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (93, N'CON20241209NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-12-09T08:15:59.2054649' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (94, N'CON20241209NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-12-09T08:15:59.2054649' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (95, N'CON20241209NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-12-09T08:15:59.2054649' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (96, N'CON20241209NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-12-09T08:15:59.2054649' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (97, N'CON20241209NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-12-09T08:15:59.2054649' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (98, N'CON20241209NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-12-09T08:15:59.2054649' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1133, N'CON20241011NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1134, N'CON20241011NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1135, N'CON20241011NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1136, N'CON20241011NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1137, N'CON20241011NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1138, N'CON20241011NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1169, N'CON20240612NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1170, N'CON20240612NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1171, N'CON20240612NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1172, N'CON20240612NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1173, N'CON20240612NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1174, N'CON20240612NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1175, N'CON20240612NO0002', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1176, N'CON20240612NO0002', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1177, N'CON20240612NO0002', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1178, N'CON20240612NO0002', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1179, N'CON20240612NO0002', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1180, N'CON20240612NO0002', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1181, N'CON20241013NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1182, N'CON20241013NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1183, N'CON20241013NO0001', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1184, N'CON20241013NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1185, N'CON20241013NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1186, N'CON20241013NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1187, N'CON20241013NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1188, N'CON20241013NO0002', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1189, N'CON20241013NO0002', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1190, N'CON20241013NO0002', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1191, N'CON20241013NO0002', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1192, N'CON20241013NO0002', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1193, N'CON20241013NO0002', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1194, N'CON20241013NO0002', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1195, N'CON20241118NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1196, N'CON20241118NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1197, N'CON20241118NO0001', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1198, N'CON20241118NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1199, N'CON20241118NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1200, N'CON20241118NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1201, N'CON20241118NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1202, N'CON20241118NO0002', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1203, N'CON20241118NO0002', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1204, N'CON20241118NO0002', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1205, N'CON20241118NO0002', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1206, N'CON20241118NO0002', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1207, N'CON20241118NO0002', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1208, N'CON20241118NO0002', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1209, N'CON20240805NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1210, N'CON20240805NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1211, N'CON20240805NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1212, N'CON20240805NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1213, N'CON20240805NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1214, N'CON20240805NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1215, N'CON20240805NO0002', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1216, N'CON20240805NO0002', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1217, N'CON20240805NO0002', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1218, N'CON20240805NO0002', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1219, N'CON20240805NO0002', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1220, N'CON20240805NO0002', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1221, N'CON20240805NO0002', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1222, N'CON20241213NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-12-13T21:03:59.7645570' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1223, N'CON20241213NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-12-13T21:03:59.7645570' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1224, N'CON20241213NO0001', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-12-13T21:03:59.7645570' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1225, N'CON20241213NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-12-13T21:03:59.7645570' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1226, N'CON20241213NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-12-13T21:03:59.7645570' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1227, N'CON20241213NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-12-13T21:03:59.7645570' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1228, N'CON20241213NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-12-13T21:03:59.7645570' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1229, N'CON20241213NO0002', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-12-13T21:03:59.8447585' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1230, N'CON20241213NO0002', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-12-13T21:03:59.8447585' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1231, N'CON20241213NO0002', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-12-13T21:03:59.8447585' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1232, N'CON20241213NO0002', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-12-13T21:03:59.8447585' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1233, N'CON20241213NO0002', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-12-13T21:03:59.8447585' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1234, N'CON20241213NO0002', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-12-13T21:03:59.8447585' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1235, N'CON20241213NO0002', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-12-13T21:03:59.8447585' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1236, N'CON20240714NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1237, N'CON20240714NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1238, N'CON20240714NO0001', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1239, N'CON20240714NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1240, N'CON20240714NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1241, N'CON20240714NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
GO
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1242, N'CON20240714NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1243, N'CON20240714NO0002', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1244, N'CON20240714NO0002', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1245, N'CON20240714NO0002', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1246, N'CON20240714NO0002', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1247, N'CON20240714NO0002', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1248, N'CON20240714NO0002', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1249, N'CON20240714NO0002', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1250, N'CON20240915NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1251, N'CON20240915NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1252, N'CON20240915NO0001', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1253, N'CON20240915NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1254, N'CON20240915NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1255, N'CON20240915NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1256, N'CON20240915NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1257, N'CON20240915NO0002', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1258, N'CON20240915NO0002', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1259, N'CON20240915NO0002', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1260, N'CON20240915NO0002', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1261, N'CON20240915NO0002', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1262, N'CON20240915NO0002', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1263, N'CON20240915NO0002', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1264, N'CON20240915NO0003', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1265, N'CON20240915NO0003', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1266, N'CON20240915NO0003', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1267, N'CON20240915NO0003', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1268, N'CON20240915NO0003', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1269, N'CON20240915NO0003', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1270, N'CON20240915NO0003', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1271, N'CON20240705NO0001', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>', CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1272, N'CON20240705NO0001', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>', CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1273, N'CON20240705NO0001', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>', CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1274, N'CON20240705NO0001', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>', CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1275, N'CON20240705NO0001', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>', CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[ContractTerm] ([ContractTermId], [ContractId], [Title], [Content], [DateCreate]) VALUES (1276, N'CON20240705NO0001', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>', CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ContractTerm] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryTask] ON 

INSERT [dbo].[DeliveryTask] ([DeliveryTaskId], [StaffId], [ManagerId], [DateShip], [DateCreate], [DateCompleted], [Status], [Note], [ConfirmationPictureUrl], [ReceiverName], [DeliveryVehicleCounter]) VALUES (1005, 11, 2, CAST(N'2024-12-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-09T11:11:54.5609665' AS DateTime2), CAST(N'2024-12-11T13:59:57.7636321' AS DateTime2), N'Completed', N'Giao máy thành công.', N'', N'Hong Anh Khoa', 2)
INSERT [dbo].[DeliveryTask] ([DeliveryTaskId], [StaffId], [ManagerId], [DateShip], [DateCreate], [DateCompleted], [Status], [Note], [ConfirmationPictureUrl], [ReceiverName], [DeliveryVehicleCounter]) VALUES (1007, 4, 2, CAST(N'2024-12-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-11T10:43:12.1474686' AS DateTime2), CAST(N'2024-12-11T19:56:13.2297257' AS DateTime2), N'Completed', N'Giao máy thành công.', N'', N'Vo Minh Tri', 1)
INSERT [dbo].[DeliveryTask] ([DeliveryTaskId], [StaffId], [ManagerId], [DateShip], [DateCreate], [DateCompleted], [Status], [Note], [ConfirmationPictureUrl], [ReceiverName], [DeliveryVehicleCounter]) VALUES (1008, 7, 2, CAST(N'2024-06-20T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-14T15:39:19.0400000' AS DateTime2), CAST(N'2024-06-19T15:42:08.6180000' AS DateTime2), N'Completed', N'Giao máy thành công.', N'', N'Khang', 1)
INSERT [dbo].[DeliveryTask] ([DeliveryTaskId], [StaffId], [ManagerId], [DateShip], [DateCreate], [DateCompleted], [Status], [Note], [ConfirmationPictureUrl], [ReceiverName], [DeliveryVehicleCounter]) VALUES (1009, 20, 2, CAST(N'2024-10-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-14T19:41:57.3560000' AS DateTime2), CAST(N'2024-10-20T19:41:57.3560000' AS DateTime2), N'Completed', N'Giao máy thành công.', N'', N'Khoa', 1)
INSERT [dbo].[DeliveryTask] ([DeliveryTaskId], [StaffId], [ManagerId], [DateShip], [DateCreate], [DateCompleted], [Status], [Note], [ConfirmationPictureUrl], [ReceiverName], [DeliveryVehicleCounter]) VALUES (1010, 20, 2, CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-18T20:12:54.6570000' AS DateTime2), CAST(N'2024-11-24T00:00:00.0000000' AS DateTime2), N'Completed', N'Giao máy thành công.', N'', N'Nam', 1)
INSERT [dbo].[DeliveryTask] ([DeliveryTaskId], [StaffId], [ManagerId], [DateShip], [DateCreate], [DateCompleted], [Status], [Note], [ConfirmationPictureUrl], [ReceiverName], [DeliveryVehicleCounter]) VALUES (1011, 4, 2, CAST(N'2024-08-24T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-20T20:42:33.7860000' AS DateTime2), CAST(N'2024-08-23T20:46:05.6980000' AS DateTime2), N'Completed', N'Giao máy thành công.', N'', N'Hoàng', 1)
INSERT [dbo].[DeliveryTask] ([DeliveryTaskId], [StaffId], [ManagerId], [DateShip], [DateCreate], [DateCompleted], [Status], [Note], [ConfirmationPictureUrl], [ReceiverName], [DeliveryVehicleCounter]) VALUES (1012, 11, 2, CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T09:13:58.8490000' AS DateTime2), CAST(N'2024-07-23T09:18:00.2040000' AS DateTime2), N'Completed', N'Giao máy thành công.', N'', N'Tuấn Phương', 2)
INSERT [dbo].[DeliveryTask] ([DeliveryTaskId], [StaffId], [ManagerId], [DateShip], [DateCreate], [DateCompleted], [Status], [Note], [ConfirmationPictureUrl], [ReceiverName], [DeliveryVehicleCounter]) VALUES (1013, 11, 2, CAST(N'2024-09-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-20T15:20:35.4620000' AS DateTime2), CAST(N'2024-09-29T00:00:00.0000000' AS DateTime2), N'Completed', N'Giao máy thành công.', N'', N'Phương', 2)
INSERT [dbo].[DeliveryTask] ([DeliveryTaskId], [StaffId], [ManagerId], [DateShip], [DateCreate], [DateCompleted], [Status], [Note], [ConfirmationPictureUrl], [ReceiverName], [DeliveryVehicleCounter]) VALUES (1014, 20, 5, CAST(N'2024-07-14T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-10T14:57:40.0360000' AS DateTime2), CAST(N'2024-07-14T15:00:05.8390000' AS DateTime2), N'Completed', N'Giao máy thành công.', N'', N'Phương', 1)
INSERT [dbo].[DeliveryTask] ([DeliveryTaskId], [StaffId], [ManagerId], [DateShip], [DateCreate], [DateCompleted], [Status], [Note], [ConfirmationPictureUrl], [ReceiverName], [DeliveryVehicleCounter]) VALUES (1015, 4, 2, CAST(N'2024-12-20T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-20T11:40:08.5947636' AS DateTime2), NULL, N'Created', NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[DeliveryTask] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryTaskLog] ON 

INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1012, 1005, 2, N'Tạo và giao đơn giao cho nhân viên tên: Nguyễn Hoàng Long', CAST(N'2024-12-09T11:11:54.5888469' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1016, 1005, 11, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang giao]', CAST(N'2024-12-10T23:22:20.4824530' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1017, 1007, 2, N'Tạo và giao đơn giao cho nhân viên tên: Võ Đức Nguyên', CAST(N'2024-12-11T10:43:12.1843885' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1018, 1005, 11, N'Đơn giao hàng được hoàn thành toàn bộ', CAST(N'2024-12-11T13:59:57.7636321' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1019, 1007, 4, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang giao]', CAST(N'2024-12-11T19:50:38.9532101' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1020, 1007, 4, N'Đơn giao hàng được hoàn thành toàn bộ', CAST(N'2024-12-11T19:56:13.2297257' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1021, 1008, 2, N'Tạo và giao đơn giao cho nhân viên tên: Khoa Kĩ Thuật', CAST(N'2024-06-14T15:39:19.0490000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1022, 1008, 7, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang giao]', CAST(N'2024-06-15T15:40:00.1250000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1023, 1008, 7, N'Đơn giao hàng được hoàn thành toàn bộ', CAST(N'2024-06-19T15:42:08.6180000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1024, 1009, 2, N'Tạo và giao đơn giao cho nhân viên tên: Đinh Hoàng Thái', CAST(N'2024-10-14T19:41:57.3620000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1025, 1009, 20, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang giao]', CAST(N'2024-10-15T19:43:20.3390000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1026, 1009, 20, N'Đơn giao hàng được hoàn thành toàn bộ', CAST(N'2024-10-23T19:45:13.0370000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1027, 1010, 2, N'Tạo và giao đơn giao cho nhân viên tên: Đinh Hoàng Thái', CAST(N'2024-11-18T20:12:54.6630000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1028, 1010, 20, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang giao]', CAST(N'2024-11-22T20:17:15.8560000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1029, 1010, 20, N'Đơn giao hàng được hoàn thành toàn bộ', CAST(N'2024-11-24T20:19:13.5620000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1030, 1011, 2, N'Tạo và giao đơn giao cho nhân viên tên: Võ Đức Nguyên', CAST(N'2024-08-20T20:42:33.7980000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1031, 1011, 4, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang giao]', CAST(N'2024-08-22T20:44:04.7820000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1032, 1011, 4, N'Đơn giao hàng được hoàn thành toàn bộ', CAST(N'2024-08-23T20:44:04.7820000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1033, 1012, 2, N'Tạo và giao đơn giao cho nhân viên tên: Nguyễn Hoàng Long', CAST(N'2024-07-20T09:13:58.8560000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1034, 1012, 11, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang giao]', CAST(N'2024-07-23T09:13:58.8560000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1035, 1012, 11, N'Đơn giao hàng được hoàn thành toàn bộ', CAST(N'2024-07-22T09:13:58.8560000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1036, 1013, 2, N'Tạo và giao đơn giao cho nhân viên tên: Nguyễn Hoàng Long', CAST(N'2024-09-20T15:20:35.4750000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1037, 1013, 11, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang giao]', CAST(N'2024-09-29T15:21:38.0160000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1038, 1013, 11, N'Đơn giao hàng được hoàn thành toàn bộ', CAST(N'2024-09-29T15:25:40.2210000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1039, 1014, 5, N'Tạo và giao đơn giao cho nhân viên tên: Đinh Hoàng Thái', CAST(N'2024-07-10T14:57:40.0410000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1040, 1014, 20, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang giao]', CAST(N'2024-07-14T12:00:05.8390000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1041, 1014, 20, N'Đơn giao hàng được hoàn thành toàn bộ', CAST(N'2024-07-14T15:00:05.8390000' AS DateTime2))
INSERT [dbo].[DeliveryTaskLog] ([DeliveryTaskLogId], [DeliveryTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1042, 1015, 2, N'Tạo và giao đơn giao cho nhân viên tên: Võ Đức Nguyên', CAST(N'2024-12-20T11:40:08.5986875' AS DateTime2))
SET IDENTITY_INSERT [dbo].[DeliveryTaskLog] OFF
GO
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT22207252315052', N'INV20240612NO002', N'2281072020614', NULL, N'MB', N'MBBank', 74062000, N'Qaaxov1250  CASSO2368 4 fXKRPYJSuDLrdl6GeYSVX0w8 73809813073-740622200 VND-CHUYEN TIEN-OQCH37648809-MOMO73809813073MOMO', CAST(N'2024-12-12T15:35:43.0000000' AS DateTime2), N'1734017717')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT22207252315053', N'INV20240612NO003', N'2281072020614', NULL, N'MB', N'MBBank', 74062000, N'Qaaxov1250  CASSO2368 4 fXKRPYJSuDLrdl6GeYSVX0w8 73809813073-740622200 VND-CHUYEN TIEN-OQCH37648809-MOMO73809813073MOMO', CAST(N'2024-12-12T15:35:43.0000000' AS DateTime2), N'1734017717')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT22207252315054', N'INV20240612NO004', N'2281072020614', NULL, N'MB', N'MBBank', 74062000, N'Qaaxov1250  CASSO2368 4 fXKRPYJSuDLrdl6GeYSVX0w8 73809813073-740622200 VND-CHUYEN TIEN-OQCH37648809-MOMO73809813073MOMO', CAST(N'2024-12-12T15:35:43.0000000' AS DateTime2), N'1734017717')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT22207252315055', N'INV20240612NO005', N'2281072020614', NULL, N'MB', N'MBBank', 74062000, N'Qaaxov1250  CASSO2368 4 fXKRPYJSuDLrdl6GeYSVX0w8 73809813073-740622200 VND-CHUYEN TIEN-OQCH37648809-MOMO73809813073MOMO', CAST(N'2024-12-12T15:35:43.0000000' AS DateTime2), N'1734017717')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT22207252315056', N'INV20240612NO006', N'2281072020614', NULL, N'MB', N'MBBank', 74062000, N'Qaaxov1250  CASSO2368 4 fXKRPYJSuDLrdl6GeYSVX0w8 73809813073-740622200 VND-CHUYEN TIEN-OQCH37648809-MOMO73809813073MOMO', CAST(N'2024-12-12T15:35:43.0000000' AS DateTime2), N'1734017717')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT22207252315057', N'INV20240612NO007', N'2281072020614', NULL, N'MB', N'MBBank', 74062000, N'Qaaxov1250  CASSO2368 4 fXKRPYJSuDLrdl6GeYSVX0w8 73809813073-740622200 VND-CHUYEN TIEN-OQCH37648809-MOMO73809813073MOMO', CAST(N'2024-12-12T15:35:43.0000000' AS DateTime2), N'1734017717')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT23348747406308', N'INV20240821NO001', N'2281072020614', NULL, N'MB', N'MBBank', 50111000, N'Qaaygg7774  CASSO2368 4 S2Z430Kth5e9BRrkXseljrfc 74313047172-52920000 VND-CHUYEN TIEN-OQCH39564677-MOMO74313047172MOMO', CAST(N'2024-12-18T15:16:14.0000000' AS DateTime2), N'1734123846')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT23351408330759', N'INV20240916NO001', N'2281072020614', NULL, N'MB', N'MBBank', 20111000, N'Qaaygg7774  CASSO2368 4 S2Z430Kth5e9BRrkXseljrfc 74313047172-52920000 VND-CHUYEN TIEN-OQCH39564677-MOMO74313047172MOMO', CAST(N'2024-12-18T15:16:14.0000000' AS DateTime2), N'1734123846')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24340580200380', NULL, N'2281072020614', NULL, N'MB', N'MBBank', 55509000, N'Qaawxx0652  CASSO2368 4 cF3Pkbm20N3cm1Sn7eck8NhQ 73163274877-555092200 VND-CHUYEN TIEN-OQCH35345610-MOMO73163274877MOMO', CAST(N'2024-09-05T09:48:53.0000000' AS DateTime2), N'1733391239')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24340601402570', N'INV20241205NO001', N'2281072020614', NULL, N'MB', N'MBBank', 77026000, N'Qaawyf4744  CASSO2368 4 zqa6XQkr2HfYZFGei7pO7mlq 73175414414-770267200 VND-CHUYEN TIEN-OQCH35386412-MOMO73175414414MOMO', CAST(N'2024-12-05T11:58:04.0000000' AS DateTime2), N'1733399860')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24344595982237', N'INV20241209NO001', N'2281072020614', NULL, N'MB', N'MBBank', 51457000, N'Qaaxgw5608  CASSO2368 4 aR0Zg7MsDjAp9629wWIHGayQ 73501071346-514575100 VND-CHUYEN TIEN-OQCH36558565-MOMO73501071346MOMO', CAST(N'2024-12-09T08:16:33.0000000' AS DateTime2), N'1733732162')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24347252315057', N'INV20240612NO001', N'2281072020614', NULL, N'MB', N'MBBank', 74062000, N'Qaaxov1250  CASSO2368 4 fXKRPYJSuDLrdl6GeYSVX0w8 73809813073-740622200 VND-CHUYEN TIEN-OQCH37648809-MOMO73809813073MOMO', CAST(N'2024-12-12T15:35:43.0000000' AS DateTime2), N'1734017717')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24348007780236', N'INV20241118NO001', N'2281072020614', NULL, N'MB', N'MBBank', 67813000, N'Qaaxsk6112  CASSO2368 4 9Ilpj5IcybNlp5SZYA58wBcl 73922193518-678139600 VND-CHUYEN TIEN-OQCH38066572-MOMO73922193518MOMO', CAST(N'2024-12-13T20:11:20.0000000' AS DateTime2), N'1734120656')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24348697146086', N'INV20241013NO001', N'2281072020614', NULL, N'MB', N'MBBank', 47212000, N'Qaaxsi0338  CASSO2368 4 EoLTmR8XETbD3afCC2T5qGLH 73919575535-472121000 VND-CHUYEN TIEN-OQCH38054837-MOMO73919575535MOMO', CAST(N'2024-12-13T19:40:41.0000000' AS DateTime2), N'1734118814')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24348747406308', N'INV20240805NO001', N'2281072020614', NULL, N'MB', N'MBBank', 79135000, N'Qaaxsn1910  CASSO2368 4 7oQCOsVpam5zqotwIEp9vkLz 73924746167-791355800 VND-CHUYEN TIEN-OQCH38078240-MOMO73924746167MOMO', CAST(N'2024-12-13T20:41:45.0000000' AS DateTime2), N'1734122477')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24348793052908', N'INV20241213NO001', N'2281072020614', NULL, N'MB', N'MBBank', 49349000, N'Qaaxsp1422  CASSO2368 4 A5Pjral0GuHJUDxK9BATjvqu 73926630014-493492200 VND-CHUYEN TIEN-OQCH38086847-MOMO73926630014MOMO', CAST(N'2024-12-13T21:04:34.0000000' AS DateTime2), N'1734123846')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24349090085836', N'INV20240714NO001', N'2281072020614', NULL, N'MB', N'MBBank', 56005000, N'Qaaxtd9746  CASSO2368 4 1CzvKsnPFBgkT7JBzyxYNGeT 73955274374-560050200 VND-CHUYEN TIEN-OQCH38185934-MOMO73955274374MOMO', CAST(N'2024-12-14T09:12:40.0000000' AS DateTime2), N'1734167533')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24351029432140', N'INV20241021NO001', N'2281072020614', NULL, N'MB', N'MBBank', 50111000, N'Qaayae3234  CASSO2368 4 LAS4MMhGWTR606E7g0Y6hOFW 74150269593-50111000 VND-CHUYEN TIEN-OQCH38946760-MOMO74150269593MOMO', CAST(N'2024-12-16T15:02:52.0000000' AS DateTime2), N'1734361345')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24351203200600', N'INV20240911NO001', N'2281072020614', NULL, N'MB', N'MBBank', 15111000, N'Qaayaf7436  CASSO2368 4 kZUGX9n5lOkJX52P7AyO462v 74151602429-15111000 VND-CHUYEN TIEN-OQCH38951987-MOMO74151602429MOMO', CAST(N'2024-12-16T15:21:16.0000000' AS DateTime2), N'1734362434')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24351408330759', N'INV20240915NO001', N'2281072020614', NULL, N'MB', N'MBBank', 95886000, N'Qaaxxh9962  CASSO2368 4 PqfhMiM3nLGr5ZhzvY2XWyvo 74066614028-958860300 VND-CHUYEN TIEN-OQCH38625516-MOMO74066614028MOMO', CAST(N'2024-12-15T15:19:40.0000000' AS DateTime2), N'1734275949')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24351432000716', N'INV20241116NO001', N'2281072020614', NULL, N'MB', N'MBBank', 20111000, N'Qaaxxk9154  CASSO2368 4 5CQVzAYSYIgxQTWU1PPmDbe6 74069205360-20111000 VND-CHUYEN TIEN-OQCH38635730-MOMO74069205360MOMO', CAST(N'2024-12-15T15:52:56.0000000' AS DateTime2), N'1734277951')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24351931388019', N'INV20241216NO001', N'2281072020614', NULL, N'MB', N'MBBank', 5111000, N'Qaaxxn5990  CASSO2368 4 yPaaOKd6M0RNb6VV4pmU2GNk 74070944051-5111000 VND-CHUYEN TIEN-OQCH38643829-MOMO74070944051MOMO', CAST(N'2024-12-15T16:18:06.0000000' AS DateTime2), N'1734279461')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24353738553311', N'INV20240705NO001', N'2281072020614', NULL, N'MB', N'MBBank', 46363000, N'Qaaygf2343  CASSO2368 4 m9jeYmvNpYyVFRLtMhZmMUTc 74311534533-463635100 VND-CHUYEN TIEN-OQCH39559572-MOMO74311534533MOMO', CAST(N'2024-12-18T14:56:15.0000000' AS DateTime2), N'1734533743')
INSERT [dbo].[DigitalTransactions] ([DigitalTransactionId], [InvoiceId], [AccountNumber], [AccountName], [BankCode], [BankName], [Amount], [Description], [TransactionDate], [PayOsOrderId]) VALUES (N'FT24353918021895', N'INV20241110NO001', N'2281072020614', NULL, N'MB', N'MBBank', 52920000, N'Qaaygg7774  CASSO2368 4 S2Z430Kth5e9BRrkXseljrfc 74313047172-52920000 VND-CHUYEN TIEN-OQCH39564677-MOMO74313047172MOMO', CAST(N'2024-12-18T15:16:14.0000000' AS DateTime2), N'1734534935')
GO
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240612NO001', 24, NULL, N'FT24347252315057', N'Digital', 740622200, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-12T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734017717', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240612NO002', 24, NULL, N'FT22207252315052', N'Digital', 48360000, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-06-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734013217', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240612NO003', 24, NULL, N'FT22207252315053', N'Digital', 43680000, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'17340121217', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240612NO004', 24, NULL, N'FT22207252315054', N'Digital', 48360000, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734017337', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240612NO005', 24, NULL, N'FT22207252315055', N'Digital', 46800000, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-05T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'173411017717', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240612NO006', 24, NULL, N'FT22207252315056', N'Digital', 48360000, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'17340317717', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240612NO007', 24, NULL, N'FT22207252315057', N'Digital', 31200000, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-22T15:35:43.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734017232717', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240705NO001', 9, NULL, N'FT24353738553311', N'Digital', 463635100, CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-05T14:56:15.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734533743', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240714NO001', 9, NULL, N'FT24349090085836', N'Digital', 560050200, CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), CAST(N'2024-07-14T09:12:40.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734167533', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240805NO001', 19, NULL, N'FT24348747406308', N'Digital', 791355800, CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-05T09:00:00.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734122477', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240821NO001', 19, N'CRT20240821NO001', N'FT23348747406308', N'Digital', 50111000, CAST(N'2024-08-21T08:00:00.0000000' AS DateTime2), CAST(N'2024-08-21T08:00:00.0000000' AS DateTime2), N'Paid', N'ComponentTicket', N'', N'173412247785', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240911NO001', 24, N'CRT20240911NO001', N'FT24351203200600', N'Digital', 15111000, CAST(N'2024-09-11T15:20:25.9150000' AS DateTime2), CAST(N'2024-09-11T15:21:25.9150000' AS DateTime2), N'Paid', N'ComponentTicket', NULL, N'1734362434', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240915NO001', 9, NULL, N'FT24351408330759', N'Digital', 937260300, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), CAST(N'2024-09-15T16:00:40.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734275949', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20240916NO001', 9, N'CRT20240916NO001', N'FT23351408330759', N'Digital', 20111000, CAST(N'2024-09-16T16:30:45.2220000' AS DateTime2), NULL, N'Paid', N'ComponentTicket', N'', N'1734123846', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241011NO001', 8, NULL, NULL, NULL, 470360500, CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2), NULL, N'Canceled', N'Rental', N'', NULL, NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241013NO001', 8, NULL, N'FT24348697146086', N'Digital', 472121000, CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), CAST(N'2024-10-13T09:00:00.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734118814', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241021NO001', 9, N'CRT20241021NO001', N'FT24351029432140', N'Digital', 50111000, CAST(N'2024-10-21T15:02:15.9010000' AS DateTime2), CAST(N'2024-10-21T15:04:15.9010000' AS DateTime2), N'Paid', N'ComponentTicket', NULL, N'1734361345', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241110NO001', 9, NULL, N'FT24353918021895', N'Digital', 52920000, CAST(N'2024-11-10T08:00:00.0000000' AS DateTime2), CAST(N'2024-12-18T15:16:14.0000000' AS DateTime2), N'Paid', N'Extend', N'', N'1734534935', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241116NO001', 9, N'CRT20241116NO001', N'FT24351432000716', N'Digital', 20111000, CAST(N'2024-11-16T15:52:10.3130000' AS DateTime2), CAST(N'2024-11-16T15:59:10.3130000' AS DateTime2), N'Paid', N'ComponentTicket', NULL, N'1734277951', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241118NO001', 17, NULL, N'FT24348007780236', N'Digital', 678139600, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), CAST(N'2024-11-18T09:00:00.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734120656', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241125NO001', 2, NULL, NULL, N'Digital', 240000000, CAST(N'2024-11-25T15:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T15:00:00.0000000' AS DateTime2), N'Paid', N'Refund', N'Hóa đơn hoàn trả tiền đặt cọc cho hợp đồng CON20240714NO0002', NULL, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734144073/juoqroxuiafk1fjynvz7.jpg')
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241125NO002', 2, NULL, NULL, N'Digital', 240000000, CAST(N'2024-11-25T15:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T15:00:00.0000000' AS DateTime2), N'Paid', N'Refund', N'Hóa đơn hoàn trả tiền đặt cọc cho hợp đồng CON20240714NO0001', NULL, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734144109/cebew0btylsrlo8kzp7x.jpg')
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241205NO001', 24, NULL, N'FT24340601402570', N'Digital', 770267200, CAST(N'2024-12-05T11:56:59.1781293' AS DateTime2), CAST(N'2024-12-05T11:58:04.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1733399860', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241209NO001', 9, NULL, N'FT24344595982237', N'Digital', 514575100, CAST(N'2024-12-09T08:15:59.4442789' AS DateTime2), CAST(N'2024-12-09T08:16:33.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1733732162', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241213NO001', 24, NULL, N'FT24348793052908', N'Digital', 493492200, CAST(N'2024-12-13T21:03:59.9105809' AS DateTime2), CAST(N'2024-12-13T21:04:34.0000000' AS DateTime2), N'Paid', N'Rental', N'', N'1734123846', NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241213NO002', 24, NULL, NULL, NULL, 39680000, CAST(N'2024-12-13T21:04:45.1162120' AS DateTime2), NULL, N'Pending', N'Rental', N'', NULL, NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241213NO003', 24, NULL, NULL, NULL, 35840000, CAST(N'2024-12-13T21:04:45.1511249' AS DateTime2), NULL, N'Pending', N'Rental', N'', NULL, NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241213NO004', 24, NULL, NULL, NULL, 39680000, CAST(N'2024-12-13T21:04:45.1831843' AS DateTime2), NULL, N'Pending', N'Rental', N'', NULL, NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241213NO005', 24, NULL, NULL, NULL, 29440000, CAST(N'2024-12-13T21:04:45.2226668' AS DateTime2), NULL, N'Pending', N'Rental', N'', NULL, NULL)
INSERT [dbo].[Invoices] ([InvoiceId], [AccountPaidId], [ComponentReplacementTicketId], [DigitalTransactionId], [PaymentMethod], [Amount], [DateCreate], [DatePaid], [Status], [Type], [Note], [PayOsOrderId], [PaymentConfirmationUrl]) VALUES (N'INV20241216NO001', 17, N'CRT20241216NO001', N'FT24351931388019', N'Digital', 5111000, CAST(N'2024-12-16T16:17:29.0590000' AS DateTime2), CAST(N'2024-12-16T16:18:06.0000000' AS DateTime2), N'Paid', N'ComponentTicket', NULL, N'1734279461', NULL)
GO
SET IDENTITY_INSERT [dbo].[LogDetail] ON 

INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (102, 9, N'Login', CAST(N'2024-12-09T09:07:56.1496228' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (103, 3, N'Login', CAST(N'2024-12-09T09:37:23.8227190' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (104, 9, N'Login', CAST(N'2024-12-09T09:39:50.6425399' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1093, 24, N'Login', CAST(N'2024-12-09T10:01:07.1234846' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1094, 11, N'Login', CAST(N'2024-12-09T10:01:19.1920287' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1095, 22, N'Login', CAST(N'2024-12-09T10:01:43.8535490' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1096, 3, N'Login', CAST(N'2024-12-09T10:20:39.4932773' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1097, 2, N'Login', CAST(N'2024-12-09T10:30:46.9679882' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1098, 2, N'Login', CAST(N'2024-12-09T11:30:12.4260409' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1099, 5, N'Login', CAST(N'2024-12-10T09:42:27.0635692' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1100, 9, N'Login', CAST(N'2024-12-10T13:45:06.3156185' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1102, 3, N'Login', CAST(N'2024-12-10T19:54:12.8058095' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1104, 3, N'Login', CAST(N'2024-12-10T20:21:41.9073258' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1106, 9, N'Login', CAST(N'2024-12-10T22:33:58.7761622' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1107, 2, N'Login', CAST(N'2024-12-10T22:35:29.9488729' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1108, 3, N'Login', CAST(N'2024-12-10T22:42:44.2241450' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1109, 2, N'Login', CAST(N'2024-12-10T22:48:48.1317554' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1110, 24, N'Login', CAST(N'2024-12-10T22:56:53.0769603' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1111, 9, N'Login', CAST(N'2024-12-10T22:58:49.3009336' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1112, 9, N'Login', CAST(N'2024-12-10T22:59:19.2602811' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1113, 8, N'Login', CAST(N'2024-12-10T22:59:57.8890496' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1114, 3, N'Login', CAST(N'2024-12-10T23:03:00.3753383' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1115, 2, N'Login', CAST(N'2024-12-10T23:06:51.8142687' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1116, 2, N'Login', CAST(N'2024-12-10T23:15:50.6398699' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1117, 22, N'Login', CAST(N'2024-12-10T23:21:14.4240628' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1118, 11, N'Login', CAST(N'2024-12-10T23:22:08.2241594' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1121, 2, N'Login', CAST(N'2024-12-10T23:23:33.4428540' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1122, 2, N'Login', CAST(N'2024-12-10T23:25:51.3171507' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1123, 24, N'Login', CAST(N'2024-12-10T23:43:49.7796422' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1124, 8, N'Login', CAST(N'2024-12-10T23:57:46.6732582' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1125, 24, N'Login', CAST(N'2024-12-11T00:01:02.1741840' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1126, 24, N'Login', CAST(N'2024-12-11T00:06:21.8358382' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1127, 9, N'Login', CAST(N'2024-12-11T00:09:11.9467840' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1128, 9, N'Login', CAST(N'2024-12-11T00:18:58.9685195' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1129, 8, N'Login', CAST(N'2024-12-11T07:33:06.3547449' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1130, 9, N'Login', CAST(N'2024-12-11T09:02:24.1752798' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1131, 3, N'Login', CAST(N'2024-12-11T09:04:54.4091543' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1132, 3, N'Login', CAST(N'2024-12-11T09:07:17.7302817' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1133, 2, N'Login', CAST(N'2024-12-11T09:10:09.9431278' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1134, 3, N'Login', CAST(N'2024-12-11T09:10:34.8687022' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1135, 11, N'Login', CAST(N'2024-12-11T09:16:49.9586422' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1136, 3, N'Login', CAST(N'2024-12-11T09:27:50.3810621' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1137, 2, N'Login', CAST(N'2024-12-11T09:32:08.6450098' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1138, 3, N'Login', CAST(N'2024-12-11T09:33:05.3815919' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1139, 2, N'Login', CAST(N'2024-12-11T09:51:44.7020336' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1140, 3, N'Login', CAST(N'2024-12-11T10:01:48.8757305' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1141, 2, N'Login', CAST(N'2024-12-11T10:08:33.3215287' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1142, 3, N'Login', CAST(N'2024-12-11T10:11:39.5835457' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1143, 11, N'Login', CAST(N'2024-12-11T10:19:20.7494297' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1144, 2, N'Login', CAST(N'2024-12-11T10:38:05.8755505' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1151, 3, N'Login', CAST(N'2024-12-11T13:46:25.4718138' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1152, 2, N'Login', CAST(N'2024-12-11T14:00:19.9974526' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1153, 2, N'Login', CAST(N'2024-12-11T14:11:20.1800332' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1154, 1, N'Login', CAST(N'2024-12-11T14:36:52.7865464' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1155, 9, N'Login', CAST(N'2024-12-11T14:37:12.8131296' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1156, 24, N'Login', CAST(N'2024-12-11T14:42:17.7820337' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1158, 2, N'Login', CAST(N'2024-12-11T14:55:17.7016549' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1159, 9, N'Login', CAST(N'2024-12-11T14:56:18.8463131' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1160, 24, N'Login', CAST(N'2024-12-11T14:56:49.2659513' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1161, 3, N'Login', CAST(N'2024-12-11T14:58:42.4477260' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1163, 2, N'Login', CAST(N'2024-12-11T16:15:08.9396501' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1164, 9, N'Login', CAST(N'2024-12-11T16:22:07.7334977' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1165, 11, N'Login', CAST(N'2024-12-11T16:42:12.7654384' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1166, 5, N'Login', CAST(N'2024-12-11T16:52:00.1759708' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1167, 24, N'Login', CAST(N'2024-12-11T16:57:41.8161325' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1168, 11, N'Login', CAST(N'2024-12-11T17:19:46.0058094' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1169, 5, N'Login', CAST(N'2024-12-11T19:21:45.6103403' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1170, 2, N'Login', CAST(N'2024-12-11T19:22:30.0844999' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1171, 2, N'Login', CAST(N'2024-12-11T19:47:22.3553929' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1172, 4, N'Login', CAST(N'2024-12-11T19:50:31.9772341' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1173, 24, N'Login', CAST(N'2024-12-11T20:51:57.6003906' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1174, 24, N'Login', CAST(N'2024-12-11T20:55:22.4114884' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1175, 24, N'Login', CAST(N'2024-12-11T20:57:22.0182135' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1178, 8, N'Login', CAST(N'2024-12-12T07:30:14.4546658' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1179, 8, N'Login', CAST(N'2024-12-12T08:30:01.4305876' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1180, 9, N'Login', CAST(N'2024-12-12T08:38:33.5776163' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1181, 3, N'Login', CAST(N'2024-12-12T09:09:28.1210346' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1182, 2, N'Login', CAST(N'2024-12-12T09:11:39.2564691' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1183, 9, N'Login', CAST(N'2024-12-12T09:11:50.9233189' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1184, 8, N'Login', CAST(N'2024-12-12T09:25:51.4248697' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1185, 1, N'Login', CAST(N'2024-12-12T09:44:08.9244477' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1186, 24, N'Login', CAST(N'2024-12-12T09:46:58.2599495' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1187, 9, N'Login', CAST(N'2024-12-12T10:14:52.4464953' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1188, 5, N'Login', CAST(N'2024-12-12T10:29:16.2455349' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1189, 9, N'Login', CAST(N'2024-12-12T10:49:50.2533780' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1190, 24, N'Login', CAST(N'2024-12-12T10:51:56.0516226' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1191, 3, N'Login', CAST(N'2024-12-12T11:41:30.5437847' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1192, 2, N'Login', CAST(N'2024-12-12T11:41:36.9938941' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1193, 2, N'Login', CAST(N'2024-12-12T12:13:22.0911056' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1194, 9, N'Login', CAST(N'2024-12-12T12:50:09.6179975' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1195, 5, N'Login', CAST(N'2024-12-12T12:57:53.6598932' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1196, 9, N'Login', CAST(N'2024-12-12T13:05:46.1958676' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1197, 2, N'Login', CAST(N'2024-12-12T13:12:40.0280820' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1198, 9, N'Login', CAST(N'2024-12-12T14:12:26.2385239' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1199, 24, N'Login', CAST(N'2024-12-12T14:28:06.9127169' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1200, 24, N'Login', CAST(N'2024-12-12T15:25:32.6458142' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1201, 24, N'Login', CAST(N'2024-12-12T15:29:36.5176487' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1202, 2, N'Login', CAST(N'2024-12-12T15:33:46.0313634' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1203, 24, N'Login', CAST(N'2024-12-12T15:34:06.7067452' AS DateTime2))
GO
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1204, 2, N'Login', CAST(N'2024-12-12T15:36:31.7729959' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1205, 7, N'Login', CAST(N'2024-12-12T15:39:53.3434310' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1206, 6, N'Login', CAST(N'2024-12-12T15:45:25.7980684' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1207, 5, N'Login', CAST(N'2024-12-12T15:54:00.7015449' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1208, 6, N'Login', CAST(N'2024-12-12T15:56:49.8334551' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1209, 5, N'Login', CAST(N'2024-12-12T15:58:30.8997742' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1210, 2, N'Login', CAST(N'2024-12-12T16:49:13.4815794' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1211, 3, N'Login', CAST(N'2024-12-12T17:05:33.9201163' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1212, 2, N'Login', CAST(N'2024-12-12T17:17:01.6050001' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1213, 2, N'Login', CAST(N'2024-12-12T18:32:02.7187245' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1214, 5, N'Login', CAST(N'2024-12-12T18:50:10.3244508' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1215, 3, N'Login', CAST(N'2024-12-13T10:29:26.5896517' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1216, 7, N'Login', CAST(N'2024-12-13T10:29:57.9598801' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1217, 9, N'Login', CAST(N'2024-12-13T10:37:43.7019353' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1218, 7, N'Login', CAST(N'2024-12-13T10:40:56.0557964' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1219, 9, N'Login', CAST(N'2024-12-13T10:53:21.0604997' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1220, 2, N'Login', CAST(N'2024-12-13T11:21:59.7024315' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1221, 6, N'Login', CAST(N'2024-12-13T19:13:01.4333994' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1222, 8, N'Login', CAST(N'2024-12-13T19:30:24.4032314' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1223, 3, N'Login', CAST(N'2024-12-13T19:31:21.8150410' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1224, 2, N'Login', CAST(N'2024-12-13T19:41:11.2738011' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1225, 20, N'Login', CAST(N'2024-12-13T19:42:25.7336398' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1226, 17, N'Login', CAST(N'2024-12-13T20:07:05.5758086' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1227, 5, N'Login', CAST(N'2024-12-13T20:34:37.9352484' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1228, 19, N'Login', CAST(N'2024-12-13T20:36:48.7985615' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1229, 4, N'Login', CAST(N'2024-12-13T20:43:40.1677254' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1230, 24, N'Login', CAST(N'2024-12-13T21:00:50.0462404' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1231, 3, N'Login', CAST(N'2024-12-13T21:04:57.9797968' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1232, 2, N'Login', CAST(N'2024-12-13T21:25:52.6701601' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1233, 3, N'Login', CAST(N'2024-12-13T23:05:20.6571332' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1234, 2, N'Login', CAST(N'2024-12-13T23:41:02.0611041' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1235, 9, N'Login', CAST(N'2024-12-14T09:05:00.2934007' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1236, 2, N'Login', CAST(N'2024-12-14T09:09:01.5530463' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1237, 11, N'Login', CAST(N'2024-12-14T09:14:20.8500868' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1238, 4, N'Login', CAST(N'2024-12-14T09:21:33.9804802' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1239, 2, N'Login', CAST(N'2024-12-14T09:39:28.3250070' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1240, 9, N'Login', CAST(N'2024-12-14T10:09:18.9807907' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1241, 8, N'Login', CAST(N'2024-12-14T10:10:23.7247070' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1242, 7, N'Login', CAST(N'2024-12-14T10:13:13.8736877' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1243, 3, N'Login', CAST(N'2024-12-14T10:15:20.8751491' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1244, 5, N'Login', CAST(N'2024-12-15T15:05:51.9617969' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1245, 9, N'Login', CAST(N'2024-12-15T15:08:40.0043214' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1246, 2, N'Login', CAST(N'2024-12-15T15:12:41.9649893' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1247, 8, N'Login', CAST(N'2024-12-15T15:14:40.1879757' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1248, 11, N'Login', CAST(N'2024-12-15T15:21:30.8759249' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1249, 9, N'Login', CAST(N'2024-12-15T16:01:41.9955019' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1250, 8, N'Login', CAST(N'2024-12-15T16:13:59.0791527' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1251, 17, N'Login', CAST(N'2024-12-15T16:14:38.4370225' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1252, 7, N'Login', CAST(N'2024-12-15T16:16:37.3274892' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1253, 2, N'Login', CAST(N'2024-12-15T16:18:42.8441009' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1254, 1, N'Login', CAST(N'2024-12-15T16:27:18.6371808' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1255, 24, N'Login', CAST(N'2024-12-15T16:28:14.0606440' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1256, 19, N'Login', CAST(N'2024-12-15T16:29:28.2998246' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1257, 5, N'Login', CAST(N'2024-12-16T09:05:16.5661824' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1258, 11, N'Login', CAST(N'2024-12-16T09:08:48.1095502' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1259, 1, N'Login', CAST(N'2024-12-16T09:30:48.0217943' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1260, 19, N'Login', CAST(N'2024-12-16T09:41:26.4105996' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1261, 9, N'Login', CAST(N'2024-12-16T09:47:47.6127666' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1262, 1, N'Login', CAST(N'2024-12-16T09:48:54.7851372' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1263, 24, N'Login', CAST(N'2024-12-16T10:02:02.0579055' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1264, 19, N'Login', CAST(N'2024-12-16T10:04:24.5997856' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1265, 9, N'Login', CAST(N'2024-12-16T10:05:19.4989152' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1266, 2, N'Login', CAST(N'2024-12-16T10:05:40.3618979' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1267, 24, N'Login', CAST(N'2024-12-16T10:06:10.0583595' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1268, 9, N'Login', CAST(N'2024-12-16T10:10:57.2296061' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1269, 9, N'Login', CAST(N'2024-12-16T10:11:42.5308908' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1270, 8, N'Login', CAST(N'2024-12-16T10:12:09.4673004' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1271, 3, N'Login', CAST(N'2024-12-16T10:12:52.9669444' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1272, 9, N'Login', CAST(N'2024-12-16T10:13:15.7628374' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1273, 24, N'Login', CAST(N'2024-12-16T10:13:23.3132545' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1274, 1, N'Login', CAST(N'2024-12-16T10:14:04.2903584' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1275, 9, N'Login', CAST(N'2024-12-16T10:14:09.8837346' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1276, 9, N'Login', CAST(N'2024-12-16T10:15:31.5613767' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1277, 19, N'Login', CAST(N'2024-12-16T10:36:59.4165067' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1278, 24, N'Login', CAST(N'2024-12-16T10:39:05.8003349' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1279, 5, N'Login', CAST(N'2024-12-16T10:39:52.6491664' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1280, 3, N'Login', CAST(N'2024-12-16T14:58:18.6180532' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1281, 9, N'Login', CAST(N'2024-12-16T15:00:17.6926945' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1282, 2, N'Login', CAST(N'2024-12-16T15:01:20.9186905' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1283, 24, N'Login', CAST(N'2024-12-16T15:14:21.7848670' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1284, 3, N'Login', CAST(N'2024-12-16T15:39:55.1311475' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1285, 2, N'Login', CAST(N'2024-12-16T15:40:05.9432329' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1286, 24, N'Login', CAST(N'2024-12-18T14:50:31.3781975' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1287, 9, N'Login', CAST(N'2024-12-18T14:50:43.9848609' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1288, 9, N'Login', CAST(N'2024-12-18T14:51:08.3550385' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1289, 5, N'Login', CAST(N'2024-12-18T14:57:02.8956052' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1290, 20, N'Login', CAST(N'2024-12-18T14:59:26.5449418' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1291, 2, N'Login', CAST(N'2024-12-18T15:01:43.3900643' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1292, 3, N'Login', CAST(N'2024-12-18T19:49:45.7272223' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1293, 24, N'Login', CAST(N'2024-12-18T20:09:47.2341737' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1294, 9, N'Login', CAST(N'2024-12-18T20:10:12.1792746' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1295, 5, N'Login', CAST(N'2024-12-18T20:13:11.5848414' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1296, 9, N'Login', CAST(N'2024-12-19T17:13:28.4288232' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1297, 1, N'Login', CAST(N'2024-12-19T17:13:40.0955734' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1298, 24, N'Login', CAST(N'2024-12-19T17:13:50.0022172' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1299, 9, N'Login', CAST(N'2024-12-19T17:14:32.0399844' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1300, 24, N'Login', CAST(N'2024-12-19T17:16:32.5857891' AS DateTime2))
INSERT [dbo].[LogDetail] ([LogDetailId], [AccountId], [Action], [DateCreate]) VALUES (1301, 2, N'Login', CAST(N'2024-12-20T11:39:21.7202038' AS DateTime2))
SET IDENTITY_INSERT [dbo].[LogDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Machine] ON 

INSERT [dbo].[Machine] ([MachineId], [MachineName], [RentPrice], [Weight], [MachinePrice], [Model], [Origin], [CategoryId], [Description], [DateCreate], [Status]) VALUES (1, N'Máy Phay CNC Hyundai-Wia F500VM 2015', 850000, 600, 850000000, N'F500VM 2015', N'Japan', 4, N'Máy phay CNC Hyundai-Wia F500VM năm 2015 là một máy công cụ hiện đại, thuộc dòng máy phay CNC cao cấp của Hyundai-Wia. Đây là một thiết bị phổ biến trong ngành gia công cơ khí chính xác, được thiết kế để gia công các chi tiết với độ chính xác và hiệu suất cao.', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), N'Active')
INSERT [dbo].[Machine] ([MachineId], [MachineName], [RentPrice], [Weight], [MachinePrice], [Model], [Origin], [CategoryId], [Description], [DateCreate], [Status]) VALUES (2, N'Máy tiện CNC DMG MORI NLX 2500SY 700', 800000, 500, 800000000, N'NLX 2500SY 700', N'Japan', 2, N'Máy tiện CNC DMG MORI NLX 2500SY/700 là một trong những dòng máy tiện hiện đại, tích hợp nhiều tính năng tiện, khoan, phay, ren với độ chính xác cao. Máy được trang bị hệ điều khiển CELOS, hỗ trợ lập trình nhanh chóng và dễ dàng. Phù hợp cho các ngành công nghiệp gia công cơ khí chính xác, chế tạo khuôn mẫu.', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), N'Active')
INSERT [dbo].[Machine] ([MachineId], [MachineName], [RentPrice], [Weight], [MachinePrice], [Model], [Origin], [CategoryId], [Description], [DateCreate], [Status]) VALUES (3, N'Máy khoan bàn CNC ZK4120', 600000, 560, 600000000, N'WDDM', N'China', 1, N'ZK4120 là model máy khoan bàn CNC chính hãng của thương hiệu WDDM với khả năng khoan đến mũi 20mm. Đây là model được lập trình CNC cho hiệu suất khoan nhanh và chính xác. Đặc điểm nổi bậtThiết kế thẩm mĩ nhỏ gọn, không chiếm nhiều không gian. Hệ thống lập trình CNC giúp khoan chính xác, có thể theo chu kỳ.', CAST(N'2024-08-05T15:01:44.7200000' AS DateTime2), N'Active')
INSERT [dbo].[Machine] ([MachineId], [MachineName], [RentPrice], [Weight], [MachinePrice], [Model], [Origin], [CategoryId], [Description], [DateCreate], [Status]) VALUES (4, N'MÁY MÀI PHẲNG CNC HITACHI', 800000, 850, 800000000, N'Hitachi MSG-618CNC', N'Japan', 5, N'Máy mài phẳng CNC chính xác cao, điều khiển tự động, tích hợp công nghệ hiện đại phục vụ gia công cơ khí chính xác.', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), N'Active')
INSERT [dbo].[Machine] ([MachineId], [MachineName], [RentPrice], [Weight], [MachinePrice], [Model], [Origin], [CategoryId], [Description], [DateCreate], [Status]) VALUES (5, N'Máy dập thân C đơn Chinfong CP-150', 1200000, 500, 1200000000, N'CP-150', N'Taiwan', 16, N'Máy dập thân C đơn, dòng CP-150 của Chinfong, chuyên dùng trong ngành cơ khí chế tạo và sản xuất linh kiện, đáp ứng độ chính xác và năng suất cao.', CAST(N'2024-06-05T15:18:35.8970000' AS DateTime2), N'Active')
SET IDENTITY_INSERT [dbo].[Machine] OFF
GO
SET IDENTITY_INSERT [dbo].[MachineAttribute] ON 

INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (1, 1, N'Số lượng trục', N'3', N'cái')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (2, 1, N'Kích thước bàn máy', N'1200×550', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (3, 1, N'Hành trình X/Y/Z', N'1100/550/520', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (4, 1, N'Tốc độ không tải X/Y/Z', N'36/36/30', N'm/min')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (5, 1, N'Thời gian thay dao', N'3.6', N'sec')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (6, 1, N'Số ổ dao', N'24', N'EA')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (7, 1, N'Moment xoắn trục chính', N'118/70', N'N.m')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (8, 1, N'Công suất trục chính', N'15/11', N'kW')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (9, 1, N'Tốc độ trục chính', N'8000', N'r/min')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (10, 1, N'Tải trọng lớn nhất trên bàn', N'800', N'kg')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (11, 2, N'Công suất động cơ trục chính', N'25', N'kW')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (12, 2, N'Tốc độ trục chính', N'4000', N'vòng/phút')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (13, 2, N'Đường kính tiện tối đa', N'366', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (14, 2, N'Chiều dài tiện tối đa', N'705', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (15, 2, N'Số trục', N'3', N'trục')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (16, 2, N'Kích thước băng máy', N'80', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (17, 2, N'Tải trọng bàn máy', N'1200', N'kg')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (18, 2, N'Trọng lượng máy', N'5000', N'kg')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (19, 2, N'Kích thước máy (DxRxC)', N'3200x1800x2100', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (20, 3, N'Đường kính khoan tối đa', N'20', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (21, 3, N'Khoảng cách từ trục chính đến bàn', N'380', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (22, 3, N'Khoảng cách từ trục chính đến chân máy', N'625', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (23, 3, N'Tốc độ trục chính', N'200–3000', N'vòng/phút')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (24, 3, N'Công suất động cơ trục chính', N'1.5', N'kW')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (25, 3, N'Kích thước bàn làm việc', N'300 × 300', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (26, 3, N'Hành trình trục chính', N'120', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (27, 3, N'Góc nghiêng của bàn làm việc', N'±45', N'độ')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (28, 3, N'Điện áp làm việc', N'380', N'V')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (29, 3, N'Kích thước tổng thể', N'800 × 560 × 1800', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (30, 4, N'Kích thước bàn làm việc', N'150 × 450', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (31, 4, N'Hành trình mài tối đa (X, Y, Z)', N'460 × 200 × 300', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (32, 4, N'Tốc độ trục chính', N'1,500–3,000', N'vòng/phút')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (33, 4, N'Độ nhám bề mặt đạt được', N'0.2', N'µm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (34, 4, N'Tải trọng tối đa trên bàn máy', N'200', N'kg')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (35, 4, N'Công suất động cơ chính', N'3.7', N'kW')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (36, 4, N'Điện áp làm việc', N'380', N'V')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (37, 4, N'Kích thước tổng thể', N'2,000 × 1,500 × 1,800', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (38, 5, N'Lực dập', N'150', N'tấn')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (39, 5, N'Hành trình trượt', N'150', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (40, 5, N'Khoảng cách từ bàn máy đến trục', N'360', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (41, 5, N'Tốc độ dập', N'40–60', N'lần/phút')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (42, 5, N'Kích thước bàn làm việc', N'800 × 500', N'mm')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (43, 5, N'Công suất động cơ', N'15', N'kW')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (44, 5, N'Điện áp', N'380', N'V')
INSERT [dbo].[MachineAttribute] ([MachineAttributeId], [MachineId], [AttributeName], [Specifications], [Unit]) VALUES (45, 5, N'Kích thước tổng thể', N'2400 × 1400 × 2800', N'mm')
SET IDENTITY_INSERT [dbo].[MachineAttribute] OFF
GO
SET IDENTITY_INSERT [dbo].[MachineCheckCriteria] ON 

INSERT [dbo].[MachineCheckCriteria] ([MachineCheckCriteriaId], [Name]) VALUES (1, N'Tiếng ồn')
INSERT [dbo].[MachineCheckCriteria] ([MachineCheckCriteriaId], [Name]) VALUES (2, N'Độ rung')
INSERT [dbo].[MachineCheckCriteria] ([MachineCheckCriteriaId], [Name]) VALUES (3, N'Nhiệt độ')
INSERT [dbo].[MachineCheckCriteria] ([MachineCheckCriteriaId], [Name]) VALUES (4, N'Bộ phận máy')
INSERT [dbo].[MachineCheckCriteria] ([MachineCheckCriteriaId], [Name]) VALUES (5, N'Tốc độ')
INSERT [dbo].[MachineCheckCriteria] ([MachineCheckCriteriaId], [Name]) VALUES (6, N'Động cơ')
INSERT [dbo].[MachineCheckCriteria] ([MachineCheckCriteriaId], [Name]) VALUES (7, N'Hệ thống điện')
INSERT [dbo].[MachineCheckCriteria] ([MachineCheckCriteriaId], [Name]) VALUES (8, N'Khác')
SET IDENTITY_INSERT [dbo].[MachineCheckCriteria] OFF
GO
INSERT [dbo].[MachineCheckRequest] ([MachineCheckRequestId], [ContractId], [MachineTaskId], [Note], [Status], [DateCreate]) VALUES (N'REQ20240820NO001', N'CON20240714NO0002', 11, N'Máy bị nóng quá mức', N'Completed', CAST(N'2024-08-20T16:15:12.7760000' AS DateTime2))
INSERT [dbo].[MachineCheckRequest] ([MachineCheckRequestId], [ContractId], [MachineTaskId], [Note], [Status], [DateCreate]) VALUES (N'REQ20240910NO001', N'CON20240612NO0001', 8, N'', N'Completed', CAST(N'2024-09-10T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[MachineCheckRequest] ([MachineCheckRequestId], [ContractId], [MachineTaskId], [Note], [Status], [DateCreate]) VALUES (N'REQ20240915NO001', N'CON20240705NO0001', 9, N'động cơ không hoạt động', N'Completed', CAST(N'2024-09-15T16:15:12.7760000' AS DateTime2))
INSERT [dbo].[MachineCheckRequest] ([MachineCheckRequestId], [ContractId], [MachineTaskId], [Note], [Status], [DateCreate]) VALUES (N'REQ20241020NO001', N'CON20240915NO0003', 6, N'', N'Completed', CAST(N'2024-10-20T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[MachineCheckRequest] ([MachineCheckRequestId], [ContractId], [MachineTaskId], [Note], [Status], [DateCreate]) VALUES (N'REQ20241115NO001', N'CON20240915NO0002', 4, N'Máy bị nóng quá mức', N'Completed', CAST(N'2024-11-15T08:00:00.0000000' AS DateTime2))
INSERT [dbo].[MachineCheckRequest] ([MachineCheckRequestId], [ContractId], [MachineTaskId], [Note], [Status], [DateCreate]) VALUES (N'REQ20241214NO001', N'CON20241013NO0001', 3, N'Máy phát ra tiến rào rạc khi đang khoan', N'Assigned', CAST(N'2024-12-14T10:11:28.2332665' AS DateTime2))
INSERT [dbo].[MachineCheckRequest] ([MachineCheckRequestId], [ContractId], [MachineTaskId], [Note], [Status], [DateCreate]) VALUES (N'REQ20241215NO001', N'CON20241118NO0001', 5, N'động cơ không hoạt động', N'Completed', CAST(N'2024-12-15T16:15:12.7760000' AS DateTime2))
INSERT [dbo].[MachineCheckRequest] ([MachineCheckRequestId], [ContractId], [MachineTaskId], [Note], [Status], [DateCreate]) VALUES (N'REQ20241216NO001', N'CON20241205NO0001', NULL, N'', N'Canceled', CAST(N'2024-12-16T15:18:23.3515791' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[MachineCheckRequestCriteria] ON 

INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (1, N'REQ20241214NO001', N'Tiếng ồn', NULL)
INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (2, N'REQ20241115NO001', N'Nhiệt độ', NULL)
INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (3, N'REQ20241215NO001', N'Động cơ', NULL)
INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (4, N'REQ20241020NO001', N'Tiếng ồn', NULL)
INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (5, N'REQ20241020NO001', N'Nhiệt độ', NULL)
INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (6, N'REQ20241020NO001', N'Động cơ', NULL)
INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (7, N'REQ20241020NO001', N'Hệ thống điện', NULL)
INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (10, N'REQ20241216NO001', N'Hệ thống điện', NULL)
INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (11, N'REQ20240910NO001', N'Hệ thống điện', NULL)
INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (12, N'REQ20240915NO001', N'Động cơ', NULL)
INSERT [dbo].[MachineCheckRequestCriteria] ([MachineCheckRequestCriteriaId], [MachineCheckRequestId], [CriteriaName], [CustomerNote]) VALUES (13, N'REQ20240820NO001', N'Nhiệt độ', NULL)
SET IDENTITY_INSERT [dbo].[MachineCheckRequestCriteria] OFF
GO
SET IDENTITY_INSERT [dbo].[MachineComponent] ON 

INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (1, 1, 88, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (2, 1, 89, 3)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (3, 1, 90, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (4, 1, 91, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (5, 1, 92, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (6, 1, 93, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (7, 1, 94, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (8, 1, 95, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (9, 1, 96, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (10, 1, 97, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (11, 1, 98, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (12, 2, 98, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (13, 2, 95, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (14, 2, 99, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (15, 2, 100, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (16, 2, 101, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (17, 2, 102, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (18, 2, 103, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (19, 2, 104, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (20, 2, 105, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (21, 3, 95, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (22, 3, 94, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (23, 3, 106, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (24, 3, 107, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (25, 3, 108, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (26, 3, 109, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (27, 3, 110, 5)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (28, 4, 88, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (29, 4, 94, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (30, 4, 106, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (31, 4, 101, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (32, 4, 89, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (33, 4, 93, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (34, 4, 111, 2)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (35, 4, 112, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (36, 4, 113, 3)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (37, 4, 114, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (38, 5, 88, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (39, 5, 95, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (40, 5, 111, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (41, 5, 115, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (42, 5, 116, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (43, 5, 117, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (44, 5, 118, 1)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (45, 5, 119, 2)
INSERT [dbo].[MachineComponent] ([MachineComponentId], [MachineId], [ComponentId], [Quantity]) VALUES (46, 5, 120, 1)
SET IDENTITY_INSERT [dbo].[MachineComponent] OFF
GO
SET IDENTITY_INSERT [dbo].[MachineImage] ON 

INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (1, 1, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734058848/r416yoqbypjkiecpye3a.webp
', 1)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (2, 1, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734059087/hgcvvepjy8d1qpavkohn.webp
', 0)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (3, 1, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734059087/dr26ma7ptevmuwwyc0cg.webp
', 0)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (4, 1, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734059087/p0zul5ndydi0xrtl7rzk.webp
', 0)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (5, 1, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734059087/p0zul5ndydi0xrtl7rzk.webp
', 0)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (6, 2, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1733276387/mkthi2gutem4qy3qofzy.jpg
', 1)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (7, 2, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1733276390/j5tt7jruq6kjkpbkczxn.jpg
', 0)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (8, 3, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1733385701/bzyp6yjwh5jmojubdx9h.jpg
', 1)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (9, 3, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1733385702/lyxqhs9t2xffelgze7ww.jpg
', 0)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (10, 3, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1733385703/ngjtc98b8frq2bwg2dhw.jpg
', 0)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (11, 4, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734059349/fksswoar9seyg8jbcal2.jpg
', 1)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (12, 4, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734059350/y5zbf9b1mct8prwx5ndr.jpg
', 0)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (13, 4, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734059351/g7yzvp0fvhicz1l0257e.png
', 0)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (14, 4, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734059351/r8hlpgqhrwkjimqjvnx1.png
', 0)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (15, 5, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734059731/jnutdv6y3wrruwp4yobv.jpg
', 1)
INSERT [dbo].[MachineImage] ([MachineImageId], [MachineId], [MachineImageUrl], [IsThumbnail]) VALUES (16, 5, N'https://res.cloudinary.com/dg9a4e1uw/image/upload/v1734059731/ccaqstmjbxmty259v4gm.jpg', 0)
SET IDENTITY_INSERT [dbo].[MachineImage] OFF
GO
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00001', 5, 1200000, 100, N'Available', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), NULL, 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00002', 5, 1140000, 90, N'Available', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), NULL, 730)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00003', 5, 840000, 75, N'Renting', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), CAST(N'2025-01-20T00:00:00.0000000' AS DateTime2), 1825)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00004', 5, 480000, 60, N'Renting', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), CAST(N'2024-12-27T00:00:00.0000000' AS DateTime2), 3101)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00005', 5, 1080000, 85, N'Renting', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), CAST(N'2024-12-27T00:00:00.0000000' AS DateTime2), 1276)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00006', 5, 1176000, 95, N'Available', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), NULL, 365)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00007', 5, 1080000, 85, N'Available', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), NULL, 1095)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00008', 5, 960000, 80, N'Available', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), NULL, 1460)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00009', 5, 960000, 80, N'Available', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), NULL, 1460)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00010', 5, 480000, 85, N'Available', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), NULL, 1095)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00011', 5, 1080000, 100, N'Maintained', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), NULL, 2920)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00012', 5, 1200000, 100, N'Available', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), NULL, 1095)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00013', 5, 600000, 65, N'Maintained', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), NULL, 2555)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00014', 5, 600000, 65, N'Renting', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), CAST(N'2025-04-30T00:00:00.0000000' AS DateTime2), 2555)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MD-01-2024-00015', 5, 840000, 75, N'Renting', CAST(N'2024-06-05T15:19:16.8890000' AS DateTime2), CAST(N'2025-06-22T00:00:00.0000000' AS DateTime2), 1825)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MK-01-2024-00001', 3, 600000, 100, N'Renting', CAST(N'2024-08-05T15:01:44.7200000' AS DateTime2), CAST(N'2025-01-29T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MK-01-2024-00002', 3, 600000, 100, N'Available', CAST(N'2024-08-05T15:01:44.7200000' AS DateTime2), NULL, 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MK-01-2024-00003', 3, 420000, 75, N'Renting', CAST(N'2024-08-05T15:01:44.7200000' AS DateTime2), CAST(N'2025-04-30T00:00:00.0000000' AS DateTime2), 1825)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MK-01-2024-00004', 3, 600000, 100, N'Renting', CAST(N'2024-08-05T15:01:44.7200000' AS DateTime2), CAST(N'2025-01-29T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MK-01-2024-00005', 3, 570000, 90, N'Available', CAST(N'2024-08-05T15:01:44.7200000' AS DateTime2), NULL, 730)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MM-01-2024-00001', 4, 800000, 100, N'Available', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), NULL, 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MM-01-2024-00002', 4, 760000, 90, N'Renting', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), CAST(N'2025-02-04T00:00:00.0000000' AS DateTime2), 730)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MM-01-2024-00003', 4, 760000, 90, N'Available', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), NULL, 730)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MM-01-2024-00004', 4, 640000, 80, N'Reserved', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), CAST(N'2025-04-28T00:00:00.0000000' AS DateTime2), 1460)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MM-01-2024-00005', 4, 320000, 60, N'Renting', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2), 2920)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MM-01-2024-00006', 4, 480000, 70, N'Renting', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), CAST(N'2025-08-01T00:00:00.0000000' AS DateTime2), 2190)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MM-01-2024-00007', 4, 784000, 95, N'Available', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), NULL, 365)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MM-01-2024-00008', 4, 800000, 100, N'Available', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), NULL, 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MM-01-2024-00009', 4, 640000, 80, N'Reserved', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), CAST(N'2025-04-28T00:00:00.0000000' AS DateTime2), 1460)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MM-01-2024-00010', 4, 720000, 85, N'Renting', CAST(N'2024-07-05T15:10:17.3140000' AS DateTime2), CAST(N'2025-01-04T00:00:00.0000000' AS DateTime2), 1095)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MP-02-2024-00001', 1, 850000, 100, N'Renting', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), CAST(N'2025-05-18T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MP-02-2024-00002', 1, 808000, 90, N'Available', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), NULL, 730)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MP-02-2024-00003', 1, 808000, 90, N'Available', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), NULL, 730)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MP-02-2024-00004', 1, 680000, 80, N'Available', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), NULL, 1460)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MP-02-2024-00005', 1, 340000, 60, N'Renting', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), CAST(N'2025-02-04T00:00:00.0000000' AS DateTime2), 2920)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MP-02-2024-00006', 1, 510000, 70, N'Available', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), NULL, 2190)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MP-02-2024-00007', 1, 833000, 95, N'Available', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), NULL, 365)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MP-02-2024-00008', 1, 850000, 100, N'Renting', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), CAST(N'2025-05-18T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MP-02-2024-00009', 1, 680000, 80, N'Available', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), NULL, 1460)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MP-02-2024-00010', 1, 765000, 85, N'Available', CAST(N'2024-09-04T00:43:16.6210000' AS DateTime2), NULL, 1095)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00001', 2, 640000, 80, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 1460)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00002', 2, 784000, 95, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 365)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00003', 2, 800000, 100, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00004', 2, 480000, 70, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 2190)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00005', 2, 760000, 90, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 730)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00006', 2, 720000, 85, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 1095)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00007', 2, 800000, 100, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00008', 2, 320000, 60, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 3004)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00009', 2, 640000, 80, N'Maintained', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 1460)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00010', 2, 760000, 90, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 730)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00011', 2, 800000, 100, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 0)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00012', 2, 760000, 90, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 730)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00013', 2, 560000, 75, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 1825)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00014', 2, 320000, 60, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 2920)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00015', 2, 720000, 85, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 1095)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00016', 2, 784000, 95, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 365)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00017', 2, 720000, 85, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 1095)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00018', 2, 640000, 80, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 1460)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00019', 2, 640000, 80, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 1460)
INSERT [dbo].[MachineSerialNumber] ([SerialNumber], [MachineId], [ActualRentPrice], [MachineConditionPercent], [Status], [DateCreate], [ExpectedAvailableDate], [RentDaysCounter]) VALUES (N'MT-02-2024-00020', 2, 720000, 85, N'Available', CAST(N'2024-09-04T08:39:51.7940000' AS DateTime2), NULL, 1095)
GO
SET IDENTITY_INSERT [dbo].[MachineSerialNumberComponent] ON 

INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (1, N'MP-02-2024-00001', 1, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (2, N'MP-02-2024-00001', 2, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (3, N'MP-02-2024-00001', 3, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (4, N'MP-02-2024-00001', 4, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (5, N'MP-02-2024-00001', 5, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (6, N'MP-02-2024-00001', 6, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (7, N'MP-02-2024-00001', 7, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (8, N'MP-02-2024-00001', 8, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (9, N'MP-02-2024-00001', 9, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (10, N'MP-02-2024-00001', 10, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (11, N'MP-02-2024-00001', 11, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (12, N'MP-02-2024-00002', 1, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (13, N'MP-02-2024-00002', 2, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (14, N'MP-02-2024-00002', 3, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (15, N'MP-02-2024-00002', 4, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (16, N'MP-02-2024-00002', 5, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (17, N'MP-02-2024-00002', 6, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (18, N'MP-02-2024-00002', 7, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (19, N'MP-02-2024-00002', 8, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (20, N'MP-02-2024-00002', 9, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (21, N'MP-02-2024-00002', 10, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (22, N'MP-02-2024-00002', 11, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (23, N'MP-02-2024-00003', 1, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (24, N'MP-02-2024-00003', 2, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (25, N'MP-02-2024-00003', 3, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (26, N'MP-02-2024-00003', 4, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (27, N'MP-02-2024-00003', 5, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (28, N'MP-02-2024-00003', 6, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (29, N'MP-02-2024-00003', 7, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (30, N'MP-02-2024-00003', 8, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (31, N'MP-02-2024-00003', 9, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (32, N'MP-02-2024-00003', 10, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (33, N'MP-02-2024-00003', 11, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (34, N'MP-02-2024-00004', 1, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (35, N'MP-02-2024-00004', 2, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (36, N'MP-02-2024-00004', 3, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (37, N'MP-02-2024-00004', 4, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (38, N'MP-02-2024-00004', 5, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (39, N'MP-02-2024-00004', 6, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (40, N'MP-02-2024-00004', 7, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (41, N'MP-02-2024-00004', 8, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (42, N'MP-02-2024-00004', 9, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (43, N'MP-02-2024-00004', 10, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (44, N'MP-02-2024-00004', 11, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (45, N'MP-02-2024-00005', 1, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (46, N'MP-02-2024-00005', 2, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (47, N'MP-02-2024-00005', 3, 1, N'Normal', NULL, CAST(N'2024-12-16T15:03:18.7917555' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (48, N'MP-02-2024-00005', 4, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (49, N'MP-02-2024-00005', 5, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (50, N'MP-02-2024-00005', 6, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (51, N'MP-02-2024-00005', 7, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (52, N'MP-02-2024-00005', 8, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (53, N'MP-02-2024-00005', 9, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (54, N'MP-02-2024-00005', 10, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (55, N'MP-02-2024-00005', 11, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (56, N'MP-02-2024-00006', 1, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (57, N'MP-02-2024-00006', 2, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (58, N'MP-02-2024-00006', 3, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (59, N'MP-02-2024-00006', 4, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (60, N'MP-02-2024-00006', 5, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (61, N'MP-02-2024-00006', 6, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (62, N'MP-02-2024-00006', 7, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (63, N'MP-02-2024-00006', 8, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (64, N'MP-02-2024-00006', 9, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (65, N'MP-02-2024-00006', 10, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (66, N'MP-02-2024-00006', 11, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (67, N'MP-02-2024-00007', 1, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (68, N'MP-02-2024-00007', 2, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (69, N'MP-02-2024-00007', 3, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (70, N'MP-02-2024-00007', 4, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (71, N'MP-02-2024-00007', 5, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (72, N'MP-02-2024-00007', 6, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (73, N'MP-02-2024-00007', 7, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (74, N'MP-02-2024-00007', 8, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (75, N'MP-02-2024-00007', 9, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (76, N'MP-02-2024-00007', 10, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (77, N'MP-02-2024-00007', 11, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (78, N'MP-02-2024-00008', 1, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (79, N'MP-02-2024-00008', 2, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (80, N'MP-02-2024-00008', 3, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (81, N'MP-02-2024-00008', 4, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (82, N'MP-02-2024-00008', 5, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (83, N'MP-02-2024-00008', 6, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (84, N'MP-02-2024-00008', 7, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (85, N'MP-02-2024-00008', 8, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (86, N'MP-02-2024-00008', 9, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (87, N'MP-02-2024-00008', 10, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (88, N'MP-02-2024-00008', 11, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (89, N'MP-02-2024-00009', 1, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (90, N'MP-02-2024-00009', 2, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (91, N'MP-02-2024-00009', 3, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (92, N'MP-02-2024-00009', 4, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (93, N'MP-02-2024-00009', 5, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (94, N'MP-02-2024-00009', 6, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (95, N'MP-02-2024-00009', 7, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (96, N'MP-02-2024-00009', 8, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (97, N'MP-02-2024-00009', 9, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (98, N'MP-02-2024-00009', 10, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (99, N'MP-02-2024-00009', 11, 1, N'Normal', NULL, NULL)
GO
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (100, N'MP-02-2024-00010', 1, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (101, N'MP-02-2024-00010', 2, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (102, N'MP-02-2024-00010', 3, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (103, N'MP-02-2024-00010', 4, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (104, N'MP-02-2024-00010', 5, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (105, N'MP-02-2024-00010', 6, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (106, N'MP-02-2024-00010', 7, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (107, N'MP-02-2024-00010', 8, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (108, N'MP-02-2024-00010', 9, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (109, N'MP-02-2024-00010', 10, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (110, N'MP-02-2024-00010', 11, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (201, N'MT-02-2024-00001', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (202, N'MT-02-2024-00001', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (203, N'MT-02-2024-00001', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (204, N'MT-02-2024-00001', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (205, N'MT-02-2024-00001', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (206, N'MT-02-2024-00001', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (207, N'MT-02-2024-00001', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (208, N'MT-02-2024-00001', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (209, N'MT-02-2024-00001', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (210, N'MT-02-2024-00002', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (211, N'MT-02-2024-00002', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (212, N'MT-02-2024-00002', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (213, N'MT-02-2024-00002', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (214, N'MT-02-2024-00002', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (215, N'MT-02-2024-00002', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (216, N'MT-02-2024-00002', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (217, N'MT-02-2024-00002', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (218, N'MT-02-2024-00002', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (219, N'MT-02-2024-00003', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (220, N'MT-02-2024-00003', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (221, N'MT-02-2024-00003', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (222, N'MT-02-2024-00003', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (223, N'MT-02-2024-00003', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (224, N'MT-02-2024-00003', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (225, N'MT-02-2024-00003', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (226, N'MT-02-2024-00003', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (227, N'MT-02-2024-00003', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (228, N'MT-02-2024-00004', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (229, N'MT-02-2024-00004', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (230, N'MT-02-2024-00004', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (231, N'MT-02-2024-00004', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (232, N'MT-02-2024-00004', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (233, N'MT-02-2024-00004', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (234, N'MT-02-2024-00004', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (235, N'MT-02-2024-00004', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (236, N'MT-02-2024-00004', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (237, N'MT-02-2024-00005', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (238, N'MT-02-2024-00005', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (239, N'MT-02-2024-00005', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (240, N'MT-02-2024-00005', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (241, N'MT-02-2024-00005', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (242, N'MT-02-2024-00005', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (243, N'MT-02-2024-00005', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (244, N'MT-02-2024-00005', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (245, N'MT-02-2024-00005', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (246, N'MT-02-2024-00006', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (247, N'MT-02-2024-00006', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (248, N'MT-02-2024-00006', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (249, N'MT-02-2024-00006', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (250, N'MT-02-2024-00006', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (251, N'MT-02-2024-00006', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (252, N'MT-02-2024-00006', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (253, N'MT-02-2024-00006', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (254, N'MT-02-2024-00006', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (255, N'MT-02-2024-00007', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (256, N'MT-02-2024-00007', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (257, N'MT-02-2024-00007', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (258, N'MT-02-2024-00007', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (259, N'MT-02-2024-00007', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (260, N'MT-02-2024-00007', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (261, N'MT-02-2024-00007', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (262, N'MT-02-2024-00007', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (263, N'MT-02-2024-00007', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (264, N'MT-02-2024-00008', 12, 1, N'Normal', NULL, CAST(N'2024-12-13T21:07:17.3624484' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (265, N'MT-02-2024-00008', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (266, N'MT-02-2024-00008', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (267, N'MT-02-2024-00008', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (268, N'MT-02-2024-00008', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (269, N'MT-02-2024-00008', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (270, N'MT-02-2024-00008', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (271, N'MT-02-2024-00008', 19, 1, N'Normal', NULL, CAST(N'2024-12-05T16:11:22.6406236' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (272, N'MT-02-2024-00008', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (273, N'MT-02-2024-00009', 12, 1, N'Normal', NULL, CAST(N'2024-12-09T08:58:45.4917586' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (274, N'MT-02-2024-00009', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (275, N'MT-02-2024-00009', 14, 1, N'Broken', NULL, CAST(N'2024-12-09T09:01:09.6410305' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (276, N'MT-02-2024-00009', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (277, N'MT-02-2024-00009', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (278, N'MT-02-2024-00009', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (279, N'MT-02-2024-00009', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (280, N'MT-02-2024-00009', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (281, N'MT-02-2024-00009', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (282, N'MT-02-2024-00010', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (283, N'MT-02-2024-00010', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (284, N'MT-02-2024-00010', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (285, N'MT-02-2024-00010', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (286, N'MT-02-2024-00010', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (287, N'MT-02-2024-00010', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (288, N'MT-02-2024-00010', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (289, N'MT-02-2024-00010', 19, 1, N'Normal', NULL, NULL)
GO
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (290, N'MT-02-2024-00010', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (361, N'MM-01-2024-00001', 28, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (362, N'MM-01-2024-00001', 29, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (363, N'MM-01-2024-00001', 30, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (364, N'MM-01-2024-00001', 31, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (365, N'MM-01-2024-00001', 32, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (366, N'MM-01-2024-00001', 33, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (367, N'MM-01-2024-00001', 34, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (368, N'MM-01-2024-00001', 35, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (369, N'MM-01-2024-00001', 36, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (370, N'MM-01-2024-00001', 37, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (371, N'MM-01-2024-00002', 28, 1, N'Normal', NULL, CAST(N'2024-12-15T15:53:17.7549546' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (372, N'MM-01-2024-00002', 29, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (373, N'MM-01-2024-00002', 30, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (374, N'MM-01-2024-00002', 31, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (375, N'MM-01-2024-00002', 32, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (376, N'MM-01-2024-00002', 33, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (377, N'MM-01-2024-00002', 34, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (378, N'MM-01-2024-00002', 35, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (379, N'MM-01-2024-00002', 36, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (380, N'MM-01-2024-00002', 37, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (381, N'MM-01-2024-00003', 28, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (382, N'MM-01-2024-00003', 29, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (383, N'MM-01-2024-00003', 30, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (384, N'MM-01-2024-00003', 31, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (385, N'MM-01-2024-00003', 32, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (386, N'MM-01-2024-00003', 33, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (387, N'MM-01-2024-00003', 34, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (388, N'MM-01-2024-00003', 35, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (389, N'MM-01-2024-00003', 36, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (390, N'MM-01-2024-00003', 37, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (391, N'MM-01-2024-00004', 28, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (392, N'MM-01-2024-00004', 29, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (393, N'MM-01-2024-00004', 30, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (394, N'MM-01-2024-00004', 31, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (395, N'MM-01-2024-00004', 32, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (396, N'MM-01-2024-00004', 33, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (397, N'MM-01-2024-00004', 34, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (398, N'MM-01-2024-00004', 35, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (399, N'MM-01-2024-00004', 36, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (400, N'MM-01-2024-00004', 37, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (401, N'MM-01-2024-00005', 28, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (402, N'MM-01-2024-00005', 29, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (403, N'MM-01-2024-00005', 30, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (404, N'MM-01-2024-00005', 31, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (405, N'MM-01-2024-00005', 32, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (406, N'MM-01-2024-00005', 33, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (407, N'MM-01-2024-00005', 34, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (408, N'MM-01-2024-00005', 35, 1, N'Normal', NULL, CAST(N'2024-12-15T16:19:12.8958401' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (409, N'MM-01-2024-00005', 36, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (410, N'MM-01-2024-00005', 37, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (411, N'MM-01-2024-00006', 28, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (412, N'MM-01-2024-00006', 29, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (413, N'MM-01-2024-00006', 30, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (414, N'MM-01-2024-00006', 31, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (415, N'MM-01-2024-00006', 32, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (416, N'MM-01-2024-00006', 33, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (417, N'MM-01-2024-00006', 34, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (418, N'MM-01-2024-00006', 35, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (419, N'MM-01-2024-00006', 36, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (420, N'MM-01-2024-00006', 37, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (421, N'MM-01-2024-00007', 28, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (422, N'MM-01-2024-00007', 29, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (423, N'MM-01-2024-00007', 30, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (424, N'MM-01-2024-00007', 31, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (425, N'MM-01-2024-00007', 32, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (426, N'MM-01-2024-00007', 33, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (427, N'MM-01-2024-00007', 34, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (428, N'MM-01-2024-00007', 35, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (429, N'MM-01-2024-00007', 36, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (430, N'MM-01-2024-00007', 37, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (431, N'MM-01-2024-00008', 28, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (432, N'MM-01-2024-00008', 29, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (433, N'MM-01-2024-00008', 30, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (434, N'MM-01-2024-00008', 31, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (435, N'MM-01-2024-00008', 32, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (436, N'MM-01-2024-00008', 33, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (437, N'MM-01-2024-00008', 34, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (438, N'MM-01-2024-00008', 35, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (439, N'MM-01-2024-00008', 36, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (440, N'MM-01-2024-00008', 37, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (441, N'MM-01-2024-00009', 28, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (442, N'MM-01-2024-00009', 29, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (443, N'MM-01-2024-00009', 30, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (444, N'MM-01-2024-00009', 31, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (445, N'MM-01-2024-00009', 32, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (446, N'MM-01-2024-00009', 33, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (447, N'MM-01-2024-00009', 34, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (448, N'MM-01-2024-00009', 35, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (449, N'MM-01-2024-00009', 36, 3, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (450, N'MM-01-2024-00009', 37, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (451, N'MM-01-2024-00010', 28, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (452, N'MM-01-2024-00010', 29, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (453, N'MM-01-2024-00010', 30, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (454, N'MM-01-2024-00010', 31, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (455, N'MM-01-2024-00010', 32, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (456, N'MM-01-2024-00010', 33, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (457, N'MM-01-2024-00010', 34, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (458, N'MM-01-2024-00010', 35, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (459, N'MM-01-2024-00010', 36, 3, N'Normal', NULL, NULL)
GO
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (460, N'MM-01-2024-00010', 37, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (461, N'MD-01-2024-00001', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (462, N'MD-01-2024-00001', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (463, N'MD-01-2024-00001', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (464, N'MD-01-2024-00001', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (465, N'MD-01-2024-00001', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (466, N'MD-01-2024-00001', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (467, N'MD-01-2024-00001', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (468, N'MD-01-2024-00001', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (469, N'MD-01-2024-00001', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (470, N'MD-01-2024-00002', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (471, N'MD-01-2024-00002', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (472, N'MD-01-2024-00002', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (473, N'MD-01-2024-00002', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (474, N'MD-01-2024-00002', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (475, N'MD-01-2024-00002', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (476, N'MD-01-2024-00002', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (477, N'MD-01-2024-00002', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (478, N'MD-01-2024-00002', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (479, N'MD-01-2024-00003', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (480, N'MD-01-2024-00003', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (481, N'MD-01-2024-00003', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (482, N'MD-01-2024-00003', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (483, N'MD-01-2024-00003', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (484, N'MD-01-2024-00003', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (485, N'MD-01-2024-00003', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (486, N'MD-01-2024-00003', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (487, N'MD-01-2024-00003', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (488, N'MD-01-2024-00004', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (489, N'MD-01-2024-00004', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (490, N'MD-01-2024-00004', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (491, N'MD-01-2024-00004', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (492, N'MD-01-2024-00004', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (493, N'MD-01-2024-00004', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (494, N'MD-01-2024-00004', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (495, N'MD-01-2024-00004', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (496, N'MD-01-2024-00004', 46, 1, N'Normal', NULL, CAST(N'2024-12-16T15:21:36.4051504' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (497, N'MD-01-2024-00005', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (498, N'MD-01-2024-00005', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (499, N'MD-01-2024-00005', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (500, N'MD-01-2024-00005', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (501, N'MD-01-2024-00005', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (502, N'MD-01-2024-00005', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (503, N'MD-01-2024-00005', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (504, N'MD-01-2024-00005', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (505, N'MD-01-2024-00005', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (506, N'MD-01-2024-00006', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (507, N'MD-01-2024-00006', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (508, N'MD-01-2024-00006', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (509, N'MD-01-2024-00006', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (510, N'MD-01-2024-00006', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (511, N'MD-01-2024-00006', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (512, N'MD-01-2024-00006', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (513, N'MD-01-2024-00006', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (514, N'MD-01-2024-00006', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (515, N'MD-01-2024-00007', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (516, N'MD-01-2024-00007', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (517, N'MD-01-2024-00007', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (518, N'MD-01-2024-00007', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (519, N'MD-01-2024-00007', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (520, N'MD-01-2024-00007', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (521, N'MD-01-2024-00007', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (522, N'MD-01-2024-00007', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (523, N'MD-01-2024-00007', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (524, N'MD-01-2024-00008', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (525, N'MD-01-2024-00008', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (526, N'MD-01-2024-00008', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (527, N'MD-01-2024-00008', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (528, N'MD-01-2024-00008', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (529, N'MD-01-2024-00008', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (530, N'MD-01-2024-00008', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (531, N'MD-01-2024-00008', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (532, N'MD-01-2024-00008', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (533, N'MD-01-2024-00009', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (534, N'MD-01-2024-00009', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (535, N'MD-01-2024-00009', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (536, N'MD-01-2024-00009', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (537, N'MD-01-2024-00009', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (538, N'MD-01-2024-00009', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (539, N'MD-01-2024-00009', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (540, N'MD-01-2024-00009', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (541, N'MD-01-2024-00009', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (542, N'MD-01-2024-00010', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (543, N'MD-01-2024-00010', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (544, N'MD-01-2024-00010', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (545, N'MD-01-2024-00010', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (546, N'MD-01-2024-00010', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (547, N'MD-01-2024-00010', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (548, N'MD-01-2024-00010', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (549, N'MD-01-2024-00010', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (550, N'MD-01-2024-00010', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (551, N'MD-01-2024-00011', 38, 1, N'Normal', NULL, CAST(N'2024-12-11T15:50:08.3977235' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (552, N'MD-01-2024-00011', 39, 1, N'Broken', NULL, CAST(N'2024-12-11T15:51:06.0074625' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (553, N'MD-01-2024-00011', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (554, N'MD-01-2024-00011', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (555, N'MD-01-2024-00011', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (556, N'MD-01-2024-00011', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (557, N'MD-01-2024-00011', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (558, N'MD-01-2024-00011', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (559, N'MD-01-2024-00011', 46, 1, N'Normal', NULL, NULL)
GO
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (560, N'MD-01-2024-00012', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (561, N'MD-01-2024-00012', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (562, N'MD-01-2024-00012', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (563, N'MD-01-2024-00012', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (564, N'MD-01-2024-00012', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (565, N'MD-01-2024-00012', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (566, N'MD-01-2024-00012', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (567, N'MD-01-2024-00012', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (568, N'MD-01-2024-00012', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (569, N'MD-01-2024-00013', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (570, N'MD-01-2024-00013', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (571, N'MD-01-2024-00013', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (572, N'MD-01-2024-00013', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (573, N'MD-01-2024-00013', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (574, N'MD-01-2024-00013', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (575, N'MD-01-2024-00013', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (576, N'MD-01-2024-00013', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (577, N'MD-01-2024-00013', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (578, N'MD-01-2024-00014', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (579, N'MD-01-2024-00014', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (580, N'MD-01-2024-00014', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (581, N'MD-01-2024-00014', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (582, N'MD-01-2024-00014', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (583, N'MD-01-2024-00014', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (584, N'MD-01-2024-00014', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (585, N'MD-01-2024-00014', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (586, N'MD-01-2024-00014', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (587, N'MD-01-2024-00015', 38, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (588, N'MD-01-2024-00015', 39, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (589, N'MD-01-2024-00015', 40, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (590, N'MD-01-2024-00015', 41, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (591, N'MD-01-2024-00015', 42, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (592, N'MD-01-2024-00015', 43, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (593, N'MD-01-2024-00015', 44, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (594, N'MD-01-2024-00015', 45, 2, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (595, N'MD-01-2024-00015', 46, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (596, N'MT-02-2024-00011', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (597, N'MT-02-2024-00011', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (598, N'MT-02-2024-00011', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (599, N'MT-02-2024-00011', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (600, N'MT-02-2024-00011', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (601, N'MT-02-2024-00011', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (602, N'MT-02-2024-00011', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (603, N'MT-02-2024-00011', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (604, N'MT-02-2024-00011', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (605, N'MT-02-2024-00012', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (606, N'MT-02-2024-00012', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (607, N'MT-02-2024-00012', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (608, N'MT-02-2024-00012', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (609, N'MT-02-2024-00012', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (610, N'MT-02-2024-00012', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (611, N'MT-02-2024-00012', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (612, N'MT-02-2024-00012', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (613, N'MT-02-2024-00012', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (614, N'MT-02-2024-00013', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (615, N'MT-02-2024-00013', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (616, N'MT-02-2024-00013', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (617, N'MT-02-2024-00013', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (618, N'MT-02-2024-00013', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (619, N'MT-02-2024-00013', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (620, N'MT-02-2024-00013', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (621, N'MT-02-2024-00013', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (622, N'MT-02-2024-00013', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (623, N'MT-02-2024-00014', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (624, N'MT-02-2024-00014', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (625, N'MT-02-2024-00014', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (626, N'MT-02-2024-00014', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (627, N'MT-02-2024-00014', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (628, N'MT-02-2024-00014', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (629, N'MT-02-2024-00014', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (630, N'MT-02-2024-00014', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (631, N'MT-02-2024-00014', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (632, N'MT-02-2024-00015', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (633, N'MT-02-2024-00015', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (634, N'MT-02-2024-00015', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (635, N'MT-02-2024-00015', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (636, N'MT-02-2024-00015', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (637, N'MT-02-2024-00015', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (638, N'MT-02-2024-00015', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (639, N'MT-02-2024-00015', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (640, N'MT-02-2024-00015', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (641, N'MT-02-2024-00016', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (642, N'MT-02-2024-00016', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (643, N'MT-02-2024-00016', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (644, N'MT-02-2024-00016', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (645, N'MT-02-2024-00016', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (646, N'MT-02-2024-00016', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (647, N'MT-02-2024-00016', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (648, N'MT-02-2024-00016', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (649, N'MT-02-2024-00016', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (650, N'MT-02-2024-00017', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (651, N'MT-02-2024-00017', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (652, N'MT-02-2024-00017', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (653, N'MT-02-2024-00017', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (654, N'MT-02-2024-00017', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (655, N'MT-02-2024-00017', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (656, N'MT-02-2024-00017', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (657, N'MT-02-2024-00017', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (658, N'MT-02-2024-00017', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (659, N'MT-02-2024-00018', 12, 1, N'Normal', NULL, NULL)
GO
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (660, N'MT-02-2024-00018', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (661, N'MT-02-2024-00018', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (662, N'MT-02-2024-00018', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (663, N'MT-02-2024-00018', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (664, N'MT-02-2024-00018', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (665, N'MT-02-2024-00018', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (666, N'MT-02-2024-00018', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (667, N'MT-02-2024-00018', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (668, N'MT-02-2024-00019', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (669, N'MT-02-2024-00019', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (670, N'MT-02-2024-00019', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (671, N'MT-02-2024-00019', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (672, N'MT-02-2024-00019', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (673, N'MT-02-2024-00019', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (674, N'MT-02-2024-00019', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (675, N'MT-02-2024-00019', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (676, N'MT-02-2024-00019', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (677, N'MT-02-2024-00020', 12, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (678, N'MT-02-2024-00020', 13, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (679, N'MT-02-2024-00020', 14, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (680, N'MT-02-2024-00020', 15, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (681, N'MT-02-2024-00020', 16, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (682, N'MT-02-2024-00020', 17, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (683, N'MT-02-2024-00020', 18, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (684, N'MT-02-2024-00020', 19, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (685, N'MT-02-2024-00020', 20, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (686, N'MK-01-2024-00001', 21, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (687, N'MK-01-2024-00001', 22, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (688, N'MK-01-2024-00001', 23, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (689, N'MK-01-2024-00001', 24, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (690, N'MK-01-2024-00001', 25, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (691, N'MK-01-2024-00001', 26, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (692, N'MK-01-2024-00001', 27, 5, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (693, N'MK-01-2024-00002', 21, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (694, N'MK-01-2024-00002', 22, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (695, N'MK-01-2024-00002', 23, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (696, N'MK-01-2024-00002', 24, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (697, N'MK-01-2024-00002', 25, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (698, N'MK-01-2024-00002', 26, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (699, N'MK-01-2024-00002', 27, 5, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (700, N'MK-01-2024-00004', 21, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (701, N'MK-01-2024-00004', 22, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (702, N'MK-01-2024-00004', 23, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (703, N'MK-01-2024-00004', 24, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (704, N'MK-01-2024-00004', 25, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (705, N'MK-01-2024-00004', 26, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (706, N'MK-01-2024-00004', 27, 5, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (707, N'MK-01-2024-00005', 21, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (708, N'MK-01-2024-00005', 22, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (709, N'MK-01-2024-00005', 23, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (710, N'MK-01-2024-00005', 24, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (711, N'MK-01-2024-00005', 25, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (712, N'MK-01-2024-00005', 26, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (713, N'MK-01-2024-00005', 27, 5, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (714, N'MK-01-2024-00003', 21, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (715, N'MK-01-2024-00003', 22, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (716, N'MK-01-2024-00003', 23, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (717, N'MK-01-2024-00003', 24, 1, N'Normal', NULL, CAST(N'2024-12-16T09:12:07.0361923' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (718, N'MK-01-2024-00003', 25, 1, N'Normal', NULL, NULL)
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (719, N'MK-01-2024-00003', 26, 1, N'Normal', NULL, CAST(N'2024-12-16T09:10:46.0306918' AS DateTime2))
INSERT [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId], [SerialNumber], [MachineComponentId], [Quantity], [Status], [Note], [DateModified]) VALUES (720, N'MK-01-2024-00003', 27, 5, N'Normal', NULL, NULL)
SET IDENTITY_INSERT [dbo].[MachineSerialNumberComponent] OFF
GO
SET IDENTITY_INSERT [dbo].[MachineSerialNumberLog] ON 

INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (42, N'MP-02-2024-00001', NULL, 24, N'Machine', CAST(N'2024-12-05T11:56:59.0005214' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (43, N'MP-02-2024-00008', NULL, 24, N'Machine', CAST(N'2024-12-05T11:56:59.0728411' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (95, N'MD-01-2024-00015', NULL, 1, N'Machine', CAST(N'2024-12-05T22:06:23.7220047' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (96, N'MD-01-2024-00012', NULL, 1, N'Machine', CAST(N'2024-12-05T22:06:23.7638680' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (102, N'MD-01-2024-00015', NULL, 1, N'Machine', CAST(N'2024-12-06T22:06:34.3675546' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Sẵn sàng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (103, N'MD-01-2024-00012', NULL, 1, N'Machine', CAST(N'2024-12-06T22:06:34.4953149' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Sẵn sàng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (104, N'MD-01-2024-00015', NULL, 9, N'Machine', CAST(N'2024-12-09T08:15:59.3106743' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1103, N'MM-01-2024-00009', NULL, 9, N'Machine', CAST(N'2024-12-10T22:45:24.5717729' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1109, N'MM-01-2024-00009', NULL, 7, N'Machine', CAST(N'2024-12-10T22:51:21.1625061' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1110, N'MD-01-2024-00012', NULL, 8, N'Machine', CAST(N'2024-12-11T08:07:03.3600354' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1111, N'MD-01-2024-00012', NULL, 8, N'Machine', CAST(N'2024-12-11T08:07:36.9051478' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Sẵn sàng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1118, N'MP-02-2024-00001', NULL, 11, N'Machine', CAST(N'2024-12-11T13:59:58.4615184' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1119, N'MP-02-2024-00008', NULL, 11, N'Machine', CAST(N'2024-12-11T13:59:58.7604301' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1120, N'MD-01-2024-00012', NULL, 3, N'Machine', CAST(N'2024-12-11T14:35:29.0927160' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đang sửa chữa]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1121, N'MD-01-2024-00012', NULL, 3, N'Machine', CAST(N'2024-12-11T14:35:36.0957692' AS DateTime2), N'Thay đổi trạng thái từ [Đang sửa chữa] thành [Sẵn sàng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1131, N'MM-01-2024-00009', NULL, 2, N'Machine', CAST(N'2024-12-11T16:43:58.5712183' AS DateTime2), N'Thay đổi trạng thái từ [Đang thuê] thành [Sẵn sàng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1133, N'MD-01-2024-00015', NULL, 4, N'Machine', CAST(N'2024-12-11T19:56:13.4258708' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1141, N'MD-01-2024-00004', NULL, 24, N'Machine', CAST(N'2024-06-12T22:45:31.5060000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1142, N'MD-01-2024-00005', NULL, 24, N'Machine', CAST(N'2024-06-12T22:45:31.5060000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1146, N'MD-01-2024-00004', NULL, 7, N'Machine', CAST(N'2024-06-12T22:45:31.5060000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1147, N'MD-01-2024-00005', NULL, 7, N'Machine', CAST(N'2024-06-12T22:45:31.5060000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1148, N'MK-01-2024-00004', NULL, 6, N'Machine', CAST(N'2024-08-05T15:01:44.7200000' AS DateTime2), N'Tạo mới một máy serial')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1150, N'MK-01-2024-00003', NULL, 6, N'Machine', CAST(N'2024-08-05T15:01:44.7200000' AS DateTime2), N'Tạo mới một máy serial')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1151, N'MK-01-2024-00004', NULL, 8, N'Machine', CAST(N'2024-10-13T19:40:06.5070000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1152, N'MK-01-2024-00001', NULL, 8, N'Machine', CAST(N'2024-10-13T19:40:06.5070000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1153, N'MK-01-2024-00004', NULL, 20, N'Machine', CAST(N'2024-10-23T19:45:13.3490000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1154, N'MK-01-2024-00001', NULL, 20, N'Machine', CAST(N'2024-10-23T19:45:13.3490000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1155, N'MM-01-2024-00005', NULL, 17, N'Machine', CAST(N'2024-12-13T20:10:52.0449742' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1156, N'MM-01-2024-00006', NULL, 17, N'Machine', CAST(N'2024-12-13T20:10:52.0855528' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1157, N'MM-01-2024-00005', NULL, 20, N'Machine', CAST(N'2024-12-13T20:19:13.6878654' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1158, N'MM-01-2024-00006', NULL, 20, N'Machine', CAST(N'2024-12-13T20:19:13.7542218' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1159, N'MD-01-2024-00014', NULL, 19, N'Machine', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1160, N'MK-01-2024-00003', NULL, 19, N'Machine', CAST(N'2024-12-13T20:40:45.2171762' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1161, N'MD-01-2024-00014', NULL, 4, N'Machine', CAST(N'2024-08-22T20:46:05.6980000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1162, N'MK-01-2024-00003', NULL, 4, N'Machine', CAST(N'2024-12-13T20:46:05.8980676' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1163, N'MM-01-2024-00004', NULL, 24, N'Machine', CAST(N'2024-12-13T21:03:59.8228213' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1164, N'MM-01-2024-00009', NULL, 24, N'Machine', CAST(N'2024-12-13T21:03:59.8671772' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1167, N'MT-02-2024-00008', NULL, 9, N'Machine', CAST(N'2024-07-14T09:12:07.7000000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1168, N'MT-02-2024-00014', NULL, 9, N'Machine', CAST(N'2024-07-14T09:12:07.7000000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1169, N'MT-02-2024-00008', NULL, 11, N'Machine', CAST(N'2024-07-23T09:18:00.4070000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1170, N'MT-02-2024-00014', NULL, 11, N'Machine', CAST(N'2024-07-23T09:18:00.4070000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1171, N'MT-02-2024-00014', NULL, 2, N'Machine', CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), N'Thay đổi trạng thái từ [Đang thuê] thành [Sẵn sàng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1172, N'MT-02-2024-00008', NULL, 2, N'Machine', CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), N'Thay đổi trạng thái từ [Đang thuê] thành [Sẵn sàng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1173, N'MM-01-2024-00010', NULL, 9, N'Machine', CAST(N'2024-09-15T15:18:57.3720000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1174, N'MM-01-2024-00002', NULL, 9, N'Machine', CAST(N'2024-09-15T15:18:57.3720000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1175, N'MP-02-2024-00005', NULL, 9, N'Machine', CAST(N'2024-09-15T15:18:57.3720000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1176, N'MM-01-2024-00010', NULL, 11, N'Machine', CAST(N'2024-09-29T15:25:40.9660000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1177, N'MM-01-2024-00002', NULL, 11, N'Machine', CAST(N'2024-09-29T15:25:40.9660000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1178, N'MP-02-2024-00005', NULL, 11, N'Machine', CAST(N'2024-09-29T15:25:40.9660000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1179, N'MM-01-2024-00002', 371, 11, N'MachineComponent', CAST(N'2024-12-16T15:52:10.3330000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Bàn máy từ [Bình thường] thành [Hư hỏng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1180, N'MM-01-2024-00002', 371, 11, N'MachineComponent', CAST(N'2024-12-16T15:52:10.9040000' AS DateTime2), N'Tạo ticket thay thế bộ phận [Bàn máy] khi đang thuê máy')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1181, N'MM-01-2024-00002', 371, 11, N'MachineComponent', CAST(N'2024-12-16T15:53:17.7190000' AS DateTime2), N'Ticket thay thế bộ phận [Bàn máy] đã được hoàn tất, bộ phận đã được thay thế')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1182, N'MM-01-2024-00002', 371, 11, N'MachineComponent', CAST(N'2024-12-16T15:53:17.7540000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Bàn máy từ [Hư hỏng] thành [Bình thường]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1183, N'MM-01-2024-00005', 408, 7, N'MachineComponent', CAST(N'2024-12-16T16:17:29.1450000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Đá mài từ [Bình thường] thành [Hư hỏng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1184, N'MM-01-2024-00005', 408, 7, N'MachineComponent', CAST(N'2024-12-16T16:17:29.7990000' AS DateTime2), N'Tạo ticket thay thế bộ phận [Đá mài] khi đang thuê máy')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1185, N'MM-01-2024-00005', 408, 7, N'MachineComponent', CAST(N'2024-12-16T16:19:12.8350000' AS DateTime2), N'Ticket thay thế bộ phận [Đá mài] đã được hoàn tất, bộ phận đã được thay thế')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1186, N'MM-01-2024-00005', 408, 7, N'MachineComponent', CAST(N'2024-12-16T16:19:12.8950000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Đá mài từ [Hư hỏng] thành [Bình thường]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1195, N'MP-02-2024-00005', 47, 11, N'MachineComponent', CAST(N'2024-10-21T15:02:15.9160000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Bộ thay dao tự động (ATC) từ [Bình thường] thành [Hư hỏng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1196, N'MP-02-2024-00005', 47, 11, N'MachineComponent', CAST(N'2024-10-21T15:02:15.9160000' AS DateTime2), N'Tạo ticket thay thế bộ phận [Bộ thay dao tự động (ATC)] khi đang thuê máy')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1197, N'MP-02-2024-00005', 47, 11, N'MachineComponent', CAST(N'2024-10-21T16:02:15.9160000' AS DateTime2), N'Ticket thay thế bộ phận [Bộ thay dao tự động (ATC)] đã được hoàn tất, bộ phận đã được thay thế')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1198, N'MP-02-2024-00005', 47, 11, N'MachineComponent', CAST(N'2024-10-21T16:02:15.9160000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Bộ thay dao tự động (ATC) từ [Hư hỏng] thành [Bình thường]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1199, N'MD-01-2024-00004', 496, 11, N'MachineComponent', CAST(N'2024-09-11T15:20:24.7170000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Tủ điện và dây dẫn từ [Bình thường] thành [Hư hỏng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1200, N'MD-01-2024-00004', 496, 11, N'MachineComponent', CAST(N'2024-09-11T15:20:24.7170000' AS DateTime2), N'Tạo ticket thay thế bộ phận [Tủ điện và dây dẫn] khi đang thuê máy')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1201, N'MD-01-2024-00004', 496, 11, N'MachineComponent', CAST(N'2024-09-11T16:20:24.7170000' AS DateTime2), N'Ticket thay thế bộ phận [Tủ điện và dây dẫn] đã được hoàn tất, bộ phận đã được thay thế')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1202, N'MD-01-2024-00004', 496, 11, N'MachineComponent', CAST(N'2024-09-11T16:20:24.7170000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Tủ điện và dây dẫn từ [Hư hỏng] thành [Bình thường]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1203, N'MD-01-2024-00003', NULL, 9, N'Machine', CAST(N'2024-07-05T14:55:30.7230000' AS DateTime2), N'Thay đổi trạng thái từ [Sẵn sàng] thành [Đã giữ chỗ]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1204, N'MD-01-2024-00003', NULL, 20, N'Machine', CAST(N'2024-07-14T15:00:05.8390000' AS DateTime2), N'Thay đổi trạng thái từ [Đã giữ chỗ] thành [Đang thuê]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1205, N'MD-01-2024-00003', 479, 7, N'MachineComponent', CAST(N'2024-09-16T16:17:29.0590000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Bàn máy từ [Bình thường] thành [Hư hỏng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1206, N'MD-01-2024-00003', 479, 7, N'MachineComponent', CAST(N'2024-09-16T16:17:29.0590000' AS DateTime2), N'Tạo ticket thay thế bộ phận [Bàn máy] khi đang thuê máy')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1207, N'MD-01-2024-00003', 479, 7, N'MachineComponent', CAST(N'2024-09-16T16:21:36.4420000' AS DateTime2), N'Ticket thay thế bộ phận [Bàn máy] đã được hoàn tất, bộ phận đã được thay thế')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1208, N'MD-01-2024-00003', 479, 7, N'MachineComponent', CAST(N'2024-09-16T16:21:36.4420000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Bàn máy từ [Hư hỏng] thành [Bình thường]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1209, N'MT-02-2024-00014', 623, 4, N'MachineComponent', CAST(N'2024-08-21T16:17:29.0590000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Hệ thống điều khiển từ [Bình thường] thành [Hư hỏng]')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1210, N'MT-02-2024-00014', 623, 4, N'MachineComponent', CAST(N'2024-08-21T16:17:29.0590000' AS DateTime2), N'Tạo ticket thay thế bộ phận [Hệ thống điều khiển] khi đang thuê máy')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1211, N'MT-02-2024-00014', 623, 4, N'MachineComponent', CAST(N'2024-08-21T16:21:36.4420000' AS DateTime2), N'Ticket thay thế bộ phận [Hệ thống điều khiển] đã được hoàn tất, bộ phận đã được thay thế')
INSERT [dbo].[MachineSerialNumberLog] ([MachineSerialNumberLogId], [SerialNumber], [MachineSerialNumberComponentId], [AccountTriggerId], [Type], [DateCreate], [Action]) VALUES (1212, N'MT-02-2024-00014', 623, 4, N'MachineComponent', CAST(N'2024-08-21T16:21:36.4420000' AS DateTime2), N'Thay đổi trạng thái của bộ phận Hệ thống điều khiển từ [Hư hỏng] thành [Bình thường]')
SET IDENTITY_INSERT [dbo].[MachineSerialNumberLog] OFF
GO
SET IDENTITY_INSERT [dbo].[MachineTask] ON 

INSERT [dbo].[MachineTask] ([MachineTaskId], [TaskTitle], [ContractId], [MachineCheckRequestId], [Content], [StaffId], [ManagerId], [DateStart], [DateCreate], [DateCompleted], [Status], [Note], [Type], [ConfirmationPictureUrl]) VALUES (1, N'Kiểm tra máy hết hạn hợp đồng CON20240714NO0002', N'CON20240714NO0002', NULL, N'', 4, 2, CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T09:21:47.3320000' AS DateTime2), CAST(N'2024-11-25T11:21:47.3320000' AS DateTime2), N'Completed', N'Kiểm tra máy cho khách', N'ContractTerminationCheck', N'')
INSERT [dbo].[MachineTask] ([MachineTaskId], [TaskTitle], [ContractId], [MachineCheckRequestId], [Content], [StaffId], [ManagerId], [DateStart], [DateCreate], [DateCompleted], [Status], [Note], [Type], [ConfirmationPictureUrl]) VALUES (2, N'Kiểm tra máy hết hạn hợp đồng CON20240714NO0001', N'CON20240714NO0001', NULL, N'', 4, 2, CAST(N'2024-11-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-25T09:21:47.3320000' AS DateTime2), CAST(N'2024-11-25T11:21:47.3320000' AS DateTime2), N'Completed', N'Kiểm tra máy cho khách', N'ContractTerminationCheck', N'')
INSERT [dbo].[MachineTask] ([MachineTaskId], [TaskTitle], [ContractId], [MachineCheckRequestId], [Content], [StaffId], [ManagerId], [DateStart], [DateCreate], [DateCompleted], [Status], [Note], [Type], [ConfirmationPictureUrl]) VALUES (3, N'Kiểm tra máy thuê theo yêu cầu REQ20241214NO001', N'CON20241013NO0001', N'REQ20241214NO001', N'', 7, 2, CAST(N'2024-12-20T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-14T10:12:44.3039347' AS DateTime2), NULL, N'Created', N'Kiểm tra máy cho khách', N'MachineryCheckRequest', NULL)
INSERT [dbo].[MachineTask] ([MachineTaskId], [TaskTitle], [ContractId], [MachineCheckRequestId], [Content], [StaffId], [ManagerId], [DateStart], [DateCreate], [DateCompleted], [Status], [Note], [Type], [ConfirmationPictureUrl]) VALUES (4, N'Kiểm tra máy thuê theo yêu cầu REQ20241215NO001', N'CON20240915NO0002', N'REQ20241115NO001', N'', 11, 2, CAST(N'2024-11-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-11-15T15:51:41.6630000' AS DateTime2), CAST(N'2024-11-16T16:40:00.0000000' AS DateTime2), N'Completed', N'Kiểm tra máy cho khách', N'MachineryCheckRequest', N'')
INSERT [dbo].[MachineTask] ([MachineTaskId], [TaskTitle], [ContractId], [MachineCheckRequestId], [Content], [StaffId], [ManagerId], [DateStart], [DateCreate], [DateCompleted], [Status], [Note], [Type], [ConfirmationPictureUrl]) VALUES (5, N'Kiểm tra máy thuê theo yêu cầu REQ20241215NO001', N'CON20241118NO0001', N'REQ20241215NO001', N'', 7, 2, CAST(N'2024-12-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-12-15T16:16:17.6069420' AS DateTime2), CAST(N'2024-12-16T16:50:19.8800000' AS DateTime2), N'Completed', N'Kiểm tra máy cho khách', N'MachineryCheckRequest', N'')
INSERT [dbo].[MachineTask] ([MachineTaskId], [TaskTitle], [ContractId], [MachineCheckRequestId], [Content], [StaffId], [ManagerId], [DateStart], [DateCreate], [DateCompleted], [Status], [Note], [Type], [ConfirmationPictureUrl]) VALUES (6, N'Kiểm tra máy thuê theo yêu cầu REQ20241020NO001', N'CON20240915NO0003', N'REQ20241020NO001', N'', 11, 2, CAST(N'2024-10-21T00:00:00.0000000' AS DateTime2), CAST(N'2024-10-20T15:02:00.2720000' AS DateTime2), CAST(N'2024-10-21T16:03:24.1660000' AS DateTime2), N'Completed', N'Kiểm tra máy cho khách', N'MachineryCheckRequest', N'')
INSERT [dbo].[MachineTask] ([MachineTaskId], [TaskTitle], [ContractId], [MachineCheckRequestId], [Content], [StaffId], [ManagerId], [DateStart], [DateCreate], [DateCompleted], [Status], [Note], [Type], [ConfirmationPictureUrl]) VALUES (8, N'Kiểm tra máy thuê theo yêu cầu REQ20240910NO001', N'CON20240612NO0001', N'REQ20240910NO001', N'', 11, 2, CAST(N'2024-09-11T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-10T15:20:12.9220000' AS DateTime2), CAST(N'2024-09-11T16:21:43.2100000' AS DateTime2), N'Completed', N'Kiểm tra máy cho khách', N'MachineryCheckRequest', N'')
INSERT [dbo].[MachineTask] ([MachineTaskId], [TaskTitle], [ContractId], [MachineCheckRequestId], [Content], [StaffId], [ManagerId], [DateStart], [DateCreate], [DateCompleted], [Status], [Note], [Type], [ConfirmationPictureUrl]) VALUES (9, N'Kiểm tra máy thuê theo yêu cầu REQ20240915NO001', N'CON20240705NO0001', N'REQ20240915NO001', N'', 7, 2, CAST(N'2024-09-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-15T17:12:44.3030000' AS DateTime2), CAST(N'2024-09-16T15:00:00.0000000' AS DateTime2), N'Completed', N'Kiểm tra máy cho khách', N'MachineryCheckRequest', NULL)
INSERT [dbo].[MachineTask] ([MachineTaskId], [TaskTitle], [ContractId], [MachineCheckRequestId], [Content], [StaffId], [ManagerId], [DateStart], [DateCreate], [DateCompleted], [Status], [Note], [Type], [ConfirmationPictureUrl]) VALUES (11, N'Kiểm tra máy thuê theo yêu cầu REQ20240820NO001', N'CON20240714NO0002', N'REQ20240820NO001', N'', 4, 2, CAST(N'2024-08-21T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-20T17:12:44.3030000' AS DateTime2), CAST(N'2024-08-21T16:40:45.2220000' AS DateTime2), N'Completed', N'Kiểm tra máy cho khách', N'MachineryCheckRequest', NULL)
SET IDENTITY_INSERT [dbo].[MachineTask] OFF
GO
SET IDENTITY_INSERT [dbo].[MachineTaskLog] ON 

INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (1, 1, 2, N'Tạo và giao công việc kiêm tra máy chấm dứt hợp đồng cho Võ Đức Nguyên', CAST(N'2024-11-25T09:21:47.3320000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (2, 2, 2, N'Tạo và giao công việc kiêm tra máy chấm dứt hợp đồng cho Võ Đức Nguyên', CAST(N'2024-11-25T11:21:47.3320000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (3, 2, 4, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Hoàn thành]', CAST(N'2024-11-25T11:21:47.3320000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (4, 1, 4, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Hoàn thành]', CAST(N'2024-11-25T11:21:47.3320000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (5, 3, 2, N'Tạo và giao công việc kiểm tra máy cho Khoa Kĩ Thuật', CAST(N'2024-12-14T10:12:44.3039347' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (6, 4, 2, N'Tạo và giao công việc kiểm tra máy cho Nguyễn Hoàng Long', CAST(N'2024-11-15T15:51:41.6630000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (7, 4, 11, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang sửa]', CAST(N'2024-11-16T15:00:00.0000000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (8, 4, 11, N'Thay đổi trạng thái từ [Đang sửa] trở thành [Hoàn thành]', CAST(N'2024-11-16T16:40:00.0000000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (9, 5, 2, N'Tạo và giao công việc kiểm tra máy cho Khoa Kĩ Thuật', CAST(N'2024-12-15T16:16:17.6069420' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (10, 5, 7, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang sửa]', CAST(N'2024-12-16T16:17:29.4810000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (11, 5, 7, N'Thay đổi trạng thái từ [Đang sửa] trở thành [Hoàn thành]', CAST(N'2024-12-16T16:50:19.9250000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (12, 6, 2, N'Tạo và giao công việc kiểm tra máy cho Nguyễn Hoàng Long', CAST(N'2024-10-20T15:02:00.2720000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (13, 6, 11, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang sửa]', CAST(N'2024-10-21T15:02:16.2500000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (14, 6, 11, N'Thay đổi trạng thái từ [Đang sửa] trở thành [Hoàn thành]', CAST(N'2024-10-21T16:03:24.1910000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (17, 8, 2, N'Tạo và giao công việc kiểm tra máy cho Nguyễn Hoàng Long', CAST(N'2024-09-10T15:20:12.9220000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (18, 8, 11, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang sửa]', CAST(N'2024-09-11T15:20:24.8040000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (19, 8, 11, N'Thay đổi trạng thái từ [Đang sửa] trở thành [Hoàn thành]', CAST(N'2024-09-11T16:21:43.2150000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (20, 9, 2, N'Tạo và giao công việc kiểm tra máy cho Khoa Kĩ Thuật', CAST(N'2024-09-15T16:16:17.6060000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (21, 9, 7, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang sửa]', CAST(N'2024-09-16T16:17:29.4810000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (22, 9, 7, N'Thay đổi trạng thái từ [Đang sửa] trở thành [Hoàn thành]', CAST(N'2024-09-16T16:40:45.2220000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (23, 11, 2, N'Tạo và giao công việc kiểm tra máy cho Võ Đức Nguyên', CAST(N'2024-08-20T16:16:17.6060000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (24, 11, 4, N'Thay đổi trạng thái từ [Mới tạo] trở thành [Đang sửa]', CAST(N'2024-08-21T15:17:29.4810000' AS DateTime2))
INSERT [dbo].[MachineTaskLog] ([MachineTaskLogId], [MachineTaskId], [AccountTriggerId], [Action], [DateCreate]) VALUES (25, 11, 4, N'Thay đổi trạng thái từ [Đang sửa] trở thành [Hoàn thành]', CAST(N'2024-08-21T16:40:45.2220000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[MachineTaskLog] OFF
GO
SET IDENTITY_INSERT [dbo].[MachineTerm] ON 

INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (1, 1, N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (2, 1, N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (3, 1, N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (10, 2, N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (11, 2, N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (12, 2, N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (13, 3, N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (14, 3, N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (15, 3, N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (16, 4, N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (17, 4, N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (18, 4, N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (19, 5, N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>')
INSERT [dbo].[MachineTerm] ([MachineTermId], [MachineId], [Title], [Content]) VALUES (20, 5, N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>')
SET IDENTITY_INSERT [dbo].[MachineTerm] OFF
GO
SET IDENTITY_INSERT [dbo].[MembershipRank] ON 

INSERT [dbo].[MembershipRank] ([MembershipRankId], [MembershipRankName], [MoneySpent], [DiscountPercentage], [Content], [DateCreate], [Status]) VALUES (1, N'Hạng Mới', 0, 0, N'Thành viên mới đăng ký thành công chưa có ưu đãi, có thể nâng hạng bằng cách tích lũy chi tiêu.', CAST(N'2024-11-14T20:09:01.3400000' AS DateTime2), N'Active')
INSERT [dbo].[MembershipRank] ([MembershipRankId], [MembershipRankName], [MoneySpent], [DiscountPercentage], [Content], [DateCreate], [Status]) VALUES (2, N'Hạng Đồng', 1000000, 5, N'Thành viên hạng Đồng được giảm 5% trên mỗi đơn hàng.', CAST(N'2024-11-14T20:09:01.3400000' AS DateTime2), N'Active')
INSERT [dbo].[MembershipRank] ([MembershipRankId], [MembershipRankName], [MoneySpent], [DiscountPercentage], [Content], [DateCreate], [Status]) VALUES (3, N'Hạng Bạc', 5000000, 10, N'Thành viên hạng Bạc được giảm 10% trên mỗi đơn hàng và tham gia chương trình ưu đãi đặc biệt.', CAST(N'2024-11-14T20:09:01.3400000' AS DateTime2), N'Active')
INSERT [dbo].[MembershipRank] ([MembershipRankId], [MembershipRankName], [MoneySpent], [DiscountPercentage], [Content], [DateCreate], [Status]) VALUES (4, N'Hạng Vàng', 10000000, 15, N'Thành viên hạng Vàng được giảm 15% trên mỗi đơn hàng, ưu tiên trong dịch vụ chăm sóc khách hàng.', CAST(N'2024-11-14T20:09:01.3400000' AS DateTime2), N'Active')
INSERT [dbo].[MembershipRank] ([MembershipRankId], [MembershipRankName], [MoneySpent], [DiscountPercentage], [Content], [DateCreate], [Status]) VALUES (5, N'Hạng Kim Cương', 20000000, 20, N'Thành viên hạng Kim Cương được giảm 20% trên mỗi đơn hàng, nhận nhiều ưu đãi độc quyền.', CAST(N'2024-11-14T20:09:01.3400000' AS DateTime2), N'Active')
INSERT [dbo].[MembershipRank] ([MembershipRankId], [MembershipRankName], [MoneySpent], [DiscountPercentage], [Content], [DateCreate], [Status]) VALUES (6, N'Hạng Bạch Kim', 50000000, 25, N'Thành viên hạng Bạch Kim được giảm 25% trên mỗi đơn hàng, hưởng các dịch vụ VIP và quà tặng định kỳ.', CAST(N'2024-11-14T20:09:01.3400000' AS DateTime2), N'Active')
SET IDENTITY_INSERT [dbo].[MembershipRank] OFF
GO
SET IDENTITY_INSERT [dbo].[MembershipRankLog] ON 

INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1, 1, 9, N'Tổng số tiền đã thanh toán là 333.785.100 ₫', CAST(N'2024-12-04T20:33:56.0992458' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (2, 6, 9, N'Hạng thành viên đã được nâng cấp lên Hạng Bạch Kim', CAST(N'2024-12-04T20:33:56.1681709' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (3, 6, 9, N'Tổng số tiền đã thanh toán là 671.970.200 ₫', CAST(N'2024-12-04T21:19:38.8312979' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (4, 1, 24, N'Hạng thành viên đã được nâng cấp lên Hạng Mới', CAST(N'2024-12-05T09:15:42.0377584' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (5, 1, 24, N'Tổng số tiền đã thanh toán là 555.092.200 ₫', CAST(N'2024-12-05T09:49:02.2634681' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (6, 6, 24, N'Hạng thành viên đã được nâng cấp lên Hạng Bạch Kim', CAST(N'2024-12-05T09:49:02.2829202' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (7, 6, 24, N'Tổng số tiền đã thanh toán là 1.325.359.400 ₫', CAST(N'2024-12-05T11:58:14.9518384' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (8, 6, 24, N'Tổng số tiền đã thanh toán là 1.425.470.400 ₫', CAST(N'2024-12-05T16:11:00.7666511' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (9, 6, 9, N'Tổng số tiền đã thanh toán là 1.186.545.300 ₫', CAST(N'2024-12-09T08:16:42.5123046' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (10, 6, 9, N'Tổng số tiền đã thanh toán là 1.657.312.900 ₫', CAST(N'2024-12-09T08:26:43.2985861' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (11, 6, 9, N'Tổng số tiền đã thanh toán là 1.707.423.900 ₫', CAST(N'2024-12-09T08:58:33.1955512' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1010, 6, 9, N'Tổng số tiền đã thanh toán là 2.396.334.100 ₫', CAST(N'2024-12-10T22:47:06.9927871' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1014, 6, 24, N'Tổng số tiền đã thanh toán là 2.166.092.600 ₫', CAST(N'2024-12-12T15:35:51.5474622' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1016, 1, 8, N'Tổng số tiền đã thanh toán là 472.121.000 ₫', CAST(N'2024-12-13T19:40:50.7157735' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1017, 6, 8, N'Hạng thành viên đã được nâng cấp lên Hạng Bạch Kim', CAST(N'2024-12-13T19:40:50.7293178' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1018, 1, 17, N'Tổng số tiền đã thanh toán là 678.139.600 ₫', CAST(N'2024-12-13T20:11:28.6227375' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1019, 6, 17, N'Hạng thành viên đã được nâng cấp lên Hạng Bạch Kim', CAST(N'2024-12-13T20:11:28.6353121' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1020, 1, 19, N'Tổng số tiền đã thanh toán là 791.355.800 ₫', CAST(N'2024-12-13T20:41:53.0513284' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1021, 6, 19, N'Hạng thành viên đã được nâng cấp lên Hạng Bạch Kim', CAST(N'2024-12-13T20:41:53.0692649' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1022, 6, 24, N'Tổng số tiền đã thanh toán là 2.659.584.800 ₫', CAST(N'2024-12-13T21:04:44.6644408' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1023, 6, 9, N'Tổng số tiền đã thanh toán là 2.956.384.300 ₫', CAST(N'2024-12-14T09:12:48.0880303' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1024, 6, 9, N'Tổng số tiền đã thanh toán là 3.915.244.600 ₫', CAST(N'2024-12-15T15:19:49.1163081' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1025, 6, 9, N'Tổng số tiền đã thanh toán là 3.935.355.600 ₫', CAST(N'2024-12-15T15:53:04.2650700' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1026, 6, 17, N'Tổng số tiền đã thanh toán là 683.250.600 ₫', CAST(N'2024-12-15T16:18:15.3520382' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1027, 6, 19, N'Tổng số tiền đã thanh toán là 806.466.800 ₫', CAST(N'2024-12-16T09:10:42.2836676' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1028, 6, 19, N'Tổng số tiền đã thanh toán là 808.577.800 ₫', CAST(N'2024-12-16T09:12:03.5506716' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1029, 6, 9, N'Tổng số tiền đã thanh toán là 3.985.466.600 ₫', CAST(N'2024-12-16T15:03:00.1308052' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1030, 6, 24, N'Tổng số tiền đã thanh toán là 2.674.695.800 ₫', CAST(N'2024-12-16T15:21:25.8826225' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1031, 6, 9, N'Tổng số tiền đã thanh toán là 4.449.101.700 ₫', CAST(N'2024-12-18T14:56:25.9088975' AS DateTime2))
INSERT [dbo].[MembershipRankLog] ([MembershipRankLogId], [MembershipRankId], [AccountId], [Action], [DateCreate]) VALUES (1032, 6, 9, N'Tổng số tiền đã thanh toán là 4.502.021.700 ₫', CAST(N'2024-12-18T15:16:23.1481047' AS DateTime2))
SET IDENTITY_INSERT [dbo].[MembershipRankLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241204NO002.', N'Send', CAST(N'2024-12-04T20:33:56.5299326' AS DateTime2), NULL, N'REH20241204NO002', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (2, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241204NO002.', N'Send', CAST(N'2024-12-04T20:33:56.6604883' AS DateTime2), NULL, N'REH20241204NO002', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (3, 7, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 05/12/2024', N'Send', CAST(N'2024-12-04T20:36:14.2997961' AS DateTime2), NULL, N'1', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (4, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-04T21:16:54.3911470' AS DateTime2), NULL, N'1', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (5, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-04T21:16:54.8065545' AS DateTime2), NULL, N'1', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (6, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-04T21:17:32.7374119' AS DateTime2), NULL, N'1', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (7, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-04T21:17:32.7537357' AS DateTime2), NULL, N'1', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (8, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241204NO003.', N'Send', CAST(N'2024-12-04T21:19:38.9902230' AS DateTime2), NULL, N'REH20241204NO003', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (9, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241204NO003.', N'Send', CAST(N'2024-12-04T21:19:38.9976761' AS DateTime2), NULL, N'REH20241204NO003', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (10, 7, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 09/12/2024', N'Send', CAST(N'2024-12-04T21:20:29.7290698' AS DateTime2), NULL, N'2', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (11, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Read', CAST(N'2024-12-04T21:21:14.1903334' AS DateTime2), CAST(N'2024-12-05T11:27:33.8504744' AS DateTime2), N'2', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (12, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-04T21:21:14.2325944' AS DateTime2), NULL, N'2', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (13, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Thất bại]', N'Send', CAST(N'2024-12-04T21:21:32.1982669' AS DateTime2), NULL, N'2', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (14, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Thất bại]', N'Send', CAST(N'2024-12-04T21:21:32.2103086' AS DateTime2), NULL, N'2', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (15, 7, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 09/12/2024', N'Send', CAST(N'2024-12-04T21:48:59.5410550' AS DateTime2), NULL, N'3', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (16, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Khang Bùi đã ký tất cả hợp đồng cho yêu cầu thuê REH20241205NO001.', N'Read', CAST(N'2024-09-05T08:00:00.0000000' AS DateTime2), CAST(N'2024-12-05T11:45:58.5070998' AS DateTime2), N'REH20240905NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (17, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Khang Bùi đã ký tất cả hợp đồng cho yêu cầu thuê REH20241205NO001.', N'Send', CAST(N'2024-09-05T08:00:00.0000000' AS DateTime2), NULL, N'REH20240905NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (18, 22, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh vào ngày 06/12/2024', N'Read', CAST(N'2024-12-05T09:54:07.6073922' AS DateTime2), CAST(N'2024-12-05T10:48:13.7690467' AS DateTime2), N'4', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (19, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Đang giao]', N'Read', CAST(N'2024-12-05T10:01:49.5908476' AS DateTime2), CAST(N'2024-12-05T11:27:06.0533187' AS DateTime2), N'4', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (20, 24, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Đang giao]', N'Read', CAST(N'2024-12-05T10:01:49.6130944' AS DateTime2), CAST(N'2024-12-05T11:08:13.7121211' AS DateTime2), N'4', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (21, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Hoàn thành]', N'Read', CAST(N'2024-12-05T10:03:44.0964876' AS DateTime2), CAST(N'2024-12-05T11:27:37.5238447' AS DateTime2), N'4', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (22, 24, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Hoàn thành]', N'Read', CAST(N'2024-12-05T10:03:44.1082278' AS DateTime2), CAST(N'2024-12-05T11:08:21.5348792' AS DateTime2), N'4', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (23, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240905NO0001', N'Send', CAST(N'2024-10-10T11:49:42.8130000' AS DateTime2), NULL, N'REQ20241010NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (24, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240905NO0001', N'Send', CAST(N'2024-10-10T11:49:42.9160000' AS DateTime2), NULL, N'REQ20241010NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (25, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Khang Bùi đã ký tất cả hợp đồng cho yêu cầu thuê REH20241205NO001.', N'Send', CAST(N'2024-10-05T08:00:00.0000000' AS DateTime2), NULL, N'REH20240905NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (26, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Khang Bùi đã ký tất cả hợp đồng cho yêu cầu thuê REH20241205NO001.', N'Send', CAST(N'2024-10-05T08:00:00.0000000' AS DateTime2), NULL, N'REH20240905NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (27, 24, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241205NO001 của máy MT-02-2024-00008 đã được đổi thành [Đã giao nhiệm vụ]', N'Send', CAST(N'2024-12-05T16:07:59.5936573' AS DateTime2), NULL, N'REQ20241010NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (28, 22, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh vào ngày 05/12/2024', N'Send', CAST(N'2024-10-10T16:07:59.6190000' AS DateTime2), NULL, N'1', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (29, 24, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241205NO001 của máy MT-02-2024-00008 đã được đổi thành [Đang xử lý]', N'Send', CAST(N'2024-10-10T16:08:51.4600000' AS DateTime2), NULL, N'REQ20241010NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (30, 24, N'ComponentReplacementTicket', N'Bạn có ticket thay sửa bộ phận cần được thanh toán', N'Bộ phận  cần được thay/sửa với tổng giá tiền là 100111000', N'Read', CAST(N'2024-10-10T16:08:51.5000000' AS DateTime2), CAST(N'2024-10-05T16:09:07.8730000' AS DateTime2), N'CRT20241010NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (31, 22, N'ComponentReplacementTicket', N'Một ticket thay thế bộ phận máy của bạn đã được khách thanh toán', N'Ticket thay bộ phận Hệ thống thủy lực của máy MT-02-2024-00008 đã được thanh toán', N'Send', CAST(N'2024-10-10T16:11:00.8980000' AS DateTime2), NULL, N'CRT20241010NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (32, 24, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241205NO001 của máy MT-02-2024-00008 đã được đổi thành [Hoàn thành]', N'Read', CAST(N'2024-10-10T16:11:28.7730000' AS DateTime2), CAST(N'2024-10-05T16:46:30.9980000' AS DateTime2), N'REQ20241010NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (33, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy thuê theo yêu cầu REQ20241205NO001 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-10-10T16:11:28.7880000' AS DateTime2), NULL, N'1', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (34, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240905NO0002', N'Send', CAST(N'2024-10-10T16:14:40.5800000' AS DateTime2), NULL, N'REQ20241205NO002', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (35, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240905NO0002', N'Send', CAST(N'2024-10-10T16:14:40.5920000' AS DateTime2), NULL, N'REQ20241205NO002', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (36, 2, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20240905NO0001.', N'Read', CAST(N'2024-12-06T09:42:14.5200657' AS DateTime2), CAST(N'2024-12-06T09:42:24.5424986' AS DateTime2), N'CON20240905NO0001', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (37, 5, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20240905NO0001.', N'Send', CAST(N'2024-12-06T09:42:14.6856917' AS DateTime2), NULL, N'CON20240905NO0001', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (38, 22, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh vào ngày 06/12/2024', N'Send', CAST(N'2024-12-06T10:44:37.9925361' AS DateTime2), NULL, N'2', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (39, 24, N'ComponentReplacementTicket', N'Bạn có ticket thay sửa bộ phận cần được thanh toán', N'Bộ phận  cần được thay/sửa với tổng giá tiền là 50111000', N'Send', CAST(N'2024-12-06T10:45:20.8887136' AS DateTime2), NULL, N'CRT20241206NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (40, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy hết hạn hợp đồng  đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-06T10:45:31.4147877' AS DateTime2), NULL, N'2', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (41, 24, N'Invoice', N'Hoá đơn hoàn tiền đã được tạo', N'Hoá đơn hoàn tiền cho hợp đồng CON20240905NO0001 đã được tạo.', N'Send', CAST(N'2024-12-06T10:47:23.2119305' AS DateTime2), NULL, N'INV20241206NO001', N'InvoiceId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (42, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241209NO001.', N'Send', CAST(N'2024-12-09T08:16:43.0493731' AS DateTime2), NULL, N'REH20241209NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (43, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241209NO001.', N'Send', CAST(N'2024-12-09T08:16:43.0745272' AS DateTime2), NULL, N'REH20241209NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (44, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241209NO002.', N'Send', CAST(N'2024-12-09T08:26:43.8043643' AS DateTime2), NULL, N'REH20241209NO002', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (45, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241209NO002.', N'Read', CAST(N'2024-12-09T08:26:43.8158896' AS DateTime2), CAST(N'2024-12-09T08:41:12.6546089' AS DateTime2), N'REH20241209NO002', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (46, 7, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ 120 An Bình, Phường 5, Quận 5, Hồ Chí Minh, Quận 5 vào ngày 10/12/2024', N'Send', CAST(N'2024-12-09T08:38:21.4476183' AS DateTime2), NULL, N'5', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (47, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-09T08:41:17.6043015' AS DateTime2), NULL, N'3', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (48, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-09T08:41:17.7159214' AS DateTime2), NULL, N'3', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (49, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-09T08:43:29.6675348' AS DateTime2), NULL, N'3', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (50, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-09T08:43:29.6892396' AS DateTime2), NULL, N'3', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (51, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241204NO0004', N'Send', CAST(N'2024-12-09T08:55:49.0751182' AS DateTime2), NULL, N'REQ20241209NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (52, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241204NO0004', N'Read', CAST(N'2024-12-09T08:55:49.1442183' AS DateTime2), CAST(N'2024-12-09T08:56:19.6973300' AS DateTime2), N'REQ20241209NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (53, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241209NO001 của máy MT-02-2024-00009 đã được đổi thành [Đã giao nhiệm vụ]', N'Send', CAST(N'2024-12-09T08:57:09.8049817' AS DateTime2), NULL, N'REQ20241209NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (54, 7, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 09/12/2024', N'Send', CAST(N'2024-12-09T08:57:09.8692297' AS DateTime2), NULL, N'3', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (55, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241209NO001 của máy MT-02-2024-00009 đã được đổi thành [Đang xử lý]', N'Send', CAST(N'2024-12-09T08:57:28.0653892' AS DateTime2), NULL, N'REQ20241209NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (56, 9, N'ComponentReplacementTicket', N'Bạn có ticket thay sửa bộ phận cần được thanh toán', N'Bộ phận  cần được thay/sửa với tổng giá tiền là 50111000', N'Read', CAST(N'2024-12-09T08:57:28.3279459' AS DateTime2), CAST(N'2024-12-09T08:57:39.3038544' AS DateTime2), N'CRT20241209NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (57, 7, N'ComponentReplacementTicket', N'Một ticket thay thế bộ phận máy của bạn đã được khách thanh toán', N'Ticket thay bộ phận Hệ thống điều khiển của máy MT-02-2024-00009 đã được thanh toán', N'Send', CAST(N'2024-12-09T08:58:33.6820950' AS DateTime2), NULL, N'CRT20241209NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (58, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241209NO001 của máy MT-02-2024-00009 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-09T08:59:01.4477430' AS DateTime2), NULL, N'REQ20241209NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (59, 5, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy thuê theo yêu cầu REQ20241209NO001 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-09T08:59:01.4943240' AS DateTime2), NULL, N'3', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (60, 2, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241204NO0004.', N'Send', CAST(N'2024-12-09T08:59:44.0101419' AS DateTime2), NULL, N'CON20241204NO0004', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (61, 5, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241204NO0004.', N'Send', CAST(N'2024-12-09T08:59:44.0406382' AS DateTime2), NULL, N'CON20241204NO0004', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (62, 7, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 10/12/2024', N'Send', CAST(N'2024-12-09T09:00:32.3999238' AS DateTime2), NULL, N'4', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (63, 9, N'ComponentReplacementTicket', N'Bạn có ticket thay sửa bộ phận cần được thanh toán', N'Bộ phận  cần được thay/sửa với tổng giá tiền là 120111000', N'Send', CAST(N'2024-12-09T09:01:09.7975732' AS DateTime2), NULL, N'CRT20241209NO002', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (64, 5, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy hết hạn hợp đồng CON20241204NO0004 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-09T09:01:26.5449308' AS DateTime2), NULL, N'4', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (65, 9, N'Invoice', N'Hoá đơn hoàn tiền đã được tạo', N'Hoá đơn hoàn tiền cho hợp đồng CON20241204NO0004 đã được tạo.', N'Read', CAST(N'2024-12-09T09:05:30.0783811' AS DateTime2), CAST(N'2024-12-12T13:07:37.6369921' AS DateTime2), N'INV20241209NO004', N'InvoiceId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1042, 11, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh vào ngày 10/12/2024', N'Send', CAST(N'2024-12-09T11:11:55.8187496' AS DateTime2), NULL, N'1005', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1043, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241210NO002.', N'Send', CAST(N'2024-12-10T22:47:07.2784330' AS DateTime2), NULL, N'REH20241210NO002', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1044, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241210NO002.', N'Send', CAST(N'2024-12-10T22:47:07.2855383' AS DateTime2), NULL, N'REH20241210NO002', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1045, 7, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 11/12/2024', N'Send', CAST(N'2024-12-10T22:49:47.1838255' AS DateTime2), NULL, N'1006', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1046, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-10T22:50:06.8561533' AS DateTime2), NULL, N'1006', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1047, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-10T22:50:06.8783085' AS DateTime2), NULL, N'1006', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1048, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-10T22:51:21.2645280' AS DateTime2), NULL, N'1006', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1049, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Read', CAST(N'2024-12-10T22:51:21.2845645' AS DateTime2), CAST(N'2024-12-12T13:07:24.5355424' AS DateTime2), N'1006', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1050, 2, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241210NO0003.', N'Send', CAST(N'2024-12-10T23:07:32.2037780' AS DateTime2), NULL, N'CON20241210NO0003', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1051, 5, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241210NO0003.', N'Send', CAST(N'2024-12-10T23:07:32.2101256' AS DateTime2), NULL, N'CON20241210NO0003', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1052, 7, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 10/12/2024', N'Send', CAST(N'2024-12-10T23:08:16.0058886' AS DateTime2), NULL, N'1003', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1053, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy hết hạn hợp đồng CON20241210NO0003 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-10T23:08:30.0091871' AS DateTime2), NULL, N'1003', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1054, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-10T23:22:20.5000294' AS DateTime2), NULL, N'1005', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1055, 24, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-10T23:22:20.5251044' AS DateTime2), NULL, N'1005', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1056, 4, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 11-12-2024', N'Send', CAST(N'2024-12-11T10:43:13.1274911' AS DateTime2), NULL, N'1007', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1057, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-11T13:59:58.9765233' AS DateTime2), NULL, N'1005', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1058, 24, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Hoàn thành]', N'Read', CAST(N'2024-12-11T13:59:59.1376388' AS DateTime2), CAST(N'2024-12-11T20:57:27.2932864' AS DateTime2), N'1005', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1059, 2, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $khang vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-11T16:05:17.0140412' AS DateTime2), NULL, N'26', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1060, 5, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $khang vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Read', CAST(N'2024-12-11T16:05:17.7295858' AS DateTime2), CAST(N'2024-12-11T19:23:27.0576351' AS DateTime2), N'26', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1061, 9, N'Invoice', N'Hoá đơn hoàn tiền đã được tạo', N'Hoá đơn hoàn tiền cho hợp đồng CON20241210NO0003 đã được tạo.', N'Read', CAST(N'2024-12-11T16:33:58.9719648' AS DateTime2), CAST(N'2024-12-12T13:07:15.2642939' AS DateTime2), N'INV20241211NO003', N'InvoiceId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1062, 2, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241210NO0004.', N'Send', CAST(N'2024-12-11T16:38:51.2492425' AS DateTime2), NULL, N'CON20241210NO0004', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1063, 5, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241210NO0004.', N'Send', CAST(N'2024-12-11T16:38:51.4190065' AS DateTime2), NULL, N'CON20241210NO0004', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1064, 2, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241204NO0003.', N'Send', CAST(N'2024-12-11T16:38:54.4097503' AS DateTime2), NULL, N'CON20241204NO0003', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1065, 5, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241204NO0003.', N'Send', CAST(N'2024-12-11T16:38:54.4216740' AS DateTime2), NULL, N'CON20241204NO0003', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1066, 11, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 12/12/2024', N'Send', CAST(N'2024-12-11T16:41:01.0973643' AS DateTime2), NULL, N'1004', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1067, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy hết hạn hợp đồng CON20241210NO0004 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-11T16:43:01.1452624' AS DateTime2), NULL, N'1004', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1068, 9, N'Invoice', N'Hoá đơn hoàn tiền đã được tạo', N'Hoá đơn hoàn tiền cho hợp đồng CON20241210NO0004 đã được tạo.', N'Read', CAST(N'2024-12-11T16:43:58.6170566' AS DateTime2), CAST(N'2024-12-12T13:07:20.3387905' AS DateTime2), N'INV20241211NO004', N'InvoiceId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1069, 11, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 12/12/2024', N'Send', CAST(N'2024-12-11T17:14:08.6948555' AS DateTime2), NULL, N'1005', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1070, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy hết hạn hợp đồng CON20241204NO0003 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-11T17:19:53.3667031' AS DateTime2), NULL, N'1005', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1071, 9, N'Invoice', N'Hoá đơn hoàn tiền đã được tạo', N'Hoá đơn hoàn tiền cho hợp đồng CON20241204NO0003 đã được tạo.', N'Read', CAST(N'2024-12-11T17:20:41.7781890' AS DateTime2), CAST(N'2024-12-12T13:07:17.5061056' AS DateTime2), N'INV20241211NO005', N'InvoiceId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1072, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-11T19:50:38.9871724' AS DateTime2), NULL, N'1007', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1073, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-11T19:50:39.0215243' AS DateTime2), NULL, N'1007', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1074, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-11T19:56:13.6937044' AS DateTime2), NULL, N'1007', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1075, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-11T19:56:13.7288710' AS DateTime2), NULL, N'1007', N'DeliveryTaskId')
GO
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1076, 2, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:32:54.5450934' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1077, 5, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:32:54.6621838' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1078, 2, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:33:14.3505962' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1079, 5, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:33:14.3610769' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1080, 2, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:33:18.0686490' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1081, 5, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:33:18.0838531' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1082, 2, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:33:59.6123787' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1083, 5, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:33:59.6232316' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1084, 2, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:34:43.8894181' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1085, 5, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:34:43.9012955' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1086, 2, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:45:17.0081738' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1087, 5, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T14:45:17.0199927' AS DateTime2), NULL, N'36', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1088, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Khang Bùi đã ký tất cả hợp đồng cho yêu cầu thuê REH20240612NO001.', N'Send', CAST(N'2024-12-12T15:35:52.4996571' AS DateTime2), NULL, N'REH20240612NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1089, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Khang Bùi đã ký tất cả hợp đồng cho yêu cầu thuê REH20240612NO001.', N'Send', CAST(N'2024-12-12T15:35:52.5075040' AS DateTime2), NULL, N'REH20240612NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1090, 7, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh vào ngày 20/06/2024', N'Send', CAST(N'2024-12-12T15:39:19.3705370' AS DateTime2), NULL, N'1008', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1091, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-12T15:40:00.1520384' AS DateTime2), NULL, N'1008', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1092, 24, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-12T15:40:00.1766949' AS DateTime2), NULL, N'1008', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1093, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-12T15:42:08.9659700' AS DateTime2), NULL, N'1008', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1094, 24, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-12T15:42:08.9792124' AS DateTime2), NULL, N'1008', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1095, 2, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Send', CAST(N'2024-12-12T16:27:20.5115898' AS DateTime2), NULL, N'37', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1096, 5, N'Account', N'Có một tài khoản khách mới cần được duyệt', N'Một tài khoản khách của người dùng tên $Nguyen Van Hoang Minh vừa được tạo, hãy bắt đầu quá trình kiểm tra tài khoản', N'Read', CAST(N'2024-12-12T16:27:20.5251068' AS DateTime2), CAST(N'2024-12-12T18:50:54.3583996' AS DateTime2), N'37', N'AccountId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1097, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 120 An Bình, Phường 5, Quận 5, Hồ Chí Minh, Quận 5 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-13T10:30:12.8207548' AS DateTime2), NULL, N'5', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1098, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 120 An Bình, Phường 5, Quận 5, Hồ Chí Minh, Quận 5 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-13T10:30:12.8420423' AS DateTime2), NULL, N'5', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1099, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Đăng Khoa đã ký tất cả hợp đồng cho yêu cầu thuê REH20241213NO001.', N'Send', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), NULL, N'REH20241013NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1100, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Đăng Khoa đã ký tất cả hợp đồng cho yêu cầu thuê REH20241213NO001.', N'Send', CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), NULL, N'REH20241013NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1101, 20, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ Bến Thành Mart, 683 Âu Cơ, Tân Thành, Tân Phú, Hồ Chí Minh, Tân Phú vào ngày 24/12/2024', N'Send', CAST(N'2024-12-13T19:41:57.4852799' AS DateTime2), NULL, N'1009', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1102, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Bến Thành Mart, 683 Âu Cơ, Tân Thành, Tân Phú, Hồ Chí Minh, Tân Phú đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-13T19:43:20.3513177' AS DateTime2), NULL, N'1009', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1103, 8, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Bến Thành Mart, 683 Âu Cơ, Tân Thành, Tân Phú, Hồ Chí Minh, Tân Phú đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-13T19:43:20.3736478' AS DateTime2), NULL, N'1009', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1104, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Bến Thành Mart, 683 Âu Cơ, Tân Thành, Tân Phú, Hồ Chí Minh, Tân Phú đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-13T19:45:13.4468538' AS DateTime2), NULL, N'1009', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1105, 8, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ Bến Thành Mart, 683 Âu Cơ, Tân Thành, Tân Phú, Hồ Chí Minh, Tân Phú đã được đổi thành [Hoàn thành]', N'Read', CAST(N'2024-12-13T19:45:13.4593648' AS DateTime2), CAST(N'2024-12-15T15:29:35.7780058' AS DateTime2), N'1009', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1106, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Nguyễn Hoàng Nam đã ký tất cả hợp đồng cho yêu cầu thuê REH20241213NO001.', N'Send', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), NULL, N'REH20241118NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1107, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Nguyễn Hoàng Nam đã ký tất cả hợp đồng cho yêu cầu thuê REH20241213NO001.', N'Send', CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), NULL, N'REH20241118NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1108, 20, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ AEON TÂN PHÚ, Bờ Bao Tân Thắng, Celadon City, Sơn Kỳ, Tân Phú, Hồ Chí Minh, Tân Phú vào ngày 25/12/2024', N'Send', CAST(N'2024-12-13T20:12:54.7648728' AS DateTime2), NULL, N'1010', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1109, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ AEON TÂN PHÚ, Bờ Bao Tân Thắng, Celadon City, Sơn Kỳ, Tân Phú, Hồ Chí Minh, Tân Phú đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-13T20:17:15.8770402' AS DateTime2), NULL, N'1010', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1110, 17, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ AEON TÂN PHÚ, Bờ Bao Tân Thắng, Celadon City, Sơn Kỳ, Tân Phú, Hồ Chí Minh, Tân Phú đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-13T20:17:15.9068174' AS DateTime2), NULL, N'1010', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1111, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ AEON TÂN PHÚ, Bờ Bao Tân Thắng, Celadon City, Sơn Kỳ, Tân Phú, Hồ Chí Minh, Tân Phú đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-13T20:19:13.8483553' AS DateTime2), NULL, N'1010', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1112, 17, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ AEON TÂN PHÚ, Bờ Bao Tân Thắng, Celadon City, Sơn Kỳ, Tân Phú, Hồ Chí Minh, Tân Phú đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-13T20:19:13.8647609' AS DateTime2), NULL, N'1010', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1113, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Nguyễn Hoàng đã ký tất cả hợp đồng cho yêu cầu thuê REH20241213NO001.', N'Send', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), NULL, N'REH20240805NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1114, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Nguyễn Hoàng đã ký tất cả hợp đồng cho yêu cầu thuê REH20241213NO001.', N'Send', CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), NULL, N'REH20240805NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1115, 4, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ The Coffee House, 17 Út Tịch, Phường 4, Tân Bình, Hồ Chí Minh, Tân Bình vào ngày 20/12/2024', N'Send', CAST(N'2024-12-13T20:42:33.9778866' AS DateTime2), NULL, N'1011', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1116, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ The Coffee House, 17 Út Tịch, Phường 4, Tân Bình, Hồ Chí Minh, Tân Bình đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-13T20:44:04.8006881' AS DateTime2), NULL, N'1011', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1117, 19, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ The Coffee House, 17 Út Tịch, Phường 4, Tân Bình, Hồ Chí Minh, Tân Bình đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-13T20:44:04.8219627' AS DateTime2), NULL, N'1011', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1118, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ The Coffee House, 17 Út Tịch, Phường 4, Tân Bình, Hồ Chí Minh, Tân Bình đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-13T20:46:06.0629568' AS DateTime2), NULL, N'1011', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1119, 19, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ The Coffee House, 17 Út Tịch, Phường 4, Tân Bình, Hồ Chí Minh, Tân Bình đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-13T20:46:06.0791629' AS DateTime2), NULL, N'1011', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1120, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Khang Bùi đã ký tất cả hợp đồng cho yêu cầu thuê REH20241213NO001.', N'Send', CAST(N'2024-12-13T21:04:45.3149211' AS DateTime2), NULL, N'REH20241213NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1121, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Khang Bùi đã ký tất cả hợp đồng cho yêu cầu thuê REH20241213NO001.', N'Read', CAST(N'2024-12-13T21:04:45.3269987' AS DateTime2), CAST(N'2024-12-14T09:02:57.8013778' AS DateTime2), N'REH20241213NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1122, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241214NO001.', N'Send', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), NULL, N'REH20240714NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1123, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241214NO001.', N'Send', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), NULL, N'REH20240714NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1124, 11, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 24/12/2024', N'Send', CAST(N'2024-12-14T09:13:59.3871733' AS DateTime2), NULL, N'1012', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1125, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-14T09:14:26.6421866' AS DateTime2), NULL, N'1012', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1126, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-14T09:14:26.6572941' AS DateTime2), NULL, N'1012', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1127, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-14T09:18:00.7219346' AS DateTime2), NULL, N'1012', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1128, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-14T09:18:00.7552160' AS DateTime2), NULL, N'1012', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1129, 2, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241214NO0002.', N'Send', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), NULL, N'CON20240714NO0002', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1130, 5, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241214NO0002.', N'Send', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), NULL, N'CON20240714NO0002', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1131, 2, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241214NO0001.', N'Send', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), NULL, N'CON20240714NO0001', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1132, 5, N'Contract', N'Khách hàng đã kết thúc hợp đồng', N'Khách hàng đã kết thúc hợp đồng CON20241214NO0001.', N'Send', CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), NULL, N'CON20240714NO0001', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1133, 4, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 25/12/2024', N'Send', CAST(N'2024-12-14T09:20:14.1233394' AS DateTime2), NULL, N'1', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1134, 4, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 25/12/2024', N'Send', CAST(N'2024-12-14T09:20:40.3379873' AS DateTime2), NULL, N'2', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1135, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy hết hạn hợp đồng CON20241214NO0001 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-14T09:21:40.5777995' AS DateTime2), NULL, N'2', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1136, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy hết hạn hợp đồng CON20241214NO0002 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-14T09:21:47.4945211' AS DateTime2), NULL, N'1', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1137, 9, N'Invoice', N'Hoá đơn hoàn tiền đã được tạo', N'Hoá đơn hoàn tiền cho hợp đồng CON20241214NO0002 đã được tạo.', N'Send', CAST(N'2024-11-25T15:00:00.0000000' AS DateTime2), NULL, N'INV20241125NO001', N'InvoiceId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1138, 9, N'Invoice', N'Hoá đơn hoàn tiền đã được tạo', N'Hoá đơn hoàn tiền cho hợp đồng CON20241214NO0001 đã được tạo.', N'Send', CAST(N'2024-11-25T15:00:00.0000000' AS DateTime2), NULL, N'INV20241125NO002', N'InvoiceId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1139, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241013NO0001', N'Send', CAST(N'2024-12-14T10:11:28.3972528' AS DateTime2), NULL, N'REQ20241214NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1140, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241013NO0001', N'Send', CAST(N'2024-12-14T10:11:28.4093451' AS DateTime2), NULL, N'REQ20241214NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1141, 8, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241214NO001 của máy MK-01-2024-00004 đã được đổi thành [Đã giao nhiệm vụ]', N'Read', CAST(N'2024-12-14T10:12:44.4091875' AS DateTime2), CAST(N'2024-12-15T15:15:28.1832692' AS DateTime2), N'REQ20241214NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1142, 7, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ Bến Thành Mart, 683 Âu Cơ, Tân Thành, Tân Phú, Hồ Chí Minh, Tân Phú vào ngày 16/12/2024', N'Send', CAST(N'2024-12-14T10:12:44.4274567' AS DateTime2), NULL, N'3', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1143, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241215NO001.', N'Send', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), NULL, N'REH20240915NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1144, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241215NO001.', N'Send', CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), NULL, N'REH20240915NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1145, 11, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 08/12/2024', N'Send', CAST(N'2024-12-15T15:20:35.8647971' AS DateTime2), NULL, N'1013', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1146, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-15T15:21:38.1141075' AS DateTime2), NULL, N'1013', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1147, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-15T15:21:38.1956597' AS DateTime2), NULL, N'1013', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1148, 2, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-15T15:25:41.4653023' AS DateTime2), NULL, N'1013', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1149, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-15T15:25:41.5102058' AS DateTime2), NULL, N'1013', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1150, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240915NO0002', N'Send', CAST(N'2024-12-15T15:50:56.6234989' AS DateTime2), NULL, N'REQ20241115NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1151, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240915NO0002', N'Send', CAST(N'2024-12-15T15:50:56.6848530' AS DateTime2), NULL, N'REQ20241115NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1152, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241215NO001 của máy MM-01-2024-00002 đã được đổi thành [Đã giao nhiệm vụ]', N'Send', CAST(N'2024-12-15T15:51:41.8539656' AS DateTime2), NULL, N'REQ20241115NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1153, 11, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 16/12/2024', N'Send', CAST(N'2024-12-15T15:51:41.8982554' AS DateTime2), NULL, N'4', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1154, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241215NO001 của máy MM-01-2024-00002 đã được đổi thành [Đang xử lý]', N'Send', CAST(N'2024-12-15T15:52:10.8717930' AS DateTime2), NULL, N'REQ20241115NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1155, 9, N'ComponentReplacementTicket', N'Bạn có ticket thay sửa bộ phận cần được thanh toán', N'Bộ phận  cần được thay/sửa với tổng giá tiền là 20111000', N'Send', CAST(N'2024-12-15T15:52:10.9233330' AS DateTime2), NULL, N'CRT20241116NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1156, 11, N'ComponentReplacementTicket', N'Một ticket thay thế bộ phận máy của bạn đã được khách thanh toán', N'Ticket thay bộ phận Bàn máy của máy MM-01-2024-00002 đã được thanh toán', N'Send', CAST(N'2024-12-15T15:53:04.5723444' AS DateTime2), NULL, N'CRT20241116NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1157, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241215NO001 của máy MM-01-2024-00002 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-15T15:53:25.6682145' AS DateTime2), NULL, N'REQ20241115NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1158, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy thuê theo yêu cầu REQ20241215NO001 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-15T15:53:25.6955348' AS DateTime2), NULL, N'4', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1159, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241118NO0001', N'Send', CAST(N'2024-12-15T16:15:12.8135275' AS DateTime2), NULL, N'REQ20241215NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1160, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241118NO0001', N'Send', CAST(N'2024-12-15T16:15:12.8233215' AS DateTime2), NULL, N'REQ20241215NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1161, 17, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241215NO001 của máy MM-01-2024-00005 đã được đổi thành [Đã giao nhiệm vụ]', N'Send', CAST(N'2024-12-15T16:16:17.8392222' AS DateTime2), NULL, N'REQ20241215NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1162, 7, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ AEON TÂN PHÚ, Bờ Bao Tân Thắng, Celadon City, Sơn Kỳ, Tân Phú, Hồ Chí Minh, Tân Phú vào ngày 16/12/2024', N'Send', CAST(N'2024-12-15T16:16:17.8480807' AS DateTime2), NULL, N'5', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1163, 17, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241215NO001 của máy MM-01-2024-00005 đã được đổi thành [Đang xử lý]', N'Send', CAST(N'2024-12-15T16:17:29.6725512' AS DateTime2), NULL, N'REQ20241215NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1164, 17, N'ComponentReplacementTicket', N'Bạn có ticket thay sửa bộ phận cần được thanh toán', N'Bộ phận  cần được thay/sửa với tổng giá tiền là 5111000', N'Send', CAST(N'2024-12-15T16:17:29.8140810' AS DateTime2), NULL, N'CRT20241216NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1165, 7, N'ComponentReplacementTicket', N'Một ticket thay thế bộ phận máy của bạn đã được khách thanh toán', N'Ticket thay bộ phận Đá mài của máy MM-01-2024-00005 đã được thanh toán', N'Send', CAST(N'2024-12-15T16:18:15.7370057' AS DateTime2), NULL, N'CRT20241216NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1166, 17, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241215NO001 của máy MM-01-2024-00005 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-15T16:19:20.1192810' AS DateTime2), NULL, N'REQ20241215NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1167, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy thuê theo yêu cầu REQ20241215NO001 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-15T16:19:20.1727552' AS DateTime2), NULL, N'5', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1168, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240805NO0002', N'Send', CAST(N'2024-12-16T09:04:58.6420467' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1169, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240805NO0002', N'Send', CAST(N'2024-12-16T09:04:58.7327778' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1170, 19, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO001 của máy MK-01-2024-00003 đã được đổi thành [Đã giao nhiệm vụ]', N'Send', CAST(N'2024-12-16T09:07:54.5088964' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1171, 11, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ The Coffee House, 17 Út Tịch, Phường 4, Tân Bình, Hồ Chí Minh, Tân Bình vào ngày 17/12/2024', N'Send', CAST(N'2024-12-16T09:07:54.5354360' AS DateTime2), NULL, N'6', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1172, 19, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO001 của máy MK-01-2024-00003 đã được đổi thành [Đang xử lý]', N'Send', CAST(N'2024-12-16T09:09:40.0748503' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1173, 19, N'ComponentReplacementTicket', N'Bạn có ticket thay sửa bộ phận cần được thanh toán', N'Bộ phận  cần được thay/sửa với tổng giá tiền là 15111000', N'Send', CAST(N'2024-12-16T09:09:40.1759661' AS DateTime2), NULL, N'CRT20241021NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1174, 11, N'ComponentReplacementTicket', N'Một ticket thay thế bộ phận máy của bạn đã được khách thanh toán', N'Ticket thay bộ phận Bơm làm mát của máy MK-01-2024-00003 đã được thanh toán', N'Send', CAST(N'2024-12-16T09:10:42.5314898' AS DateTime2), NULL, N'CRT20241021NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1175, 19, N'ComponentReplacementTicket', N'Bạn có ticket thay sửa bộ phận cần được thanh toán', N'Bộ phận  cần được thay/sửa với tổng giá tiền là 2111000', N'Send', CAST(N'2024-12-16T09:11:00.6976315' AS DateTime2), NULL, N'CRT20241021NO002', N'ComponentReplacementTicketId')
GO
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1176, 11, N'ComponentReplacementTicket', N'Một ticket thay thế bộ phận máy của bạn đã được khách thanh toán', N'Ticket thay bộ phận Hệ thống bôi trơn của máy MK-01-2024-00003 đã được thanh toán', N'Send', CAST(N'2024-12-16T09:12:03.7573999' AS DateTime2), NULL, N'CRT20241021NO002', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1177, 19, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO001 của máy MK-01-2024-00003 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-16T09:12:14.9189871' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1178, 5, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy thuê theo yêu cầu REQ20241216NO001 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-16T09:12:14.9631435' AS DateTime2), NULL, N'6', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1179, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240915NO0003', N'Send', CAST(N'2024-12-16T15:01:07.8209199' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1180, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240915NO0003', N'Send', CAST(N'2024-12-16T15:01:07.8503889' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1181, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO001 của máy MP-02-2024-00005 đã được đổi thành [Đã giao nhiệm vụ]', N'Send', CAST(N'2024-12-16T15:02:00.4327418' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1182, 11, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 17/12/2024', N'Send', CAST(N'2024-12-16T15:02:00.5350145' AS DateTime2), NULL, N'6', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1183, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO001 của máy MP-02-2024-00005 đã được đổi thành [Đang xử lý]', N'Send', CAST(N'2024-12-16T15:02:16.2745944' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1184, 9, N'ComponentReplacementTicket', N'Bạn có ticket thay sửa bộ phận cần được thanh toán', N'Bộ phận  cần được thay/sửa với tổng giá tiền là 50111000', N'Send', CAST(N'2024-12-16T15:02:16.3093354' AS DateTime2), NULL, N'CRT20241021NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1185, 11, N'ComponentReplacementTicket', N'Một ticket thay thế bộ phận máy của bạn đã được khách thanh toán', N'Ticket thay bộ phận Bộ thay dao tự động (ATC) của máy MP-02-2024-00005 đã được thanh toán', N'Send', CAST(N'2024-12-16T15:03:00.2352606' AS DateTime2), NULL, N'CRT20241021NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1186, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO001 của máy MP-02-2024-00005 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-16T15:03:24.2664477' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1187, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy thuê theo yêu cầu REQ20241216NO001 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-16T15:03:24.2841753' AS DateTime2), NULL, N'6', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1188, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241209NO0001', N'Send', CAST(N'2024-12-16T15:09:30.3604018' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1189, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241209NO0001', N'Send', CAST(N'2024-12-16T15:09:30.3678085' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1190, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO001 của máy MD-01-2024-00015 đã được đổi thành [Đã giao nhiệm vụ]', N'Send', CAST(N'2024-12-16T15:10:44.5724987' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1191, 11, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 17/12/2024', N'Send', CAST(N'2024-12-16T15:10:44.5801978' AS DateTime2), NULL, N'7', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1192, 9, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO001 của máy MD-01-2024-00015 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-16T15:10:53.3685183' AS DateTime2), NULL, N'REQ20241020NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1193, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy thuê theo yêu cầu REQ20241216NO001 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-16T15:10:53.3841329' AS DateTime2), NULL, N'7', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1194, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241205NO0002', N'Send', CAST(N'2024-12-16T15:15:04.0305506' AS DateTime2), NULL, N'REQ20241216NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1195, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241205NO0002', N'Send', CAST(N'2024-12-16T15:15:04.0520728' AS DateTime2), NULL, N'REQ20241216NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1196, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240612NO0001', N'Send', CAST(N'2024-12-16T15:15:18.1538092' AS DateTime2), NULL, N'REQ20240910NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1197, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240612NO0001', N'Send', CAST(N'2024-12-16T15:15:18.1705362' AS DateTime2), NULL, N'REQ20240910NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1198, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241205NO0001', N'Send', CAST(N'2024-12-16T15:18:23.3961106' AS DateTime2), NULL, N'REQ20241216NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1199, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20241205NO0001', N'Send', CAST(N'2024-12-16T15:18:23.4262739' AS DateTime2), NULL, N'REQ20241216NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1200, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240612NO0001', N'Send', CAST(N'2024-12-16T15:18:23.4826619' AS DateTime2), NULL, N'REQ20240910NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1201, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy', N'Có một yêu cầu kiểm tra máy của hợp đồng CON20240612NO0001', N'Send', CAST(N'2024-12-16T15:18:23.4930755' AS DateTime2), NULL, N'REQ20240910NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1202, 2, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy đã được khách hủy', N'Yêu cầu kiểm tra máy của hợp đồng CON20241205NO0001 tại Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được khách hủy', N'Send', CAST(N'2024-12-16T15:18:38.6744983' AS DateTime2), NULL, N'REQ20241216NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1203, 5, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy đã được khách hủy', N'Yêu cầu kiểm tra máy của hợp đồng CON20241205NO0001 tại Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh đã được khách hủy', N'Send', CAST(N'2024-12-16T15:18:38.6799786' AS DateTime2), NULL, N'REQ20241216NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1204, 24, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO002 của máy MD-01-2024-00004 đã được đổi thành [Đã giao nhiệm vụ]', N'Send', CAST(N'2024-12-16T15:20:12.9627272' AS DateTime2), NULL, N'REQ20240910NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1205, 11, N'Task', N'Bạn có thêm một nhiệm vụ kiểm tra máy mới', N'Kiểm tra máy tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh vào ngày 17/12/2024', N'Send', CAST(N'2024-12-16T15:20:12.9755570' AS DateTime2), NULL, N'8', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1206, 24, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO002 của máy MD-01-2024-00004 đã được đổi thành [Đang xử lý]', N'Send', CAST(N'2024-12-16T15:20:24.8345063' AS DateTime2), NULL, N'REQ20240910NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1207, 24, N'ComponentReplacementTicket', N'Bạn có ticket thay sửa bộ phận cần được thanh toán', N'Bộ phận  cần được thay/sửa với tổng giá tiền là 15111000', N'Send', CAST(N'2024-12-16T15:20:24.8719427' AS DateTime2), NULL, N'CRT20240911NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1208, 11, N'ComponentReplacementTicket', N'Một ticket thay thế bộ phận máy của bạn đã được khách thanh toán', N'Ticket thay bộ phận Tủ điện và dây dẫn của máy MD-01-2024-00004 đã được thanh toán', N'Send', CAST(N'2024-12-16T15:21:25.9422149' AS DateTime2), NULL, N'CRT20240911NO001', N'ComponentReplacementTicketId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1209, 24, N'MachineCheckRequest', N'Yêu cầu kiểm tra máy của bạn đã được thay đổi trạng thái', N'Yêu cầu số REQ20241216NO002 của máy MD-01-2024-00004 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-16T15:21:43.2466751' AS DateTime2), NULL, N'REQ20240910NO001', N'MachineCheckRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1210, 2, N'Task', N'Cập nhật trạng thái công việc', N'Trạng thái công việc của Kiểm tra máy thuê theo yêu cầu REQ20241216NO002 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-16T15:21:43.2577249' AS DateTime2), NULL, N'8', N'MachineTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1211, 2, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241218NO001.', N'Send', CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2), NULL, N'REH20240705NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1212, 5, N'RentingRequest', N'Khách hàng đã ký tất cả hợp đồng', N'Khách hàng Trịnh Trần Tuấn Phương đã ký tất cả hợp đồng cho yêu cầu thuê REH20241218NO001.', N'Send', CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2), NULL, N'REH20240705NO001', N'RentingRequestId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1213, 20, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 vào ngày 19/12/2024', N'Send', CAST(N'2024-12-18T14:57:40.1281929' AS DateTime2), NULL, N'1014', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1214, 5, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-18T14:59:31.1336322' AS DateTime2), NULL, N'1014', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1215, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Đang giao]', N'Send', CAST(N'2024-12-18T14:59:31.1490017' AS DateTime2), NULL, N'1014', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1216, 5, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-18T15:00:06.0111579' AS DateTime2), NULL, N'1014', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1217, 9, N'DeliveryTask', N'Cập nhật trạng thái giao hàng', N'Trạng thái giao hàng tại địa chỉ 70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh, Quận 4 đã được đổi thành [Hoàn thành]', N'Send', CAST(N'2024-12-18T15:00:06.0272576' AS DateTime2), NULL, N'1014', N'DeliveryTaskId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1218, 2, N'Contract', N'Khách hàng đã gia hạn hợp đồng', N'Khách hàng đã gia hạn hợp đồng CON20240705NO0001.', N'Send', CAST(N'2024-12-18T15:14:19.6472590' AS DateTime2), NULL, N'CON20240705NO0001', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1219, 5, N'Contract', N'Khách hàng đã gia hạn hợp đồng', N'Khách hàng đã gia hạn hợp đồng CON20240705NO0001.', N'Read', CAST(N'2024-12-18T15:14:19.6509370' AS DateTime2), CAST(N'2024-12-18T19:59:44.8970431' AS DateTime2), N'CON20240705NO0001', N'ContractId')
INSERT [dbo].[Notification] ([NotificationId], [AccountReceiveId], [NotificationType], [NotificationTitle], [MessageNotification], [Status], [DateCreate], [DateRead], [DetailId], [DetailIdName]) VALUES (1220, 4, N'DeliveryTask', N'Bạn có thêm một nhiệm vụ giao hàng mới', N'Giao hàng tại địa chỉ Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh, Bình Chánh vào ngày 20/12/2024', N'Send', CAST(N'2024-12-20T11:40:08.7245730' AS DateTime2), NULL, N'1015', N'DeliveryTaskId')
SET IDENTITY_INSERT [dbo].[Notification] OFF
GO
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20240612NO001', 24, CAST(N'2024-06-12T08:00:00.0000000' AS DateTime2), 285480000, 720000000, 800000, 1492200, 390000, 1007382200, 0, N'', N'Shipped', N'1234234', N'Ngân hàng Nông nghiệp và Phát triển Nông thôn Việt Nam (VBA)', N'Khang', 24.87, 30000)
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20240705NO001', 9, CAST(N'2024-07-05T08:00:00.0000000' AS DateTime2), 102480000, 360000000, 700000, 665100, 210000, 463635100, 1, N'', N'Shipped', N'1234123', N'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam (BIDV)', N'Nguyên', 22.17, 30000)
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20240714NO001', 9, CAST(N'2024-07-14T08:00:00.0000000' AS DateTime2), 78080000, 480000000, 800000, 1330200, 160000, 560050200, 1, N'', N'Shipped', N'23234432', N'Ngân hàng TMCP Công thương Việt Nam (ICB)', N'Tuấn Phương', 22.17, 30000)
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20240805NO001', 19, CAST(N'2024-08-05T08:00:00.0000000' AS DateTime2), 248880000, 540000000, 1400000, 1075800, 0, 791355800, 1, N'', N'Shipped', N'758462364', N'Ngân hàng số Timo by Ban Viet Bank (Timo by Ban Viet Bank) (TIMO)', N'Hoang', 17.93, 30000)
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20240915NO001', 9, CAST(N'2024-09-15T15:00:00.0000000' AS DateTime2), 198620000, 735000000, 2100000, 1995300, 455000, 937260300, 1, N'', N'Shipped', N'42345234', N'Ngân hàng TMCP Đầu tư và Phát triển Việt Nam (BIDV)', N'Tuấn', 22.17, 30000)
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20241011NO001', 8, CAST(N'2024-10-11T08:00:00.0000000' AS DateTime2), 109200000, 360000000, 400000, 760500, 0, 470360500, 1, N'', N'Canceled', N'3132131231312', N'Ngân hàng TMCP Ngoại Thương Việt Nam (VCB)', N'Khoa', 25.35, 30000)
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20241013NO001', 8, CAST(N'2024-10-13T08:00:00.0000000' AS DateTime2), 109200000, 360000000, 1400000, 1521000, 0, 472121000, 1, N'', N'Shipped', N'34823475', N'Ngân hàng TMCP Ngoại Thương Việt Nam (VCB)', N'Khoa Yo', 25.35, 30000)
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20241118NO001', 17, CAST(N'2024-11-18T08:00:00.0000000' AS DateTime2), 195200000, 480000000, 1400000, 1539600, 0, 678139600, 1, N'', N'Shipped', N'34542341', N'Ngân hàng Nông nghiệp và Phát triển Nông thôn Việt Nam (VBA)', N'Nguyen Hoang Nam', 25.66, 30000)
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20241205NO001', 24, CAST(N'2024-12-05T11:56:58.7337715' AS DateTime2), 258400000, 510000000, 800000, 1492200, 425000, 770267200, 1, N'', N'Shipped', N'20122024', N'Ngân hàng TMCP Việt Nam Thương Tín (VIETBANK)', N'LE TUAN KHANG', 24.87, 30000)
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20241209NO001', 9, CAST(N'2024-12-09T08:15:59.0697763' AS DateTime2), 153720000, 360000000, 400000, 665100, 210000, 514575100, 1, N'', N'Shipped', N'123456789', N'Ngân hàng Nông nghiệp và Phát triển Nông thôn Việt Nam (VBA)', N'PHẠM QUANG HUY', 22.17, 30000)
INSERT [dbo].[RentingRequest] ([RentingRequestId], [AccountOrderId], [DateCreate], [TotalRentPrice], [TotalDepositPrice], [TotalServicePrice], [ShippingPrice], [DiscountPrice], [TotalAmount], [IsOnetimePayment], [Note], [Status], [AccountNumber], [BeneficiaryBank], [BeneficiaryName], [ShippingDistance], [ShippingPricePerKm]) VALUES (N'REH20241213NO001', 24, CAST(N'2024-12-13T21:03:59.6483024' AS DateTime2), 156160000, 480000000, 800000, 1492200, 320000, 638132200, 0, N'', N'Signed', N'2345234', N'Ngân hàng TMCP Công thương Việt Nam (ICB)', N'Khang', 24.87, 30000)
GO
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20240612NO001', N'Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh', N'Bình Chánh', N'Hồ Chí Minh', N'10.814768081000068,106.57723605300004')
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20240705NO001', N'70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh', N'Quận 4', N'Hồ Chí Minh', N'10.756061014000068,106.70365711300008')
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20240714NO001', N'70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh', N'Quận 4', N'Hồ Chí Minh', N'10.756061014000068,106.70365711300008')
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20240805NO001', N'The Coffee House, 17 Út Tịch, Phường 4, Tân Bình, Hồ Chí Minh', N'Tân Bình', N'Hồ Chí Minh', N'10.796150397000076,106.65878023500005')
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20240915NO001', N'70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh', N'Quận 4', N'Hồ Chí Minh', N'10.756061014000068,106.70365711300008')
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20241011NO001', N'Bến Thành Mart, 683 Âu Cơ, Tân Thành, Tân Phú, Hồ Chí Minh', N'Tân Phú', N'Hồ Chí Minh', N'10.788421663000065,106.64067861800004')
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20241013NO001', N'Bến Thành Mart, 683 Âu Cơ, Tân Thành, Tân Phú, Hồ Chí Minh', N'Tân Phú', N'Hồ Chí Minh', N'10.788421663000065,106.64067861800004')
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20241118NO001', N'AEON TÂN PHÚ, Bờ Bao Tân Thắng, Celadon City, Sơn Kỳ, Tân Phú, Hồ Chí Minh', N'Tân Phú', N'Hồ Chí Minh', N'10.8011622,106.6173945')
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20241205NO001', N'Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh', N'Bình Chánh', N'Hồ Chí Minh', N'10.814768081000068,106.57723605300004')
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20241209NO001', N'70 Vĩnh Hội, Phường 4, Quận 4, Hồ Chí Minh', N'Quận 4', N'Hồ Chí Minh', N'10.756061014000068,106.70365711300008')
INSERT [dbo].[RentingRequestAddress] ([RentingRequestId], [AddressBody], [District], [City], [Coordinates]) VALUES (N'REH20241213NO001', N'Trường Tiểu học Vĩnh Lộc A, F7/32 Quách Điêu, Vĩnh Lộc A, Bình Chánh, Hồ Chí Minh', N'Bình Chánh', N'Hồ Chí Minh', N'10.814768081000068,106.57723605300004')
GO
SET IDENTITY_INSERT [dbo].[RentingService] ON 

INSERT [dbo].[RentingService] ([RentingServiceId], [RentingServiceName], [Description], [Price], [IsOptional]) VALUES (1, N'Lắp đặt máy móc', N'Sau khi giao máy đến địa điểm sẽ tiến hành lắp đặt và kiểm tra, vận hành thử để đảm bảo hoạt động đúng chức năng và hiệu quả.', 100000, 0)
INSERT [dbo].[RentingService] ([RentingServiceId], [RentingServiceName], [Description], [Price], [IsOptional]) VALUES (2, N'Vệ sinh máy móc', N'Giúp máy luôn trong tình trạng sạch sẽ, bền bỉ và hoạt động hiệu quả.', 100000, 0)
INSERT [dbo].[RentingService] ([RentingServiceId], [RentingServiceName], [Description], [Price], [IsOptional]) VALUES (3, N'Đào tạo và hướng dẫn sử dụng', N'Hướng dẫn sử dụng máy móc, bao gồm các tài liệu hướng dẫn, video hướng dẫn hoặc huấn luyện trực tiếp cho người sử dụng tại công trường', 200000, 1)
INSERT [dbo].[RentingService] ([RentingServiceId], [RentingServiceName], [Description], [Price], [IsOptional]) VALUES (4, N'Bảo hiểm máy móc', N'Bảo hiểm cho máy móc thuê để bảo vệ thiết bị khỏi các sự cố không mong muốn như hư hỏng, cháy nổ, tai nạn trong quá trình sử dụng.', 200000, 0)
INSERT [dbo].[RentingService] ([RentingServiceId], [RentingServiceName], [Description], [Price], [IsOptional]) VALUES (5, N'Bảo vệ máy móc', N'Biện pháp bảo vệ máy móc (ví dụ: khóa an toàn, hệ thống giám sát) trong trường hợp máy móc được sử dụng ngoài trời hoặc ở các địa điểm có nguy cơ cao.', 100000, 1)
SET IDENTITY_INSERT [dbo].[RentingService] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Manager')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'TechnicalStaff')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'WebsiteStaff')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceRentingRequest] ON 

INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (13, 1, N'REH20241205NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (14, 2, N'REH20241205NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (15, 4, N'REH20241205NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (23, 1, N'REH20241209NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (24, 2, N'REH20241209NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (25, 4, N'REH20241209NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1034, 1, N'REH20241011NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1035, 2, N'REH20241011NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1036, 4, N'REH20241011NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1043, 1, N'REH20240612NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1044, 2, N'REH20240612NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1045, 4, N'REH20240612NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1046, 1, N'REH20241013NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1047, 2, N'REH20241013NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1048, 4, N'REH20241013NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1049, 3, N'REH20241013NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1050, 5, N'REH20241013NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1051, 1, N'REH20241118NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1052, 2, N'REH20241118NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1053, 4, N'REH20241118NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1054, 3, N'REH20241118NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1055, 5, N'REH20241118NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1056, 1, N'REH20240805NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1057, 2, N'REH20240805NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1058, 4, N'REH20240805NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1059, 3, N'REH20240805NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1060, 5, N'REH20240805NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1061, 1, N'REH20241213NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1062, 2, N'REH20241213NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1063, 4, N'REH20241213NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1064, 1, N'REH20240714NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1065, 2, N'REH20240714NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1066, 4, N'REH20240714NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1067, 1, N'REH20240915NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1068, 2, N'REH20240915NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1069, 4, N'REH20240915NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1070, 3, N'REH20240915NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1071, 5, N'REH20240915NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1072, 1, N'REH20240705NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1073, 2, N'REH20240705NO001', 100000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1074, 4, N'REH20240705NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1075, 3, N'REH20240705NO001', 200000)
INSERT [dbo].[ServiceRentingRequest] ([ServiceRentingRequestId], [RentingServiceId], [RentingRequestId], [ServicePrice]) VALUES (1076, 5, N'REH20240705NO001', 100000)
SET IDENTITY_INSERT [dbo].[ServiceRentingRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[Term] ON 

INSERT [dbo].[Term] ([TermId], [Type], [Title], [Content]) VALUES (1, N'Contract', N'Mục đích sử dụng máy móc', N'<p>Máy móc cơ khí chỉ được sử dụng cho các công việc chuyên môn theo yêu cầu và chỉ được vận hành bởi những người có đầy đủ trình độ chuyên môn và chứng chỉ liên quan.</p>')
INSERT [dbo].[Term] ([TermId], [Type], [Title], [Content]) VALUES (2, N'Machine', N'Bảo dưỡng máy móc', N'<ul><li>Người sử dụng có trách nhiệm kiểm tra và thực hiện các biện pháp bảo dưỡng định kỳ theo yêu cầu kỹ thuật của nhà sản xuất.</li><li>Mọi vấn đề về hư hỏng hoặc trục trặc phải được báo cáo kịp thời cho bộ phận bảo trì để khắc phục, tránh ảnh hưởng đến quá trình sản xuất.</li></ul>')
INSERT [dbo].[Term] ([TermId], [Type], [Title], [Content]) VALUES (5, N'Machine', N'Điều kiện thuê và hoàn trả máy móc', N'<ul><li>Người thuê phải ký hợp đồng trước khi nhận máy.</li><li>Thời gian thuê được tính từ khi bàn giao máy đến khi hoàn trả đầy đủ theo thỏa thuận.</li><li>Máy móc phải được hoàn trả trong tình trạng ban đầu, trừ hao mòn hợp lý.</li></ul><p><br></p>')
INSERT [dbo].[Term] ([TermId], [Type], [Title], [Content]) VALUES (6, N'Machine', N'Quyền và trách nhiệm của người thuê máy', N'<ul><li>Người thuê máy phải kiểm tra tình trạng máy móc trước khi nhận bàn giao.</li><li>Chỉ sử dụng máy móc cho mục đích được thỏa thuận trong hợp đồng.</li><li>Không được tự ý sửa chữa hoặc thay đổi cấu hình máy móc mà không có sự đồng ý từ bên cung cấp.</li><li>Chịu trách nhiệm bảo quản và bồi thường thiệt hại (nếu có) trong thời gian sử dụng máy móc.</li></ul>')
INSERT [dbo].[Term] ([TermId], [Type], [Title], [Content]) VALUES (7, N'Contract', N'Đăng ký và tài khoản', N'<ul><li>Mỗi khách hàng cần đăng ký tài khoản để sử dụng dịch vụ.</li><li>Thông tin đăng ký phải chính xác và đầy đủ. Khách hàng chịu trách nhiệm bảo mật thông tin tài khoản và thông báo ngay cho chúng tôi nếu phát hiện tài khoản bị sử dụng trái phép.</li></ul>')
INSERT [dbo].[Term] ([TermId], [Type], [Title], [Content]) VALUES (8, N'Contract', N'Điều kiện thuê máy', N'<ul><li>Khách hàng phải cung cấp các giấy tờ cần thiết như chứng minh nhân dân, giấy phép kinh doanh (nếu là tổ chức).</li><li>Máy móc được thuê phải được sử dụng đúng mục đích và tuân thủ các quy định về an toàn lao động.</li></ul>')
INSERT [dbo].[Term] ([TermId], [Type], [Title], [Content]) VALUES (9, N'Contract', N'Quyền và nghĩa vụ của khách hàng', N'<p><strong>Quyền:</strong></p><ul><li>Khách hàng được quyền kiểm tra tình trạng máy móc trước khi nhận.</li><li>Được hỗ trợ kỹ thuật trong suốt thời gian thuê.</li></ul><p><strong>Nghĩa vụ:</strong></p><ul><li>Thanh toán đầy đủ và đúng hạn các khoản phí theo hợp đồng.</li><li>Bảo quản máy móc và hoàn trả trong tình trạng như ban đầu (trừ hao mòn tự nhiên).</li></ul><p><br></p>')
SET IDENTITY_INSERT [dbo].[Term] OFF
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:deleted', 2, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:deleted:2024-12-20', 2, CAST(N'2025-01-20T03:29:23.627' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:deleted:2024-12-20-03', 2, CAST(N'2024-12-21T03:29:23.627' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 31, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-05', 3, CAST(N'2025-01-05T14:18:53.417' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-06', 4, CAST(N'2025-01-06T15:06:34.557' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-10', 2, CAST(N'2025-01-10T01:26:11.673' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-11', 4, CAST(N'2025-01-11T15:45:31.597' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-12', 1, CAST(N'2025-01-12T01:07:11.747' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-13', 2, CAST(N'2025-01-13T03:29:38.423' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-15', 5, CAST(N'2025-01-15T08:05:46.457' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-16', 1, CAST(N'2025-01-16T08:18:58.250' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-19', 5, CAST(N'2025-01-19T10:09:37.973' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-19-10', 5, CAST(N'2024-12-20T10:09:37.973' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-20', 4, CAST(N'2025-01-20T03:26:41.260' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2024-12-20-03', 4, CAST(N'2024-12-21T03:26:41.260' AS DateTime))
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (3, 3, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241204NO0003\""]', CAST(N'2024-12-04T14:17:32.647' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (6, 9, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241205NO0001\""]', CAST(N'2024-12-05T03:03:44.000' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (7, 10, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241205NO0002\""]', CAST(N'2024-12-05T03:03:44.047' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (13, 34, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241204NO0004\""]', CAST(N'2024-12-09T01:43:29.553' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10014, 10035, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241210NO0003\""]', CAST(N'2024-12-10T15:51:21.100' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10015, 10036, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241210NO0004\""]', CAST(N'2024-12-10T15:51:21.183' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10018, 10042, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241205NO0001\""]', CAST(N'2024-12-11T06:59:58.587' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10019, 10043, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241205NO0002\""]', CAST(N'2024-12-11T06:59:58.780' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10020, 10044, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241209NO0001\""]', CAST(N'2024-12-11T12:56:13.493' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10023, 10149, N'Succeeded', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20240612NO0001\""]', CAST(N'2024-12-12T08:35:52.293' AS DateTime), CAST(N'2024-12-21T03:25:56.333' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10024, 10131, N'Succeeded', N'{"t":"Service.BackgroundImpl, Service","m":"ProcessOverdueContractPaymentAsync","p":["System.Int32"]}', N'["1073"]', CAST(N'2024-12-12T08:35:52.460' AS DateTime), CAST(N'2024-12-20T10:09:37.807' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10025, 10148, N'Succeeded', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20240612NO0001\""]', CAST(N'2024-12-12T08:35:52.467' AS DateTime), CAST(N'2024-12-21T03:25:56.323' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10026, 10133, N'Succeeded', N'{"t":"Service.BackgroundImpl, Service","m":"ProcessOverdueContractPaymentAsync","p":["System.Int32"]}', N'["1075"]', CAST(N'2024-12-12T08:35:52.473' AS DateTime), CAST(N'2024-12-20T10:09:37.837' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10027, 10152, N'Succeeded', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20240612NO0002\""]', CAST(N'2024-12-12T08:35:52.477' AS DateTime), CAST(N'2024-12-21T03:26:01.313' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10028, 10135, N'Succeeded', N'{"t":"Service.BackgroundImpl, Service","m":"ProcessOverdueContractPaymentAsync","p":["System.Int32"]}', N'["1082"]', CAST(N'2024-12-12T08:35:52.480' AS DateTime), CAST(N'2024-12-20T10:09:37.857' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10029, 10155, N'Succeeded', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20240612NO0002\""]', CAST(N'2024-12-12T08:35:52.483' AS DateTime), CAST(N'2024-12-21T03:26:41.260' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10030, 10137, N'Succeeded', N'{"t":"Service.BackgroundImpl, Service","m":"ProcessOverdueContractPaymentAsync","p":["System.Int32"]}', N'["1084"]', CAST(N'2024-12-12T08:35:52.487' AS DateTime), CAST(N'2024-12-20T10:09:37.887' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10031, 10156, N'Deleted', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20240612NO0001\""]', CAST(N'2024-12-12T08:42:08.840' AS DateTime), CAST(N'2024-12-21T03:29:15.343' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10032, 10157, N'Deleted', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20240612NO0002\""]', CAST(N'2024-12-12T08:42:08.907' AS DateTime), CAST(N'2024-12-21T03:29:23.630' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10034, 10076, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241213NO0001\""]', CAST(N'2024-12-13T12:45:13.310' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10035, 10077, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241213NO0002\""]', CAST(N'2024-12-13T12:45:13.383' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10037, 10079, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241213NO0001\""]', CAST(N'2024-12-13T13:19:13.713' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10038, 10080, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241213NO0002\""]', CAST(N'2024-12-13T13:19:13.777' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10040, 10082, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241213NO0001\""]', CAST(N'2024-12-13T13:46:05.850' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10041, 10083, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241213NO0002\""]', CAST(N'2024-12-13T13:46:05.930' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10043, 10085, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241213NO0001\""]', CAST(N'2024-12-13T14:04:45.247' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10044, 10086, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"ProcessOverdueContractPaymentAsync","p":["System.Int32"]}', N'["1114"]', CAST(N'2024-12-13T14:04:45.257' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10045, 10087, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241213NO0001\""]', CAST(N'2024-12-13T14:04:45.267' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10046, 10088, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"ProcessOverdueContractPaymentAsync","p":["System.Int32"]}', N'["1116"]', CAST(N'2024-12-13T14:04:45.273' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10047, 10089, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241213NO0002\""]', CAST(N'2024-12-13T14:04:45.280' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10048, 10090, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"ProcessOverdueContractPaymentAsync","p":["System.Int32"]}', N'["1121"]', CAST(N'2024-12-13T14:04:45.287' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10049, 10091, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241213NO0002\""]', CAST(N'2024-12-13T14:04:45.297' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10050, 10092, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"ProcessOverdueContractPaymentAsync","p":["System.Int32"]}', N'["1123"]', CAST(N'2024-12-13T14:04:45.300' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10052, 10094, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241214NO0001\""]', CAST(N'2024-12-14T02:18:00.487' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10053, 10095, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241214NO0002\""]', CAST(N'2024-12-14T02:18:00.613' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10055, 10116, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241215NO0001\""]', CAST(N'2024-12-15T08:25:40.843' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10056, 10117, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241215NO0002\""]', CAST(N'2024-12-15T08:25:41.007' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10057, 10118, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241215NO0003\""]', CAST(N'2024-12-15T08:25:41.253' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10058, 10139, N'Succeeded', N'{"t":"Service.BackgroundImpl, Service","m":"CancelRentingRequestAsync","p":["System.String"]}', N'["\"REH20241218NO001\""]', CAST(N'2024-12-18T07:55:30.843' AS DateTime), CAST(N'2024-12-20T10:09:37.973' AS DateTime))
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10059, 10123, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"CompleteContractOnTimeAsync","p":["System.String"]}', N'["\"CON20241218NO0001\""]', CAST(N'2024-12-18T08:00:05.967' AS DateTime), NULL)
INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10060, 10124, N'Scheduled', N'{"t":"Service.BackgroundImpl, Service","m":"ProcessExtendContracAsync","p":["System.String"]}', N'["\"CON20241218NO0001\""]', CAST(N'2024-12-18T08:14:19.637' AS DateTime), NULL)
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (3, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (6, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (7, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (13, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10014, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10015, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10018, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10019, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10020, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10023, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10024, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10025, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10026, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10027, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10028, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10029, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10029, N'RetryCount', N'1')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10030, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10031, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10032, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10034, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10035, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10037, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10038, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10040, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10041, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10043, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10044, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10045, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10046, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10047, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10048, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10049, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10050, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10052, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10053, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10055, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10056, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10057, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10058, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10059, N'CurrentCulture', N'""')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10060, N'CurrentCulture', N'""')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'khang:1:56b990dd-bf05-4804-a1ee-7bc0aa9b65b0', N'{"WorkerCount":10,"Queues":["default"],"StartedAt":"2024-12-20T04:35:42.8064363Z"}', CAST(N'2024-12-20T04:44:12.903' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1747501200, N'10014', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1747501200, N'10015', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1747069200, N'10018', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1747069200, N'10019', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1750093200, N'10020', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1742749200, N'10034', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1742749200, N'10035', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1756227600, N'10037', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1756227600, N'10038', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1756054800, N'10040', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1756054800, N'10041', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1734886800, N'10043', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1734800400, N'10044', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1734886800, N'10045', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1734800400, N'10046', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1734886800, N'10047', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1734800400, N'10048', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1734886800, N'10049', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1734800400, N'10050', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1745514000, N'10052', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1745514000, N'10053', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1745946000, N'10055', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1745946000, N'10056', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1745946000, N'10057', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1745600400, N'10059', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1735146000, N'10060', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1746982800, N'13', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1744736400, N'3', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1741798800, N'6', NULL)
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'schedule', 1741798800, N'7', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (3, 3, N'Scheduled', NULL, CAST(N'2024-12-04T14:17:32.653' AS DateTime), N'{"EnqueueAt":"1744736400002","ScheduledAt":"1733321852646"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (9, 6, N'Scheduled', NULL, CAST(N'2024-12-05T03:03:44.000' AS DateTime), N'{"EnqueueAt":"1741798800001","ScheduledAt":"1733367823998"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10, 7, N'Scheduled', NULL, CAST(N'2024-12-05T03:03:44.050' AS DateTime), N'{"EnqueueAt":"1741798800000","ScheduledAt":"1733367824047"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (34, 13, N'Scheduled', NULL, CAST(N'2024-12-09T01:43:29.560' AS DateTime), N'{"EnqueueAt":"1746982800005","ScheduledAt":"1733708609547"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10035, 10014, N'Scheduled', NULL, CAST(N'2024-12-10T15:51:21.103' AS DateTime), N'{"EnqueueAt":"1747501200002","ScheduledAt":"1733845881100"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10036, 10015, N'Scheduled', NULL, CAST(N'2024-12-10T15:51:21.187' AS DateTime), N'{"EnqueueAt":"1747501200000","ScheduledAt":"1733845881184"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10042, 10018, N'Scheduled', NULL, CAST(N'2024-12-11T06:59:58.633' AS DateTime), N'{"EnqueueAt":"1747069200012","ScheduledAt":"1733900398551"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10043, 10019, N'Scheduled', NULL, CAST(N'2024-12-11T06:59:58.783' AS DateTime), N'{"EnqueueAt":"1747069200000","ScheduledAt":"1733900398779"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10044, 10020, N'Scheduled', NULL, CAST(N'2024-12-11T12:56:13.537' AS DateTime), N'{"EnqueueAt":"1750093200005","ScheduledAt":"1733921773461"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10059, 10023, N'Scheduled', NULL, CAST(N'2024-12-12T08:35:52.387' AS DateTime), N'{"EnqueueAt":"1734627600007","ScheduledAt":"1733992552245"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10140, 10023, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-12-20T03:25:56.133' AS DateTime), N'{"EnqueuedAt":"1734665156110","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10143, 10023, N'Processing', NULL, CAST(N'2024-12-20T03:25:56.177' AS DateTime), N'{"StartedAt":"1734665156174","ServerId":"khang:1:47d8abd0-a6a6-4d6d-b5b4-5366164058da","WorkerId":"976627d6-6906-4130-9b94-09127e3adeeb"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10149, 10023, N'Succeeded', NULL, CAST(N'2024-12-20T03:25:56.333' AS DateTime), N'{"SucceededAt":"1734665156328","PerformanceDuration":"143","Latency":"672603892"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10060, 10024, N'Scheduled', NULL, CAST(N'2024-12-12T08:35:52.460' AS DateTime), N'{"EnqueueAt":"1734541200001","ScheduledAt":"1733992552456"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10125, 10024, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-12-19T10:09:37.737' AS DateTime), N'{"EnqueuedAt":"1734602977720","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10128, 10024, N'Processing', NULL, CAST(N'2024-12-19T10:09:37.783' AS DateTime), N'{"StartedAt":"1734602977779","ServerId":"khang:1:971d5266-c0f0-44ec-9e78-674db485959a","WorkerId":"7a3f9949-4061-4a61-b595-cb83f013f5c6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10131, 10024, N'Succeeded', NULL, CAST(N'2024-12-19T10:09:37.807' AS DateTime), N'{"SucceededAt":"1734602977805","PerformanceDuration":"16","Latency":"610425329"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10061, 10025, N'Scheduled', NULL, CAST(N'2024-12-12T08:35:52.470' AS DateTime), N'{"EnqueueAt":"1734627600000","ScheduledAt":"1733992552465"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10141, 10025, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-12-20T03:25:56.150' AS DateTime), N'{"EnqueuedAt":"1734665156148","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10147, 10025, N'Processing', NULL, CAST(N'2024-12-20T03:25:56.243' AS DateTime), N'{"StartedAt":"1734665156204","ServerId":"khang:1:47d8abd0-a6a6-4d6d-b5b4-5366164058da","WorkerId":"464e908f-3640-40dc-bc46-63a7c23987f4"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10148, 10025, N'Succeeded', NULL, CAST(N'2024-12-20T03:25:56.323' AS DateTime), N'{"SucceededAt":"1734665156322","PerformanceDuration":"73","Latency":"672603782"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10062, 10026, N'Scheduled', NULL, CAST(N'2024-12-12T08:35:52.473' AS DateTime), N'{"EnqueueAt":"1734541200000","ScheduledAt":"1733992552471"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10126, 10026, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-12-19T10:09:37.763' AS DateTime), N'{"EnqueuedAt":"1734602977760","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10132, 10026, N'Processing', NULL, CAST(N'2024-12-19T10:09:37.827' AS DateTime), N'{"StartedAt":"1734602977824","ServerId":"khang:1:971d5266-c0f0-44ec-9e78-674db485959a","WorkerId":"7a3f9949-4061-4a61-b595-cb83f013f5c6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10133, 10026, N'Succeeded', NULL, CAST(N'2024-12-19T10:09:37.837' AS DateTime), N'{"SucceededAt":"1734602977833","PerformanceDuration":"4","Latency":"610425356"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10063, 10027, N'Scheduled', NULL, CAST(N'2024-12-12T08:35:52.477' AS DateTime), N'{"EnqueueAt":"1734627600000","ScheduledAt":"1733992552476"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10142, 10027, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-12-20T03:25:56.163' AS DateTime), N'{"EnqueuedAt":"1734665156161","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10145, 10027, N'Processing', NULL, CAST(N'2024-12-20T03:25:56.217' AS DateTime), N'{"StartedAt":"1734665156214","ServerId":"khang:1:47d8abd0-a6a6-4d6d-b5b4-5366164058da","WorkerId":"be3a02bc-ae14-45d7-9948-f03de0be42f8"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10152, 10027, N'Succeeded', NULL, CAST(N'2024-12-20T03:26:01.313' AS DateTime), N'{"SucceededAt":"1734665161311","PerformanceDuration":"5083","Latency":"672603750"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10064, 10028, N'Scheduled', NULL, CAST(N'2024-12-12T08:35:52.480' AS DateTime), N'{"EnqueueAt":"1734541200000","ScheduledAt":"1733992552479"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10127, 10028, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-12-19T10:09:37.773' AS DateTime), N'{"EnqueuedAt":"1734602977771","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10134, 10028, N'Processing', NULL, CAST(N'2024-12-19T10:09:37.843' AS DateTime), N'{"StartedAt":"1734602977843","ServerId":"khang:1:971d5266-c0f0-44ec-9e78-674db485959a","WorkerId":"7a3f9949-4061-4a61-b595-cb83f013f5c6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10135, 10028, N'Succeeded', NULL, CAST(N'2024-12-19T10:09:37.857' AS DateTime), N'{"SucceededAt":"1734602977854","PerformanceDuration":"6","Latency":"610425368"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10065, 10029, N'Scheduled', NULL, CAST(N'2024-12-12T08:35:52.483' AS DateTime), N'{"EnqueueAt":"1734627600000","ScheduledAt":"1733992552482"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10144, 10029, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-12-20T03:25:56.183' AS DateTime), N'{"EnqueuedAt":"1734665156179","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10146, 10029, N'Processing', NULL, CAST(N'2024-12-20T03:25:56.230' AS DateTime), N'{"StartedAt":"1734665156222","ServerId":"khang:1:47d8abd0-a6a6-4d6d-b5b4-5366164058da","WorkerId":"d096d16a-d2bf-4608-90d5-cbbbbf7f63cf"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10150, 10029, N'Failed', N'An exception occurred during performance of the job.', CAST(N'2024-12-20T03:26:01.280' AS DateTime), N'{"FailedAt":"1734665161265","ExceptionType":"Service.Exceptions.ServiceException","ExceptionMessage":"An exception has been raised that is likely due to a transient failure. Consider enabling transient error resiliency by adding ''EnableRetryOnFailure'' to the ''UseSqlServer'' call.","ExceptionDetails":"Service.Exceptions.ServiceException: An exception has been raised that is likely due to a transient failure. Consider enabling transient error resiliency by adding ''EnableRetryOnFailure'' to the ''UseSqlServer'' call.\n   at Service.BackgroundImpl.CompleteContractOnTime(String contractId) in /src/Service/BackgroundImpl.cs:line 196\n   at Service.BackgroundImpl.CompleteContractOnTimeAsync(String contractId) in /src/Service/BackgroundImpl.cs:line 170\n   at InvokeStub_TaskAwaiter.GetResult(Object, Object, IntPtr*)\n   at System.Reflection.MethodBaseInvoker.InvokeWithNoArgs(Object obj, BindingFlags invokeAttr)","ServerId":"khang:1:47d8abd0-a6a6-4d6d-b5b4-5366164058da"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10151, 10029, N'Scheduled', N'Retry attempt 1 of 10: An exception has been raised that is likely due t…', CAST(N'2024-12-20T03:26:01.280' AS DateTime), N'{"EnqueueAt":"1734665191280","ScheduledAt":"1734665161280"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10153, 10029, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-12-20T03:26:41.223' AS DateTime), N'{"EnqueuedAt":"1734665201218","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10154, 10029, N'Processing', NULL, CAST(N'2024-12-20T03:26:41.247' AS DateTime), N'{"StartedAt":"1734665201243","ServerId":"khang:1:47d8abd0-a6a6-4d6d-b5b4-5366164058da","WorkerId":"59e74e27-c361-4ffd-ab59-ba70113d5d05"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10155, 10029, N'Succeeded', NULL, CAST(N'2024-12-20T03:26:41.260' AS DateTime), N'{"SucceededAt":"1734665201258","PerformanceDuration":"8","Latency":"672648767"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10066, 10030, N'Scheduled', NULL, CAST(N'2024-12-12T08:35:52.487' AS DateTime), N'{"EnqueueAt":"1734541200000","ScheduledAt":"1733992552486"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10129, 10030, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-12-19T10:09:37.783' AS DateTime), N'{"EnqueuedAt":"1734602977780","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10136, 10030, N'Processing', NULL, CAST(N'2024-12-19T10:09:37.877' AS DateTime), N'{"StartedAt":"1734602977873","ServerId":"khang:1:971d5266-c0f0-44ec-9e78-674db485959a","WorkerId":"7a3f9949-4061-4a61-b595-cb83f013f5c6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10137, 10030, N'Succeeded', NULL, CAST(N'2024-12-19T10:09:37.887' AS DateTime), N'{"SucceededAt":"1734602977883","PerformanceDuration":"4","Latency":"610425392"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10067, 10031, N'Scheduled', NULL, CAST(N'2024-12-12T08:42:08.840' AS DateTime), N'{"EnqueueAt":"1734800400000","ScheduledAt":"1733992928838"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10156, 10031, N'Deleted', N'Triggered via Dashboard UI', CAST(N'2024-12-20T03:29:15.340' AS DateTime), N'{"DeletedAt":"1734665355338"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10068, 10032, N'Scheduled', NULL, CAST(N'2024-12-12T08:42:08.907' AS DateTime), N'{"EnqueueAt":"1734800400000","ScheduledAt":"1733992928904"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10157, 10032, N'Deleted', N'Triggered via Dashboard UI', CAST(N'2024-12-20T03:29:23.627' AS DateTime), N'{"DeletedAt":"1734665363626"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10076, 10034, N'Scheduled', NULL, CAST(N'2024-12-13T12:45:13.313' AS DateTime), N'{"EnqueueAt":"1742749200001","ScheduledAt":"1734093913309"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10077, 10035, N'Scheduled', NULL, CAST(N'2024-12-13T12:45:13.387' AS DateTime), N'{"EnqueueAt":"1742749200000","ScheduledAt":"1734093913381"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10079, 10037, N'Scheduled', NULL, CAST(N'2024-12-13T13:19:13.720' AS DateTime), N'{"EnqueueAt":"1756227600000","ScheduledAt":"1734095953713"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10080, 10038, N'Scheduled', NULL, CAST(N'2024-12-13T13:19:13.777' AS DateTime), N'{"EnqueueAt":"1756227600000","ScheduledAt":"1734095953774"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10082, 10040, N'Scheduled', NULL, CAST(N'2024-12-13T13:46:05.853' AS DateTime), N'{"EnqueueAt":"1756054800000","ScheduledAt":"1734097565851"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10083, 10041, N'Scheduled', NULL, CAST(N'2024-12-13T13:46:05.937' AS DateTime), N'{"EnqueueAt":"1756054800000","ScheduledAt":"1734097565922"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10085, 10043, N'Scheduled', NULL, CAST(N'2024-12-13T14:04:45.250' AS DateTime), N'{"EnqueueAt":"1734886800000","ScheduledAt":"1734098685245"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10086, 10044, N'Scheduled', NULL, CAST(N'2024-12-13T14:04:45.260' AS DateTime), N'{"EnqueueAt":"1734800400000","ScheduledAt":"1734098685256"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10087, 10045, N'Scheduled', NULL, CAST(N'2024-12-13T14:04:45.267' AS DateTime), N'{"EnqueueAt":"1734886800000","ScheduledAt":"1734098685264"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10088, 10046, N'Scheduled', NULL, CAST(N'2024-12-13T14:04:45.277' AS DateTime), N'{"EnqueueAt":"1734800400000","ScheduledAt":"1734098685273"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10089, 10047, N'Scheduled', NULL, CAST(N'2024-12-13T14:04:45.283' AS DateTime), N'{"EnqueueAt":"1734886800000","ScheduledAt":"1734098685278"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10090, 10048, N'Scheduled', NULL, CAST(N'2024-12-13T14:04:45.287' AS DateTime), N'{"EnqueueAt":"1734800400000","ScheduledAt":"1734098685286"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10091, 10049, N'Scheduled', NULL, CAST(N'2024-12-13T14:04:45.297' AS DateTime), N'{"EnqueueAt":"1734886800000","ScheduledAt":"1734098685295"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10092, 10050, N'Scheduled', NULL, CAST(N'2024-12-13T14:04:45.300' AS DateTime), N'{"EnqueueAt":"1734800400000","ScheduledAt":"1734098685300"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10094, 10052, N'Scheduled', NULL, CAST(N'2024-12-14T02:18:00.507' AS DateTime), N'{"EnqueueAt":"1745514000001","ScheduledAt":"1734142680486"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10095, 10053, N'Scheduled', NULL, CAST(N'2024-12-14T02:18:00.613' AS DateTime), N'{"EnqueueAt":"1745514000000","ScheduledAt":"1734142680612"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10116, 10055, N'Scheduled', NULL, CAST(N'2024-12-15T08:25:40.857' AS DateTime), N'{"EnqueueAt":"1745946000001","ScheduledAt":"1734251140830"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10117, 10056, N'Scheduled', NULL, CAST(N'2024-12-15T08:25:41.007' AS DateTime), N'{"EnqueueAt":"1745946000000","ScheduledAt":"1734251141005"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10118, 10057, N'Scheduled', NULL, CAST(N'2024-12-15T08:25:41.257' AS DateTime), N'{"EnqueueAt":"1745946000000","ScheduledAt":"1734251141253"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10122, 10058, N'Scheduled', NULL, CAST(N'2024-12-18T07:55:30.860' AS DateTime), N'{"EnqueueAt":"1734594930828","ScheduledAt":"1734508530828"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10130, 10058, N'Enqueued', N'Triggered by DelayedJobScheduler', CAST(N'2024-12-19T10:09:37.790' AS DateTime), N'{"EnqueuedAt":"1734602977788","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10138, 10058, N'Processing', NULL, CAST(N'2024-12-19T10:09:37.897' AS DateTime), N'{"StartedAt":"1734602977893","ServerId":"khang:1:971d5266-c0f0-44ec-9e78-674db485959a","WorkerId":"7a3f9949-4061-4a61-b595-cb83f013f5c6"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10139, 10058, N'Succeeded', NULL, CAST(N'2024-12-19T10:09:37.973' AS DateTime), N'{"SucceededAt":"1734602977970","PerformanceDuration":"70","Latency":"94447056"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10123, 10059, N'Scheduled', NULL, CAST(N'2024-12-18T08:00:05.967' AS DateTime), N'{"EnqueueAt":"1745600400000","ScheduledAt":"1734508805965"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10124, 10060, N'Scheduled', NULL, CAST(N'2024-12-18T08:14:19.640' AS DateTime), N'{"EnqueueAt":"1735146000001","ScheduledAt":"1734509659636"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
/****** Object:  Index [IX_Account_MembershipRankId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Account_MembershipRankId] ON [dbo].[Account]
(
	[MembershipRankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Account_RoleId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Account_RoleId] ON [dbo].[Account]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AccountBusiness_AccountId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_AccountBusiness_AccountId] ON [dbo].[AccountBusiness]
(
	[AccountId] ASC
)
WHERE ([AccountId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Address_AccountId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Address_AccountId] ON [dbo].[Address]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ComponentReplacementTicket_ComponentId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentReplacementTicket_ComponentId] ON [dbo].[ComponentReplacementTicket]
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ComponentReplacementTicket_ContractId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentReplacementTicket_ContractId] ON [dbo].[ComponentReplacementTicket]
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ComponentReplacementTicket_EmployeeCreateId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentReplacementTicket_EmployeeCreateId] ON [dbo].[ComponentReplacementTicket]
(
	[EmployeeCreateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ComponentReplacementTicket_InvoiceId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_ComponentReplacementTicket_InvoiceId] ON [dbo].[ComponentReplacementTicket]
(
	[InvoiceId] ASC
)
WHERE ([InvoiceId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ComponentReplacementTicket_MachineSerialNumberComponentId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentReplacementTicket_MachineSerialNumberComponentId] ON [dbo].[ComponentReplacementTicket]
(
	[MachineSerialNumberComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ComponentReplacementTicket_MachineTaskCreateId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentReplacementTicket_MachineTaskCreateId] ON [dbo].[ComponentReplacementTicket]
(
	[MachineTaskCreateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ComponentReplacementTicketLog_AccountTriggerId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentReplacementTicketLog_AccountTriggerId] ON [dbo].[ComponentReplacementTicketLog]
(
	[AccountTriggerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ComponentReplacementTicketLog_ComponentReplacementTicketId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ComponentReplacementTicketLog_ComponentReplacementTicketId] ON [dbo].[ComponentReplacementTicketLog]
(
	[ComponentReplacementTicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Content_AccountId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Content_AccountId] ON [dbo].[Content]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Contract_AccountSignId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Contract_AccountSignId] ON [dbo].[Contract]
(
	[AccountSignId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Contract_BaseContractId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Contract_BaseContractId] ON [dbo].[Contract]
(
	[BaseContractId] ASC
)
WHERE ([BaseContractId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Contract_RentingRequestId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Contract_RentingRequestId] ON [dbo].[Contract]
(
	[RentingRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Contract_SerialNumber]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Contract_SerialNumber] ON [dbo].[Contract]
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContractDelivery_ContractId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ContractDelivery_ContractId] ON [dbo].[ContractDelivery]
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ContractDelivery_DeliveryTaskId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ContractDelivery_DeliveryTaskId] ON [dbo].[ContractDelivery]
(
	[DeliveryTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContractPayment_ContractId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ContractPayment_ContractId] ON [dbo].[ContractPayment]
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContractPayment_InvoiceId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ContractPayment_InvoiceId] ON [dbo].[ContractPayment]
(
	[InvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ContractTerm_ContractId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ContractTerm_ContractId] ON [dbo].[ContractTerm]
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryTask_ManagerId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryTask_ManagerId] ON [dbo].[DeliveryTask]
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryTask_StaffId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryTask_StaffId] ON [dbo].[DeliveryTask]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryTaskLog_AccountTriggerId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryTaskLog_AccountTriggerId] ON [dbo].[DeliveryTaskLog]
(
	[AccountTriggerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeliveryTaskLog_DeliveryTaskId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_DeliveryTaskLog_DeliveryTaskId] ON [dbo].[DeliveryTaskLog]
(
	[DeliveryTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DigitalTransactions_InvoiceId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DigitalTransactions_InvoiceId] ON [dbo].[DigitalTransactions]
(
	[InvoiceId] ASC
)
WHERE ([InvoiceId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Invoices_AccountPaidId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Invoices_AccountPaidId] ON [dbo].[Invoices]
(
	[AccountPaidId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_LogDetail_AccountId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_LogDetail_AccountId] ON [dbo].[LogDetail]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Machine_CategoryId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Machine_CategoryId] ON [dbo].[Machine]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineAttribute_MachineId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineAttribute_MachineId] ON [dbo].[MachineAttribute]
(
	[MachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MachineCheckRequest_ContractId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineCheckRequest_ContractId] ON [dbo].[MachineCheckRequest]
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MachineCheckRequestCriteria_MachineCheckRequestId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineCheckRequestCriteria_MachineCheckRequestId] ON [dbo].[MachineCheckRequestCriteria]
(
	[MachineCheckRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineComponent_ComponentId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineComponent_ComponentId] ON [dbo].[MachineComponent]
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineComponent_MachineId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineComponent_MachineId] ON [dbo].[MachineComponent]
(
	[MachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineImage_MachineId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineImage_MachineId] ON [dbo].[MachineImage]
(
	[MachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineSerialNumber_MachineId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineSerialNumber_MachineId] ON [dbo].[MachineSerialNumber]
(
	[MachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineSerialNumberComponent_MachineComponentId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineSerialNumberComponent_MachineComponentId] ON [dbo].[MachineSerialNumberComponent]
(
	[MachineComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MachineSerialNumberComponent_SerialNumber]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineSerialNumberComponent_SerialNumber] ON [dbo].[MachineSerialNumberComponent]
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineSerialNumberLog_AccountTriggerId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineSerialNumberLog_AccountTriggerId] ON [dbo].[MachineSerialNumberLog]
(
	[AccountTriggerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineSerialNumberLog_MachineSerialNumberComponentId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineSerialNumberLog_MachineSerialNumberComponentId] ON [dbo].[MachineSerialNumberLog]
(
	[MachineSerialNumberComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MachineSerialNumberLog_SerialNumber]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineSerialNumberLog_SerialNumber] ON [dbo].[MachineSerialNumberLog]
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MachineTask_ContractId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineTask_ContractId] ON [dbo].[MachineTask]
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MachineTask_MachineCheckRequestId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MachineTask_MachineCheckRequestId] ON [dbo].[MachineTask]
(
	[MachineCheckRequestId] ASC
)
WHERE ([MachineCheckRequestId] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineTask_ManagerId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineTask_ManagerId] ON [dbo].[MachineTask]
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineTask_StaffId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineTask_StaffId] ON [dbo].[MachineTask]
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineTaskLog_AccountTriggerId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineTaskLog_AccountTriggerId] ON [dbo].[MachineTaskLog]
(
	[AccountTriggerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineTaskLog_MachineTaskId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineTaskLog_MachineTaskId] ON [dbo].[MachineTaskLog]
(
	[MachineTaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MachineTerm_MachineId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MachineTerm_MachineId] ON [dbo].[MachineTerm]
(
	[MachineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MembershipRankLog_AccountId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MembershipRankLog_AccountId] ON [dbo].[MembershipRankLog]
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MembershipRankLog_MembershipRankId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_MembershipRankLog_MembershipRankId] ON [dbo].[MembershipRankLog]
(
	[MembershipRankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notification_AccountReceiveId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Notification_AccountReceiveId] ON [dbo].[Notification]
(
	[AccountReceiveId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RentingRequest_AccountOrderId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_RentingRequest_AccountOrderId] ON [dbo].[RentingRequest]
(
	[AccountOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ServiceRentingRequest_RentingRequestId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceRentingRequest_RentingRequestId] ON [dbo].[ServiceRentingRequest]
(
	[RentingRequestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ServiceRentingRequest_RentingServiceId]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_ServiceRentingRequest_RentingServiceId] ON [dbo].[ServiceRentingRequest]
(
	[RentingServiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_AggregatedCounter_ExpireAt]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_AggregatedCounter_ExpireAt] ON [HangFire].[AggregatedCounter]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Hash_ExpireAt]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Hash_ExpireAt] ON [HangFire].[Hash]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Job_ExpireAt]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_ExpireAt] ON [HangFire].[Job]
(
	[ExpireAt] ASC
)
INCLUDE([StateName]) 
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Job_StateName]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Job_StateName] ON [HangFire].[Job]
(
	[StateName] ASC
)
WHERE ([StateName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_List_ExpireAt]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_List_ExpireAt] ON [HangFire].[List]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Server_LastHeartbeat]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Server_LastHeartbeat] ON [HangFire].[Server]
(
	[LastHeartbeat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_Set_ExpireAt]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_ExpireAt] ON [HangFire].[Set]
(
	[ExpireAt] ASC
)
WHERE ([ExpireAt] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HangFire_Set_Score]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_Set_Score] ON [HangFire].[Set]
(
	[Key] ASC,
	[Score] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_HangFire_State_CreatedAt]    Script Date: 12/20/2024 11:44:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_HangFire_State_CreatedAt] ON [HangFire].[State]
(
	[CreatedAt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_MembershipRank] FOREIGN KEY([MembershipRankId])
REFERENCES [dbo].[MembershipRank] ([MembershipRankId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_MembershipRank]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[AccountBusiness]  WITH CHECK ADD  CONSTRAINT [FK_AccountBusiness_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[AccountBusiness] CHECK CONSTRAINT [FK_AccountBusiness_Account]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Account]
GO
ALTER TABLE [dbo].[ComponentReplacementTicket]  WITH CHECK ADD  CONSTRAINT [FK_ComponentReplacementTicket_Account_EmployeeCreateId] FOREIGN KEY([EmployeeCreateId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[ComponentReplacementTicket] CHECK CONSTRAINT [FK_ComponentReplacementTicket_Account_EmployeeCreateId]
GO
ALTER TABLE [dbo].[ComponentReplacementTicket]  WITH CHECK ADD  CONSTRAINT [FK_ComponentReplacementTicket_ComponentID] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[Component] ([ComponentId])
GO
ALTER TABLE [dbo].[ComponentReplacementTicket] CHECK CONSTRAINT [FK_ComponentReplacementTicket_ComponentID]
GO
ALTER TABLE [dbo].[ComponentReplacementTicket]  WITH CHECK ADD  CONSTRAINT [FK_ComponentReplacementTicket_ContractID] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[ComponentReplacementTicket] CHECK CONSTRAINT [FK_ComponentReplacementTicket_ContractID]
GO
ALTER TABLE [dbo].[ComponentReplacementTicket]  WITH CHECK ADD  CONSTRAINT [FK_ComponentReplacementTicket_MachineSerialNumberComponent] FOREIGN KEY([MachineSerialNumberComponentId])
REFERENCES [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId])
GO
ALTER TABLE [dbo].[ComponentReplacementTicket] CHECK CONSTRAINT [FK_ComponentReplacementTicket_MachineSerialNumberComponent]
GO
ALTER TABLE [dbo].[ComponentReplacementTicket]  WITH CHECK ADD  CONSTRAINT [FK_ComponentReplacementTicket_MachineTaskCreated] FOREIGN KEY([MachineTaskCreateId])
REFERENCES [dbo].[MachineTask] ([MachineTaskId])
GO
ALTER TABLE [dbo].[ComponentReplacementTicket] CHECK CONSTRAINT [FK_ComponentReplacementTicket_MachineTaskCreated]
GO
ALTER TABLE [dbo].[ComponentReplacementTicket]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_MaintainTicket] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([InvoiceId])
GO
ALTER TABLE [dbo].[ComponentReplacementTicket] CHECK CONSTRAINT [FK_Invoice_MaintainTicket]
GO
ALTER TABLE [dbo].[ComponentReplacementTicketLog]  WITH CHECK ADD  CONSTRAINT [FK_ComponentReplacementTicket_Log] FOREIGN KEY([ComponentReplacementTicketId])
REFERENCES [dbo].[ComponentReplacementTicket] ([ComponentReplacementTicketId])
GO
ALTER TABLE [dbo].[ComponentReplacementTicketLog] CHECK CONSTRAINT [FK_ComponentReplacementTicket_Log]
GO
ALTER TABLE [dbo].[ComponentReplacementTicketLog]  WITH CHECK ADD  CONSTRAINT [FK_ComponentReplacementTicketLog_Account_AccountTriggerId] FOREIGN KEY([AccountTriggerId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[ComponentReplacementTicketLog] CHECK CONSTRAINT [FK_ComponentReplacementTicketLog_Account_AccountTriggerId]
GO
ALTER TABLE [dbo].[Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Content] CHECK CONSTRAINT [FK_Content_Account]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_Account] FOREIGN KEY([AccountSignId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_Account]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_BaseContract] FOREIGN KEY([BaseContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_BaseContract]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_Contract_MachineSerialNumber] FOREIGN KEY([SerialNumber])
REFERENCES [dbo].[MachineSerialNumber] ([SerialNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_Contract_MachineSerialNumber]
GO
ALTER TABLE [dbo].[Contract]  WITH CHECK ADD  CONSTRAINT [FK_RentingRequest_Contract] FOREIGN KEY([RentingRequestId])
REFERENCES [dbo].[RentingRequest] ([RentingRequestId])
GO
ALTER TABLE [dbo].[Contract] CHECK CONSTRAINT [FK_RentingRequest_Contract]
GO
ALTER TABLE [dbo].[ContractDelivery]  WITH CHECK ADD  CONSTRAINT [FK_Contract_ContractDelivery] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[ContractDelivery] CHECK CONSTRAINT [FK_Contract_ContractDelivery]
GO
ALTER TABLE [dbo].[ContractDelivery]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryTask_ContractDelivery] FOREIGN KEY([DeliveryTaskId])
REFERENCES [dbo].[DeliveryTask] ([DeliveryTaskId])
GO
ALTER TABLE [dbo].[ContractDelivery] CHECK CONSTRAINT [FK_DeliveryTask_ContractDelivery]
GO
ALTER TABLE [dbo].[ContractPayment]  WITH CHECK ADD  CONSTRAINT [FK_ContractPayment_ContractID] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[ContractPayment] CHECK CONSTRAINT [FK_ContractPayment_ContractID]
GO
ALTER TABLE [dbo].[ContractPayment]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_ContractPayment] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([InvoiceId])
GO
ALTER TABLE [dbo].[ContractPayment] CHECK CONSTRAINT [FK_Invoice_ContractPayment]
GO
ALTER TABLE [dbo].[ContractTerm]  WITH CHECK ADD  CONSTRAINT [FK_ContractTerm_ContractID] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[ContractTerm] CHECK CONSTRAINT [FK_ContractTerm_ContractID]
GO
ALTER TABLE [dbo].[DeliveryTask]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryTask_ManagerID] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[DeliveryTask] CHECK CONSTRAINT [FK_DeliveryTask_ManagerID]
GO
ALTER TABLE [dbo].[DeliveryTask]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryTask_StaffID] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[DeliveryTask] CHECK CONSTRAINT [FK_DeliveryTask_StaffID]
GO
ALTER TABLE [dbo].[DeliveryTaskLog]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryTaskLog_AccountID] FOREIGN KEY([AccountTriggerId])
REFERENCES [dbo].[Account] ([AccountId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[DeliveryTaskLog] CHECK CONSTRAINT [FK_DeliveryTaskLog_AccountID]
GO
ALTER TABLE [dbo].[DeliveryTaskLog]  WITH CHECK ADD  CONSTRAINT [FK_DeliveryTaskLog_DeliveryTaskID] FOREIGN KEY([DeliveryTaskId])
REFERENCES [dbo].[DeliveryTask] ([DeliveryTaskId])
GO
ALTER TABLE [dbo].[DeliveryTaskLog] CHECK CONSTRAINT [FK_DeliveryTaskLog_DeliveryTaskID]
GO
ALTER TABLE [dbo].[DigitalTransactions]  WITH CHECK ADD  CONSTRAINT [FK_DigitalTransaction_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoices] ([InvoiceId])
GO
ALTER TABLE [dbo].[DigitalTransactions] CHECK CONSTRAINT [FK_DigitalTransaction_Invoice]
GO
ALTER TABLE [dbo].[Invoices]  WITH CHECK ADD  CONSTRAINT [FK_Invoices_Account] FOREIGN KEY([AccountPaidId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Invoices] CHECK CONSTRAINT [FK_Invoices_Account]
GO
ALTER TABLE [dbo].[LogDetail]  WITH CHECK ADD  CONSTRAINT [FK_LogDetail_AccountID] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[LogDetail] CHECK CONSTRAINT [FK_LogDetail_AccountID]
GO
ALTER TABLE [dbo].[Machine]  WITH CHECK ADD  CONSTRAINT [FK_Machine_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Machine] CHECK CONSTRAINT [FK_Machine_Category]
GO
ALTER TABLE [dbo].[MachineAttribute]  WITH CHECK ADD  CONSTRAINT [FK_Attribute_Machine] FOREIGN KEY([MachineId])
REFERENCES [dbo].[Machine] ([MachineId])
GO
ALTER TABLE [dbo].[MachineAttribute] CHECK CONSTRAINT [FK_Attribute_Machine]
GO
ALTER TABLE [dbo].[MachineCheckRequest]  WITH CHECK ADD  CONSTRAINT [FK_MachineCheckRequest_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[MachineCheckRequest] CHECK CONSTRAINT [FK_MachineCheckRequest_Contract]
GO
ALTER TABLE [dbo].[MachineCheckRequestCriteria]  WITH CHECK ADD  CONSTRAINT [FK_MachineCheckRequestCriteria_MachineCheckRequest] FOREIGN KEY([MachineCheckRequestId])
REFERENCES [dbo].[MachineCheckRequest] ([MachineCheckRequestId])
GO
ALTER TABLE [dbo].[MachineCheckRequestCriteria] CHECK CONSTRAINT [FK_MachineCheckRequestCriteria_MachineCheckRequest]
GO
ALTER TABLE [dbo].[MachineComponent]  WITH CHECK ADD  CONSTRAINT [FK_MachineComponent_ComponentID] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[Component] ([ComponentId])
GO
ALTER TABLE [dbo].[MachineComponent] CHECK CONSTRAINT [FK_MachineComponent_ComponentID]
GO
ALTER TABLE [dbo].[MachineComponent]  WITH CHECK ADD  CONSTRAINT [FK_MachineComponent_MachineID] FOREIGN KEY([MachineId])
REFERENCES [dbo].[Machine] ([MachineId])
GO
ALTER TABLE [dbo].[MachineComponent] CHECK CONSTRAINT [FK_MachineComponent_MachineID]
GO
ALTER TABLE [dbo].[MachineImage]  WITH CHECK ADD  CONSTRAINT [FK_MachineImage_Machine] FOREIGN KEY([MachineId])
REFERENCES [dbo].[Machine] ([MachineId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MachineImage] CHECK CONSTRAINT [FK_MachineImage_Machine]
GO
ALTER TABLE [dbo].[MachineSerialNumber]  WITH CHECK ADD  CONSTRAINT [FK_MachineNumber_Machine] FOREIGN KEY([MachineId])
REFERENCES [dbo].[Machine] ([MachineId])
GO
ALTER TABLE [dbo].[MachineSerialNumber] CHECK CONSTRAINT [FK_MachineNumber_Machine]
GO
ALTER TABLE [dbo].[MachineSerialNumberComponent]  WITH CHECK ADD  CONSTRAINT [FK_MachineSerialNumberComponent_ComponentID] FOREIGN KEY([MachineComponentId])
REFERENCES [dbo].[MachineComponent] ([MachineComponentId])
GO
ALTER TABLE [dbo].[MachineSerialNumberComponent] CHECK CONSTRAINT [FK_MachineSerialNumberComponent_ComponentID]
GO
ALTER TABLE [dbo].[MachineSerialNumberComponent]  WITH CHECK ADD  CONSTRAINT [FK_MachineSerialNumberComponent_MachineSerialNumber] FOREIGN KEY([SerialNumber])
REFERENCES [dbo].[MachineSerialNumber] ([SerialNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MachineSerialNumberComponent] CHECK CONSTRAINT [FK_MachineSerialNumberComponent_MachineSerialNumber]
GO
ALTER TABLE [dbo].[MachineSerialNumberLog]  WITH CHECK ADD  CONSTRAINT [FK_MachineSerialNumber_Log] FOREIGN KEY([SerialNumber])
REFERENCES [dbo].[MachineSerialNumber] ([SerialNumber])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MachineSerialNumberLog] CHECK CONSTRAINT [FK_MachineSerialNumber_Log]
GO
ALTER TABLE [dbo].[MachineSerialNumberLog]  WITH CHECK ADD  CONSTRAINT [FK_MachineSerialNumberComponent_Log] FOREIGN KEY([MachineSerialNumberComponentId])
REFERENCES [dbo].[MachineSerialNumberComponent] ([MachineSerialNumberComponentId])
GO
ALTER TABLE [dbo].[MachineSerialNumberLog] CHECK CONSTRAINT [FK_MachineSerialNumberComponent_Log]
GO
ALTER TABLE [dbo].[MachineSerialNumberLog]  WITH CHECK ADD  CONSTRAINT [FK_MachineSerialNumberLog_AccountID] FOREIGN KEY([AccountTriggerId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[MachineSerialNumberLog] CHECK CONSTRAINT [FK_MachineSerialNumberLog_AccountID]
GO
ALTER TABLE [dbo].[MachineTask]  WITH CHECK ADD  CONSTRAINT [FK_Task_Contract] FOREIGN KEY([ContractId])
REFERENCES [dbo].[Contract] ([ContractId])
GO
ALTER TABLE [dbo].[MachineTask] CHECK CONSTRAINT [FK_Task_Contract]
GO
ALTER TABLE [dbo].[MachineTask]  WITH CHECK ADD  CONSTRAINT [FK_Task_MachineCheckRequest] FOREIGN KEY([MachineCheckRequestId])
REFERENCES [dbo].[MachineCheckRequest] ([MachineCheckRequestId])
GO
ALTER TABLE [dbo].[MachineTask] CHECK CONSTRAINT [FK_Task_MachineCheckRequest]
GO
ALTER TABLE [dbo].[MachineTask]  WITH CHECK ADD  CONSTRAINT [FK_Task_Manager] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[MachineTask] CHECK CONSTRAINT [FK_Task_Manager]
GO
ALTER TABLE [dbo].[MachineTask]  WITH CHECK ADD  CONSTRAINT [FK_Task_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[MachineTask] CHECK CONSTRAINT [FK_Task_Staff]
GO
ALTER TABLE [dbo].[MachineTaskLog]  WITH CHECK ADD  CONSTRAINT [FK_MachineTaskLog_AccountID] FOREIGN KEY([AccountTriggerId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[MachineTaskLog] CHECK CONSTRAINT [FK_MachineTaskLog_AccountID]
GO
ALTER TABLE [dbo].[MachineTaskLog]  WITH CHECK ADD  CONSTRAINT [FK_MachineTaskLog_TaskID] FOREIGN KEY([MachineTaskId])
REFERENCES [dbo].[MachineTask] ([MachineTaskId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MachineTaskLog] CHECK CONSTRAINT [FK_MachineTaskLog_TaskID]
GO
ALTER TABLE [dbo].[MachineTerm]  WITH CHECK ADD  CONSTRAINT [FK_Term_Machine] FOREIGN KEY([MachineId])
REFERENCES [dbo].[Machine] ([MachineId])
GO
ALTER TABLE [dbo].[MachineTerm] CHECK CONSTRAINT [FK_Term_Machine]
GO
ALTER TABLE [dbo].[MembershipRankLog]  WITH CHECK ADD  CONSTRAINT [FK_account_membershiplog] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[MembershipRankLog] CHECK CONSTRAINT [FK_account_membershiplog]
GO
ALTER TABLE [dbo].[MembershipRankLog]  WITH CHECK ADD  CONSTRAINT [FK_MembershipRank_membershiplog] FOREIGN KEY([MembershipRankId])
REFERENCES [dbo].[MembershipRank] ([MembershipRankId])
GO
ALTER TABLE [dbo].[MembershipRankLog] CHECK CONSTRAINT [FK_MembershipRank_membershiplog]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Account] FOREIGN KEY([AccountReceiveId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Account]
GO
ALTER TABLE [dbo].[RentingRequest]  WITH CHECK ADD  CONSTRAINT [FK_RentingRequest_Account] FOREIGN KEY([AccountOrderId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[RentingRequest] CHECK CONSTRAINT [FK_RentingRequest_Account]
GO
ALTER TABLE [dbo].[RentingRequestAddress]  WITH CHECK ADD  CONSTRAINT [FK_RentingRequest_RentingRequestAddress] FOREIGN KEY([RentingRequestId])
REFERENCES [dbo].[RentingRequest] ([RentingRequestId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RentingRequestAddress] CHECK CONSTRAINT [FK_RentingRequest_RentingRequestAddress]
GO
ALTER TABLE [dbo].[ServiceRentingRequest]  WITH CHECK ADD  CONSTRAINT [FK_rentingservice_servicerequest] FOREIGN KEY([RentingServiceId])
REFERENCES [dbo].[RentingService] ([RentingServiceId])
GO
ALTER TABLE [dbo].[ServiceRentingRequest] CHECK CONSTRAINT [FK_rentingservice_servicerequest]
GO
ALTER TABLE [dbo].[ServiceRentingRequest]  WITH CHECK ADD  CONSTRAINT [FK_servicerequest_rentingrequest] FOREIGN KEY([RentingRequestId])
REFERENCES [dbo].[RentingRequest] ([RentingRequestId])
GO
ALTER TABLE [dbo].[ServiceRentingRequest] CHECK CONSTRAINT [FK_servicerequest_rentingrequest]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
USE [master]
GO
ALTER DATABASE [MMRMS] SET  READ_WRITE 
GO
