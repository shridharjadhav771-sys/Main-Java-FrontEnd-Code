<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Sidebar Component -->
<div class="sidebar">
    <h4>School Admin</h4>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="students.jsp">Students</a>
    <a href="teachers.jsp">Teachers</a>
    <a href="designations.jsp">Designations</a>
    <a href="departments.jsp">Departments</a>
</div>

<style>
    /* Sidebar Styling */
    .sidebar {
        width: 250px;
        background: #343a40;
        color: #fff;
        padding: 20px 15px;
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
    }

    .sidebar h4 {
        color: #ffc107;
        margin-bottom: 1rem;
    }

    .sidebar a {
        color: #adb5bd;
        text-decoration: none;
        display: block;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 5px;
        transition: all 0.2s;
    }

    .sidebar a:hover {
        background: #495057;
        color: #fff;
    }
</style>
