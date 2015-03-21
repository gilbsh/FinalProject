IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RuleAlerts]') AND type in (N'U'))
    DROP TABLE [dbo].[RuleAlerts]
GO
CREATE TABLE [dbo].[RuleAlerts] (
[DateTime] DATETIME  NOT NULL  
, [Value] VARCHAR(50)  NULL  
, [VehicleId] VARCHAR(50)  NOT NULL  
, [RuleId] VARCHAR(50)  NULL  
, [ParameterName] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[RuleAlerts] ADD CONSTRAINT [RuleAlerts_PK] PRIMARY KEY CLUSTERED (
[DateTime]
, [VehicleId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Parameters]') AND type in (N'U'))
    DROP TABLE [dbo].[Parameters]
GO
CREATE TABLE [dbo].[Parameters] (
[ParameterName] VARCHAR(50)  NOT NULL  
, [ParameterDescription] VARCHAR(5000)  NULL  
)
GO

ALTER TABLE [dbo].[Parameters] ADD CONSTRAINT [Parameters_PK] PRIMARY KEY CLUSTERED (
[ParameterName]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicles]') AND type in (N'U'))
    DROP TABLE [dbo].[Vehicles]
GO
CREATE TABLE [dbo].[Vehicles] (
[VehicleId] VARCHAR(50)  NOT NULL  
, [Manufacturer] VARCHAR(50)  NULL  
, [Model] VARCHAR(50)  NULL  
, [Engine] VARCHAR(50)  NULL  
, [Year] VARCHAR(50)  NULL  
, [CustomerId] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[Vehicles] ADD CONSTRAINT [Vehicles_PK] PRIMARY KEY CLUSTERED (
[VehicleId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rules]') AND type in (N'U'))
    DROP TABLE [dbo].[Rules]
GO
CREATE TABLE [dbo].[Rules] (
[RuleId] VARCHAR(50)  NOT NULL  
, [UserEmail] VARCHAR(50)  NULL  
, [RuleName] VARCHAR(50)  NULL  
, [RuleCondition] VARCHAR(100)  NULL  
)
GO

ALTER TABLE [dbo].[Rules] ADD CONSTRAINT [Rules_PK] PRIMARY KEY CLUSTERED (
[RuleId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RuleConditions]') AND type in (N'U'))
    DROP TABLE [dbo].[RuleConditions]
GO
CREATE TABLE [dbo].[RuleConditions] (
[RuleId] VARCHAR(50)  NOT NULL  
, [ParameterName] VARCHAR(50)  NOT NULL  
, [AggregationType] VARCHAR(50)  NOT NULL  
, [Condition] VARCHAR(50)  NULL  
, [DtcName] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[RuleConditions] ADD CONSTRAINT [RuleConditions_PK] PRIMARY KEY CLUSTERED (
[RuleId]
, [ParameterName]
, [AggregationType]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
    DROP TABLE [dbo].[Users]
GO
CREATE TABLE [dbo].[Users] (
[UserEmail] VARCHAR(50)  NOT NULL  
, [FirstName] VARCHAR(50)  NULL  
, [LastName] VARCHAR(50)  NULL  
, [Password] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[Users] ADD CONSTRAINT [Users_PK] PRIMARY KEY CLUSTERED (
[UserEmail]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GFSData]') AND type in (N'U'))
    DROP TABLE [dbo].[GFSData]
GO
CREATE TABLE [dbo].[GFSData] (
[ID] VARCHAR(50)  NOT NULL  
, [Time] DATETIME  NULL  
, [Speed] REAL  NULL  
, [LatLng] CHAR(10)  NULL  
, [VehicleId] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[GFSData] ADD CONSTRAINT [GFSData_PK] PRIMARY KEY CLUSTERED (
[ID]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
    DROP TABLE [dbo].[Customers]
GO
CREATE TABLE [dbo].[Customers] (
[CustomerId] VARCHAR(50)  NOT NULL  
, [FirstName] VARCHAR(50)  NULL  
, [LastName] VARCHAR(50)  NULL  
, [Email] VARCHAR(50)  NULL  
, [PhoneNumber] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[Customers] ADD CONSTRAINT [Customers_PK] PRIMARY KEY CLUSTERED (
[CustomerId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Treatments]') AND type in (N'U'))
    DROP TABLE [dbo].[Treatments]
GO
CREATE TABLE [dbo].[Treatments] (
[Date] DATETIME  NOT NULL  
, [VehicleId] VARCHAR(50)  NOT NULL  
, [Description] VARCHAR(5000)  NULL  
, [VehicleTotalEngineHours] VARCHAR(50)  NULL  
, [TreatmentType] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[Treatments] ADD CONSTRAINT [Treatments_PK] PRIMARY KEY CLUSTERED (
[Date]
, [VehicleId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PIDData]') AND type in (N'U'))
    DROP TABLE [dbo].[PIDData]
GO
CREATE TABLE [dbo].[PIDData] (
[MessageId] VARCHAR(50)  NOT NULL  
, [Value] VARCHAR(50)  NULL  
, [Time] DATETIME  NULL  
, [DeviceId] VARCHAR(50)  NULL  
, [ParameterName] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[PIDData] ADD CONSTRAINT [PIDData_PK] PRIMARY KEY CLUSTERED (
[MessageId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TreatmentActions]') AND type in (N'U'))
    DROP TABLE [dbo].[TreatmentActions]
GO
CREATE TABLE [dbo].[TreatmentActions] (
[Date] DATETIME  NOT NULL  
, [VehicleId] VARCHAR(50)  NOT NULL  
, [Action] VARCHAR(50)  NULL  
, [Description] VARCHAR(5000)  NULL  
)
GO

ALTER TABLE [dbo].[TreatmentActions] ADD CONSTRAINT [TreatmentActions_PK] PRIMARY KEY CLUSTERED (
[Date]
, [VehicleId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Devices]') AND type in (N'U'))
    DROP TABLE [dbo].[Devices]
GO
CREATE TABLE [dbo].[Devices] (
[DeviceId] VARCHAR(50)  NOT NULL  
, [PurchaseDate] VARCHAR(50)  NULL  
, [VehicleId] VARCHAR(50)  NULL  
, [InitialEngineHours] REAL  NULL  
, [InitialMileage] DOUBLE  NULL  
)
GO

ALTER TABLE [dbo].[Devices] ADD CONSTRAINT [Devices_PK] PRIMARY KEY CLUSTERED (
[DeviceId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DeviceRules]') AND type in (N'U'))
    DROP TABLE [dbo].[DeviceRules]
GO
CREATE TABLE [dbo].[DeviceRules] (
[DeviceId] VARCHAR(50)  NOT NULL  
, [RuleId] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[DeviceRules] ADD CONSTRAINT [DeviceRules_PK] PRIMARY KEY CLUSTERED (
[RuleId]
, [DeviceId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DTCs]') AND type in (N'U'))
    DROP TABLE [dbo].[DTCs]
GO
CREATE TABLE [dbo].[DTCs] (
[DtcName] VARCHAR(50)  NOT NULL  
, [DtcCategory] VARCHAR(50)  NULL  
, [DtcArea] VARCHAR(50)  NULL  
, [DtcFaultCode] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[DTCs] ADD CONSTRAINT [DTCs_PK] PRIMARY KEY CLUSTERED (
[DtcName]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VehicleFaults]') AND type in (N'U'))
    DROP TABLE [dbo].[VehicleFaults]
GO
CREATE TABLE [dbo].[VehicleFaults] (
[FaultId] VARCHAR(50)  NOT NULL  
, [DtcS] VARCHAR(50)  NOT NULL  
, [DeviceId] VARCHAR(50)  NULL  
, [Level] CHAR(10)  NULL  
, [DateTime] DATETIME  NULL  
, [Type] VARCHAR(50)  NULL  
, [DTCStatus] CHAR(10)  NULL  
)
GO

ALTER TABLE [dbo].[VehicleFaults] ADD CONSTRAINT [VehicleFaults_PK] PRIMARY KEY CLUSTERED (
[FaultId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MilegeData]') AND type in (N'U'))
    DROP TABLE [dbo].[MilegeData]
GO
CREATE TABLE [dbo].[MilegeData] (
[IgnitionOn] DATETIME  NULL  
, [IgnitionOff] DATETIME  NULL  
, [Milege ] REAL  NULL  
, [FuelConsumption] REAL  NULL  
, [StartLatLng] VARCHAR(100)  NULL  
, [EndLatLng] VARCHAR(100)  NULL  
, [DeviceId] VARCHAR(50)  NULL  
, [ID] VARCHAR(100)  NOT NULL  
)
GO

ALTER TABLE [dbo].[MilegeData] ADD CONSTRAINT [MilegeData_PK] PRIMARY KEY CLUSTERED (
[ID]
)
GO
GO

ALTER TABLE [dbo].[RuleAlerts] WITH CHECK ADD CONSTRAINT [RuleConditions_RuleAlerts_FK1] FOREIGN KEY (
[ParameterName]
)
REFERENCES [dbo].[RuleConditions] (
[RuleId]
)
ALTER TABLE [dbo].[RuleAlerts] WITH CHECK ADD CONSTRAINT [Rules_RuleAlerts_FK2] FOREIGN KEY (
)
REFERENCES [dbo].[Rules] (
)
ALTER TABLE [dbo].[RuleAlerts] WITH CHECK ADD CONSTRAINT [Vehicles_RuleAlerts_FK1] FOREIGN KEY (
[VehicleId]
)
REFERENCES [dbo].[Vehicles] (
[VehicleId]
)
ALTER TABLE [dbo].[RuleAlerts] WITH CHECK ADD CONSTRAINT [Rules_RuleAlerts_FK1] FOREIGN KEY (
[RuleId]
)
REFERENCES [dbo].[Rules] (
[RuleId]
)
GO

GO

ALTER TABLE [dbo].[Vehicles] WITH CHECK ADD CONSTRAINT [Customers_Vehicles_FK1] FOREIGN KEY (
[CustomerId]
)
REFERENCES [dbo].[Customers] (
[CustomerId]
)
GO

ALTER TABLE [dbo].[Rules] WITH CHECK ADD CONSTRAINT [Users_Rules_FK1] FOREIGN KEY (
[UserEmail]
)
REFERENCES [dbo].[Users] (
[UserEmail]
)
GO

ALTER TABLE [dbo].[RuleConditions] WITH CHECK ADD CONSTRAINT [Parameters_RuleConditions_FK1] FOREIGN KEY (
[ParameterName]
)
REFERENCES [dbo].[Parameters] (
[ParameterName]
)
ALTER TABLE [dbo].[RuleConditions] WITH CHECK ADD CONSTRAINT [DTCs_RuleConditions_FK1] FOREIGN KEY (
[DtcName]
)
REFERENCES [dbo].[DTCs] (
[DtcName]
)
ALTER TABLE [dbo].[RuleConditions] WITH CHECK ADD CONSTRAINT [Rules_RuleConditions_FK1] FOREIGN KEY (
[RuleId]
)
REFERENCES [dbo].[Rules] (
[RuleId]
)
GO

GO

ALTER TABLE [dbo].[GFSData] WITH CHECK ADD CONSTRAINT [Vehicles_GFSData_FK1] FOREIGN KEY (
[VehicleId]
)
REFERENCES [dbo].[Vehicles] (
[VehicleId]
)
GO

GO

ALTER TABLE [dbo].[Treatments] WITH CHECK ADD CONSTRAINT [Vehicles_Treatments_FK1] FOREIGN KEY (
[VehicleId]
)
REFERENCES [dbo].[Vehicles] (
[VehicleId]
)
GO

ALTER TABLE [dbo].[PIDData] WITH CHECK ADD CONSTRAINT [Devices_PIDData_FK1] FOREIGN KEY (
[DeviceId]
)
REFERENCES [dbo].[Devices] (
[DeviceId]
)
ALTER TABLE [dbo].[PIDData] WITH CHECK ADD CONSTRAINT [Parameters_PIDData_FK1] FOREIGN KEY (
[ParameterName]
)
REFERENCES [dbo].[Parameters] (
[ParameterName]
)
GO

ALTER TABLE [dbo].[TreatmentActions] WITH CHECK ADD CONSTRAINT [Treatments_TreatmentActions_FK1] FOREIGN KEY (
[Date]
, [VehicleId]
)
REFERENCES [dbo].[Treatments] (
[Date]
, [VehicleId]
)
GO

ALTER TABLE [dbo].[Devices] WITH CHECK ADD CONSTRAINT [Vehicles_Devices_FK1] FOREIGN KEY (
[VehicleId]
)
REFERENCES [dbo].[Vehicles] (
[VehicleId]
)
GO

ALTER TABLE [dbo].[DeviceRules] WITH CHECK ADD CONSTRAINT [Devices_DeviceRules_FK1] FOREIGN KEY (
[DeviceId]
)
REFERENCES [dbo].[Devices] (
[DeviceId]
)
ALTER TABLE [dbo].[DeviceRules] WITH CHECK ADD CONSTRAINT [Rules_DeviceRules_FK1] FOREIGN KEY (
[RuleId]
)
REFERENCES [dbo].[Rules] (
[RuleId]
)
GO

GO

ALTER TABLE [dbo].[VehicleFaults] WITH CHECK ADD CONSTRAINT [Devices_VehicleFaults_FK1] FOREIGN KEY (
[DeviceId]
)
REFERENCES [dbo].[Devices] (
[DeviceId]
)
ALTER TABLE [dbo].[VehicleFaults] WITH CHECK ADD CONSTRAINT [DTCs_VehicleFaults_FK1] FOREIGN KEY (
[DtcS]
)
REFERENCES [dbo].[DTCs] (
[DtcName]
)
GO

ALTER TABLE [dbo].[MilegeData] WITH CHECK ADD CONSTRAINT [Devices_MilegeData_FK1] FOREIGN KEY (
[DeviceId]
)
REFERENCES [dbo].[Devices] (
[DeviceId]
)
GO

