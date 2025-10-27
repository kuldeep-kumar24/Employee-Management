<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Employee</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1507209696998-3c532be9b2b6') no-repeat center center/cover;
            background-size: cover;
            margin: 0;
        }

        .container {
            width: 600px;
            margin: 120px auto;
            background: rgba(255,255,255,0.95);
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 6px 25px rgba(0,0,0,0.35);
            text-align: center;
        }

        h2 {
            color: #dc3545;
            margin-bottom: 25px;
        }

        input[type="number"] {
            width: 80%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-top: 10px;
            font-size: 16px;
        }

        button {
            width: 50%;
            background: linear-gradient(135deg, #dc3545, #b02a37);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            margin-top: 20px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        button:hover {
            background: #a71d2a;
        }

        .note, .success-message {
            margin-top: 20px;
            font-size: 14px;
            color: #555;
        }

        .success-message {
            color: #28a745;
            font-weight: 600;
        }

        /* Employee Card */
        .employee-card {
            background: #f7f7f7;
            padding: 20px 25px;
            border-radius: 12px;
            margin-top: 25px;
            text-align: left;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s;
        }

        .employee-card:hover {
            transform: scale(1.02);
        }

        .employee-card h3 {
            margin-top: 0;
            color: #333;
            border-bottom: 2px solid #dc3545;
            padding-bottom: 8px;
        }

        .employee-card p {
            margin: 10px 0;
            font-size: 16px;
            color: #444;
        }

        .employee-card span {
            font-weight: 600;
            color: #000;
        }

    </style>
    <script>
        function confirmDelete(event) {
            const empId = document.getElementById("empId").value;
            const empName = document.getElementById("empName").value;
            const empDept = document.getElementById("empDepartment").value;
            const empSalary = document.getElementById("empSalary").value;

            const confirmation = confirm(
                `Are you sure you want to delete this employee?\n\n` +
                `ID: ${empId}\n` +
                `Name: ${empName}\n` +
                `Department: ${empDept}\n` +
                `Salary: ${empSalary}`
            );

            if(!confirmation) {
                event.preventDefault();
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>Delete Employee</h2>

        <!-- Step 1: Enter Employee ID -->
        <form action="deleteEmployee" method="get">
            <input type="number" name="empId" placeholder="Enter Employee ID" required>
            <button type="submit">Fetch Employee</button>
        </form>

        <!-- Step 2: Show Employee Details if available -->
        <c:if test="${not empty employee}">
            <div class="employee-card">
                <h3>Employee Details</h3>
                <p><span>ID:</span> ${employee.empId}</p>
                <p><span>Name:</span> ${employee.empName}</p>
                <p><span>Department:</span> ${employee.empDepartment}</p>
                <p><span>Salary:</span> ${employee.empSalary}</p>
            </div>

            <form action="deleteEmployeeDo" method="post" onsubmit="confirmDelete(event)">
                <input type="hidden" name="empId" id="empId" value="${employee.empId}">

                <button type="submit">Confirm Delete</button>
            </form>
        </c:if>

        <!-- Step 3: Show Success Message -->
        <c:if test="${not empty message}">
            <div class="success-message">${message}</div>
        </c:if>

        <!-- Step 3: Show Success Message -->
        <c:if test="${not empty errorMessage}">
            <div class="success-message">${errorMessage}</div>
        </c:if>

        <div class="note">Please enter the Employee ID to fetch details before deletion.</div>
    </div>
</body>
</html>
