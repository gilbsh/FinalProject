package goodman.Controllers;

import java.io.IOException;
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
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ruleName = request.getParameter("ruleName");
		String ruleDescription = request.getParameter("ruleDescription");
		System.out.print(ruleName+"\n");
		System.out.print(ruleDescription+"\n");		
		String[] customers = request.getParameterValues("customers[]");
		
		for (int i=0;i<customers.length;i++){
			System.out.print(customers[i]+"\n");
		}
	}

}
