<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up | Wildlife Tourism</title>

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
            background: url('https://images.unsplash.com/photo-1547471080-7cc2caa01a7e?q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D') no-repeat center center/cover;
            padding: 20px;
            position: relative;
        }

        /* Dark overlay with gradient */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background: linear-gradient(135deg, rgba(6, 18, 8, 0.78) 0%, rgba(10, 30, 14, 0.55) 50%, rgba(3, 10, 5, 0.85) 100%);
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
            background: rgba(255, 255, 255, 0.12);
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

        /* ----- Signup Card - Glassmorphism ----- */
        .signup-wrapper {
            position: relative;
            z-index: 1;
            width: 100%;
            max-width: 440px;
            animation: fadeInUp 0.8s cubic-bezier(0.23, 1, 0.32, 1) forwards;
            opacity: 0;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px) scale(0.96); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        .signup-card {
            background: rgba(255, 255, 255, 0.07);
            backdrop-filter: blur(20px) saturate(1.6);
            -webkit-backdrop-filter: blur(20px) saturate(1.6);
            border-radius: 28px;
            padding: 36px 32px 32px;
            border: 1px solid rgba(255, 255, 255, 0.10);
            box-shadow: 0 32px 80px rgba(0, 0, 0, 0.5), 0 0 0 1px rgba(255, 255, 255, 0.04) inset;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            max-height: 90vh;
            overflow-y: auto;
        }

        .signup-card::-webkit-scrollbar {
            width: 4px;
        }
        .signup-card::-webkit-scrollbar-track {
            background: transparent;
        }
        .signup-card::-webkit-scrollbar-thumb {
            background: rgba(165, 214, 167, 0.3);
            border-radius: 10px;
        }

        .signup-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 40px 100px rgba(0, 0, 0, 0.6), 0 0 0 1px rgba(255, 255, 255, 0.06) inset;
        }

        /* ----- Logo / Brand ----- */
        .signup-brand {
            text-align: center;
            margin-bottom: 24px;
        }

        .signup-brand .icon-wrapper {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 68px;
            height: 68px;
            background: linear-gradient(145deg, rgba(46, 125, 50, 0.25), rgba(27, 94, 32, 0.15));
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.12);
            margin-bottom: 10px;
            transition: all 0.3s ease;
        }

        .signup-brand .icon-wrapper i {
            font-size: 30px;
            color: #a5d6a7;
        }

        .signup-brand .icon-wrapper:hover {
            transform: scale(1.05) rotate(-4deg);
            border-color: rgba(165, 214, 167, 0.4);
        }

        .signup-brand h2 {
            font-weight: 700;
            font-size: 1.7rem;
            color: #f5faf5;
            letter-spacing: -0.5px;
            margin: 0;
        }

        .signup-brand p {
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.88rem;
            font-weight: 400;
            margin-top: 4px;
        }

        /* ----- Messages (success/error) ----- */
        .message-container {
            margin-bottom: 16px;
        }

        .message {
            padding: 10px 14px;
            border-radius: 12px;
            font-size: 0.85rem;
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
            background: rgba(46, 125, 50, 0.22);
            border: 1px solid rgba(165, 214, 167, 0.25);
            color: #c8e6c9;
        }

        .message.error {
            background: rgba(211, 47, 47, 0.22);
            border: 1px solid rgba(239, 154, 154, 0.25);
            color: #ef9a9a;
        }

        .message i {
            font-size: 1rem;
        }

        /* ----- Form ----- */
        .signup-form {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .input-group {
            position: relative;
        }

        .input-group .input-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.30);
            font-size: 0.95rem;
            transition: color 0.3s ease;
            pointer-events: none;
        }

        .input-group input {
            width: 100%;
            padding: 12px 14px 12px 44px;
            border: 1.5px solid rgba(255, 255, 255, 0.10);
            border-radius: 14px;
            background: rgba(255, 255, 255, 0.05);
            color: #f5faf5;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            outline: none;
        }

        .input-group input::placeholder {
            color: rgba(255, 255, 255, 0.30);
            font-weight: 400;
        }

        .input-group input:focus {
            border-color: rgba(165, 214, 167, 0.45);
            background: rgba(255, 255, 255, 0.09);
            box-shadow: 0 0 0 4px rgba(165, 214, 167, 0.06);
        }

        .input-group input:focus + .input-icon,
        .input-group input:focus ~ .input-icon {
            color: #a5d6a7;
        }

        /* ----- Button ----- */
        .btn-signup {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 14px;
            background: linear-gradient(145deg, #2e7d32, #1b5e20);
            color: white;
            font-size: 1rem;
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

        .btn-signup:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 32px rgba(46, 125, 50, 0.35);
            background: linear-gradient(145deg, #388e3c, #2e7d32);
        }

        .btn-signup:active {
            transform: scale(0.97);
        }

        /* ----- Footer ----- */
        .signup-footer {
            margin-top: 20px;
            text-align: center;
            color: rgba(255, 255, 255, 0.50);
            font-size: 0.9rem;
        }

        .signup-footer a {
            color: #a5d6a7;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.25s ease;
            padding: 2px 8px;
            border-radius: 6px;
        }

        .signup-footer a:hover {
            color: #c8e6c9;
            background: rgba(165, 214, 167, 0.10);
        }

        /* ----- Responsive ----- */
        @media (max-width: 480px) {
            .signup-card {
                padding: 24px 18px 24px;
                border-radius: 20px;
                max-height: 95vh;
            }

            .signup-brand h2 {
                font-size: 1.4rem;
            }

            .signup-brand .icon-wrapper {
                width: 56px;
                height: 56px;
            }

            .signup-brand .icon-wrapper i {
                font-size: 24px;
            }

            .input-group input {
                padding: 10px 12px 10px 38px;
                font-size: 0.9rem;
            }

            .btn-signup {
                padding: 12px;
                font-size: 0.9rem;
            }
        }

        @media (max-width: 400px) {
            .signup-card {
                padding: 16px 14px 20px;
            }

            .input-group input {
                padding: 10px 10px 10px 34px;
                font-size: 0.85rem;
            }

            .signup-brand h2 {
                font-size: 1.2rem;
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

    <!-- Signup Wrapper -->
    <div class="signup-wrapper">
        <div class="signup-card">

            <!-- Brand -->
            <div class="signup-brand">
                <div class="icon-wrapper">
                    <i class="fa-solid fa-paw"></i>
                </div>
                <h2>Join the Adventure</h2>
                <p>Create your account to explore wildlife</p>
            </div>

            <!-- Messages -->
            <div class="message-container">
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
                <%
                    String emsg = (String) request.getAttribute("error");
                    if (emsg != null) {
                %>
                    <div class="message error">
                        <i class="fa-solid fa-circle-exclamation"></i>
                        <%= emsg %>
                    </div>
                <%
                    }
                %>
            </div>

            <!-- Form -->
            <form class="signup-form" action="signup" method="post">
                <div class="input-group">
                    <input type="text" name="name" placeholder="Full Name" required>
                    <span class="input-icon"><i class="fa-regular fa-user"></i></span>
                </div>
                <div class="input-group">
                    <input type="email" name="email" placeholder="Email Address" required>
                    <span class="input-icon"><i class="fa-regular fa-envelope"></i></span>
                </div>
                <div class="input-group">
                    <input type="tel" name="phone" placeholder="Phone Number" required>
                    <span class="input-icon"><i class="fa-solid fa-phone"></i></span>
                </div>
                <div class="input-group">
                    <input type="text" name="address" placeholder="Address" required>
                    <span class="input-icon"><i class="fa-solid fa-location-dot"></i></span>
                </div>
                <div class="input-group">
                    <input type="password" name="pass" placeholder="Password" required>
                    <span class="input-icon"><i class="fa-solid fa-lock"></i></span>
                </div>
                <div class="input-group">
                    <input type="password" name="cpass" placeholder="Confirm Password" required>
                    <span class="input-icon"><i class="fa-solid fa-check-double"></i></span>
                </div>
                <button type="submit" class="btn-signup">
                    <i class="fa-solid fa-user-plus"></i> Create Account
                </button>
            </form>

            <!-- Footer -->
            <div class="signup-footer">
                Already have an account? <a href="login.jsp">Sign In</a>
            </div>

        </div>
    </div>

</body>
</html>