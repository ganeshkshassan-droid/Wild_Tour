package com.wild_tour.servlet;

import java.io.IOException;

import com.wild_tour.dao.UserDAO;
import com.wild_tour.dao.UserDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/reset-password")
public class ResetPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private UserDAO userDAO;

    // ==========================================
    // INITIALIZE DAO
    // ==========================================
    @Override
    public void init() throws ServletException {

        userDAO = new UserDAOImpl();
    }


    // ==========================================
    // HANDLE PASSWORD RESET
    // ==========================================
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // ==========================================
        // 1. GET EXISTING SESSION
        // ==========================================
        HttpSession session =
                request.getSession(false);

        if (session == null) {

            response.sendRedirect(
                    request.getContextPath()
                    + "/forgot.jsp"
            );

            return;
        }


        // ==========================================
        // 2. GET RESET SESSION DETAILS
        // ==========================================
        String resetEmail =
                (String) session.getAttribute(
                        "resetEmail"
                );

        Boolean otpVerified =
                (Boolean) session.getAttribute(
                        "otpVerified"
                );


        // ==========================================
        // 3. OTP MUST BE VERIFIED
        // ==========================================
        if (resetEmail == null
                || otpVerified == null
                || !otpVerified) {

            clearResetSession(session);

            response.sendRedirect(
                    request.getContextPath()
                    + "/forgot.jsp"
            );

            return;
        }


        // ==========================================
        // 4. GET PASSWORDS
        // ==========================================
        String password =
                request.getParameter(
                        "password"
                );

        String confirmPassword =
                request.getParameter(
                        "cpassword"
                );


        // ==========================================
        // 5. EMPTY FIELD CHECK
        // ==========================================
        if (password == null
                || password.trim().isEmpty()
                || confirmPassword == null
                || confirmPassword.trim().isEmpty()) {

            sendError(
                    request,
                    response,
                    "Both password fields are required."
            );

            return;
        }


        // ==========================================
        // 6. PASSWORD LENGTH
        // ==========================================
        if (password.length() < 8
                || password.length() > 50) {

            sendError(
                    request,
                    response,
                    "Password must be between 8 and 50 characters."
            );

            return;
        }


        // ==========================================
        // 7. STRONG PASSWORD VALIDATION
        // ==========================================
        String passwordRegex =
                "^(?=.*[a-z])"
                + "(?=.*[A-Z])"
                + "(?=.*\\d)"
                + "(?=.*[@#$!%*?&])"
                + ".{8,50}$";


        if (!password.matches(passwordRegex)) {

            sendError(
                    request,
                    response,
                    "Password must contain uppercase, lowercase, number and special character (@ # $ ! % * ? &)."
            );

            return;
        }


        // ==========================================
        // 8. PASSWORD MATCH CHECK
        // ==========================================
        if (!password.equals(confirmPassword)) {

            sendError(
                    request,
                    response,
                    "Password and Confirm Password do not match."
            );

            return;
        }


        // ==========================================
        // 9. CHECK USER STILL EXISTS
        // ==========================================
        if (!userDAO.isEmailExists(resetEmail)) {

            clearResetSession(session);

            response.sendRedirect(
                    request.getContextPath()
                    + "/forgot.jsp"
            );

            return;
        }


        // ==========================================
        // 10. UPDATE PASSWORD IN DATABASE
        // ==========================================
        boolean updated =
                userDAO.updatePasswordByEmail(
                        resetEmail,
                        password
                );


        // ==========================================
        // 11. SUCCESS
        // ==========================================
        if (updated) {

            /*
             * Remove OTP/reset data.
             * User cannot reuse same verified OTP.
             */
            clearResetSession(session);


            // Login page success message
            session.setAttribute(
                    "success",
                    "Password changed successfully. Please login with your new password."
            );


            // ======================================
            // REDIRECT TO LOGIN
            // ======================================
            response.sendRedirect(
                    request.getContextPath()
                    + "/login.jsp"
            );

            return;
        }


        // ==========================================
        // 12. DATABASE UPDATE FAILED
        // ==========================================
        sendError(
                request,
                response,
                "Unable to update password. Please try again."
        );
    }


    // ==========================================
    // PREVENT DIRECT GET REQUEST
    // ==========================================
    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect(
                request.getContextPath()
                + "/forgot.jsp"
        );
    }


    // ==========================================
    // FORWARD ERROR TO RESET PAGE
    // ==========================================
    private void sendError(
            HttpServletRequest request,
            HttpServletResponse response,
            String message)
            throws ServletException, IOException {

        request.setAttribute(
                "error",
                message
        );

        request.getRequestDispatcher(
                "/reset-password.jsp"
        ).forward(
                request,
                response
        );
    }


    // ==========================================
    // CLEAR OTP / RESET SESSION DATA
    // ==========================================
    private void clearResetSession(
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