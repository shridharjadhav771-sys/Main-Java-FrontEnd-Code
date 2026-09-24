package servlet;

import dao.UserDAO;
import dto.UserDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/user")
public class UserServlet extends HttpServlet {
	private UserDAO userDAO = new UserDAO();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");

		if ("login".equals(action)) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String rememberMe = req.getParameter("rememberMe"); // "on" if checked

			UserDTO user = userDAO.login(username, password);
			if (user != null) {
				// 1️⃣ Create session
				HttpSession session = req.getSession();
				session.setAttribute("user", user);

				// 2️⃣ Handle Remember Me
				if ("on".equals(rememberMe)) {
					Cookie userCookie = new Cookie("username", username);
					Cookie passCookie = new Cookie("password", password); // For production, use token instead
					userCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
					passCookie.setMaxAge(7 * 24 * 60 * 60);
					userCookie.setPath("/");
					passCookie.setPath("/");
					resp.addCookie(userCookie);
					resp.addCookie(passCookie);
				} else {
					// Delete cookies if they exist
					Cookie userCookie = new Cookie("username", "");
					Cookie passCookie = new Cookie("password", "");
					userCookie.setMaxAge(0);
					passCookie.setMaxAge(0);
					userCookie.setPath("/");
					passCookie.setPath("/");
					resp.addCookie(userCookie);
					resp.addCookie(passCookie);
				}

				resp.sendRedirect("home.jsp");
			} else {
				resp.sendRedirect("login.jsp?error=invalid");
			}

		} else if ("register".equals(action)) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			String email = req.getParameter("email");
			String role = req.getParameter("role") != null ? req.getParameter("role") : "user";

			UserDTO newUser = new UserDTO();
			newUser.setUsername(username);
			newUser.setPassword(password); // In production, hash the password
			newUser.setEmail(email);
			newUser.setRole(role);

			userDAO.insertUser(newUser);
			resp.sendRedirect("login.jsp?message=registered");

		} else if ("updateAdmin".equals(action)) {
			int id = Integer.parseInt(req.getParameter("id"));
			String username = req.getParameter("username");
			String email = req.getParameter("email");
			String role = req.getParameter("role");

			UserDTO user = userDAO.getUserByid(id);
			if (user != null) {
				user.setUsername(username);
				user.setEmail(email);
				user.setRole(role);
				// Keep existing password
				userDAO.updateUserWithoutPassword(user);
				resp.getWriter().write("success");
			} else {
				resp.getWriter().write("error");
			}
		} else {
			resp.sendRedirect("login.jsp");
		}
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		HttpSession session = req.getSession(false);

		if ("logout".equals(action)) {
			if (session != null) {
				session.invalidate();
			}
			// Delete Remember Me cookies on logout
			Cookie userCookie = new Cookie("username", "");
			Cookie passCookie = new Cookie("password", "");
			userCookie.setMaxAge(0);
			passCookie.setMaxAge(0);
			userCookie.setPath("/");
			passCookie.setPath("/");
			resp.addCookie(userCookie);
			resp.addCookie(passCookie);

			resp.sendRedirect("login.jsp");

		} else if ("profile".equals(action)) {
			if (session != null && session.getAttribute("user") != null) {
				UserDTO user = (UserDTO) session.getAttribute("user");
				req.setAttribute("user", user);
				req.getRequestDispatcher("profile.jsp").forward(req, resp); // Assume profile.jsp
			} else {
				resp.sendRedirect("login.jsp");
			}

		} else if ("deleteAdmin".equals(action)) {
			String idStr = req.getParameter("id");
			if (idStr != null) {
				int id = Integer.parseInt(idStr);
				boolean deleted = userDAO.softDeleteUser(id);
				resp.setContentType("text/plain");
				resp.getWriter().write(deleted ? "success" : "fail");
			} else {
				resp.setContentType("text/plain");
				resp.getWriter().write("fail");
			}
		} else {
			resp.sendRedirect("login.jsp");
		}
	}
}
