<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>MAJAD Home Page.....</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Google Material Icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f5f5f5;
	margin: 0;
}

/* Sidebar */
.sidebar {
	position: fixed;
	top: 0;
	left: 0;
	width: 250px;
	height: 100vh;
	background-color: #fff; /* Changed to white */
	border-right: 1px solid #ddd;
	/* Adjusted border to match white theme */
	padding: 24px; /* Equivalent to p-6 (24px) */
	overflow-y: auto;
	display: flex;
	flex-direction: column;
	color: #333; /* Adjusted text color for readability on white */
}

.sidebar .header {
	display: flex;
	flex-direction: column;
	gap: 8px; /* Equivalent to gap-2 */
	border-bottom: 1px solid #ddd;
	/* Adjusted border to match white theme */
	padding-bottom: 24px; /* Consistent with p-6 */
}

.sidebar .header .brand {
	display: flex;
	align-items: center;
	gap: 12px; /* Equivalent to gap-3 */
}

.sidebar .header .brand .icon {
	width: 48px; /* w-12 */
	height: 48px; /* h-12 */
	background: linear-gradient(to bottom right, #8B4513, #D2B48C);
	/* Retained homepage gradient */
	border-radius: 8px; /* rounded-xl */
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* shadow-lg */
}

.sidebar .header .brand .icon .material-icons {
	font-size: 28px; /* w-7 h-7 equivalent */
	color: #d4a017; /* gold-accent, retained for contrast */
}

.sidebar .header .brand .text h2 {
	font-size: 1.25rem; /* text-xl */
	font-weight: 700;
	color: #333; /* Adjusted to dark text for white background */
	letter-spacing: 0.05em; /* tracking-wide */
	margin: 0;
}

.sidebar .header .brand .text p {
	font-size: 0.75rem; /* text-xs */
	color: rgba(51, 51, 51, 0.7); /* Adjusted to dark with opacity */
	font-weight: 500; /* font-medium */
	margin: 0;
}

.sidebar .header .brand .text .est {
	color: rgba(51, 51, 51, 0.5); /* Adjusted to dark with lower opacity */
}

.sidebar .content {
	flex: 1;
	display: flex;
	flex-direction: column;
	gap: 8px; /* gap-2 */
	overflow-y: auto;
	padding: 16px; /* p-4 */
}

.sidebar .content .group {
	position: relative;
	display: flex;
	flex-direction: column;
	padding: 8px; /* p-2 */
}

.sidebar .content .group-label {
	height: 32px; /* h-8 */
	display: flex;
	align-items: center;
	padding: 12px; /* px-3 py-3 */
	font-size: 0.75rem; /* text-xs */
	font-weight: 600; /* font-semibold */
	color: rgba(51, 51, 51, 0.8); /* Adjusted to dark with opacity */
	text-transform: uppercase;
	letter-spacing: 0.1em; /* tracking-wider */
}

.sidebar .content .group-content {
	width: 100%;
	font-size: 0.875rem; /* text-sm */
}

.sidebar .content .menu {
	display: flex;
	flex-direction: column;
	gap: 4px; /* gap-1 */
	padding: 0;
}

.sidebar .content .menu-item {
	position: relative;
}

.sidebar .content .menu-item a {
	display: flex;
	align-items: center;
	gap: 8px; /* gap-2 */
	padding: 12px; /* px-4 py-3 */
	font-size: 0.875rem; /* text-sm */
	color: rgba(51, 51, 51, 0.8); /* Adjusted to dark with opacity */
	text-decoration: none;
	border-radius: 8px; /* rounded-xl */
	margin-bottom: 8px; /* mb-2 */
	transition: all 0.3s ease;
	background-color: #f5f5f5; /* Light gray background */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05); /* shadow-sm */
}

.sidebar .content .menu-item a:hover {
	background-color: #e0e0e0; /* Slightly darker gray on hover */
	color: #333; /* Darker text on hover */
}

.sidebar .content .menu-item a .material-icons {
	font-size: 20px; /* w-5 h-5 equivalent */
	transition: transform 0.3s ease;
	background: linear-gradient(to bottom right, #8B4513, #D2B48C);
	/* Retained homepage gradient */
	-webkit-background-clip: text; /* For text fill with gradient */
	background-clip: text;
	color: transparent;
	/* Make the icon color transparent to show gradient */
}

.sidebar .content .menu-item a:hover .material-icons {
	transform: scale(1.1); /* group-hover:scale-110 */
}

.sidebar .content .delivery-info {
	padding: 16px; /* px-4 py-3 */
	display: flex;
	flex-direction: column;
	gap: 12px; /* space-y-3 */
}

.sidebar .content .delivery-info .item {
	font-size: 0.875rem; /* text-sm */
}

.sidebar .content .delivery-info .item .title {
	font-weight: 600; /* font-semibold */
	color: #333; /* Adjusted to dark text */
}

.sidebar .content .delivery-info .item .desc {
	color: rgba(51, 51, 51, 0.7); /* Adjusted to dark with opacity */
}

.sidebar .footer {
	display: flex;
	flex-direction: column;
	gap: 8px; /* gap-2 */
	border-top: 1px solid #ddd; /* Adjusted border to match white theme */
	padding: 24px; /* p-6 */
}

.sidebar .footer .welcome {
	display: flex;
	align-items: center;
	gap: 12px; /* gap-3 */
}

.sidebar .footer .welcome .icon {
	width: 40px; /* w-10 */
	height: 40px; /* h-10 */
	background: linear-gradient(to bottom right, #8B4513, #D2B48C);
	/* Retained homepage gradient */
	border-radius: 50%; /* rounded-full */
	display: flex;
	align-items: center;
	justify-content: center;
}

.sidebar .footer .welcome .icon .material-icons {
	font-size: 20px; /* w-5 h-5 */
	color: #fff; /* White for contrast */
}

.sidebar .footer .welcome .text {
	flex: 1;
	min-width: 0;
}

.sidebar .footer .welcome .text p {
	font-size: 0.875rem; /* text-sm */
	font-weight: 600; /* font-semibold */
	color: #333; /* Adjusted to dark text */
	margin: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.sidebar .footer .welcome .text .subtext {
	font-size: 0.75rem; /* text-xs */
	color: rgba(51, 51, 51, 0.7); /* Adjusted to dark with opacity */
	margin: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

/* Main Content */
.main-content {
	margin-left: 250px;
	padding: 40px;
	background: linear-gradient(135deg, #8B4513, #D2B48C);
	color: white;
	min-height: 100vh;
}

.hero-section {
	display: flex;
	justify-content: space-between;
	align-items: center;
	height: 100%;
}

.hero-text {
	max-width: 40%;
}

.hero-text h1 {
	font-size: 3rem;
	font-weight: 700;
	margin-bottom: 20px;
}

.hero-text p {
	font-size: 1.1rem;
	margin-bottom: 30px;
	opacity: 0.9;
}

.btn-purple {
	background-color: #fff;
	color: #764ba2;
	font-weight: bold;
	border-radius: 50px;
	padding: 10px 25px;
	border: none;
	transition: 0.3s;
}

.btn-purple:hover {
	background-color: #f5f5f5;
	color: #764ba2;
}

.hero-video {
	width: 55%;
	height: 100vh;
	display: flex;
	align-items: center;
}

.hero-video video {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 15px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
}

@media ( max-width : 992px) {
	.main-content {
		margin-left: 0;
		padding: 20px;
	}
	.hero-section {
		flex-direction: column;
		text-align: center;
		height: auto;
	}
	.hero-text {
		max-width: 100%;
	}
	.hero-video {
		width: 100%;
		height: auto;
	}
	.hero-video video {
		height: auto;
		width: 100%;
	}
}
</style>
</head>
<body>

	<%@ include file="header.jsp"%>

	<!-- Sidebar -->
	<div class="sidebar">
		<div class="header">
			<div class="brand">
				<div class="icon">
					<span class="material-icons">local_dining</span>
				</div>
				<div class="text">
					<h2>MAJAD</h2>
					<p>Premium Wines & Spirits</p>
					<p class="est">Est. 2025</p>
				</div>
			</div>
		</div>
		<div class="content">
			<div class="group">
				<div class="group-label">Navigation</div>
				<div class="group-content">
					<ul class="menu">
						<li class="menu-item"><a href="home.jsp"> <span
								class="material-icons">home</span> <span>Home</span>
						</a></li>
						<li class="menu-item"><a href="shop.jsp"> <span
								class="material-icons">store</span> <span>Shop</span>
						</a></li>
						<li class="menu-item"><a href="cart.jsp"> <span
								class="material-icons">shopping_cart</span> <span>Cart</span>
						</a></li>
						<li class="menu-item"><a href="orders.jsp"> <span
								class="material-icons">receipt_long</span> <span>Orders</span>
						</a></li>
					</ul>
				</div>
			</div>
			<div class="group">
				<div class="group-label">Delivery Info</div>
				<div class="group-content">
					<div class="delivery-info">
						<div class="item">
							<div class="title">Free Delivery</div>
							<div class="desc">Orders over $75</div>
						</div>
						<div class="item">
							<div class="title">Same Day</div>
							<div class="desc">Order before 2 PM</div>
						</div>
						<div class="item">
							<div class="title">Service Area</div>
							<div class="desc">Within 25 miles</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			<div class="welcome">
				<div class="icon">
					<a href="profile.jsp" class="icon" style="text-decoration:none"> <span
						class="material-icons">person</span>
					</a>
				</div>
				<div class="text">
					<p>Welcome</p>
					<p class="subtext">Premium Member</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main-content">
		<div class="hero-section">
			<div class="hero-text">
				<h1>
					Premium Wines & Spirits<br>Delivered to Your Door
				</h1>
				<p>Curated selection of the finest wines and premium spirits
					from around the world. Experience luxury with same-day delivery
					service.</p>
				<a href="products.jsp"><button class="btn btn-purple">Explore Collection</button></a>
			</div>
			<div class="hero-video">
				<video autoplay muted loop playsinline>
					<source src="glasspouring.mp4" type="video/mp4">
					Your browser does not support the video tag.
				</video>
			</div>
		</div>

		<!-- Bootstrap JS -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	</div>
</body>
</html>