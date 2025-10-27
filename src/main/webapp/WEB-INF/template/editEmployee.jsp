<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <style>
        body { font-family: 'Poppins', sans-serif; background: url('https://images.unsplash.com/photo-1521737604893-d14cc237f11d') no-repeat center center/cover; background-size: cover; margin: 0; }
        .container { width: 600px; margin: 70px auto; background: rgba(255,255,255,0.95); border-radius: 15px; padding: 40px 30px; box-shadow: 0 6px 25px rgba(0,0,0,0.3); text-align: center; }
        h2 { color: #007bff; margin-bottom: 25px; }
        input { width: 90%; padding: 12px; border-radius: 8px; border: 1px solid #ccc; margin-top: 10px; font-size: 16px; }
        label { display: block; margin-top: 15px; text-align: left; font-weight: 600; }
        button { margin-top: 20px; width: 50%; background: linear-gradient(135deg, #28a745, #218838); color: white; padding: 12px; border: none; border-radius: 8px; font-size: 16px; cursor: pointer; transition: 0.3s; }
        button:hover { background: linear-gradient(135deg, #1e7e34, #155d27); }
        .employee-card { background: #f7f7f7; padding: 25px; border-radius: 12px; margin-top: 25px; text-align: left; box-shadow: 0 4px 15px rgba(0,0,0,0.2); }
        .employee-card p { margin: 8px 0; font-size: 16px; }
        .employee-card span { font-weight: 600; }
        .message { margin-top: 20px; font-size: 15px; color: #dc3545; font-weight: 600; }
        .success-message { color: #28a745; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Edit Employee</h2>

        <!-- Step 1: Fetch Employee -->
        <form id="fetchForm" action="updateEmployee" method="post">
            <input type="number" name="empId" placeholder="Enter Employee ID" required>
            <button type="submit">Fetch Employee</button>
        </form>

        <!-- Step 2: Show employee form if found -->
        <c:if test="${not empty employee}">
            <div class="employee-card" id="employeeCard">
                <form id="editForm" action="updateEmployeeDo" method="post">
                    <input type="hidden" name="empId" value="${employee.empId}">
                    <p><span>ID:</span> ${employee.empId}</p>

                    <label>Name:</label>
                    <input type="text" name="empName" value="${employee.empName}" required>

                    <label>Department:</label>
                    <input type="text" name="empDepartment" value="${employee.empDepartment}" required>

                    <label>Salary:</label>
                    <input type="number" name="empSalary" value="${employee.empSalary}" required>

                    <button type="submit">Update Employee</button>
                </form>
            </div>
        </c:if>

        <!-- Step 3: Show messages -->
        <c:if test="${not empty errorMessage}">
            <div class="message" id="errorMessage">${errorMessage}</div>
        </c:if>
        <c:if test="${not empty successMessage}">
            <div class="message success-message" id="successMessage">${successMessage}</div>
        </c:if>
    </div>

    <script>
        // Remove employee card after successful update
        window.onload = function() {
            const successMsg = document.getElementById("successMessage");
            const empCard = document.getElementById("employeeCard");

            if(successMsg && successMsg.textContent.trim() !== "" && empCard) {
                // Hide employee card after showing success
                setTimeout(() => {
                    empCard.style.display = "none";
                }, 500); // 0.5s delay for smooth effect
            }
        };
    </script>
</body>
</html>
