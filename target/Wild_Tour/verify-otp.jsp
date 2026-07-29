<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    // ==========================================
    // CHECK VALID PASSWORD RESET SESSION
    // ==========================================

    String resetEmail =
            (String) session.getAttribute("resetEmail");

    String resetOTP =
            (String) session.getAttribute("resetOTP");

    Long otpExpiry =
            (Long) session.getAttribute("otpExpiry");


    // ==========================================
    // NO ACTIVE OTP REQUEST
    // ==========================================

    if (resetEmail == null
            || resetOTP == null
            || otpExpiry == null) {

        response.sendRedirect(
                request.getContextPath()
                + "/forgot.jsp"
        );

        return;
    }


    // ==========================================
    // CALCULATE REMAINING OTP TIME
    // ==========================================

    long remainingMilliseconds =
            otpExpiry - System.currentTimeMillis();

    long remainingSeconds =
            (remainingMilliseconds + 999) / 1000;


    if (remainingSeconds < 0) {
        remainingSeconds = 0;
    }


    if (remainingSeconds > 100) {
        remainingSeconds = 100;
    }
%>


<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Verify OTP | Wildlife Tourism</title>


    <!-- ==========================================
         GOOGLE FONT
         ========================================== -->

    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">


    <!-- ==========================================
         FONT AWESOME
         ========================================== -->

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">


    <!-- ==========================================
         AOS
         ========================================== -->

    <link
        href="https://unpkg.com/aos@2.3.1/dist/aos.css"
        rel="stylesheet">


    <style>

        /* ==========================================
           RESET
           ========================================== */

        * {

            margin: 0;

            padding: 0;

            box-sizing: border-box;

        }


        /* ==========================================
           BODY
           ========================================== */

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
           BACKGROUND OVERLAY
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
           PARTICLES
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
           WRAPPER
           ========================================== */

        .otp-wrapper {

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

        .otp-card {

            background: #ffffff;

            border-radius: 24px;


            padding:
                40px
                36px
                32px;


            box-shadow:
                0 20px 60px
                rgba(0, 0, 0, 0.30);


            position: relative;

            overflow: hidden;

        }


        /* ==========================================
           GREEN TOP ANIMATION
           ========================================== */

        .otp-card::before {

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

        .otp-header {

            text-align: center;

            margin-bottom: 25px;

        }


        .icon-wrapper {

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


        .icon-wrapper:hover {

            transform:
                scale(1.05);

        }


        .icon-wrapper i {

            font-size: 30px;

            color: #2e7d32;

        }


        .otp-header h2 {

            font-weight: 800;

            font-size: 1.75rem;

            color: #1a2e1a;

            letter-spacing: -0.5px;

        }


        .otp-header h2 span {

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


        .otp-header p {

            color: #6b7a6b;

            font-size: 0.92rem;

            line-height: 1.6;

            margin-top: 8px;

        }


        /* ==========================================
           EMAIL DISPLAY
           ========================================== */

        .email-box {

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 8px;


            background: #f1f8e9;


            color: #2e7d32;


            padding:
                10px
                12px;


            border-radius: 10px;


            margin-top: 14px;


            font-size: 0.85rem;

            font-weight: 600;


            word-break: break-word;

        }


        .email-box i {

            flex-shrink: 0;

        }


        /* ==========================================
           MESSAGES
           ========================================== */

        .message {

            padding:
                12px
                16px;


            border-radius: 12px;


            font-size: 0.88rem;

            font-weight: 500;


            display: flex;

            align-items: center;

            gap: 10px;


            margin-bottom: 18px;


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


        .message.error {

            background: #ffebee;

            border-left:
                4px solid #c62828;

            color: #8e1a1a;

        }


        .message.success {

            background: #e8f5e9;

            border-left:
                4px solid #2e7d32;

            color: #1e4a22;

        }


        .message.error i {

            color: #c62828;

        }


        .message.success i {

            color: #2e7d32;

        }


        /* ==========================================
           FORM
           ========================================== */

        .otp-form {

            display: flex;

            flex-direction: column;

            gap: 16px;

        }


        .form-group {

            display: flex;

            flex-direction: column;

            gap: 7px;

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

        }


        /* ==========================================
           OTP INPUT
           ========================================== */

        .otp-input {

            width: 100%;


            padding:
                14px
                15px;


            border:
                1.5px solid #dce4dc;


            border-radius: 12px;


            background: #fafcfa;


            color: #1a2e1a;


            font-family:
                'Inter',
                sans-serif;


            font-size: 1.35rem;

            font-weight: 700;


            text-align: center;


            letter-spacing: 10px;


            outline: none;


            transition:
                all 0.3s ease;

        }


        .otp-input::placeholder {

            color: #bdc8bd;

        }


        .otp-input:hover {

            border-color: #b0c8b0;

            background: #ffffff;

        }


        .otp-input:focus {

            border-color: #2e7d32;

            background: #ffffff;


            box-shadow:
                0 0 0 4px
                rgba(46, 125, 50, 0.10);

        }


        /* ==========================================
           TIMER
           ========================================== */

        .timer-box {

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 8px;


            padding:
                12px
                14px;


            background: #f1f8e9;


            border-radius: 10px;


            color: #557055;


            font-size: 0.85rem;

        }


        .timer-box i {

            color: #2e7d32;

        }


        #timer {

            color: #2e7d32;

            font-size: 1rem;

            font-weight: 800;

        }


        .timer-box.timer-expired {

            background: #ffebee;

            color: #8e1a1a;

        }


        .timer-box.timer-expired i {

            color: #c62828;

        }


        .timer-box.timer-expired #timer {

            color: #c62828;

        }


        /* ==========================================
           VERIFY BUTTON
           ========================================== */

        .verify-btn {

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

        }


        .verify-btn:hover {

            background: #1b5e20;


            transform:
                translateY(-2px);


            box-shadow:
                0 8px 24px
                rgba(46, 125, 50, 0.30);

        }


        .verify-btn:active {

            transform:
                scale(0.97);

            box-shadow: none;

        }


        .verify-btn:disabled {

            background: #9e9e9e;

            cursor: not-allowed;

            transform: none;

            box-shadow: none;

        }


        /* ==========================================
           FOOTER
           ========================================== */

        .otp-footer {

            margin-top: 24px;

            padding-top: 20px;


            border-top:
                1px solid #e8eee8;


            text-align: center;


            font-size: 0.88rem;

            color: #6b7a6b;

        }


        .otp-footer p {

            margin-bottom: 10px;

        }


        .otp-footer a {

            color: #2e7d32;

            text-decoration: none;

            font-weight: 600;


            display: inline-flex;

            align-items: center;

            gap: 6px;

        }


        .otp-footer a:hover {

            color: #1b5e20;

            text-decoration: underline;

        }


        /* ==========================================
           RESPONSIVE
           ========================================== */

        @media (max-width: 520px) {

            .otp-card {

                padding:
                    28px
                    20px
                    24px;

                border-radius: 20px;

            }


            .otp-header h2 {

                font-size: 1.4rem;

            }


            .icon-wrapper {

                width: 60px;

                height: 60px;

            }


            .icon-wrapper i {

                font-size: 25px;

            }


            .otp-input {

                font-size: 1.15rem;

                letter-spacing: 8px;

            }


            .verify-btn {

                padding: 13px;

                font-size: 0.92rem;

            }

        }


        @media (max-width: 380px) {

            .otp-card {

                padding:
                    20px
                    14px;

                border-radius: 16px;

            }


            .otp-input {

                font-size: 1rem;

                letter-spacing: 6px;

            }


            .otp-header h2 {

                font-size: 1.2rem;

            }

        }

    </style>

</head>


<body>


    <!-- ==========================================
         FLOATING PARTICLES
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
         OTP WRAPPER
         ========================================== -->

    <div class="otp-wrapper"
         data-aos="fade-up">


        <div class="otp-card">


            <!-- ==================================
                 HEADER
                 ================================== -->

            <div class="otp-header">


                <div class="icon-wrapper">

                    <i class="fa-solid fa-shield-halved"></i>

                </div>


                <h2>

                    Verify
                    <span>OTP</span>

                </h2>


                <p>

                    Enter the 6-digit verification code
                    sent to your registered email address.

                </p>


                <div class="email-box">

                    <i class="fa-regular fa-envelope"></i>

                    <span>
                        <%= resetEmail %>
                    </span>

                </div>


            </div>


            <!-- ==================================
                 ERROR MESSAGE
                 ================================== -->

            <%

                String error =
                        (String)
                        request.getAttribute(
                                "error"
                        );


                if (error != null) {

            %>


                <div class="message error">

                    <i class="fa-solid fa-circle-exclamation"></i>

                    <span>
                        <%= error %>
                    </span>

                </div>


            <%

                }

            %>


            <!-- ==================================
                 SUCCESS MESSAGE
                 ================================== -->

            <%

                String success =
                        (String)
                        request.getAttribute(
                                "success"
                        );


                if (success != null) {

            %>


                <div class="message success">

                    <i class="fa-solid fa-circle-check"></i>

                    <span>
                        <%= success %>
                    </span>

                </div>


            <%

                }

            %>


            <!-- ==================================
                 OTP FORM
                 ================================== -->

            <form
                action="<%= request.getContextPath() %>/verify-otp"
                method="post"
                class="otp-form"
                id="otpForm">


                <!-- ==============================
                     OTP INPUT
                     ============================== -->

                <div class="form-group">


                    <label for="otp">

                        <i class="fa-solid fa-key"></i>

                        Verification Code

                    </label>


                    <input
                        type="text"
                        name="otp"
                        id="otp"
                        class="otp-input"

                        maxlength="6"

                        inputmode="numeric"

                        pattern="[0-9]{6}"

                        autocomplete="one-time-code"

                        placeholder="000000"

                        aria-label="6 digit OTP"

                        required
                    >


                </div>


                <!-- ==============================
                     TIMER
                     ============================== -->

                <div
                    class="timer-box"
                    id="timerBox">


                    <i class="fa-regular fa-clock"></i>


                    <span id="timerMessage">

                        OTP expires in

                        <span id="timer">
                            <%= remainingSeconds %>
                        </span>

                        seconds

                    </span>


                </div>


                <!-- ==============================
                     VERIFY BUTTON
                     ============================== -->

                <button
                    type="submit"
                    id="verifyButton"
                    class="verify-btn">


                    <i
                        class="fa-solid fa-shield-check"
                        id="verifyIcon">
                    </i>


                    <span id="verifyButtonText">

                        Verify OTP

                    </span>


                </button>


            </form>


            <!-- ==================================
                 FOOTER
                 ================================== -->

            <div class="otp-footer">


                <p>
                    Didn't receive the OTP?
                </p>


                <a
                    href="<%= request.getContextPath() %>/forgot.jsp">


                    <i class="fa-solid fa-rotate-right"></i>


                    Request New OTP


                </a>


            </div>


        </div>


    </div>


    <!-- ==========================================
         AOS JAVASCRIPT
         ========================================== -->

    <script
        src="https://unpkg.com/aos@2.3.1/dist/aos.js">
    </script>


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
        // GET ELEMENTS
        // ==========================================

        const otpInput =
            document.getElementById(
                "otp"
            );


        const otpForm =
            document.getElementById(
                "otpForm"
            );


        const timer =
            document.getElementById(
                "timer"
            );


        const timerBox =
            document.getElementById(
                "timerBox"
            );


        const timerMessage =
            document.getElementById(
                "timerMessage"
            );


        const verifyButton =
            document.getElementById(
                "verifyButton"
            );


        const verifyButtonText =
            document.getElementById(
                "verifyButtonText"
            );


        // ==========================================
        // AUTO FOCUS OTP
        // ==========================================

        document.addEventListener(
            "DOMContentLoaded",
            function () {

                if (otpInput) {

                    otpInput.focus();

                }

            }
        );


        // ==========================================
        // ONLY ALLOW NUMBERS
        // ==========================================

        otpInput.addEventListener(
            "input",
            function () {


                this.value =
                    this.value
                        .replace(
                            /[^0-9]/g,
                            ""
                        )
                        .slice(
                            0,
                            6
                        );

            }
        );


        // ==========================================
        // TIMER
        // ==========================================

        let timeLeft =
            <%= remainingSeconds %>;


        function expireOTP() {


            timeLeft = 0;


            timerBox.classList.add(
                "timer-expired"
            );


            timerMessage.innerHTML =
                "OTP has expired";


            otpInput.disabled =
                true;


            verifyButton.disabled =
                true;


            verifyButtonText.textContent =
                "OTP Expired";

        }


        if (timeLeft <= 0) {


            expireOTP();


        } else {


            timer.textContent =
                timeLeft;


            const countdown =
                setInterval(
                    function () {


                        timeLeft--;


                        if (timeLeft <= 0) {


                            clearInterval(
                                countdown
                            );


                            expireOTP();


                            return;

                        }


                        timer.textContent =
                            timeLeft;


                    },
                    1000
                );

        }


        // ==========================================
        // PREVENT DOUBLE SUBMISSION
        // ==========================================

        otpForm.addEventListener(
            "submit",
            function (event) {


                // OTP already expired
                if (timeLeft <= 0) {


                    event.preventDefault();


                    return;

                }


                // Must be exactly 6 digits
                if (!/^\d{6}$/.test(
                        otpInput.value
                    )) {


                    event.preventDefault();


                    otpInput.focus();


                    return;

                }


                verifyButton.disabled =
                    true;


                verifyButtonText.textContent =
                    "Verifying...";

            }
        );

    </script>


</body>

</html>