
<%@ include file="session_expired.jsp" %>
<!-- nav.jsp -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark py-4">
  <div class="container-fluid">
    <a class="navbar-brand" href="welcome.jsp">
    	<img src="Images/School2.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top me-2">
    	<img src="Images/logo (1).png" alt="Logo" width="200" height="30" class="d-inline-block align-text-top me-2">
  
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav"
            aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="mainNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
      

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle fs-6 text-light" href="#" id="mastersDropdown" role="button"
             data-bs-toggle="dropdown" aria-expanded="false" >Masters</a>
          <ul class="dropdown-menu" aria-labelledby="mastersDropdown">
            <li><a class="dropdown-item" href="class">Classes</a></li>
            <li><a class="dropdown-item" href="course">Courses</a></li>
            <li><a class="dropdown-item" href="department">Departments</a></li>
            <li><a class="dropdown-item" href="designation">Designations</a></li>
            <li><a class="dropdown-item" href="examTypes">Exam Types</a></li>
            <li><a class="dropdown-item" href="feeTypes">Fee Types</a></li>
            <li><a class="dropdown-item" href="subjects">Subjects</a></li>
            <li><a class="dropdown-item" href="userRoles">User Roles</a></li>
          </ul>
        </li>


		<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle fs-6 text-light" href="#" id="transactionsDropdown" role="button"
             data-bs-toggle="dropdown" aria-expanded="false">Transactions</a>
          <ul class="dropdown-menu" aria-labelledby="mastersDropdown">
            <li><a class="dropdown-item" href="marksList">Marks</a></li>
            <li><a class="dropdown-item" href="Teachers.jsp">Teachers</a></li>
            <li><a class="dropdown-item" href="Students.jsp">Students</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="logout.jsp">Logout</a>
        </li>
		
      </ul>
      
    </div>
    <!-- Notification bell -->


  </div>
</nav>
