<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.wild_tour.dto.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile | Wildlife Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        /* ----- Reset & Base ----- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: #f7faf7;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            position: relative;
        }

        /* Background with gradient and pattern */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background: 
                radial-gradient(circle at 20% 50%, rgba(46, 125, 50, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 80% 50%, rgba(165, 214, 167, 0.05) 0%, transparent 50%),
                linear-gradient(135deg, #f0f5f0 0%, #e8f0e8 100%);
            z-index: -1;
        }

        /* ----- Profile Card ----- */
        .profile-wrapper {
            width: 100%;
            max-width: 560px;
            animation: fadeInUp 0.8s cubic-bezier(0.23, 1, 0.32, 1) forwards;
            opacity: 0;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px) scale(0.96); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        .profile-card {
            background: #ffffff;
            border-radius: 28px;
            padding: 40px 36px 36px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.06);
            border: 1px solid #e8eee8;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .profile-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #2e7d32, #66bb6a, #a5d6a7, #66bb6a, #2e7d32);
            background-size: 200% 100%;
            animation: gradientMove 4s ease-in-out infinite;
        }

        @keyframes gradientMove {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        /* ----- Profile Header ----- */
        .profile-header {
            text-align: center;
            margin-bottom: 28px;
        }

        .profile-avatar {
            position: relative;
            display: inline-block;
        }

        .profile-avatar .avatar-icon {
            width: 100px;
            height: 100px;
            background: linear-gradient(145deg, #e8f5e9, #c8e6c9);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 50px;
            color: #2e7d32;
            margin: 0 auto 16px;
            border: 4px solid #ffffff;
            box-shadow: 0 8px 30px rgba(46, 125, 50, 0.15);
            transition: all 0.4s ease;
        }

        .profile-avatar .avatar-icon:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 40px rgba(46, 125, 50, 0.25);
        }

        .profile-avatar .status-dot {
            position: absolute;
            bottom: 20px;
            right: 4px;
            width: 16px;
            height: 16px;
            background: #2e7d32;
            border-radius: 50%;
            border: 3px solid #ffffff;
            animation: pulseDot 2s infinite;
        }

        @keyframes pulseDot {
            0%, 100% { transform: scale(1); opacity: 1; }
            50% { transform: scale(1.2); opacity: 0.7; }
        }

        .profile-header h2 {
            font-weight: 800;
            font-size: 1.8rem;
            color: #1a2e1a;
            letter-spacing: -0.5px;
            margin: 0;
        }

        .profile-header h2 span {
            background: linear-gradient(135deg, #2e7d32, #66bb6a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .profile-header .user-role {
            display: inline-block;
            background: #e8f5e9;
            color: #2e7d32;
            padding: 4px 16px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            margin-top: 4px;
        }

        /* ----- Messages ----- */
        .message-container {
            margin-bottom: 20px;
        }

        .message {
            padding: 12px 16px;
            border-radius: 14px;
            font-size: 0.88rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 12px;
            animation: slideMessage 0.4s ease forwards;
        }

        @keyframes slideMessage {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .message.success {
            background: #e8f5e9;
            border-left: 4px solid #2e7d32;
            color: #1e4a22;
        }

        .message.success i {
            color: #2e7d32;
        }

        .message.error {
            background: #ffebee;
            border-left: 4px solid #c62828;
            color: #8e1a1a;
        }

        .message.error i {
            color: #c62828;
        }

        /* ----- Profile Details ----- */
        .profile-details {
            margin-bottom: 28px;
        }

        .profile-detail {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 14px 0;
            border-bottom: 1px solid #f0f5f0;
            transition: all 0.3s ease;
        }

        .profile-detail:hover {
            background: #f7faf7;
            padding-left: 12px;
            padding-right: 12px;
            border-radius: 10px;
        }

        .profile-detail:last-child {
            border-bottom: none;
        }

        .profile-detail .detail-label {
            display: flex;
            align-items: center;
            gap: 10px;
            font-weight: 600;
            font-size: 0.9rem;
            color: #1a2e1a;
        }

        .profile-detail .detail-label i {
            color: #2e7d32;
            font-size: 1.05rem;
            width: 20px;
        }

        .profile-detail .detail-value {
            font-weight: 500;
            color: #4a5a4a;
            font-size: 0.95rem;
            word-break: break-word;
            text-align: right;
            max-width: 60%;
        }

        .profile-detail .detail-value .password-field {
            border: none;
            background: transparent;
            font-weight: 500;
            color: #4a5a4a;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            outline: none;
            width: auto;
            display: inline-block;
        }

        .profile-detail .detail-value .toggle-password {
            cursor: pointer;
            color: #a0b0a0;
            transition: color 0.3s ease;
            margin-left: 6px;
        }

        .profile-detail .detail-value .toggle-password:hover {
            color: #2e7d32;
        }

        /* ----- Button Group ----- */
        .btn-group-wrapper {
            display: flex;
            gap: 12px;
            margin-top: 8px;
        }

        .btn-group-wrapper .btn {
            flex: 1;
            padding: 14px 20px;
            border-radius: 14px;
            font-weight: 700;
            font-size: 0.92rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            border: none;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-edit {
            background: linear-gradient(145deg, #2e7d32, #1b5e20);
            color: #ffffff;
            box-shadow: 0 8px 30px rgba(46, 125, 50, 0.25);
        }

        .btn-edit:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(46, 125, 50, 0.35);
            background: linear-gradient(145deg, #388e3c, #2e7d32);
            color: #ffffff;
        }

        .btn-edit i {
            transition: transform 0.3s ease;
        }

        .btn-edit:hover i {
            transform: translateX(4px);
        }

        .btn-back {
            background: #f7faf7;
            color: #1a2e1a;
            border: 1px solid #dce4dc;
        }

        .btn-back:hover {
            background: #e8eee8;
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.04);
            color: #1a2e1a;
        }

        .btn-back i {
            transition: transform 0.3s ease;
        }

        .btn-back:hover i {
            transform: translateX(-4px);
        }

        /* ----- Decorative Elements ----- */
        .profile-card .deco-circle {
            position: absolute;
            border-radius: 50%;
            pointer-events: none;
            opacity: 0.03;
        }

        .profile-card .deco-circle.d1 {
            width: 200px;
            height: 200px;
            top: -60px;
            right: -60px;
            background: #2e7d32;
        }

        .profile-card .deco-circle.d2 {
            width: 150px;
            height: 150px;
            bottom: -40px;
            left: -40px;
            background: #66bb6a;
        }

        /* ----- Responsive ----- */
        @media (max-width: 576px) {
            body {
                padding: 20px 12px;
            }

            .profile-card {
                padding: 28px 20px 24px;
                border-radius: 20px;
            }

            .profile-header h2 {
                font-size: 1.5rem;
            }

            .profile-avatar .avatar-icon {
                width: 80px;
                height: 80px;
                font-size: 40px;
            }

            .profile-detail {
                flex-direction: column;
                align-items: flex-start;
                gap: 4px;
                padding: 12px 0;
            }

            .profile-detail .detail-value {
                text-align: left;
                max-width: 100%;
                width: 100%;
            }

            .btn-group-wrapper {
                flex-direction: column;
            }

            .btn-group-wrapper .btn {
                padding: 12px 16px;
                font-size: 0.9rem;
            }
        }

        @media (max-width: 380px) {
            .profile-card {
                padding: 20px 14px 20px;
                border-radius: 16px;
            }

            .profile-header h2 {
                font-size: 1.3rem;
            }

            .profile-avatar .avatar-icon {
                width: 64px;
                height: 64px;
                font-size: 32px;
            }
        }
    </style>
</head>
<body>

<div class="profile-wrapper" data-aos="fade-up">
    <div class="profile-card">
        
        <!-- Decorative Circles -->
        <div class="deco-circle d1"></div>
        <div class="deco-circle d2"></div>

        <!-- Profile Header -->
        <div class="profile-header">
            <div class="profile-avatar">
                <div class="avatar-icon">
                    <i class="fa-solid fa-user"></i>
                </div>
                <span class="status-dot"></span>
            </div>
            <h2>My <span>Profile</span></h2>
            <span class="user-role"><i class="fa-regular fa-circle-check"></i> Active Member</span>
        </div>

        <!-- Messages -->
        <div class="message-container">
            <%
                String emsg = (String) request.getAttribute("fail");
                if (emsg != null) {
            %>
                <div class="message error">
                    <i class="fa-solid fa-circle-exclamation"></i>
                    <%= emsg %>
                </div>
            <%
                }
            %>
            <%
                String smsg = (String) request.getAttribute("success");
                if (smsg != null) {
            %>
                <div class="message success">
                    <i class="fa-solid fa-circle-check"></i>
                    <%= smsg %>
                </div>
            <%
                }
            %>
        </div>

        <!-- Profile Details -->
        <div class="profile-details">
            <div class="profile-detail">
                <span class="detail-label">
                    <i class="fa-regular fa-id-card"></i> User ID
                </span>
                <span class="detail-value">#<%= user.getUserId() %></span>
            </div>

            <div class="profile-detail">
                <span class="detail-label">
                    <i class="fa-regular fa-user"></i> Full Name
                </span>
                <span class="detail-value"><%= user.getUser_name() %></span>
            </div>

            <div class="profile-detail">
                <span class="detail-label">
                    <i class="fa-regular fa-envelope"></i> Email Address
                </span>
                <span class="detail-value"><%= user.getEmail() %></span>
            </div>

            <div class="profile-detail">
                <span class="detail-label">
                    <i class="fa-solid fa-phone"></i> Phone Number
                </span>
                <span class="detail-value"><%= user.getPhone() %></span>
            </div>

            <div class="profile-detail">
                <span class="detail-label">
                    <i class="fa-solid fa-lock"></i> Password
                </span>
                <span class="detail-value">
                    <input type="password" id="passwordField" class="password-field" 
                           value="<%= user.getPassword() %>" readonly>
                    <i class="fa-regular fa-eye toggle-password" id="togglePassword"></i>
                </span>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="btn-group-wrapper">
            <a href="update.jsp" class="btn btn-edit">
                <i class="fa-regular fa-pen-to-square"></i> Edit Profile
            </a>
            <a href="dashboard.jsp" class="btn btn-back">
                <i class="fa-solid fa-arrow-left"></i> Back
            </a>
        </div>

    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
    // Initialize AOS animations
    AOS.init({
        duration: 800,
        easing: 'ease-out',
        once: true,
        offset: 50
    });

    // Toggle password visibility
    const toggle = document.getElementById('togglePassword');
    const pwdField = document.getElementById('passwordField');

    toggle.addEventListener('click', function() {
        const type = pwdField.getAttribute('type') === 'password' ? 'text' : 'password';
        pwdField.setAttribute('type', type);
        this.classList.toggle('fa-eye');
        this.classList.toggle('fa-eye-slash');
    });
</script>

</body>
</html>