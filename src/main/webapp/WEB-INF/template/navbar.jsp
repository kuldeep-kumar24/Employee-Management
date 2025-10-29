<!-- navbar.jsp -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- Font Awesome for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
    /* Navbar Container */
    nav {
        background: rgba(0, 0, 0, 0.75);
        backdrop-filter: blur(8px);
        padding: 15px 40px;
        color: white;
        display: flex;
        justify-content: space-between;
        align-items: center;
        font-family: 'Poppins', sans-serif;
        position: sticky;
        top: 0;
        z-index: 1000;
    }

    /* Left Logo */
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
        letter-spacing: 1px;
    }

    /* Navigation Links */
    nav ul {
        list-style: none;
        display: flex;
        gap: 25px;
        margin: 0;
        padding: 0;
    }

    nav ul li {
        position: relative;
    }

    nav ul li a {
        text-decoration: none;
        color: white;
        font-weight: 500;
        font-size: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
        transition: 0.3s;
        padding: 8px 10px;
        border-radius: 8px;
    }

    nav ul li a:hover,
    nav ul li a.active {
        background: linear-gradient(135deg, #007bff, #6610f2);
        color: #fff;
    }

    /* Icon Styling */
    nav ul li a i {
        color: #ffd700;
        font-size: 16px;
    }

    /* Responsive */
    @media (max-width: 768px) {
        nav {
            flex-direction: column;
            align-items: flex-start;
        }

        nav ul {
            flex-wrap: wrap;
            gap: 15px;
            margin-top: 10px;
        }
    }
</style>

<!-- Navbar HTML -->
<nav>
    <div class="logo">
        <i class="fa-solid fa-briefcase"></i>
        <h2>Employee Management</h2>
    </div>
    <ul>
        <li><a href="/Employee-Management" class="active"><i class="fa-solid fa-house"></i>Home</a></li>
        <li><a href="add"><i class="fa-solid fa-user-plus"></i>Add</a></li>
        <li><a href="editEmployee"><i class="fa-solid fa-user-pen"></i>Edit</a></li>
        <li><a href="list"><i class="fa-solid fa-users"></i>List</a></li>
        <li><a href="searchEmployee"><i class="fa-solid fa-magnifying-glass"></i>Search</a></li>
        <li><a href="delete"><i class="fa-solid fa-user-xmark"></i>Delete</a></li>
    </ul>
</nav>
