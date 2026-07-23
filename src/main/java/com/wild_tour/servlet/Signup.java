package com.wild_tour.servlet;

import java.io.IOException;

import com.wild_tour.dao.UserDAO;
import com.wild_tour.dao.UserDAOImpl;
import com.wild_tour.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signup")
public class Signup extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {

            // Get form values
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phoneInput = req.getParameter("phone");
            String password = req.getParameter("pass");
            String confirmPassword = req.getParameter("cpass");
            String address = req.getParameter("address");

            // ================================
            // PASSWORD CHECK
            // ================================

            if (password == null || !password.equals(confirmPassword)) {

                req.setAttribute(
                        "error",
                        "Passwords do not match"
                );

                RequestDispatcher rd =
                        req.getRequestDispatcher("signup.jsp");

                rd.forward(req, resp);

                return;
            }

            // ================================
            // PHONE NUMBER CLEANING
            // ================================

            if (phoneInput == null || phoneInput.trim().isEmpty()) {

                req.setAttribute(
                        "error",
                        "Phone number is required"
                );

                req.getRequestDispatcher("signup.jsp")
                        .forward(req, resp);

                return;
            }

            /*
             * Remove spaces, hyphens and other
             * non-numeric characters.
             *
             * Example:
             *
             * 07338 203822
             *
             * becomes
             *
             * 07338203822
             */

            String cleanedPhone =
                    phoneInput.replaceAll("[^0-9]", "");

            if (cleanedPhone.isEmpty()) {

                req.setAttribute(
                        "error",
                        "Please enter a valid phone number"
                );

                req.getRequestDispatcher("signup.jsp")
                        .forward(req, resp);

                return;
            }

            long phone;

            try {

                phone = Long.parseLong(cleanedPhone);

            } catch (NumberFormatException e) {

                req.setAttribute(
                        "error",
                        "Please enter a valid phone number"
                );

                req.getRequestDispatcher("signup.jsp")
                        .forward(req, resp);

                return;
            }

            // ================================
            // CREATE USER
            // ================================

            User user = new User();

            user.setUser_name(name);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(password);
            user.setAddress(address);

            // ================================
            // SAVE USER
            // ================================

            UserDAO userDAO = new UserDAOImpl();

            boolean inserted =
                    userDAO.insertUser(user);

            if (inserted) {

                req.setAttribute(
                        "success",
                        "Registration successful. Please login."
                );

                RequestDispatcher rd =
                        req.getRequestDispatcher("login.jsp");

                rd.forward(req, resp);

            } else {

                req.setAttribute(
                        "error",
                        "Failed to create account"
                );

                RequestDispatcher rd =
                        req.getRequestDispatcher("signup.jsp");

                rd.forward(req, resp);
            }

        } catch (Exception e) {

            e.printStackTrace();

            req.setAttribute(
                    "error",
                    "Something went wrong. Please try again."
            );

            req.getRequestDispatcher("signup.jsp")
                    .forward(req, resp);
        }
    }
}