<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.OrderDAO,dto.OrderDTO" %>

<%
    // Directly fetch all non-deleted orders (no login check)
    OrderDAO orderDAO = new OrderDAO((java.sql.Connection) application.getAttribute("DBConnection"));
    List<OrderDTO> orders = orderDAO.getAllOrders();   // <-- Add this method in DAO
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Orders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h2 class="mb-4">Order History</h2>

    <table class="table table-bordered table-hover bg-white">
        <thead class="table-dark">
            <tr>
                <th>Order ID</th>
                <th>User ID</th>
                <th>Date</th>
                <th>Total Amount</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (orders.isEmpty()) {
        %>
            <tr>
                <td colspan="5" class="text-center text-muted">No orders found.</td>
            </tr>
        <%
            } else {
                for (OrderDTO order : orders) {
        %>
            <tr>
                <td><%= order.getId() %></td>
                <td><%= order.getUserId() %></td>
                <td><%= order.getOrderDate() %></td>
                <td>₹<%= order.getTotalAmount() %></td>
                <td><%= order.getStatus() %></td>
            </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>