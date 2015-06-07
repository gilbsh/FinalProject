use finalprojectdb;

DROP TABLE IF Exists VehicleFaultsTemp;
DROP TABLE IF Exists VehicleFaultsCsvTemp;

CREATE TEMPORARY TABLE VehicleFaultsTemp(
DeviceId varchar(100),
Level Varchar(500),
Time varchar(200),
DTCs varchar(300),
Type varchar(50),
DTCStatus varchar(50),
Details varchar(500)
);

CREATE TEMPORARY TABLE VehicleFaultsCsvTemp(
Level Varchar(500),
Time varchar(200),
DTCs varchar(300),
Type varchar(50),
DTCStatus varchar(50),
Details varchar(500)
);

select * from VehicleFaultsCsvTemp;

LOAD DATA LOCAL INFILE 'C:\\Users\\gbenshal\\Documents\\FinalProjectTables\\FaultDayReport-2015-6-6-10-57-49.csv' INTO TABLE VehicleFaultsCsvTemp
FIELDS TERMINATED BY ','
IGNORE 5 LINES;

INSERT INTO VehicleFaultsTemp(Level,Time,DTCs,Type,DTCStatus,Details)
SELECT VTC.Level,VTC.Time,VTC.DTCs,VTC.Type,VTC.DTCStatus,VTC.Details
FROM VehicleFaultsCsvTemp VTC;

Update VehicleFaultsTemp
SET DeviceId = '1111';

INSERT INTO VehicleFaults(Dtc,DeviceId,Level,DateTime,Type,DTCStatus,Details)
Select VFT.DTCs,VFT.DeviceId,VFT.Level,VFT.Time,VFT.Type,VFT.DTCStatus,VFT.Details
FROM VehicleFaultsTemp VFT
where not exists (
select * from VehicleFaults VF
WHERE VF.DeviceId = VFT.DeviceId
and VF.Dtc = VFT.DTCs
and VF.DateTime = VFT.Time
)

DROP TABLE IF Exists VehicleFaultsTemp;
DROP TABLE IF Exists VehicleFaultsCsvTemp;

