<%@page import="java.util.Iterator"%>
<%@page import="com.bean.AdminBean"%>
<%@page import="com.bean.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>View Products</title>

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
	background:linear-gradient(135deg,#0f172a,#1e293b,#334155);
	min-height:100vh;
	padding:40px 20px;
	overflow-x:hidden;
	position:relative;
}

/* ANIMATED BACKGROUND */

body::before{
	content:"";
	position:absolute;
	width:450px;
	height:450px;
	background:rgba(255,255,255,0.04);
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
	background:rgba(255,255,255,0.03);
	border-radius:50%;
	right:-100px;
	bottom:-100px;
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

/* MARQUEE */

.marquee{
	width:100%;
	overflow:hidden;
	white-space:nowrap;
	margin-bottom:30px;
	position:relative;
	z-index:1;
}

.marquee span{
	display:inline-block;
	padding-left:100%;
	font-size:40px;
	font-weight:700;
	color:rgba(255,255,255,0.12);
	animation:marquee 16s linear infinite;
}

@keyframes marquee{

	100%{
		transform:translateX(-100%);
	}

}

/* MAIN CONTAINER */

.container{
	position:relative;
	z-index:1;
	width:100%;
	max-width:1200px;
	margin:auto;
	background:rgba(255,255,255,0.10);
	backdrop-filter:blur(12px);
	border-radius:25px;
	padding:40px;
	box-shadow:0 10px 40px rgba(0,0,0,0.4);
	border:1px solid rgba(255,255,255,0.15);
	animation:fadeIn 1s ease;
	overflow-x:auto;
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

/* HEADING */

.heading{
	text-align:center;
	color:white;
	font-size:38px;
	font-weight:600;
	margin-bottom:15px;
}

.welcome{
	text-align:center;
	color:#ddd;
	font-size:20px;
	margin-bottom:35px;
}

/* TABLE */

.table-wrapper{
	width:100%;
	overflow-x:auto;
	border-radius:20px;
}

table{
	width:100%;
	min-width:750px;
	border-collapse:collapse;
	overflow:hidden;
	border-radius:20px;
}

table th{
	background:rgba(255,255,255,0.18);
	color:white;
	padding:18px;
	font-size:17px;
	font-weight:600;
}

table td{
	padding:18px;
	text-align:center;
	color:white;
	background:rgba(255,255,255,0.07);
	border-bottom:1px solid rgba(255,255,255,0.08);
	transition:0.3s;
}

table tr:hover td{
	background:rgba(255,255,255,0.12);
}

/* BUTTONS */

.action-btn{
	text-decoration:none;
	padding:10px 18px;
	border-radius:10px;
	color:white;
	font-size:14px;
	font-weight:500;
	transition:0.3s;
	margin:4px;
	display:inline-block;
}

.edit{
	background:linear-gradient(135deg,#36d1dc,#5b86e5);
}

.delete{
	background:linear-gradient(135deg,#ff416c,#ff4b2b);
}

.action-btn:hover{
	transform:translateY(-3px);
	box-shadow:0 8px 18px rgba(0,0,0,0.3);
}

/* NAVIGATION BUTTONS */

.nav-buttons{
	display:flex;
	justify-content:center;
	gap:20px;
	margin-top:35px;
	flex-wrap:wrap;
}

.nav-buttons a{
	text-decoration:none;
	padding:14px 26px;
	border-radius:12px;
	color:white;
	font-size:15px;
	font-weight:500;
	transition:0.4s;
}

.home{
	background:linear-gradient(135deg,#11998e,#38ef7d);
}

.add{
	background:linear-gradient(135deg,#f7971e,#ffd200);
}

.logout{
	background:linear-gradient(135deg,#ff416c,#ff4b2b);
}

.nav-buttons a:hover{
	transform:translateY(-5px) scale(1.05);
	box-shadow:0 10px 20px rgba(0,0,0,0.3);
}

/* EMPTY MESSAGE */

.empty{
	text-align:center;
	color:#ffb3b3;
	font-size:24px;
	font-weight:600;
	padding:40px;
}

/* SCROLLBAR */

::-webkit-scrollbar{
	height:8px;
	width:8px;
}

::-webkit-scrollbar-thumb{
	background:#38bdf8;
	border-radius:10px;
}

/* RESPONSIVE */

@media(max-width:992px){

	.heading{
		font-size:32px;
	}

	.welcome{
		font-size:18px;
	}

	table th,
	table td{
		padding:14px;
		font-size:14px;
	}

	.action-btn{
		padding:8px 14px;
		font-size:13px;
	}

}

@media(max-width:768px){

	body{
		padding:20px 12px;
	}

	.container{
		padding:22px 15px;
		border-radius:18px;
	}

	.heading{
		font-size:26px;
		line-height:1.4;
	}

	.welcome{
		font-size:16px;
		margin-bottom:25px;
	}

	.marquee span{
		font-size:28px;
	}

	.nav-buttons{
		flex-direction:column;
		align-items:center;
	}

	.nav-buttons a{
		width:100%;
		text-align:center;
	}

	table{
		min-width:700px;
	}

}

@media(max-width:480px){

	.heading{
		font-size:22px;
	}

	.welcome{
		font-size:15px;
	}

	.empty{
		font-size:18px;
		padding:25px 10px;
	}

	.marquee span{
		font-size:22px;
	}

	.container{
		padding:18px 12px;
	}

	table th,
	table td{
		padding:12px;
		font-size:12px;
	}

	.action-btn{
		padding:7px 10px;
		font-size:12px;
	}

}

</style>

</head>

<body>

<div class="marquee">

	<span>ShopSphere</span>

</div>

<div class="container">

	<div class="heading">

		<i class="fa-solid fa-boxes-stacked"></i>

		View Product Details

	</div>

	<%

		AdminBean abean=
		(AdminBean)session.getAttribute("AdminBean");

		ArrayList<ProductBean> al=
		(ArrayList<ProductBean>)session.getAttribute("productList");

	%>

	<div class="welcome">

		Welcome Mr.
		<%=abean.getA_FNAME()%>

	</div>

	<%

		if(al.size()==0)
		{

	%>

	<div class="empty">

		<i class="fa-solid fa-circle-exclamation"></i>

		Product Data Not Available

	</div>

	<%

		}
		else
		{

	%>

	<div class="table-wrapper">

	<table>

		<tr>

			<th>Product Code</th>

			<th>Product Name</th>

			<th>Company</th>

			<th>Price</th>

			<th>Quantity</th>

			<th>Edit</th>

			<th>Delete</th>

		</tr>

		<%

			Iterator<ProductBean> i=al.iterator();

			while(i.hasNext())
			{

				ProductBean pb=i.next();

		%>

		<tr>

			<td>
				<%=pb.getA_pcode()%>
			</td>

			<td>
				<%=pb.getA_pname()%>
			</td>

			<td>
				<%=pb.getA_pcompany()%>
			</td>

			<td>
				&#8377; <%=pb.getA_pprice()%>
			</td>

			<td>
				<%=pb.getA_pqty()%>
			</td>

			<td>

				<a href="edit?pcode=<%=pb.getA_pcode()%>"
				class="action-btn edit">

					<i class="fa-solid fa-pen"></i>

					Edit

				</a>

			</td>

			<td>

				<a href="delete?pcode=<%=pb.getA_pcode()%>"
				class="action-btn delete">

					<i class="fa-solid fa-trash"></i>

					Delete

				</a>

			</td>

		</tr>

		<%

			}

		%>

	</table>

	</div>

	<%

		}

	%>

	<div class="nav-buttons">

		<a href="AdminHome.jsp"
		class="home">

			<i class="fa-solid fa-house"></i>

			Home

		</a>

		<a href="AddProduct.html"
		class="add">

			<i class="fa-solid fa-plus"></i>

			Add Product

		</a>

		<a href="Logout"
		class="logout">

			<i class="fa-solid fa-right-from-bracket"></i>

			Logout

		</a>

	</div>

</div>

</body>
</html>