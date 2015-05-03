package goodman.Controllers;

import goodman.Models.Customer;
import goodman.Models.DataLayer;
import goodman.Models.Device;
import goodman.Models.Parameter;
import goodman.Models.Vehicle;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class graph
 */
@WebServlet("/graph")
public class graph extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public graph() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		DataLayer dl = new DataLayer();
		 Customer[] customers;
		if(dl.connect()){
		    customers = dl.getCustomers();
			request.setAttribute("customers", customers);
			Vehicle[] vehicles = dl.getVehicles();
			request.setAttribute("vehicles", vehicles);
			Parameter[] parameters = dl.getParameters();
        	request.setAttribute("parameters", parameters);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Graph.jsp");
			dispatcher.forward(request, response);
	        dl.close();
		}
		else {
        	System.out.print("coudn't get page");
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
