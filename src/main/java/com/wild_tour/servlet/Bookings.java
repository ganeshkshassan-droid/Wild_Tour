package com.wild_tour.servlet;

import java.io.IOException;
import java.sql.Date;

import com.wild_tour.dao.BookingDAO;
import com.wild_tour.dao.BookingDAOImpl;
import com.wild_tour.dto.Booking;
import com.wild_tour.dto.User;
import com.wild_tour.util.EmailService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BookingServlet")
public class Bookings extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Booking b = new Booking();
        BookingDAO bDAO = new BookingDAOImpl();

        try {

            // ================================
            // USER DETAILS
            // ================================

            b.setUser_id(user.getUserId());

            b.setTourist_name(
                    request.getParameter("touristName")
            );


            // ================================
            // ITEM DETAILS
            // ================================

            String itemType =
                    request.getParameter("itemType");

            b.setItem_type(itemType);

            b.setItem_name(
                    request.getParameter("itemName")
            );

            b.setItem_image(
                    request.getParameter("imageURL")
            );


            // ================================
            // NUMBER OF PERSONS
            // ================================

            int persons = Integer.parseInt(
                    request.getParameter("numPersons")
            );

            b.setNum_persons(persons);


            // ================================
            // PAYMENT
            // ================================

            b.setPayment_mode(
                    request.getParameter("paymentMode")
            );

            b.setStatus("Booked");


            // ================================
            // SAFARI / GUIDE
            // ================================

            if ("Safari".equalsIgnoreCase(itemType)
                    || "Guide".equalsIgnoreCase(itemType)) {

                String bookingDateStr =
                        request.getParameter("bookingDate");

                if (bookingDateStr == null
                        || bookingDateStr.trim().isEmpty()) {

                    request.setAttribute(
                            "error",
                            "Please select booking date."
                    );

                    request.getRequestDispatcher("booking.jsp")
                            .forward(request, response);

                    return;
                }

                b.setBooking_date(
                        Date.valueOf(bookingDateStr)
                );

                double totalPrice =
                        Double.parseDouble(
                                request.getParameter("totalPrice")
                        );

                b.setTotal_price(totalPrice);
            }


            // ================================
            // STAY / PACKAGE
            // ================================

            else if ("Stay".equalsIgnoreCase(itemType)
                    || "Package".equalsIgnoreCase(itemType)) {

                String fromDateStr =
                        request.getParameter("fromDate");

                String toDateStr =
                        request.getParameter("toDate");


                if (fromDateStr == null
                        || fromDateStr.trim().isEmpty()
                        || toDateStr == null
                        || toDateStr.trim().isEmpty()) {

                    request.setAttribute(
                            "error",
                            "Please select From Date and To Date."
                    );

                    request.getRequestDispatcher("booking.jsp")
                            .forward(request, response);

                    return;
                }


                Date fromDate =
                        Date.valueOf(fromDateStr);

                Date toDate =
                        Date.valueOf(toDateStr);


                b.setFrom_date(fromDate);
                b.setTo_date(toDate);


                long milliseconds =
                        toDate.getTime()
                                - fromDate.getTime();


                long days =
                        milliseconds
                                / (1000L * 60 * 60 * 24);


                if (days <= 0) {

                    request.setAttribute(
                            "error",
                            "To Date must be after From Date."
                    );

                    request.getRequestDispatcher("booking.jsp")
                            .forward(request, response);

                    return;
                }


                double submittedTotal =
                        Double.parseDouble(
                                request.getParameter("totalPrice")
                        );


                double basePrice =
                        submittedTotal
                                / (persons * days);


                double finalPrice =
                        basePrice
                                * persons
                                * days;


                b.setTotal_price(finalPrice);
            }


            // ================================
            // SAVE BOOKING
            // ================================

            boolean bookingSaved =
                    bDAO.insertBooking(b);


            if (bookingSaved) {

                System.out.println(
                        "Booking saved successfully."
                );


                // ================================
                // SEND CONFIRMATION EMAIL
                // ================================

                try {

                    String receiverEmail =
                            user.getEmail();

                    String customerName =
                            user.getUser_name();


                    System.out.println(
                            "Sending booking email to: "
                                    + receiverEmail
                    );


                    boolean emailSent =
                            EmailService.sendBookingConfirmation(
                                    receiverEmail,
                                    customerName,
                                    b
                            );


                    if (emailSent) {

                        System.out.println(
                                "Booking confirmation email sent successfully."
                        );

                    } else {

                        System.err.println(
                                "Booking saved, but email could not be sent."
                        );
                    }

                } catch (Exception emailException) {

                    /*
                     * IMPORTANT:
                     *
                     * Email failure should NOT
                     * cancel a successful booking.
                     */

                    System.err.println(
                            "Booking saved, but email sending failed."
                    );

                    emailException.printStackTrace();
                }


                // Prevent duplicate booking on refresh
                response.sendRedirect("myTrip.jsp");

                return;
            }


            // ================================
            // BOOKING FAILED
            // ================================

            System.err.println(
                    "Failed to save booking."
            );

            response.sendRedirect("booking.jsp");


        } catch (Exception e) {

            System.err.println(
                    "Error while processing booking."
            );

            e.printStackTrace();

            response.sendRedirect("booking.jsp");
        }
    }
}