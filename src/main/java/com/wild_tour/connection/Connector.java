package com.wild_tour.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {

    public static Connection requestConnection() {

        Connection con = null;

        String url =
            "jdbc:mysql://wildlifedb-ganeshkshassan-8c20.a.aivencloud.com:24820/defaultdb?sslMode=REQUIRED";

        String user = "avnadmin";

       
        String password = "AVNS_XnlNVPYIEBYgCXZzY0z";

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            System.out.println("Loading Connector...");
            System.out.println("URL = " + url);
            System.out.println("User = " + user);

            con = DriverManager.getConnection(
                url,
                user,
                password
            );

            System.out.println("DB Connected Successfully!");

        } catch (ClassNotFoundException | SQLException e) {

            System.out.println("========== DATABASE ERROR ==========");
            System.out.println("ERROR TYPE: " + e.getClass().getName());
            System.out.println("ERROR MESSAGE: " + e.getMessage());
            System.out.println("====================================");

            e.printStackTrace();
        }

        return con;
    }
}