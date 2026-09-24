package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import dto.OrderDTO;
import utility.DBConnection;

public class OrderDAO {
    private Connection con;

    public OrderDAO(Connection conn) {
        this.con = conn;
    }

    public List<OrderDTO> getOrdersByUserId(int userId) {
        List<OrderDTO> orders = new ArrayList<>();
        String sql = "SELECT id, user_id, order_date, total_amount, status " +
                     "FROM orders WHERE user_id=? AND is_deleted=0 ORDER BY order_date DESC";

        try (Connection con = DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO order = new OrderDTO();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
    public List<OrderDTO> getAllOrders() {
        List<OrderDTO> orders = new ArrayList<>();
        String sql = "SELECT id, user_id, order_date, total_amount, status FROM orders WHERE is_deleted=0 ORDER BY order_date DESC";

        try (Connection con = DBConnection.getConnection();
        		PreparedStatement ps = con.prepareStatement(sql)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderDTO order = new OrderDTO();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setTotalAmount(rs.getDouble("total_amount"));
                order.setStatus(rs.getString("status"));
                orders.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }
}