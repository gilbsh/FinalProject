package goodman.Models;

public class RuleCondition {
	String Condition;
	String RuleId;
	String DtcName;
	String ParameterId;
	String AggregationType;
	
	
	
	public RuleCondition(String condition, String ruleId, String dtcName,
			String parameterId, String aggregationType) {
		super();
		Condition = condition;
		RuleId = ruleId;
		DtcName = dtcName;
		ParameterId = parameterId;
		AggregationType = aggregationType;
	}
	public String getCondition() {
		return Condition;
	}
	public void setCondition(String condition) {
		Condition = condition;
	}
	public String getRuleId() {
		return RuleId;
	}
	public void setRuleId(String ruleId) {
		RuleId = ruleId;
	}
	public String getDtcName() {
		return DtcName;
	}
	public void setDtcName(String dtcName) {
		DtcName = dtcName;
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
