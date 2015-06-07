use finalprojectdb;

delimiter //

CREATE PROCEDURE CalculateRules()
BEGIN

drop table if exists AllRules;

Create temporary Table AllRules
(
RuleId int,
DeviceId varchar(50),
ParameterName varchar(100),
ConditionOperator varchar(100),
LowValue int,
HighValue int
);

insert into AllRules(RuleId,DeviceId,ParameterName,ConditionOperator,LowValue,HighValue)
SELECT R.RuleId, D.DeviceId, RC.ParameterName, RC.ConditionOperator, RC.LowValue,RC.HighValue
FROM Rules R Join
RuleConditions RC
on R.RuleId = RC.RuleId
join DeviceRules DR
on R.RuleId=DR.RuleId
Join Devices D
on DR.DeviceId=D.DeviceId;

insert into RuleAlerts(RuleId,ParameterName,MessageId)
SELECT AR.RuleId,AR.ParameterName,PD.MessageId
FROM AllRules AR
join PIDData PD
on AR.ParameterName = PD.ParameterName
and AR.DeviceId=PD.DeviceId
and (
(AR.ConditionOperator='Between' and PD.Value between AR.LowValue and HighValue)
or (AR.ConditionOperator ='Not Between' and PD.Value Not Between AR.LowValue and AR.HighValue)
or (AR.ConditionOperator ='<' and PD.Value<AR.LowValue)
or (AR.ConditionOperator ='>' and PD.Value>AR.HighValue)
)
where Not exists(Select * from RuleAlerts RA where RA.MessageId=MessageId and RA.ParameterName=ParameterName and RA.RuleId=RuleId);



END//