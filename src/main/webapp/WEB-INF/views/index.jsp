<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<meta charset="UTF-8">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<style>
body {
    margin: 0;
    padding: 0;
    font-family: 'Segoe UI', sans-serif;
    height: 100vh;
    background: linear-gradient(120deg, #0f2027, #203a43, #2c5364);
    overflow: hidden;
}

/* Floating circles */
.circle {
    position: absolute;
    border-radius: 50%;
    opacity: 0.2;
    animation: float 6s infinite ease-in-out;
}

.circle:nth-child(1) {
    width: 200px;
    height: 200px;
    background: #00c6ff;
    top: 10%;
    left: 5%;
}

.circle:nth-child(2) {
    width: 150px;
    height: 150px;
    background: #ff6a00;
    bottom: 10%;
    right: 10%;
}

@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-20px); }
    100% { transform: translateY(0px); }
}

/* Card */
.hero-box {
    position: relative;
    z-index: 1;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    padding: 60px;
    text-align: center;
    color: white;
    box-shadow: 0 10px 40px rgba(0,0,0,0.4);
    width: 90%;
    max-width: 650px;
}

.hero-box h1 {
    font-size: 40px;
    font-weight: bold;
}

.hero-box p {
    font-size: 18px;
    opacity: 0.85;
}

.btn-custom {
    padding: 12px 30px;
    font-size: 18px;
    border-radius: 50px;
    transition: 0.3s;
}

.btn-custom:hover {
    transform: scale(1.05);
}

.icon-img {
    width: 90px;
    margin-bottom: 20px;
}

.footer-text {
    margin-top: 30px;
    font-size: 14px;
    opacity: 0.7;
}
</style>

</head>

<body>

<div class="circle"></div>
<div class="circle"></div>

<div class="d-flex justify-content-center align-items-center h-100">

    <div class="hero-box">

        <img src="https://cdn-icons-png.flaticon.com/512/2331/2331943.png" class="icon-img"/>

        <h1>Product Management System 🚀</h1>
        <p>Smart way to manage your products</p>

        <div class="mt-4">

            <a href="<c:url value='/add-product'/>" 
               class="btn btn-success btn-lg btn-custom me-3 shadow">
               ➕ Add Product
            </a>

            <a href="<c:url value='/view-product'/>" 
               class="btn btn-primary btn-lg btn-custom shadow">
               📦 View Products
            </a>

        </div>

        <div class="footer-text">
            ⚡ Built with Spring MVC + Hibernate
        </div>

    </div>

</div>

</body>
</html>