package com.wild_tour.servlet;

import java.io.IOException;
import java.security.SecureRandom;

import com.wild_tour.dao.UserDAO;
import com.wild_tour.dao.UserDAOImpl;
import com.wild_tour.util.EmailService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgot")
public class ForgotPassword extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ==========================================
    // OTP VALID FOR 100 SECONDS
    // ==========================================
    private static final long OTP_VALIDITY =
            100 * 1000L;

    private final SecureRandom secureRandom =
            new SecureRandom();


    // ==========================================
    // HANDLE FORGOT PASSWORD REQUEST
    // ==========================================
    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {

            // ======================================
            // 1. GET EMAIL
            // ======================================
            String email =
                    req.getParameter("email");

            if (email != null) {
                email = email.trim();
            }


            // ======================================
            // 2. VALIDATE EMAIL
            // ======================================
            if (email == null
                    || email.isEmpty()) {

                sendError(
                        req,
                        resp,
                        "Please enter your registered email address."
                );

                return;
            }


            // ======================================
            // 3. CREATE DAO
            // ======================================
            UserDAO udao =
                    new UserDAOImpl();


            // ======================================
            // 4. CHECK EMAIL EXISTS
            // ======================================
            if (!udao.isEmailExists(email)) {

                sendError(
                        req,
                        resp,
                        "No account found with this email address."
                );

                return;
            }


            // ======================================
            // 5. GENERATE 6-DIGIT OTP
            // ======================================
            int otpNumber =
                    100000
                    + secureRandom.nextInt(900000);

            String otp =
                    String.valueOf(otpNumber);


            // ======================================
            // 6. SEND OTP EMAIL
            // ======================================
            boolean emailSent =
                    EmailService.sendOTP(
                            email,
                            otp
                    );


            // ======================================
            // 7. EMAIL FAILED
            // ======================================
            if (!emailSent) {

                sendError(
                        req,
                        resp,
                        "Unable to send OTP. Please try again."
                );

                return;
            }


            // ======================================
            // 8. CREATE / GET SESSION
            // ======================================
            HttpSession session =
                    req.getSession();


            // ======================================
            // 9. STORE RESET INFORMATION
            // ======================================
            session.setAttribute(
                    "resetEmail",
                    email
            );

            session.setAttribute(
                    "resetOTP",
                    otp
            );

            session.setAttribute(
                    "otpExpiry",
                    System.currentTimeMillis()
                    + OTP_VALIDITY
            );

            /*
             * OTP is not verified yet.
             * User cannot directly access
             * reset-password.jsp.
             */
            session.setAttribute(
                    "otpVerified",
                    false
            );


            // ======================================
            // 10. REDIRECT TO OTP PAGE
            // ======================================
            resp.sendRedirect(
                    req.getContextPath()
                    + "/verify-otp.jsp"
            );


        } catch (Exception e) {

            e.printStackTrace();

            sendError(
                    req,
                    resp,
                    "Something went wrong. Please try again."
            );
        }
    }


    // ==========================================
    // HANDLE DIRECT GET REQUEST
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
    // SEND ERROR BACK TO FORGOT PAGE
    // ==========================================
    private void sendError(
            HttpServletRequest req,
            HttpServletResponse resp,
            String message)
            throws ServletException, IOException {

        req.setAttribute(
                "error",
                message
        );

        req.getRequestDispatcher(
                "/forgot.jsp"
        ).forward(
                req,
                resp
        );
    }
}