<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Added</title>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #74ABE2, #5563DE);
            margin: 0;
        }

        /* Navbar fixed at top, full width */
        nav {
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            background: rgba(0, 0, 0, 0.85);
            backdrop-filter: blur(8px);
            padding: 15px 40px;
            display: flex;
            justify-content: space-between; /* Logo left, links right */
            align-items: center;
            z-index: 1000;
            box-sizing: border-box;
        }

        nav .logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        nav .logo i {
            font-size: 28px;
            color: #ffd700;
        }

        nav .logo h2 {
            margin: 0;
            font-weight: 600;
            color: white;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
            flex-wrap: wrap; /* Prevent shrink on small screens */
        }

        nav ul li a {
            text-decoration: none;
            color: white;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 6px;
            padding: 6px 8px;
            border-radius: 6px;
            transition: 0.3s;
            white-space: nowrap; /* Prevent wrapping */
        }

        nav ul li a:hover,
        nav ul li a.active {
            background: linear-gradient(135deg, #007bff, #6610f2);
            color: white;
        }

        nav ul li a i {
            color: #ffd700;
        }

        /* Content below navbar */
        .content {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 80px); /* Leave space for navbar */
            margin-top: 80px; /* Same as navbar height */
        }

        .success-box {
            background: #fff;
            padding: 40px 60px;
            border-radius: 20px;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.3);
            text-align: center;
            max-width: 450px;
        }

        h1 {
            color: #2E3A8C;
            margin-bottom: 25px;
        }

        .success-icon {
            font-size: 50px;
            color: #28a745;
            margin-bottom: 15px;
        }

        input[type="submit"] {
            background: #5563DE;
            color: #fff;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #3744b5;
        }

        @media (max-width: 768px) {
            nav ul {
                gap: 10px;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <%@ include file="navbar.jsp" %>

    <!-- Centered success content -->
    <div class="content">
        <div class="success-box">
            <div class="success-icon">✅</div>
            <h1>Employee Added Successfully!</h1>
            <form action="add" method="get">
                <input type="submit" value="Add Another Employee">
            </form>
        </div>
    </div>

</body>
</html>
