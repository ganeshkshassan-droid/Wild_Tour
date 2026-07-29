package com.wild_tour.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.wild_tour.connection.Connector;
import com.wild_tour.dto.User;

public class UserDAOImpl implements UserDAO {

    private Connection con;


    // ==========================================
    // CONSTRUCTOR
    // ==========================================
    public UserDAOImpl() {

        this.con = Connector.requestConnection();
    }


    // ==========================================
    // INSERT USER
    // ==========================================
    @Override
    public boolean insertUser(User u) {

        String query =
                "INSERT INTO user "
                + "(user_name, email, password, phone, address) "
                + "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setString(1, u.getUser_name());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassword());
            ps.setLong(4, u.getPhone());
            ps.setString(5, u.getAddress());

            int result = ps.executeUpdate();

            return result > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // UPDATE USER
    // ==========================================
    @Override
    public boolean updateUser(User u) {

        String query =
                "UPDATE user "
                + "SET user_name=?, "
                + "email=?, "
                + "phone=?, "
                + "password=?, "
                + "address=? "
                + "WHERE user_id=?";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setString(1, u.getUser_name());
            ps.setString(2, u.getEmail());
            ps.setLong(3, u.getPhone());
            ps.setString(4, u.getPassword());
            ps.setString(5, u.getAddress());
            ps.setInt(6, u.getUserId());

            int result = ps.executeUpdate();

            return result > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // DELETE USER
    // ==========================================
    @Override
    public boolean deleteUser(User u) {

        String query =
                "DELETE FROM user "
                + "WHERE user_id=?";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setInt(1, u.getUserId());

            int result = ps.executeUpdate();

            return result > 0;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // GET USER USING EMAIL + PASSWORD
    // LOGIN
    // ==========================================
    @Override
    public User getUser(
            String email,
            String password) {

        String query =
                "SELECT * FROM user "
                + "WHERE LOWER(email)=LOWER(?) "
                + "AND password=?";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs =
                     ps.executeQuery()) {

                if (rs.next()) {

                    return createUserFromResultSet(rs);
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }


    // ==========================================
    // GET USER USING PHONE + EMAIL
    // ==========================================
    @Override
    public User getUser(
            long phone,
            String email) {

        String query =
                "SELECT * FROM user "
                + "WHERE phone=? "
                + "AND LOWER(email)=LOWER(?)";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setLong(1, phone);
            ps.setString(2, email);

            try (ResultSet rs =
                     ps.executeQuery()) {

                if (rs.next()) {

                    return createUserFromResultSet(rs);
                }
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return null;
    }


    // ==========================================
    // GET ALL USERS
    // ==========================================
    @Override
    public ArrayList<User> getAllUsers() {

        ArrayList<User> users =
                new ArrayList<>();

        String query =
                "SELECT * FROM user";

        try (PreparedStatement ps =
                     con.prepareStatement(query);

             ResultSet rs =
                     ps.executeQuery()) {

            while (rs.next()) {

                users.add(
                        createUserFromResultSet(rs)
                );
            }

        } catch (SQLException e) {

            e.printStackTrace();
        }

        return users;
    }


    // ==========================================
    // CHECK WHETHER EMAIL EXISTS
    // FOR FORGOT PASSWORD
    // ==========================================
    @Override
    public boolean isEmailExists(String email) {

        if (email == null
                || email.trim().isEmpty()) {

            return false;
        }

        String query =
                "SELECT 1 "
                + "FROM user "
                + "WHERE LOWER(email)=LOWER(?) "
                + "LIMIT 1";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setString(
                    1,
                    email.trim()
            );

            try (ResultSet rs =
                     ps.executeQuery()) {

                return rs.next();
            }

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // UPDATE PASSWORD USING EMAIL
    // ONLY AFTER OTP VERIFICATION
    // ==========================================
    @Override
    public boolean updatePasswordByEmail(
            String email,
            String newPassword) {

        if (email == null
                || email.trim().isEmpty()
                || newPassword == null
                || newPassword.isEmpty()) {

            return false;
        }

        String query =
                "UPDATE user "
                + "SET password=? "
                + "WHERE LOWER(email)=LOWER(?)";

        try (PreparedStatement ps =
                     con.prepareStatement(query)) {

            ps.setString(
                    1,
                    newPassword
            );

            ps.setString(
                    2,
                    email.trim()
            );

            int result =
                    ps.executeUpdate();

            return result == 1;

        } catch (SQLException e) {

            e.printStackTrace();

            return false;
        }
    }


    // ==========================================
    // PRIVATE HELPER METHOD
    // RESULTSET -> USER OBJECT
    // ==========================================
    private User createUserFromResultSet(
            ResultSet rs)
            throws SQLException {

        User user =
                new User();

        user.setUserId(
                rs.getInt("user_id")
        );

        user.setUser_name(
                rs.getString("user_name")
        );

        user.setEmail(
                rs.getString("email")
        );

        user.setPassword(
                rs.getString("password")
        );

        user.setPhone(
                rs.getLong("phone")
        );

        user.setAddress(
                rs.getString("address")
        );

        return user;
    }
}