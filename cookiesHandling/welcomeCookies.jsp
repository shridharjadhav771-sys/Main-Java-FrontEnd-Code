<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>User Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
    <!-- Custom CSS -->
    <style>
body {
	background-image: url('fullview.jpg');
	background-size: cover;
	background-position: center;
}
</style>
    <style>
        body {
            background-color: #f4f6f9;
            font-family: Arial, sans-serif;
            color: #333;
        }
        
        .container {
            max-width: 500px;
            margin-top: 50px;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #007BFF;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 8px;
            margin-bottom: 20px;
            padding: 10px;
        }

        .btn-primary {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            border: none;
            border-radius: 8px;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body onload="checkCookie()">

    <div class="container">
        <h2>User Information Form</h2>
        <form id="userForm" onsubmit="event.preventDefault(); submitForm();">
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="address" class="form-label">Address:</label>
                <input type="text" id="address" name="address" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Phone Number:</label>
                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" id="password" name="password" class="form-control" required>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" 
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zyJ2t6by1mN0d5xY5BRSF1g1Gv4nJH4f7dy" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" 
    integrity="sha384-pzjw8f+ua7Kw1TIq0eLVm7bPtBkVq5qu1C1FZbK6TAcflXT2U1TkNf9JhJdy9X2k" crossorigin="anonymous"></script>
    
    <!-- Cookie Script -->
    <script>
        <!--  Set a cookie with a name, value, and expiration days -->
        function setCookie(cname, cvalue, exdays) {
            const d = new Date();
            d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
            let expires = "expires=" + d.toUTCString();
            document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
        }

        <!-- Get the value of a cookie by its name  -->
        function getCookie(cname) {
            let name = cname + "=";
            let decodedCookie = decodeURIComponent(document.cookie);
            let ca = decodedCookie.split(';');
            for (let i = 0; i < ca.length; i++) {
                let c = ca[i];
                while (c.charAt(0) == ' ') {
                    c = c.substring(1);
                }
                if (c.indexOf(name) == 0) {
                    return c.substring(name.length, c.length);
                }
            }
            return "";
        }

        <!-- Check cookies and show user info or prompt for data  -->
        function checkCookie() {
            let username = getCookie("username");
            let email = getCookie("email");
            let address = getCookie("address");
            let phoneNumber = getCookie("phoneNumber");
            let password = getCookie("password");

            if (username != "") {
                alert("Welcome back " + username);
            } else {
                username = prompt("Please enter your name:", "");
                if (username != "" && username != null) {
                    setCookie("username", username, 30);
                }
            }

            <!-- Check for other cookies and fill out form fields if available  -->
            if (email != "") {
                document.getElementById("email").value = email;
            }
            if (address != "") {
                document.getElementById("address").value = address;
            }
            if (phoneNumber != "") {
                document.getElementById("phoneNumber").value = phoneNumber;
            }
            if (password != "") {
                document.getElementById("password").value = password;
            }
        }

        <!-- Set cookies when form is submitted  -->
        function submitForm() {
            let email = document.getElementById("email").value;
            let address = document.getElementById("address").value;
            let phoneNumber = document.getElementById("phoneNumber").value;
            let password = document.getElementById("password").value;

            if (email != "") {
                setCookie("email", email, 30);
            }
            if (address != "") {
                setCookie("address", address, 30);
            }
            if (phoneNumber != "") {
                setCookie("phoneNumber", phoneNumber, 30);
            }
            if (password != "") {
                setCookie("password", password, 30);
            }

            alert("Form submitted and cookies are saved!");
        }
    </script>
</body>

</html>
