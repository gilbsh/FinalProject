package goodman;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		DataLayer dl = new DataLayer("jdbc:mysql://localhost:3306","root","","FinalProject");
		if(dl.connect())
		{
			User user = dl.getUser(email);
			if(user.password.equals(password)){
				HttpSession session = request.getSession(true);	    
		        session.setAttribute("currentSessionUser",user); 
		        response.sendRedirect("Home.jsp"); //logged-in page			
			}
			else
			{
				response.sendRedirect("Login.jsp"); //logged-in page
			}
		}
		else{
			
			response.sendRedirect("Login.jsp"); //logged-in page
		}
	    
	}
}
