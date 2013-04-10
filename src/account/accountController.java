package account;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class accountController extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		response.setContentType("text/html");
		//Add code below to print the total number of users in the database.
		String email = request.getParameter("email");
		String username = request.getParameter("userid");
		String password = request.getParameter("pswrd");
		
		accountDB insertAccounts = new accountDB();
		insertAccounts.insertCredentials(email, username, password);
		response.sendRedirect("thankyou.html");	
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
}

