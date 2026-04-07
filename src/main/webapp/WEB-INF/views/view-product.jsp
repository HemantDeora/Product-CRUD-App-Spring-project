<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- SweetAlert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
body {
    background: linear-gradient(to right, #1f4037, #99f2c8);
}

.card-custom {
    background: white;
    border-radius: 15px;
    padding: 30px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.2);
}

.btn-custom {
    border-radius: 20px;
}
</style>

</head>

<body>

<div class="container mt-5">

    <a href="<c:url value='/'/>" class="btn btn-dark mb-3">⬅ Back</a>

    <div class="card-custom">

        <h2 class="text-center mb-3">Product List</h2>

        <!-- ✅ SweetAlert Message -->
        <c:if test="${not empty msg}">
            <script>
                Swal.fire({
                    title: "Success!",
                    text: "${msg}",
                    icon: "success"
                });
            </script>
            <c:remove var="msg"/>
        </c:if>

        <!-- ✅ Total Products -->
        <h5 class="text-center mb-3">
            Total Products: ${fn:length(products)}
        </h5>

        <!-- 🔍 SEARCH -->
        <div class="d-flex justify-content-between mb-3">

            <form action="<c:url value='/search'/>" method="get" class="d-flex">
                <input type="text" name="keyword" class="form-control me-2"
                       placeholder="🔍 Search product..." required>
                <button class="btn btn-primary">Search</button>
            </form>

            <a href="<c:url value='/view-product'/>" class="btn btn-secondary">
                Reset
            </a>

        </div>

        <!-- 🎯 FILTER -->
        <form action="<c:url value='/filter'/>" method="get" class="row g-2 mb-3">

            <div class="col-md-4">
                <input type="text" name="keyword" class="form-control"
                       placeholder="Name...">
            </div>

            <div class="col-md-3">
                <input type="number" name="min" class="form-control"
                       placeholder="Min Price" required>
            </div>

            <div class="col-md-3">
                <input type="number" name="max" class="form-control"
                       placeholder="Max Price" required>
            </div>

            <div class="col-md-2">
                <button class="btn btn-success w-100">Filter</button>
            </div>

        </form>

        <!-- 📊 SORT -->
        <div class="text-center mb-3">
            <a href="<c:url value='/sort?type=low'/>" class="btn btn-info btn-sm">Price ↑</a>
            <a href="<c:url value='/sort?type=high'/>" class="btn btn-info btn-sm">Price ↓</a>
            <a href="<c:url value='/sort?type=name'/>" class="btn btn-secondary btn-sm">Name</a>
        </div>

        <!-- ❗ EMPTY RESULT -->
        <c:if test="${empty products}">
            <h5 class="text-danger text-center mb-3">No product found 😢</h5>
        </c:if>

        <table class="table table-bordered table-hover text-center">

            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Price (₹)</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>

                <c:forEach items="${products}" var="product">
                    <tr>
                        <td>${product.id}</td>
                        <td>${product.name}</td>
                        <td>${product.description}</td>
                        <td><b>₹ ${product.price}</b></td>
                        <td>
                            <a href="<c:url value='/delete/${product.id}'/>"
                               class="btn btn-danger btn-sm btn-custom"
                               onclick="return confirm('Delete this product permanently?')">
                               Delete
                            </a>

                            <a href="<c:url value='/update/${product.id}'/>"
                               class="btn btn-warning btn-sm btn-custom">
                               Update
                            </a>
                        </td>
                    </tr>
                </c:forEach>

            </tbody>

        </table>

        <div class="text-center mt-3">
            <a href="<c:url value='/add-product'/>" 
               class="btn btn-success btn-lg">
               ➕ Add Product
            </a>
        </div>

    </div>

</div>

</body>
</html>