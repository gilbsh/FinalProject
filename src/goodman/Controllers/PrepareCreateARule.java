package goodman.Controllers;

import goodman.Models.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PrepareCreateARule
 */
@WebServlet("/PrepareCreateARule")
public class PrepareCreateARule extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PrepareCreateARule() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		if (request.getSession(true).getAttribute("currentSessionUser") == null)
			response.sendRedirect("Login.jsp");
		else {
			DataLayer dl = new DataLayer();
			if (dl.connect()) {
				Customer[] customers = dl.getCustomers();
				request.setAttribute("customers", customers);

				Parameter[] parameters = dl.getParameters();
				request.setAttribute("parameters", parameters);

				dl.close();
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("CreateRule.jsp");
				dispatcher.forward(request, response);
			} else {
				System.out.print("coudn't get customers");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
