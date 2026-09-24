package emailCookies;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.annotation.*;

@WebServlet("/LoginServlets")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get email and password from form
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");

		// Check login (dummy login check, you can improve it with real authentication)
		if (email.equals("user@example.com") && password.equals("password")) {
			// Set session attribute for logged-in user (you can use a database check)
			HttpSession session = request.getSession();
			session.setAttribute("email", email);

			// If 'Remember Me' checkbox is selected, create cookies for email and password
			if ("on".equals(remember)) {
				// Creating email cookie
				Cookie emailCookie = new Cookie("email", email);
				emailCookie.setMaxAge(60 * 60 * 24 * 7); // 1 week expiration
				response.addCookie(emailCookie);

				// Creating password cookie (you might want to encrypt or hash this in a real
				// application)
				Cookie passwordCookie = new Cookie("password", password);
				passwordCookie.setMaxAge(60 * 60 * 24 * 7); // 1 week expiration
				response.addCookie(passwordCookie);
			}

			// Redirect to a welcome page or dashboard
			response.sendRedirect("welcome.jsp");
		} else {
			// If login failed, redirect back to login page
			response.sendRedirect("login.jsp");
		}
	}
}
