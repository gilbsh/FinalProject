use finalprojectdb;

DROP TABLE IF EXISTS MilegeData;
DROP TABLE IF EXISTS VehicleFaults;
DROP TABLE IF EXISTS DTCs;
DROP TABLE IF EXISTS DeviceRules;
DROP TABLE IF EXISTS Devices;
DROP TABLE IF EXISTS TreatmentActions;
DROP TABLE IF EXISTS PIDData;
DROP TABLE IF EXISTS Treatments;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS GPSData;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS RuleConditions;
DROP TABLE IF EXISTS Rules;
DROP TABLE IF EXISTS Vehicles;
DROP TABLE IF EXISTS Parameters;
DROP TABLE IF EXISTS RuleAlerts;



CREATE TABLE RuleAlerts (
DateTime DATETIME  NOT NULL  
, Value VARCHAR(50)  NULL  
, VehicleId VARCHAR(50)  NOT NULL  
, RuleId int  NULL  
, ParameterName VARCHAR(50)  NULL  
);


ALTER TABLE RuleAlerts ADD CONSTRAINT RuleAlerts_PK PRIMARY KEY CLUSTERED (
DateTime
, VehicleId
);


CREATE TABLE Parameters (
ParameterName VARCHAR(50)  NOT NULL  
, ParameterDescription VARCHAR(5000)  NULL  
);


ALTER TABLE Parameters ADD CONSTRAINT Parameters_PK PRIMARY KEY CLUSTERED (
ParameterName
);


CREATE TABLE Vehicles (
VehicleId VARCHAR(50)  NOT NULL  
, Manufacturer VARCHAR(50)  NULL  
, Model VARCHAR(50)  NULL  
, Engine VARCHAR(50)  NULL  
, Year VARCHAR(50)  NULL
, HoursToTreatment INT
, CustomerId VARCHAR(50)  NULL
, LastMaintenance 
);


ALTER TABLE Vehicles ADD CONSTRAINT Vehicles_PK PRIMARY KEY CLUSTERED (
VehicleId
);



CREATE TABLE Rules (
RuleId INTEGER NOT NULL AUTO_INCREMENT 
, UserEmail VARCHAR(50)  NULL  
, RuleName VARCHAR(50)  NULL  
, RuleDescription VARCHAR(100)  NULL,
PRIMARY KEY (RuleId)  
);

CREATE TABLE RuleConditions (
RuleId int  NOT NULL  
, ParameterName VARCHAR(50)  NOT NULL  
, ConditionOperator VARCHAR(50)  NULL  
, HighValue INT NULL
, LowValue INT NULL
);


ALTER TABLE RuleConditions ADD CONSTRAINT RuleConditions_PK PRIMARY KEY CLUSTERED (
RuleId
, ParameterName
);


CREATE TABLE Users (
Email VARCHAR(50)  NOT NULL  
, FirstName VARCHAR(50)  NULL  
, LastName VARCHAR(50)  NULL  
, Password VARCHAR(50)  NULL  
);


ALTER TABLE Users ADD CONSTRAINT Users_PK PRIMARY KEY CLUSTERED (
Email
);


CREATE TABLE GPSData (
Id INTEGER NOT NULL AUTO_INCREMENT 
, Time DATETIME  NULL  
, Speed REAL  NULL  
, Latlng CHAR(10)  NULL
, Location VARCHAR(200) NULL
, DeviceId VARCHAR(50)  NULL  
);


ALTER TABLE GPSData ADD CONSTRAINT GPSData_PK PRIMARY KEY CLUSTERED (
ID
);


CREATE TABLE Customers (
CustomerId VARCHAR(50)  NOT NULL  
, FirstName VARCHAR(50)  NULL  
, LastName VARCHAR(50)  NULL  
, Email VARCHAR(50)  NULL  
, PhoneNumber VARCHAR(50)  NULL  
);


ALTER TABLE Customers ADD CONSTRAINT Customers_PK PRIMARY KEY CLUSTERED (
CustomerId
);


CREATE TABLE Treatments (
Date DATETIME  NOT NULL  
, VehicleId VARCHAR(50)  NOT NULL  
, Description VARCHAR(5000)  NULL  
, VehicleTotalEngineHours VARCHAR(50)  NULL  
, TreatmentType VARCHAR(50)  NULL  
);


ALTER TABLE Treatments ADD CONSTRAINT Treatments_PK PRIMARY KEY CLUSTERED (
Date
, VehicleId
);


CREATE TABLE PIDData (
MessageId INTEGER NOT NULL AUTO_INCREMENT 
, DeviceId VARCHAR(50)  NULL 
, ParameterName VARCHAR(50)  NULL  
, Time DATETIME  NULL   
, Value VARCHAR(50)  NULL  
);


ALTER TABLE PIDData ADD CONSTRAINT PIDData_PK PRIMARY KEY CLUSTERED (
MessageId
);


CREATE TABLE TreatmentActions (
Date DATETIME  NOT NULL  
, VehicleId VARCHAR(50)  NOT NULL  
, Action VARCHAR(50)  NULL  
, Description VARCHAR(5000)  NULL  
);


ALTER TABLE TreatmentActions ADD CONSTRAINT TreatmentActions_PK PRIMARY KEY CLUSTERED (
Date
, VehicleId
);


CREATE TABLE Devices (
DeviceId VARCHAR(50)  NOT NULL  
, PurchaseDate VARCHAR(50)  NULL  
, VehicleId VARCHAR(50)  NULL  
, InitialEngineHours REAL  NULL  
, InitialMileage DOUBLE  NULL  
);


ALTER TABLE Devices ADD CONSTRAINT Devices_PK PRIMARY KEY CLUSTERED (
DeviceId
);


CREATE TABLE DeviceRules (
DeviceId VARCHAR(50)  NOT NULL  
, RuleId VARCHAR(50)  NOT NULL  
);


ALTER TABLE DeviceRules ADD CONSTRAINT DeviceRules_PK PRIMARY KEY CLUSTERED (
RuleId
, DeviceId
);


CREATE TABLE DTCs (
Dtc VARCHAR(50)  NULL
, DtcCategory VARCHAR(50)  NULL  
, DtcArea VARCHAR(50)  NULL  
, DtcPriority int
, DtcCssClass VARCHAR(50)
);


ALTER TABLE DTCs ADD CONSTRAINT DTCs_PK PRIMARY KEY CLUSTERED (
Dtc
);

CREATE TABLE VehicleFaults (
FaultId INTEGER NOT NULL AUTO_INCREMENT 
, Dtc VARCHAR(50)  NOT NULL  
, DeviceId VARCHAR(50)  NULL  
, Level VARCHAR(1000)  NULL  
, DateTime DATETIME  NULL  
, Type VARCHAR(500)  NULL  
, DTCStatus VARCHAR(50)  NULL
, Details VARCHAR(5000)
);


CREATE TABLE MilegeData (
 Id INT NOT NULL  
,IgnitionOn DATETIME  NULL  
, IgnitionOff DATETIME  NULL  
, Milege  REAL  NULL  
, FuelConsumption REAL  NULL  
, StartLatlng VARCHAR(100)  NULL  
, EndLatlng VARCHAR(100)  NULL  
, DeviceId VARCHAR(50)  NULL  
);

CREATE TABLE TreatmentTypes(
TreatmentType VARCHAR(100)
, HoursForTreatment int
, FromHour int
,ToHour int
)

ALTER TABLE MilegeData ADD CONSTRAINT MilegeData_PK PRIMARY KEY CLUSTERED (
ID
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

