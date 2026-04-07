<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

/* Background */
body {
    background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
                url("https://images.unsplash.com/photo-1498050108023-c5249f4df085");
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    font-family: 'Segoe UI', sans-serif;
}

/* Glass Card */
.card-custom {
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(15px);
    border-radius: 20px;
    padding: 30px;
    color: white;
    box-shadow: 0 10px 30px rgba(0,0,0,0.5);
}

/* Inputs */
.form-control {
    border-radius: 10px;
    padding: 10px;
}

/* Buttons */
.btn-custom {
    border-radius: 25px;
    padding: 10px 25px;
    transition: 0.3s;
}

.btn-custom:hover {
    transform: scale(1.05);
}

/* Title */
.title-text {
    font-weight: bold;
    letter-spacing: 1px;
}

</style>

</head>

<body>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-6">

            <div class="card-custom">

                <!-- Title -->
                <h3 class="text-center mb-4 title-text">
                    ➕ Add New Product
                </h3>

                <!-- FORM -->
                <form action="save-product" method="post">

                    <!-- Name -->
                    <div class="mb-3">
                        <label class="form-label">📦 Product Name</label>
                        <input type="text" name="name" class="form-control"
                               placeholder="Enter product name" required>
                    </div>

                    <!-- Description -->
                    <div class="mb-3">
                        <label class="form-label">📝 Description</label>
                        <textarea name="description" class="form-control"
                                  rows="3" placeholder="Enter product description" required></textarea>
                    </div>

                    <!-- Price -->
                    <div class="mb-3">
                        <label class="form-label">💰 Price (₹)</label>
                        <input type="number" name="price" class="form-control"
                               placeholder="Enter product price" required>
                    </div>

                    <!-- Buttons -->
                    <div class="text-center mt-4">

                        <button type="submit" class="btn btn-success btn-custom me-2">
                            💾 Save Product
                        </button>

                        <a href="${pageContext.request.contextPath}/"
                           class="btn btn-secondary btn-custom">
                           ⬅ Back
                        </a>

                    </div>

                </form>

            </div>

        </div>

    </div>

</div>

</body>
</html>