<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.wild_tour.dto.User" %>

<%
    User user = (User) session.getAttribute("user");
    boolean isLoggedIn = (user != null);
    boolean isAdmin = isLoggedIn && user.getUserId() == 1;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Wildlife Header</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,400;14..32,500;14..32,600;14..32,700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', 'Segoe UI', sans-serif;
            background: #f7faf7;
        }

        .navbar {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border-bottom: 1px solid rgba(46, 125, 50, 0.12);
            box-shadow: 0 4px 24px rgba(0, 20, 0, 0.06);
            padding: 12px 0;
            position: relative;
            z-index: 9999;
            min-height: 80px;
        }

        .navbar-brand {
            font-weight: 700;
            color: #1e4a22 !important;
            font-size: 1.6rem;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .navbar-brand img {
            border-radius: 50%;
            border: 2px solid rgba(46, 125, 50, 0.20);
            padding: 2px;
            box-shadow: 0 4px 12px rgba(0, 30, 0, 0.10);
        }

        .brand-accent {
            color: #2e7d32;
            font-weight: 300;
        }

        .navbar-nav .nav-link {
            font-weight: 500;
            color: #1e3a22;
            padding: 8px 16px;
            border-radius: 40px;
            transition: all 0.25s ease;
            font-size: 0.95rem;
        }

        .navbar-nav .nav-link:hover {
            color: #1e4a22;
            background: rgba(46, 125, 50, 0.08);
        }

        /* ============================================
           DROPDOWN MENU - ENHANCED
           ============================================ */
        .dropdown-menu {
            border: none;
            border-radius: 16px;
            background: #ffffff;
            box-shadow: 0 12px 48px rgba(0, 0, 0, 0.12);
            padding: 8px 4px;
            margin-top: 8px;
            border: 1px solid rgba(46, 125, 50, 0.08);
            min-width: 220px;
            z-index: 99999;
            display: none;
            opacity: 0;
            transform: translateY(-10px);
            transition: opacity 0.3s ease, transform 0.3s ease;
        }

        .dropdown-menu.show {
            display: block !important;
            opacity: 1 !important;
            transform: translateY(0) !important;
        }

        .dropdown-item {
            padding: 10px 20px;
            border-radius: 12px;
            font-weight: 500;
            color: #1e3a22;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 0.92rem;
        }

        .dropdown-item i {
            width: 20px;
            color: #2e7d32;
            opacity: 0.7;
            font-size: 0.95rem;
        }

        .dropdown-item:hover {
            background: rgba(46, 125, 50, 0.10);
            color: #1a4a1e;
            transform: translateX(4px);
        }

        .dropdown-divider {
            border-color: rgba(46, 125, 50, 0.10);
            margin: 4px 12px;
        }

        /* Dropdown toggle caret */
        .dropdown-toggle::after {
            display: inline-block;
            margin-left: 6px;
            vertical-align: middle;
            content: '';
            border-top: 4px solid;
            border-right: 4px solid transparent;
            border-left: 4px solid transparent;
            font-size: 0.7rem;
        }

        /* ============================================
           PROFILE DROPDOWN
           ============================================ */
        .profile-dropdown-container {
            position: relative;
            display: inline-block;
        }

        .profile-toggle {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 6px 16px 6px 12px;
            border-radius: 40px;
            background: rgba(46, 125, 50, 0.06);
            border: 1px solid rgba(46, 125, 50, 0.10);
            transition: all 0.25s ease;
            font-weight: 600;
            color: #1e3a22;
            cursor: pointer;
            text-decoration: none;
        }

        .profile-toggle:hover {
            background: rgba(46, 125, 50, 0.12);
            border-color: rgba(46, 125, 50, 0.25);
        }

        .profile-toggle i {
            font-size: 28px;
            color: #2e7d32;
        }

        .profile-toggle .user-name {
            max-width: 100px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .profile-dropdown-menu {
            position: absolute;
            top: calc(100% + 8px);
            right: 0;
            min-width: 200px;
            padding: 8px 4px;
            background: #ffffff;
            border: 1px solid rgba(46, 125, 50, 0.10);
            border-radius: 16px;
            box-shadow: 0 12px 48px rgba(0, 0, 0, 0.15);
            opacity: 0;
            visibility: hidden;
            transform: translateY(-10px);
            transition: opacity 0.3s ease, transform 0.3s ease, visibility 0.3s ease;
            z-index: 99999;
            pointer-events: none;
        }

        .profile-dropdown-container:hover .profile-dropdown-menu,
        .profile-dropdown-container:focus-within .profile-dropdown-menu {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
            pointer-events: auto;
        }

        .profile-dropdown-menu .dropdown-item {
            padding: 10px 20px;
            border-radius: 12px;
            font-weight: 500;
            color: #1e3a22;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 0.92rem;
            text-decoration: none;
            cursor: pointer;
        }

        .profile-dropdown-menu .dropdown-item i {
            width: 20px;
            color: #2e7d32;
            opacity: 0.7;
        }

        .profile-dropdown-menu .dropdown-item:hover {
            background: rgba(46, 125, 50, 0.10);
            color: #1a4a1e;
        }

        .profile-dropdown-menu .dropdown-divider {
            border-color: rgba(46, 125, 50, 0.10);
            margin: 4px 12px;
        }

        .profile-dropdown-menu .text-danger {
            color: #dc2626 !important;
        }

        .profile-dropdown-menu .text-danger:hover {
            background: #fde8e8 !important;
            color: #dc2626 !important;
        }

        /* ============================================
           RESPONSIVE FIXES
           ============================================ */
        @media (max-width: 992px) {
            .dropdown-menu {
                position: static !important;
                box-shadow: none !important;
                border: 1px solid #e8eee8 !important;
                margin-top: 4px;
                background: #ffffff !important;
                backdrop-filter: none !important;
                display: none !important;
                transform: none !important;
                opacity: 1 !important;
            }

            .dropdown-menu.show {
                display: block !important;
            }

            .profile-dropdown-menu {
                position: static !important;
                box-shadow: none !important;
                border: 1px solid #e8eee8 !important;
                margin-top: 4px;
                opacity: 1 !important;
                visibility: visible !important;
                transform: none !important;
                display: none !important;
                pointer-events: auto !important;
            }

            .profile-dropdown-menu.active {
                display: block !important;
            }

            .profile-toggle {
                justify-content: center;
            }

            .navbar-nav .nav-link {
                padding: 10px 16px;
            }

            .dropdown-toggle::after {
                float: right;
                margin-top: 8px;
            }
        }

        @media (max-width: 576px) {
            .navbar-brand {
                font-size: 1.2rem;
                gap: 8px;
            }
            .navbar-brand img {
                width: 40px;
            }
            .profile-toggle .user-name {
                max-width: 70px;
            }
        }

        .navbar-toggler {
            border: none;
            padding: 8px 10px;
            border-radius: 12px;
        }

        .navbar-toggler:focus {
            box-shadow: 0 0 0 3px rgba(46, 125, 50, 0.20);
        }

        .navbar-toggler-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='%232e7d32' viewBox='0 0 30 30'%3e%3cpath stroke='rgba%2846, 125, 50, 0.7%29' stroke-width='2' d='M4 7h22M4 15h22M4 23h22'/%3e%3c/svg%3e");
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand" href="<%= isLoggedIn ? "dashboard.jsp" : "Home.jsp" %>">
            <img src="https://tse4.mm.bing.net/th?id=OIP.vNrNrjSGanab468Bks6zNAAAAA&pid=Api&P=0&h=180" alt="Wildlife Logo" width="50" height="50">
            <span>Wildlife <span class="brand-accent">Tourism</span></span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-lg-center">

                <!-- Home -->
                <li class="nav-item">
                    <a class="nav-link" href="<%= isLoggedIn ? "dashboard.jsp" : "Home.jsp" %>">
                        <i class="fa-solid fa-house me-1"></i> Home
                    </a>
                </li>

                <% if (!isLoggedIn) { %>
                    <!-- Not logged in -->
                    <li class="nav-item">
                        <a class="nav-link" href="login.jsp">
                            <i class="fa-solid fa-right-to-bracket me-1"></i> Login
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="signup.jsp">
                            <i class="fa-solid fa-user-plus me-1"></i> Register
                        </a>
                    </li>
                <% } else if (isAdmin) { %>
                    <!-- Admin logged in -->
                    <li class="nav-item">
                        <a class="nav-link" href="adminDashboard.jsp">
                            <i class="fa-solid fa-gauge-high me-1"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="trip_management.jsp">
                            <i class="fa-solid fa-calendar-check me-1"></i> Booked Trips
                        </a>
                    </li>
                    <!-- Admin profile dropdown -->
                    <li class="nav-item profile-dropdown-container">
                        <a class="nav-link profile-toggle" href="#">
                            <i class="fa-solid fa-user-circle"></i>
                            <span class="user-name"><%= user.getUser_name() %></span>
                            <i class="fa-solid fa-chevron-down ms-1" style="font-size: 12px; opacity: 0.6;"></i>
                        </a>
                        <div class="profile-dropdown-menu">
                            <a class="dropdown-item" href="profile.jsp">
                                <i class="fa-regular fa-user"></i> My Profile
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="logout.jsp">
                                <i class="fa-solid fa-right-from-bracket"></i> Logout
                            </a>
                        </div>
                    </li>
                <% } else { %>
                    <!-- Regular logged in user -->
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">
                            <i class="fa-solid fa-leaf me-1"></i> About
                        </a>
                    </li>

                    <!-- ============================================
                         ACTIVITIES DROPDOWN
                         ============================================ -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-binoculars me-1"></i> Activities
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="photography.jsp"><i class="fa-solid fa-image"></i> Gallery</a></li>
                            <li><a class="dropdown-item" href="wildlifeSighting.jsp"><i class="fa-solid fa-eye"></i> Wildlife Sighting</a></li>
                        </ul>
                    </li>

                    <!-- ============================================
                         TOURISM DROPDOWN
                         ============================================ -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-solid fa-umbrella-beach me-1"></i> Tourism
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="safari.jsp"><i class="fa-solid fa-tree"></i> Safari</a></li>
                            <li><a class="dropdown-item" href="stay.jsp"><i class="fa-solid fa-hotel"></i> Accommodation</a></li>
                            <li><a class="dropdown-item" href="package.jsp"><i class="fa-solid fa-suitcase"></i> Wildlife Packages</a></li>
                            <li><a class="dropdown-item" href="guide.jsp"><i class="fa-solid fa-compass"></i> Guide Services</a></li>
                        </ul>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="myTrip.jsp">
                            <i class="fa-solid fa-route me-1"></i> MyTrips
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">
                            <i class="fa-regular fa-message me-1"></i> Contact
                        </a>
                    </li>

                    <!-- Profile Dropdown -->
                    <li class="nav-item profile-dropdown-container">
                        <a class="nav-link profile-toggle" href="#">
                            <i class="fa-solid fa-user-circle"></i>
                            <span class="user-name"><%= user.getUser_name() %></span>
                            <i class="fa-solid fa-chevron-down ms-1" style="font-size: 12px; opacity: 0.6;"></i>
                        </a>
                        <div class="profile-dropdown-menu">
                            <a class="dropdown-item" href="profile.jsp">
                                <i class="fa-regular fa-user"></i> My Profile
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-danger" href="logout.jsp">
                                <i class="fa-solid fa-right-from-bracket"></i> Logout
                            </a>
                        </div>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Fix dropdown toggle for Bootstrap 5
        const dropdownToggles = document.querySelectorAll('[data-bs-toggle="dropdown"]');
        dropdownToggles.forEach(toggle => {
            toggle.addEventListener('click', function(e) {
                e.preventDefault();
                const menu = this.nextElementSibling;
                if (menu && menu.classList.contains('dropdown-menu')) {
                    // Close all other dropdowns
                    document.querySelectorAll('.dropdown-menu.show').forEach(m => {
                        if (m !== menu) {
                            m.classList.remove('show');
                        }
                    });
                    // Toggle this dropdown
                    menu.classList.toggle('show');
                }
            });
        });

        // Close dropdowns when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.dropdown')) {
                document.querySelectorAll('.dropdown-menu.show').forEach(menu => {
                    menu.classList.remove('show');
                });
            }
        });

        // Mobile profile dropdown toggle
        const profileContainers = document.querySelectorAll('.profile-dropdown-container');
        profileContainers.forEach(container => {
            const toggle = container.querySelector('.profile-toggle');
            const menu = container.querySelector('.profile-dropdown-menu');
            
            if (toggle && menu) {
                toggle.addEventListener('click', function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    
                    if (window.innerWidth <= 992) {
                        // Close other profile dropdowns
                        document.querySelectorAll('.profile-dropdown-menu.active').forEach(m => {
                            if (m !== menu) {
                                m.classList.remove('active');
                            }
                        });
                        menu.classList.toggle('active');
                    }
                });
            }
        });

        // Close mobile dropdowns when clicking outside
        document.addEventListener('click', function(e) {
            if (window.innerWidth <= 992) {
                document.querySelectorAll('.profile-dropdown-menu.active').forEach(menu => {
                    if (!menu.closest('.profile-dropdown-container').contains(e.target)) {
                        menu.classList.remove('active');
                    }
                });
            }
        });

        // Handle window resize
        window.addEventListener('resize', function() {
            if (window.innerWidth > 992) {
                document.querySelectorAll('.profile-dropdown-menu.active').forEach(menu => {
                    menu.classList.remove('active');
                });
            }
        });
    });
</script>

</body>
</html>