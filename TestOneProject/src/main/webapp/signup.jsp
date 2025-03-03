<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up | EazyWay Shop</title>

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
        }

        .signup-container {
            background: rgba(255, 255, 255, 0.2);
            padding: 30px;
            border-radius: 15px;
            backdrop-filter: blur(15px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.3);
            max-width: 450px;
            width: 100%;
            text-align: center;
        }

        .form-control {
            border-radius: 10px;
            padding-left: 15px;
            border: 1px solid rgba(255, 255, 255, 0.4);
        }

        .form-control:focus {
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.5);
            border-color: rgba(255, 255, 255, 0.8);
        }

        .toggle-password {
            background: none;
            border: none;
            cursor: pointer;
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: black;
            font-size: 1.8em;
            visibility: visible;
        }

        .btn-custom {
            border-radius: 10px;
            font-weight: bold;
            opacity: 0.6;
            cursor: not-allowed;
        }

        .btn-custom.enabled {
            opacity: 1;
            cursor: pointer;
        }

        .password-match {
            color: red;
            font-size: 0.9em;
            display: none;
        }
    </style>
</head>
<body>

    <div class="signup-container">
        <h2 class="mb-3">Sign Up</h2>
        <form action="register.jsp" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" id="name" name="name" placeholder="Full Name" required>
            </div>

            <div class="mb-3">
                <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
            </div>

            <div class="mb-3">
                <input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number" required>
            </div>

            <div class="mb-3">
                <input type="text" class="form-control" id="address" name="address" placeholder="Address" required>
            </div>

            <div class="mb-3">
                <input type="text" class="form-control" id="pincode" name="pincode" placeholder="Pincode" required>
            </div>

            <!-- State Selection -->
            <div class="mb-3">
                <select class="form-control" id="state" name="state" required>
                    <option value="" disabled selected>Select State</option>
                    <option value="Maharashtra">Maharashtra</option>
                    <option value="Karnataka">Karnataka</option>
                    <option value="Tamil Nadu">Tamil Nadu</option>
                    <option value="Delhi">Delhi</option>
                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                    <option value="Gujarat">Gujarat</option>
                    <option value="West Bengal">West Bengal</option>
                </select>
            </div>

            <!-- City Selection -->
            <div class="mb-3">
                <select class="form-control" id="city" name="city" required>
                    <option value="" disabled selected>Select City</option>
                </select>
            </div>

            <div class="mb-3">
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            </div>

            <div class="mb-3 position-relative">
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
                <button type="button" class="toggle-password" onclick="togglePasswordVisibility()">
                    <i class="fa fa-eye"></i>
                </button>
            </div>

            <p id="passwordMatchMessage" class="password-match">Passwords do not match!</p>

            <button type="submit" class="btn btn-primary w-100 btn-custom" id="signupBtn" disabled>Sign Up</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let nameInput = document.getElementById("name");
            let emailInput = document.getElementById("email");
            let phoneInput = document.getElementById("phone");
            let addressInput = document.getElementById("address");
            let pincodeInput = document.getElementById("pincode");
            let stateInput = document.getElementById("state");
            let cityInput = document.getElementById("city");
            let passwordInput = document.getElementById("password");
            let confirmPasswordInput = document.getElementById("confirmPassword");
            let signupBtn = document.getElementById("signupBtn");
            let passwordMatchMessage = document.getElementById("passwordMatchMessage");

            function validateForm() {
                let isValid = 
                    nameInput.value.trim() !== "" &&
                    emailInput.value.trim() !== "" &&
                    phoneInput.value.trim() !== "" &&
                    addressInput.value.trim() !== "" &&
                    pincodeInput.value.trim() !== "" &&
                    stateInput.value.trim() !== "" &&
                    cityInput.value.trim() !== "" &&
                    passwordInput.value.trim() !== "" &&
                    confirmPasswordInput.value.trim() !== "" &&
                    passwordInput.value === confirmPasswordInput.value;

                if (isValid) {
                    signupBtn.removeAttribute("disabled");
                    signupBtn.classList.add("enabled");
                    passwordMatchMessage.style.display = "none";
                } else {
                    signupBtn.setAttribute("disabled", "true");
                    signupBtn.classList.remove("enabled");
                    if (passwordInput.value !== confirmPasswordInput.value) {
                        passwordMatchMessage.style.display = "block";
                    } else {
                        passwordMatchMessage.style.display = "none";
                    }
                }
            }

            function togglePasswordVisibility() {
                let confirmPasswordInput = document.getElementById("confirmPassword");
                let toggleButton = document.querySelector(".toggle-password i");

                if (confirmPasswordInput.type === "password") {
                    confirmPasswordInput.type = "text";
                    toggleButton.classList.remove("fa-eye");
                    toggleButton.classList.add("fa-eye-slash");
                } else {
                    confirmPasswordInput.type = "password";
                    toggleButton.classList.remove("fa-eye-slash");
                    toggleButton.classList.add("fa-eye");
                }
            }

            stateInput.addEventListener("change", function() {
                let state = stateInput.value;
                let cities = {
                    "Maharashtra": ["Mumbai", "Pune", "Nagpur"],
                    "Karnataka": ["Bangalore", "Mysore"],
                    "Tamil Nadu": ["Chennai", "Coimbatore"],
                    "Delhi": ["New Delhi"],
                    "Uttar Pradesh": ["Lucknow", "Noida"],
                    "Gujarat": ["Ahmedabad", "Surat"],
                    "West Bengal": ["Kolkata"]
                };
                cityInput.innerHTML = '<option value="" disabled selected>Select City</option>';
                cities[state].forEach(city => {
                    let option = document.createElement("option");
                    option.value = city;
                    option.textContent = city;
                    cityInput.appendChild(option);
                });
            });

            [nameInput, emailInput, phoneInput, addressInput, pincodeInput, stateInput, cityInput, passwordInput, confirmPasswordInput].forEach(input => {
                input.addEventListener("input", validateForm);
            });
        });
    </script>

</body>
</html>
