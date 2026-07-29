package com.wild_tour.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/verify-otp")
public class VerifyOTP extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        // ==========================================
        // 1. GET EXISTING SESSION
        // ==========================================
        HttpSession session =
                req.getSession(false);

        if (session == null) {

            resp.sendRedirect(
                    req.getContextPath()
                    + "/forgot.jsp"
            );

            return;
        }


        // ==========================================
        // 2. GET SESSION DATA
        // ==========================================
        String resetEmail =
                (String) session.getAttribute(
                        "resetEmail"
                );

        String storedOTP =
                (String) session.getAttribute(
                        "resetOTP"
                );

        Long otpExpiry =
                (Long) session.getAttribute(
                        "otpExpiry"
                );


        // ==========================================
        // 3. CHECK RESET REQUEST EXISTS
        // ==========================================
        if (resetEmail == null
                || storedOTP == null
                || otpExpiry == null) {

            clearOTPData(session);

            resp.sendRedirect(
                    req.getContextPath()
                    + "/forgot.jsp"
            );

            return;
        }


        // ==========================================
        // 4. CHECK OTP EXPIRY
        // ==========================================
        if (System.currentTimeMillis()
                > otpExpiry) {

            clearOTPData(session);

            req.setAttribute(
                    "error",
                    "OTP has expired. Please request a new OTP."
            );

            req.getRequestDispatcher(
                    "/forgot.jsp"
            ).forward(
                    req,
                    resp
            );

            return;
        }


        // ==========================================
        // 5. GET OTP ENTERED BY USER
        // ==========================================
        String enteredOTP =
                req.getParameter("otp");

        if (enteredOTP != null) {

            enteredOTP =
                    enteredOTP.trim();
        }


        // ==========================================
        // 6. VALIDATE OTP INPUT
        // ==========================================
        if (enteredOTP == null
                || enteredOTP.isEmpty()) {

            sendOTPError(
                    req,
                    resp,
                    "Please enter the OTP."
            );

            return;
        }


        // ==========================================
        // 7. CHECK 6-DIGIT FORMAT
        // ==========================================
        if (!enteredOTP.matches("\\d{6}")) {

            sendOTPError(
                    req,
                    resp,
                    "Please enter a valid 6-digit OTP."
            );

            return;
        }


        // ==========================================
        // 8. VERIFY OTP
        // ==========================================
        if (!storedOTP.equals(enteredOTP)) {

            sendOTPError(
                    req,
                    resp,
                    "Invalid OTP. Please try again."
            );

            return;
        }


        // ==========================================
        // 9. OTP VERIFIED SUCCESSFULLY
        // ==========================================
        session.setAttribute(
                "otpVerified",
                true
        );


        /*
         * OTP has already been used successfully.
         * Remove OTP itself so it cannot be reused.
         *
         * Keep resetEmail and otpVerified because
         * ResetPassword servlet needs them.
         */
        session.removeAttribute(
                "resetOTP"
        );

        session.removeAttribute(
                "otpExpiry"
        );


        // ==========================================
        // 10. REDIRECT TO RESET PASSWORD PAGE
        // ==========================================
        resp.sendRedirect(
                req.getContextPath()
                + "/reset-password.jsp"
        );
    }


    // ==========================================
    // PREVENT DIRECT GET REQUEST
    // ==========================================
    @Override
    protected void doGet(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        resp.sendRedirect(
                req.getContextPath()
                + "/forgot.jsp"
        );
    }


    // ==========================================
    // SEND ERROR BACK TO OTP PAGE
    // ==========================================
    private void sendOTPError(
            HttpServletRequest req,
            HttpServletResponse resp,
            String message)
            throws ServletException, IOException {

        req.setAttribute(
                "error",
                message
        );

        req.getRequestDispatcher(
                "/verify-otp.jsp"
        ).forward(
                req,
                resp
        );
    }


    // ==========================================
    // CLEAR INVALID / EXPIRED OTP DATA
    // ==========================================
    private void clearOTPData(
            HttpSession session) {

        session.removeAttribute(
                "resetEmail"
        );

        session.removeAttribute(
                "resetOTP"
        );

        session.removeAttribute(
                "otpExpiry"
        );

        session.removeAttribute(
                "otpVerified"
        );
    }
}