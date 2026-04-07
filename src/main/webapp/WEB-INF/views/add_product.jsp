<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="./base.jsp" %>
</head>
<style>

body {
    background: 
        linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
        url("https://images.unsplash.com/photo-1498050108023-c5249f4df085"),
        url("https://images.unsplash.com/photo-1519389950473-47ba0277781c");
    
    background-size: cover;
    background-position: center;
    background-blend-mode: overlay;
    background-attachment: fixed;
    color: white;
}
</style>

<body>

<div class="row justify-content-center">

    <div class="col-md-6">

        <div class="card shadow-lg border-0">

            <!-- Header -->
            <div class="card-header text-center bg-dark text-white">
                <h4 class="mb-0">➕ Add New Product</h4>
            </div>

            <!-- Body -->
            <div class="card-body">

                <form action="save-product" method="post">


                    <!-- Name -->
                    <div class="form-group">
                        <label><b>Product Name</b></label>
                        <input type="text" name="name" class="form-control"
                               placeholder="Enter product name" required>
                    </div>

                    <!-- Description -->
                    <div class="form-group">
                        <label><b>Description</b></label>
                        <textarea name="description" class="form-control"
                                  rows="3" placeholder="Enter product description" required></textarea>
                    </div>

                    <!-- Price -->
                    <div class="form-group">
                        <label><b>Price (₹)</b></label>
                        <input type="number" name="price" class="form-control"
                               placeholder="Enter product price" required>
                    </div>

                    <!-- Buttons -->
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-success px-4">
                            💾 Save
                        </button>

                        <a href="${pageContext.request.contextPath }/" class="btn btn-secondary px-4">
                            Back
                        </a>
                    </div>

                </form>

            </div>

        </div>

    </div>

</div>


</body>
</html>