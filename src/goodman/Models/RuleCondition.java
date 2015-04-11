package goodman.Models;

public class RuleCondition {
	
	String RuleId;
	String ParameterName;
	String ConditionOperator;
	String LowValue;
	String HighValue;

	public RuleCondition() {
		}

	public String getRuleId() {
		return RuleId;
	}

	public void setRuleId(String ruleId) {
		RuleId = ruleId;
	}

	public String getParameterName() {
		return ParameterName;
	}

	public void setParameterName(String parameterName) {
		ParameterName = parameterName;
	}

	public String getConditionOperator() {
		return ConditionOperator;
	}

	public void setConditionOperator(String conditionOperator) {
		ConditionOperator = conditionOperator;
	}

	public String getLowValue() {
		return LowValue;
	}

	public void setLowValue(String lowValue) {
		LowValue = lowValue;
	}

	public String getHighValue() {
		return HighValue;
	}

	public void setHighValue(String highValue) {
		HighValue = highValue;
	}

	

}
