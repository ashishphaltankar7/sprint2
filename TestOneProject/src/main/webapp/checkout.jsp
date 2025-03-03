<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Confirm Order</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body { font-family: 'Poppins', sans-serif; background-color: #f8f9fa; }
        .navbar { background-color: #ff4d6d; }
        .navbar-brand, .nav-link { color: white !important; }
        .container { max-width: 600px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.2); margin-top: 50px; }
        .btn-primary { background-color: #ff4d6d; border: none; }
        .btn-primary:hover { background-color: #ff3658; }
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
                <li class="nav-item"><a class="nav-link" href="MyCart.jsp">Back to Cart</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Checkout Form -->
<div class="container">
    <h3 class="text-center">Checkout - Enter Your Details</h3>
    <form id="checkout-form">
        <div class="mb-2">
            <input type="text" id="customer-name" class="form-control" placeholder="Full Name" required>
        </div>
        <div class="mb-2">
            <input type="text" id="customer-address" class="form-control" placeholder="Full Address" required>
        </div>
        <div class="mb-2">
            <input type="text" id="customer-phone" class="form-control" placeholder="Mobile Number" required>
        </div>
        <div class="mb-2">
            <input type="text" id="customer-pincode" class="form-control" placeholder="Pincode" required>
        </div>
        <div class="mb-2">
            <input type="text" id="customer-city" class="form-control" placeholder="City" required>
        </div>
        <div class="mb-2">
            <input type="text" id="customer-state" class="form-control" placeholder="State" required>
        </div>
        <button type="button" class="btn btn-primary w-100" onclick="confirmOrder()">Confirm Order</button>
    </form>
</div>

<!-- Confirmation Popup -->
<div class="confirmation-popup" id="confirmation-popup">
    <h3>Your Order has been Confirmed!</h3>
    <p>Thank you for shopping with us.</p>
</div>

<!-- JavaScript -->
<script>
    function confirmOrder() {
        let name = document.getElementById('customer-name').value;
        let address = document.getElementById('customer-address').value;
        let phone = document.getElementById('customer-phone').value;
        let pincode = document.getElementById('customer-pincode').value;
        let city = document.getElementById('customer-city').value;
        let state = document.getElementById('customer-state').value;

        if (!name || !address || !phone || !pincode || !city || !state) {
            alert("Please fill in all details before confirming the order.");
            return;
        }

        // Show confirmation popup
        document.getElementById('confirmation-popup').style.display = 'block';
        setTimeout(() => {
            document.getElementById('confirmation-popup').style.display = 'none';
            generateReceipt(name, address, phone, pincode, city, state);
        }, 2000);
    }

    function generateReceipt(name, address, phone, pincode, city, state) {
        let receiptContent = `***** EazyWay Shop - Order Receipt *****\n\n`;
        receiptContent += `Customer Details:\n`;
        receiptContent += `Name: ${name}\n`;
        receiptContent += `Address: ${address}\n`;
        receiptContent += `Mobile: ${phone}\n`;
        receiptContent += `Pincode: ${pincode}\n`;
        receiptContent += `City: ${city}\n`;
        receiptContent += `State: ${state}\n\n`;
        receiptContent += `-----------------------------------------\n`;
        receiptContent += `Order Details:\n`;
        receiptContent += `-----------------------------------------\n`;

        let totalAmount = 0;
        let sampleCartItems = [
            { name: "Product 1", price: 50, quantity: 1 },
            { name: "Product 2", price: 40, quantity: 1 }
        ];

        sampleCartItems.forEach(item => {
            let total = item.price * item.quantity;
            totalAmount += total;
            receiptContent += `${item.name} - ${item.quantity} x $${item.price} = $${total}\n`;
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
