<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    background: #f5f7fa;
}
</style>

</head>

<body>

<div class="container mt-5">

    <h2 class="text-center mb-4">Product List</h2>

    <table class="table table-bordered text-center">

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
                <td>${product.price}</td>
                <td>
                    <button class="btn btn-danger btn-sm">Delete</button>
                    <button class="btn btn-warning btn-sm">Update</button>
                </td>
            </tr>
            </c:forEach>

        </tbody>

    </table>

    <div class="text-center mt-3">
        <a href="add-product" class="btn btn-success">
            Add Product
        </a>
    </div>

</div>

</body>
</html>