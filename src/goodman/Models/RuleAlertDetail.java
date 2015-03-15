package goodman.Models;

import java.util.*;

public class RuleAlertDetail {
	
	Date DateTime;
	String Value;
	Date RunTime;
	String RuleId;
	String VehicleId;
	String ParameterId;
	String AggregationType;
	public RuleAlertDetail(Date dateTime, String value, Date runTime,
			String ruleId, String vehicleId, String parameterId,
			String aggregationType) {
		super();
		DateTime = dateTime;
		Value = value;
		RunTime = runTime;
		RuleId = ruleId;
		VehicleId = vehicleId;
		ParameterId = parameterId;
		AggregationType = aggregationType;
	}
	public Date getDateTime() {
		return DateTime;
	}
	public void setDateTime(Date dateTime) {
		DateTime = dateTime;
	}
	public String getValue() {
		return Value;
	}
	public void setValue(String value) {
		Value = value;
	}
	public Date getRunTime() {
		return RunTime;
	}
	public void setRunTime(Date runTime) {
		RunTime = runTime;
	}
	public String getRuleId() {
		return RuleId;
	}
	public void setRuleId(String ruleId) {
		RuleId = ruleId;
	}
	public String getVehicleId() {
		return VehicleId;
	}
	public void setVehicleId(String vehicleId) {
		VehicleId = vehicleId;
	}
	public String getParameterId() {
		return ParameterId;
	}
	public void setParameterId(String parameterId) {
		ParameterId = parameterId;
	}
	public String getAggregationType() {
		return AggregationType;
	}
	public void setAggregationType(String aggregationType) {
		AggregationType = aggregationType;
	}
	
	

}
