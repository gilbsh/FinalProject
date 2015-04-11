package goodman.Models;

public class Rule {
	
	String RuleId;
	String RuleName;
	String RuleDescription; 
	User RuleUser;
	RuleCondition Condition;
	
	public Rule() {
	}
	
	public String getRuleId() {
		return RuleId;
	}
	public void setRuleId(String ruleId) {
		RuleId = ruleId;
	}
	public String getRuleName() {
		return RuleName;
	}
	public void setRuleName(String ruleName) {
		RuleName = ruleName;
	}
	public String getRuleDescription() {
		return RuleDescription;
	}
	public void setRuleDescription(String ruleDescription) {
		RuleDescription = ruleDescription;
	}
	public User getRuleUser() {
		return RuleUser;
	}
	public void setRuleUser(User ruleUser) {
		RuleUser = ruleUser;
	}
	public RuleCondition getCondition() {
		return Condition;
	}
	public void setCondition(RuleCondition condition) {
		Condition = condition;
	}
	
}
