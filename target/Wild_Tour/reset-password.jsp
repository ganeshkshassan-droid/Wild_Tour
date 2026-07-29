<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    // ==========================================
    // CHECK PASSWORD RESET AUTHORIZATION
    // ==========================================

    String resetEmail =
            (String) session.getAttribute("resetEmail");

    Boolean otpVerified =
            (Boolean) session.getAttribute("otpVerified");


    /*
     * User must have successfully verified
     * the OTP before accessing this page.
     */
    if (resetEmail == null
            || otpVerified == null
            || !otpVerified) {

        response.sendRedirect(
                request.getContextPath()
                + "/forgot.jsp"
        );

        return;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Reset Password | Wildlife Tourism</title>


    <!-- GOOGLE FONT -->
    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet">


    <!-- FONT AWESOME -->
    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">


    <!-- AOS -->
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
           DARK OVERLAY
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

        .reset-wrapper {

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

        .reset-card {

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


        .reset-card::before {

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

        .reset-header {

            text-align: center;

            margin-bottom: 26px;
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


        .reset-header h2 {

            font-weight: 800;

            font-size: 1.75rem;

            color: #1a2e1a;

            letter-spacing: -0.5px;
        }


        .reset-header h2 span {

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


        .reset-header p {

            color: #6b7a6b;

            font-size: 0.92rem;

            line-height: 1.6;

            margin-top: 8px;
        }


        /* ==========================================
           EMAIL BOX
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

        .reset-form {

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

            width: 16px;
        }


        /* ==========================================
           PASSWORD INPUT
           ========================================== */

        .input-wrapper {

            position: relative;
        }


        .input-wrapper input {

            width: 100%;

            padding:
                13px
                46px
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

            outline: none;

            transition:
                all 0.3s ease;
        }


        .input-wrapper input::placeholder {

            color: #a0b0a0;
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


        .input-icon {

            position: absolute;

            left: 14px;

            top: 50%;

            transform:
                translateY(-50%);

            color: #8a9a8a;

            pointer-events: none;
        }


        .toggle-password {

            position: absolute;

            right: 14px;

            top: 50%;

            transform:
                translateY(-50%);

            color: #7d8d7d;

            cursor: pointer;

            transition:
                color 0.2s ease;
        }


        .toggle-password:hover {

            color: #2e7d32;
        }


        /* ==========================================
           PASSWORD REQUIREMENTS
           ========================================== */

        .password-requirements {

            background: #f7faf7;

            border:
                1px solid #e1e9e1;

            border-radius: 10px;

            padding:
                12px
                14px;

            font-size: 0.76rem;

            color: #687868;

            line-height: 1.7;
        }


        .password-requirements strong {

            display: block;

            color: #2a3a2a;

            margin-bottom: 4px;
        }


        .requirement {

            display: flex;

            align-items: center;

            gap: 7px;
        }


        .requirement i {

            font-size: 0.65rem;

            color: #9aaa9a;
        }


        .requirement.valid {

            color: #2e7d32;
        }


        .requirement.valid i {

            color: #2e7d32;
        }


        /* ==========================================
           MATCH MESSAGE
           ========================================== */

        .match-message {

            font-size: 0.76rem;

            min-height: 16px;

            padding-left: 3px;
        }


        .match-success {

            color: #2e7d32;
        }


        .match-error {

            color: #c62828;
        }


        /* ==========================================
           BUTTON
           ========================================== */

        .reset-btn {

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

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 10px;
        }


        .reset-btn:hover {

            background: #1b5e20;

            transform:
                translateY(-2px);

            box-shadow:
                0 8px 24px
                rgba(46, 125, 50, 0.30);
        }


        .reset-btn:active {

            transform:
                scale(0.97);
        }


        .reset-btn:disabled {

            background: #9e9e9e;

            cursor: not-allowed;

            transform: none;

            box-shadow: none;
        }


        /* ==========================================
           FOOTER
           ========================================== */

        .reset-footer {

            margin-top: 24px;

            padding-top: 20px;

            border-top:
                1px solid #e8eee8;

            text-align: center;

            font-size: 0.88rem;
        }


        .reset-footer a {

            color: #2e7d32;

            text-decoration: none;

            font-weight: 600;

            display: inline-flex;

            align-items: center;

            gap: 6px;
        }


        .reset-footer a:hover {

            color: #1b5e20;

            text-decoration: underline;
        }


        /* ==========================================
           RESPONSIVE
           ========================================== */

        @media (max-width: 520px) {

            .reset-card {

                padding:
                    28px
                    20px
                    24px;

                border-radius: 20px;
            }


            .reset-header h2 {

                font-size: 1.4rem;
            }


            .icon-wrapper {

                width: 60px;

                height: 60px;
            }


            .icon-wrapper i {

                font-size: 25px;
            }


            .reset-btn {

                padding: 13px;

                font-size: 0.92rem;
            }
        }

    </style>

</head>


<body>


<!-- ==========================================
     PARTICLES
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
     RESET PASSWORD
     ========================================== -->

<div class="reset-wrapper"
     data-aos="fade-up">


    <div class="reset-card">


        <!-- ==================================
             HEADER
             ================================== -->

        <div class="reset-header">


            <div class="icon-wrapper">

                <i class="fa-solid fa-lock"></i>

            </div>


            <h2>

                Reset
                <span>Password</span>

            </h2>


            <p>

                Create a new secure password
                for your Wild Tour account.

            </p>


            <div class="email-box">

                <i class="fa-regular fa-envelope"></i>

                <span>
                    <%= resetEmail %>
                </span>

            </div>


        </div>


        <!-- ==================================
             ERROR MESSAGE FROM SERVLET
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
             RESET FORM
             ================================== -->

        <form
            action="<%= request.getContextPath() %>/reset-password"
            method="post"
            class="reset-form"
            id="resetForm">


            <!-- ==============================
                 NEW PASSWORD
                 ============================== -->

            <div class="form-group">


                <label for="password">

                    <i class="fa-solid fa-lock"></i>

                    New Password

                </label>


                <div class="input-wrapper">


                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter new password"
                        minlength="8"
                        maxlength="50"
                        autocomplete="new-password"
                        required
                    >


                    <span class="input-icon">

                        <i class="fa-solid fa-lock"></i>

                    </span>


                    <span
                        class="toggle-password"
                        onclick="togglePassword(
                            'password',
                            'passwordEye'
                        )">


                        <i
                            id="passwordEye"
                            class="fa-regular fa-eye">
                        </i>


                    </span>


                </div>


            </div>


            <!-- ==============================
                 PASSWORD REQUIREMENTS
                 ============================== -->

            <div class="password-requirements">


                <strong>
                    Password must contain:
                </strong>


                <div
                    class="requirement"
                    id="lengthRequirement">

                    <i class="fa-solid fa-circle"></i>

                    8 - 50 characters

                </div>


                <div
                    class="requirement"
                    id="upperRequirement">

                    <i class="fa-solid fa-circle"></i>

                    At least one uppercase letter

                </div>


                <div
                    class="requirement"
                    id="lowerRequirement">

                    <i class="fa-solid fa-circle"></i>

                    At least one lowercase letter

                </div>


                <div
                    class="requirement"
                    id="numberRequirement">

                    <i class="fa-solid fa-circle"></i>

                    At least one number

                </div>


                <div
                    class="requirement"
                    id="specialRequirement">

                    <i class="fa-solid fa-circle"></i>

                    At least one special character
                    (@ # $ ! % * ? &)

                </div>


            </div>


            <!-- ==============================
                 CONFIRM PASSWORD
                 ============================== -->

            <div class="form-group">


                <label for="cpassword">

                    <i class="fa-solid fa-shield-halved"></i>

                    Confirm Password

                </label>


                <div class="input-wrapper">


                    <input
                        type="password"
                        id="cpassword"
                        name="cpassword"
                        placeholder="Confirm new password"
                        minlength="8"
                        maxlength="50"
                        autocomplete="new-password"
                        required
                    >


                    <span class="input-icon">

                        <i class="fa-solid fa-shield-halved"></i>

                    </span>


                    <span
                        class="toggle-password"
                        onclick="togglePassword(
                            'cpassword',
                            'confirmEye'
                        )">


                        <i
                            id="confirmEye"
                            class="fa-regular fa-eye">
                        </i>


                    </span>


                </div>


                <div
                    class="match-message"
                    id="matchMessage">
                </div>


            </div>


            <!-- ==============================
                 RESET BUTTON
                 ============================== -->

            <button
                type="submit"
                class="reset-btn"
                id="resetButton">


                <i class="fa-solid fa-key"></i>


                <span id="buttonText">

                    Change Password

                </span>


            </button>


        </form>


        <!-- ==================================
             FOOTER
             ================================== -->

        <div class="reset-footer">


            <a
                href="<%= request.getContextPath() %>/login.jsp">


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
    // AOS
    // ==========================================

    AOS.init({

        duration: 800,

        easing: 'ease-out',

        once: true,

        offset: 50

    });


    // ==========================================
    // ELEMENTS
    // ==========================================

    const password =
        document.getElementById(
            "password"
        );


    const confirmPassword =
        document.getElementById(
            "cpassword"
        );


    const resetForm =
        document.getElementById(
            "resetForm"
        );


    const resetButton =
        document.getElementById(
            "resetButton"
        );


    const buttonText =
        document.getElementById(
            "buttonText"
        );


    const matchMessage =
        document.getElementById(
            "matchMessage"
        );


    // ==========================================
    // PASSWORD SHOW / HIDE
    // ==========================================

    function togglePassword(
        inputId,
        eyeId
    ) {


        const input =
            document.getElementById(
                inputId
            );


        const eye =
            document.getElementById(
                eyeId
            );


        if (input.type === "password") {


            input.type = "text";


            eye.classList.remove(
                "fa-eye"
            );


            eye.classList.add(
                "fa-eye-slash"
            );


        } else {


            input.type = "password";


            eye.classList.remove(
                "fa-eye-slash"
            );


            eye.classList.add(
                "fa-eye"
            );

        }

    }


    // ==========================================
    // PASSWORD REQUIREMENTS
    // ==========================================

    function setRequirement(
        elementId,
        valid
    ) {


        const element =
            document.getElementById(
                elementId
            );


        const icon =
            element.querySelector(
                "i"
            );


        if (valid) {


            element.classList.add(
                "valid"
            );


            icon.className =
                "fa-solid fa-circle-check";


        } else {


            element.classList.remove(
                "valid"
            );


            icon.className =
                "fa-solid fa-circle";

        }

    }


    function validatePassword() {


        const value =
            password.value;


        const lengthValid =
            value.length >= 8
            && value.length <= 50;


        const upperValid =
            /[A-Z]/.test(value);


        const lowerValid =
            /[a-z]/.test(value);


        const numberValid =
            /\d/.test(value);


        const specialValid =
            /[@#$!%*?&]/.test(value);


        setRequirement(
            "lengthRequirement",
            lengthValid
        );


        setRequirement(
            "upperRequirement",
            upperValid
        );


        setRequirement(
            "lowerRequirement",
            lowerValid
        );


        setRequirement(
            "numberRequirement",
            numberValid
        );


        setRequirement(
            "specialRequirement",
            specialValid
        );


        return (
            lengthValid
            && upperValid
            && lowerValid
            && numberValid
            && specialValid
        );

    }


    // ==========================================
    // PASSWORD MATCH CHECK
    // ==========================================

    function checkPasswordMatch() {


        if (
            confirmPassword.value.length === 0
        ) {


            matchMessage.textContent =
                "";


            matchMessage.className =
                "match-message";


            return false;

        }


        if (
            password.value
            === confirmPassword.value
        ) {


            matchMessage.textContent =
                "Passwords match";


            matchMessage.className =
                "match-message match-success";


            return true;


        } else {


            matchMessage.textContent =
                "Passwords do not match";


            matchMessage.className =
                "match-message match-error";


            return false;

        }

    }


    // ==========================================
    // EVENTS
    // ==========================================

    password.addEventListener(
        "input",
        function () {


            validatePassword();


            if (
                confirmPassword.value.length > 0
            ) {


                checkPasswordMatch();

            }

        }
    );


    confirmPassword.addEventListener(
        "input",
        checkPasswordMatch
    );


    // ==========================================
    // FORM SUBMIT
    // ==========================================

    resetForm.addEventListener(
        "submit",
        function (event) {


            const passwordValid =
                validatePassword();


            const passwordsMatch =
                checkPasswordMatch();


            if (
                !passwordValid
                || !passwordsMatch
            ) {


                event.preventDefault();


                return;

            }


            /*
             * Prevent double-click / duplicate
             * password reset requests.
             */
            resetButton.disabled =
                true;


            buttonText.textContent =
                "Changing Password...";

        }
    );


    // ==========================================
    // AUTO FOCUS
    // ==========================================

    document.addEventListener(
        "DOMContentLoaded",
        function () {


            password.focus();

        }
    );

</script>


</body>

</html>