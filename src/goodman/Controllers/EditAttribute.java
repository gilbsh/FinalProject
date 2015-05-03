package goodman.Controllers;

import goodman.Models.DataLayer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdk.nashorn.internal.ir.VarNode;

import com.sun.org.apache.bcel.internal.generic.PUTSTATIC;

/**
 * Servlet implementation class EditAttribute
 */
@WebServlet("/EditAttribute")
public class EditAttribute extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAttribute() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession(true).getAttribute("currentSessionUser")==null) response.sendRedirect("Login.jsp");	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String attributeName=request.getParameter("name");
		String value = request.getParameter("value");
		String tableName=request.getParameter("tableName");
		String pk = request.getParameter("pk");
		String idColumnName = request.getParameter("idColumnName");
		
		DataLayer dl = new DataLayer();
		if(dl.connect()){
			dl.editRow(tableName,attributeName,pk,value,idColumnName);
			dl.close();
		}
	}

}
