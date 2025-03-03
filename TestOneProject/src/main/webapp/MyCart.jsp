<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Cart - Checkout</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; }
        .navbar { background-color: #ff4d6d; }
        .navbar-brand, .nav-link { color: white !important; }
        .cart-table img { width: 80px; height: 80px; object-fit: cover; border-radius: 8px; }
        .confirmation-popup {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
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
            </ul>
        </div>
    </div>
</nav>

<!-- Customer Details Form -->
<div class="container mt-4">
    <h3>Enter Your Details</h3>
    <form id="customer-form">
        <div class="mb-2">
            <input type="text" id="customer-name" class="form-control" placeholder="Full Name" required>
        </div>
        <div class="mb-2">
            <input type="text" id="customer-address" class="form-control" placeholder="Full Address" required>
        </div>
        <div class="mb-2">
            <input type="text" id="customer-phone" class="form-control" placeholder="Mobile Number" required>
        </div>
    </form>
</div>

<!-- Cart Table -->
<div class="container mt-4">
    <h2 class="text-center mb-4">My Cart</h2>
    <table class="table table-bordered cart-table">
        <thead class="table-dark">
            <tr>
                <th>Image</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody id="cart-items">
            <tr>
                <td><img src="img/product1.jpg" alt="Product 1"></td>
                <td>Product 1</td>
                <td>$50</td>
                <td><input type="number" class="form-control quantity" value="1" min="1" onchange="updateTotal()"></td>
                <td class="total-price">$50</td>
            </tr>
            <tr>
                <td><img src="img/product2.jpg" alt="Product 2"></td>
                <td>Product 2</td>
                <td>$40</td>
                <td><input type="number" class="form-control quantity" value="1" min="1" onchange="updateTotal()"></td>
                <td class="total-price">$40</td>
            </tr>
        </tbody>
    </table>
    <div class="text-end">
        <h4>Total: <span id="cart-total">$90</span></h4>
        <button class="btn btn-success" onclick="checkout()">Checkout</button>
    </div>
</div>

<!-- Confirmation Popup -->
<div class="confirmation-popup" id="confirmation-popup">
    <h3>Order Placed, Thank you!</h3>
    <p>Your order confirmation will be sent to your email.</p>
</div>

<!-- JavaScript -->
<script>
    function updateTotal() {
        let total = 0;
        document.querySelectorAll('.cart-table tbody tr').forEach(row => {
            let price = parseFloat(row.children[2].textContent.replace('$', ''));
            let quantity = row.querySelector('.quantity').value;
            let subtotal = price * quantity;
            row.querySelector('.total-price').textContent = `$${subtotal.toFixed(2)}`;
            total += subtotal;
        });
        document.getElementById('cart-total').textContent = `$${total.toFixed(2)}`;
    }

    function checkout() {
        let customerName = document.getElementById('customer-name').value;
        let customerAddress = document.getElementById('customer-address').value;
        let customerPhone = document.getElementById('customer-phone').value;

        if (!customerName || !customerAddress || !customerPhone) {
            alert("Please fill in all customer details before checkout.");
            return;
        }

        document.getElementById('confirmation-popup').style.display = 'block';
        setTimeout(() => {
            document.getElementById('confirmation-popup').style.display = 'none';
        }, 2000);

        generateReceipt(customerName, customerAddress, customerPhone);
    }

    function generateReceipt(name, address, phone) {
        let receiptContent = `***** EazyWay Shop - Order Receipt *****\n\n`;
        receiptContent += `Customer Details:\n`;
        receiptContent += `Name: ${name}\n`;
        receiptContent += `Address: ${address}\n`;
        receiptContent += `Mobile: ${phone}\n\n`;
        receiptContent += `Order Details:\n`;
        receiptContent += `-----------------------------------------\n`;

        let totalAmount = 0;
        document.querySelectorAll('.cart-table tbody tr').forEach(row => {
            let productName = row.children[1].textContent;
            let price = row.children[2].textContent;
            let quantity = row.querySelector('.quantity').value;
            let total = row.children[4].textContent;
            totalAmount += parseFloat(total.replace('$', ''));

            receiptContent += `${productName} - ${quantity} x ${price} = ${total}\n`;
        });

        receiptContent += `-----------------------------------------\n`;
        receiptContent += `Total Amount: $${totalAmount.toFixed(2)}\n`;
        receiptContent += `-----------------------------------------\n`;
        receiptContent += `Thank you for shopping with EazyWay Shop!\n`;

        let blob = new Blob([receiptContent], { type: "text/plain" });
        let link = document.createElement("a");
        link.href = URL.createObjectURL(blob);
        link.download = "Order_Receipt.txt";
        link.click();
    }
</script>

</body>
</html>
