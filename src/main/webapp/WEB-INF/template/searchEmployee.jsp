<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Employee</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('https://images.unsplash.com/photo-1519389950473-47ba0277781c') no-repeat center center/cover;
            background-size: cover;
            margin: 0;
        }

        .container {
            width: 700px;
            margin: 80px auto;
            background: rgba(255,255,255,0.95);
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 6px 25px rgba(0,0,0,0.3);
            text-align: center;
            overflow: hidden;
        }

        h2 {
            color: #007bff;
            margin-bottom: 25px;
            animation: fadeInDown 0.8s ease;
        }

        input {
            width: 80%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 16px;
            transition: 0.3s;
        }

        input:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0,123,255,0.3);
            outline: none;
        }

        button {
            width: 50%;
            background: linear-gradient(135deg, #007bff, #6610f2);
            color: white;
            padding: 12px;
            border: none;
            border-radius: 8px;
            margin-top: 15px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        button:hover {
            background: #4a00e0;
            transform: scale(1.05);
        }

        .employee-card, .no-results {
            opacity: 0;
            transform: translateY(20px);
            transition: all 0.5s ease;
        }

        .employee-card.show, .no-results.show {
            opacity: 1;
            transform: translateY(0);
        }

        .employee-card {
            background: #f7f7f7;
            padding: 25px;
            border-radius: 12px;
            margin-top: 30px;
            text-align: left;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .employee-card h3 {
            margin-top: 0;
            color: #333;
            border-bottom: 2px solid #007bff;
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

        .no-results {
            margin-top: 25px;
            color: #dc3545;
            font-weight: 600;
            font-size: 16px;
        }

        @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Search Employee</h2>

        <!-- Search Form -->
        <form action="searchEmployeeDo" method="post">
            <input type="number" name="empId" placeholder="Enter Employee ID" required>
            <button type="submit">Search</button>
        </form>

        <!-- Display Employee Details -->
        <c:if test="${not empty employee}">
            <div class="employee-card" id="employeeCard">
                <h3>Employee Details</h3>
                <p><span>ID:</span> ${employee.empId}</p>
                <p><span>Name:</span> ${employee.empName}</p>
                <p><span>Department:</span> ${employee.empDepartment}</p>
                <p><span>Salary:</span> ${employee.empSalary}</p>
            </div>
        </c:if>

        <!-- No Results Message -->
        <c:if test="${searchPerformed eq true and empty employee}">
            <div class="no-results" id="noResults">No employee found with this ID</div>
        </c:if>
    </div>

    <script>
        // Add fade-in animation when page loads
        window.onload = function() {
            const empCard = document.getElementById("employeeCard");
            const noResults = document.getElementById("noResults");

            if(empCard) {
                setTimeout(() => empCard.classList.add("show"), 100);
            }
            if(noResults) {
                setTimeout(() => noResults.classList.add("show"), 100);
            }
        };
    </script>
</body>
</html>
