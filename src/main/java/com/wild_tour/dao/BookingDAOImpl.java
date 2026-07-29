package com.wild_tour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wild_tour.connection.Connector;
import com.wild_tour.dto.Booking;

public class BookingDAOImpl implements BookingDAO {

    private Connection con;

    // ==========================================
    // CONSTRUCTOR
    // ==========================================
    public BookingDAOImpl() {

        this.con = Connector.requestConnection();
    }


    // ==========================================
    // INSERT BOOKING
    // ==========================================
    @Override
    public boolean insertBooking(Booking b) {

        String query =
                "INSERT INTO booking "
                + "(user_id, tourist_name, item_type, item_name, "
                + "item_image, num_persons, total_price, "
                + "payment_mode, status, booking_date, "
                + "from_date, to_date) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setInt(1, b.getUser_id());
            ps.setString(2, b.getTourist_name());
            ps.setString(3, b.getItem_type());
            ps.setString(4, b.getItem_name());
            ps.setString(5, b.getItem_image());
            ps.setInt(6, b.getNum_persons());
            ps.setDouble(7, b.getTotal_price());
            ps.setString(8, b.getPayment_mode());
            ps.setString(9, b.getStatus());
            ps.setDate(10, b.getBooking_date());
            ps.setDate(11, b.getFrom_date());
            ps.setDate(12, b.getTo_date());

            int result = ps.executeUpdate();

            return result > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // UPDATE BOOKING
    // ==========================================
    @Override
    public boolean updateBooking(Booking b) {

        String query =
                "UPDATE booking SET "
                + "user_id=?, "
                + "tourist_name=?, "
                + "item_type=?, "
                + "item_name=?, "
                + "item_image=?, "
                + "num_persons=?, "
                + "total_price=?, "
                + "payment_mode=?, "
                + "status=?, "
                + "booking_date=?, "
                + "from_date=?, "
                + "to_date=? "
                + "WHERE booking_id=?";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setInt(1, b.getUser_id());
            ps.setString(2, b.getTourist_name());
            ps.setString(3, b.getItem_type());
            ps.setString(4, b.getItem_name());
            ps.setString(5, b.getItem_image());
            ps.setInt(6, b.getNum_persons());
            ps.setDouble(7, b.getTotal_price());
            ps.setString(8, b.getPayment_mode());
            ps.setString(9, b.getStatus());
            ps.setDate(10, b.getBooking_date());
            ps.setDate(11, b.getFrom_date());
            ps.setDate(12, b.getTo_date());
            ps.setInt(13, b.getBooking_id());

            int result = ps.executeUpdate();

            return result > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // DELETE BOOKING
    // ==========================================
    @Override
    public boolean deleteBooking(int bookingId) {

        String query =
                "DELETE FROM booking "
                + "WHERE booking_id=?";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setInt(1, bookingId);

            int result = ps.executeUpdate();

            return result > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // GET BOOKING BY ID
    // ==========================================
    @Override
    public Booking getBooking(int bookingId) {

        String query =
                "SELECT * FROM booking "
                + "WHERE booking_id=?";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setInt(1, bookingId);

            try (ResultSet rs =
                     ps.executeQuery()) {

                if (rs.next()) {

                    return createBookingFromResultSet(rs);
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }


    // ==========================================
    // GET ALL BOOKINGS
    // ==========================================
    @Override
    public ArrayList<Booking> getAllBookings() {

        ArrayList<Booking> bookings =
                new ArrayList<>();

        String query =
                "SELECT * FROM booking";

        try (PreparedStatement ps =
                     con.prepareStatement(query);

             ResultSet rs =
                     ps.executeQuery()) {

            while (rs.next()) {

                bookings.add(
                        createBookingFromResultSet(rs)
                );
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return bookings;
    }


    // ==========================================
    // RESULTSET -> BOOKING
    // ==========================================
    private Booking createBookingFromResultSet(
            ResultSet rs)
            throws SQLException {

        Booking b = new Booking();

        b.setBooking_id(
                rs.getInt("booking_id")
        );

        b.setUser_id(
                rs.getInt("user_id")
        );

        b.setTourist_name(
                rs.getString("tourist_name")
        );

        b.setItem_type(
                rs.getString("item_type")
        );

        b.setItem_name(
                rs.getString("item_name")
        );

        b.setItem_image(
                rs.getString("item_image")
        );

        b.setNum_persons(
                rs.getInt("num_persons")
        );

        b.setTotal_price(
                rs.getDouble("total_price")
        );

        b.setPayment_mode(
                rs.getString("payment_mode")
        );

        b.setStatus(
                rs.getString("status")
        );

        b.setBooking_date(
                rs.getDate("booking_date")
        );

        b.setFrom_date(
                rs.getDate("from_date")
        );

        b.setTo_date(
                rs.getDate("to_date")
        );

        b.setBooked_date(
                rs.getTimestamp("booked_date")
        );

        return b;
    }
}