<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Directory</title>

    <style>
        /* --- Basic Styling --- */
        body {
            font-family: "Poppins", sans-serif;
            background: linear-gradient(135deg, #dbeafe, #ede9fe);
            margin: 0;
            padding: 0px;
        }

        h1 {
            text-align: center;
            color: #1e3a8a;
            margin-bottom: 20px;
            letter-spacing: 1px;
        }

        .table-container {
            max-width: 1000px;
            margin: auto;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 25px;
            overflow-x: auto;
            animation: fadeIn 0.6s ease-in;
        }

        /* --- Search & Filter Controls --- */
        .controls {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 15px;
            justify-content: space-between;
        }

        input, select {
            flex: 1;
            min-width: 180px;
            padding: 10px 14px;
            border-radius: 8px;
            border: 1.5px solid #ccc;
            font-size: 15px;
            outline: none;
        }

        input:focus, select:focus {
            border-color: #2563eb;
            box-shadow: 0 0 5px #93c5fd;
        }

        /* --- Table Styling --- */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        thead th {
            position: sticky;
            top: 0;
            background: #2563eb;
            color: #fff;
            text-align: left;
            padding: 12px;
            cursor: pointer;
            transition: 0.2s;
        }

        th:hover {
            background: #1d4ed8;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #eee;
        }

        tr:nth-child(even) {
            background: #f9fafb;
        }

        tr:hover {
            background: #e0f2fe;
            transition: 0.3s;
        }

        .salary {
            font-weight: 600;
            color: #15803d;
        }

        /* --- Floating Button --- */
        #topBtn {
            position: fixed;
            bottom: 25px;
            right: 25px;
            background: #2563eb;
            color: #fff;
            border: none;
            border-radius: 50%;
            width: 45px;
            height: 45px;
            cursor: pointer;
            font-size: 20px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.3);
            display: none;
            transition: 0.3s;
        }

        #topBtn:hover {
            background: #1e40af;
            transform: scale(1.1);
        }

        /* --- Animations --- */
        @keyframes fadeIn {
            from {opacity: 0; transform: translateY(10px);}
            to {opacity: 1; transform: translateY(0);}
        }
    </style>

    <script>
        // 🔍 Search Filter
        function searchTable() {
            const filter = document.getElementById("searchInput").value.toLowerCase();
            document.querySelectorAll("#employeeTable tbody tr").forEach(row => {
                row.style.display = row.textContent.toLowerCase().includes(filter) ? "" : "none";
            });
        }

        // 🏢 Department Filter
        function filterDepartment() {
            const dept = document.getElementById("deptFilter").value.toLowerCase();
            document.querySelectorAll("#employeeTable tbody tr").forEach(row => {
                const cell = row.cells[2].textContent.toLowerCase();
                row.style.display = dept === "" || cell.includes(dept) ? "" : "none";
            });
        }

        // 🔄 Column Sorting
        function sortTable(n) {
            const table = document.getElementById("employeeTable");
            const rows = Array.from(table.rows).slice(1);
            const asc = table.dataset.sortOrder !== "asc";
            rows.sort((a, b) => {
                const x = a.cells[n].textContent.trim();
                const y = b.cells[n].textContent.trim();
                return isNaN(x - y) ? x.localeCompare(y) * (asc ? 1 : -1) : (x - y) * (asc ? 1 : -1);
            });
            rows.forEach(r => table.tBodies[0].appendChild(r));
            table.dataset.sortOrder = asc ? "asc" : "desc";
        }

        // ⬆️ Back to Top Button
        window.onscroll = function() {
            const btn = document.getElementById("topBtn");
            btn.style.display = document.documentElement.scrollTop > 150 ? "block" : "none";
        };
        function scrollToTop() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    </script>
</head>
<body>
    <h1>Employee Directory</h1>

    <div class="table-container">
        <div class="controls">
            <input id="searchInput" onkeyup="searchTable()" placeholder="🔍 Search employee...">
            <select id="deptFilter" onchange="filterDepartment()">
                <option value="">All Departments</option>
                <option value="hr">HR</option>
                <option value="it">IT</option>
                <option value="sales">Sales</option>
                <option value="finance">Finance</option>
                <option value="Marketing">Marketing</option>
                <option value="Devlopment">Devlopment</option>
            </select>
        </div>

        <table id="employeeTable" data-sort-order="asc">
            <thead>
                <tr>
                    <th onclick="sortTable(0)">ID ⬍</th>
                    <th onclick="sortTable(1)">Name ⬍</th>
                    <th onclick="sortTable(2)">Department ⬍</th>
                    <th onclick="sortTable(3)">Salary ⬍</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="employee" items="${employeeList}">
                    <tr title="Click to view ${employee.empName}'s details">
                        <td>${employee.empId}</td>
                        <td>${employee.empName}</td>
                        <td>${employee.empDepartment}</td>
                        <td class="salary">${employee.empSalary}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <button id="topBtn" onclick="scrollToTop()">⬆</button>
</body>
</html>
