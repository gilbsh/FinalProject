use finalprojectdb;

delimiter //

CREATE PROCEDURE GetVehicleFaults()
BEGIN

	CREATE Temporary Table LastLocations
    (
		DeviceId varchar(50),
        LatLng varchar(50)
    );
    
    INSERT INTO LastLocations
    Select GD.DeviceId,GD.Latlng
    FROM GPSData GD
    where GD.Time=
    (
		SELECT Max(GD2.Time)
        FROM GPSData GD2
        Where GD.DeviceId= GD2.DeviceId
    );

	SELECT VF.FaultId,VF.DateTime,VF.Dtc,VF.DTCStatus,VF.Level,VF.Details,VF.Type,V.VehicleId,V.Manufacturer,V.Model,
						C.CustomerId,C.FirstName,C.LastName,C.Email,C.PhoneNumber,DTCs.DtcPriority,DTCs.DtcCssClass,LL.Latlng 
						 FROM VehicleFaults VF 
						 JOIN Devices D on VF.DeviceId=D.DeviceId 
						 JOIN Vehicles V on D.VehicleId = V.VehicleId 
						 JOIN Customers C on V.CustomerId=C.CustomerId 
						 JOIN DTCs on DTCs.Dtc = VF.Dtc
                         LEFT JOIN LastLocations LL on VF.DeviceId = LL.DeviceId
						 Where VF.DateTime=
							(
								Select max(DateTime)
								FROM VehicleFaults VF2 where
								VF.DeviceId=VF2.DeviceId
								and VF.Dtc=VF2.Dtc
							)
						ORDER BY DTCs.DtcPriority, VF.DateTime Desc;
                        
	Drop Table LastLocations;
                    
END//