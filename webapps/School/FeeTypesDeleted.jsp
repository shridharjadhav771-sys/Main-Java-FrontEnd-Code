<%@ page import="java.util.List" %>
<%@ page import="School.Mst.Mst_fee_types.FeeTypesDTO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deleted Fee Types</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Deleted Fee Types</h2>

    <div class="mb-3 text-end">
        <a href="feeTypes" class="btn btn-primary">Back to Active Fee Types</a>
    </div>

    <table class="table table-bordered text-center">
        <thead class="table-danger">
        <tr>
            <th>Fee Type ID</th>
            <th>Fee Name</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<FeeTypesDTO> deletedFeeTypes = (List<FeeTypesDTO>) request.getAttribute("deletedFeeTypes");
            if (deletedFeeTypes != null && !deletedFeeTypes.isEmpty()) {
                for (FeeTypesDTO f : deletedFeeTypes) {
        %>
        <tr>
            <td><%= f.getFee_type_id() %></td>
            <td><%= f.getFee_name() %></td>
            <td>
                <a href="restoreFeeType?fee_type_id=<%= f.getFee_type_id() %>" class="btn btn-success btn-sm"
                   onclick="return confirm('Are you sure you want to restore this fee type?')">Restore</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr><td colspan="3">No deleted fee types found.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
