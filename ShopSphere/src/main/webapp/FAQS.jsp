<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>ShopSphere FAQs</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, Helvetica, sans-serif;
}

body{
    background:#f1f5f9;
    padding:40px;
}

.faq-container{
    max-width:900px;
    margin:auto;
}

.faq-title{
    text-align:center;
    font-size:42px;
    color:#2563eb;
    margin-bottom:40px;
}

.faq-box{
    background:white;
    border-radius:18px;
    margin-bottom:20px;
    overflow:hidden;
    box-shadow:0 5px 15px rgba(0,0,0,0.08);
}

.faq-question{
    padding:22px;
    cursor:pointer;
    font-size:18px;
    font-weight:bold;
    display:flex;
    justify-content:space-between;
    align-items:center;
    background:#2563eb;
    color:white;
}

.faq-answer{
    display:none;
    padding:22px;
    font-size:16px;
    color:#334155;
    line-height:1.7;
    background:#fff;
}

</style>

</head>

<body>

<div class="faq-container">

<h1 class="faq-title">

<i class="fa-solid fa-circle-question"></i>

Frequently Asked Questions

</h1>

<div class="faq-box">

<div class="faq-question"
onclick="toggleFAQ(this)">

How can I place an order?

<i class="fa-solid fa-plus"></i>

</div>

<div class="faq-answer">

Browse products, add items to cart, and complete payment using UPI.

</div>

</div>

<div class="faq-box">

<div class="faq-question"
onclick="toggleFAQ(this)">

Which payment methods are supported?

<i class="fa-solid fa-plus"></i>

</div>

<div class="faq-answer">

We support UPI, Debit Cards, Credit Cards, and Net Banking.

</div>

</div>

<div class="faq-box">

<div class="faq-question"
onclick="toggleFAQ(this)">

How long does delivery take?

<i class="fa-solid fa-plus"></i>

</div>

<div class="faq-answer">

Most products are delivered within 24 to 72 hours.

</div>

</div>

<div class="faq-box">

<div class="faq-question"
onclick="toggleFAQ(this)">

Can I cancel my order?

<i class="fa-solid fa-plus"></i>

</div>

<div class="faq-answer">

Yes, orders can be cancelled before shipping.

</div>

</div>

<div class="faq-box">

<div class="faq-question"
onclick="toggleFAQ(this)">

How can I contact support?

<i class="fa-solid fa-plus"></i>

</div>

<div class="faq-answer">

You can contact our support team through email or social media platforms.

</div>

</div>

</div>


<div>
<a href="CustomerHome.jsp">Back
</a></div>
<script>

function toggleFAQ(element){

let answer =
element.nextElementSibling;

if(answer.style.display === "block"){

answer.style.display = "none";

}
else{

answer.style.display = "block";

}

}

</script>

</body>
</html>