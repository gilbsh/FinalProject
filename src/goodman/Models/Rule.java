package goodman.Models;

public class Rule {
	String RuleId;
	String UserEmail;
	
	public Rule(String ruleId, String userEmail) {
		super();
		RuleId = ruleId;
		UserEmail = userEmail;
	}
	
	public String getRuleId() {
		return RuleId;
	}
	public void setRuleId(String ruleId) {
		RuleId = ruleId;
	}
	public String getUserEmail() {
		return UserEmail;
	}
	public void setUserEmail(String userEmail) {
		UserEmail = userEmail;
	}
}
