package goodman.Controllers;

import goodman.Models.DataLayer;
import goodman.Models.Device;
import goodman.Models.Rule;
import goodman.Models.RuleCondition;
import goodman.Models.User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addDevice
 */
@WebServlet("/addDevice")
public class addDevice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addDevice() {
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
		String deviceID = request.getParameter("deviceID");
		String purchaseDate = request.getParameter("purchaseDate");
		String vehicleID = request.getParameter("vehicle");
		String InitialMileage = request.getParameter("InitialMileage");
		String InitialEngineHours = request.getParameter("InitialEngineHours");
		
		Device newDevice = new Device();
		newDevice.setDeviceId(deviceID);
		newDevice.setPurchaseDate(purchaseDate);
		newDevice.setInitialMileage(InitialMileage);
		newDevice.setInitialEngineHours(InitialEngineHours);
		
		DataLayer dl = new DataLayer();
        if(dl.connect()){
        	newDevice.setVehicle(dl.getVehicle(vehicleID));
    		dl.createNewDevice(newDevice);
    		response.sendRedirect("EditablePage?pageType=device");
    		dl.close();
        }
        else {
        	System.out.print("coudn't create new device");
        }
        
        //response.sendRedirect("EditablePage?pageType=device");
	}
}


