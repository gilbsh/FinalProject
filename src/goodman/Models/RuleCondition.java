package goodman.Models;


public class RuleCondition {
	
	Rule rule;
	Parameter parameter;
	String conditionOperator;
	int lowValue;
	int highValue;
	RuleAlert[] ruleAlerts;
	String ruleNaturalLanguage;
	
	public String getRuleNaturalLanguage() {
		return ruleNaturalLanguage;
	}
	public void setRuleNaturalLanguage() {
		String values = conditionOperator.equals("Between") || conditionOperator.equals("Not Between") ?
				(lowValue+" AND "+highValue) : 
					conditionOperator.equals("<") ? String.valueOf(lowValue) : 
						String.valueOf(highValue);
		
		
		ruleNaturalLanguage = rule.getRuleUser().getFirstName()+" "+rule.getRuleUser().getLastName()+" - "+rule.getRuleName()+" - " + parameter.getParameterName() +" "+ conditionOperator +" "+values;			
	}
	public Rule getRule() {
		return rule;
	}
	public void setRule(Rule rule) {
		this.rule = rule;
	}
	public Parameter getParameter() {
		return parameter;
	}
	public void setParameter(Parameter parameter) {
		this.parameter = parameter;
	}
	public String getConditionOperator() {
		return conditionOperator;
	}
	public void setConditionOperator(String conditionOperator) {
		this.conditionOperator = conditionOperator;
	}
	public int getLowValue() {
		return lowValue;
	}
	public void setLowValue(int lowValue) {
		this.lowValue = lowValue;
	}
	public int getHighValue() {
		return highValue;
	}
	public void setHighValue(int highValue) {
		this.highValue = highValue;
	}
	public RuleAlert[] getRuleAlerts() {
		return ruleAlerts;
	}
	public void setRuleAlerts(RuleAlert[] ruleAlerts) {
		this.ruleAlerts = ruleAlerts;
	}
	

}