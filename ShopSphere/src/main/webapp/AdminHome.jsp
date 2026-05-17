<%@page import="com.bean.AdminBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Admin Dashboard</title>

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
    background:#eef2ff;
    overflow-x:hidden;
    transition:0.4s;
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
    min-height:75px;
    background:#0f172a;
    display:flex;
    align-items:center;
    justify-content:space-between;
    padding:15px 25px;
    position:fixed;
    top:0;
    left:0;
    z-index:1000;
    color:white;
    box-shadow:0 5px 15px rgba(0,0,0,0.2);
    flex-wrap:wrap;
    gap:15px;
}

.logo{
    display:flex;
    align-items:center;
    gap:15px;
    font-size:28px;
    font-weight:700;
}

.logo i{
    color:#38bdf8;
}

.menu-toggle{
    width:42px;
    height:42px;
    background:rgba(255,255,255,0.1);
    border-radius:12px;
    display:flex;
    align-items:center;
    justify-content:center;
    cursor:pointer;
    transition:0.3s;
}

.menu-toggle:hover{
    background:#2563eb;
}

.top-right{
    display:flex;
    align-items:center;
    gap:15px;
    flex-wrap:wrap;
}

/* SEARCH */

.search-box{
    background:white;
    padding:10px 15px;
    border-radius:12px;
    display:flex;
    align-items:center;
    gap:10px;
    min-width:220px;
}

.search-box input{
    border:none;
    outline:none;
    width:100%;
}

/* CLOCK */

.live-clock{
    background:rgba(255,255,255,0.12);
    padding:10px 16px;
    border-radius:12px;
    font-weight:600;
}

/* NOTIFICATION */

.notification{
    position:relative;
    cursor:pointer;
}

.notify-count{
    position:absolute;
    top:-8px;
    right:-8px;
    background:red;
    color:white;
    width:18px;
    height:18px;
    border-radius:50%;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:11px;
}

.notification-box{
    position:absolute;
    top:55px;
    right:0;
    width:320px;
    background:white;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.15);
    display:none;
}

.notify-header{
    background:#2563eb;
    color:white;
    padding:16px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.notify-item{
    padding:16px;
    border-bottom:1px solid #e2e8f0;
    color:#334155;
}

.notify-item:hover{
    background:#f8fafc;
}

/* THEME */

.theme-btn{
    width:45px;
    height:45px;
    border:none;
    border-radius:12px;
    background:#2563eb;
    color:white;
    font-size:18px;
    cursor:pointer;
}

/* PROFILE */

.admin-profile{
    display:flex;
    align-items:center;
    gap:12px;
}

.profile-dropdown{
    position:relative;
}

.profile-dropdown img{
    width:48px;
    height:48px;
    border-radius:50%;
    border:3px solid #38bdf8;
    cursor:pointer;
}

.profile-menu{
    position:absolute;
    top:60px;
    right:0;
    width:220px;
    background:white;
    border-radius:18px;
    overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.12);
    display:none;
}

.profile-menu a{
    display:flex;
    align-items:center;
    gap:12px;
    padding:16px;
    text-decoration:none;
    color:#0f172a;
}

.profile-menu a:hover{
    background:#eff6ff;
}

.admin-name{
    font-size:16px;
    font-weight:500;
}

/* SIDEBAR */

.sidebar{
    width:260px;
    height:calc(100vh - 75px);
    background:linear-gradient(to bottom,#0f172a,#1e293b);
    position:fixed;
    top:75px;
    left:0;
    padding-top:25px;
    transition:0.4s ease;
    z-index:999;
    overflow-y:auto;
}

.sidebar.hide{
    left:-260px;
}

.sidebar.show{
    left:0;
}

.sidebar-title{
    color:#94a3b8;
    padding:10px 30px;
    font-size:14px;
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
    transform:translateX(6px);
}

/* MAIN CONTENT */

.main-content{
    width:calc(100% - 260px);
    margin-left:260px;
    margin-top:90px;
    padding:35px;
    transition:0.4s ease;
}

.main-content.full{
    width:100%;
    margin-left:0;
}

/* PAGE SECTION */

.page-section{
    display:none;
}

#homePage{
    display:block;
}

/* HERO */

.hero-section{
    background:linear-gradient(135deg,#1d4ed8,#2563eb,#38bdf8);
    padding:45px;
    border-radius:28px;
    color:white;
    margin-bottom:35px;
}

.dashboard-title{
    font-size:42px;
    margin-bottom:10px;
}

.welcome{
    font-size:18px;
    margin-bottom:15px;
}

.typing-text{
    font-size:20px;
    color:#dbeafe;
    margin-bottom:25px;
}

.hero-buttons{
    display:flex;
    gap:18px;
    flex-wrap:wrap;
}

.hero-buttons a{
    text-decoration:none;
    padding:14px 28px;
    border-radius:14px;
    font-weight:600;
}

.btn-primary{
    background:white;
    color:#2563eb;
}

.btn-secondary{
    background:rgba(255,255,255,0.15);
    color:white;
    border:1px solid rgba(255,255,255,0.3);
}

/* MARQUEE */

.marquee-box{
    background:white;
    padding:16px;
    border-radius:18px;
    margin-bottom:35px;
    border-left:6px solid #2563eb;
}

/* STATS */

.stats-container{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:25px;
    margin-bottom:35px;
}

.stat-card{
    background:white;
    padding:28px;
    border-radius:22px;
    box-shadow:0 8px 18px rgba(0,0,0,0.08);
    transition:0.3s;
}

.stat-card:hover{
    transform:translateY(-6px);
}

.stat-card i{
    font-size:38px;
    margin-bottom:18px;
}

.stat-card h2{
    font-size:32px;
}

.blue{
    color:#2563eb;
}

.green{
    color:#10b981;
}

.orange{
    color:#f97316;
}

.red{
    color:#ef4444;
}

/* DYNAMIC SECTION */

.dynamic-section{
    background:white;
    padding:30px;
    border-radius:24px;
    overflow-x:auto;
    margin-top:25px;
}

/* SECTION TITLE */

.section-title{
    font-size:28px;
    margin-bottom:25px;
    color:#0f172a;
}

/* TABLE */

table{
    width:100%;
    border-collapse:collapse;
    min-width:650px;
}

table th{
    background:#2563eb;
    color:white;
    padding:15px;
}

table td{
    padding:15px;
    border-bottom:1px solid #e2e8f0;
}

.status{
    padding:8px 14px;
    border-radius:20px;
    font-size:13px;
    font-weight:600;
}

.delivered{
    background:#dcfce7;
    color:#15803d;
}

.pending{
    background:#fef3c7;
    color:#b45309;
}

.cancelled{
    background:#fee2e2;
    color:#b91c1c;
}

/* CUSTOMERS */

.customer-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:25px;
}

.customer-card{
    background:#f8fafc;
    padding:30px;
    border-radius:20px;
    text-align:center;
    transition:0.3s;
}

.customer-card:hover{
    transform:translateY(-6px);
}

.customer-card i{
    font-size:45px;
    color:#2563eb;
    margin-bottom:15px;
}

.customer-card h3{
    margin-bottom:8px;
}

/* ANALYTICS */

.analytics-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:25px;
}

.analytics-card{
    background:linear-gradient(135deg,#2563eb,#38bdf8);
    color:white;
    padding:30px;
    border-radius:22px;
    text-align:center;
    transition:0.3s;
}

.analytics-card:hover{
    transform:scale(1.03);
}

.analytics-card h1{
    font-size:38px;
    margin:10px 0;
}

/* FLOAT BUTTON */

.float-btn{
    position:fixed;
    right:25px;
    bottom:25px;
    width:65px;
    height:65px;
    border-radius:50%;
    background:linear-gradient(135deg,#2563eb,#38bdf8);
    color:white;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:26px;
    z-index:999;
}

/* SEARCH HIGHLIGHT */

.highlight{
    background:yellow;
    color:black;
    padding:2px 4px;
    border-radius:4px;
}

/* DARK MODE */

.dark-mode{
    background:#0f172a;
}

.dark-mode .stat-card,
.dark-mode .dynamic-section,
.dark-mode .marquee-box,
.dark-mode .customer-card{
    background:#1e293b;
    color:white;
}

.dark-mode table td{
    color:white;
}

.dark-mode .profile-menu,
.dark-mode .notification-box{
    background:#1e293b;
}

.dark-mode .profile-menu a,
.dark-mode .notify-item{
    color:white;
}

.dark-mode .section-title{
    color:white;
}

/* RESPONSIVE */

@media(max-width:992px){

    .main-content{
        width:100%;
        margin-left:0;
    }

    .sidebar{
        left:-260px;
    }

    .sidebar.show{
        left:0;
    }

}

@media(max-width:768px){

    .navbar{
        padding:15px;
    }

    .logo{
        width:100%;
        justify-content:space-between;
        font-size:22px;
    }

    .top-right{
        width:100%;
        justify-content:flex-start;
    }

    .search-box{
        width:100%;
    }

    .main-content{
        margin-top:145px;
        padding:18px;
    }

    .hero-section{
        padding:25px;
    }

    .dashboard-title{
        font-size:28px;
    }

    .welcome{
        font-size:15px;
    }

    .typing-text{
        font-size:16px;
    }

    .hero-buttons{
        flex-direction:column;
    }

    .hero-buttons a{
        width:100%;
        text-align:center;
    }

    .stats-container,
    .customer-grid,
    .analytics-grid{
        grid-template-columns:1fr;
    }

    .admin-name{
        display:none;
    }

    .notification-box{
        width:280px;
        right:-90px;
    }

}

@media(max-width:480px){

    .navbar{
        gap:10px;
    }

    .main-content{
        margin-top:170px;
        padding:14px;
    }

    .dashboard-title{
        font-size:24px;
    }

    .hero-section{
        padding:20px;
    }

    .section-title{
        font-size:22px;
    }

    .float-btn{
        width:55px;
        height:55px;
        font-size:22px;
    }

    .search-box{
        min-width:100%;
    }

    .notification-box{
        width:240px;
        right:-60px;
    }

}

</style>

</head>

<body>

<%
AdminBean ab=(AdminBean)session.getAttribute("AdminBean");
%>

<!-- NAVBAR -->

<div class="navbar">

    <div class="logo">

        <div class="menu-toggle"
        onclick="toggleSidebar()">

            <i class="fa-solid fa-bars"></i>

        </div>

        <i class="fa-solid fa-shield-halved"></i>

        ShopSphere

    </div>

    <div class="top-right">

        <div class="search-box">

            <i class="fa-solid fa-magnifying-glass"></i>

            <input type="text"
            id="searchInput"
            placeholder="Search dashboard..."
            onkeyup="searchDashboard()">

        </div>

        <div class="live-clock"
        id="clock">
            00:00:00
        </div>

        <div class="notification">

            <div onclick="toggleNotifications()">

                <i class="fa-solid fa-bell"></i>

                <span class="notify-count">
                    3
                </span>

            </div>

            <div class="notification-box"
            id="notificationBox">

                <div class="notify-header">

                    Notifications

                    <span onclick="closeNotifications()">

                        <i class="fa-solid fa-xmark"></i>

                    </span>

                </div>

                <div class="notify-item">
                    New order received from Rahul.
                </div>

                <div class="notify-item">
                    Product stock is running low.
                </div>

                <div class="notify-item">
                    New customer registered.
                </div>

            </div>

        </div>

        <button class="theme-btn"
        onclick="toggleTheme()">

            <i class="fa-solid fa-moon"></i>

        </button>

        <div class="admin-profile">

            <div class="profile-dropdown">

                <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png"
                onclick="toggleProfileMenu()">

                <div class="profile-menu"
                id="profileMenu">

                    <a href="#">
                        <i class="fa-solid fa-user-pen"></i>
                        Edit Profile
                    </a>

                    <a href="#">
                        <i class="fa-solid fa-key"></i>
                        Change Password
                    </a>

                    <a href="Logout">
                        <i class="fa-solid fa-right-from-bracket"></i>
                        Logout
                    </a>

                </div>

            </div>

            <div class="admin-name">
                <%= ab.getA_FNAME() %>
            </div>

        </div>

    </div>

</div>

<!-- SIDEBAR -->

<div class="sidebar"
id="sidebar">

    <div class="sidebar-title">
        MAIN MENU
    </div>

    <a href="#"
    onclick="showPage('homePage')">

        <i class="fa-solid fa-house"></i>
        Dashboard

    </a>

    <a href="AddProduct.html">

        <i class="fa-solid fa-plus"></i>
        Add Product

    </a>

    <a href="view1">

        <i class="fa-solid fa-eye"></i>
        View Products

    </a>

    <a href="#"
    onclick="showPage('ordersPage')">

        <i class="fa-solid fa-bag-shopping"></i>
        Orders

    </a>

    <a href="#"
    onclick="showPage('customersPage')">

        <i class="fa-solid fa-users"></i>
        Customers

    </a>

    <a href="#"
    onclick="showPage('analyticsPage')">

        <i class="fa-solid fa-chart-line"></i>
        Analytics

    </a>

    <a href="Logout">

        <i class="fa-solid fa-right-from-bracket"></i>
        Logout

    </a>

</div>

<!-- MAIN CONTENT -->

<div class="main-content"
id="mainContent">

    <!-- HOME PAGE -->

    <div id="homePage"
    class="page-section">

        <div class="hero-section">

            <h1 class="dashboard-title">
                Welcome Back Admin
            </h1>

            <div class="welcome">
                Manage products, monitor orders and control your ecommerce system professionally.
            </div>

            <div class="typing-text">
                <span id="typing"></span>
            </div>

            <div class="hero-buttons">

                <a href="AddProduct.html"
                class="btn-primary">
                    Add Product
                </a>

                <a href="view1"
                class="btn-secondary">
                    View Products
                </a>

            </div>

        </div>

        <div class="marquee-box">

            <marquee scrollamount="8">

                Welcome to ShopSphere Admin Dashboard |
                Manage Products Efficiently |
                Secure Admin Panel |
                Track Store Performance Easily

            </marquee>

        </div>

        <div class="stats-container">

            <div class="stat-card">

                <i class="fa-solid fa-box blue"></i>

                <h2>120+</h2>

                <p>Total Products</p>

            </div>

            <div class="stat-card">

                <i class="fa-solid fa-cart-shopping green"></i>

                <h2>85+</h2>

                <p>Orders Today</p>

            </div>

            <div class="stat-card">

                <i class="fa-solid fa-users orange"></i>

                <h2>1.2K</h2>

                <p>Customers</p>

            </div>

            <div class="stat-card">

                <i class="fa-solid fa-indian-rupee-sign red"></i>

                <h2>45K</h2>

                <p>Revenue</p>

            </div>

        </div>

    </div>

    <!-- ORDERS PAGE -->

    <div id="ordersPage"
    class="page-section">

        <div class="dynamic-section">

            <h2 class="section-title">
                <i class="fa-solid fa-bag-shopping"></i>
                Recent Orders
            </h2>

            <table>

                <tr>
                    <th>Order ID</th>
                    <th>Customer</th>
                    <th>Product</th>
                    <th>Amount</th>
                    <th>Status</th>
                </tr>

                <tr>
                    <td>#ORD1021</td>
                    <td>Rahul</td>
                    <td>Wireless Mouse</td>
                    <td>₹899</td>
                    <td>
                        <span class="status delivered">
                            Delivered
                        </span>
                    </td>
                </tr>

                <tr>
                    <td>#ORD1022</td>
                    <td>Priya</td>
                    <td>Bluetooth Speaker</td>
                    <td>&#8377;2,499</td>
                    <td>
                        <span class="status pending">
                            Pending
                        </span>
                    </td>
                </tr>

                <tr>
                    <td>#ORD1023</td>
                    <td>Arjun</td>
                    <td>Smart Watch</td>
                    <td>₹4,999</td>
                    <td>
                        <span class="status cancelled">
                            Cancelled
                        </span>
                    </td>
                </tr>

            </table>

        </div>

    </div>

    <!-- CUSTOMERS PAGE -->

    <div id="customersPage"
    class="page-section">

        <div class="dynamic-section">

            <h2 class="section-title">
                <i class="fa-solid fa-users"></i>
                Top Customers
            </h2>

            <div class="customer-grid">

                <div class="customer-card">

                    <i class="fa-solid fa-user"></i>

                    <h3>Rahul Sharma</h3>

                    <p>Orders : 24</p>

                    <p>Premium Customer</p>

                </div>

                <div class="customer-card">

                    <i class="fa-solid fa-user"></i>

                    <h3>Priya Reddy</h3>

                    <p>Orders : 18</p>

                    <p>Gold Member</p>

                </div>

                <div class="customer-card">

                    <i class="fa-solid fa-user"></i>

                    <h3>Arjun Kumar</h3>

                    <p>Orders : 12</p>

                    <p>Regular Buyer</p>

                </div>

            </div>

        </div>

    </div>

    <!-- ANALYTICS PAGE -->

    <div id="analyticsPage"
    class="page-section">

        <div class="dynamic-section">

            <h2 class="section-title">
                <i class="fa-solid fa-chart-line"></i>
                Analytics Overview
            </h2>

            <div class="analytics-grid">

                <div class="analytics-card">

                    <i class="fa-solid fa-chart-simple"></i>

                    <h1>78%</h1>

                    <p>Sales Growth</p>

                </div>

                <div class="analytics-card">

                    <i class="fa-solid fa-user-plus"></i>

                    <h1>340</h1>

                    <p>New Customers</p>

                </div>

                <div class="analytics-card">

                    <i class="fa-solid fa-bag-shopping"></i>

                    <h1>920</h1>

                    <p>Total Orders</p>

                </div>

                <div class="analytics-card">

                    <i class="fa-solid fa-money-bill-trend-up"></i>

                    <h1>&#8377;1.8L</h1>

                    <p>Monthly Revenue</p>

                </div>

            </div>

        </div>

    </div>

</div>

<div class="float-btn">

    <i class="fa-solid fa-headset"></i>

</div>

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

    if(window.innerWidth <= 992){

        document.getElementById("sidebar")
        .classList.remove("show");
    }
}

/* CLOCK */

function updateClock(){

    let now = new Date();

    document.getElementById("clock")
    .innerHTML =
    now.toLocaleTimeString();
}

setInterval(updateClock,1000);

/* THEME */

function toggleTheme(){

    document.body.classList.toggle("dark-mode");
}

/* SIDEBAR */

function toggleSidebar(){

    let sidebar =
    document.getElementById("sidebar");

    let mainContent =
    document.getElementById("mainContent");

    if(window.innerWidth <= 992){

        sidebar.classList.toggle("show");

    }
    else{

        sidebar.classList.toggle("hide");

        mainContent.classList.toggle("full");
    }
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

/* NOTIFICATIONS */

function toggleNotifications(){

    let box =
    document.getElementById("notificationBox");

    if(box.style.display === "block"){

        box.style.display = "none";
    }
    else{

        box.style.display = "block";
    }
}

function closeNotifications(){

    document.getElementById("notificationBox")
    .style.display = "none";
}

/* SEARCH */

function searchDashboard(){

    let input =
    document.getElementById("searchInput")
    .value.toLowerCase();

    removeHighlights();

    if(input.length > 0){

        highlightText(document.body,input);
    }
}

function highlightText(element,text){

    if(element.hasChildNodes()){

        element.childNodes.forEach(function(node){

            if(node.nodeType === 3){

                let value = node.nodeValue;

                let index =
                value.toLowerCase().indexOf(text);

                if(index >= 0){

                    let span =
                    document.createElement("span");

                    span.className = "highlight";

                    let word =
                    value.substr(index,text.length);

                    span.appendChild(
                    document.createTextNode(word));

                    let after =
                    node.splitText(index);

                    after.nodeValue =
                    after.nodeValue.substring(text.length);

                    node.parentNode
                    .insertBefore(span,after);
                }

            }
            else{

                highlightText(node,text);
            }

        });
    }
}

function removeHighlights(){

    let highlights =
    document.querySelectorAll(".highlight");

    highlights.forEach(function(item){

        let parent =
        item.parentNode;

        parent.replaceChild(
        document.createTextNode(item.textContent),
        item);

        parent.normalize();
    });
}

/* TYPING EFFECT */

const text =
"Control Your Ecommerce Business Smartly.";

let index = 0;

function typeText(){

    if(index < text.length){

        document.getElementById("typing")
        .innerHTML += text.charAt(index);

        index++;

        setTimeout(typeText,80);
    }
}

typeText();

/* WINDOW RESIZE */

window.addEventListener("resize",function(){

    if(window.innerWidth > 992){

        document.getElementById("sidebar")
        .classList.remove("show");
    }

});

</script>

</body>
</html>