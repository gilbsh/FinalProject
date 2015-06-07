package goodman.Controllers;

import goodman.Models.Chart;
import goodman.Models.Customer;
import goodman.Models.DataLayer;
import goodman.Models.Device;
import goodman.Models.GraphObj;
import goodman.Models.Parameter;
import goodman.Models.Vehicle;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import General.GeneralResource;

/**
 * Servlet implementation class graphData
 */
@WebServlet("/graphData")
public class graphData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public graphData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getSession(true).getAttribute("currentSessionUser") == null)
			response.sendRedirect("Login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date endDate= null;
		String[] vehicles = request.getParameterValues("vehicls[]");
		String parameterName = request.getParameter("parameter");
		String aggregationType = request.getParameter("aggregationType");
		String timeResolution = request.getParameter("timeResolution");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		try {
			endDate = new Date(formatter.parse(request.getParameter("endDate")).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String resolution="";

		DataLayer dl = new DataLayer();
		if(dl.connect()){
		    Customer[] customers = dl.getCustomers();
			request.setAttribute("customers", customers);
			Vehicle[] allVehicles = dl.getVehicles();
			request.setAttribute("vehicles", allVehicles);
			Parameter[] parameters = dl.getParameters();
        	request.setAttribute("parameters", parameters);
			Chart chart=null;
			switch(timeResolution){
				case "Day" :
				try {
					resolution="Daily";
					chart = dl.getDailyGraphData(endDate, vehicles, parameterName, aggregationType);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					break;
				case "Hour" :
				try {
					resolution="Hourly";
					chart=dl.getHourlyGraphData(endDate, vehicles, parameterName, aggregationType);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
					break;
					
			}		
			String headLine = String.valueOf(endDate)+" - "+parameterName+" - "+aggregationType+" - "+resolution;
			request.setAttribute("headLine", headLine);
			String chatrJson = GeneralResource.convertObjectToJson(chart);
			request.setAttribute("chart", chatrJson);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Graph.jsp");
			dispatcher.forward(request, response);
	        dl.close();		
		}
	}
}
