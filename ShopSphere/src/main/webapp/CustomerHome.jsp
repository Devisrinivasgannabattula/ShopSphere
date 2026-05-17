<%@page import="com.customer.bean.CustomerBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>ShopSphere - Customer Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<style>


*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

html{
    scroll-behavior:smooth;
}

body{
    background:#f1f5f9;
    overflow-x:hidden;
    color:#0f172a;
}

/* SCROLLBAR */

::-webkit-scrollbar{
    width:8px;
}

::-webkit-scrollbar-thumb{
    background:#2563eb;
    border-radius:10px;
}

/* NAVBAR */

.navbar{
    width:100%;
    height:78px;
    background:white;
    position:fixed;
    top:0;
    left:0;
    z-index:1000;
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:0 30px;
    box-shadow:0 4px 18px rgba(0,0,0,0.08);
}

.logo{
    text-decoration:none;
    color:#0f172a;
    display:flex;
    align-items:center;
    gap:12px;
    font-size:28px;
    font-weight:700;
}

.logo i{
    color:#2563eb;
}

.top-right{
    display:flex;
    align-items:center;
    gap:18px;
}

/* SEARCH */

.search-box{
    width:260px;
    background:#f1f5f9;
    padding:12px 16px;
    border-radius:14px;
    display:flex;
    align-items:center;
    gap:10px;
}


.search-box input{
    width:100%;
    border:none;
    outline:none;
    background:none;
    font-size:14px;
}

/* CLOCK */

.live-clock{
    background:#2563eb;
    color:white;
    padding:12px 18px;
    border-radius:12px;
    font-weight:600;
}

/* MESSAGE ICON */

.message-box{
    position:relative;
    width:48px;
    height:48px;
    background:#eff6ff;
    border-radius:14px;
    display:flex;
    align-items:center;
    justify-content:center;
    cursor:pointer;
    transition:0.3s;
}

.message-box:hover{
    transform:translateY(-3px);
}

.message-box i{
    font-size:20px;
    color:#2563eb;
}

.message-count{
    position:absolute;
    top:-6px;
    right:-6px;
    width:24px;
    height:24px;
    background:#ef4444;
    color:white;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:12px;
    font-weight:700;
}

.offers-popup{
    position:absolute;
    top:65px;
    right:0;
    width:320px;
    background:white;
    border-radius:20px;
    box-shadow:0 10px 30px rgba(0,0,0,0.15);
    padding:20px;
    display:none;
}

.offer-item{
    padding:12px;
    border-radius:12px;
    margin-bottom:12px;
    background:#f8fafc;
    border-left:5px solid #2563eb;
}

.offer-item h4{
    margin-bottom:6px;
    color:#2563eb;
}

/* THEME */

.theme-btn{
    width:48px;
    height:48px;
    border:none;
    border-radius:14px;
    background:#2563eb;
    color:white;
    cursor:pointer;
    transition:0.3s;
}

.theme-btn:hover{
    transform:scale(1.05);
}

/* PROFILE */

.customer-profile{
    display:flex;
    align-items:center;
    gap:12px;
    position:relative;
}

.customer-profile img{
    width:50px;
    height:50px;
    border-radius:50%;
    border:3px solid #2563eb;
    cursor:pointer;
}

.customer-name{
    font-weight:600;
}

.profile-menu{
    position:absolute;
    top:70px;
    right:0;
    width:240px;
    background:white;
    border-radius:18px;
    overflow:hidden;
    display:none;
    box-shadow:0 10px 25px rgba(0,0,0,0.12);
}

.profile-menu a{
    display:flex;
    align-items:center;
    gap:12px;
    padding:16px;
    text-decoration:none;
    color:#0f172a;
    transition:0.3s;
}

.profile-menu a:hover{
    background:#eff6ff;
}

/* SIDEBAR */

.sidebar{
    width:260px;
    height:100vh;
    background:linear-gradient(to bottom,#0f172a,#1e293b);
    position:fixed;
    top:78px;
    left:0;
    padding-top:20px;
    transition:0.4s;
    z-index:999;
}

.sidebar.hide{
    left:-260px;
}

.toggle-bar{
    color:white;
    font-size:24px;
    padding:0 30px 20px;
    cursor:pointer;
}

.sidebar a{
    display:flex;
    align-items:center;
    color:white;
    text-decoration:none;
    padding:18px 30px;
    margin:8px 15px;
    border-radius:14px;
    transition:0.3s;
}

.sidebar a i{
    margin-right:15px;
}

.sidebar a:hover{
    background:linear-gradient(90deg,#2563eb,#38bdf8);
    transform:translateX(5px);
}

/* MAIN CONTENT */

.main-content{
    margin-left:260px;
    margin-top:78px;
    padding:35px;
    transition:0.4s;
    min-height:100vh;
    padding-bottom:120px;
}

.main-content.full{
    margin-left:0;
}

.page-section{
    display:none;
}

#homePage{
    display:block;
}

/* HERO */

.hero{
    background:linear-gradient(135deg,#2563eb,#38bdf8);
    padding:45px;
    border-radius:30px;
    color:white;
    margin-bottom:30px;
    position:relative;
    overflow:hidden;
}

.hero::before{
    content:'';
    position:absolute;
    width:300px;
    height:300px;
    border-radius:50%;
    background:rgba(255,255,255,0.12);
    top:-120px;
    right:-80px;
}

.hero h1{
    font-size:42px;
    margin-bottom:12px;
}

.hero p{
    font-size:18px;
}

/* STATS */

.stats-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(230px,1fr));
    gap:20px;
    margin-bottom:30px;
}

.stat-card{
    background:white;
    padding:25px;
    border-radius:24px;
    box-shadow:0 8px 20px rgba(0,0,0,0.06);
    display:flex;
    align-items:center;
    justify-content:space-between;
}

.stat-card i{
    width:65px;
    height:65px;
    border-radius:18px;
    background:#eff6ff;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:28px;
    color:#2563eb;
}

.stat-card h2{
    margin-top:10px;
    color:#2563eb;
}

/* MARQUEE */

.marquee-box{
    background:white;
    padding:16px;
    border-radius:18px;
    border-left:6px solid #2563eb;
    margin-bottom:30px;
    box-shadow:0 5px 15px rgba(0,0,0,0.05);
}

/* PRODUCTS */

.product-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(260px,1fr));
    gap:25px;
}

.product-card{
    background:white;
    border-radius:26px;
    overflow:hidden;
    box-shadow:0 8px 20px rgba(0,0,0,0.08);
    transition:0.4s;
}

.product-card:hover{
    transform:translateY(-8px);
}

.product-card img{
    width:100%;
    height:240px;
    object-fit:cover;
}

.product-content{
    padding:22px;
}

.product-content h3{
    margin-bottom:8px;
}

.price{
    color:#2563eb;
    font-size:24px;
    font-weight:700;
    margin:14px 0;
}

.buy-btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:14px;
    background:linear-gradient(135deg,#2563eb,#38bdf8);
    color:white;
    cursor:pointer;
    font-size:15px;
    font-weight:600;
    transition:0.3s;
}

.buy-btn:hover{
    transform:translateY(-3px);
}

/* TABLE */

.dynamic-section{
    background:white;
    padding:30px;
    border-radius:28px;
    box-shadow:0 8px 20px rgba(0,0,0,0.05);
}

table{
    width:100%;
    border-collapse:collapse;
}

table th{
    background:#2563eb;
    color:white;
    padding:15px;
}

table td{
    padding:15px;
    border-bottom:1px solid #e2e8f0;
    text-align:center;
}

.qty-btn{
    width:35px;
    height:35px;
    border:none;
    border-radius:8px;
    background:#2563eb;
    color:white;
    font-size:18px;
    cursor:pointer;
}

.cancel-btn{
    padding:10px 16px;
    border:none;
    border-radius:10px;
    background:#ef4444;
    color:white;
    cursor:pointer;
}

.total-price{
    font-weight:700;
    color:#2563eb;
}

/* PROFILE */

.profile-card{
    background:white;
    padding:35px;
    border-radius:28px;
    max-width:550px;
    box-shadow:0 8px 20px rgba(0,0,0,0.06);
}

.input-box{
    margin-bottom:20px;
}

.input-box label{
    display:block;
    margin-bottom:8px;
    font-weight:600;
}

.input-box input{
    width:100%;
    padding:14px;
    border:1px solid #cbd5e1;
    border-radius:12px;
    outline:none;
}

.save-btn{
    width:100%;
    padding:14px;
    border:none;
    border-radius:14px;
    background:linear-gradient(135deg,#2563eb,#38bdf8);
    color:white;
    font-size:16px;
    cursor:pointer;
}

/* PAYMENT */

.payment-container{
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:80vh;
}

.payment-card{
    width:460px;
    background:white;
    padding:40px;
    border-radius:30px;
    text-align:center;
    box-shadow:0 10px 30px rgba(0,0,0,0.12);
}

.payment-card h1{
    color:#2563eb;
    margin-bottom:10px;
}

.payment-card p{
    color:#64748b;
    margin-bottom:25px;
}

.qr-image{
    width:250px;
    height:250px;
    object-fit:cover;
    border-radius:20px;
    margin-bottom:20px;
}

.upi-box{
    background:#eff6ff;
    padding:15px;
    border-radius:14px;
    font-weight:600;
    color:#2563eb;
    margin-bottom:20px;
}

.timer-box{
    background:#fee2e2;
    color:#dc2626;
    padding:14px;
    border-radius:14px;
    font-weight:700;
    margin-bottom:25px;
}

.utr-section input{
    width:100%;
    padding:14px;
    border:1px solid #cbd5e1;
    border-radius:12px;
    margin-bottom:18px;
    outline:none;
}

.utr-section button{
    width:100%;
    padding:14px;
    border:none;
    border-radius:14px;
    background:linear-gradient(135deg,#2563eb,#38bdf8);
    color:white;
    font-size:16px;
    cursor:pointer;
}

/* FOOTER FIXED */

.footer{
    position:fixed;
    bottom:0;
    left:0;
    width:100%;
    background:#0f172a;
    color:white;
    padding:18px 35px;
    z-index:1000;
    box-shadow:0 -5px 20px rgba(0,0,0,0.2);
}

.footer-container{
    display:flex;
    align-items:center;
    justify-content:space-between;
    flex-wrap:wrap;
    gap:20px;
}

.footer-logo{
    font-size:24px;
    font-weight:700;
}

.footer-logo i{
    color:#38bdf8;
}

.footer-links{
    display:flex;
    gap:20px;
}

.footer-links a{
    color:#cbd5e1;
    text-decoration:none;
}

.footer-links a:hover{
    color:#38bdf8;
}

.social-icons{
    display:flex;
    gap:15px;
}

.social-icons a{
    width:42px;
    height:42px;
    border-radius:50%;
    background:rgba(255,255,255,0.12);
    display:flex;
    align-items:center;
    justify-content:center;
    color:white;
    transition:0.3s;
}

.social-icons a:hover{
    background:#2563eb;
    transform:translateY(-3px);
}

/* DARK MODE */

.dark-mode{
    background:#0f172a;
    color:white;
}

.dark-mode .navbar,
.dark-mode .profile-card,
.dark-mode .dynamic-section,
.dark-mode .product-card,
.dark-mode .payment-card,
.dark-mode .marquee-box,
.dark-mode .offers-popup,
.dark-mode .stat-card{
    background:#1e293b;
    color:white;
}

.dark-mode table td{
    color:white;
}

.dark-mode .search-box{
    background:#334155;
}

.dark-mode .search-box input{
    color:white;
}

.dark-mode .footer{
    background:#020617;
}

.dark-mode .profile-menu{
    background:#1e293b;
}

.dark-mode .profile-menu a{
    color:white;
}

.dark-mode .input-box input,
.dark-mode .utr-section input{
    background:#334155;
    color:white;
    border:none;
}

</style>

</head>

<body>

<%
String msg=(String)request.getAttribute("msg");

if(msg!=null)
{
%>

<script>
alert("<%= msg %>");
</script>

<%
}
%>

<%
CustomerBean cb=(CustomerBean)session.getAttribute("CustomerBean");
%>

<!-- NAVBAR -->

<div class="navbar">

<a href="CustomerHome.jsp"
class="logo">

<i class="fa-solid fa-cart-shopping"></i>

ShopSphere

</a>

<div class="top-right">

<div class="search-box">

<i class="fa-solid fa-magnifying-glass"></i>

<input type="text"
placeholder="Search Products..."
id="searchInput">

</div>

<div class="live-clock"
id="clock">

00:00:00

</div>

<!-- SPECIAL OFFERS -->

<div class="message-box"
onclick="toggleOffers()">

<i class="fa-solid fa-envelope"></i>

<div class="message-count">

5

</div>

<div class="offers-popup"
id="offersPopup">

<div class="offer-item">

<h4>50% OFF</h4>

<p>On Electronics Today</p>

</div>

<div class="offer-item">

<h4>Free Delivery</h4>

<p>Above RS/-999 Orders</p>

</div>

<div class="offer-item">

<h4>Special Cashback</h4>

<p>Using UPI Payment</p>

</div>

<div class="offer-item">

<h4>Buy 1 Get 1</h4>

<p>On Fashion Products</p>

</div>

<div class="offer-item">

<h4>Weekend Offer</h4>

<p>Extra 20% Discount</p>

</div>

</div>

</div>

<button class="theme-btn"
onclick="toggleTheme()">

<i class="fa-solid fa-moon"></i>

</button>

<div class="customer-profile">

<img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
onclick="toggleProfileMenu()">

<div class="customer-name">

<%= cb.getA_FNAME() %>

</div>

<div class="profile-menu"
id="profileMenu">

<a href="#"
onclick="showPage('profilePage')">

<i class="fa-solid fa-user-pen"></i>

Edit Profile

</a>

<a href="#"
onclick="showPage('passwordPage')">

<i class="fa-solid fa-key"></i>

Change Password

</a>

<a href="Logout">

<i class="fa-solid fa-right-from-bracket"></i>

Logout

</a>

</div>

</div>

</div>

</div>

<!-- SIDEBAR -->

<div class="sidebar"
id="sidebar">

<div class="toggle-bar"
onclick="toggleSidebar()">

<i class="fa-solid fa-bars"></i>

</div>

<a href="#"
onclick="showPage('homePage')">

<i class="fa-solid fa-house"></i>

Home

</a>

<a href="#"
onclick="showPage('productsPage')">

<i class="fa-solid fa-box"></i>

Products

</a>

<a href="#"
onclick="showPage('cartPage')">

<i class="fa-solid fa-cart-shopping"></i>

Cart

</a>

<a href="#"
onclick="showPage('yourOrdersPage')">

<i class="fa-solid fa-bag-shopping"></i>

Your Orders

</a>

<a href="#"
onclick="showPage('paymentPage')">

<i class="fa-solid fa-qrcode"></i>

Payment

</a>



<a href="Logout.jsp" 


onclick="showPage('LogoutPage')">

<i class="fa-solid fa-bag-shopping"></i>

Logout

</a>



</a>




</div>

<!-- MAIN -->

<div class="main-content"
id="mainContent">

<!-- HOME -->

<div id="homePage"
class="page-section">

<div class="hero">

<h1>

Welcome <%= cb.getA_FNAME() %> &#128075;

</h1>

<p>

Smart Shopping Experience With Secure Payments & Fast Delivery

</p>

</div>

<!-- STATS -->

<div class="stats-grid">

<div class="stat-card">

<div>

<p>Total Products</p>

<h2>120+</h2>

</div>

<i class="fa-solid fa-box"></i>

</div>

<div class="stat-card">

<div>

<p>Special Offers</p>

<h2>05</h2>

</div>

<i class="fa-solid fa-gift"></i>

</div>

<div class="stat-card">

<div>

<p>Secure Payments</p>

<h2>100%</h2>

</div>

<i class="fa-solid fa-shield-halved"></i>

</div>

<div class="stat-card">

<div>

<p>Fast Delivery</p>

<h2>24 Hrs</h2>

</div>

<i class="fa-solid fa-truck-fast"></i>

</div>

</div>

<div class="marquee-box">

<marquee scrollamount="8"
style="
background:#111;
color:white;
padding:12px;
font-size:18px;
font-weight:bold;
font-family:'Segoe UI Emoji','Noto Color Emoji',Arial;
border-bottom:2px solid orange;
">

&#128293; Mega Sale Live |

&#128722; Secure Shopping |

&#128179; UPI Payments |

&#128666; Fast Delivery |

&#127881; Welcome To ShopSphere |

&#9889; Flat 50% OFF On Electronics

</marquee>

</div>

</div>

<!-- PRODUCTS -->
<!-- PRODUCTS -->

<div id="productsPage"
class="page-section">

<div class="product-grid">

<!-- ELECTRONICS -->

<div class="product-card">

<img src="https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>iPhone 15 Pro</h3>

<div class="price">&#8377;79999</div>

<button class="buy-btn"
onclick="addToCart('iPhone 15 Pro',79999)">

Add To Cart

</button>

</div>

</div>

<div class="product-card">

<img src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>MacBook Pro</h3>

<div class="price">&#8377;129999</div>

<button class="buy-btn"
onclick="addToCart('MacBook Pro',129999)">

Add To Cart

</button>

</div>

</div>

<div class="product-card">

<img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>Wireless Headphones</h3>

<div class="price">&#8377;2999</div>

<button class="buy-btn"
onclick="addToCart('Wireless Headphones',2999)">

Add To Cart

</button>

</div>

</div>

<div class="product-card">

<img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>Smart Watch</h3>

<div class="price">&#8377;5999</div>

<button class="buy-btn"
onclick="addToCart('Smart Watch',5999)">

Add To Cart

</button>

</div>

</div>

<!-- FASHION -->

<div class="product-card">

<img src="https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>Nike Shoes</h3>

<div class="price">&#8377;4999</div>

<button class="buy-btn"
onclick="addToCart('Nike Shoes',4999)">

Add To Cart

</button>

</div>

</div>

<div class="product-card">

<img src="https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>Mens T-Shirt</h3>

<div class="price">&#8377;999</div>

<button class="buy-btn"
onclick="addToCart('Mens T-Shirt',999)">

Add To Cart

</button>

</div>

</div>

<!-- HOME APPLIANCES -->

<div class="product-card">

<img src="https://images.unsplash.com/photo-1586201375761-83865001e31c?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>Microwave Oven</h3>

<div class="price">&#8377;8499</div>

<button class="buy-btn"
onclick="addToCart('Microwave Oven',8499)">

Add To Cart

</button>

</div>

</div>

<div class="product-card">

<img src="https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>Gaming Keyboard</h3>

<div class="price">&#8377;3499</div>

<button class="buy-btn"
onclick="addToCart('Gaming Keyboard',3499)">

Add To Cart

</button>

</div>

</div>

<!-- SPORTS & TOYS -->

<div class="product-card">

<img src="https://images.unsplash.com/photo-1517649763962-0c623066013b?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>Football Kit</h3>

<div class="price">&#8377;1999</div>

<button class="buy-btn"
onclick="addToCart('Football Kit',1999)">

Add To Cart

</button>

</div>

</div>

<div class="product-card">

<img src="https://images.unsplash.com/photo-1596461404969-9ae70f2830c1?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>Kids Teddy Bear</h3>

<div class="price">&#8377;799</div>

<button class="buy-btn"
onclick="addToCart('Kids Teddy Bear',799)">

Add To Cart

</button>

</div>

</div>

<!-- GROCERIES -->

<div class="product-card">

<img src="https://images.unsplash.com/photo-1542838132-92c53300491e?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>Fresh Vegetables Pack</h3>

<div class="price">&#8377;299</div>

<button class="buy-btn"
onclick="addToCart('Fresh Vegetables Pack',299)">

Add To Cart

</button>

</div>

</div>

<div class="product-card">

<img src="https://images.unsplash.com/photo-1583258292688-d0213dc5a3a8?auto=format&fit=crop&w=800&q=80">

<div class="product-content">

<h3>Grocery Combo</h3>

<div class="price">&#8377;1499</div>

<button class="buy-btn"
onclick="addToCart('Grocery Combo',1499)">

Add To Cart

</button>

</div>

</div>

</div>

</div>

<!-- CART -->

<div id="cartPage"
class="page-section">

<div class="dynamic-section">

<h2 style="margin-bottom:25px;">

My Cart

</h2>

<table id="cartTable">

<tr>

<th>Product</th>
<th>Price</th>
<th>Quantity</th>
<th>Total</th>
<th>Action</th>

</tr>

</table>

<div style="margin-top:25px;text-align:right;">

<h2>

Grand Total :
&#8377;<span id="grandTotal">0</span>

</h2>

<button class="buy-btn"
style="width:250px;margin-top:20px;"
onclick="goToPayment()">

Buy Now

</button>

</div>

</div>

</div>

<!-- ORDERS -->

<div id="yourOrdersPage"
class="page-section">

<div class="dynamic-section">

<h2 style="margin-bottom:25px;">

Your Orders

</h2>

<table id="ordersHistoryTable">
<tr> <th>Product</th> <th>Quantity</th> <th>Total Price</th> <th>Order Date</th> <th>Order Time</th> <th>Status</th> </tr>

<tr>
    <td>Grocery Combo</td>
    <td>1</td>
    <td>&#8377;1499</td>
    <td>2026-05-10</td>
    <td>10:30 AM</td>
    <td>Pending</td>
</tr>

<tr>
    <td>iPhone15Pro</td>
    <td>1</td>
    <td>&#8377;79999</td>
    <td>2026-05-09</td>
    <td>02:15 PM</td>
    <td>Delivered</td>
</tr>


</table>

</div>

</div>

<!-- PROFILE -->

<div id="profilePage"
class="page-section">

<div class="profile-card">

<h2 style="margin-bottom:25px;">

Edit Profile

</h2>

<form action="updateProfile"
method="post">

<div class="input-box">

<label>Name</label>

<input type="text"
name="fname"
value="<%= cb.getA_FNAME() %>">

</div>

<div class="input-box">

<label>Email</label>

<input type="email"
name="mail"
value="<%= cb.getA_MID() %>">

</div>

<button class="save-btn">

Update Profile

</button>

</form>

</div>

</div>

<!-- PASSWORD -->

<div id="passwordPage"
class="page-section">

<div class="profile-card">

<h2 style="margin-bottom:25px;">

Change Password

</h2>

<form action="changePassword"
method="post">

<div class="input-box">

<label>Old Password</label>

<input type="password"
name="oldpwd">

</div>

<div class="input-box">

<label>New Password</label>

<input type="password"
name="newpwd">

</div>

<button class="save-btn">

Change Password

</button>

</form>

</div>

</div>

<!-- PAYMENT -->
<script>
function verifyPayment(){

	let utr = document.getElementById("utrInput").value;

	if(utr == ""){
	    alert("Please Enter UTR Number");
	    return;
	}

	if(utr.length < 8){
	    alert("Invalid UTR Number");
	    return;
	}

	// CREATE FORM DYNAMICALLY
	let form = document.createElement("form");
	form.method = "POST";
	form.action = "placeOrder";

	// CUSTOMER ID
	let customerIdInput = document.createElement("input");
	customerIdInput.name = "customerId";
	customerIdInput.value = "<%= cb.getCustomerId() %>";  // adjust if needed
	form.appendChild(customerIdInput);

	// GET CART DATA
	let rows = document.querySelectorAll("#cartTable tr");

	rows.forEach((row, index) => {

	if(index > 0){

	let cols = row.getElementsByTagName("td");

	let product = cols[0].innerText;
	let qty = row.querySelector(".qty").innerText;
	let total = cols[3].innerText.replace("₹","");

	// PRODUCT
	let p = document.createElement("input");
	p.name = "product";
	p.value = product;
	form.appendChild(p);

	// QTY
	let q = document.createElement("input");
	q.name = "qty";
	q.value = qty;
	form.appendChild(q);

	// TOTAL
	let t = document.createElement("input");
	t.name = "total";
	t.value = total;
	form.appendChild(t);
	}

	});

	document.body.appendChild(form);
	form.submit();
	}
</script>
<div id="paymentPage"
class="page-section">

<div class="payment-container">

<div class="payment-card">

<h1>

Secure Payment

</h1>

<p>

Scan QR Code & Complete Payment

</p>

<img src="images/PHONEPEQr2.jpeg"
class="qr-image">

<div class="upi-box">

UPI ID : devisrinivasgannabattula@ybl

</div>

<div class="timer-box">

Payment Expires In :
<span id="timer">05:00</span>

</div>

<div class="utr-section">

<input type="text"
id="utrInput"
placeholder="Enter UTR Number">

<button onclick="verifyPayment()">

Verify Payment

</button>

</div>

</div>

</div>

</div>

<!-- FOOTER -->

<!-- FOOTER -->

<footer class="footer">

<div class="footer-container">

<div>

<div class="footer-logo">

<i class="fa-solid fa-cart-shopping"></i>

ShopSphere

</div>

<p style="margin-top:8px;color:#cbd5e1;font-size:14px;">



</p>

<p style="margin-top:5px;color:#94a3b8;font-size:14px;">

All Rights Reserved &copy; 2026 | Designed by DeviSrinivas

</p>

</div>

<div class="footer-links">

<a href="TermsAndConditions.jsp">

Terms & Conditions

</a>

<a href="PrivacyPolicy.jsp">

Privacy Policy

</a>

<a href="FAQS.jsp">

FAQs

</a>

</div>

<div class="social-icons">

<a href="https://www.linkedin.com/in/devisrinivasgannabattula/"
target="_blank">

<i class="fa-brands fa-linkedin"></i>

</a>

<a href="https://www.instagram.com/devisrinivasgannabattula/"
target="_blank">

<i class="fa-brands fa-instagram"></i>

</a>

<a href="https://www.facebook.com/"
target="_blank">

<i class="fa-brands fa-facebook-f"></i>

</a>

</div>

</div>

</footer>

</div>

<!-- JAVASCRIPT -->


<script>

/* SHOW PAGE */

function showPage(pageId){

let pages =
document.querySelectorAll(".page-section");

pages.forEach(function(page){

page.style.display = "none";

});

document.getElementById(pageId)
.style.display = "block";

window.scrollTo(0,0);

}

/* CLOCK */

function updateClock(){

let now = new Date();

document.getElementById("clock")
.innerHTML =
now.toLocaleTimeString();

}

setInterval(updateClock,1000);

updateClock();

/* THEME */

function toggleTheme(){

document.body.classList
.toggle("dark-mode");

}

/* SIDEBAR */

function toggleSidebar(){

document.getElementById("sidebar")
.classList.toggle("hide");

document.getElementById("mainContent")
.classList.toggle("full");

}

/* PROFILE MENU */

function toggleProfileMenu(){

let menu =
document.getElementById("profileMenu");

if(menu.style.display === "block"){

menu.style.display = "none";

}
else{

menu.style.display = "block";

}

}

/* OFFERS */

function toggleOffers(){

let popup =
document.getElementById("offersPopup");

if(popup.style.display === "block"){

popup.style.display = "none";

}
else{

popup.style.display = "block";

}

}

/* SEARCH */

document.getElementById("searchInput")
.addEventListener("keyup",function(){

let value =
this.value.toLowerCase();

let cards =
document.querySelectorAll(".product-card");

cards.forEach(function(card){

let product =
card.querySelector("h3")
.innerHTML.toLowerCase();

if(product.includes(value)){

card.style.display = "block";

}
else{

card.style.display = "none";

}

});

});

/* ADD TO CART */

function addToCart(product,price){

showPage('cartPage');

let table =
document.getElementById("cartTable");

let row =
table.insertRow();

row.innerHTML =

"<td>"+product+"</td>"+

"<td class='priceCell'>"+price+"</td>"+

"<td>"+

"<button class='qty-btn' onclick='decreaseQty(this)'>-</button> "+

"<span class='qty'>1</span> "+

"<button class='qty-btn' onclick='increaseQty(this)'>+</button>"+

"</td>"+

"<td class='total-price'>"+price+"</td>"+

"<td>"+

"<button class='cancel-btn' onclick='removeCart(this)'>Cancel</button>"+

"</td>";

calculateGrandTotal();

alert(product + " Added To Cart");

}

/* INCREASE */

function increaseQty(button){

let row =
button.parentNode.parentNode;

let qtySpan =
row.querySelector(".qty");

let qty =
parseInt(qtySpan.innerHTML);

qty++;

qtySpan.innerHTML = qty;

updateRowTotal(row);

}

/* DECREASE */

function decreaseQty(button){

let row =
button.parentNode.parentNode;

let qtySpan =
row.querySelector(".qty");

let qty =
parseInt(qtySpan.innerHTML);

if(qty > 1){

qty--;

qtySpan.innerHTML = qty;

updateRowTotal(row);

}

}

/* UPDATE TOTAL */

function updateRowTotal(row){

let price =
parseInt(
row.querySelector(".priceCell")
.innerHTML);

let qty =
parseInt(
row.querySelector(".qty")
.innerHTML);

let total =
price * qty;

row.querySelector(".total-price")
.innerHTML = total;

calculateGrandTotal();

}

/* GRAND TOTAL */

function calculateGrandTotal(){

let totals =
document.querySelectorAll(".total-price");

let grandTotal = 0;

totals.forEach(function(item){

grandTotal +=
parseInt(item.innerHTML);

});

document.getElementById("grandTotal")
.innerHTML = grandTotal;

}

/* REMOVE */

function removeCart(button){

let row =
button.parentNode.parentNode;


row.remove();

calculateGrandTotal();

alert("Order Cancelled Successfully");

}

/* PAYMENT */

function goToPayment(){

let total =
document.getElementById("grandTotal")
.innerHTML;

if(total == 0){

alert("Cart Is Empty");

return;

}

showPage('paymentPage');

startTimer();

}

/* TIMER */

let time = 300;

let timerInterval;

function startTimer(){

clearInterval(timerInterval);

time = 300;

timerInterval =
setInterval(function(){

let minutes =
Math.floor(time / 60);

let seconds =
time % 60;

seconds =
seconds < 10 ?
"0"+seconds : seconds;

document.getElementById("timer")
.innerHTML =
minutes + ":" + seconds;

time--;

if(time < 0){

clearInterval(timerInterval);

alert("Payment Time Expired");

showPage('cartPage');

}

},1000);

}

/* VERIFY PAYMENT */

function verifyPayment(){

let utr =
document.getElementById("utrInput")
.value;

if(utr == ""){

alert("Please Enter UTR Number");

return;

}

if(utr.length < 8){

alert("Invalid UTR Number");

return;

}

clearInterval(timerInterval);

alert("Payment Done Successfully");

alert("Product Ordered Successfully");

let cartRows =
document.querySelectorAll("#cartTable tr");

let ordersTable =
document.getElementById("ordersHistoryTable");

cartRows.forEach(function(row,index){

if(index > 0){

let cols =
row.getElementsByTagName("td");

let product =
cols[0].innerHTML;

let qty =
row.querySelector(".qty").innerHTML;

let total =
cols[3].innerHTML;

let now =
new Date();

let newRow =
ordersTable.insertRow();

newRow.innerHTML =

"<td>"+product+"</td>"+
"<td>"+qty+"</td>"+
"<td>&#8377;"+total+"</td>"+
"<td>"+now.toLocaleDateString()+"</td>"+
"<td>"+now.toLocaleTimeString()+"</td>"+
"<td style='color:green;font-weight:700;'>Paid</td>";

}

});

/* CLEAR CART */

document.getElementById("cartTable")
.innerHTML =

"<tr>"+
"<th>Product</th>"+
"<th>Price</th>"+
"<th>Quantity</th>"+
"<th>Total</th>"+
"<th>Action</th>"+
"</tr>";

document.getElementById("grandTotal")
.innerHTML = 0;

document.getElementById("utrInput")
.value = "";

showPage('yourOrdersPage');

}

</script>

</body>
</html>