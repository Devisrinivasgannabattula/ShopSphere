<%@page import="com.bean.ProductBean"%>
<%@page import="com.bean.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>

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
	background:linear-gradient(135deg,#0f2027,#203a43,#2c5364);
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
	width:500px;
	padding:45px;
	background:rgba(255,255,255,0.12);
	backdrop-filter:blur(12px);
	border-radius:25px;
	box-shadow:0 10px 40px rgba(0,0,0,0.4);
	border:1px solid rgba(255,255,255,0.15);
	position:relative;
	z-index:1;
	animation:fadeIn 1s ease;
	text-align:center;
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
	background:linear-gradient(135deg,#f7971e,#ffd200);
	display:flex;
	justify-content:center;
	align-items:center;
	font-size:40px;
	color:white;
	box-shadow:0 8px 25px rgba(255,210,0,0.4);
	animation:float 3s infinite ease-in-out;
}

@keyframes float{
	50%{
		transform:translateY(-10px);
	}
}

/* Heading */

.container h1{
	color:white;
	font-size:34px;
	margin-bottom:15px;
	font-weight:600;
}

.welcome{
	color:#ddd;
	font-size:18px;
	margin-bottom:35px;
}

/* Input Group */

.input-group{
	position:relative;
	margin-bottom:25px;
}

.input-group i{
	position:absolute;
	top:17px;
	left:15px;
	color:#ddd;
	font-size:16px;
}

.input-group input{
	width:100%;
	padding:15px 15px 15px 48px;
	border:none;
	outline:none;
	border-radius:12px;
	background:rgba(255,255,255,0.15);
	color:white;
	font-size:15px;
	transition:0.3s;
}

.input-group input:focus{
	background:rgba(255,255,255,0.22);
	transform:scale(1.02);
	box-shadow:0 0 12px rgba(255,255,255,0.2);
}

/* Submit Button */

.btn{
	width:100%;
	padding:15px;
	border:none;
	border-radius:14px;
	background:linear-gradient(135deg,#36d1dc,#5b86e5);
	color:white;
	font-size:18px;
	font-weight:600;
	cursor:pointer;
	transition:0.4s;
	margin-top:10px;
}

.btn:hover{
	transform:translateY(-4px);
	box-shadow:0 10px 20px rgba(0,0,0,0.3);
}

/* Navigation Buttons */

.nav{
	display:flex;
	justify-content:center;
	gap:15px;
	margin-top:25px;
	flex-wrap:wrap;
}

.nav a{
	text-decoration:none;
	padding:12px 20px;
	border-radius:10px;
	color:white;
	font-size:14px;
	font-weight:500;
	transition:0.4s;
}

.home{
	background:linear-gradient(135deg,#11998e,#38ef7d);
}

.view{
	background:linear-gradient(135deg,#8e2de2,#4a00e0);
}

.logout{
	background:linear-gradient(135deg,#ff416c,#ff4b2b);
}

.nav a:hover{
	transform:translateY(-4px) scale(1.05);
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
		<i class="fa-solid fa-pen-to-square"></i>
	</div>

	<h1>Edit Portal</h1>

	<%
		AdminBean abean=(AdminBean)session.getAttribute("AdminBean");
		ProductBean pb=(ProductBean)request.getAttribute("pbean");
	%>

	<div class="welcome">
		Hello <%=abean.getA_FNAME()%>, please edit the product details
	</div>

	<form action="update" method="post">

		<div class="input-group">
			<i class="fa-solid fa-indian-rupee-sign"></i>
			<input type="text" 
				   value="<%=pb.getA_pprice()%>" 
				   name="p_price"
				   placeholder="Enter Product Price">
		</div>

		<div class="input-group">
			<i class="fa-solid fa-layer-group"></i>
			<input type="text" 
				   value="<%=pb.getA_pqty()%>" 
				   name="p_qty"
				   placeholder="Enter Product Quantity">
		</div>

		<input type="hidden" 
			   name="p_code" 
			   value="<%=pb.getA_pcode()%>">

		<input type="submit" 
			   value="Update Product" 
			   class="btn">

	</form>

	<div class="nav">

		<a href="AdminHome.jsp" class="home">
			<i class="fa-solid fa-house"></i>
			Home
		</a>

		<a href="view1" class="view">
			<i class="fa-solid fa-eye"></i>
			View Products
		</a>

		<a href="Logout" class="logout">
			<i class="fa-solid fa-right-from-bracket"></i>
			Logout
		</a>

	</div>

</div>

</body>
</html>