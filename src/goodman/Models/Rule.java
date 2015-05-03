package goodman.Models;

public class Rule {
	
	String ruleId;
	String ruleName;
	String ruleDescription; 
	User ruleUser;
	RuleCondition condition;
	public String getRuleId() {
		return ruleId;
	}
	public void setRuleId(String ruleId) {
		this.ruleId = ruleId;
	}
	public String getRuleName() {
		return ruleName;
	}
	public void setRuleName(String ruleName) {
		this.ruleName = ruleName;
	}
	public String getRuleDescription() {
		return ruleDescription;
	}
	public void setRuleDescription(String ruleDescription) {
		this.ruleDescription = ruleDescription;
	}
	public User getRuleUser() {
		return ruleUser;
	}
	public void setRuleUser(User ruleUser) {
		this.ruleUser = ruleUser;
	}
	public RuleCondition getCondition() {
		return condition;
	}
	public void setCondition(RuleCondition condition) {
		this.condition = condition;
	}
	
}