package com.wild_tour.servlet;

import java.io.IOException;

import com.wild_tour.dao.UserDAO;
import com.wild_tour.dao.UserDAOImpl;
import com.wild_tour.dto.User;
import com.wild_tour.util.EmailService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Signup extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        try {

            // ==========================================
            // 1. GET FORM VALUES
            // ==========================================

            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phoneInput = req.getParameter("phone");
            String password = req.getParameter("pass");
            String confirmPassword = req.getParameter("cpass");
            String address = req.getParameter("address");


            // ==========================================
            // 2. CLEAN BASIC VALUES
            // ==========================================

            if (name != null) {
                name = name.trim();
            }

            if (email != null) {
                email = email.trim();
            }

            if (address != null) {
                address = address.trim();
            }


            // ==========================================
            // 3. CHECK REQUIRED FIELDS
            // ==========================================

            if (name == null
                    || name.isEmpty()
                    || email == null
                    || email.isEmpty()
                    || phoneInput == null
                    || phoneInput.trim().isEmpty()
                    || password == null
                    || password.isEmpty()
                    || confirmPassword == null
                    || confirmPassword.isEmpty()
                    || address == null
                    || address.isEmpty()) {

                sendError(
                        req,
                        resp,
                        "All fields are required."
                );

                return;
            }


            // ==========================================
            // 4. PASSWORD MATCH CHECK
            // ==========================================

            if (!password.equals(confirmPassword)) {

                sendError(
                        req,
                        resp,
                        "Passwords do not match."
                );

                return;
            }


            // ==========================================
            // 5. PASSWORD LENGTH CHECK
            // ==========================================

            if (password.length() < 8
                    || password.length() > 50) {

                sendError(
                        req,
                        resp,
                        "Password must be between 8 and 50 characters."
                );

                return;
            }


            // ==========================================
            // 6. STRONG PASSWORD VALIDATION
            // ==========================================

            String passwordRegex =
                    "^(?=.*[a-z])"
                    + "(?=.*[A-Z])"
                    + "(?=.*\\d)"
                    + "(?=.*[@#$!%*?&])"
                    + ".{8,50}$";

            if (!password.matches(passwordRegex)) {

                sendError(
                        req,
                        resp,
                        "Password must contain uppercase, lowercase, number and special character (@ # $ ! % * ? &)."
                );

                return;
            }


            // ==========================================
            // 7. CLEAN PHONE NUMBER
            // ==========================================

            String cleanedPhone =
                    phoneInput.replaceAll(
                            "[^0-9]",
                            ""
                    );


            if (cleanedPhone.isEmpty()) {

                sendError(
                        req,
                        resp,
                        "Please enter a valid phone number."
                );

                return;
            }


            long phone;

            try {

                phone =
                        Long.parseLong(
                                cleanedPhone
                        );

            } catch (NumberFormatException e) {

                sendError(
                        req,
                        resp,
                        "Please enter a valid phone number."
                );

                return;
            }


            // ==========================================
            // 8. CREATE DAO
            // ==========================================

            UserDAO userDAO =
                    new UserDAOImpl();


            // ==========================================
            // 9. CHECK EMAIL ALREADY EXISTS
            // ==========================================

            if (userDAO.isEmailExists(email)) {

                sendError(
                        req,
                        resp,
                        "An account with this email already exists."
                );

                return;
            }


            // ==========================================
            // 10. CREATE USER OBJECT
            // ==========================================

            User user =
                    new User();

            user.setUser_name(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(password);
            user.setAddress(address);


            // ==========================================
            // 11. INSERT USER INTO DATABASE
            // ==========================================

            boolean inserted =
                    userDAO.insertUser(user);


            // ==========================================
            // 12. REGISTRATION SUCCESS
            // ==========================================

            if (inserted) {

                /*
                 * Send account-created email.
                 *
                 * IMPORTANT:
                 * Registration must remain successful
                 * even if Gmail/SMTP temporarily fails.
                 */
                try {

                    boolean emailSent =
                            EmailService.sendAccountCreated(
                                    email,
                                    name
                            );


                    if (emailSent) {

                        System.out.println(
                                "Account creation email sent to: "
                                + email
                        );

                    } else {

                        System.err.println(
                                "Account created, but welcome email "
                                + "could not be sent to: "
                                + email
                        );
                    }

                } catch (Exception emailException) {

                    System.err.println(
                            "Account created successfully, "
                            + "but welcome email failed."
                    );

                    emailException.printStackTrace();
                }


                // ======================================
                // SUCCESS MESSAGE
                // ======================================

                req.setAttribute(
                        "success",
                        "Registration successful. Please login."
                );


                // ======================================
                // GO TO LOGIN PAGE
                // ======================================

                RequestDispatcher rd =
                        req.getRequestDispatcher(
                                "login.jsp"
                        );

                rd.forward(
                        req,
                        resp
                );

                return;
            }


            // ==========================================
            // 13. DATABASE INSERT FAILED
            // ==========================================

            sendError(
                    req,
                    resp,
                    "Failed to create account. Please try again."
            );


        } catch (Exception e) {

            // ==========================================
            // 14. UNEXPECTED ERROR
            // ==========================================

            e.printStackTrace();

            sendError(
                    req,
                    resp,
                    "Something went wrong. Please try again."
            );
        }
    }


    // ==========================================
    // SEND ERROR TO SIGNUP PAGE
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
                "signup.jsp"
        ).forward(
                req,
                resp
        );
    }
}