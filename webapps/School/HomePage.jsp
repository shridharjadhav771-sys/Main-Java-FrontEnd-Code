```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GlobeCreater Login Portal</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:linear-gradient(135deg,#0f172a,#1e293b,#2563eb);
    overflow:hidden;
}

/* Animated Background */
body::before{
    content:'';
    position:absolute;
    width:350px;
    height:350px;
    background:rgba(255,255,255,0.08);
    border-radius:50%;
    top:-100px;
    left:-100px;
}

body::after{
    content:'';
    position:absolute;
    width:400px;
    height:400px;
    background:rgba(255,255,255,0.08);
    border-radius:50%;
    bottom:-120px;
    right:-120px;
}

.wrapper{
    width:450px;
    padding:40px;
    border-radius:25px;
    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(18px);
    border:1px solid rgba(255,255,255,0.2);
    box-shadow:0 8px 40px rgba(0,0,0,0.35);
    color:white;
    z-index:10;
}

.logo-section{
    text-align:center;
    margin-bottom:25px;
}

.logo-circle{
    width:85px;
    height:85px;
    border-radius:50%;
    background:white;
    margin:auto;
    display:flex;
    justify-content:center;
    align-items:center;
}

.logo-circle i{
    font-size:40px;
    color:#2563eb;
}

.logo-section h2{
    margin-top:15px;
    font-weight:700;
}

.logo-section p{
    color:#dbeafe;
    font-size:14px;
}

.input-box{
    position:relative;
    margin-bottom:20px;
}

.input-box input{
    width:100%;
    height:55px;
    border:none;
    outline:none;
    border-radius:12px;
    background:rgba(255,255,255,0.15);
    color:white;
    padding-left:45px;
    padding-right:45px;
}

.input-box input::placeholder{
    color:#d1d5db;
}

.left-icon{
    position:absolute;
    left:15px;
    top:50%;
    transform:translateY(-50%);
    color:white;
}

.toggle-password{
    position:absolute;
    right:15px;
    top:50%;
    transform:translateY(-50%);
    cursor:pointer;
}

.remember-forgot{
    display:flex;
    justify-content:space-between;
    margin-bottom:20px;
    font-size:14px;
}

.remember-forgot a{
    color:white;
    text-decoration:none;
}

.remember-forgot a:hover{
    text-decoration:underline;
}

.btn-login{
    width:100%;
    height:55px;
    border:none;
    border-radius:12px;
    background:white;
    color:#2563eb;
    font-size:18px;
    font-weight:600;
    transition:.3s;
}

.btn-login:hover{
    background:#2563eb;
    color:white;
    transform:translateY(-2px);
}

.register-link{
    margin-top:20px;
    text-align:center;
}

.register-link a{
    color:#93c5fd;
    text-decoration:none;
    font-weight:600;
}

.register-link a:hover{
    text-decoration:underline;
}

#errorMsg{
    text-align:center;
    margin-bottom:15px;
    color:#ffb4b4;
    font-weight:600;
}

.footer{
    text-align:center;
    margin-top:20px;
    font-size:12px;
    color:#cbd5e1;
}

@media(max-width:500px){

    .wrapper{
        width:95%;
        padding:30px;
    }

}

</style>
</head>

<body>

<div class="wrapper">

    <div class="logo-section">

        <div class="logo-circle">
            <i class="bi bi-globe-central-south-asia"></i>
        </div>

        <h2>GlobeCreater</h2>

        <p>Secure Login Portal</p>

    </div>

    <form id="loginForm">

        <div id="errorMsg"></div>

        <div class="input-box">

            <i class="bi bi-person-fill left-icon"></i>

            <input
                type="text"
                name="username"
                id="username"
                placeholder="Enter Username"
                required>

        </div>

        <div class="input-box">

            <i class="bi bi-lock-fill left-icon"></i>

            <input
                type="password"
                name="password"
                id="password"
                placeholder="Enter Password"
                required>

            <span class="toggle-password">
                <i class="bi bi-eye-fill" id="toggleIcon"></i>
            </span>

        </div>

        <div class="remember-forgot">

            <label>
                <input type="checkbox" id="rememberMe">
                Remember Me
            </label>

            <a href="#">Forgot Password?</a>

        </div>

        <button
            type="button"
            class="btn-login"
            onclick="doSubmit()">

            Login

        </button>

        <div class="register-link">

            Don't have an account?

            <a href="#">Register Now</a>

        </div>

        <div class="footer">
            © 2026 GlobeCreater Pvt. Ltd.
        </div>

    </form>

</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<script>

$(document).ready(function(){

    if($.cookie('username')){
        $("#username").val($.cookie('username'));
        $("#rememberMe").prop('checked',true);
    }

    if($.cookie('password')){
        $("#password").val($.cookie('password'));
    }

});

$("#toggleIcon").click(function(){

    let passwordField = $("#password");

    if(passwordField.attr("type") === "password"){

        passwordField.attr("type","text");

        $(this)
        .removeClass("bi-eye-fill")
        .addClass("bi-eye-slash-fill");

    }else{

        passwordField.attr("type","password");

        $(this)
        .removeClass("bi-eye-slash-fill")
        .addClass("bi-eye-fill");
    }
});

function doSubmit(){

    $("#errorMsg").html('');

    var username=$("#username").val();
    var password=$("#password").val();

    if(username===''){
        $("#errorMsg").html("Please enter username");
        return;
    }

    if(password===''){
        $("#errorMsg").html("Please enter password");
        return;
    }

    $.ajax({

        url:'LoginServlet',
        type:'POST',

        data:{
            username:username,
            password:password
        },

        success:function(resp){

            if(resp.trim()==="Login successful"){

                if($("#rememberMe").is(":checked")){

                    $.cookie('username',username,{
                        expires:7,
                        path:'/'
                    });

                    $.cookie('password',password,{
                        expires:7,
                        path:'/'
                    });

                }else{

                    $.removeCookie('username',{path:'/'});
                    $.removeCookie('password',{path:'/'});
                }

                window.location.href="welcome.jsp";

            }else{

                $("#errorMsg").html("Invalid Username or Password");
            }
        },

        error:function(){

            $("#errorMsg").html("Server Error. Please try again.");
        }

    });

}

</script>

</body>
</html>
