package goodman.Models;

public class RuleAlert {
	
	public RuleCondition getRuleCondition() {
		return ruleCondition;
	}
	public void setRuleCondition(RuleCondition ruleCondition) {
		this.ruleCondition = ruleCondition;
	}
	public PIDData getPidData() {
		return pidData;
	}
	public void setPidData(PIDData pidData) {
		this.pidData = pidData;
	}
	RuleCondition ruleCondition;
	PIDData pidData;

}
