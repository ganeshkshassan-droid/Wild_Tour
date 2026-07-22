<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.wild_tour.dto.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Account | Wildlife Tourism</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
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
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: url('https://karnatakatourism.org/wp-content/uploads/2020/05/Kabini-Spotted-Deer.jpg') no-repeat center center/cover;
            padding: 20px;
            position: relative;
        }

        /* Dark overlay with gradient */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background: linear-gradient(135deg, rgba(6, 18, 8, 0.82) 0%, rgba(10, 30, 14, 0.55) 50%, rgba(3, 10, 5, 0.88) 100%);
            z-index: 0;
        }

        /* ----- Floating particles (decorative) ----- */
        .particles {
            position: fixed;
            inset: 0;
            z-index: 0;
            pointer-events: none;
            overflow: hidden;
        }

        .particle {
            position: absolute;
            width: 6px;
            height: 6px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
            animation: floatParticle linear infinite;
        }

        .particle:nth-child(1) { left: 8%; animation-duration: 20s; animation-delay: 0s; width: 8px; height: 8px; }
        .particle:nth-child(2) { left: 20%; animation-duration: 24s; animation-delay: 2s; width: 5px; height: 5px; }
        .particle:nth-child(3) { left: 40%; animation-duration: 18s; animation-delay: 4s; width: 10px; height: 10px; }
        .particle:nth-child(4) { left: 60%; animation-duration: 22s; animation-delay: 1s; width: 6px; height: 6px; }
        .particle:nth-child(5) { left: 75%; animation-duration: 26s; animation-delay: 3s; width: 7px; height: 7px; }
        .particle:nth-child(6) { left: 88%; animation-duration: 19s; animation-delay: 5s; width: 4px; height: 4px; }
        .particle:nth-child(7) { left: 50%; animation-duration: 21s; animation-delay: 6s; width: 9px; height: 9px; }
        .particle:nth-child(8) { left: 12%; animation-duration: 17s; animation-delay: 7s; width: 5px; height: 5px; }
        .particle:nth-child(9) { left: 68%; animation-duration: 23s; animation-delay: 2.5s; width: 7px; height: 7px; }
        .particle:nth-child(10) { left: 32%; animation-duration: 20s; animation-delay: 4.5s; width: 6px; height: 6px; }

        @keyframes floatParticle {
            0% { transform: translateY(100vh) scale(0); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(-10vh) scale(1); opacity: 0; }
        }

        /* ----- Update Card - Clean & Professional ----- */
        .update-wrapper {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 480px;
            animation: fadeInUp 0.6s ease forwards;
            opacity: 0;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .update-card {
            background: #ffffff;
            border-radius: 24px;
            padding: 40px 36px 32px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.30);
            max-height: 92vh;
            overflow-y: auto;
            transition: transform 0.2s ease;
            position: relative;
        }

        .update-card::-webkit-scrollbar {
            width: 4px;
        }
        .update-card::-webkit-scrollbar-track {
            background: #f0f4f0;
            border-radius: 10px;
        }
        .update-card::-webkit-scrollbar-thumb {
            background: #2e7d32;
            border-radius: 10px;
        }

        .update-card::before {
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

        /* ----- Header ----- */
        .update-header {
            text-align: center;
            margin-bottom: 28px;
        }

        .update-header .icon-wrapper {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 72px;
            height: 72px;
            background: linear-gradient(145deg, #e8f5e9, #c8e6c9);
            border-radius: 50%;
            margin-bottom: 14px;
            transition: transform 0.3s ease;
        }

        .update-header .icon-wrapper i {
            font-size: 32px;
            color: #2e7d32;
        }

        .update-header .icon-wrapper:hover {
            transform: scale(1.05);
        }

        .update-header h1 {
            font-weight: 800;
            font-size: 1.75rem;
            color: #1a2e1a;
            letter-spacing: -0.5px;
            margin: 0;
        }

        .update-header h1 span {
            background: linear-gradient(135deg, #2e7d32, #66bb6a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .update-header p {
            color: #6b7a6b;
            font-size: 0.95rem;
            font-weight: 400;
            margin: 4px 0 0;
        }

        /* ----- Messages ----- */
        .message-container {
            margin-bottom: 20px;
        }

        .message {
            padding: 12px 16px;
            border-radius: 12px;
            font-size: 0.88rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 12px;
            animation: slideMessage 0.4s ease forwards;
        }

        @keyframes slideMessage {
            from { opacity: 0; transform: translateY(-8px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .message.success {
            background: #e8f5e9;
            border-left: 4px solid #2e7d32;
            color: #1e4a22;
        }

        .message.error {
            background: #ffebee;
            border-left: 4px solid #c62828;
            color: #8e1a1a;
        }

        .message i {
            font-size: 1.1rem;
            flex-shrink: 0;
        }

        .message.success i {
            color: #2e7d32;
        }

        .message.error i {
            color: #c62828;
        }

        /* ----- Form ----- */
        .update-form {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .form-group label {
            font-size: 0.82rem;
            font-weight: 600;
            color: #2a3a2a;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .form-group label i {
            color: #2e7d32;
            font-size: 0.85rem;
            width: 16px;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #8a9a8a;
            font-size: 0.95rem;
            transition: color 0.3s ease;
            pointer-events: none;
        }

        .input-wrapper input {
            width: 100%;
            padding: 13px 16px 13px 44px;
            border: 1.5px solid #dce4dc;
            border-radius: 12px;
            background: #fafcfa;
            color: #1a2e1a;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            font-weight: 400;
            transition: all 0.3s ease;
            outline: none;
        }

        .input-wrapper input::placeholder {
            color: #a0b0a0;
            font-weight: 400;
            font-size: 0.92rem;
        }

        .input-wrapper input:hover {
            border-color: #b0c8b0;
            background: #ffffff;
        }

        .input-wrapper input:focus {
            border-color: #2e7d32;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(46, 125, 50, 0.10);
        }

        .input-wrapper input:focus + .input-icon,
        .input-wrapper input:focus ~ .input-icon {
            color: #2e7d32;
        }

        .input-wrapper input:disabled {
            background: #f0f5f0;
            cursor: not-allowed;
        }

        .input-wrapper .input-hint {
            font-size: 0.7rem;
            color: #8a9a8a;
            margin-top: 4px;
            padding-left: 4px;
        }

        .input-wrapper .input-hint i {
            color: #2e7d32;
            margin-right: 4px;
        }

        /* Password group with current value indicator */
        .password-hint {
            font-size: 0.7rem;
            color: #8a9a8a;
            margin-top: 4px;
            padding-left: 4px;
        }

        .password-hint i {
            color: #f59e0b;
            margin-right: 4px;
        }

        /* ----- Button ----- */
        .btn-update {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 12px;
            background: #2e7d32;
            color: white;
            font-size: 1rem;
            font-weight: 700;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
            transition: all 0.3s ease;
            letter-spacing: 0.3px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 4px;
        }

        .btn-update:hover {
            background: #1b5e20;
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(46, 125, 50, 0.30);
        }

        .btn-update:active {
            transform: scale(0.97);
            box-shadow: none;
        }

        .btn-update i {
            transition: transform 0.3s ease;
        }

        .btn-update:hover i {
            transform: translateX(4px);
        }

        /* ----- Footer ----- */
        .update-footer {
            margin-top: 24px;
            padding-top: 20px;
            border-top: 1px solid #e8eee8;
            text-align: center;
            color: #6b7a6b;
            font-size: 0.92rem;
        }

        .update-footer a {
            color: #2e7d32;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .update-footer a:hover {
            color: #1b5e20;
            text-decoration: underline;
        }

        /* ----- Responsive ----- */
        @media (max-width: 520px) {
            .update-card {
                padding: 28px 20px 24px;
                border-radius: 20px;
                max-height: 95vh;
            }

            .update-header h1 {
                font-size: 1.4rem;
            }

            .update-header .icon-wrapper {
                width: 60px;
                height: 60px;
            }

            .update-header .icon-wrapper i {
                font-size: 26px;
            }

            .input-wrapper input {
                padding: 12px 14px 12px 40px;
                font-size: 0.9rem;
            }

            .btn-update {
                padding: 13px;
                font-size: 0.92rem;
            }
        }

        @media (max-width: 380px) {
            .update-card {
                padding: 20px 14px 20px;
                border-radius: 16px;
            }

            .input-wrapper input {
                padding: 11px 12px 11px 36px;
                font-size: 0.85rem;
            }

            .update-header h1 {
                font-size: 1.2rem;
            }

            .form-group label {
                font-size: 0.75rem;
            }
        }
    </style>
</head>
<body>

    <!-- Decorative Particles -->
    <div class="particles">
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
        <div class="particle"></div>
    </div>

    <div class="update-wrapper" data-aos="fade-up">
        <div class="update-card">
            
            <!-- Header -->
            <div class="update-header">
                <div class="icon-wrapper">
                    <i class="fa-solid fa-pen-to-square"></i>
                </div>
                <h1>Update <span>Account</span></h1>
                <p>Update your personal information</p>
            </div>

            <!-- Messages -->
            <div class="message-container">
                <%
                    String errorMsg = (String) request.getAttribute("error");
                    if (errorMsg != null) {
                %>
                    <div class="message error">
                        <i class="fa-solid fa-circle-exclamation"></i>
                        <%= errorMsg %>
                    </div>
                <%
                    }
                %>
                <%
                    String successMsg = (String) request.getAttribute("success");
                    if (successMsg != null) {
                %>
                    <div class="message success">
                        <i class="fa-solid fa-circle-check"></i>
                        <%= successMsg %>
                    </div>
                <%
                    }
                %>
            </div>

            <!-- Form -->
            <%
                User u = (User) session.getAttribute("user");
                if (u != null) {
            %>
                <form class="update-form" action="update" method="post">
                    
                    <!-- Full Name -->
                    <div class="form-group">
                        <label for="name"><i class="fa-regular fa-user"></i> Full Name</label>
                        <div class="input-wrapper">
                            <input type="text" id="name" name="name" placeholder="Enter your full name" value="<%= u.getUser_name() %>" required>
                            <span class="input-icon"><i class="fa-regular fa-user"></i></span>
                        </div>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <label for="email"><i class="fa-regular fa-envelope"></i> Email Address</label>
                        <div class="input-wrapper">
                            <input type="email" id="email" name="email" placeholder="Enter your email" value="<%= u.getEmail() %>" required>
                            <span class="input-icon"><i class="fa-regular fa-envelope"></i></span>
                        </div>
                    </div>

                    <!-- Phone -->
                    <div class="form-group">
                        <label for="phone"><i class="fa-solid fa-phone"></i> Phone Number</label>
                        <div class="input-wrapper">
                            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" value="<%= u.getPhone() %>" required>
                            <span class="input-icon"><i class="fa-solid fa-phone"></i></span>
                        </div>
                    </div>

                    <!-- Address -->
                    <div class="form-group">
                        <label for="address"><i class="fa-solid fa-location-dot"></i> Address</label>
                        <div class="input-wrapper">
                            <input type="text" id="address" name="address" placeholder="Enter your address" value="<%= u.getAddress() %>">
                            <span class="input-icon"><i class="fa-solid fa-location-dot"></i></span>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="form-group">
                        <label for="password"><i class="fa-solid fa-lock"></i> New Password</label>
                        <div class="input-wrapper">
                            <input type="password" id="password" name="password" placeholder="Enter new password (leave blank to keep current)">
                            <span class="input-icon"><i class="fa-solid fa-lock"></i></span>
                        </div>
                        <div class="password-hint">
                            <i class="fa-regular fa-lightbulb"></i> Leave blank to keep current password
                        </div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="form-group">
                        <label for="cpassword"><i class="fa-solid fa-check-double"></i> Confirm Password</label>
                        <div class="input-wrapper">
                            <input type="password" id="cpassword" name="cpassword" placeholder="Re-enter new password">
                            <span class="input-icon"><i class="fa-solid fa-check-double"></i></span>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn-update">
                        <i class="fa-solid fa-floppy-disk"></i> Update Account
                    </button>

                </form>

                <!-- Footer -->
                <div class="update-footer">
                    Want to go back? <a href="dashboard.jsp">Dashboard</a>
                </div>

            <%
                } else {
                    request.setAttribute("error", "Session expired. Please login again.");
                    RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
                    rd.forward(request, response);
                }
            %>

        </div>
    </div>

    <!-- Scripts -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        // Initialize AOS animations
        AOS.init({
            duration: 800,
            easing: 'ease-out',
            once: true,
            offset: 50
        });

        // Auto-focus on first input
        document.addEventListener('DOMContentLoaded', function() {
            const firstInput = document.querySelector('.input-wrapper input');
            if (firstInput) {
                firstInput.focus();
            }
        });
    </script>

</body>
</html>