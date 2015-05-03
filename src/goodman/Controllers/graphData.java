package goodman.Controllers;

import goodman.Models.DataLayer;
import goodman.Models.Device;
import goodman.Models.GraphObj;
import goodman.Models.Parameter;

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
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Date endDate= null;
		String[] vehicls = request.getParameterValues("vehicls[]");
		String parameterName = request.getParameter("parameter");
		String aggregationType = request.getParameter("aggregationType");
		String timeResolution = request.getParameter("timeResolution");
		/*SimpleDateFormat formatter = new SimpleDateFormat("mm/dd/yyyy");
		try {
			endDate = new Date(formatter.parse(
			request.getParameter("endDate")).getTime());
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		DataLayer dl = new DataLayer();
		if (dl.connect()) {
			GraphObj[] graphObjs=null;
			try {
				graphObjs=dl.getGraphData(endDate,vehicls,parameterName,aggregationType,timeResolution);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("graphObjs", graphObjs);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Graph.jsp");
			dispatcher.forward(request, response);
	        dl.close();
		} else {
			System.out.print("coudn't get vehicle data");
		}
	}

}
