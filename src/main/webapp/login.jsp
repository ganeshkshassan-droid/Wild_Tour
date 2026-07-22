<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Wildlife Tourism</title>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <style>
        /* ----- Reset & Base ----- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: url('https://images.unsplash.com/photo-1575550959106-5a7defe28b56?fm=jpg&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center/cover;
            padding: 20px;
            position: relative;
        }

        /* Dark overlay with gradient */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background: linear-gradient(135deg, rgba(8, 20, 10, 0.75) 0%, rgba(10, 30, 14, 0.55) 50%, rgba(4, 12, 6, 0.85) 100%);
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
            background: rgba(255, 255, 255, 0.15);
            border-radius: 50%;
            animation: floatParticle linear infinite;
        }

        .particle:nth-child(1) { left: 10%; animation-duration: 18s; animation-delay: 0s; width: 8px; height: 8px; }
        .particle:nth-child(2) { left: 25%; animation-duration: 22s; animation-delay: 2s; width: 5px; height: 5px; }
        .particle:nth-child(3) { left: 45%; animation-duration: 16s; animation-delay: 4s; width: 10px; height: 10px; }
        .particle:nth-child(4) { left: 65%; animation-duration: 20s; animation-delay: 1s; width: 6px; height: 6px; }
        .particle:nth-child(5) { left: 80%; animation-duration: 24s; animation-delay: 3s; width: 7px; height: 7px; }
        .particle:nth-child(6) { left: 90%; animation-duration: 19s; animation-delay: 5s; width: 4px; height: 4px; }
        .particle:nth-child(7) { left: 50%; animation-duration: 21s; animation-delay: 6s; width: 9px; height: 9px; }
        .particle:nth-child(8) { left: 15%; animation-duration: 17s; animation-delay: 7s; width: 5px; height: 5px; }
        .particle:nth-child(9) { left: 70%; animation-duration: 23s; animation-delay: 2.5s; width: 7px; height: 7px; }
        .particle:nth-child(10) { left: 35%; animation-duration: 20s; animation-delay: 4.5s; width: 6px; height: 6px; }

        @keyframes floatParticle {
            0% { transform: translateY(100vh) scale(0); opacity: 0; }
            10% { opacity: 1; }
            90% { opacity: 1; }
            100% { transform: translateY(-10vh) scale(1); opacity: 0; }
        }

        /* ----- Login Card - Glassmorphism ----- */
        .login-wrapper {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 420px;
            animation: fadeInUp 0.8s cubic-bezier(0.23, 1, 0.32, 1) forwards;
            opacity: 0;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px) scale(0.96); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        .login-card {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(20px) saturate(1.6);
            -webkit-backdrop-filter: blur(20px) saturate(1.6);
            border-radius: 28px;
            padding: 40px 36px 36px;
            border: 1px solid rgba(255, 255, 255, 0.12);
            box-shadow: 0 32px 80px rgba(0, 0, 0, 0.5), 0 0 0 1px rgba(255, 255, 255, 0.05) inset;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 40px 100px rgba(0, 0, 0, 0.6), 0 0 0 1px rgba(255, 255, 255, 0.08) inset;
        }

        /* ----- Logo / Brand ----- */
        .login-brand {
            text-align: center;
            margin-bottom: 28px;
        }

        .login-brand .icon-wrapper {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 72px;
            height: 72px;
            background: linear-gradient(145deg, rgba(46, 125, 50, 0.25), rgba(27, 94, 32, 0.15));
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.15);
            margin-bottom: 12px;
            transition: all 0.3s ease;
        }

        .login-brand .icon-wrapper i {
            font-size: 32px;
            color: #a5d6a7;
        }

        .login-brand .icon-wrapper:hover {
            transform: scale(1.05) rotate(-4deg);
            border-color: rgba(165, 214, 167, 0.4);
        }

        .login-brand h2 {
            font-weight: 700;
            font-size: 1.8rem;
            color: #f5faf5;
            letter-spacing: -0.5px;
            margin: 0;
        }

        .login-brand p {
            color: rgba(255, 255, 255, 0.6);
            font-size: 0.9rem;
            font-weight: 400;
            margin-top: 4px;
        }

        /* ----- Messages (success/error) ----- */
        .message-container {
            margin-bottom: 18px;
        }

        .message {
            padding: 12px 16px;
            border-radius: 14px;
            font-size: 0.9rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: slideMessage 0.4s ease forwards;
        }

        @keyframes slideMessage {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .message.success {
            background: rgba(46, 125, 50, 0.25);
            border: 1px solid rgba(165, 214, 167, 0.3);
            color: #c8e6c9;
        }

        .message.error {
            background: rgba(211, 47, 47, 0.25);
            border: 1px solid rgba(239, 154, 154, 0.3);
            color: #ef9a9a;
        }

        .message i {
            font-size: 1.1rem;
        }

        /* ----- Form ----- */
        .login-form {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .input-group {
            position: relative;
        }

        .input-group .input-icon {
            position: absolute;
            left: 16px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.35);
            font-size: 1rem;
            transition: color 0.3s ease;
            pointer-events: none;
        }

        .input-group input {
            width: 100%;
            padding: 14px 16px 14px 48px;
            border: 1.5px solid rgba(255, 255, 255, 0.12);
            border-radius: 16px;
            background: rgba(255, 255, 255, 0.06);
            color: #f5faf5;
            font-size: 1rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            outline: none;
        }

        .input-group input::placeholder {
            color: rgba(255, 255, 255, 0.35);
            font-weight: 400;
        }

        .input-group input:focus {
            border-color: rgba(165, 214, 167, 0.5);
            background: rgba(255, 255, 255, 0.10);
            box-shadow: 0 0 0 4px rgba(165, 214, 167, 0.08);
        }

        .input-group input:focus + .input-icon,
        .input-group input:focus ~ .input-icon {
            color: #a5d6a7;
        }

        /* ----- Button ----- */
        .btn-login {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 16px;
            background: linear-gradient(145deg, #2e7d32, #1b5e20);
            color: white;
            font-size: 1.05rem;
            font-weight: 700;
            font-family: 'Inter', sans-serif;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.23, 1, 0.32, 1);
            letter-spacing: 0.3px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            margin-top: 4px;
        }

        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 32px rgba(46, 125, 50, 0.35);
            background: linear-gradient(145deg, #388e3c, #2e7d32);
        }

        .btn-login:active {
            transform: scale(0.97);
        }

        /* ----- Footer links ----- */
        .login-footer {
            margin-top: 22px;
            text-align: center;
            color: rgba(255, 255, 255, 0.55);
            font-size: 0.92rem;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .login-footer .links-row {
            display: flex;
            justify-content: center;
            gap: 6px;
            flex-wrap: wrap;
        }

        .login-footer a {
            color: #a5d6a7;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.25s ease;
            padding: 2px 8px;
            border-radius: 6px;
        }

        .login-footer a:hover {
            color: #c8e6c9;
            background: rgba(165, 214, 167, 0.10);
        }

        .login-footer .divider {
            color: rgba(255, 255, 255, 0.15);
        }

        .login-footer .forgot-link {
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.4);
        }

        .login-footer .forgot-link:hover {
            color: #a5d6a7;
            background: none;
        }

        /* ----- Responsive ----- */
        @media (max-width: 480px) {
            .login-card {
                padding: 28px 20px 28px;
                border-radius: 20px;
            }

            .login-brand h2 {
                font-size: 1.5rem;
            }

            .login-brand .icon-wrapper {
                width: 60px;
                height: 60px;
            }

            .login-brand .icon-wrapper i {
                font-size: 26px;
            }

            .input-group input {
                padding: 12px 14px 12px 42px;
                font-size: 0.95rem;
            }

            .btn-login {
                padding: 13px;
                font-size: 0.95rem;
            }
        }

        @media (max-width: 400px) {
            .login-card {
                padding: 20px 16px 24px;
            }

            .login-footer .links-row {
                flex-direction: column;
                gap: 4px;
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

    <!-- Login Wrapper -->
    <div class="login-wrapper">
        <div class="login-card">

            <!-- Brand -->
            <div class="login-brand">
                <div class="icon-wrapper">
                    <i class="fa-solid fa-paw"></i>
                </div>
                <h2>Welcome Back</h2>
                <p>Sign in to continue your wildlife journey</p>
            </div>

            <!-- Messages -->
            <div class="message-container">
                <%
                    String successMessage = (String) request.getAttribute("success");
                    if (successMessage != null) {
                %>
                    <div class="message success">
                        <i class="fa-solid fa-circle-check"></i>
                        <%= successMessage %>
                    </div>
                <%
                    }
                %>
                <%
                    String eMessage = (String) request.getAttribute("fail");
                    if (eMessage != null) {
                %>
                    <div class="message error">
                        <i class="fa-solid fa-circle-exclamation"></i>
                        <%= eMessage %>
                    </div>
                <%
                    }
                %>
            </div>

            <!-- Form -->
            <form class="login-form" action="login" method="post">
                <div class="input-group">
                    <input type="text" name="mail" placeholder="Email Address" required>
                    <span class="input-icon"><i class="fa-regular fa-envelope"></i></span>
                </div>
                <div class="input-group">
                    <input type="password" name="pass" placeholder="Password" required>
                    <span class="input-icon"><i class="fa-solid fa-lock"></i></span>
                </div>
                <button type="submit" class="btn-login">
                    <i class="fa-solid fa-right-to-bracket"></i> Sign In
                </button>
            </form>

            <!-- Footer -->
            <div class="login-footer">
                <div class="links-row">
                    <span>Don't have an account?</span>
                    <a href="signup.jsp">Sign Up</a>
                </div>
                <a href="forgot.jsp" class="forgot-link">
                    <i class="fa-regular fa-circle-question"></i> Forgot Password?
                </a>
            </div>

        </div>
    </div>

</body>
</html>