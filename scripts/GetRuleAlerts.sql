use finalprojectdb;

delimiter //

CREATE PROCEDURE GetRuleAlerts()
BEGIN

SELECT R.RuleId,
	R.RuleName,
	R.RuleDescription,
	RC.ParameterName,
	RC.ConditionOperator,
	RC.LowValue,
	RC.HighValue,
	PD.MessageId,
	PD.DeviceId,
	PD.Time,
	PD.Value
FROM RuleAlerts RA
JOIN RuleConditions RC
	on RA.RuleId=RC.RuleId and RA.ParameterName=RC.ParameterName
JOIN PIDData PD
	on RA.MessageId=PD.MessageId
JOIN Rules R
	on R.RuleId=RC.RuleId;

END//