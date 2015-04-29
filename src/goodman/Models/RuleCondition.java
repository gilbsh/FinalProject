package goodman.Models;

public class RuleCondition {
	
	Rule Rule;
	Parameter Parameter;
	String ConditionOperator;
	int LowValue;
	int HighValue;
	public Rule getRule() {
		return Rule;
	}
	public void setRule(Rule rule) {
		Rule = rule;
	}
	public Parameter getParameter() {
		return Parameter;
	}
	public void setParameter(Parameter parameter) {
		Parameter = parameter;
	}
	public String getConditionOperator() {
		return ConditionOperator;
	}
	public void setConditionOperator(String conditionOperator) {
		ConditionOperator = conditionOperator;
	}
	public int getLowValue() {
		return LowValue;
	}
	public void setLowValue(int lowValue) {
		LowValue = lowValue;
	}
	public int getHighValue() {
		return HighValue;
	}
	public void setHighValue(int highValue) {
		HighValue = highValue;
	}

}
