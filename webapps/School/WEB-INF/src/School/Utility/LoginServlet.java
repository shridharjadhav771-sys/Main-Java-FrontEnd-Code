package School.Utility;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private LoginDAO loginDAO = new LoginDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
		response.setContentType("application/plain");

        
        if (loginDAO.isValidUser(username, password)) {
        	request.getSession().setAttribute("logedInUser", username);
            response.getWriter().write("Login successful");
            
        } else {
            response.getWriter().write("Invalid username or password");
        }
    }
}