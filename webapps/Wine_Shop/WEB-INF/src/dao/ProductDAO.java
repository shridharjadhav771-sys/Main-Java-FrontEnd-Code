package dao;

import dto.ProductDTO;
import utility.DBConnection;

import java.sql.*;
import java.util.*;

public class ProductDAO {
	private Connection con;

	public ProductDAO(Connection conn) {
		this.con = con;
	}

	// Add product
	public boolean addProduct(ProductDTO product) {
		String sql = "INSERT INTO product(name, price, description, image_url) VALUES(?,?,?,?)";
		try (Connection con= DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setString(1, product.getName());
			ps.setDouble(2, product.getPrice());
			ps.setString(3, product.getDescription());
			ps.setString(4, product.getImageUrl());
			return ps.executeUpdate() > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// Get all products
	public List<ProductDTO> getAllProducts() {
		List<ProductDTO> list = new ArrayList<>();
		String sql = "SELECT * FROM product ORDER BY created_at DESC";
		try (Connection con= DBConnection.getConnection();
				PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {
			while (rs.next()) {
				ProductDTO p = new ProductDTO();
				p.setId(rs.getInt("id"));
				p.setName(rs.getString("name"));
				p.setPrice(rs.getDouble("price"));
				p.setDescription(rs.getString("description"));
				p.setImageUrl(rs.getString("image_url"));
				list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
}
