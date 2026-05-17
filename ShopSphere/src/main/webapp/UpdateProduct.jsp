<%@page import="com.bean.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Message Portal</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

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
	background:linear-gradient(135deg,#141e30,#243b55);
	overflow:hidden;
	position:relative;
}

/* Animated Background */

body::before{
	content:"";
	position:absolute;
	width:450px;
	height:450px;
	background:rgba(255,255,255,0.05);
	border-radius:50%;
	top:-120px;
	left:-120px;
	animation:move1 8s infinite alternate;
}

body::after{
	content:"";
	position:absolute;
	width:350px;
	height:350px;
	background:rgba(255,255,255,0.04);
	border-radius:50%;
	bottom:-100px;
	right:-100px;
	animation:move2 10s infinite alternate;
}

@keyframes move1{
	100%{
		transform:translate(70px,70px);
	}
}

@keyframes move2{
	100%{
		transform:translate(-70px,-70px);
	}
}

/* Marquee */

.marquee{
	position:absolute;
	top:20px;
	width:100%;
	overflow:hidden;
	white-space:nowrap;
	z-index:0;
}

.marquee span{
	display:inline-block;
	padding-left:100%;
	font-size:38px;
	font-weight:700;
	color:rgba(255,255,255,0.12);
	animation:marquee 15s linear infinite;
}

@keyframes marquee{
	100%{
		transform:translateX(-100%);
	}
}

/* Main Card */

.container{
	width:520px;
	padding:45px;
	background:rgba(255,255,255,0.12);
	backdrop-filter:blur(12px);
	border-radius:25px;
	text-align:center;
	box-shadow:0 10px 40px rgba(0,0,0,0.4);
	border:1px solid rgba(255,255,255,0.15);
	position:relative;
	z-index:1;
	animation:fadeIn 1s ease;
}

@keyframes fadeIn{
	from{
		opacity:0;
		transform:translateY(40px);
	}
	to{
		opacity:1;
		transform:translateY(0);
	}
}

/* Icon */

.icon{
	width:100px;
	height:100px;
	margin:0 auto 25px;
	border-radius:50%;
	background:linear-gradient(135deg,#36d1dc,#5b86e5);
	display:flex;
	justify-content:center;
	align-items:center;
	font-size:42px;
	color:white;
	box-shadow:0 8px 25px rgba(91,134,229,0.5);
	animation:float 3s infinite ease-in-out;
}

@keyframes float{
	50%{
		transform:translateY(-10px);
	}
}

/* Text */

.container h1{
	color:white;
	font-size:34px;
	margin-bottom:15px;
	font-weight:600;
}

.welcome{
	color:#ffffff;
	font-size:20px;
	font-weight:500;
	margin-bottom:18px;
}

.message{
	color:#00ffae;
	font-size:24px;
	font-weight:600;
	margin-bottom:35px;
	line-height:1.5;
}

/* Buttons */

.btn-group{
	display:flex;
	justify-content:center;
	gap:18px;
	flex-wrap:wrap;
}

.btn-group a{
	text-decoration:none;
	padding:14px 24px;
	border-radius:12px;
	color:white;
	font-size:15px;
	font-weight:500;
	transition:0.4s;
	min-width:170px;
}

.home{
	background:linear-gradient(135deg,#11998e,#38ef7d);
}

.add{
	background:linear-gradient(135deg,#f7971e,#ffd200);
}

.view{
	background:linear-gradient(135deg,#8e2de2,#4a00e0);
}

.logout{
	background:linear-gradient(135deg,#ff416c,#ff4b2b);
}

.btn-group a:hover{
	transform:translateY(-5px) scale(1.05);
	box-shadow:0 10px 20px rgba(0,0,0,0.3);
}

</style>

</head>

<body>

<div class="marquee">
	<span>ShopSphere</span>
</div>

<div class="container">

	<div class="icon">
		<i class="fa-solid fa-circle-info"></i>
	</div>

	<h1>Admin Portal</h1>

	<%
		AdminBean abean=(AdminBean)session.getAttribute("AdminBean");
		String data=(String)request.getAttribute("msg");
	%>

	<div class="welcome">
		<i class="fa-solid fa-user"></i>
		Hello <%=abean.getA_FNAME()%>
	</div>

	<div class="message">
		<i class="fa-solid fa-circle-check"></i>
		<%=data%>
	</div>

	<div class="btn-group">

		<a href="AdminHome.jsp" class="home">
			<i class="fa-solid fa-house"></i>
			Home
		</a>

		<a href="AddProduct.html" class="add">
			<i class="fa-solid fa-plus"></i>
			Add Product
		</a>

		<a href="view1" class="view">
			<i class="fa-solid fa-eye"></i>
			View Product
		</a>

		<a href="Logout" class="logout">
			<i class="fa-solid fa-right-from-bracket"></i>
			Logout
		</a>

	</div>

</div>

</body>
</html>