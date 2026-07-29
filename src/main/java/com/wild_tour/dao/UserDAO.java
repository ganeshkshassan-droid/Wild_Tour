package com.wild_tour.dao;

import java.util.ArrayList;

import com.wild_tour.dto.User;

public interface UserDAO {

    // ==========================================
    // INSERT USER
    // ==========================================
    public boolean insertUser(User u);


    // ==========================================
    // UPDATE USER
    // ==========================================
    public boolean updateUser(User u);


    // ==========================================
    // DELETE USER
    // ==========================================
    public boolean deleteUser(User u);


    // ==========================================
    // GET USER USING EMAIL + PASSWORD
    // ==========================================
    public User getUser(
            String email,
            String password
    );


    // ==========================================
    // GET USER USING PHONE + EMAIL
    // ==========================================
    public User getUser(
            long phone,
            String email
    );


    // ==========================================
    // GET ALL USERS
    // ==========================================
    public ArrayList<User> getAllUsers();


    // ==========================================
    // CHECK WHETHER EMAIL EXISTS
    // Used by Forgot Password / OTP flow
    // ==========================================
    public boolean isEmailExists(
            String email
    );


    // ==========================================
    // UPDATE PASSWORD USING EMAIL
    // Called only after successful OTP verification
    // ==========================================
    public boolean updatePasswordByEmail(
            String email,
            String newPassword
    );
}