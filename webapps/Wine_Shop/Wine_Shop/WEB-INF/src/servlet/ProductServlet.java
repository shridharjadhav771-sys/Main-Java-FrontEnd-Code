package servlet;

import dao.ProductDAO;
import dto.ProductDTO;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/products")
@MultipartConfig
public class ProductServlet extends HttpServlet {

	private Connection getConnection() throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/majad_db", "root", "root");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");

		if ("add".equals(action)) {
			try {
				String name = request.getParameter("name");
				double price = Double.parseDouble(request.getParameter("price"));
				String description = request.getParameter("description");

				// Handle image upload
				Part filePart = request.getPart("image");
				String fileName = filePart.getSubmittedFileName();

				String uploadPath = getServletContext().getRealPath("") + "uploads";
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists())
					uploadDir.mkdir();

				String filePath = uploadPath + File.separator + fileName;
				filePart.write(filePath);

				// Save only file name in DB
				ProductDTO product = new ProductDTO();
				product.setName(name);
				product.setPrice(price);
				product.setDescription(description);
				product.setImageUrl("uploads/" + fileName);

				ProductDAO dao = new ProductDAO(getConnection());
				if (dao.addProduct(product)) {
					response.getWriter().write("success");
				} else {
					response.getWriter().write("fail");
				}
			} catch (Exception e) {
				e.printStackTrace();
				response.getWriter().write("error");
			}
		}
	}
}
