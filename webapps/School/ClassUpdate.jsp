<%@ page import="School.Mst.Mst_Classes.ClassesDTO" %>
<%
ClassesDTO c = (ClassesDTO) request.getAttribute("class1");
if(c==null){
	System.out.println("No class found");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	
	<style>
    body {
        background-image: url('Images/img5.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-attachment: fixed;
        background-position: center;
    }

    .container {
        background-color: rgba(255, 255, 255, 0.9);
        padding: 30px;
        border-radius: 10px;
    }
</style>
</head>
<body>
	<div class="container mt-5 text-light bg-dark">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg">
                <div class="card-header bg-dark text-white text-center">
                    <h4>Update Class</h4>
                </div> 
                <div class="card-body bg-dark">
                    <form action="updateClass" method="post">
                    
                    <input type="hidden" name="class_id" value="<%=c.getClassId() %>">
                        <div class="form-group mb-3">
                            <label for="className">Class Name</label>
                            <input type="text" class="form-control" id="className" name="className" placeholder="Enter class name" value="<%=c.getClassName() %>" required>
                        </div>

                        <!-- Optional Hidden Field -->
                        <input type="hidden" name="isDeleted" value="<%= c.getIsDeleted() %>">

                        <button type="submit" class="btn btn-success btn-block">Update Class</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>