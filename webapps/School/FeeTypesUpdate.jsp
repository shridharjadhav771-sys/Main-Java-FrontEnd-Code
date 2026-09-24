<%@ page import="School.Mst.Mst_fee_types.FeeTypesDTO" %>
<%
    int id = Integer.parseInt(request.getParameter("fee_type_id"));
    School.Mst.Mst_fee_types.FeeTypesDAO dao = new School.Mst.Mst_fee_types.FeeTypesDAO();
    FeeTypesDTO dto = dao.getFeeTypesById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Fee Type</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg">
                <div class="card-header bg-warning text-dark text-center">
                    <h4>Update Fee Type</h4>
                </div>
                <div class="card-body">
                    <form action="updateFeeType" method="post">
                        <input type="hidden" name="fee_type_id" value="<%= dto.getFee_type_id() %>">
                        <div class="mb-3">
                            <label for="fee_name" class="form-label">Fee Name</label>
                            <input type="text" class="form-control" id="fee_name" name="fee_name" value="<%= dto.getFee_name() %>" required>
                        </div>
                        <input type="hidden" name="is_deleted" value="<%= dto.getIs_deleted() %>">
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Update</button>
                            <a href="feeTypes" class="btn btn-secondary">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>
