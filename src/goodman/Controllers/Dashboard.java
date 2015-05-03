package goodman.Controllers;

import goodman.Models.DataLayer;
import goodman.Models.RuleCondition;
import goodman.Models.VehicleFault;
import goodman.Models.VehicleMaintenance;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Dashboard
 */
@WebServlet("/Dashboard")
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Dashboard() {
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
			DataLayer dl = new DataLayer();
			if (dl.connect()) {
				VehicleFault[] vehicleFaults = dl.getVehicleFaults();
				VehicleMaintenance[] vehiclesMaintenance = dl
						.getMaintenanceReport();
				RuleCondition[] ruleConditions = dl
						.getRuleConditionsWithAlerts();
				request.setAttribute("vehicleFaults", vehicleFaults);
				request.setAttribute("vehiclesMaintenance", vehiclesMaintenance);
				request.setAttribute("ruleConditions", ruleConditions);
				RequestDispatcher dispatcher = request
						.getRequestDispatcher("Dashboard.jsp");
				dispatcher.forward(request, response);
				dl.close();
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
