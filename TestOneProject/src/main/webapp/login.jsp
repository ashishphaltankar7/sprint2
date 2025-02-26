<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>🚀 Login | EazyWay Shop</title>
    
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

        .login-container {
            background: rgba(255, 255, 255, 0.15);
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

        .login-container:hover {
            transform: scale(1.03);
        }

        @keyframes fadeInBounce {
            0% { opacity: 0; transform: translateY(-30px); }
            50% { opacity: 0.5; transform: translateY(5px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .form-control {
            border-radius: 12px;
            padding-left: 45px;
            transition: 0.3s ease-in-out;
            border: 1px solid rgba(255, 255, 255, 0.4);
        }

        .form-control:focus {
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
            border-color: rgba(255, 255, 255, 0.8);
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
            border-radius: 12px;
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
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .forgot-password, .register-link {
            font-size: 0.9em;
            color: white;
            text-decoration: none;
        }

        .forgot-password:hover, .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="login-container">
        <h2 class="mb-3"> Welcome Back!</h2>
        <form action="dashboard.jsp" method="post">
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fa fa-user"></i> 👤</span>
                <input type="text" class="form-control" id="username" name="username" placeholder="Username or Email" required>
            </div>
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fa fa-lock"></i> 🔒</span>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            </div>
            <div class="d-flex justify-content-between mb-3">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember Me</label>
                </div>
                <a href="forgotpwd.jsp" class="forgotpwd">Forgot Password? </a>
            </div>
            <button type="submit" class="btn btn-primary w-100 btn-custom" id="loginBtn" disabled> Login</button>
        </form>

        <p class="mt-3">Don't have an account? <a href="signup.jsp" class="register-link">Sign Up </a></p>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- JavaScript for Live Validation -->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let usernameInput = document.getElementById("username");
            let passwordInput = document.getElementById("password");
            let loginBtn = document.getElementById("loginBtn");

            function validateFields() {
                if (usernameInput.value.trim() !== "" && passwordInput.value.trim() !== "") {
                    loginBtn.removeAttribute("disabled");
                    loginBtn.classList.add("enabled");
                } else {
                    loginBtn.setAttribute("disabled", "true");
                    loginBtn.classList.remove("enabled");
                }
            }

            usernameInput.addEventListener("input", validateFields);
            passwordInput.addEventListener("input", validateFields);
        });
    </script>

</body>
</html>
