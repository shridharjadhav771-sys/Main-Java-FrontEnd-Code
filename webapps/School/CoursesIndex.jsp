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

<div class="container mt-5 bg-dark text-light">
	<%@ include file="nav.jsp" %>
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg">
                <div class="card-header bg-dark text-light text-center">
                    <h4>Add New Course</h4>
                </div> 
                <div class="card-body bg-dark">
                    <form action="course" method="post">
                        <div class="form-group mb-3">
                            <label for="courseName">Course Name</label>
                            <input type="text" class="form-control" id="courseName" name="course_name" placeholder="Enter course name" required>
                        </div>

						<div class="form-group mb-3">
                            <label for="courseDuration">Course Duration</label>
                            <input type="text" class="form-control" id="courseDuration" name="course_duration" placeholder="Enter course name" required>
                        </div>
                        <!-- Optional Hidden Field -->
                        <input type="hidden" name="isDeleted" value="0">

                        <button type="submit" class="btn btn-success btn-block">Save Course</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>