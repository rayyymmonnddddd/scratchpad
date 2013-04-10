package user;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
* Manages the login of the students
*
*/
public class userController extends HttpServlet {
/**
* Checks for username and password of the students who login. Displays relevant error messages,if any.
* @param request
* @param response
* @throws ServletException
* @throws IOException
*/
public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession session = request.getSession();
	response.setContentType("text/html");
	//Add code below to print the total number of users in the database.
	String username = request.getParameter("userid");
	String password = request.getParameter("pswrd");
	
	
	
	userDB user = new userDB();
	boolean check = userDB.loginCheck(username, password);
	String url = "";
	
	if(check){
		url = "dashboard.jsp?id=" + username;
		response.sendRedirect(url);
		session.setAttribute( "theName", username ); 
		
	}
	else{
		String error = "You've entered the wrong username/password";
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp?errorMsg=" + error);
		rd.forward(request, response);
	}
}
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
}

