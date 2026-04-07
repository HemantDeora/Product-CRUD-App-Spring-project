<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

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

        <h2 class="text-center mb-4">Product List</h2>

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
                               onclick="return confirm('Are you sure?')">
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