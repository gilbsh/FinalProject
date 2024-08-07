package goodman.Controllers;

import goodman.Models.Customer;
import goodman.Models.DataLayer;
import goodman.Models.Parameter;
import goodman.Models.Rule;
import goodman.Models.RuleCondition;
import goodman.Models.User;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateRuleServlet
 */
@WebServlet("/CreateRuleServlet")
public class CreateRuleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateRuleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession(true).getAttribute("currentSessionUser")==null) response.sendRedirect("Login.jsp");
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ruleName = request.getParameter("ruleName");
		String ruleDescription = request.getParameter("ruleDescription");
		String[] vehicls = request.getParameterValues("vehicls[]");
		String parameterName = request.getParameter("parameter");
		String condition = request.getParameter("condition");
		String ruleLowValue = request.getParameter("ruleLowValue");
		String ruleHighValue = request.getParameter("ruleHighValue");		
		Parameter parameter = new Parameter();
		parameter.setParameterName(parameterName);
		
		Rule rule=new Rule();
		rule.setRuleName(ruleName);
		rule.setRuleDescription(ruleDescription);
		rule.setRuleUser((User)request.getSession(true).getAttribute("currentSessionUser"));
		DataLayer dl = new DataLayer();
        if(dl.connect()){
        	Rule createdRule=dl.createRule(rule);
        	RuleCondition Condition=new RuleCondition();
        	Condition.setRule(createdRule);
        	Condition.setParameter(parameter);
        	Condition.setConditionOperator(condition);
        	Condition.setLowValue(Integer.parseInt(ruleLowValue));
        	Condition.setHighValue(Integer.parseInt(ruleHighValue));
        	dl.createRuleCondition(createdRule, Condition);
        	dl.createDeviceRule(rule,vehicls);    	
        	dl.close();
        }
        else {
        	System.out.print("coudn't create rule");
        }
        
        response.sendRedirect("PrepareCreateARule");
	}
}
