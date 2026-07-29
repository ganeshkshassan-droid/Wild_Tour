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

    // ==========================================
    // RENDER ENVIRONMENT VARIABLES
    // ==========================================

    private static final String SENDER_EMAIL =
            System.getenv("MAIL_USERNAME");

    private static final String APP_PASSWORD =
            System.getenv("MAIL_PASSWORD");

    private static final String SMTP_HOST =
            "smtp.gmail.com";

    private static final String SMTP_PORT =
            "587";


    // Prevent object creation
    private EmailService() {
    }


    // ==========================================
    // CREATE MAIL SESSION
    // ==========================================

    private static Session createMailSession() {

        if (!isEmailConfigured()) {
            return null;
        }

        Properties properties =
                new Properties();

        properties.put(
                "mail.smtp.auth",
                "true"
        );

        properties.put(
                "mail.smtp.starttls.enable",
                "true"
        );

        properties.put(
                "mail.smtp.starttls.required",
                "true"
        );

        properties.put(
                "mail.smtp.host",
                SMTP_HOST
        );

        properties.put(
                "mail.smtp.port",
                SMTP_PORT
        );


        return Session.getInstance(
                properties,
                new Authenticator() {

                    @Override
                    protected PasswordAuthentication
                    getPasswordAuthentication() {

                        return new PasswordAuthentication(
                                SENDER_EMAIL,
                                APP_PASSWORD
                        );
                    }
                }
        );
    }


    // ==========================================
    // CHECK EMAIL CONFIGURATION
    // ==========================================

    private static boolean isEmailConfigured() {

        if (SENDER_EMAIL == null
                || SENDER_EMAIL.trim().isEmpty()) {

            System.err.println(
                    "MAIL_USERNAME environment variable is missing."
            );

            return false;
        }


        if (APP_PASSWORD == null
                || APP_PASSWORD.trim().isEmpty()) {

            System.err.println(
                    "MAIL_PASSWORD environment variable is missing."
            );

            return false;
        }


        return true;
    }


    // ==========================================
    // COMMON SEND METHOD
    // ==========================================

    private static boolean sendHtmlEmail(
            String receiverEmail,
            String subject,
            String htmlContent) {

        if (receiverEmail == null
                || receiverEmail.trim().isEmpty()) {

            System.err.println(
                    "Receiver email is missing."
            );

            return false;
        }


        Session session =
                createMailSession();


        if (session == null) {

            return false;
        }


        try {

            MimeMessage message =
                    new MimeMessage(session);


            message.setFrom(
                    new InternetAddress(
                            SENDER_EMAIL,
                            "Wild Tour"
                    )
            );


            message.setRecipient(
                    Message.RecipientType.TO,
                    new InternetAddress(
                            receiverEmail.trim()
                    )
            );


            message.setSubject(
                    subject,
                    "UTF-8"
            );


            message.setContent(
                    htmlContent,
                    "text/html; charset=UTF-8"
            );


            Transport.send(message);


            System.out.println(
                    "Email sent successfully to: "
                    + receiverEmail
            );


            return true;


        } catch (Exception e) {

            System.err.println(
                    "Failed to send email to: "
                    + receiverEmail
            );

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // 1. SEND PASSWORD RESET OTP
    // ==========================================

    public static boolean sendOTP(
            String receiverEmail,
            String otp) {

        if (otp == null
                || otp.trim().isEmpty()) {

            return false;
        }


        String htmlContent =
                "<!DOCTYPE html>"
                + "<html>"
                + "<body style='"
                + "font-family:Arial,sans-serif;"
                + "background:#f4f7f4;"
                + "padding:30px;"
                + "'>"

                + "<div style='"
                + "max-width:520px;"
                + "margin:auto;"
                + "background:white;"
                + "padding:35px;"
                + "border-radius:15px;"
                + "box-shadow:0 5px 20px rgba(0,0,0,0.08);"
                + "'>"

                + "<h2 style='"
                + "color:#1b5e20;"
                + "margin-bottom:10px;"
                + "'>"
                + "Wild Tour"
                + "</h2>"

                + "<h3>"
                + "Password Reset Verification"
                + "</h3>"

                + "<p>"
                + "We received a request to reset "
                + "your Wild Tour account password."
                + "</p>"

                + "<p>"
                + "Use the following verification code:"
                + "</p>"

                + "<div style='"
                + "font-size:32px;"
                + "font-weight:bold;"
                + "letter-spacing:8px;"
                + "color:#2e7d32;"
                + "background:#f1f8e9;"
                + "padding:18px;"
                + "text-align:center;"
                + "border-radius:10px;"
                + "margin:25px 0;"
                + "'>"

                + escapeHtml(otp)

                + "</div>"

                + "<p style='color:#555;'>"
                + "This OTP is valid for "
                + "<strong>100 seconds</strong>."
                + "</p>"

                + "<p style='"
                + "color:#777;"
                + "font-size:13px;"
                + "'>"
                + "If you did not request a password reset, "
                + "you can safely ignore this email."
                + "</p>"

                + "<hr style='"
                + "border:none;"
                + "border-top:1px solid #eee;"
                + "margin:25px 0;"
                + "'>"

                + "<p style='"
                + "font-size:12px;"
                + "color:#999;"
                + "'>"
                + "This is an automated security message "
                + "from Wild Tour."
                + "</p>"

                + "</div>"

                + "</body>"
                + "</html>";


        return sendHtmlEmail(
                receiverEmail,
                "Wild Tour - Password Reset OTP",
                htmlContent
        );
    }


    // ==========================================
    // 2. ACCOUNT CREATED / SIGNUP EMAIL
    // ==========================================

    public static boolean sendAccountCreated(
            String receiverEmail,
            String userName) {

        String safeName =
                escapeHtml(userName);


        String htmlContent =
                "<!DOCTYPE html>"
                + "<html>"
                + "<body style='"
                + "font-family:Arial,sans-serif;"
                + "background:#f4f7f4;"
                + "padding:30px;"
                + "'>"

                + "<div style='"
                + "max-width:560px;"
                + "margin:auto;"
                + "background:white;"
                + "padding:35px;"
                + "border-radius:15px;"
                + "box-shadow:0 5px 20px rgba(0,0,0,0.08);"
                + "'>"

                + "<h2 style='color:#1b5e20;'>"
                + "Wild Tour"
                + "</h2>"

                + "<h3>"
                + "Welcome to Wild Tour!"
                + "</h3>"

                + "<p>Hello <strong>"
                + safeName
                + "</strong>,</p>"

                + "<p>"
                + "Your Wild Tour account has been "
                + "created successfully."
                + "</p>"

                + "<p>"
                + "You can now explore wildlife tours, "
                + "safaris, guides, stays and packages."
                + "</p>"

                + "<hr style='"
                + "border:none;"
                + "border-top:1px solid #eee;"
                + "margin:25px 0;"
                + "'>"

                + "<p style='"
                + "color:#777;"
                + "font-size:13px;"
                + "'>"
                + "Thank you for joining Wild Tour."
                + "</p>"

                + "</div>"

                + "</body>"
                + "</html>";


        return sendHtmlEmail(
                receiverEmail,
                "Welcome to Wild Tour - Account Created Successfully",
                htmlContent
        );
    }


    // ==========================================
    // 3. BOOKING CONFIRMATION EMAIL
    // ==========================================

    public static boolean sendBookingConfirmation(
            String receiverEmail,
            String userName,
            Booking booking) {

        if (booking == null) {

            return false;
        }


        StringBuilder emailBody =
                new StringBuilder();


        emailBody.append(
                "<!DOCTYPE html>"
        );

        emailBody.append(
                "<html>"
        );

        emailBody.append(
                "<body style='"
                + "font-family:Arial,sans-serif;"
                + "background:#f4f7f4;"
                + "padding:30px;"
                + "'>"
        );

        emailBody.append(
                "<div style='"
                + "max-width:600px;"
                + "margin:auto;"
                + "background:white;"
                + "padding:30px;"
                + "border-radius:12px;"
                + "box-shadow:0 5px 20px rgba(0,0,0,0.08);"
                + "'>"
        );

        emailBody.append(
                "<h2 style='color:#2e7d32;'>"
                + "Wild Tour"
                + "</h2>"
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
                "<p>"
                + "Your booking has been confirmed successfully."
                + "</p>"
        );

        emailBody.append(
                "<hr>"
        );


        // Tourist Name
        emailBody.append(
                "<p><strong>Tourist Name:</strong> "
        );

        emailBody.append(
                escapeHtml(
                        booking.getTourist_name()
                )
        );

        emailBody.append(
                "</p>"
        );


        // Service
        emailBody.append(
                "<p><strong>Service:</strong> "
        );

        emailBody.append(
                escapeHtml(
                        booking.getItem_name()
                )
        );

        emailBody.append(
                "</p>"
        );


        // Type
        emailBody.append(
                "<p><strong>Type:</strong> "
        );

        emailBody.append(
                escapeHtml(
                        booking.getItem_type()
                )
        );

        emailBody.append(
                "</p>"
        );


        // Persons
        emailBody.append(
                "<p><strong>Number of Persons:</strong> "
        );

        emailBody.append(
                booking.getNum_persons()
        );

        emailBody.append(
                "</p>"
        );


        // Date for Safari / Guide
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


        // From Date
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


        // To Date
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


        // Price
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


        // Payment Mode
        emailBody.append(
                "<p><strong>Payment Mode:</strong> "
        );

        emailBody.append(
                escapeHtml(
                        booking.getPayment_mode()
                )
        );

        emailBody.append(
                "</p>"
        );


        // Status
        emailBody.append(
                "<p><strong>Status:</strong> "
        );

        emailBody.append(
                escapeHtml(
                        booking.getStatus()
                )
        );

        emailBody.append(
                "</p>"
        );


        emailBody.append(
                "<hr>"
        );

        emailBody.append(
                "<p>"
                + "Thank you for choosing Wild Tour."
                + "</p>"
        );

        emailBody.append(
                "<p style='"
                + "color:#777;"
                + "font-size:13px;"
                + "'>"
                + "This is an automated booking "
                + "confirmation email."
                + "</p>"
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


        return sendHtmlEmail(
                receiverEmail,
                "Wild Tour - Booking Confirmation",
                emailBody.toString()
        );
    }


    // ==========================================
    // 4. BOOKING CANCELLATION EMAIL
    // ==========================================

    public static boolean sendBookingCancellation(
            String receiverEmail,
            String userName,
            Booking booking) {

        if (booking == null) {

            return false;
        }


        StringBuilder emailBody =
                new StringBuilder();


        emailBody.append(
                "<!DOCTYPE html>"
        );

        emailBody.append(
                "<html>"
        );

        emailBody.append(
                "<body style='"
                + "font-family:Arial,sans-serif;"
                + "background:#f4f7f4;"
                + "padding:30px;"
                + "'>"
        );

        emailBody.append(
                "<div style='"
                + "max-width:600px;"
                + "margin:auto;"
                + "background:white;"
                + "padding:30px;"
                + "border-radius:12px;"
                + "box-shadow:0 5px 20px rgba(0,0,0,0.08);"
                + "'>"
        );

        emailBody.append(
                "<h2 style='color:#1b5e20;'>"
                + "Wild Tour"
                + "</h2>"
        );

        emailBody.append(
                "<h3 style='color:#c62828;'>"
                + "Booking Cancelled"
                + "</h3>"
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
                "<p>"
                + "Your booking has been cancelled successfully."
                + "</p>"
        );

        emailBody.append(
                "<hr>"
        );


        emailBody.append(
                "<p><strong>Service:</strong> "
        );

        emailBody.append(
                escapeHtml(
                        booking.getItem_name()
                )
        );

        emailBody.append(
                "</p>"
        );


        emailBody.append(
                "<p><strong>Type:</strong> "
        );

        emailBody.append(
                escapeHtml(
                        booking.getItem_type()
                )
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
                "<p><strong>Status:</strong> Cancelled</p>"
        );


        emailBody.append(
                "<hr>"
        );

        emailBody.append(
                "<p>"
                + "We hope to welcome you on another "
                + "Wild Tour adventure soon."
                + "</p>"
        );

        emailBody.append(
                "<p style='"
                + "color:#777;"
                + "font-size:13px;"
                + "'>"
                + "This is an automated booking "
                + "cancellation email."
                + "</p>"
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


        return sendHtmlEmail(
                receiverEmail,
                "Wild Tour - Booking Cancelled",
                emailBody.toString()
        );
    }


    // ==========================================
    // 5. PASSWORD CHANGED EMAIL
    // ==========================================

    public static boolean sendPasswordChanged(
            String receiverEmail) {

        String htmlContent =
                "<!DOCTYPE html>"
                + "<html>"
                + "<body style='"
                + "font-family:Arial,sans-serif;"
                + "background:#f4f7f4;"
                + "padding:30px;"
                + "'>"

                + "<div style='"
                + "max-width:560px;"
                + "margin:auto;"
                + "background:white;"
                + "padding:35px;"
                + "border-radius:15px;"
                + "box-shadow:0 5px 20px rgba(0,0,0,0.08);"
                + "'>"

                + "<h2 style='color:#1b5e20;'>"
                + "Wild Tour"
                + "</h2>"

                + "<h3>"
                + "Password Changed Successfully"
                + "</h3>"

                + "<p>"
                + "The password for your Wild Tour account "
                + "has been changed successfully."
                + "</p>"

                + "<p>"
                + "You can now login using your new password."
                + "</p>"

                + "<p style='"
                + "color:#c62828;"
                + "font-weight:bold;"
                + "'>"
                + "If you did not make this change, "
                + "please secure your account immediately."
                + "</p>"

                + "<hr style='"
                + "border:none;"
                + "border-top:1px solid #eee;"
                + "margin:25px 0;"
                + "'>"

                + "<p style='"
                + "color:#777;"
                + "font-size:13px;"
                + "'>"
                + "This is an automated security notification "
                + "from Wild Tour."
                + "</p>"

                + "</div>"

                + "</body>"
                + "</html>";


        return sendHtmlEmail(
                receiverEmail,
                "Wild Tour - Password Changed Successfully",
                htmlContent
        );
    }


    // ==========================================
    // ESCAPE HTML
    // ==========================================

    private static String escapeHtml(
            String value) {

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