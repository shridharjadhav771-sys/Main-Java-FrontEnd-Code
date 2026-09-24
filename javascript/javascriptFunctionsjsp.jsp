<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JavaScript Methods in JSP</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
        // 1. DOM Manipulation
        function changeText() {
            var element = document.getElementById("demoText");
            element.innerHTML = "The text has been changed!";
        }

        // 2. Event Handling
        function showAlert() {
            alert("Hello! You clicked the button.");
        }

        // 3. Adding a new element dynamically
        function addElement() {
            var newElement = document.createElement("div");
            newElement.innerHTML = "This is a dynamically added element.";
            document.body.appendChild(newElement);
        }

        // 4. Fetch API (AJAX) example
        function fetchData() {
            fetch('https://jsonplaceholder.typicode.com/posts/1')
                .then(response => response.json())
                .then(data => {
                    document.getElementById("ajaxContent").innerHTML = `
                        <h3>Fetched Data:</h3>
                        <p><strong>Title:</strong> ${data.title}</p>
                        <p><strong>Body:</strong> ${data.body}</p>
                    `;
                })
                .catch(error => console.log('Error fetching data:', error));
        }

        // 5. LocalStorage example
        function saveData() {
            localStorage.setItem('username', document.getElementById('username').value);
            alert('Data saved in LocalStorage!');
        }

        function retrieveData() {
            var username = localStorage.getItem('username');
            alert('Saved username: ' + username);
        }

        // 6. Validate input field
        function validateInput() {
            var inputValue = document.getElementById("userInput").value;
            if(inputValue === "") {
                alert("Input field cannot be empty!");
            } else {
                alert("You entered: " + inputValue);
            }
        }
    </script>
</head>
<body>
	<div class="container">
		<h1>
			<i>Using JavaScript Methods in JSP</i>
		</h1>

		<p id="demoText">
			<b>JavaScript is a scripting language used to develop web pages.</b>
		</p>
		<button onclick="changeText()">Change Text</button>
		<br> <br>

		<button onclick="showAlert()">Show Alert</button>
		<br> <br>

		<button onclick="addElement()">Add New Element</button>
		<br> <br>

		<button onclick="fetchData()">Fetch Data via AJAX</button>
		<div id="ajaxContent"></div>
		<br> <br> <input type="text" id="username"
			placeholder="Enter Username">
		<button onclick="saveData()">Save Username to LocalStorage</button>
		<br> <br>
		<button onclick="retrieveData()">Retrieve Saved Username</button>
		<br> <br> <input type="text" id="userInput"
			placeholder="Enter something">
		<button onclick="validateInput()">Validate Input</button>
		<br> <br>
	</div>
</body>
</html>
