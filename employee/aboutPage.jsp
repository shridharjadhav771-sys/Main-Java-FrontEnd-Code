<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
* {
	box-sizing: border-box;
}

.column {
	float: left;
	width: 33.33%;
	padding: 5px;
}

.row::after {
	content: "";
	clear: both;
	display: table;
}

h1 {
	text-align: center;
}

p {
	text-align: center;
}

div {
	text-align: center;
}
</style>
</head>
<body >


	<h1>About Us</h1>
	<p>At Globe Creater, our mission is to provide industry-relevant
		training that bridges the gap between education and employment. We are
		committed to delivering high-quality education that equips our
		students with practical skills and theoretical knowledge, enabling
		them to achieve their career goals.
	<p>
	<div class="row">
		<div class="column">
			<img src="C:\Users\Admin1\Downloads\5946.jpg" style="width: 60%">
		</div>
	</div>
</body>
</html>