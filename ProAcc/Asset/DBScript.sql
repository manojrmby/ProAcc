USE [ProAcc]
GO
/****** Object:  StoredProcedure [dbo].[SP_SimplificationReport]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP PROCEDURE [dbo].[SP_SimplificationReport]
GO
/****** Object:  StoredProcedure [dbo].[SP_ReadinessReport]    Script Date: 4/14/2020 12:08:46 PM ******/
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
/****** Object:  Table [dbo].[User_Master]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP TABLE [dbo].[User_Master]
GO
/****** Object:  Table [dbo].[SubMilestoneConfig]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP TABLE [dbo].[SubMilestoneConfig]
GO
/****** Object:  Table [dbo].[StageStatus]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP TABLE [dbo].[StageStatus]
GO
/****** Object:  Table [dbo].[SAPInput]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP TABLE [dbo].[SAPInput]
GO
/****** Object:  Table [dbo].[ProjectDetails]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP TABLE [dbo].[ProjectDetails]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP TABLE [dbo].[Project]
GO
/****** Object:  Table [dbo].[MilestoneDetails]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP TABLE [dbo].[MilestoneDetails]
GO
/****** Object:  Table [dbo].[Milestone]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP TABLE [dbo].[Milestone]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP TABLE [dbo].[Customer]
GO
/****** Object:  Table [dbo].[Consultant]    Script Date: 4/14/2020 12:08:46 PM ******/
DROP TABLE [dbo].[Consultant]
GO
/****** Object:  Table [dbo].[Consultant]    Script Date: 4/14/2020 12:08:46 PM ******/
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
/****** Object:  Table [dbo].[Customer]    Script Date: 4/14/2020 12:08:46 PM ******/
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
/****** Object:  Table [dbo].[Milestone]    Script Date: 4/14/2020 12:08:46 PM ******/
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
/****** Object:  Table [dbo].[MilestoneDetails]    Script Date: 4/14/2020 12:08:46 PM ******/
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
/****** Object:  Table [dbo].[Project]    Script Date: 4/14/2020 12:08:46 PM ******/
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
/****** Object:  Table [dbo].[ProjectDetails]    Script Date: 4/14/2020 12:08:46 PM ******/
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
/****** Object:  Table [dbo].[SAPInput]    Script Date: 4/14/2020 12:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAPInput](
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
/****** Object:  Table [dbo].[StageStatus]    Script Date: 4/14/2020 12:08:46 PM ******/
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
/****** Object:  Table [dbo].[SubMilestoneConfig]    Script Date: 4/14/2020 12:08:46 PM ******/
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
/****** Object:  Table [dbo].[User_Master]    Script Date: 4/14/2020 12:08:46 PM ******/
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
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (1, N'S4TWL - Changed Interfaces', N'Change of existing functionality', N'Relevance to be Checked', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2259818', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (2, N'S4TWL - Custom Fields', N'Non-strategic-function (no equivalent yet)', N'Relevance to be Checked (Non-strategic)', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2320132', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (3, N'S4TWL - FIORI APPLICATIONS FOR SUITE ON HANA ON-PREMISE', N'Change of existing functionality', N'Relevance to be Checked', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2288828', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (4, N'S4TWL - OUTPUT MANAGEMENT', N'Non-strategic-function (equivalent exists)', N'Relevant (Non-strategic)', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2470711', N'Item is relevant. DB table ''CVERS'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (5, N'S4TWL - Side Panel functionality in SAP S/4HANA (on-premise)', N'Non-strategic-function (no equivalent yet)', N'Relevance to be Checked (Non-strategic)', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2340424', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (6, N'S4TWL - Webshops by Internet Sales or Web Channel Experience Management', N'Functionality unavailable (equivalent exists)', N'Relevance to be Checked', N'Application Platform and Infrastructure', N'Process Management and Integration', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2271161', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (7, N'S4TWL - BW Extractors for Dangerous Goods Management and Specification Managemen', N'Functionality unavailable (no equivalent)', N'Relevant', N'Asset Management', N'Environment, Health, and Safety', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267432', N'Item is relevant. DB table ''ROOSOURCE'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (8, N'S4TWL - Specification Workbench Adjustments', N'Change of existing functionality', N'Relevant', N'Asset Management', N'Environment, Health, and Safety', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2439345', N'Item is relevant. DB table ''TCGENV'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (9, N'S4TWL - BI Extractors in SAP S/4HANA', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2500202', N'Item is relevant. DB table ''ROOSOURCE'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (10, N'S4TWL - Batch Input for Customer Master/Supplier Master', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2492904', N'Item is relevant. DB table ''KNA1'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (11, N'S4TWL - Business Partner Approach', N'Change of existing functionality', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2265093', N'Item is relevant. DB table ''LFA1'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (12, N'S4TWL - LEGACY SYSTEM MIGRATION WORKBENCH', N'Non-strategic-function (equivalent exists)', N'Relevant (Non-strategic)', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2287723', N'Item is relevant. DB table ''CVERS'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (13, N'S4TWL - Material Number Field Length Extension', N'Change of existing functionality', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267140', N'Item is relevant. DB table ''MARA'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (14, N'S4TWL - Simplification of copy/reference handling', N'Change of existing functionality', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2330063', N'Item is relevant. DB table ''MARA'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (15, N'S4TWL - Simplified Product Master Tables Related to OMSR Transaction', N'Change of existing functionality', N'Relevant', N'Database and Data Management', N'Enterprise Information Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267138', N'Item is relevant. DB table ''MARA'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (16, N'S4TWL - ASSET ACCOUNTING', N'Change of existing functionality', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270388', N'Item is relevant. DB table ''T093C'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (17, N'S4TWL - Amount Field Length Extension', N'Change of existing functionality', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2628654', N'Item is relevant. DB table ''BSEG'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (18, N'S4TWL - Conversion to S/4HANA Material Ledger and Actual Costing', N'Change of existing functionality', N'Relevant', N'Finance', N'Cost Management and Profitability Analysis', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2352383', N'Item is relevant. DB table ''EKBE'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (19, N'S4TWL - Currencies in Universal Journal', N'Change of existing functionality', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2344012', N'Item is relevant. DB table ''BKPF'' based check. Relevant criteria is ''''>1 '''' and number found is 2 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (20, N'S4TWL - DATA MODEL CHANGES IN FIN', N'Change of existing functionality', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270333', N'Item is relevant. DB table ''BKPF'' based check. Relevant criteria is ''''>100 '''' and number found is 101 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (21, N'S4TWL - Determination of default values in Intrastat reporting', N'Change of existing functionality', N'Relevant', N'Finance', N'Financial Operations', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2468294', N'Item is relevant. DB table ''T605Z'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (22, N'S4TWL - Foreign Trade fields in Material Master', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Finance', N'Enterprise Risk and Compliance', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267225', N'Item is relevant. DB table ''MARC'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (23, N'S4TWL - GENERAL LEDGER', N'Change of existing functionality', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270339', N'Item is relevant. DB table ''BKPF'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (24, N'S4TWL - Globalization – Financials', N'Functionality unavailable (equivalent exists)', N'Relevance to be Checked', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270311', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (25, N'S4TWL - Globalization – Logistics', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Finance', N'Advanced Financial Operations', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270312', N'Item is relevant. DB table ''VARID'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (26, N'S4TWL - Profitability Analysis', N'Change of existing functionality', N'Relevant', N'Finance', N'Cost Management and Profitability Analysis', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2349278', N'Item is relevant. DB table ''TKA00'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (27, N'S4TWL - REPLACED TRANSACTION CODES AND PROGRAMS IN FIN', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2742613', N'Item is relevant. DB table ''BKPF'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (28, N'S4TWL - SAP HANA LIVE REPORTING', N'Functionality unavailable (equivalent exists)', N'Relevance to be Checked', N'Finance', N'Accounting and Financial Close', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270382', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (29, N'S4TWL - Summarization Hierarchies in Controlling', N'Change of existing functionality', N'Relevant', N'Finance', N'Cost Management and Profitability Analysis', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2349282', N'Item is relevant. DB table ''TKKR1'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (30, N'ABAPTWL - Cleanup of orphaned objects', N'Functionality unavailable (no equivalent)', N'Relevance to be Checked', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2672757', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (31, N'ABAPTWL - Dual Stack not supported', N'Functionality unavailable (no equivalent)', N'Relevance to be Checked', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2560791', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (32, N'ABAPTWL - SSCR license key procedure is no longer supported', N'Functionality unavailable (equivalent exists)', N'Relevance to be Checked', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2309060', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (33, N'ABAPTWL - VM Container not supported', N'Functionality unavailable (no equivalent)', N'Relevance to be Checked', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2560708', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (34, N'S4TWL - Business User Management', N'Change of existing functionality', N'Relevant', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2570961', N'Item is relevant. DB table ''USR02'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (35, N'S4TWL - Generic Check for SAP S/4HANA Conversion and Upgrade', N'Change of existing functionality', N'Relevant', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2618018', N'Item is relevant. DB table ''T000'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (36, N'S4TWL - JOB SCHEDULING', N'Change of existing functionality', N'Relevant', N'IT Management', N'Administration and Usability', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2318468', N'Item is relevant. DB table ''CVERS'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (37, N'S4TWL - MRP in HANA', N'Non-strategic-function (equivalent exists)', N'Relevant (Non-strategic)', N'Manufacturing', N'Production Planning', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2268085', N'Item is relevant. DB table ''T001W'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (38, N'S4TWL - Planning File', N'Change of existing functionality', N'Relevant', N'Manufacturing', N'Production Planning', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2268088', N'Item is relevant. DB table ''T001W'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (39, N'S4TWL - Planning Horizon', N'Functionality unavailable (no equivalent)', N'Relevant', N'Manufacturing', N'Production Planning', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2270241', N'Item is relevant. DB table ''T001W'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (40, N'ABAPTWL - AS Java not available', N'Functionality unavailable (no equivalent)', N'Relevance to be Checked', N'Others', N'', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2560753', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (41, N'ABAPTWL - Instances without ICM not supported', N'Functionality unavailable (no equivalent)', N'Relevance to be Checked', N'Others', N'', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2560792', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (42, N'ABAPTWL - No support for non simplified system flavour', N'Change of existing functionality', N'Relevance to be Checked', N'Others', N'', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2656503', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (43, N'S4TWL - Enterprise Search in SAP Product Lifecycle Management (SAP PLM)', N'Change of existing functionality', N'Relevance to be Checked', N'R&D/Engineering', N'Product Lifecycle Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267836', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (44, N'S4TWL - Billing Document Output Management', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Sales', N'Order and Contract Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267376', N'Item is relevant. DB table ''VBRK'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (45, N'S4TWL - Data Model Changes in SD Pricing', N'Change of existing functionality', N'Relevant', N'Sales', N'Order and Contract Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267308', N'Item is relevant. DB table ''KONH'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (46, N'S4TWL - SD Simplified Data Models', N'Change of existing functionality', N'Relevant', N'Sales', N'Order and Contract Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267306', N'Item is relevant. DB table ''VBUK'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (47, N'S4TWL -Miscellaneous minor functionalities in SD Area', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Sales', N'Order and Contract Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267395', N'Item is relevant. DB table ''LIKP'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (48, N'S4TWL - Authorization Concept for Supplier Invoice', N'Change of existing functionality', N'Relevant', N'Sourcing and Procurement', N'Invoice Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2271189', N'Item is relevant. DB table ''RBKP'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (49, N'S4TWL - Classic MM-PUR GUI Transactions replacement', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Sourcing and Procurement', N'Operational Procurement', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267449', N'Item is relevant. Transaction '' ME23 ''. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (50, N'S4TWL - MDM Catalog', N'Functionality unavailable (equivalent exists)', N'Relevance to be Checked', N'Sourcing and Procurement', N'Operational Procurement', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2271184', N'Relevance cannot be determined. Please execute this check manually.')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (51, N'S4TWL - Output Management Adoption in Purchase Order', N'Change of existing functionality', N'Relevant', N'Sourcing and Procurement', N'Operational Procurement', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267444', N'Item is relevant. DB table ''NAST'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (52, N'S4TWL - Pricing Data Model Simplification', N'Change of existing functionality', N'Relevant', N'Sourcing and Procurement', N'Operational Procurement', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267442', N'Item is relevant. DB table ''KONV'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (53, N'S4TWL - Supplier Invoice New Archiving', N'Non-strategic-function (equivalent exists)', N'Relevant (Non-strategic)', N'Sourcing and Procurement', N'Invoice Management', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2578291', N'Item is relevant. DB table ''RBKP'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (54, N'S4TWL - DATA MODEL IN INVENTORY MANAGEMENT (MM-IM)', N'Change of existing functionality', N'Relevant', N'Supply Chain', N'Inventory', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2206980', N'Item is relevant. DB table ''MSEG'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (55, N'S4TWL - Goods movements without exclusive locking by material valuation', N'Change of existing functionality', N'Relevant', N'Supply Chain', N'Inventory', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2338387', N'Item is relevant. DB table ''MBEW'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (56, N'S4TWL - Material Ledger Obligatory for Material Valuation', N'Change of existing functionality', N'Relevant', N'Supply Chain', N'Inventory', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267834', N'Item is relevant. DB table ''T001K'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (57, N'S4TWL - Material Valuation - Statistical moving average price', N'Functionality unavailable (no equivalent)', N'Relevant', N'Supply Chain', N'Inventory', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267835', N'Item is relevant. DB table ''MBEW'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
GO
INSERT [dbo].[SAPInput] ([S_No], [Title], [Category], [Relevance], [LoB/Technology], [Business Area], [Consistency Status], [Manual Status], [SAP Notes], [Relevance Summary]) VALUES (58, N'S4TWL - New advanced ATP in SAP S/4HANA – Table VBBS', N'Functionality unavailable (equivalent exists)', N'Relevant', N'Supply Chain', N'Advanced Order Promising', N'N/A', N'New', N'https://launchpad.support.sap.com/#/notes/2267745', N'Item is relevant. DB table ''TMVF'' based check. Relevant criteria is ''''>0 '''' and number found is 1 .')
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
/****** Object:  StoredProcedure [dbo].[SP_ReadinessReport]    Script Date: 4/14/2020 12:08:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_ReadinessReport]
AS
BEGIN
SELECT
(
SELECT COUNT(*) AS RC  from SAPInput WHERE Relevance='Relevance to be Checked') RC,
(
SELECT COUNT(*)AS RC_NON from SAPInput Where Relevance='Relevance to be Checked (Non-strategic)')RC_NON,
(
SELECT COUNT(*)AS R_NON from SAPInput Where Relevance='Relevant (Non-strategic)')R_NON,
(
SELECT COUNT(*)AS R from SAPInput WHERE Relevance='Relevant')R
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SimplificationReport]    Script Date: 4/14/2020 12:08:46 PM ******/
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
	   Select DISTINCT  [LoB/Technology] As LOB  from SAPInput 
	END
	IF @Type='ALL'
	BEGIN
		SELECT [LoB/Technology] AS LOB_NAME,COUNT([LoB/Technology])as _Count
		FROM SAPInput group by [LoB/Technology] 
	END
	IF @Type='Single'
	BEGIN
	SELECT [LoB/Technology] AS LOB_NAME, count(*) as _Count
	from SAPInput WHERE [LoB/Technology]=@Input group by [LoB/Technology] 
		
	END
END
GO
