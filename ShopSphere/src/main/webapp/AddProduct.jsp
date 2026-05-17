<%@page import="com.bean.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

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
	min-height:100vh;
	display:flex;
	justify-content:center;
	align-items:center;
	background:linear-gradient(135deg,#141e30,#243b55);
	overflow-x:hidden;
	position:relative;
	padding:20px;
}

/* Animated Background */

body::before{
	content:"";
	position:absolute;
	width:500px;
	height:500px;
	background:rgba(255,255,255,0.05);
	border-radius:50%;
	top:-150px;
	left:-150px;
	animation:move1 8s infinite alternate;
}

body::after{
	content:"";
	position:absolute;
	width:400px;
	height:400px;
	background:rgba(255,255,255,0.04);
	border-radius:50%;
	bottom:-120px;
	right:-120px;
	animation:move2 10s infinite alternate;
}

@keyframes move1{
	100%{
		transform:translate(80px,80px);
	}
}

@keyframes move2{
	100%{
		transform:translate(-80px,-80px);
	}
}

/* Dashboard Card */

.dashboard{
	width:100%;
	max-width:550px;
	padding:45px;
	background:rgba(255,255,255,0.12);
	backdrop-filter:blur(12px);
	border-radius:25px;
	text-align:center;
	box-shadow:0 10px 40px rgba(0,0,0,0.4);
	border:1px solid rgba(255,255,255,0.2);
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

.dashboard h1{
	color:white;
	font-size:32px;
	margin-bottom:15px;
	font-weight:600;
	word-break:break-word;
}

.success{
	color:#00ffae;
	font-size:22px;
	font-weight:500;
	margin-bottom:35px;
	line-height:1.5;
}

/* Icon */

.icon{
	width:100px;
	height:100px;
	background:linear-gradient(135deg,#00c6ff,#0072ff);
	margin:0 auto 25px;
	border-radius:50%;
	display:flex;
	justify-content:center;
	align-items:center;
	font-size:42px;
	color:white;
	box-shadow:0 8px 25px rgba(0,114,255,0.5);
	animation:float 3s infinite ease-in-out;
}

@keyframes float{
	50%{
		transform:translateY(-10px);
	}
}

/* Buttons */

.btn-group{
	display:grid;
	grid-template-columns:repeat(2,1fr);
	gap:18px;
	margin-top:25px;
}

.btn-group a{
	text-decoration:none;
	padding:14px 20px;
	border-radius:12px;
	font-size:15px;
	font-weight:500;
	color:white;
	transition:0.4s;
	position:relative;
	overflow:hidden;
	display:flex;
	align-items:center;
	justify-content:center;
	gap:10px;
	text-align:center;
}

.btn1{
	background:linear-gradient(135deg,#ff9966,#ff5e62);
}

.btn2{
	background:linear-gradient(135deg,#36d1dc,#5b86e5);
}

.btn3{
	background:linear-gradient(135deg,#6a11cb,#2575fc);
}

.btn4{
	background:linear-gradient(135deg,#ff416c,#ff4b2b);
}

.btn-group a:hover{
	transform:translateY(-5px) scale(1.03);
	box-shadow:0 10px 20px rgba(0,0,0,0.3);
}

/* Marquee */

.marquee{
	position:absolute;
	top:20px;
	left:0;
	width:100%;
	color:rgba(255,255,255,0.15);
	font-size:40px;
	font-weight:700;
	white-space:nowrap;
	overflow:hidden;
	z-index:0;
	pointer-events:none;
}

.marquee span{
	display:inline-block;
	padding-left:100%;
	animation:marquee 15s linear infinite;
}

@keyframes marquee{
	100%{
		transform:translateX(-100%);
	}
}

/* RESPONSIVE */

@media(max-width:768px){

	body{
		padding:15px;
		align-items:flex-start;
		padding-top:80px;
	}

	.dashboard{
		padding:35px 25px;
		border-radius:22px;
	}

	.dashboard h1{
		font-size:28px;
	}

	.success{
		font-size:19px;
	}

	.icon{
		width:85px;
		height:85px;
		font-size:36px;
	}

	.marquee{
		font-size:30px;
		top:15px;
	}

}

@media(max-width:480px){

	body{
		padding:12px;
		padding-top:70px;
	}

	.dashboard{
		padding:28px 18px;
		border-radius:20px;
	}

	.dashboard h1{
		font-size:24px;
		line-height:1.4;
	}

	.success{
		font-size:17px;
		margin-bottom:28px;
	}

	.icon{
		width:75px;
		height:75px;
		font-size:30px;
		margin-bottom:20px;
	}

	.btn-group{
		grid-template-columns:1fr;
		gap:14px;
	}

	.btn-group a{
		width:100%;
		font-size:14px;
		padding:13px 15px;
	}

	.marquee{
		font-size:22px;
	}

	body::before{
		width:300px;
		height:300px;
	}

	body::after{
		width:250px;
		height:250px;
	}

}

</style>

</head>

<body>

<div class="marquee">
	<span>ShopSphere</span>
</div>

<div class="dashboard">

	<div class="icon">
		<i class="fa-solid fa-user-shield"></i>
	</div>

	<%
		AdminBean ab=(AdminBean)session.getAttribute("AdminBean");
	%>

	<h1>
		Welcome Mr. <%=ab.getA_FNAME()%>
	</h1>

	<div class="success">
		<i class="fa-solid fa-circle-check"></i>
		Product Added Successfully
	</div>

	<div class="btn-group">

		<a href="AdminHome.jsp" class="btn1">

			<i class="fa-solid fa-house"></i>

			Home

		</a>

		<a href="AddProduct.html" class="btn2">

			<i class="fa-solid fa-plus"></i>

			Add Product

		</a>

		<a href="view1" class="btn3">

			<i class="fa-solid fa-eye"></i>

			View Product

		</a>

		<a href="Logout" class="btn4">

			<i class="fa-solid fa-right-from-bracket"></i>

			LogOut

		</a>

	</div>

</div>

</body>
</html>