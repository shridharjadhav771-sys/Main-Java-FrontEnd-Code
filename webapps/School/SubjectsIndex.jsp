<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
</head>

<body>
<%@ include file="nav.jsp" %>
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h4>Add New Subject</h4>
            </div>
            <div class="card-body">
                <form action="subjects" method="post">
                    <div class="form-group mb-3">
                        <label for="subject_name" class="form-label">Subject name</label>
                        <input type="text" class="form-control" id="subject_name" name="subject_name" aria-describedby="emailHelp">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>

</html>