package School.trn.trn_feePayments;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/feePayments")
public class FeePaymentsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FeePaymentsDAO dao = new FeePaymentsDAO();
        List<FeePaymentsDTO> payments = dao.getAllFeePayments();
        req.setAttribute("payments", payments);
        req.getRequestDispatcher("feePayments.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int payment_id = Integer.parseInt(req.getParameter("payment_id"));
            int student_id = Integer.parseInt(req.getParameter("student_id"));
            int fee_type_id = Integer.parseInt(req.getParameter("fee_type_id"));
            double amount_paid = Double.parseDouble(req.getParameter("amount_paid"));
            Date payment_date = Date.valueOf(req.getParameter("payment_date")); // yyyy-mm-dd format expected

            FeePaymentsDTO dto = new FeePaymentsDTO();
            dto.setPayment_id(payment_id);
            dto.setStudent_id(student_id);
            dto.setFee_type_id(fee_type_id);
            dto.setAmount_paid(amount_paid);
            dto.setPayment_date(payment_date);
            dto.setIs_deleted(0); // by default not deleted

            FeePaymentsDAO dao = new FeePaymentsDAO();

            // If ID exists, update. Else insert. Modify logic as per your need
            if (payment_id == 0) {
                dao.insertFeePayment(dto);
            } else {
                dao.updateFeePayment(dto);
            }

            resp.sendRedirect("feePayments"); // redirect to refresh the list
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Invalid input or internal error.");
            req.getRequestDispatcher("feePayments.jsp").forward(req, resp);
        }
    }
}
