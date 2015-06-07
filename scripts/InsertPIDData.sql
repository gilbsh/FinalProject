use finalprojectdb;

DROP Table IF EXISTS PIDDataTemp;
DROP TABLE IF EXISTS PIDDataTempUnPivoted;

CREATE TABLE PIDDataTemp(
Time varchar(100),
EngineCoolantTemperature int,
IntakeManifoldAbsolutePressure int,
EngineRPM int,
VehicleSpeedSensor int,
IntakeAirTemperature int,
MassAirFlowSensor int
);

CREATE Table PIDDataTempUnPivoted(
DeviceId varchar(100),
Time Varchar(100),
ParameterName varchar(100),
Value int
);

LOAD DATA LOCAL INFILE 'C:\\Users\\gbenshal\\Documents\\FinalProjectTables\\ConditionDayReport-2015-6-6-11-0-8.csv' INTO TABLE PIDDataTemp
FIELDS TERMINATED BY ','
 IGNORE 4 LINES;

 
 INSERT INTO PIDDataTempUnPivoted(Time,ParameterName,Value)
 SELECT Time, 'Engine Coolant Temperature(?)', EngineCoolantTemperature
 From PIDDataTemp
 Union ALL
  SELECT Time, 'Intake Manifold Absolute Pressure(kPa)', IntakeManifoldAbsolutePressure
 From PIDDataTemp
 Union ALL
  SELECT Time, 'Engine RPM(rpm)', EngineRPM
 From PIDDataTemp
 Union ALL
  SELECT Time, 'Engine Coolant Temperature(?)', VehicleSpeedSensor
 From PIDDataTemp
 Union ALL
  SELECT Time, 'Vehicle Speed Sensor(km/h)', IntakeAirTemperature
 From PIDDataTemp
 Union ALL
  SELECT Time, 'Mass Air Flow Sensor(g/s)', MassAirFlowSensor
 From PIDDataTemp;
 
 UPDATE PIDDataTempUnPivoted
 SET DeviceId= '1111';
 
Insert INTO PIDData
SELECT PP.DeviceId ,PP.Time,PP.ParameterName,PP.Value FROM PIDDataTempUnPivoted PP
  WHERE NOT EXISTS
  (
	Select * FROM PIDData P
    WHERE P.DeviceId=PP.DeviceId and P.Time = PP.Time and P.ParameterName = PP.ParameterName
	);
 
 drop table PIDDataTempUnPivoted;
 drop table PIDDataTemp;
