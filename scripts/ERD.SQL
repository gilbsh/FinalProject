IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MonitorAlertDetils]') AND type in (N'U'))
    DROP TABLE [dbo].[MonitorAlertDetils]
GO
CREATE TABLE [dbo].[MonitorAlertDetils] (
[DateTime] DATETIME  NOT NULL  
, [Value] VARCHAR(50)  NULL  
, [RunTime] DATETIME  NOT NULL  
, [MonitorId] VARCHAR(50)  NOT NULL  
, [VehicleId] VARCHAR(50)  NOT NULL  
, [ParameterId] VARCHAR(50)  NOT NULL  
, [AggregationType] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[MonitorAlertDetils] ADD CONSTRAINT [MonitorAlertDetils_PK] PRIMARY KEY CLUSTERED (
[MonitorId]
, [RunTime]
, [DateTime]
, [VehicleId]
, [ParameterId]
, [AggregationType]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Parameter]') AND type in (N'U'))
    DROP TABLE [dbo].[Parameter]
GO
CREATE TABLE [dbo].[Parameter] (
[ParameterId] VARCHAR(50)  NOT NULL  
, [ParameterName] VARCHAR(50)  NULL  
, [ParameterDescription] CHAR(5000)  NULL  
)
GO

ALTER TABLE [dbo].[Parameter] ADD CONSTRAINT [Parameter_PK] PRIMARY KEY CLUSTERED (
[ParameterId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehicle]') AND type in (N'U'))
    DROP TABLE [dbo].[Vehicle]
GO
CREATE TABLE [dbo].[Vehicle] (
[VehicleId] VARCHAR(50)  NOT NULL  
, [Manufacturer] VARCHAR(50)  NULL  
, [Model] VARCHAR(50)  NULL  
, [Engine] VARCHAR(50)  NULL  
, [Year] VARCHAR(50)  NULL  
, [CustomerId] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[Vehicle] ADD CONSTRAINT [Vehicle_PK] PRIMARY KEY CLUSTERED (
[VehicleId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Monitor]') AND type in (N'U'))
    DROP TABLE [dbo].[Monitor]
GO
CREATE TABLE [dbo].[Monitor] (
[MonitorId] VARCHAR(50)  NOT NULL  
, [UserEmail] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[Monitor] ADD CONSTRAINT [Monitor_PK] PRIMARY KEY CLUSTERED (
[MonitorId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MonitorConditions]') AND type in (N'U'))
    DROP TABLE [dbo].[MonitorConditions]
GO
CREATE TABLE [dbo].[MonitorConditions] (
[MonitorId] VARCHAR(50)  NOT NULL  
, [ParameterId] VARCHAR(50)  NOT NULL  
, [AggregationType] VARCHAR(50)  NOT NULL  
, [Condition] VARCHAR(50)  NULL  
, [DtcName] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[MonitorConditions] ADD CONSTRAINT [MonitorConditions_PK] PRIMARY KEY CLUSTERED (
[MonitorId]
, [ParameterId]
, [AggregationType]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
    DROP TABLE [dbo].[User]
GO
CREATE TABLE [dbo].[User] (
[UserEmail] VARCHAR(50)  NOT NULL  
, [FirstName] VARCHAR(50)  NULL  
, [LastName] VARCHAR(50)  NULL  
, [Phone] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[User] ADD CONSTRAINT [User_PK] PRIMARY KEY CLUSTERED (
[UserEmail]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
    DROP TABLE [dbo].[Customer]
GO
CREATE TABLE [dbo].[Customer] (
[CustomerId] VARCHAR(50)  NOT NULL  
, [FirstName] VARCHAR(50)  NULL  
, [LastName] VARCHAR(50)  NULL  
, [Email] VARCHAR(50)  NULL  
, [PhoneNumber] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [Customer_PK] PRIMARY KEY CLUSTERED (
[CustomerId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Treatment]') AND type in (N'U'))
    DROP TABLE [dbo].[Treatment]
GO
CREATE TABLE [dbo].[Treatment] (
[Date] DATETIME  NOT NULL  
, [VehicleId] VARCHAR(50)  NOT NULL  
, [Description] VARCHAR(5000)  NULL  
, [VehicleTotalEngineHours] VARCHAR(50)  NULL  
, [TreatmentType] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[Treatment] ADD CONSTRAINT [Treatment_PK] PRIMARY KEY CLUSTERED (
[Date]
, [VehicleId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RealTimeData]') AND type in (N'U'))
    DROP TABLE [dbo].[RealTimeData]
GO
CREATE TABLE [dbo].[RealTimeData] (
[MessageId] VARCHAR(50)  NOT NULL  
, [Value] VARCHAR(50)  NULL  
, [Time] DATETIME  NULL  
, [DeviceId] VARCHAR(50)  NULL  
, [ParameterId] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[RealTimeData] ADD CONSTRAINT [RealTimeData_PK] PRIMARY KEY CLUSTERED (
[MessageId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TreatmentAction]') AND type in (N'U'))
    DROP TABLE [dbo].[TreatmentAction]
GO
CREATE TABLE [dbo].[TreatmentAction] (
[Date] DATETIME  NOT NULL  
, [VehicleId] VARCHAR(50)  NOT NULL  
, [Action] VARCHAR(50)  NULL  
, [Description] VARCHAR(5000)  NULL  
)
GO

ALTER TABLE [dbo].[TreatmentAction] ADD CONSTRAINT [TreatmentAction_PK] PRIMARY KEY CLUSTERED (
[Date]
, [VehicleId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Device]') AND type in (N'U'))
    DROP TABLE [dbo].[Device]
GO
CREATE TABLE [dbo].[Device] (
[DeviceId] VARCHAR(50)  NOT NULL  
, [PurchaseDate] VARCHAR(50)  NULL  
, [VehicleId] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[Device] ADD CONSTRAINT [Device_PK] PRIMARY KEY CLUSTERED (
[DeviceId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VehicleDailyAggregation]') AND type in (N'U'))
    DROP TABLE [dbo].[VehicleDailyAggregation]
GO
CREATE TABLE [dbo].[VehicleDailyAggregation] (
[VehicleId] VARCHAR(50)  NOT NULL  
, [Date] DATETIME  NOT NULL  
, [ParameterId] VARCHAR(50)  NOT NULL  
, [AggregationType] VARCHAR(50)  NOT NULL  
, [Value] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[VehicleDailyAggregation] ADD CONSTRAINT [VehicleDailyAggregation_PK] PRIMARY KEY CLUSTERED (
[VehicleId]
, [Date]
, [ParameterId]
, [AggregationType]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DTC]') AND type in (N'U'))
    DROP TABLE [dbo].[DTC]
GO
CREATE TABLE [dbo].[DTC] (
[DtcName] VARCHAR(50)  NOT NULL  
, [DtcCategory] VARCHAR(50)  NULL  
, [DtcArea] VARCHAR(50)  NULL  
, [DtcFaultCode] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[DTC] ADD CONSTRAINT [DTC_PK] PRIMARY KEY CLUSTERED (
[DtcName]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MonitorAlert]') AND type in (N'U'))
    DROP TABLE [dbo].[MonitorAlert]
GO
CREATE TABLE [dbo].[MonitorAlert] (
[RunTime] DATETIME  NOT NULL  
, [MonitorId] VARCHAR(50)  NOT NULL  
)
GO

ALTER TABLE [dbo].[MonitorAlert] ADD CONSTRAINT [MonitorAlert_PK] PRIMARY KEY CLUSTERED (
[RunTime]
, [MonitorId]
)
GO
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VehicleFault]') AND type in (N'U'))
    DROP TABLE [dbo].[VehicleFault]
GO
CREATE TABLE [dbo].[VehicleFault] (
[FaultId] VARCHAR(50)  NOT NULL  
, [DtcName] VARCHAR(50)  NOT NULL  
, [Date] DATETIME  NULL  
, [DeviceId] VARCHAR(50)  NULL  
)
GO

ALTER TABLE [dbo].[VehicleFault] ADD CONSTRAINT [VehicleFault_PK] PRIMARY KEY CLUSTERED (
[FaultId]
)
GO
GO

ALTER TABLE [dbo].[MonitorAlertDetils] WITH CHECK ADD CONSTRAINT [MonitorAlert_MonitorAlertDetils_FK1] FOREIGN KEY (
[RunTime]
, [MonitorId]
)
REFERENCES [dbo].[MonitorAlert] (
[RunTime]
, [MonitorId]
)
ALTER TABLE [dbo].[MonitorAlertDetils] WITH CHECK ADD CONSTRAINT [MonitorConditions_MonitorAlertDetils_FK1] FOREIGN KEY (
[MonitorId]
, [ParameterId]
, [AggregationType]
)
REFERENCES [dbo].[MonitorConditions] (
[MonitorId]
, [ParameterId]
, [AggregationType]
)
ALTER TABLE [dbo].[MonitorAlertDetils] WITH CHECK ADD CONSTRAINT [Vehicle_MonitorAlertDetils_FK1] FOREIGN KEY (
[VehicleId]
)
REFERENCES [dbo].[Vehicle] (
[VehicleId]
)
GO

GO

ALTER TABLE [dbo].[Vehicle] WITH CHECK ADD CONSTRAINT [Customer_Vehicle_FK1] FOREIGN KEY (
[CustomerId]
)
REFERENCES [dbo].[Customer] (
[CustomerId]
)
GO

ALTER TABLE [dbo].[Monitor] WITH CHECK ADD CONSTRAINT [User_Monitor_FK1] FOREIGN KEY (
[UserEmail]
)
REFERENCES [dbo].[User] (
[UserEmail]
)
GO

ALTER TABLE [dbo].[MonitorConditions] WITH CHECK ADD CONSTRAINT [Parameter_MonitorConditions_FK1] FOREIGN KEY (
[ParameterId]
)
REFERENCES [dbo].[Parameter] (
[ParameterId]
)
ALTER TABLE [dbo].[MonitorConditions] WITH CHECK ADD CONSTRAINT [DTC_MonitorConditions_FK1] FOREIGN KEY (
[DtcName]
)
REFERENCES [dbo].[DTC] (
[DtcName]
)
ALTER TABLE [dbo].[MonitorConditions] WITH CHECK ADD CONSTRAINT [Monitor_MonitorConditions_FK1] FOREIGN KEY (
[MonitorId]
)
REFERENCES [dbo].[Monitor] (
[MonitorId]
)
GO

GO

GO

ALTER TABLE [dbo].[Treatment] WITH CHECK ADD CONSTRAINT [Vehicle_Treatment_FK1] FOREIGN KEY (
[VehicleId]
)
REFERENCES [dbo].[Vehicle] (
[VehicleId]
)
GO

ALTER TABLE [dbo].[RealTimeData] WITH CHECK ADD CONSTRAINT [Device_RealTimeData_FK1] FOREIGN KEY (
[DeviceId]
)
REFERENCES [dbo].[Device] (
[DeviceId]
)
ALTER TABLE [dbo].[RealTimeData] WITH CHECK ADD CONSTRAINT [Parameter_RealTimeData_FK1] FOREIGN KEY (
[ParameterId]
)
REFERENCES [dbo].[Parameter] (
[ParameterId]
)
GO

ALTER TABLE [dbo].[TreatmentAction] WITH CHECK ADD CONSTRAINT [Treatment_TreatmentAction_FK1] FOREIGN KEY (
[Date]
, [VehicleId]
)
REFERENCES [dbo].[Treatment] (
[Date]
, [VehicleId]
)
GO

ALTER TABLE [dbo].[Device] WITH CHECK ADD CONSTRAINT [Vehicle_Device_FK1] FOREIGN KEY (
[VehicleId]
)
REFERENCES [dbo].[Vehicle] (
[VehicleId]
)
GO

ALTER TABLE [dbo].[VehicleDailyAggregation] WITH CHECK ADD CONSTRAINT [Vehicle_VehicleDailyAggregation_FK1] FOREIGN KEY (
[VehicleId]
)
REFERENCES [dbo].[Vehicle] (
[VehicleId]
)
ALTER TABLE [dbo].[VehicleDailyAggregation] WITH CHECK ADD CONSTRAINT [Parameter_VehicleDailyAggregation_FK1] FOREIGN KEY (
[ParameterId]
)
REFERENCES [dbo].[Parameter] (
[ParameterId]
)
GO

GO

ALTER TABLE [dbo].[MonitorAlert] WITH CHECK ADD CONSTRAINT [Monitor_MonitorAlert_FK1] FOREIGN KEY (
[MonitorId]
)
REFERENCES [dbo].[Monitor] (
[MonitorId]
)
GO

ALTER TABLE [dbo].[VehicleFault] WITH CHECK ADD CONSTRAINT [Device_VehicleFault_FK1] FOREIGN KEY (
[DeviceId]
)
REFERENCES [dbo].[Device] (
[DeviceId]
)
ALTER TABLE [dbo].[VehicleFault] WITH CHECK ADD CONSTRAINT [DTC_VehicleFault_FK1] FOREIGN KEY (
[DtcName]
)
REFERENCES [dbo].[DTC] (
[DtcName]
)
GO

