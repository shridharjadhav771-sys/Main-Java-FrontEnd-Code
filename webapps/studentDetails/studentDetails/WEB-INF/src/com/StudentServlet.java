package com;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/studentss")
public class StudentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        resp.sendRedirect("studentInfo.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        int phonenumber = Integer.parseInt(request.getParameter("phonenumber"));

        String address = request.getParameter("address");
        String email = request.getParameter("email");

        

        StudentDTO student = new StudentDTO(
                name,
                phonenumber,
                address,
                email
        );

        int status = StudentDAO.insertStudent(student);

        
    }
}
