<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1605902711622-cfb43c4437e5') no-repeat center center/cover;
            margin: 0;
            color: #333;
        }

        .container {
            max-width: 600px;
            margin: 60px auto;
            background: rgba(255, 255, 255, 0.9);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-top: 10px;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 5px;
        }

        button {
            width: 100%;
            background: linear-gradient(135deg, #007bff, #6610f2);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            margin-top: 20px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: linear-gradient(135deg, #0056b3, #520dc2);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Employee</h2>
        <form action="addSuccessfully" method="post">

            <label>Id:</label>
            <input type="number" name="empId" required>

            <label>Name:</label>
            <input type="text" name="empName" required>

            <label>Department:</label>
            <input type="text" name="empDepartment" required>

            <label>Salary:</label>
            <input type="number" name="empSalary" required>

            <button type="submit">Add Employee</button>
        </form>
    </div>
</body>
</html>
