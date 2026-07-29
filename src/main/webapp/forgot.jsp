<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Forgot Password | Wildlife Tourism</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <!-- AOS -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css"
          rel="stylesheet">


    <style>

        /* ==========================================
           RESET & BASE
           ========================================== */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        body {

            font-family:
                'Inter',
                -apple-system,
                BlinkMacSystemFont,
                sans-serif;

            min-height: 100vh;

            display: flex;

            align-items: center;

            justify-content: center;

            background:
                url('https://www.francisjtaylor.co.uk/wp-content/uploads/2022/04/Q7A5185-768x512.jpg')
                no-repeat
                center center / cover;

            padding: 20px;

            position: relative;
        }


        /* ==========================================
           DARK BACKGROUND OVERLAY
           ========================================== */

        body::before {

            content: '';

            position: fixed;

            inset: 0;

            background:
                linear-gradient(
                    135deg,
                    rgba(6, 18, 8, 0.82) 0%,
                    rgba(10, 30, 14, 0.55) 50%,
                    rgba(3, 10, 5, 0.88) 100%
                );

            z-index: 0;
        }


        /* ==========================================
           FLOATING PARTICLES
           ========================================== */

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

            background:
                rgba(255, 255, 255, 0.08);

            border-radius: 50%;

            animation:
                floatParticle linear infinite;
        }


        .particle:nth-child(1) {
            left: 8%;
            animation-duration: 20s;
            animation-delay: 0s;
            width: 8px;
            height: 8px;
        }


        .particle:nth-child(2) {
            left: 20%;
            animation-duration: 24s;
            animation-delay: 2s;
            width: 5px;
            height: 5px;
        }


        .particle:nth-child(3) {
            left: 40%;
            animation-duration: 18s;
            animation-delay: 4s;
            width: 10px;
            height: 10px;
        }


        .particle:nth-child(4) {
            left: 60%;
            animation-duration: 22s;
            animation-delay: 1s;
            width: 6px;
            height: 6px;
        }


        .particle:nth-child(5) {
            left: 75%;
            animation-duration: 26s;
            animation-delay: 3s;
            width: 7px;
            height: 7px;
        }


        .particle:nth-child(6) {
            left: 88%;
            animation-duration: 19s;
            animation-delay: 5s;
            width: 4px;
            height: 4px;
        }


        .particle:nth-child(7) {
            left: 50%;
            animation-duration: 21s;
            animation-delay: 6s;
            width: 9px;
            height: 9px;
        }


        .particle:nth-child(8) {
            left: 12%;
            animation-duration: 17s;
            animation-delay: 7s;
            width: 5px;
            height: 5px;
        }


        .particle:nth-child(9) {
            left: 68%;
            animation-duration: 23s;
            animation-delay: 2.5s;
            width: 7px;
            height: 7px;
        }


        .particle:nth-child(10) {
            left: 32%;
            animation-duration: 20s;
            animation-delay: 4.5s;
            width: 6px;
            height: 6px;
        }


        @keyframes floatParticle {

            0% {
                transform:
                    translateY(100vh)
                    scale(0);

                opacity: 0;
            }


            10% {
                opacity: 1;
            }


            90% {
                opacity: 1;
            }


            100% {

                transform:
                    translateY(-10vh)
                    scale(1);

                opacity: 0;
            }
        }


        /* ==========================================
           FORGOT PASSWORD WRAPPER
           ========================================== */

        .forgot-wrapper {

            position: relative;

            z-index: 1;

            width: 100%;

            max-width: 440px;

            animation:
                fadeInUp 0.6s ease forwards;

            opacity: 0;
        }


        @keyframes fadeInUp {

            from {

                opacity: 0;

                transform:
                    translateY(30px);
            }


            to {

                opacity: 1;

                transform:
                    translateY(0);
            }
        }


        /* ==========================================
           CARD
           ========================================== */

        .forgot-card {

            background: #ffffff;

            border-radius: 24px;

            padding:
                40px
                36px
                32px;

            box-shadow:
                0 20px 60px
                rgba(0, 0, 0, 0.30);

            transition:
                transform 0.2s ease;

            position: relative;

            overflow: hidden;
        }


        .forgot-card::before {

            content: '';

            position: absolute;

            top: 0;

            left: 0;

            right: 0;

            height: 4px;

            background:
                linear-gradient(
                    90deg,
                    #2e7d32,
                    #66bb6a,
                    #a5d6a7,
                    #66bb6a,
                    #2e7d32
                );

            background-size:
                200% 100%;

            animation:
                gradientMove
                4s
                ease-in-out
                infinite;
        }


        @keyframes gradientMove {

            0%,
            100% {
                background-position:
                    0% 50%;
            }


            50% {
                background-position:
                    100% 50%;
            }
        }


        /* ==========================================
           HEADER
           ========================================== */

        .forgot-header {

            text-align: center;

            margin-bottom: 28px;
        }


        .forgot-header .icon-wrapper {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            width: 72px;

            height: 72px;

            background:
                linear-gradient(
                    145deg,
                    #e8f5e9,
                    #c8e6c9
                );

            border-radius: 50%;

            margin-bottom: 14px;

            transition:
                transform 0.3s ease;
        }


        .forgot-header .icon-wrapper i {

            font-size: 32px;

            color: #2e7d32;
        }


        .forgot-header .icon-wrapper:hover {

            transform:
                scale(1.05);
        }


        .forgot-header h2 {

            font-weight: 800;

            font-size: 1.75rem;

            color: #1a2e1a;

            letter-spacing: -0.5px;

            margin: 0;
        }


        .forgot-header h2 span {

            background:
                linear-gradient(
                    135deg,
                    #2e7d32,
                    #66bb6a
                );

            -webkit-background-clip: text;

            -webkit-text-fill-color: transparent;

            background-clip: text;
        }


        .forgot-header p {

            color: #6b7a6b;

            font-size: 0.95rem;

            font-weight: 400;

            line-height: 1.6;

            margin:
                8px
                0
                0;
        }


        /* ==========================================
           MESSAGES
           ========================================== */

        .message-container {

            margin-bottom: 20px;
        }


        .message {

            padding:
                12px
                16px;

            border-radius: 12px;

            font-size: 0.88rem;

            font-weight: 500;

            display: flex;

            align-items: center;

            gap: 12px;

            animation:
                slideMessage
                0.4s ease forwards;
        }


        @keyframes slideMessage {

            from {

                opacity: 0;

                transform:
                    translateY(-8px);
            }


            to {

                opacity: 1;

                transform:
                    translateY(0);
            }
        }


        .message.success {

            background: #e8f5e9;

            border-left:
                4px solid #2e7d32;

            color: #1e4a22;
        }


        .message.error {

            background: #ffebee;

            border-left:
                4px solid #c62828;

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


        /* ==========================================
           FORM
           ========================================== */

        .forgot-form {

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


        /* ==========================================
           INPUT
           ========================================== */

        .input-wrapper {

            position: relative;
        }


        .input-wrapper .input-icon {

            position: absolute;

            left: 14px;

            top: 50%;

            transform:
                translateY(-50%);

            color: #8a9a8a;

            font-size: 0.95rem;

            transition:
                color 0.3s ease;

            pointer-events: none;
        }


        .input-wrapper input {

            width: 100%;

            padding:
                13px
                16px
                13px
                44px;

            border:
                1.5px solid #dce4dc;

            border-radius: 12px;

            background: #fafcfa;

            color: #1a2e1a;

            font-size: 0.95rem;

            font-family:
                'Inter',
                sans-serif;

            font-weight: 400;

            transition:
                all 0.3s ease;

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

            box-shadow:
                0 0 0 4px
                rgba(46, 125, 50, 0.10);
        }


        .input-wrapper input:focus
        ~ .input-icon {

            color: #2e7d32;
        }


        /* ==========================================
           INFO BOX
           ========================================== */

        .otp-info {

            display: flex;

            align-items: flex-start;

            gap: 10px;

            padding:
                12px
                14px;

            background: #f1f8e9;

            border-radius: 10px;

            color: #557055;

            font-size: 0.78rem;

            line-height: 1.5;
        }


        .otp-info i {

            color: #2e7d32;

            margin-top: 2px;
        }


        /* ==========================================
           BUTTON
           ========================================== */

        .btn-reset {

            width: 100%;

            padding: 15px;

            border: none;

            border-radius: 12px;

            background: #2e7d32;

            color: white;

            font-size: 1rem;

            font-weight: 700;

            font-family:
                'Inter',
                sans-serif;

            cursor: pointer;

            transition:
                all 0.3s ease;

            letter-spacing: 0.3px;

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 10px;

            margin-top: 4px;
        }


        .btn-reset:hover {

            background: #1b5e20;

            transform:
                translateY(-2px);

            box-shadow:
                0 8px 24px
                rgba(46, 125, 50, 0.30);
        }


        .btn-reset:active {

            transform:
                scale(0.97);

            box-shadow: none;
        }


        .btn-reset i {

            transition:
                transform 0.3s ease;
        }


        .btn-reset:hover i {

            transform:
                translateX(4px);
        }


        .btn-reset:disabled {

            background: #8fa891;

            cursor: not-allowed;

            transform: none;

            box-shadow: none;
        }


        /* ==========================================
           FOOTER
           ========================================== */

        .forgot-footer {

            margin-top: 24px;

            padding-top: 20px;

            border-top:
                1px solid #e8eee8;

            text-align: center;

            color: #6b7a6b;

            font-size: 0.92rem;
        }


        .forgot-footer a {

            color: #2e7d32;

            text-decoration: none;

            font-weight: 600;

            transition:
                color 0.2s ease;

            display: inline-flex;

            align-items: center;

            gap: 6px;
        }


        .forgot-footer a:hover {

            color: #1b5e20;

            text-decoration: underline;
        }


        /* ==========================================
           RESPONSIVE
           ========================================== */

        @media (max-width: 520px) {

            .forgot-card {

                padding:
                    28px
                    20px
                    24px;

                border-radius: 20px;
            }


            .forgot-header h2 {

                font-size: 1.4rem;
            }


            .forgot-header .icon-wrapper {

                width: 60px;

                height: 60px;
            }


            .forgot-header .icon-wrapper i {

                font-size: 26px;
            }


            .input-wrapper input {

                padding:
                    12px
                    14px
                    12px
                    40px;

                font-size: 0.9rem;
            }


            .btn-reset {

                padding: 13px;

                font-size: 0.92rem;
            }
        }


        @media (max-width: 380px) {

            .forgot-card {

                padding:
                    20px
                    14px
                    20px;

                border-radius: 16px;
            }


            .input-wrapper input {

                padding:
                    11px
                    12px
                    11px
                    36px;

                font-size: 0.85rem;
            }


            .forgot-header h2 {

                font-size: 1.2rem;
            }


            .form-group label {

                font-size: 0.75rem;
            }
        }

    </style>

</head>


<body>


    <!-- ==========================================
         DECORATIVE PARTICLES
         ========================================== -->

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


    <!-- ==========================================
         FORGOT PASSWORD CARD
         ========================================== -->

    <div class="forgot-wrapper"
         data-aos="fade-up">


        <div class="forgot-card">


            <!-- ==================================
                 HEADER
                 ================================== -->

            <div class="forgot-header">


                <div class="icon-wrapper">

                    <i class="fa-solid fa-key"></i>

                </div>


                <h2>
                    Forgot
                    <span>Password</span>
                </h2>


                <p>
                    Enter your registered email address
                    and we'll send you a verification OTP.
                </p>


            </div>


            <!-- ==================================
                 SUCCESS / ERROR MESSAGES
                 ================================== -->

            <div class="message-container">


                <%
                    String successMessage =
                            (String)
                            request.getAttribute(
                                    "success"
                            );

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
                    String errorMessage =
                            (String)
                            request.getAttribute(
                                    "error"
                            );

                    if (errorMessage != null) {
                %>


                    <div class="message error">

                        <i class="fa-solid fa-circle-exclamation"></i>

                        <%= errorMessage %>

                    </div>


                <%
                    }
                %>


            </div>


            <!-- ==================================
                 FORGOT PASSWORD FORM
                 ================================== -->

            <form
                class="forgot-form"
                action="<%= request.getContextPath() %>/forgot"
                method="post"
                id="forgotForm">


                <!-- ==============================
                     EMAIL
                     ============================== -->

                <div class="form-group">


                    <label for="email">

                        <i class="fa-regular fa-envelope"></i>

                        Email Address

                    </label>


                    <div class="input-wrapper">


                        <input
                            type="email"
                            id="email"
                            name="email"
                            placeholder="Enter your registered email address"
                            autocomplete="email"
                            maxlength="150"
                            required
                        >


                        <span class="input-icon">

                            <i class="fa-regular fa-envelope"></i>

                        </span>


                    </div>


                </div>


                <!-- ==============================
                     OTP INFORMATION
                     ============================== -->

                <div class="otp-info">

                    <i class="fa-solid fa-shield-halved"></i>

                    <span>
                        A 6-digit OTP will be sent to your
                        registered email address. The OTP
                        will be valid for 100 seconds.
                    </span>

                </div>


                <!-- ==============================
                     SEND OTP BUTTON
                     ============================== -->

                <button
                    type="submit"
                    class="btn-reset"
                    id="sendOtpButton">


                    <i class="fa-solid fa-paper-plane"></i>


                    <span id="buttonText">
                        Send OTP
                    </span>


                </button>


            </form>


            <!-- ==================================
                 FOOTER
                 ================================== -->

            <div class="forgot-footer">


                <a href="<%= request.getContextPath() %>/login.jsp">


                    <i class="fa-solid fa-arrow-left"></i>


                    Back to Login


                </a>


            </div>


        </div>


    </div>


    <!-- ==========================================
         AOS
         ========================================== -->

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>


    <script>

        // ==========================================
        // INITIALIZE AOS
        // ==========================================

        AOS.init({

            duration: 800,

            easing: 'ease-out',

            once: true,

            offset: 50

        });


        // ==========================================
        // AUTO FOCUS EMAIL
        // ==========================================

        document.addEventListener(
            'DOMContentLoaded',
            function () {

                const emailInput =
                    document.getElementById(
                        'email'
                    );


                if (emailInput) {

                    emailInput.focus();

                }

            }
        );


        // ==========================================
        // PREVENT DOUBLE SUBMISSION
        // ==========================================

        const forgotForm =
            document.getElementById(
                'forgotForm'
            );


        const sendOtpButton =
            document.getElementById(
                'sendOtpButton'
            );


        const buttonText =
            document.getElementById(
                'buttonText'
            );


        forgotForm.addEventListener(
            'submit',
            function () {


                /*
                 * Browser performs normal HTML5
                 * email validation before this
                 * submit event completes.
                 *
                 * Disable the button so the user
                 * cannot accidentally request
                 * multiple OTPs by double-clicking.
                 */

                sendOtpButton.disabled =
                    true;


                buttonText.textContent =
                    'Sending OTP...';

            }
        );

    </script>


</body>

</html>