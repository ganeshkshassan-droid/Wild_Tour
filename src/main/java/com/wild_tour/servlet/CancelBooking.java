package com.wild_tour.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.wild_tour.connection.Connector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/CancelBookingServlet")
public class CancelBooking extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String bookingIdStr = request.getParameter("booking_id");

        if (bookingIdStr == null || bookingIdStr.trim().isEmpty()) {
            response.sendRedirect("myTrip.jsp");
            return;
        }

        try {
            int bookingId = Integer.parseInt(bookingIdStr);

            try (
                Connection con = Connector.requestConnection();
                PreparedStatement ps = con.prepareStatement(
                    "UPDATE booking SET status = ? WHERE booking_id = ?"
                )
            ) {

                if (con == null) {
                    throw new Exception("Database connection failed");
                }

                ps.setString(1, "Cancelled");
                ps.setInt(2, bookingId);

                int rows = ps.executeUpdate();

                System.out.println(
                    "Cancel booking ID: " + bookingId +
                    ", rows updated: " + rows
                );
            }

            response.sendRedirect("myTrip.jsp");

        } catch (Exception e) {
            System.err.println("ERROR cancelling booking:");
            e.printStackTrace();

            response.sendRedirect("myTrip.jsp");
        }
    }
}