package jquery.com;

import java.io.IOException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.ServletException;

@WebServlet("/HelloServlet")
public class HelloServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
                         throws IOException, ServletException {

        response.setContentType("text/plain");

        response.getWriter().print("Hello Shree! This is data from Servlet.");
    }
}
