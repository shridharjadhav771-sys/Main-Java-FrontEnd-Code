<!DOCTYPE html>
<html lang="en" data-bs-theme="dark">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>School Management System</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #121212;
    }
    .sidebar {
      min-height: 100vh;
      background-color: #1e1e1e;
      box-shadow: 2px 0 5px rgba(0,0,0,0.05);
    }
    .sidebar .nav-link {
      color: #ced4da;
      font-weight: 500;
    }
    .sidebar .nav-link.active {
      background-color: #343a40;
      border-radius: 8px;
    }
    .card-stat {
      border: none;
      border-radius: 12px;
      padding: 20px;
      color: #ced4da;
    }
    .card-module {
      border: none;
      border-radius: 12px;
      padding: 20px;
      transition: all 0.3s ease;
    }
    .card-module:hover {
      transform: translateY(-5px);
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
    .text-muted {
      color: #6c757d !important;
    }
  </style>
</head>
<body>

<div class="container-fluid">
  <div class="row">
    <!-- Sidebar -->
    <div class="col-md-2 sidebar p-3">
      <h5 class="mb-4"><i class="bi bi-mortarboard"></i> GlobeCreater</h5>
      <p class="text-muted">School Management System</p>
      <hr>
      <ul class="nav flex-column">
        <li class="nav-item"><a href="#" class="nav-link active"><i class="bi bi-speedometer2 me-2"></i>Dashboard</a></li>
        <li class="mt-3 text-muted">Transactions</li>
        <li class="nav-item"><a href="Students.jsp" class="nav-link"><i class="bi bi-people me-2"></i>Students</a></li>
        <li class="nav-item"><a href="Teachers.jsp" class="nav-link"><i class="bi bi-person-badge me-2"></i>Teachers</a></li>
        <li class="mt-3 text-muted">Masters</li>
        <li class="nav-item"><a href="Courses.jsp" class="nav-link"><i class="bi bi-journal-bookmark me-2"></i>Courses</a></li>
        <li class="nav-item"><a href="classes.jsp" class="nav-link"><i class="bi bi-building me-2"></i>Departments</a></li>
        <li class="nav-item"><a href="Designations.jsp" class="nav-link"><i class="bi bi-award me-2"></i>Designations</a></li>
        <li class="nav-item"><a href="departments.jsp" class="nav-link"><i class="bi bi-house-door me-2"></i>Classes</a></li>
        <li class="nav-item"><a href="ExamTypes.jsp" class="nav-link"><i class="bi bi-pen"></i> Exam Types</a></li>
        <li class="nav-item"><a href="FeeTypes.jsp" class="nav-link"><i class="bi bi-currency-rupee"></i> Fee Types</a></li>
        <li class="nav-item"><a href="Subjects.jsp" class="nav-link"><i class="bi bi-journal-bookmark"></i> Subjects</a></li>
        <li class="nav-item"><a href="userRoles.jsp" class="nav-link"><i class="bi bi-people-fill"></i> User Roles</a></li>
      </ul>
    </div>

    <!-- Main Content -->
    <div class="col-md-10 p-4">
      <h2 class="fw-bold">Education Management System</h2>
      <p class="text-muted">Streamline your educational institution with our comprehensive management platform</p>

      <!-- Stats Row -->
      <div class="row g-3 mb-4">
        <div class="col-md-3">
          <div class="card-stat bg-dark">
            <h6 >Total Students</h6>
            <h3 id="studentsCount">0</h3>
            <span class="text-success">Active enrollment</span>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card-stat bg-dark">
            <h6>Faculty Members</h6>
            <h3 id="teachersCount">0</h3>
            <span class="text-success">Teaching staff</span>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card-stat bg-dark">
            <h6>Active Courses</h6>
            <h3 id="coursesCount">0</h3>
            <span class="text-success">Available courses</span>
          </div>
        </div>
        <div class="col-md-3">
          <div class="card-stat bg-dark">
            <h6>Departments</h6>
            <h3 id="departmentsCount">0</h3>
            <span class="text-success">Academic divisions</span>
          </div>
        </div>
      </div>

      <!-- Modules -->
      <h4 class="fw-bold mb-3">System Modules</h4>
      <p class="text-muted">Access different areas of the school management system</p>

      <div class="row g-3">
        <div class="col-md-4">
          <div class="card-module bg-dark">
            <i class="bi bi-people fs-2 text-primary"></i>
            <h5 class="mt-3">Students</h5>
            <p>Manage student records, enrollment, and academic information</p>
            <a href="Students.jsp" class="btn btn-outline-primary btn-sm">Manage Students</a>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-module bg-dark">
            <i class="bi bi-person-badge fs-2 text-success"></i>
            <h5 class="mt-3">Teachers</h5>
            <p>Manage faculty information, assignments, and qualifications</p>
            <a href="Teachers.jsp" class="btn btn-outline-success btn-sm">Manage Teachers</a>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-module bg-dark">
            <i class="bi bi-journal-bookmark fs-2 text-purple"></i>
            <h5 class="mt-3">Courses</h5>
            <p>Define and manage academic courses and curriculum</p>
            <a href="Courses.jsp" class="btn btn-outline-secondary btn-sm">Manage Courses</a>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-module bg-dark">
            <i class="bi bi-building fs-2 text-warning"></i>
            <h5 class="mt-3">Departments</h5>
            <p>Organize academic divisions and faculty assignments</p>
            <a href="departments.jsp" class="btn btn-outline-warning btn-sm">Manage Departments</a>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-module bg-dark">
            <i class="bi bi-award fs-2 text-danger"></i>
            <h5 class="mt-3">Designations</h5>
            <p>Manage faculty designations and job roles</p>
            <a href="Designations.jsp" class="btn btn-outline-danger btn-sm">Manage Designations</a>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card-module bg-dark">
            <i class="bi bi-house-door fs-2 text-info"></i>
            <h5 class="mt-3">Classes</h5>
            <p>Manage academic classes and classroom assignments</p>
            <a href="classes.jsp" class="btn btn-outline-info btn-sm">Manage Classes</a>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card-module bg-dark ">
            <i class="bi bi-pen fs-2 text-success"></i>
            <h5 class="mt-3">Exam Types</h5>
            <p>Define and manage academic exam categories</p>
            <a href="ExamTypes.jsp" class="btn btn-outline-info btn-sm">Manage Exam Types →</a>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card-module bg-dark ">
            <i class="bi bi-currency-rupee fs-2 text-warning"></i>
            <h5 class="mt-3">Fee Types</h5>
            <p>Set up and organize student fee categories</p>
            <a href="FeeTypes.jsp" class="btn btn-outline-info btn-sm">Manage Fee Type</a>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card-module bg-dark">
            <i class="bi bi-journal-bookmark fs-2 text-purple"></i>
            <h5 class="mt-3">Subjects</h5>
            <p>Manage academic subjects and course topics</p>
            <a href="Subjects.jsp" class="btn btn-outline-info btn-sm">Manage Subjects</a>
          </div>
        </div>

        <div class="col-md-4">
          <div class="card-module bg-dark">
            <i class="bi bi-person-check fs-2 text-info"></i> User Roles
            <h5 class="mt-3">User Roles</h5>
            <p>Assign system roles and access permissions</p>
            <a href="userRoles.jsp" class="btn btn-outline-info btn-sm">Manage User Roles</a>
          </div>
        </div>


      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
$(document).ready(function(){
    fetchDashboardCounts();
});

function fetchDashboardCounts(){
    $.ajax({
        url: 'dashboardCounts',
        type: 'GET',
        dataType: 'json',
        success: function(data){
            if(data.error){
                console.log(data.error);
            } else {
                $("#studentsCount").text(data.students);
                $("#teachersCount").text(data.teachers);
                $("#coursesCount").text(data.courses);
                $("#departmentsCount").text(data.departments);
            }
        },
        error: function(){
            console.log("Failed to fetch dashboard counts");
        }
    });
}
</script>

</body>
</html>