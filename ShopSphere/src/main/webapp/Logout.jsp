<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	session.invalidate();

	// Redirect after 3 seconds
	response.setHeader("Refresh","3;URL=index.html");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout Page</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:'Poppins',sans-serif;
}

body{
	height:100vh;
	display:flex;
	justify-content:center;
	align-items:center;
	background:linear-gradient(135deg,#020617,#0f172a,#111827);
	overflow:hidden;
	position:relative;
}

/* Animated Lines */

.lines{
	position:absolute;
	width:100%;
	height:100%;
	overflow:hidden;
}

.lines span{
	position:absolute;
	display:block;
	width:2px;
	height:220px;
	background:rgba(255,255,255,0.08);
	animation:move 8s linear infinite;
}

.lines span:nth-child(1){
	left:10%;
	animation-delay:0s;
}

.lines span:nth-child(2){
	left:30%;
	animation-delay:2s;
}

.lines span:nth-child(3){
	left:50%;
	animation-delay:4s;
}

.lines span:nth-child(4){
	left:70%;
	animation-delay:1s;
}

.lines span:nth-child(5){
	left:90%;
	animation-delay:3s;
}

@keyframes move{
	0%{
		transform:translateY(-250px);
	}
	100%{
		transform:translateY(100vh);
	}
}

/* Main Card */

.logout-card{
	width:430px;
	padding:45px 35px;
	border-radius:28px;
	background:rgba(15,23,42,0.8);
	border:1px solid rgba(255,255,255,0.08);
	box-shadow:
	0 15px 40px rgba(0,0,0,0.5),
	0 0 40px rgba(59,130,246,0.15);
	backdrop-filter:blur(15px);
	text-align:center;
	position:relative;
	z-index:10;
	overflow:hidden;
	animation:cardShow 1s ease;
}

@keyframes cardShow{
	from{
		opacity:0;
		transform:translateY(50px) scale(0.8);
	}
	to{
		opacity:1;
		transform:translateY(0px) scale(1);
	}
}

/* Top Glow */

.logout-card::before{
	content:"";
	position:absolute;
	width:100%;
	height:5px;
	top:0;
	left:0;
	background:linear-gradient(to right,#06b6d4,#3b82f6,#8b5cf6);
}

/* Success Circle */

.success-circle{
	width:120px;
	height:120px;
	margin:auto;
	border-radius:50%;
	background:rgba(59,130,246,0.12);
	display:flex;
	justify-content:center;
	align-items:center;
	border:3px solid rgba(59,130,246,0.3);
	margin-bottom:25px;
	position:relative;
}

.success-circle::before{
	content:"";
	position:absolute;
	width:90px;
	height:90px;
	border-radius:50%;
	background:linear-gradient(135deg,#06b6d4,#3b82f6);
	box-shadow:0 0 30px rgba(59,130,246,0.5);
}

.success-circle i{
	position:relative;
	font-size:42px;
	color:white;
	z-index:2;
}

/* Heading */

h1{
	color:white;
	font-size:34px;
	font-weight:700;
	margin-bottom:12px;
	letter-spacing:1px;
}

.message{
	color:#cbd5e1;
	font-size:15px;
	line-height:1.8;
	margin-bottom:28px;
}

/* Countdown */

.countdown{
	display:inline-block;
	padding:12px 22px;
	border-radius:50px;
	background:rgba(255,255,255,0.06);
	border:1px solid rgba(255,255,255,0.08);
	color:#e2e8f0;
	font-size:14px;
	margin-bottom:28px;
}

.countdown i{
	color:#38bdf8;
	margin-right:8px;
}

/* Progress Ring */

.loader{
	width:90px;
	height:90px;
	margin:auto;
	position:relative;
}

.loader svg{
	transform:rotate(-90deg);
}

.loader circle{
	fill:none;
	stroke-width:8;
	stroke-linecap:round;
}

.loader .bg{
	stroke:rgba(255,255,255,0.08);
}

.loader .progress{
	stroke:url(#gradient);
	stroke-dasharray:251;
	stroke-dashoffset:251;
	animation:progress 3s linear forwards;
}

@keyframes progress{
	to{
		stroke-dashoffset:0;
	}
}

.footer{
	margin-top:25px;
	font-size:13px;
	color:#94a3b8;
	letter-spacing:1px;
}

</style>
</head>

<body>

<div class="lines">
	<span></span>
	<span></span>
	<span></span>
	<span></span>
	<span></span>
</div>

<div class="logout-card">

	<div class="success-circle">
		<i class="fa-solid fa-check"></i>
	</div>

	<h1>See You Again!</h1>

	<div class="message">
		<%
			out.println("Logout Successfully!!");
		%>
		<br>
		You have securely signed out from the  Dashboard.
	</div>

	<div class="countdown">
		<i class="fa-solid fa-clock"></i>
		Redirecting to Login Page...
	</div>

	<div class="loader">

		<svg width="90" height="90">

			<defs>
				<linearGradient id="gradient">
					<stop offset="0%" stop-color="#06b6d4"/>
					<stop offset="100%" stop-color="#8b5cf6"/>
				</linearGradient>
			</defs>

			<circle class="bg" cx="45" cy="45" r="40"></circle>

			<circle class="progress" cx="45" cy="45" r="40"></circle>

		</svg>

	</div>

	<div class="footer">
		ONLINE ECOMMERCE WEBSITE
	</div>

</div>

</body>
</html>