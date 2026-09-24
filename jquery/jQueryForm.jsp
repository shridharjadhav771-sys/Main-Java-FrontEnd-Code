<!DOCTYPE html>
<html>
<head>
<title>First jQuery Example</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js">
	
</script>
<script type="text/javascript" language="javascript">
	$(document).ready(function() {

						// Styling changes
						$("p").css("background-color", "Wheat");
						$("p").css("font-size", "18px");

						// Hover effect
						$("p").hover(function() {$(this).css("color", "black");
						}, function() {
							$(this).css("color", "red");
						});

						// Click effect to fade out paragraph
						$("p").click(function() {
							$(this).fadeOut(1000);
						});

						// Slide toggle effect for hidden text
						$("#toggleText").click(function() {
							$(".hiddenText").slideToggle();
						});

						// Fade in effect
						$("#fadeInBtn").click(function() {
							$(".fadeInText").fadeIn(1000);
						});

						// Fade out effect
						$("#fadeOutBtn").click(function() {
							$(".fadeOutText").fadeOut(1000);
						});

						// Animate effect (move an element)
						$("#animateBtn").click(function() {
							$(".animateText").animate({
								left : '250px',
								opacity : '0.5',
								height : 'toggle'
							}, 1500);
						});

						// Toggle class on a button click
						$("#toggleClassBtn").click(function() {
							$("p").toggleClass("highlighted");
						});

						// Append new content to a div
						$("#appendBtn").click(function() {$("#newContent").append(
															"<p>This is some dynamically appended content!</p>");
										});

						// Prepend new content to a div
						$("#prependBtn").click(function() {$("#newContent").prepend(
															"<p>This content is prepended at the top!</p>");
										});

						// Toggle visibility of an element
						$("#toggleVisibilityBtn").click(function() {$(".toggleVisibilityText").toggle();
						});

						// Show element
						$("#showBtn").click(function() {$(".showText").show();
						});

						// Hide element
						$("#hideBtn").click(function() {$(".hideText").hide();
						});

						// Delay effect
						$("#delayBtn").click(function() {$(".delayText").delay(1000).fadeIn(1000);
						});
					});

	$(function() {$("p").css("color", "black");
	});
</script>

</head>
<body>
	<div class="container">
		<p>
			<b>The $ sign is nothing but an identifier of jQuery() function.
				Instead of writing jQuery we simply write $ which is the same as
				jQuery() function. A $ with a selector specifies that it is a jQuery
				selector.</b>
		</p>
		<p>
			<b>jQuery is a lightweight, "write less, do more", JavaScript
				library. The purpose of jQuery is to make it much easier to use
				JavaScript on your website.</b>
		</p>
		<p>
			<b>The name was chosen because the library was designed to make
				it easier to work with JavaScript.</b>
		</p>

		<!-- Button to toggle text visibility -->
		<button id="toggleText" class="btn btn-primary">Toggle Text</button>
		<p class="hiddenText" style="display: none;">
			<b>This text is hidden and can be toggled by clicking the button
				above!</b>
		</p>

		<!-- Buttons to demonstrate various effects -->
		<button id="fadeInBtn" class="btn btn-success">Fade In Text</button>
		<p class="fadeInText" style="display: none;">
			<b>This text will fade in!</b>
		</p>

		<button id="fadeOutBtn" class="btn btn-danger">Fade Out Text</button>
		<p class="fadeOutText">
			<b>This text will fade out when the button is clicked.</b>
		</p>

		<button id="animateBtn" class="btn btn-warning">Animate Text</button>
		<p class="animateText" style="position: relative; left: 0px;">
			<b>This text will animate and move across the screen!</b>
		</p>

		<button id="toggleClassBtn" class="btn btn-info">Toggle Class</button>
		<p class="highlighted">
			<b>This paragraph will change class when the button is clicked.</b>
		</p>

		<button id="appendBtn" class="btn btn-secondary">Append Text</button>
		<div id="newContent">
			<p>This is existing content.</p>
		</div>

		<button id="prependBtn" class="btn btn-secondary">Prepend
			Text</button>
		<div id="newContent"></div>

		<button id="toggleVisibilityBtn" class="btn btn-dark">Toggle
			Visibility</button>
		<p class="toggleVisibilityText" style="display: none;">
			<b>This text will toggle visibility.</b>
		</p>

		<button id="showBtn" class="btn btn-light">Show Text</button>
		<p class="showText" style="display: none;">
			<b>This text will be shown when you click the button.</b>
		</p>

		<button id="hideBtn" class="btn btn-dark">Hide Text</button>
		<p class="hideText">
			<b>This text will be hidden when you click the button.</b>
		</p>

		<button id="delayBtn" class="btn btn-primary">Delay Fade In</button>
		<p class="delayText" style="display: none;">
			<b>This text will fade in with a delay.</b>
		</p>
	</div>
</body>
</html>
