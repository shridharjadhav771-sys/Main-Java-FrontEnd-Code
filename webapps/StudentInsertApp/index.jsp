<!DOCTYPE html>
<html>
<head>
    <title>Student Insert</title>

    <!-- Bootstrap CSS -->
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f4f6f9;
        }

        .form-container {
            max-width: 450px;
            margin: 60px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #343a40;
        }
    </style>
    <script>
    function validateForm() {
        let name = document.getElementsByName("name")[0].value.trim();
        let email = document.getElementsByName("email")[0].value.trim();
        let course = document.getElementsByName("course")[0].value.trim();

        if (name === "") {
            alert("Please enter Name");
            return false;
        }

        if (email === "") {
            alert("Please enter Email");
            return false;
        }

        if (course === "") {
            alert("Please enter Course");
            return false;
        }

        alert("Form submitted successfully!");
        return true; // allow form submission
    }
</script>
    
</head>
<body>

<div class="container">
    <div class="form-container">
        <h2>Insert Student Data</h2>

<form action="<%=request.getContextPath()%>/StudentServlet"
      method="post"
      onsubmit="return validateForm()">

            <div class="mb-3">
                <label class="form-label">Name</label>
                <input type="text" name="name" class="form-control" placeholder="Enter name" >
            </div>

            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" class="form-control" placeholder="Enter email" >
            </div>

            <div class="mb-3">
                <label class="form-label">Course</label>
                <input type="text" name="course" class="form-control" placeholder="Enter course" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">
                    Save
                </button>
            </div>

        </form>
    </div>
</div>

<!-- Bootstrap JS -->
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
</script>

</body>
</html>
