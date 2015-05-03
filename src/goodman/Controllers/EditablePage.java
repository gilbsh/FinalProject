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
 * Servlet implementation class Device
 */
@WebServlet("/EditablePage")
public class EditablePage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditablePage() {
		super();
		// TODO Auto-generated constructor stub
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
			String pageType = request.getParameter("pageType");
			DataLayer dl = new DataLayer();
			Customer[] customers;
			if (dl.connect()) {
				switch (pageType) {
				case "device":
					Device[] devices = dl.getDevices();
					customers = dl.getCustomers();
					request.setAttribute("devices", devices);
					request.setAttribute("customers", customers);
					// request.setAttribute("pageType", pageType);
					RequestDispatcher dispatcher = request
							.getRequestDispatcher("Devices.jsp");
					dispatcher.forward(request, response);
					break;

				case "customer":
					customers = dl.getCustomers();
					request.setAttribute("customers", customers);
					RequestDispatcher dispatcher1 = request
							.getRequestDispatcher("Customers.jsp");
					dispatcher1.forward(request, response);
					break;

				case "vehicle":
					Vehicle[] vehicles = dl.getVehicles();
					request.setAttribute("vehicles", vehicles);
					// request.setAttribute("pageType", pageType);
					RequestDispatcher dispatcher2 = request
							.getRequestDispatcher("Vehicles.jsp");
					dispatcher2.forward(request, response);
					break;

				default:
					System.out.println("Invalid page name: " + pageType);
				}

				dl.close();
			} else {
				System.out.print("coudn't get page");
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
