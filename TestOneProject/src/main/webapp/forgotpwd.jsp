<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🔑 Forgot Password | EazyWay Shop</title>

    <!-- Bootstrap & FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #ff7eb3, #ff758c, #ff9770);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            animation: backgroundFade 4s infinite alternate ease-in-out;
        }

        @keyframes backgroundFade {
            0% { background: linear-gradient(135deg, #ff7eb3, #ff758c, #ff9770); }
            100% { background: linear-gradient(135deg, #ff9770, #ff758c, #ff7eb3); }
        }

        .forgot-container {
            background: rgba(255, 255, 255, 0.2);
            padding: 30px;
            border-radius: 15px;
            backdrop-filter: blur(15px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            max-width: 420px;
            width: 100%;
            text-align: center;
            animation: fadeInBounce 1s ease-in-out;
            transition: transform 0.3s ease-in-out;
        }

        .forgot-container:hover {
            transform: scale(1.03);
        }

        @keyframes fadeInBounce {
            0% { opacity: 0; transform: translateY(-30px); }
            50% { opacity: 0.5; transform: translateY(5px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .form-control {
            border-radius: 15px;
            padding-left: 45px;
            transition: 0.3s ease-in-out;
            border: 1px solid rgba(255, 255, 255, 0.4);
        }

        .form-control:focus {
            box-shadow: 0 0 12px rgba(255, 255, 255, 0.7);
            border-color: rgba(255, 255, 255, 0.9);
            transform: scale(1.02);
        }

        .input-group-text {
            background: none;
            border: none;
            color: white;
            font-size: 1.3em;
            transition: 0.3s ease-in-out;
        }

        .form-control:focus + .input-group-text {
            color: #ffd700;
        }

        .btn-custom {
            border-radius: 15px;
            font-weight: bold;
            transition: 0.3s ease-in-out;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0.6;
            cursor: not-allowed;
        }

        .btn-custom.enabled {
            opacity: 1;
            cursor: pointer;
        }

        .btn-custom:hover {
            transform: scale(1.07);
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
        }

        .back-to-login {
            font-size: 0.9em;
            color: white;
            text-decoration: none;
        }

        .back-to-login:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="forgot-container">
        <h2 class="mb-3"> Forgot Password?</h2>
        <p class="text-white">No worries! Enter your email below, and we’ll send you a password reset link. 📧</p>
        <form action="reset-password.jsp" method="post">
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fa fa-envelope"></i> </span>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your registered email" required>
            </div>
            <button type="submit" class="btn btn-primary w-100 btn-custom" id="resetBtn" disabled>📨 Send Reset Link</button>
        </form>

        <p class="mt-3"><a href="login.jsp" class="back-to-login">🔙 Back to Login</a></p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript for Live Validation -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let emailInput = document.getElementById("email");
            let resetBtn = document.getElementById("resetBtn");

            function validateEmail(email) {
                let regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return regex.test(email);
            }

            function validateFields() {
                if (validateEmail(emailInput.value.trim())) {
                    resetBtn.removeAttribute("disabled");
                    resetBtn.classList.add("enabled");
                } else {
                    resetBtn.setAttribute("disabled", "true");
                    resetBtn.classList.remove("enabled");
                }
            }

            emailInput.addEventListener("input", validateFields);
        });
    </script>

</body>
</html>
