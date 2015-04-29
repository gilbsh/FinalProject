use finalprojectdb;

delimiter //

CREATE PROCEDURE GetMaintenanceReport()
BEGIN

drop table if exists VehicleHours;

create temporary table VehicleHours(
CustomerId varchar(50),
FirstName varchar(50),
LastName varchar(50),
VehicleId varchar(50),
Manufacturer varchar(50),
Model Varchar(50),
LastTreatment int,
HoursToTreatment int,
Total double
);

insert into VehicleHours
select C.CustomerId,C.FirstName,C.LastName,V.VehicleId,V.Manufacturer,V.Model,V.LastTreatment,V.HoursToTreatment,
IF(TH.TotalHours is null,0,TH.TotalHours) + D.InitialEngineHours as Total
from Devices D
join Vehicles V on D.VehicleId = V.VehicleId
join Customers C on C.CustomerId = V.CustomerId
left join
	(select M.DeviceId,SUM(TIMESTAMPDIFF(minute,M.IgnitionOff,M.IgnitionOn)) as TotalHours
		from MilegeData M
		group by M.DeviceId) TH
		on TH.DeviceId = D.DeviceId;


SELECT VH.CustomerId,VH.FirstName,VH.LastName,VH.VehicleId,VH.Manufacturer,VH.Model,VH.LastTreatment,VH.HoursToTreatment,ROUND(VH.Total) as TotalHours,
TP.TreatmentType, ROUND(VH.Total-VH.LastTreatment) as HoursFromLastTreatment,
ROUND(VH.HoursToTreatment - (VH.Total-VH.LastTreatment)) as HoursLeftForNextTreatment
FROM VehicleHours VH join TreatmentTypes TP
on VH.HoursToTreatment=TP.HoursForTreatment and VH.Total between TP.FromHour and TP.ToHour
order by HoursLeftForNextTreatment;

END//
