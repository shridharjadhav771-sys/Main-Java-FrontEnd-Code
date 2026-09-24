package ajaxProject;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ajaxProject.RegisterDAO;
import ajaxProject.RegisterDTO;

public class UpdateStudentServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int reg_id = Integer.parseInt(req.getParameter("id"));
		String reg_fname = req.getParameter("fname");
		String reg_lname = req.getParameter("lname");
		long reg_mbno = Long.parseLong(req.getParameter("mobile"));
		String reg_emailid = req.getParameter("email");
		String reg_address = req.getParameter("address");
		String reg_gender = req.getParameter("gender");
		Date reg_dob = Date.valueOf(req.getParameter("DOB"));
		String reg_branch = req.getParameter("branch");
		String reg_specialization = req.getParameter("specialization");

		try {
			RegisterDTO regObj = new RegisterDTO();
			regObj.setReg_id(reg_id);
			regObj.setReg_fname(reg_fname);
			regObj.setReg_lname(reg_lname);
			regObj.setReg_mbno(reg_mbno);
			regObj.setReg_emailid(reg_emailid);
			regObj.setReg_address(reg_address);
			regObj.setReg_gender(reg_gender);
			regObj.setReg_dob(reg_dob);
			regObj.setReg_branch(reg_branch);
			regObj.setReg_specialization(reg_specialization);

			int status = RegisterDAO.updateRegisterDetails(regObj);

			if (status > 0) {
				System.out.println("Update Successfully");
				resp.sendRedirect("ViewStudent");
			} else {
				System.out.println("not updated");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
