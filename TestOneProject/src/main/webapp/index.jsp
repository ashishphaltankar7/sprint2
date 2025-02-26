<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home | Order Management</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
        }

        /* Sticky Navbar */
        .navbar {
            position: sticky;
            top: 0;
            z-index: 1000;
            background: #333;
        }

        .navbar .nav-link {
            color: white;
        }

        .navbar .nav-link:hover {
            color: #f8d210;
        }

        .dropdown-menu {
            min-width: 200px;
        }

        .search-bar {
            width: 300px;
        }

        /* Carousel */
        .carousel-item img {
            height: 400px;
            object-fit: cover;
        }

        /* Product Cards */
        .product-card {
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s;
        }

        .product-card:hover {
            transform: scale(1.05);
        }

        .card img {
            height: 200px;
            object-fit: cover;
        }

        /* Footer */
        .footer {
            background: #222;
            color: white;
            padding: 20px;
            text-align: center;
        }

        .footer a {
            color: white;
            margin: 0 10px;
        }

        .scroll-up {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: #f8d210;
            border: none;
            padding: 10px 15px;
            border-radius: 50%;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">Order Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            Product Details
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="products.jsp?category=electronics">Electric Appliances</a></li>
                            <li><a class="dropdown-item" href="products.jsp?category=clothing">Clothing</a></li>
                            <li><a class="dropdown-item" href="products.jsp?category=footwear">Footwear</a></li>
                            <li><a class="dropdown-item" href="products.jsp?category=skincare">Skin-care Products</a></li>
                            <li><a class="dropdown-item" href="products.jsp?category=homedecor">Home Decor</a></li>
                            <li><a class="dropdown-item" href="products.jsp?category=goodies">Goodies</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact Us</a>
                    </li>
                </ul>

                <!-- Search Bar -->
                <input class="form-control me-2 search-bar" type="search" placeholder="Search..." id="searchInput">
                
                <!-- Logout Button -->
                <c:if test="${not empty sessionScope.user}">
                    <a href="logout.jsp" class="btn btn-danger">Logout</a>
                </c:if>
            </div>
        </div>
    </nav>

    <!-- Carousel -->
    <div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="product1.jpg" class="d-block w-100" alt="Product 1">
            </div>
            <div class="carousel-item">
                <img src="product2.jpg" class="d-block w-100" alt="Product 2">
            </div>
            <div class="carousel-item">
                <img src="product3.jpg" class="d-block w-100" alt="Product 3">
            </div>
        </div>
    </div>

    <!-- Product Section -->
    <div class="container mt-5">
        <h2>Featured Products</h2>
        <div class="row">
            <c:forEach var="product" items="${featuredProducts}">
                <div class="col-md-4">
                    <div class="card product-card">
                        <img src="${product.image}" class="card-img-top" alt="${product.name}">
                        <div class="card-body text-center">
                            <h5>$${product.price}</h5>
                            <p>⭐ ${product.rating}</p>
                            <button class="btn btn-primary">Add to Cart</button>
                            <button class="btn btn-outline-danger">Wishlist</button>
                            <button class="btn btn-success">Buy</button>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>Follow us: 
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
        </p>
        <p>Contact: support@ordermanagement.com</p>
        <p>© 2025 Order Management. All rights reserved.</p>
    </div>

    <!-- Scroll Up Button -->
    <button class="scroll-up" onclick="window.scrollTo({top: 0, behavior: 'smooth'});">
        <i class="fa fa-arrow-up"></i>
    </button>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
