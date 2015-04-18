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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pageType=request.getParameter("pageType");
		DataLayer dl = new DataLayer();
		if(dl.connect()){
			switch (pageType) {
	         case "device":
	        	 System.out.println(pageType);
		         Device[] devices = dl.getDevices();
				 request.setAttribute("devices", devices);
				 //request.setAttribute("pageType", pageType);
				 RequestDispatcher dispatcher = request.getRequestDispatcher("Devices.jsp");
				 dispatcher.forward(request, response);
	             break;
	        
	         case "customer":
	           
	             break;
	             
	         case "vehicle":
	            
	             break;
	         
	         default:
	        	 System.out.println("Invalid page name: " + pageType);
	     }
			
			dl.close();
		}
		else {
        	System.out.print("coudn't get page");
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
