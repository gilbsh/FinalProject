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
@WebServlet("/Device")
public class Device extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Device() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 DataLayer dl = new DataLayer();
	        if(dl.connect()){
	        	/*Customer[] customers = dl.getCustomers();
	        	request.setAttribute("customers", customers);
	        	
	        	Parameter[] parameters = dl.getParameters();
	        	request.setAttribute("parameters", parameters);*/
	            RequestDispatcher dispatcher = request.getRequestDispatcher("Devices.jsp");
	            dispatcher.forward(request, response);
	        }
	        else {
	        	System.out.print("coudn't get customers");
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
