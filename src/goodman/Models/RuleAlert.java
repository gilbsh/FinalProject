package goodman.Models;

import java.util.*;

public class RuleAlert {
	
	Date RunTime;
	String RuleId;
	
	
	public RuleAlert(Date runTime, String ruleId) {
		super();
		RunTime = runTime;
		RuleId = ruleId;
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
	
	

}
