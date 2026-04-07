<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: linear-gradient(to right, #232526, #414345);
    font-family: 'Segoe UI', sans-serif;
}

/* Card */
.card-custom {
    background: white;
    border-radius: 15px;
    padding: 30px;
    margin-top: 60px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.3);
}

/* Button */
.btn-custom {
    border-radius: 25px;
}
</style>

</head>

<body>

<div class="container">

    <!-- Back Button -->
    <a href="<c:url value='/view-product'/>" class="btn btn-dark mt-4">⬅ Back</a>

    <div class="card-custom mx-auto" style="max-width: 600px;">

        <h2 class="text-center mb-4">✏️ Update Product</h2>

        <!-- FORM -->
        <form action="<c:url value='/update-product'/>" method="post">

            <!-- Hidden ID -->
            <input type="hidden" name="id" value="${product.id}" />

            <!-- Name -->
            <div class="mb-3">
                <label class="form-label">Product Name</label>
                <input type="text" name="name" class="form-control"
                       value="${product.name}" required>
            </div>

            <!-- Description -->
            <div class="mb-3">
                <label class="form-label">Description</label>
                <input type="text" name="description" class="form-control"
                       value="${product.description}" required>
            </div>

            <!-- Price -->
            <div class="mb-3">
                <label class="form-label">Price (₹)</label>
                <input type="number" name="price" class="form-control"
                       value="${product.price}" required>
            </div>

            <!-- Buttons -->
            <div class="text-center mt-4">

                <button type="submit" class="btn btn-success btn-lg btn-custom me-2">
                    💾 Update
                </button>

                <a href="<c:url value='/view-product'/>" 
                   class="btn btn-secondary btn-lg btn-custom">
                   Cancel
                </a>

            </div>

        </form>

    </div>

</div>

</body>
</html>