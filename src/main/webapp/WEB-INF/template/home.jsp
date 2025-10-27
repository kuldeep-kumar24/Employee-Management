<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Management - Home</title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

    <style>
        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1522075469751-3a6694fb2f61') no-repeat center center/cover;
            color: white;
        }

        .overlay {
            background: rgba(0, 0, 0, 0.6);
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        h1 {
            font-size: 48px;
            font-weight: 600;
            margin-bottom: 10px;
            color: #fff;
        }

        p {
            font-size: 18px;
            color: #ddd;
            margin-bottom: 40px;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
            width: 80%;
            max-width: 900px;
        }

        .card {
            background: rgba(255, 255, 255, 0.15);
            border-radius: 15px;
            padding: 30px 20px;
            text-align: center;
            backdrop-filter: blur(10px);
            transition: 0.3s;
            cursor: pointer;
        }

        .card:hover {
            transform: translateY(-8px);
            background: rgba(255, 255, 255, 0.25);
        }

        .card i {
            font-size: 40px;
            margin-bottom: 15px;
            color: #ffd700;
        }

        .card h3 {
            color: white;
            margin: 10px 0;
        }

        .card a {
            display: inline-block;
            margin-top: 10px;
            color: #007bff;
            text-decoration: none;
            font-weight: 500;
            background: white;
            padding: 8px 16px;
            border-radius: 8px;
            transition: 0.3s;
        }

        .card a:hover {
            background: #007bff;
            color: white;
        }

        footer {
            position: absolute;
            bottom: 20px;
            color: #ccc;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 36px;
            }
            p {
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

    <div class="overlay">
        <h1>Welcome to Employee Management System</h1>
        <p>Manage your organization's employees easily — Add, Edit, List, Search, and Delete records.</p>

        <div class="cards">
            <div class="card">
                <i class="fa-solid fa-user-plus"></i>
                <h3>Add Employee</h3>
                <a href="add">Go</a>
            </div>

            <div class="card">
                <i class="fa-solid fa-user-pen"></i>
                <h3>Edit Employee</h3>
                <a href="editEmployee">Go</a>
            </div>

            <div class="card">
                <i class="fa-solid fa-users"></i>
                <h3>List Employees</h3>
                <a href="list">Go</a>
            </div>

            <div class="card">
                <i class="fa-solid fa-magnifying-glass"></i>
                <h3>Search Employee</h3>
                <a href="searchEmployee">Go</a>
            </div>

            <div class="card">
                <i class="fa-solid fa-user-xmark"></i>
                <h3>Delete Employee</h3>
                <a href="delete">Go</a>
            </div>
        </div>

        <footer>
            &copy; 2025 Employee Management System | Designed by Kuldeep
        </footer>
    </div>

</body>
</html>
