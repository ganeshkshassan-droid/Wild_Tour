package com.wild_tour.util;

import java.util.Properties;

import com.wild_tour.dto.Booking;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailService {

    public static boolean sendBookingConfirmation(
            String receiverEmail,
            String userName,
            Booking booking) {

        // Get credentials from Render Environment Variables
        final String senderEmail = System.getenv("MAIL_USERNAME");
        final String appPassword = System.getenv("MAIL_PASSWORD");

        if (senderEmail == null || senderEmail.trim().isEmpty()) {
            System.err.println("MAIL_USERNAME environment variable is missing.");
            return false;
        }

        if (appPassword == null || appPassword.trim().isEmpty()) {
            System.err.println("MAIL_PASSWORD environment variable is missing.");
            return false;
        }

        if (receiverEmail == null || receiverEmail.trim().isEmpty()) {
            System.err.println("Receiver email is missing.");
            return false;
        }

        try {

            Properties properties = new Properties();

            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");

            Session session = Session.getInstance(
                    properties,
                    new Authenticator() {

                @Override
                protected PasswordAuthentication getPasswordAuthentication() {

                    return new PasswordAuthentication(
                            senderEmail,
                            appPassword
                    );
                }
            }
            );

            MimeMessage message = new MimeMessage(session);

            message.setFrom(
                    new InternetAddress(
                            senderEmail,
                            "Wildlife Tourism"
                    )
            );

            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(receiverEmail)
            );

            message.setSubject(
                    "Wildlife Tourism - Booking Confirmation"
            );

            StringBuilder emailBody = new StringBuilder();

            emailBody.append(
                    "<!DOCTYPE html>"
            );

            emailBody.append(
                    "<html>"
            );

            emailBody.append(
                    "<body style='font-family:Arial,sans-serif;background:#f4f7f4;padding:30px;'>"
            );

            emailBody.append(
                    "<div style='max-width:600px;margin:auto;background:white;padding:30px;border-radius:12px;'>"
            );

            emailBody.append(
                    "<h2 style='color:#2e7d32;'>Wildlife Tourism</h2>"
            );

            emailBody.append(
                    "<h3>Booking Confirmation</h3>"
            );

            emailBody.append(
                    "<p>Hello <strong>"
            );

            emailBody.append(
                    escapeHtml(userName)
            );

            emailBody.append(
                    "</strong>,</p>"
            );

            emailBody.append(
                    "<p>Your booking has been confirmed successfully.</p>"
            );

            emailBody.append(
                    "<hr>"
            );

            emailBody.append(
                    "<p><strong>Booking:</strong> "
            );

            emailBody.append(
                    escapeHtml(booking.getItem_name())
            );

            emailBody.append(
                    "</p>"
            );

            emailBody.append(
                    "<p><strong>Type:</strong> "
            );

            emailBody.append(
                    escapeHtml(booking.getItem_type())
            );

            emailBody.append(
                    "</p>"
            );

            emailBody.append(
                    "<p><strong>Number of Persons:</strong> "
            );

            emailBody.append(
                    booking.getNum_persons()
            );

            emailBody.append(
                    "</p>"
            );

            emailBody.append(
                    "<p><strong>Total Amount:</strong> ₹"
            );

            emailBody.append(
                    String.format(
                            "%.2f",
                            booking.getTotal_price()
                    )
            );

            emailBody.append(
                    "</p>"
            );

            emailBody.append(
                    "<p><strong>Payment Mode:</strong> "
            );

            emailBody.append(
                    escapeHtml(booking.getPayment_mode())
            );

            emailBody.append(
                    "</p>"
            );

            emailBody.append(
                    "<p><strong>Status:</strong> "
            );

            emailBody.append(
                    escapeHtml(booking.getStatus())
            );

            emailBody.append(
                    "</p>"
            );

            // Safari / Guide booking date
            if (booking.getBooking_date() != null) {

                emailBody.append(
                        "<p><strong>Booking Date:</strong> "
                );

                emailBody.append(
                        booking.getBooking_date()
                );

                emailBody.append(
                        "</p>"
                );
            }

            // Stay / Package dates
            if (booking.getFrom_date() != null) {

                emailBody.append(
                        "<p><strong>From Date:</strong> "
                );

                emailBody.append(
                        booking.getFrom_date()
                );

                emailBody.append(
                        "</p>"
                );
            }

            if (booking.getTo_date() != null) {

                emailBody.append(
                        "<p><strong>To Date:</strong> "
                );

                emailBody.append(
                        booking.getTo_date()
                );

                emailBody.append(
                        "</p>"
                );
            }

            emailBody.append(
                    "<hr>"
            );

            emailBody.append(
                    "<p>Thank you for choosing Wildlife Tourism.</p>"
            );

            emailBody.append(
                    "<p style='color:#777;font-size:13px;'>This is an automated booking confirmation email.</p>"
            );

            emailBody.append(
                    "</div>"
            );

            emailBody.append(
                    "</body>"
            );

            emailBody.append(
                    "</html>"
            );

            message.setContent(
                    emailBody.toString(),
                    "text/html; charset=UTF-8"
            );

            Transport.send(message);

            System.out.println(
                    "Booking confirmation email sent successfully to: "
                    + receiverEmail
            );

            return true;

        } catch (Exception e) {

            System.err.println(
                    "Failed to send booking confirmation email."
            );

            e.printStackTrace();

            return false;
        }
    }

    private static String escapeHtml(String value) {

        if (value == null) {
            return "";
        }

        return value
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#39;");
    }
}
