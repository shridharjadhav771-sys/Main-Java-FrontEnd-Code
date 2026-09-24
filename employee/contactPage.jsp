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
<body>

	<p
		style="background-image: url('images/online-programming-course-hero-section-bg.svg');">
	<h1>Our Infrastructure</h1>
	<p>Welcome to Globe Creater, where we believe that a conducive
		learning environment is crucial for nurturing talent and fostering
		innovation. Located on the top floor, our boasts state-of-the-art
		infrastructure designed to provide our students with the best possible
		learning experience.</p>



	<div class="row">
		<div class="column">
			<img src="images\GlobeCreater1.jpg"
				 style="width: 60%">
		</div>
		<div class="column">
			<img src="C:\Users\Admin1\Downloads\java image\GlobeCreater2.jpg"
				 style="width: 63%">
		</div>
		<div class="column">
			<img src="C:\Users\Admin1\Downloads\java image\GlobeCreater3.jpg"
			 style="width: 63%">
		</div>
	</div>

	<div class="row">
		<div class="column">
			<br> <br> <br>
			<h2>Contact Us​</h2>

			<h2>Address​</h2>
			<h4>Address: ​ Survey No 127/3, Plot No 12, Mayur Colony, Karve
				Road Kothrud, Pune, 411038</h4>
			<h2>Email Us​</h2>
			<h3>contact@globecreater.com</h3>
		</div>
		<div class="column">
			<form>
				<br> <br>
				<div class="row">
					Name: <input type="text" name="name">
				</div>
				<br>
				<div class="row">
					Email: <input type="text" name="name">
				</div>
				<br>
				<div class="row">
					Subject : <input type="text" name="name">
				</div>
				<br>
				<div class="row">

					<label>Message:</label><br> <br>

					<textarea name="message" rows="3" cols="30">
	 
	</textarea>
					<br> <br> <input type="submit">

				</div>
				<br>
			</form>

		</div>
	</div>



</body>
</html>