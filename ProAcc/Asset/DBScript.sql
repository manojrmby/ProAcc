USE [ProAcc]
GO
/****** Object:  StoredProcedure [dbo].[SP_SimplificationReport]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP PROCEDURE [dbo].[SP_SimplificationReport]
GO
/****** Object:  StoredProcedure [dbo].[SP_ReadinessReport]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP PROCEDURE [dbo].[SP_ReadinessReport]
GO
ALTER TABLE [dbo].[SubMilestoneConfig] DROP CONSTRAINT [FK_SubMilestoneConfig_MilestoneDetails]
GO
ALTER TABLE [dbo].[ProjectDetails] DROP CONSTRAINT [FK_ProjectDetails_StageStatus]
GO
ALTER TABLE [dbo].[ProjectDetails] DROP CONSTRAINT [FK_ProjectDetails_Project]
GO
ALTER TABLE [dbo].[ProjectDetails] DROP CONSTRAINT [FK_ProjectDetails_MilestoneDetails]
GO
ALTER TABLE [dbo].[Project] DROP CONSTRAINT [FK_Project_Customer]
GO
ALTER TABLE [dbo].[Project] DROP CONSTRAINT [FK_Project_Consultant]
GO
ALTER TABLE [dbo].[MilestoneDetails] DROP CONSTRAINT [FK_MilestoneDetails_Project]
GO
ALTER TABLE [dbo].[MilestoneDetails] DROP CONSTRAINT [FK_MilestoneDetails_Milestone]
GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [FK_Customer_User_Master]
GO
ALTER TABLE [dbo].[Consultant] DROP CONSTRAINT [FK_Consultant_User_Master]
GO
ALTER TABLE [dbo].[User_Master] DROP CONSTRAINT [DF_User_IsDeleted]
GO
ALTER TABLE [dbo].[User_Master] DROP CONSTRAINT [DF_User_Cre_on]
GO
ALTER TABLE [dbo].[User_Master] DROP CONSTRAINT [DF_User_isActive]
GO
ALTER TABLE [dbo].[SubMilestoneConfig] DROP CONSTRAINT [DF_SubMilestoneConfig_IsDeleted]
GO
ALTER TABLE [dbo].[SubMilestoneConfig] DROP CONSTRAINT [DF_SubMilestoneConfig_Cre_on]
GO
ALTER TABLE [dbo].[SubMilestoneConfig] DROP CONSTRAINT [DF_SubMilestoneConfig_isActive]
GO
ALTER TABLE [dbo].[StageStatus] DROP CONSTRAINT [DF_StageStatus_IsDeleted]
GO
ALTER TABLE [dbo].[StageStatus] DROP CONSTRAINT [DF_StageStatus_Cre_on]
GO
ALTER TABLE [dbo].[StageStatus] DROP CONSTRAINT [DF_StageStatus_isActive]
GO
ALTER TABLE [dbo].[ProjectDetails] DROP CONSTRAINT [DF_ProjectDetails_IsDeleted]
GO
ALTER TABLE [dbo].[ProjectDetails] DROP CONSTRAINT [DF_ProjectDetails_Cre_on]
GO
ALTER TABLE [dbo].[ProjectDetails] DROP CONSTRAINT [DF_ProjectDetails_isActive]
GO
ALTER TABLE [dbo].[Project] DROP CONSTRAINT [DF_Project_IsDeleted]
GO
ALTER TABLE [dbo].[Project] DROP CONSTRAINT [DF_Project_Cre_on]
GO
ALTER TABLE [dbo].[Project] DROP CONSTRAINT [DF_Project_isActive]
GO
ALTER TABLE [dbo].[MilestoneDetails] DROP CONSTRAINT [DF_MilestoneDetails_IsDeleted]
GO
ALTER TABLE [dbo].[MilestoneDetails] DROP CONSTRAINT [DF_MilestoneDetails_Cre_on]
GO
ALTER TABLE [dbo].[MilestoneDetails] DROP CONSTRAINT [DF_MilestoneDetails_isActive]
GO
ALTER TABLE [dbo].[Milestone] DROP CONSTRAINT [DF_Milestone_IsDeleted]
GO
ALTER TABLE [dbo].[Milestone] DROP CONSTRAINT [DF_Milestone_Cre_on]
GO
ALTER TABLE [dbo].[Milestone] DROP CONSTRAINT [DF_Milestone_isActive]
GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [DF_Customer_IsDeleted]
GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [DF_Customer_Cre_on]
GO
ALTER TABLE [dbo].[Customer] DROP CONSTRAINT [DF_Customer_isActive]
GO
ALTER TABLE [dbo].[Consultant] DROP CONSTRAINT [DF_Consultant_IsDeleted]
GO
ALTER TABLE [dbo].[Consultant] DROP CONSTRAINT [DF_Consultant_Cre_on]
GO
ALTER TABLE [dbo].[Consultant] DROP CONSTRAINT [DF_Consultant_isActive]
GO
/****** Object:  Table [dbo].[User_Master]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[User_Master]
GO
/****** Object:  Table [dbo].[SubMilestoneConfig]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[SubMilestoneConfig]
GO
/****** Object:  Table [dbo].[StageStatus]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[StageStatus]
GO
/****** Object:  Table [dbo].[SAPInput_SimplificationReport]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[SAPInput_SimplificationReport]
GO
/****** Object:  Table [dbo].[SAPInput_Activities]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[SAPInput_Activities]
GO
/****** Object:  Table [dbo].[ProjectDetails]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[ProjectDetails]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[Project]
GO
/****** Object:  Table [dbo].[MilestoneDetails]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[MilestoneDetails]
GO
/****** Object:  Table [dbo].[Milestone]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[Milestone]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Consultant]    Script Date: 4/15/2020 9:42:21 AM ******/
DROP TABLE [dbo].[Consultant]
GO
/****** Object:  Table [dbo].[Consultant]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultant](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Designation] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[EMail] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Cre_on] [datetime] NOT NULL,
	[Cre_By] [uniqueidentifier] NOT NULL,
	[Modified_On] [datetime] NULL,
	[Modified_by] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Consultant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[UserTypeID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Company] [nvarchar](50) NOT NULL,
	[Work_Function] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](10) NULL,
	[Email] [nvarchar](10) NULL,
	[EstimatedSale] [money] NULL,
	[LastContact_Dt] [datetime] NULL,
	[NextAction_Dt] [datetime] NULL,
	[NextContact_Dt] [datetime] NULL,
	[LeadStatus] [nvarchar](50) NULL,
	[LeadSource] [nvarchar](50) NULL,
	[Conv_Cust_Status] [nvarchar](50) NULL,
	[isActive] [bit] NOT NULL,
	[Cre_on] [datetime] NOT NULL,
	[Cre_By] [uniqueidentifier] NOT NULL,
	[Modified_On] [datetime] NULL,
	[Modified_by] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Milestone]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Milestone](
	[ID] [int] NOT NULL,
	[MilestoneName] [nvarchar](50) NULL,
	[isActive] [bit] NOT NULL,
	[Cre_on] [datetime] NOT NULL,
	[Cre_By] [uniqueidentifier] NOT NULL,
	[Modified_On] [datetime] NULL,
	[Modified_by] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Milestone] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MilestoneDetails]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MilestoneDetails](
	[Id] [uniqueidentifier] NOT NULL,
	[Start_Dt] [datetime] NOT NULL,
	[End_Dt] [datetime] NOT NULL,
	[Milestone_ID] [int] NOT NULL,
	[Project_ID] [uniqueidentifier] NULL,
	[isActive] [bit] NOT NULL,
	[Cre_on] [datetime] NOT NULL,
	[Cre_By] [uniqueidentifier] NOT NULL,
	[Modified_On] [datetime] NULL,
	[Modified_by] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_MilestoneDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [uniqueidentifier] NOT NULL,
	[ProjectName] [nvarchar](50) NOT NULL,
	[Cust_ID] [uniqueidentifier] NULL,
	[Consultunt_Id] [uniqueidentifier] NULL,
	[Start_Dt] [datetime] NOT NULL,
	[End_Dt] [datetime] NOT NULL,
	[Accuracy] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Cre_on] [datetime] NOT NULL,
	[Cre_By] [uniqueidentifier] NOT NULL,
	[Modified_On] [datetime] NULL,
	[Modified_by] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProjectDetails]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProjectDetails](
	[ID] [uniqueidentifier] NOT NULL,
	[Proj_ID] [uniqueidentifier] NULL,
	[SubMile_ID] [uniqueidentifier] NULL,
	[OrderNum] [int] IDENTITY(1,1) NOT NULL,
	[StatgeStatus_ID] [int] NULL,
	[Info] [nvarchar](50) NULL,
	[Info_Dt] [datetime] NULL,
	[LastUpdated_Dt] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[Cre_on] [datetime] NOT NULL,
	[Cre_By] [uniqueidentifier] NOT NULL,
	[Modified_On] [datetime] NULL,
	[Modified_by] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProjectDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAPInput_Activities]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAPInput_Activities](
	[S_No] [float] NOT NULL,
	[Related Simplification Items] [nvarchar](255) NULL,
	[Activities] [nvarchar](255) NULL,
	[Phase] [nvarchar](255) NULL,
	[Condition] [nvarchar](255) NULL,
	[Additional Information] [nvarchar](255) NULL,
 CONSTRAINT [PK_SAPInput_Activities] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAPInput_SimplificationReport]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAPInput_SimplificationReport](
	[S_No] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Category] [nvarchar](255) NULL,
	[Relevance] [nvarchar](255) NULL,
	[LoB/Technology] [nvarchar](255) NULL,
	[Business Area] [nvarchar](255) NULL,
	[Consistency Status] [nvarchar](255) NULL,
	[Manual Status] [nvarchar](255) NULL,
	[SAP Notes] [nvarchar](255) NULL,
	[Relevance Summary] [nvarchar](255) NULL,
 CONSTRAINT [PK_SAPInput] PRIMARY KEY CLUSTERED 
(
	[S_No] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StageStatus]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageStatus](
	[ID] [int] NOT NULL,
	[StageStusName] [nvarchar](50) NULL,
	[isActive] [bit] NOT NULL,
	[Cre_on] [datetime] NOT NULL,
	[Cre_By] [uniqueidentifier] NOT NULL,
	[Modified_On] [datetime] NULL,
	[Modified_by] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_StageStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubMilestoneConfig]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubMilestoneConfig](
	[Id] [uniqueidentifier] NOT NULL,
	[MilestoneDetails_ID] [uniqueidentifier] NULL,
	[SubMilestoneName] [nvarchar](50) NULL,
	[SubMail_Order] [int] IDENTITY(1,1) NOT NULL,
	[ProjectSpec] [nvarchar](50) NULL,
	[isActive] [bit] NOT NULL,
	[Cre_on] [datetime] NOT NULL,
	[Cre_By] [uniqueidentifier] NOT NULL,
	[Modified_On] [datetime] NULL,
	[Modified_by] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_SubMilestoneConfig] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Master]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Master](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [varchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
	[Cre_on] [datetime] NOT NULL,
	[Cre_By] [uniqueidentifier] NOT NULL,
	[Modified_On] [datetime] NULL,
	[Modified_by] [uniqueidentifier] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (1, N'ABAPTWL - Cleanup of orphaned objects (SI02: AS_ABAP_CLEANUP)', N'Custom Code Adaption', N'Before or during conversion project', N'Mandatory', N'Remove usage of obsolete SAP objects from custom code.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (2, N'ABAPTWL - Dual Stack not supported (SI06: AS_ABAP_DUAL_STACK)', N'Landscape Redesign', N'Before conversion project', N'Mandatory', N'Split your dual stack system into separate ABAP and Java instances.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (3, N'ABAPTWL - SSCR license key procedure is no longer supported (SI03: AS_ABAP_SSCR)', N'Process Design / Blueprint', N'Before or during conversion project', N'Optional', N'Setup control of development activities as recommended in SAP note 2309060 .')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (4, N'ABAPTWL - SSCR license key procedure is no longer supported (SI03: AS_ABAP_SSCR)', N'User Training', N'Before or during conversion project', N'Optional', N'Educate developers about process changes on controlling development activities.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (5, N'ABAPTWL - VM Container not supported (SI04: AS_ABAP_VMCONTAINER)', N'Custom Code Adaption', N'Before or during conversion project', N'Mandatory', N'Remove any VMC usage in your custom applications.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (6, N'S4TWL - ASSET ACCOUNTING (SI2: FIN_AA)', N'Business Decision', N'Before conversion project', N'Mandatory', N'Decide about future ledger approach for asset accounting.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (7, N'S4TWL - ASSET ACCOUNTING (SI2: FIN_AA)', N'Business Operations', N'During conversion project', N'Mandatory', N'Execute year-end and month-end closing activities.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (8, N'S4TWL - ASSET ACCOUNTING (SI2: FIN_AA)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'For required custom code adaption refer to simplification item SI1: FIN_AA and SAP note 2270387.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (9, N'S4TWL - ASSET ACCOUNTING (SI2: FIN_AA)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'Perform customizing and configuration required for preparing the data migration and for the future asset accounting design in SAP S/4HANA.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (10, N'S4TWL - ASSET ACCOUNTING (SI2: FIN_AA)', N'Data cleanup / archiving', N'Before conversion project', N'Optional', N'Reduce number of asset accounting documents to avoid unnecessary data error corrections and to minimize conversion downtime.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (11, N'S4TWL - ASSET ACCOUNTING (SI2: FIN_AA)', N'Data correction', N'Before or during conversion project', N'Mandatory', N'Check and correct inconsistent data which is relevant for the conversion.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (12, N'S4TWL - ASSET ACCOUNTING (SI2: FIN_AA)', N'Data migration', N'During conversion project', N'Mandatory', N'Perform data migration to new SAP S/4HANA data model.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (13, N'S4TWL - ASSET ACCOUNTING (SI2: FIN_AA)', N'Interface Adaption', N'During conversion project', N'Mandatory', N'Adapt or replace obsolete or changed legacy data transfer methods.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (14, N'S4TWL - ASSET ACCOUNTING (SI2: FIN_AA)', N'Process Design / Blueprint', N'Before or during conversion project', N'Mandatory', N'Create blueprint for required Asset Accounting configuration in SAP S/4HANA.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (15, N'S4TWL - ASSET ACCOUNTING (SI2: FIN_AA)', N'User Training', N'During conversion project', N'Mandatory', N'Inform users about changes in Asset Accounting.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (16, N'S4TWL - Amount Field Length Extension (SI8_FIN_GL)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (17, N'S4TWL - Amount Field Length Extension (SI8_FIN_GL)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (18, N'S4TWL - Amount Field Length Extension (SI8_FIN_GL)', N'Software Upgrade / Maintenance', N'During conversion project', N'Conditional', N'Implementation of SAP Notes might be required in case new functionality should not be used')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (19, N'S4TWL - Amount Field Length Extension (SI8_FIN_GL)', N'Software Upgrade / Maintenance', N'During conversion project', N'Conditional', N'Implementation of SAP Notes might be required in case new functionality should be used')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (20, N'S4TWL - Authorization Concept for Supplier Invoice (SI14: PROC_MM_IV_AUTH)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'Users working with supplier invoices, additionally need the authorizations based on M_RECH_BUK')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (21, N'S4TWL - BI Extractors in SAP S/4HANA (SI18: CT_BW_EXTRACTORS)', N'Interface Adaption', N'During conversion project', N'Mandatory', N'Adjust or change BI extractors.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (22, N'S4TWL - BI Extractors in SAP S/4HANA (SI18: CT_BW_EXTRACTORS)', N'New developments', N'During conversion project', N'Optional', N'Develope solutions for obsolete BW extractors')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (23, N'S4TWL - BW Extractors for Dangerous Goods Management and Specification Managemen (SI8: Logistics_PSS)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (24, N'S4TWL - BW Extractors for Dangerous Goods Management and Specification Managemen (SI8: Logistics_PSS)', N'Process Design / Blueprint', N'Before or during conversion project', N'Mandatory', N'The relevant BW extractors and data sources for Dangerous Goods Management and Specification Management are not available within SAP S/4HANA')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (25, N'S4TWL - Batch Input for Customer Master/Supplier Master (SI25: MasterData_BP)', N'Custom Code Adaption', N'Before or during conversion project', N'Conditional', N'Adjust your custom code according to the new process.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (26, N'S4TWL - Batch Input for Customer Master/Supplier Master (SI25: MasterData_BP)', N'Process Design / Blueprint', N'Before conversion project', N'Mandatory', N'Batch Input to maintain customer master and supplier master data is not supported since SAP S/4 HANA 1809, please use one of the following alternatives: Business Partner SOAP Services. Refer to SAP Note 2472030 for more information IDocs (CREMAS/DEBMAS) M')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (27, N'S4TWL - Batch Input for Customer Master/Supplier Master (SI25: MasterData_BP)', N'User Training', N'Before or during conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (28, N'S4TWL - Billing Document Output Management (SI14: SD_BILLING_OM)', N'Business Decision', N'Before conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (29, N'S4TWL - Billing Document Output Management (SI14: SD_BILLING_OM)', N'Custom Code Adaption', N'During conversion project', N'Conditional', N'Apply code changes for S/4HANA to reactive NAST based output control')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (30, N'S4TWL - Billing Document Output Management (SI14: SD_BILLING_OM)', N'Customizing / Configuration', N'During conversion project', N'Conditional', N'Define output types or assign channels.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (31, N'S4TWL - Billing Document Output Management (SI14: SD_BILLING_OM)', N'Process Design / Blueprint', N'During or after conversion project', N'Optional', N'In SAP S/4HANA, a new output management approach has been implemented and is set as the default for newly created billing documents.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (32, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Business Decision', N'Before conversion project', N'Mandatory', N'Before the conversion project you need to make a decision on whether the Business Partner ID and the Customer/Vendor ID should be the same')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (33, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'Adapt your Custom Code as per Note 2265093 "Custom Code Adaption" section')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (34, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'Start the conversion as per BP_Conversion Document.pdf attached to SAP Note 2211312 Note: If the runtime error "Inconsistency in the dictionary for structure "ZT005_GEN" occurs during the SUM execution, execute the process again.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (35, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'Check CVI customizing and trigger necessary changes e.g. missing BP Role Category, Define Number Assignments according to the S/4 Conversion guide chapter Introduce Business Partner Approach (Customer Vendor Integration) (Note 2265093) Check and maintain ')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (36, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Data correction', N'During conversion project', N'Mandatory', N'Implement SAP S/4HANA Conversion Pre-Checks according to the SAP S/4HANA Conversion guide chapter Pre-Checks as per Note 2265093')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (37, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Data correction', N'During conversion project', N'Conditional', N'If the Business Function CA_BP_SO is present in your system -> activate it as per Note 2265093 In case that the Business Function CA_BP_SOA does not yet exist in the system -> you have to create a new Business Function in the customer namespace with the s')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (38, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Data correction', N'During conversion project', N'Mandatory', N'Carry out post-implementation steps as per BP_Conversion Document.pdf attached to SAP Note 2211312 The customer/vendor transformation is bidirectional. You can both process customer/vendor master records from business partner maintenance as well as popula')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (39, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Data correction', N'During conversion project', N'Mandatory', N'Run Business Partner Pre-Check PRECHECK_UPGRADATION_REPORT to verify the results according to the Note 2211312')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (40, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Data correction', N'During conversion project', N'Mandatory', N'Check master data consistency using CVI_MIGRATION_PRECHK and maintain consistency. Check and clean-up customer/vendor data e.g. missing @-sign in the e-mail address.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (41, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Data migration', N'During conversion project', N'Conditional', N'Valid for Retail Sites: Customers and vendors assigned to Retail sites are not handled by CVI synchronization (MDS_LOAD_COCKPIT) on SAP ERP 6.0, but by a specific migration process during SAP S/4HANA conversion. See SAP Note 2310884 for more information')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (42, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Data migration', N'During conversion project', N'Conditional', N'Valid for IS-OIL: In S4HANA all the IS-OIL specific fields (including customer BDRP data fields) have been adapted as per the new Framework of BP. The IS-OIL Fields related to Vendor and Customer now have been moved to BP under the roles FLCU01 (Customer)')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (43, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Data migration', N'During conversion project', N'Mandatory', N'Perform Synchronization (Data load) via Synchronization Cockpit (Note 2265093)')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (44, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'Process Design / Blueprint', N'Before conversion project', N'Mandatory', N'There is a list of transactions that redirect you to the transaction BP, as well as a list of obsolete transactions as per Note 2265093 , adjust your business process accordingly')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (45, N'S4TWL - Business Partner Approach (SI2: MasterData_BP)', N'User Training', N'During conversion project', N'Optional', N'User training to use new transactions for Business Partners in S/4HANA')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (46, N'S4TWL - Business User Management (SI21: BUSINESS_USER)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'Configure update channel for workplace address data If HR integration is active, configure and maintain employee master data')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (47, N'S4TWL - Business User Management (SI21: BUSINESS_USER)', N'Data correction', N'Before or during conversion project', N'Mandatory', N'check user data (as part of general business partner introduction)')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (48, N'S4TWL - Business User Management (SI21: BUSINESS_USER)', N'Data migration', N'During conversion project', N'Mandatory', N'If HR integration is active, run HCM business partner synchronization as described in  HCM simplification SAP Note 2340095 If HR integration is not active, create or upload person data wiht Fiori app "Maintain employee"')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (49, N'S4TWL - Business User Management (SI21: BUSINESS_USER)', N'Fiori Implementation', N'During conversion project', N'Conditional', N'If HR integration is not active, implement Fiori app "Maintain employee"')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (50, N'S4TWL - Business User Management (SI21: BUSINESS_USER)', N'User Training', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (51, N'S4TWL - Changed Interfaces (SI15: CT_Integration)', N'Interface Adaption', N'During conversion project', N'Mandatory', N'Adjust any interfaces that use obsolete RFC.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (52, N'S4TWL - Classic MM-PUR GUI Transactions replacement (SI11: PROC_MM_DYN)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'Replace custom code refering to old BAPIs')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (53, N'S4TWL - Classic MM-PUR GUI Transactions replacement (SI11: PROC_MM_DYN)', N'Customizing / Configuration', N'During conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (54, N'S4TWL - Classic MM-PUR GUI Transactions replacement (SI11: PROC_MM_DYN)', N'User Training', N'During conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (55, N'S4TWL - Conversion to S/4HANA Material Ledger and Actual Costing (SI6: FIN_MISC_ML)', N'Business Operations', N'During conversion project', N'Conditional', N'If Material ledger is already active => complete step "Post closing" for all ML costing runs created before conversion/upgrade')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (56, N'S4TWL - Conversion to S/4HANA Material Ledger and Actual Costing (SI6: FIN_MISC_ML)', N'Customizing / Configuration', N'During conversion project', N'Conditional', N'If actual costing is  active => customize account determination as of SAP S/4HANA 1610')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (57, N'S4TWL - Conversion to S/4HANA Material Ledger and Actual Costing (SI6: FIN_MISC_ML)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (58, N'S4TWL - Conversion to S/4HANA Material Ledger and Actual Costing (SI6: FIN_MISC_ML)', N'Data cleanup / archiving', N'Before conversion project', N'Optional', N'Archiving historic data')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (59, N'S4TWL - Conversion to S/4HANA Material Ledger and Actual Costing (SI6: FIN_MISC_ML)', N'Data correction', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (60, N'S4TWL - Conversion to S/4HANA Material Ledger and Actual Costing (SI6: FIN_MISC_ML)', N'Data migration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (61, N'S4TWL - Conversion to S/4HANA Material Ledger and Actual Costing (SI6: FIN_MISC_ML)', N'Software Upgrade / Maintenance', N'During conversion project', N'Mandatory', N'Implementation of SAP Notes mentioned in SAP Note "2345739" for your corresponding Support Package.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (62, N'S4TWL - Currencies in Universal Journal (SI6_FIN_GL)', N'Business Decision', N'Before conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (63, N'S4TWL - Currencies in Universal Journal (SI6_FIN_GL)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (64, N'S4TWL - Currencies in Universal Journal (SI6_FIN_GL)', N'Process Design / Blueprint', N'During conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (65, N'S4TWL - Currencies in Universal Journal (SI6_FIN_GL)', N'User Training', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (66, N'S4TWL - Custom Fields (SI13: CT_Custom-Fields)', N'Custom Code Adaption', N'During or after conversion project', N'Optional', N'Enable existing CDS extensions to SAP S/4HANA tables for SAP Fiori applications (raised by ATC checks)')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (67, N'S4TWL - Custom Fields (SI13: CT_Custom-Fields)', N'Customizing / Configuration', N'During or after conversion project', N'Optional', N'Preapre and enable Custom Database Fields Usage in SAP Fiori Applications')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (68, N'S4TWL - DATA MODEL CHANGES IN FIN (SI1_FIN_General)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'Adapt access to the new simplified Finance data model in your customer-specific programs')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (69, N'S4TWL - DATA MODEL IN INVENTORY MANAGEMENT (MM-IM) (SI1: Logistics_MM-IM)', N'Business Decision', N'Before conversion project', N'Optional', N'Decide which locking methods to be used for goods movements')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (70, N'S4TWL - DATA MODEL IN INVENTORY MANAGEMENT (MM-IM) (SI1: Logistics_MM-IM)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (71, N'S4TWL - DATA MODEL IN INVENTORY MANAGEMENT (MM-IM) (SI1: Logistics_MM-IM)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (72, N'S4TWL - DATA MODEL IN INVENTORY MANAGEMENT (MM-IM) (SI1: Logistics_MM-IM)', N'Customizing / Configuration', N'During or after conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (73, N'S4TWL - DATA MODEL IN INVENTORY MANAGEMENT (MM-IM) (SI1: Logistics_MM-IM)', N'Technical System Configuration', N'During conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (74, N'S4TWL - Data Model Changes in SD Pricing (SI2: SD_PRIC)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (75, N'S4TWL - Data Model Changes in SD Pricing (SI2: SD_PRIC)', N'Data migration', N'After conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (76, N'S4TWL - Data Model Changes in SD Pricing (SI2: SD_PRIC)', N'Technical System Configuration', N'During conversion project', N'Conditional', N'If pricing table KONV has been enhanced with customer-specific fields, you must ensure that the appended fields are also added to the new structure PRCS_ELEMENTS_DATA.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (77, N'S4TWL - Determination of default values in Intrastat reporting (SI3: FIN_SLL_ISR_DV)', N'Customizing / Configuration', N'After conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (78, N'S4TWL - Determination of default values in Intrastat reporting (SI3: FIN_SLL_ISR_DV)', N'Data correction', N'After conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (79, N'S4TWL - Enterprise Search in SAP Product Lifecycle Management (SAP PLM) (SI1: Logistics_PLM)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'Custom code needs to be adjusted to reference to the new model names')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (80, N'S4TWL - Enterprise Search in SAP Product Lifecycle Management (SAP PLM) (SI1: Logistics_PLM)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'With SAP S/4HANA the Enterprise Search models are now replication free search models (using HANA DB tables instead) within SAP Product Lifecycle Management (SAP PLM). The Enterprise Search models'' names have changed and due to this， the related customizin')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (81, N'S4TWL - FIORI APPLICATIONS FOR SUITE ON HANA ON-PREMISE (SI10: CT_FIORI)', N'Custom Code Adaption', N'During conversion project', N'Conditional', N'if Fiori has been enhanced SAP ERP 6.0, analyze and perform required enhancements in SAP S/4HANA')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (82, N'S4TWL - FIORI APPLICATIONS FOR SUITE ON HANA ON-PREMISE (SI10: CT_FIORI)', N'Fiori Implementation', N'During conversion project', N'Conditional', N'if Fiori is used in SAP ERP 6.0, configure successor apps')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (83, N'S4TWL - FIORI APPLICATIONS FOR SUITE ON HANA ON-PREMISE (SI10: CT_FIORI)', N'User Training', N'During conversion project', N'Conditional', N'train users on new Fiori apps')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (84, N'S4TWL - Foreign Trade fields in Material Master (SI6:MasterData_PM)', N'Business Decision', N'Before conversion project', N'Mandatory', N'In SAP S/4HANA, the Foreign Trade (SD-FT) functionality is not available anymore. Instead, SAP S/4HANA for international trade within SAP S/4HANA is the successor.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (85, N'S4TWL - Foreign Trade fields in Material Master (SI6:MasterData_PM)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (86, N'S4TWL - Foreign Trade fields in Material Master (SI6:MasterData_PM)', N'Customizing / Configuration', N'Before conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (87, N'S4TWL - Foreign Trade fields in Material Master (SI6:MasterData_PM)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'To migrate financial documents in Foreign Trade to Trade Finance, you carry out the migration steps available as Customizing activities (transaction SPRO, SAP Reference IMG) under: Conversion of Accounting to SAP S/4HANA-->Preparations and Migration of Cu')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (88, N'S4TWL - Foreign Trade fields in Material Master (SI6:MasterData_PM)', N'Data cleanup / archiving', N'During conversion project', N'Mandatory', N'You should Run as post conversion activity,  report ZUPDATE_MARC_FOREIGN_TRADE(note 2458666) - to delete the content of the obsolete fileds. This avoids accidental side effects.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (89, N'S4TWL - Foreign Trade fields in Material Master (SI6:MasterData_PM)', N'Implementation project required', N'Before conversion project', N'Mandatory', N'GTS functionality is considerred as a pre-project, plan time and resources for the new implementation.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (90, N'S4TWL - Foreign Trade fields in Material Master (SI6:MasterData_PM)', N'Interface Adaption', N'Before conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (91, N'S4TWL - Foreign Trade fields in Material Master (SI6:MasterData_PM)', N'Process Design / Blueprint', N'Before conversion project', N'Conditional', N'In case relevant SAP GTS needs to be installed, analysis of all foreign trade processes that are currently in use is requiered, before conversion.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (92, N'S4TWL - Foreign Trade fields in Material Master (SI6:MasterData_PM)', N'User Training', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (93, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Business Decision', N'Before conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (94, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (95, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (96, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (97, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Data cleanup / archiving', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (98, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Data correction', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (99, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Data migration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (100, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Fiori Implementation', N'During conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (101, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Implementation project required', N'Before conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (102, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Process Design / Blueprint', N'Before conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (103, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'Process Design / Blueprint', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (104, N'S4TWL - GENERAL LEDGER (SI1_FIN_GL)', N'User Training', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (105, N'S4TWL - Generic Check for SAP S/4HANA Conversion and Upgrade (SI22: GENERIC_CHECKS)', N'Custom Code Adaption', N'Before or during conversion project', N'Mandatory', N'This simplification Item serves as an anchor for assigning custom code check related content, which is not related to any specific functional or technical area (e.g. deletion of unused orphaned objects).')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (106, N'S4TWL - Generic Check for SAP S/4HANA Conversion and Upgrade (SI22: GENERIC_CHECKS)', N'Miscellaneous', N'Before or during conversion project', N'Mandatory', N'This simplification item provides various generic, technical checks which need to run before a conversion or upgrade in SAP S/4HANA and which affect all customers - irrespective of the specific SAP S/4HANA target release.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (107, N'S4TWL - Globalization – Financials (SI1_GSFIN)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (108, N'S4TWL - Globalization – Financials (SI1_GSFIN)', N'Interface Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (109, N'S4TWL - Globalization – Financials (SI1_GSFIN)', N'User Training', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (110, N'S4TWL - Globalization – Logistics (SI1_GSLOG)', N'Custom Code Adaption', N'During conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (111, N'S4TWL - Globalization – Logistics (SI1_GSLOG)', N'Process Design / Blueprint', N'Before or during conversion project', N'Mandatory', N'SAP recommends using the following: •SAP Tax Declaration Framework for Fiscal and Accounting Legal Reporting. •TAXBRA tax procedure for the tax calculation. Note: SAP Tax Declaration Framework is part of the Compatible Add-ons and requires an additional l')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (112, N'S4TWL - Globalization – Logistics (SI1_GSLOG)', N'User Training', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (113, N'S4TWL - Goods movements without exclusive locking by material valuation (SI7: Logistics_MM-IM)', N'Business Decision', N'Before conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (114, N'S4TWL - Goods movements without exclusive locking by material valuation (SI7: Logistics_MM-IM)', N'Customizing / Configuration', N'During conversion project', N'Conditional', N'Set up locking method')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (115, N'S4TWL - JOB SCHEDULING (SI8:CROSS_BC_CCM-BTC)', N'Business Operations', N'During conversion project', N'Mandatory', N'Execute report BTCTRNS2 of SNOTE 2499529')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (116, N'S4TWL - JOB SCHEDULING (SI8:CROSS_BC_CCM-BTC)', N'Software Upgrade / Maintenance', N'During conversion project', N'Optional', N'Implement SAP Notes to prevent automatic execution of new job scheduling.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (117, N'S4TWL - JOB SCHEDULING (SI8:CROSS_BC_CCM-BTC)', N'Software Upgrade / Maintenance', N'During conversion project', N'Optional', N'Implement SAP Notes to prevent automatic execution of new job scheduling.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (118, N'S4TWL - JOB SCHEDULING (SI8:CROSS_BC_CCM-BTC)', N'Technical System Configuration', N'During conversion project', N'Optional', N'Decide if new job scheduling shall be used and adjust parameterization')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (119, N'S4TWL - LEGACY SYSTEM MIGRATION WORKBENCH (SI9: CT_LSMW)', N'Business Decision', N'Before conversion project', N'Optional', N'The use of LSMW is restricted for migrations to SAP S/4HANA. The use of LSMW for data load to SAP S/4HANA is not recommended and at the customer''s own risk. SAP recommends using SAP S/4HANA Migration Cockpit and Migration Object Modeler instead of LSMW.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (120, N'S4TWL - LEGACY SYSTEM MIGRATION WORKBENCH (SI9: CT_LSMW)', N'Interface Adaption', N'During conversion project', N'Conditional', N'If you still plan to use LSMW, provide customer specific adjustments or workarounds for restrictions on certain Batch Input or Direct Input programs.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (121, N'S4TWL - MDM Catalog (SI7: PROC_MDM )', N'Custom Code Adaption', N'During or after conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (122, N'S4TWL - MDM Catalog (SI7: PROC_MDM )', N'Customizing / Configuration', N'Before or after conversion project', N'Mandatory', N'SAP S/4HANA Self-Service Procurement must be used instead of the SAP SRM MDM catalog.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (123, N'S4TWL - MDM Catalog (SI7: PROC_MDM )', N'Data migration', N'During or after conversion project', N'Conditional', N'Set up a business user for SAP S/4HANA Self-Service Procurement.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (124, N'S4TWL - MDM Catalog (SI7: PROC_MDM )', N'Interface Adaption', N'Before or after conversion project', N'Conditional', N'Content needs to be imported into S/4HANA via OCI5')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (125, N'S4TWL - MDM Catalog (SI7: PROC_MDM )', N'Process Design / Blueprint', N'Before conversion project', N'Mandatory', N'The SAP SRM catalog MDM is not available in SAP S/4HANA. It''s replaced by the catalog search function as part of SAP S/4HANA Self-Service Procurement.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (126, N'S4TWL - MDM Catalog (SI7: PROC_MDM )', N'User Training', N'After conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (127, N'S4TWL - MRP in HANA (SI11: Logistics_PP)', N'Business Decision', N'Before or after conversion project', N'Optional', N'MRP Live is going to replace the classic MRP, which is not considered as future technology and therefore will be replaced in the future. You can start using MRP Live at any time, but you should make yourself familiar with details in the section "Business ')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (128, N'S4TWL - MRP in HANA (SI11: Logistics_PP)', N'Custom Code Adaption', N'Before or after conversion project', N'Conditional', N'If your custom code reads data from the tables that are populated by the classic MRP, then it has to be adjusted to the use of MRP live as per SAP Note 2268085. Depending on when you start using MRP live it can be done before or after conversion')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (129, N'S4TWL - MRP in HANA (SI11: Logistics_PP)', N'Process Design / Blueprint', N'Before or after conversion project', N'Conditional', N'If you decide to use MRP live, then re-implement BAdI implementations and extensions of the classic MRP as AMDP BAdIs as per SAP Note 2268085')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (130, N'S4TWL - MRP in HANA (SI11: Logistics_PP)', N'User Training', N'Before conversion project', N'Conditional', N'If you decide to use MRP live, train the users on changes')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (131, N'S4TWL - Material Ledger Obligatory for Material Valuation (SI3: Logistics_MM-IM)', N'Business Operations', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (132, N'S4TWL - Material Ledger Obligatory for Material Valuation (SI3: Logistics_MM-IM)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (133, N'S4TWL - Material Ledger Obligatory for Material Valuation (SI3: Logistics_MM-IM)', N'Data correction', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (134, N'S4TWL - Material Ledger Obligatory for Material Valuation (SI3: Logistics_MM-IM)', N'Data migration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (135, N'S4TWL - Material Ledger Obligatory for Material Valuation (SI3: Logistics_MM-IM)', N'User Training', N'During or after conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (136, N'S4TWL - Material Number Field Length Extension (SI4: MasterData_PM)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'Custom Code related information See SAP Note: 2215424, 2215852')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (137, N'S4TWL - Material Number Field Length Extension (SI4: MasterData_PM)', N'Data migration', N'During conversion project', N'Mandatory', N'ALE change pointer entries related to master data distribution (see SAP Help: LINK) have to be processed completely before the conversion to SAP S/4HANA. Changes recorded before the conversion will no longer be available compatibly after the conversion to')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (138, N'S4TWL - Material Number Field Length Extension (SI4: MasterData_PM)', N'Data migration', N'During conversion project', N'Conditional', N'The Long Material Number within the DIMP Add-On (Discrete Industries & Mill Products) Although the industry solution DIMP is part of SAP S/4HANA, the already existing DIMP LAMA-functionality for a long material number (LAMA) will not be part of SAP S/4HAN')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (139, N'S4TWL - Material Number Field Length Extension (SI4: MasterData_PM)', N'Miscellaneous', N'Before conversion project', N'Optional', N'Conversion Pre-Checks related to Material Number Field Length Extension It´s recommended to execute conversion pre-check (for details see SAP Note: 2216958). For the conversion of selection variants see SAP Note 1696821 for details. Note that code adaptio')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (140, N'S4TWL - Material Number Field Length Extension (SI4: MasterData_PM)', N'Process Design / Blueprint', N'Before or during conversion project', N'Mandatory', N'The default setting, both after the conversion to SAP S/4HANA and for new installations, is that the extended material number functionality is NOT activated. To use a material number with 40 characters, you need to activate this functionality as described')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (141, N'S4TWL - Material Number Field Length Extension (SI4: MasterData_PM)', N'User Training', N'During conversion project', N'Optional', N'Use of new Material Number Field Length ')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (142, N'S4TWL - Material Valuation - Statistical moving average price (SI4: Logistics_MM-IM)', N'Business Decision', N'Before or during conversion project', N'Optional', N'Deactivation of the statistical moving average is not mandatory in SAP S/4HANA, but is nevertheless recommended in order to achieve a significant increase of transactional data throughput for goods movements. It is important to note that the deactivation ')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (143, N'S4TWL - Material Valuation - Statistical moving average price (SI4: Logistics_MM-IM)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (144, N'S4TWL - Material Valuation - Statistical moving average price (SI4: Logistics_MM-IM)', N'Customizing / Configuration', N'During conversion project', N'Conditional', N'The report SAPRCKM_NO_EXCLUSIVELY_LOCKING can be used to deactivate the statistical moving average price.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (145, N'S4TWL - New advanced ATP in SAP S/4HANA – Table VBBS (SI1: Logistics_ATP)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'If you have custom code calling table VBBS, create a db view on table VBBE, and use that view instead of the table VBBS. SAP Note: 2209696')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (146, N'S4TWL - New advanced ATP in SAP S/4HANA – Table VBBS (SI1: Logistics_ATP)', N'Data migration', N'During conversion project', N'Mandatory', N'Manual step only for SAP S/4HANA 1511 and SAP S/4HANA 1610, For SAP S/4HANA 1709 and newer, the necessary actions are automated and executed in SUM phase using identifying name ATP_XPRA_SUITE_TO_S4_V2. SAP  Note: 2209696')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (147, N'S4TWL - OUTPUT MANAGEMENT (SI4: CT_OM)', N'Business Decision', N'Before conversion project', N'Optional', N'Decide if new output management or NAST-based output shall be used.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (148, N'S4TWL - OUTPUT MANAGEMENT (SI4: CT_OM)', N'Custom Code Adaption', N'During conversion project', N'Conditional', N'Replace custom code for previous NAST based output management')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (149, N'S4TWL - OUTPUT MANAGEMENT (SI4: CT_OM)', N'Customizing / Configuration', N'During conversion project', N'Conditional', N'Configure new output management.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (150, N'S4TWL - OUTPUT MANAGEMENT (SI4: CT_OM)', N'Landscape Redesign', N'After conversion project', N'Conditional', N'If new output management is used, setup required technical infrastructure')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (151, N'S4TWL - OUTPUT MANAGEMENT (SI4: CT_OM)', N'Process Design / Blueprint', N'During or after conversion project', N'Conditional', N'Additionally to the existing output management based on NAST a new Output Management solution is adopted S/4 HANA-wide. Thereby a unified solution can be used for all Output Management activities. The existing Output Management solution however still can ')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (152, N'S4TWL - OUTPUT MANAGEMENT (SI4: CT_OM)', N'Technical System Configuration', N'After conversion project', N'Conditional', N'Configure technical infrastructure for new output management')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (153, N'S4TWL - OUTPUT MANAGEMENT (SI4: CT_OM)', N'User Training', N'After conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (154, N'S4TWL - Output Management Adoption in Purchase Order (SI9: PROC_MM_OUTPUT)', N'Business Decision', N'Before conversion project', N'Mandatory', N'Additionally to the existing output management based on NAST a new Output Management solution is adopted S/4 HANA-wide. Thereby a unified solution can be used for all Output Management activities. The existing Output Management solution however still can ')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (155, N'S4TWL - Output Management Adoption in Purchase Order (SI9: PROC_MM_OUTPUT)', N'Custom Code Adaption', N'During conversion project', N'Conditional', N'Replace custom code for previous NAST-based output management.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (156, N'S4TWL - Output Management Adoption in Purchase Order (SI9: PROC_MM_OUTPUT)', N'Customizing / Configuration', N'During conversion project', N'Conditional', N'Configure new output management.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (157, N'S4TWL - Output Management Adoption in Purchase Order (SI9: PROC_MM_OUTPUT)', N'Landscape Redesign', N'After conversion project', N'Conditional', N'If new output management is used, setup required technical infrastructure')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (158, N'S4TWL - Output Management Adoption in Purchase Order (SI9: PROC_MM_OUTPUT)', N'Process Design / Blueprint', N'During or after conversion project', N'Conditional', N'Additionally to the existing output management based on NAST a new Output Management solution is adopted S/4 HANA-wide. Thereby a unified solution can be used for all Output Management activities. The existing Output Management solution however still can ')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (159, N'S4TWL - Output Management Adoption in Purchase Order (SI9: PROC_MM_OUTPUT)', N'Technical System Configuration', N'After conversion project', N'Conditional', N'Configure technical infrastructure for new output management')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (160, N'S4TWL - Output Management Adoption in Purchase Order (SI9: PROC_MM_OUTPUT)', N'User Training', N'After conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (161, N'S4TWL - Planning File (SI12: Logistics_PP)', N'Custom Code Adaption', N'During conversion project', N'Conditional', N'If exist, related custom code has to be adjusted. See SAP Note 2227059')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (162, N'S4TWL - Planning File (SI12: Logistics_PP)', N'Data migration', N'During conversion project', N'Mandatory', N'After the system conversion, you should run report PPH_SETUP_MRPRECORDS to populate the new planning file table with operative MRP records (PP-MRP) and the report PPH_SETUP_MRPRECORDS_SIMU for simulative MRP records (PP-MP-LTP). Alternatively, you can als')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (163, N'S4TWL - Planning Horizon (SI35: Logistics_PP)', N'Custom Code Adaption', N'During conversion project', N'Conditional', N'Customers can build their own planning application using the BAPI BAPI_MATERIAL_PLANNING. The BAPI has got the same planning parameter options as the classical planning transactions. In that context the processing key NETPL cannot be used any more.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (164, N'S4TWL - Planning Horizon (SI35: Logistics_PP)', N'Data cleanup / archiving', N'During conversion project', N'Mandatory', N'If there are still variants for the planning run batch Transactions having the processing key filled with NETPL, these variants have to be deleted.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (165, N'S4TWL - Pricing Data Model Simplification (SI8: PROC_MM_PRICING)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (166, N'S4TWL - Pricing Data Model Simplification (SI8: PROC_MM_PRICING)', N'Data migration', N'After conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (167, N'S4TWL - Pricing Data Model Simplification (SI8: PROC_MM_PRICING)', N'Technical System Configuration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (168, N'S4TWL - Profitability Analysis (SI9: FIN_CO)', N'Business Decision', N'Before conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (169, N'S4TWL - Profitability Analysis (SI9: FIN_CO)', N'Customizing / Configuration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (170, N'S4TWL - Profitability Analysis (SI9: FIN_CO)', N'Implementation project required', N'Before conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (171, N'S4TWL - Profitability Analysis (SI9: FIN_CO)', N'User Training', N'During or after conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (172, N'S4TWL - REPLACED TRANSACTION CODES AND PROGRAMS IN FIN (SI2_FIN_General)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'Adjust or replace custom code refering to obsolete transactions')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (173, N'S4TWL - REPLACED TRANSACTION CODES AND PROGRAMS IN FIN (SI2_FIN_General)', N'Customizing / Configuration', N'During conversion project', N'Optional', N'For certain replacements conifguratios need to be done')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (174, N'S4TWL - REPLACED TRANSACTION CODES AND PROGRAMS IN FIN (SI2_FIN_General)', N'User Training', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (175, N'S4TWL - SAP HANA LIVE REPORTING (SI4_FIN_GL)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'If the customer copied calc views delivered by SAP or created user-defined calc views, check and remove if required')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (176, N'S4TWL - SAP HANA LIVE REPORTING (SI4_FIN_GL)', N'New developments', N'During conversion project', N'Mandatory', N'rebuild all existing reporting scenarios with CDS Views')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (177, N'S4TWL - SD Simplified Data Models (SI1: SD_GENERAL)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (178, N'S4TWL - Side Panel functionality in SAP S/4HANA (on-premise) (SI14: CT_SIDE_PANELS)', N'Fiori Implementation', N'During or after conversion project', N'Optional', N'if obsolete side-panel CHIPS were used, consider Fiori apps as replacement')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (179, N'S4TWL - Side Panel functionality in SAP S/4HANA (on-premise) (SI14: CT_SIDE_PANELS)', N'User Training', N'During or after conversion project', N'Optional', N'train users on new Fiori apps')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (180, N'S4TWL - Simplification of copy/reference handling (SI5: MasterData_PM)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (181, N'S4TWL - Simplification of copy/reference handling (SI5: MasterData_PM)', N'Data migration', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (182, N'S4TWL - Simplified Product Master Tables Related to OMSR Transaction (SI3: MasterData_PM)', N'Customizing / Configuration', N'During conversion project', N'Conditional', N'Configuration necessary, if field selection settings within SAP name space exists')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (183, N'S4TWL - Specification Workbench Adjustments (SI14: Logistics_PSS)', N'User Training', N'Before or during conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (184, N'S4TWL - Summarization Hierarchies in Controlling (SI11: FIN_CO)', N'User Training', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (185, N'S4TWL - Supplier Invoice New Archiving (SI20: PROC_MM_IV_ILM)', N'Business Decision', N'Before conversion project', N'Mandatory', N'Supplier Invoice Archiving does not fully support ILM Integration (with upgade to 1809 ILM Integration is fully supported)')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (186, N'S4TWL - Supplier Invoice New Archiving (SI20: PROC_MM_IV_ILM)', N'Data correction', N'During conversion project', N'Mandatory', N'Implement new BAdIs as indicated in SAP Note 2578291.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (187, N'S4TWL - Supplier Invoice New Archiving (SI20: PROC_MM_IV_ILM)', N'Process Design / Blueprint', N'Before or during conversion project', N'Mandatory', N'Adapt the process due to changes in functionality')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (188, N'S4TWL - Webshops by Internet Sales or Web Channel Experience Management (SI11: SD_IS)', N'Business Decision', N'Before conversion project', N'Mandatory', N'The functionalities SAP Internet Sales, SAP E-Commerce, SAP Web Channel, and SAP Web Channel Experience Management in SD are not supported in SAP S/4HANA and have been replaced by SAP Commerce in SAP S/4HANA 1610.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (189, N'S4TWL - Webshops by Internet Sales or Web Channel Experience Management (SI11: SD_IS)', N'Custom Code Adaption', N'Before or during conversion project', N'Conditional', N'Remove the usages of SAP objects in customer objects for which the custom code check refers to note 2225107 as they will not work anymore')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (190, N'S4TWL - Webshops by Internet Sales or Web Channel Experience Management (SI11: SD_IS)', N'Process Design / Blueprint', N'Before or during conversion project', N'Mandatory', N'See SAP Note 2271161 for the list of unavailable transactions and functionalities. Replacement functionality is SAP Commerce in SAP S/4HANA 1610.')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (191, N'S4TWL - Webshops by Internet Sales or Web Channel Experience Management (SI11: SD_IS)', N'User Training', N'Before or during conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (192, N'S4TWL -Miscellaneous minor functionalities in SD Area (SI16: SD_Miscellaneous minor deprecations in SD Area)', N'Custom Code Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (193, N'S4TWL -Miscellaneous minor functionalities in SD Area (SI16: SD_Miscellaneous minor deprecations in SD Area)', N'Interface Adaption', N'During conversion project', N'Mandatory', N'')
GO
INSERT [dbo].[SAPInput_Activities] ([S_No], [Related Simplification Items], [Activities], [Phase], [Condition], [Additional Information]) VALUES (194, N'S4TWL -Miscellaneous minor functionalities in SD Area (SI16: SD_Miscellaneous minor deprecations in SD Area)', N'User Training', N'During conversion project', N'Optional', N'')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (1, N'S4TWL - Changed Interfaces', N'Change of existing functionality', N'Relevance to be Checked', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2259818', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (2, N'S4TWL - Custom Fields', N'Non-strategic-function (no equivalent yet)', N'Relevance to be Checked (Non-strategic)', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2320132', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (3, N'S4TWL - FIORI APPLICATIONS FOR SUITE ON HANA ON-PREMISE', N'Change of existing functionality', N'Relevance to be Checked', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2288828', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (4, N'S4TWL - OUTPUT MANAGEMENT', N'Non-strategic-function (equivalent exists)', N'Relevant (Non-strategic)', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2470711', N'Item is relevant. DB table ''CVERS'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (5, N'S4TWL - Side Panel functionality in SAP S/4HANA (on-premise)', N'Non-strategic-function (no equivalent yet)', N'Relevance to be Checked (Non-strategic)', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2340424', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (6, N'S4TWL - Webshops by Internet Sales or Web Channel Experience Management', N'Functionality unavailable (equivalent exists)', N'Relevance to be Checked', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2271161', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (7, N'S4TWL - BW Extractors for Dangerous Goods Management and Specification Managemen', N'Functionality unavailable (no equivalent)', N'Relevant', N'Asset Management', N'Environment, Health, and Safety', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267432', N'Item is relevant. DB table ''ROOSOURCE'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (8, N'S4TWL - Specification Workbench Adjustments', N'Change of existing functionality', N'Relevant', N'Asset Management', N'Environment, Health, and Safety', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2439345', N'Item is relevant. DB table ''TCGENV'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (9, N'S4TWL - BI Extractors in SAP S/4HANA', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2500202', N'Item is relevant. DB table ''ROOSOURCE'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (10, N'S4TWL - Batch Input for Customer Master/Supplier Master', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2492904', N'Item is relevant. DB table ''KNA1'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (11, N'S4TWL - Business Partner Approach', N'Change of existing functionality', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2265093', N'Item is relevant. DB table ''LFA1'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (12, N'S4TWL - LEGACY SYSTEM MIGRATION WORKBENCH', N'Non-strategic-function (equivalent exists)', N'Relevant (Non-strategic)', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2287723', N'Item is relevant. DB table ''CVERS'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (13, N'S4TWL - Material Number Field Length Extension', N'Change of existing functionality', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267140', N'Item is relevant. DB table ''MARA'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (14, N'S4TWL - Simplification of copy/reference handling', N'Change of existing functionality', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2330063', N'Item is relevant. DB table ''MARA'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (15, N'S4TWL - Simplified Product Master Tables Related to OMSR Transaction', N'Change of existing functionality', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267138', N'Item is relevant. DB table ''MARA'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (16, N'S4TWL - ASSET ACCOUNTING', N'Change of existing functionality', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270388', N'Item is relevant. DB table ''T093C'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (17, N'S4TWL - Amount Field Length Extension', N'Change of existing functionality', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2628654', N'Item is relevant. DB table ''BSEG'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (18, N'S4TWL - Conversion to S/4HANA Material Ledger and Actual Costing', N'Change of existing functionality', N'Relevant', N'Finance', N'Cost Management and Profitability Analysis', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2352383', N'Item is relevant. DB table ''EKBE'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (19, N'S4TWL - Currencies in Universal Journal', N'Change of existing functionality', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2344012', N'Item is relevant. DB table ''BKPF'' based check. Relevant criteria is ''''>1 '''' and number found is 2 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (20, N'S4TWL - DATA MODEL CHANGES IN FIN', N'Change of existing functionality', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270333', N'Item is relevant. DB table ''BKPF'' based check. Relevant criteria is ''''>100 '''' and number found is 101 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (21, N'S4TWL - Determination of default values in Intrastat reporting', N'Change of existing functionality', N'Relevant', N'Finance', N'Financial Operations', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2468294', N'Item is relevant. DB table ''T605Z'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (22, N'S4TWL - Foreign Trade fields in Material Master', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Finance', N'Enterprise Risk and Compliance', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267225', N'Item is relevant. DB table ''MARC'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (23, N'S4TWL - GENERAL LEDGER', N'Change of existing functionality', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270339', N'Item is relevant. DB table ''BKPF'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (24, N'S4TWL - Globalization – Financials', N'Functionality unavailable (equivalent exists)', N'Relevance to be Checked', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270311', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (25, N'S4TWL - Globalization – Logistics', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Finance', N'Advanced Financial Operations', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270312', N'Item is relevant. DB table ''VARID'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (26, N'S4TWL - Profitability Analysis', N'Change of existing functionality', N'Relevant', N'Finance', N'Cost Management and Profitability Analysis', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2349278', N'Item is relevant. DB table ''TKA00'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (27, N'S4TWL - REPLACED TRANSACTION CODES AND PROGRAMS IN FIN', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2742613', N'Item is relevant. DB table ''BKPF'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (28, N'S4TWL - SAP HANA LIVE REPORTING', N'Functionality unavailable (equivalent exists)', N'Relevance to be Checked', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270382', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (29, N'S4TWL - Summarization Hierarchies in Controlling', N'Change of existing functionality', N'Relevant', N'Finance', N'Cost Management and Profitability Analysis', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2349282', N'Item is relevant. DB table ''TKKR1'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (30, N'ABAPTWL - Cleanup of orphaned objects', N'Functionality unavailable (no equivalent)', N'Relevance to be Checked', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2672757', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (31, N'ABAPTWL - Dual Stack not supported', N'Functionality unavailable (no equivalent)', N'Relevance to be Checked', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2560791', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (32, N'ABAPTWL - SSCR license key procedure is no longer supported', N'Functionality unavailable (equivalent exists)', N'Relevance to be Checked', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2309060', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (33, N'ABAPTWL - VM Container not supported', N'Functionality unavailable (no equivalent)', N'Relevance to be Checked', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2560708', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (34, N'S4TWL - Business User Management', N'Change of existing functionality', N'Relevant', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2570961', N'Item is relevant. DB table ''USR02'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (35, N'S4TWL - Generic Check for SAP S/4HANA Conversion and Upgrade', N'Change of existing functionality', N'Relevant', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2618018', N'Item is relevant. DB table ''T000'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (36, N'S4TWL - JOB SCHEDULING', N'Change of existing functionality', N'Relevant', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2318468', N'Item is relevant. DB table ''CVERS'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (37, N'S4TWL - MRP in HANA', N'Non-strategic-function (equivalent exists)', N'Relevant (Non-strategic)', N'Manufacturing', N'Production Planning', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2268085', N'Item is relevant. DB table ''T001W'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (38, N'S4TWL - Planning File', N'Change of existing functionality', N'Relevant', N'Manufacturing', N'Production Planning', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2268088', N'Item is relevant. DB table ''T001W'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (39, N'S4TWL - Planning Horizon', N'Functionality unavailable (no equivalent)', N'Relevant', N'Manufacturing', N'Production Planning', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270241', N'Item is relevant. DB table ''T001W'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (40, N'ABAPTWL - AS Java not available', N'Functionality unavailable (no equivalent)', N'Relevance to be Checked', N'Others', N'', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2560753', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (41, N'ABAPTWL - Instances without ICM not supported', N'Functionality unavailable (no equivalent)', N'Relevance to be Checked', N'Others', N'', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2560792', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (42, N'ABAPTWL - No support for non simplified system flavour', N'Change of existing functionality', N'Relevance to be Checked', N'Others', N'', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2656503', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (43, N'S4TWL - Enterprise Search in SAP Product Lifecycle Management (SAP PLM)', N'Change of existing functionality', N'Relevance to be Checked', N'R&D/Engineering', N'Product Lifecycle Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267836', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (44, N'S4TWL - Billing Document Output Management', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Sales', N'Order and Contract Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267376', N'Item is relevant. DB table ''VBRK'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (45, N'S4TWL - Data Model Changes in SD Pricing', N'Change of existing functionality', N'Relevant', N'Sales', N'Order and Contract Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267308', N'Item is relevant. DB table ''KONH'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (46, N'S4TWL - SD Simplified Data Models', N'Change of existing functionality', N'Relevant', N'Sales', N'Order and Contract Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267306', N'Item is relevant. DB table ''VBUK'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (47, N'S4TWL -Miscellaneous minor functionalities in SD Area', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Sales', N'Order and Contract Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267395', N'Item is relevant. DB table ''LIKP'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (48, N'S4TWL - Authorization Concept for Supplier Invoice', N'Change of existing functionality', N'Relevant', N'Sourcing and Procurement', N'Invoice Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2271189', N'Item is relevant. DB table ''RBKP'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (49, N'S4TWL - Classic MM-PUR GUI Transactions replacement', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Sourcing and Procurement', N'Operational Procurement', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267449', N'Item is relevant. Transaction '' ME23 ''. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (50, N'S4TWL - MDM Catalog', N'Functionality unavailable (equivalent exists)', N'Relevance to be Checked', N'Sourcing and Procurement', N'Operational Procurement', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2271184', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (51, N'S4TWL - Output Management Adoption in Purchase Order', N'Change of existing functionality', N'Relevant', N'Sourcing and Procurement', N'Operational Procurement', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267444', N'Item is relevant. DB table ''NAST'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (52, N'S4TWL - Pricing Data Model Simplification', N'Change of existing functionality', N'Relevant', N'Sourcing and Procurement', N'Operational Procurement', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267442', N'Item is relevant. DB table ''KONV'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (53, N'S4TWL - Supplier Invoice New Archiving', N'Non-strategic-function (equivalent exists)', N'Relevant (Non-strategic)', N'Sourcing and Procurement', N'Invoice Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2578291', N'Item is relevant. DB table ''RBKP'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (54, N'S4TWL - DATA MODEL IN INVENTORY MANAGEMENT (MM-IM)', N'Change of existing functionality', N'Relevant', N'Supply Chain', N'Inventory', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2206980', N'Item is relevant. DB table ''MSEG'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (55, N'S4TWL - Goods movements without exclusive locking by material valuation', N'Change of existing functionality', N'Relevant', N'Supply Chain', N'Inventory', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2338387', N'Item is relevant. DB table ''MBEW'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (56, N'S4TWL - Material Ledger Obligatory for Material Valuation', N'Change of existing functionality', N'Relevant', N'Supply Chain', N'Inventory', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267834', N'Item is relevant. DB table ''T001K'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (57, N'S4TWL - Material Valuation - Statistical moving average price', N'Functionality unavailable (no equivalent)', N'Relevant', N'Supply Chain', N'Inventory', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267835', N'Item is relevant. DB table ''MBEW'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput_SimplificationReport] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (58, N'S4TWL - New advanced ATP in SAP S/4HANA – Table VBBS', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Supply Chain', N'Advanced Order Promising', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267745', N'Item is relevant. DB table ''TMVF'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
SET IDENTITY_INSERT [dbo].[User_Master] ON 
GO
INSERT [dbo].[User_Master] ([Id], [UserType], [isActive], [Cre_on], [Cre_By], [Modified_On], [Modified_by], [IsDeleted]) VALUES (1, N'Admin', 1, CAST(N'2020-04-11T16:33:55.070' AS DateTime), N'00000000-0000-0000-0000-000000000000', NULL, NULL, 0)
GO
INSERT [dbo].[User_Master] ([Id], [UserType], [isActive], [Cre_on], [Cre_By], [Modified_On], [Modified_by], [IsDeleted]) VALUES (2, N'Consultant', 1, CAST(N'2020-04-11T16:34:30.317' AS DateTime), N'00000000-0000-0000-0000-000000000000', NULL, NULL, 0)
GO
INSERT [dbo].[User_Master] ([Id], [UserType], [isActive], [Cre_on], [Cre_By], [Modified_On], [Modified_by], [IsDeleted]) VALUES (3, N'Customer', 1, CAST(N'2020-04-11T16:34:41.260' AS DateTime), N'00000000-0000-0000-0000-000000000000', NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[User_Master] OFF
GO
ALTER TABLE [dbo].[Consultant] ADD  CONSTRAINT [DF_Consultant_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Consultant] ADD  CONSTRAINT [DF_Consultant_Cre_on]  DEFAULT (getdate()) FOR [Cre_on]
GO
ALTER TABLE [dbo].[Consultant] ADD  CONSTRAINT [DF_Consultant_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Cre_on]  DEFAULT (getdate()) FOR [Cre_on]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Milestone] ADD  CONSTRAINT [DF_Milestone_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Milestone] ADD  CONSTRAINT [DF_Milestone_Cre_on]  DEFAULT (getdate()) FOR [Cre_on]
GO
ALTER TABLE [dbo].[Milestone] ADD  CONSTRAINT [DF_Milestone_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[MilestoneDetails] ADD  CONSTRAINT [DF_MilestoneDetails_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[MilestoneDetails] ADD  CONSTRAINT [DF_MilestoneDetails_Cre_on]  DEFAULT (getdate()) FOR [Cre_on]
GO
ALTER TABLE [dbo].[MilestoneDetails] ADD  CONSTRAINT [DF_MilestoneDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_Cre_on]  DEFAULT (getdate()) FOR [Cre_on]
GO
ALTER TABLE [dbo].[Project] ADD  CONSTRAINT [DF_Project_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProjectDetails] ADD  CONSTRAINT [DF_ProjectDetails_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[ProjectDetails] ADD  CONSTRAINT [DF_ProjectDetails_Cre_on]  DEFAULT (getdate()) FOR [Cre_on]
GO
ALTER TABLE [dbo].[ProjectDetails] ADD  CONSTRAINT [DF_ProjectDetails_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[StageStatus] ADD  CONSTRAINT [DF_StageStatus_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[StageStatus] ADD  CONSTRAINT [DF_StageStatus_Cre_on]  DEFAULT (getdate()) FOR [Cre_on]
GO
ALTER TABLE [dbo].[StageStatus] ADD  CONSTRAINT [DF_StageStatus_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SubMilestoneConfig] ADD  CONSTRAINT [DF_SubMilestoneConfig_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[SubMilestoneConfig] ADD  CONSTRAINT [DF_SubMilestoneConfig_Cre_on]  DEFAULT (getdate()) FOR [Cre_on]
GO
ALTER TABLE [dbo].[SubMilestoneConfig] ADD  CONSTRAINT [DF_SubMilestoneConfig_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[User_Master] ADD  CONSTRAINT [DF_User_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[User_Master] ADD  CONSTRAINT [DF_User_Cre_on]  DEFAULT (getdate()) FOR [Cre_on]
GO
ALTER TABLE [dbo].[User_Master] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Consultant]  WITH CHECK ADD  CONSTRAINT [FK_Consultant_User_Master] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[User_Master] ([Id])
GO
ALTER TABLE [dbo].[Consultant] CHECK CONSTRAINT [FK_Consultant_User_Master]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_User_Master] FOREIGN KEY([UserTypeID])
REFERENCES [dbo].[User_Master] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_User_Master]
GO
ALTER TABLE [dbo].[MilestoneDetails]  WITH CHECK ADD  CONSTRAINT [FK_MilestoneDetails_Milestone] FOREIGN KEY([Milestone_ID])
REFERENCES [dbo].[Milestone] ([ID])
GO
ALTER TABLE [dbo].[MilestoneDetails] CHECK CONSTRAINT [FK_MilestoneDetails_Milestone]
GO
ALTER TABLE [dbo].[MilestoneDetails]  WITH CHECK ADD  CONSTRAINT [FK_MilestoneDetails_Project] FOREIGN KEY([Project_ID])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[MilestoneDetails] CHECK CONSTRAINT [FK_MilestoneDetails_Project]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Consultant] FOREIGN KEY([Consultunt_Id])
REFERENCES [dbo].[Consultant] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Consultant]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_Customer] FOREIGN KEY([Id])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_Customer]
GO
ALTER TABLE [dbo].[ProjectDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProjectDetails_MilestoneDetails] FOREIGN KEY([SubMile_ID])
REFERENCES [dbo].[SubMilestoneConfig] ([Id])
GO
ALTER TABLE [dbo].[ProjectDetails] CHECK CONSTRAINT [FK_ProjectDetails_MilestoneDetails]
GO
ALTER TABLE [dbo].[ProjectDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProjectDetails_Project] FOREIGN KEY([Proj_ID])
REFERENCES [dbo].[Project] ([Id])
GO
ALTER TABLE [dbo].[ProjectDetails] CHECK CONSTRAINT [FK_ProjectDetails_Project]
GO
ALTER TABLE [dbo].[ProjectDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProjectDetails_StageStatus] FOREIGN KEY([StatgeStatus_ID])
REFERENCES [dbo].[StageStatus] ([ID])
GO
ALTER TABLE [dbo].[ProjectDetails] CHECK CONSTRAINT [FK_ProjectDetails_StageStatus]
GO
ALTER TABLE [dbo].[SubMilestoneConfig]  WITH CHECK ADD  CONSTRAINT [FK_SubMilestoneConfig_MilestoneDetails] FOREIGN KEY([MilestoneDetails_ID])
REFERENCES [dbo].[MilestoneDetails] ([Id])
GO
ALTER TABLE [dbo].[SubMilestoneConfig] CHECK CONSTRAINT [FK_SubMilestoneConfig_MilestoneDetails]
GO
/****** Object:  StoredProcedure [dbo].[SP_ReadinessReport]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ReadinessReport]
AS
BEGIN
SELECT
(
SELECT COUNT(*) AS RC  from SAPInput_SimplificationReport WHERE Relevance='Relevance to be Checked') RC,
(
SELECT COUNT(*)AS RC_NON from SAPInput_SimplificationReport Where Relevance='Relevance to be Checked (Non-strategic)')RC_NON,
(
SELECT COUNT(*)AS R_NON from SAPInput_SimplificationReport Where Relevance='Relevant (Non-strategic)')R_NON,
(
SELECT COUNT(*)AS R from SAPInput_SimplificationReport WHERE Relevance='Relevant')R
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SimplificationReport]    Script Date: 4/15/2020 9:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_SimplificationReport] 
	@Type Varchar(50),
	@Input varchar(50)=NULL
AS
BEGIN
	If @Type='GetDropdown'
	BEGIN
	   Select DISTINCT  [LoB/Technology] As LOB  from SAPInput_SimplificationReport 
	END
	IF @Type='ALL'
	BEGIN
		SELECT [LoB/Technology] AS LOB_NAME,COUNT([LoB/Technology])as _Count
		FROM SAPInput_SimplificationReport group by [LoB/Technology] 
	END
	IF @Type='Single'
	BEGIN
	SELECT [LoB/Technology] AS LOB_NAME, count(*) as _Count
	from SAPInput_SimplificationReport WHERE [LoB/Technology]=@Input group by [LoB/Technology] 
		
	END
END
GO
