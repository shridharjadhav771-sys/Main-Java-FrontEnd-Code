package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
 
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

      
        if (request.getParameter("rememberMe") != null) {
         
            Cookie usernameCookie = new Cookie("username", username);
            Cookie passwordCookie = new Cookie("password", password);

            // Set the cookies' expiration time (7 days)
            usernameCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days
            passwordCookie.setMaxAge(7 * 24 * 60 * 60); // 7 days

           
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
        }

      
        response.sendRedirect("dashboard.jsp");
    }

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    }
}
