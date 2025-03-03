<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Wishlist - Save Your Favorites!</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #ff7eb3, #ff758c, #ff9770);
            font-family: 'Poppins', sans-serif;
            color: black; 
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .navbar { background-color: #ff4d6d; }
        .navbar-brand, .nav-link { color: white !important; }
        .nav-button { background-color: #ff4d6d; color: white; border: none; padding: 8px 15px; border-radius: 5px; margin-left: 10px; }
        .nav-button:hover { background-color: #ff3658; }
        .wishlist-container { background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.2); }
        .wishlist-table img { width: 80px; height: 80px; object-fit: cover; border-radius: 8px; }
        .wishlist-table th, .wishlist-table td { text-align: center; vertical-align: middle; }
        .footer { background-color: #222; color: white; text-align: center; padding: 5px; font-size: 0.8em; margin-top: auto; }
        .btn-action { padding: 6px 12px; border-radius: 5px; }
        .move-to-cart { background: green; color: white; }
        .remove-btn { background: red; color: white; }
        .quantity-controls { display: flex; align-items: center; justify-content: center; }
        .quantity-controls button { border: none; background: #ff4d6d; color: white; padding: 5px 10px; cursor: pointer; }
        .quantity-controls input { width: 50px; text-align: center; margin: 0 5px; }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">EazyWay Shop</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link nav-button" href="index.jsp">Browse More Products</a></li>
                <li class="nav-item"><a class="nav-link nav-button" href="MyCart.jsp">Go to Cart</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Wishlist Table -->
<div class="container mt-4">
    <h2 class="text-center mb-4">My Wishlist - Save Your Favorites!</h2>
    <div class="wishlist-container">
        <div class="table-responsive">
            <table class="table table-bordered wishlist-table">
                <thead class="table-dark">
                    <tr>
                        <th>Image</th>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Total</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><img src="img/product1.jpg" alt="Product 1"></td>
                        <td>Product 1</td>
                        <td>$50</td>
                        <td class="quantity-controls">
                            <button class="decrease">-</button>
                            <input type="number" class="form-control text-center quantity" value="1" min="1">
                            <button class="increase">+</button>
                        </td>
                        <td class="total-price">$50</td>
                        <td>
                            <button class="btn btn-action move-to-cart">Move to Cart</button>
                            <button class="btn btn-action remove-btn">Remove</button>
                        </td>
                    </tr>
                    <tr>
                        <td><img src="img/product2.jpg" alt="Product 2"></td>
                        <td>Product 2</td>
                        <td>$40</td>
                        <td class="quantity-controls">
                            <button class="decrease">-</button>
                            <input type="number" class="form-control text-center quantity" value="1" min="1">
                            <button class="increase">+</button>
                        </td>
                        <td class="total-price">$40</td>
                        <td>
                            <button class="btn btn-action move-to-cart">Move to Cart</button>
                            <button class="btn btn-action remove-btn">Remove</button>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Footer -->
<div class="footer">
    <p>Follow us:</p>
    <p>Contact: support@eazywayshop.com</p>
    <p>&copy; 2025 EazyWay Shop. All rights reserved.</p>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function updateTotal() {
        document.querySelectorAll('.wishlist-table tbody tr').forEach(row => {
            let price = parseFloat(row.children[2].textContent.replace('$', ''));
            let quantity = row.querySelector('.quantity').value;
            let subtotal = price * quantity;
            row.querySelector('.total-price').textContent = `$${subtotal.toFixed(2)}`;
        });
    }

    document.querySelectorAll('.increase').forEach(button => {
        button.addEventListener('click', function() {
            let input = this.previousElementSibling;
            input.value = parseInt(input.value) + 1;
            updateTotal();
        });
    });

    document.querySelectorAll('.decrease').forEach(button => {
        button.addEventListener('click', function() {
            let input = this.nextElementSibling;
            if (input.value > 1) {
                input.value = parseInt(input.value) - 1;
                updateTotal();
            }
        });
    });

    document.querySelectorAll('.remove-btn').forEach(button => {
        button.addEventListener('click', function() {
            this.closest('tr').remove();
            updateTotal();
        });
    });

    document.querySelectorAll('.move-to-cart').forEach(button => {
        button.addEventListener('click', function() {
            alert('Item moved to cart!');
            this.closest('tr').remove();
        });
    });
</script>

</body>
</html>
