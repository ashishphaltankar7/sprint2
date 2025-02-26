<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My E-Commerce Store</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #ff7eb3, #ff758c, #ff9770);
            color: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
            overflow: hidden;
        }

        .container {
            max-width: 650px;
            padding: 40px;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.2);
        }

        h1 {
            font-size: 2.8em;
            font-weight: 600;
        }

        p {
            font-size: 1.3em;
            font-weight: 300;
        }

        @keyframes fadeOut {
            from { opacity: 1; }
            to { opacity: 0; }
        }

        .fade-out {
            animation: fadeOut 1s forwards;
        }
    </style>
</head>
<body>
    <div class="container" id="welcome">
        <h1> Welcome EazyWay Shop </h1>
        <p>Discover amazing deals and shop your favorite products online.</p>
    </div>

    <script>
        setTimeout(() => {
            document.getElementById('welcome').classList.add('fade-out');
            setTimeout(() => {
                window.location.href = "login.jsp";
            }, 1000);
        }, 2000);
    </script>
</body>
</html>
