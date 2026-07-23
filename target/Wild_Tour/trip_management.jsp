<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.wild_tour.connection.Connector" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Trip Management | Wildlife Tourism</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>

        /* ----- Reset & Base ----- */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
            background: #f7faf7;
            color: #1a2e1a;
            min-height: 100vh;
        }


        /* ----- Page Header ----- */

        .page-header {
            background: linear-gradient(135deg, #0a1a2e, #0d2847);
            padding: 40px 0 30px;
            position: relative;
            overflow: hidden;
        }

        .page-header::before {
            content: '';
            position: absolute;
            inset: 0;

            background:
                radial-gradient(
                    circle at 30% 50%,
                    rgba(46, 125, 50, 0.08) 0%,
                    transparent 60%
                ),
                radial-gradient(
                    circle at 70% 50%,
                    rgba(165, 214, 167, 0.05) 0%,
                    transparent 60%
                );

            pointer-events: none;
        }

        .page-header::after {
            content: '';
            position: absolute;

            bottom: 0;
            left: 0;
            right: 0;

            height: 4px;

            background: linear-gradient(
                90deg,
                #2e7d32,
                #66bb6a,
                #a5d6a7,
                #66bb6a,
                #2e7d32
            );

            background-size: 200% 100%;

            animation: gradientMove 4s ease-in-out infinite;
        }

        @keyframes gradientMove {

            0%,
            100% {
                background-position: 0% 50%;
            }

            50% {
                background-position: 100% 50%;
            }
        }

        .page-header .header-content {
            position: relative;
            z-index: 1;
            text-align: center;
        }

        .page-header .header-badge {
            display: inline-block;

            background: rgba(46, 125, 50, 0.20);

            border: 1px solid rgba(165, 214, 167, 0.15);

            padding: 6px 20px;

            border-radius: 50px;

            font-size: 0.75rem;

            font-weight: 600;

            letter-spacing: 1.5px;

            text-transform: uppercase;

            color: #a5d6a7;

            margin-bottom: 12px;
        }

        .page-header h1 {
            font-weight: 900;

            font-size: 2.8rem;

            color: #ffffff;

            letter-spacing: -0.5px;

            margin: 0;
        }

        .page-header h1 span {
            background: linear-gradient(
                135deg,
                #a5d6a7,
                #66bb6a
            );

            -webkit-background-clip: text;

            -webkit-text-fill-color: transparent;

            background-clip: text;
        }

        .page-header p {
            color: rgba(255, 255, 255, 0.60);

            font-size: 1.05rem;

            margin-top: 8px;
        }


        /* ----- Stats Cards ----- */

        .stats-row {
            padding: 30px 0 10px;
        }

        .stat-card {
            background: #ffffff;

            border-radius: 16px;

            padding: 20px 24px;

            border: 1px solid #e8eee8;

            transition: all 0.3s ease;

            height: 100%;
        }

        .stat-card:hover {
            transform: translateY(-4px);

            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.06);

            border-color: #a5d6a7;
        }

        .stat-card .stat-icon {
            width: 48px;

            height: 48px;

            border-radius: 12px;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 20px;

            margin-bottom: 8px;
        }

        .stat-card .stat-icon.green {
            background: #e8f5e9;
            color: #2e7d32;
        }

        .stat-card .stat-icon.blue {
            background: #e8f4fd;
            color: #2563eb;
        }

        .stat-card .stat-icon.amber {
            background: #fef9e8;
            color: #f59e0b;
        }

        .stat-card .stat-icon.purple {
            background: #f3edfc;
            color: #8b5cf6;
        }

        .stat-card .stat-number {
            font-size: 2rem;

            font-weight: 800;

            color: #1a2e1a;
        }

        .stat-card .stat-label {
            font-size: 0.85rem;

            color: #6b7a6b;

            font-weight: 500;
        }


        /* ----- Table Container ----- */

        .table-container {
            background: #ffffff;

            border-radius: 20px;

            padding: 24px;

            border: 1px solid #e8eee8;

            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);

            margin-bottom: 40px;

            overflow-x: auto;
        }

        .table-container .table-header {
            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 20px;

            flex-wrap: wrap;

            gap: 12px;
        }

        .table-container .table-header h2 {
            font-weight: 700;

            font-size: 1.5rem;

            color: #1a2e1a;

            margin: 0;
        }

        .table-container .table-header .table-actions {
            display: flex;

            gap: 10px;

            flex-wrap: wrap;
        }

        .table-container .table-header .table-actions .search-box {
            display: flex;

            align-items: center;

            background: #f7faf7;

            border-radius: 12px;

            padding: 6px 16px;

            border: 1px solid #e8eee8;

            transition: all 0.3s ease;
        }

        .table-container .table-header .table-actions .search-box:focus-within {
            border-color: #2e7d32;

            box-shadow: 0 0 0 4px rgba(46, 125, 50, 0.08);
        }

        .table-container .table-header .table-actions .search-box input {
            border: none;

            background: transparent;

            padding: 8px 0;

            font-size: 0.9rem;

            font-family: 'Inter', sans-serif;

            outline: none;

            color: #1a2e1a;

            width: 180px;
        }

        .table-container .table-header .table-actions .search-box input::placeholder {
            color: #a0b0a0;
        }

        .table-container .table-header .table-actions .search-box i {
            color: #a0b0a0;

            margin-right: 8px;
        }


        /* ----- Table Styling ----- */

        .table {
            margin-bottom: 0;

            font-size: 0.9rem;
        }

        .table thead th {
            background: #f7faf7;

            color: #1a2e1a;

            font-weight: 600;

            font-size: 0.8rem;

            text-transform: uppercase;

            letter-spacing: 0.5px;

            padding: 14px 12px;

            border-bottom: 2px solid #e8eee8;

            white-space: nowrap;
        }

        .table tbody td {
            padding: 14px 12px;

            vertical-align: middle;

            border-bottom: 1px solid #f0f5f0;
        }

        .table tbody tr {
            transition: background-color 0.2s ease;
        }

        .table tbody tr:hover {
            background-color: #f7faf7;
        }

        .table .item-image {
            width: 70px;

            height: 50px;

            object-fit: cover;

            border-radius: 8px;
        }


        /* ----- Status Badges ----- */

        .status-badge {
            display: inline-flex;

            align-items: center;

            gap: 4px;

            padding: 4px 12px;

            border-radius: 50px;

            font-size: 0.75rem;

            font-weight: 600;

            letter-spacing: 0.3px;
        }

        .status-badge.pending {
            background: #fef9e8;

            color: #f59e0b;
        }

        .status-badge.completed {
            background: #e8f5e9;

            color: #2e7d32;
        }

        .status-badge.cancelled {
            background: #fde8e8;

            color: #dc2626;
        }

        .status-badge.confirmed {
            background: #e8f4fd;

            color: #2563eb;
        }


        /* ----- Action Buttons ----- */

        .action-buttons {
            display: flex;

            gap: 6px;

            flex-wrap: wrap;
        }

        .btn-action {
            padding: 6px 14px;

            border-radius: 8px;

            font-weight: 600;

            font-size: 0.78rem;

            font-family: 'Inter', sans-serif;

            border: none;

            cursor: pointer;

            transition: all 0.3s ease;

            display: inline-flex;

            align-items: center;

            gap: 4px;

            text-decoration: none;
        }

        .btn-action.btn-done {
            background: #e8f5e9;

            color: #2e7d32;
        }

        .btn-action.btn-done:hover {
            background: #2e7d32;

            color: #ffffff;

            transform: translateY(-2px);

            box-shadow: 0 4px 12px rgba(46, 125, 50, 0.25);
        }

        .btn-action.btn-cancel {
            background: #fde8e8;

            color: #dc2626;
        }

        .btn-action.btn-cancel:hover {
            background: #dc2626;

            color: #ffffff;

            transform: translateY(-2px);

            box-shadow: 0 4px 12px rgba(220, 38, 38, 0.25);
        }

        .btn-action.btn-closed {
            background: #f0f5f0;

            color: #6b7a6b;

            cursor: default;
        }


        /* ----- Empty State ----- */

        .empty-state {
            text-align: center;

            padding: 60px 20px;
        }

        .empty-state .empty-icon {
            font-size: 4rem;

            color: #dce4dc;

            margin-bottom: 16px;
        }

        .empty-state h3 {
            color: #1a2e1a;

            font-weight: 700;

            margin-bottom: 8px;
        }

        .empty-state p {
            color: #6b7a6b;
        }


        footer {
            margin-top: auto;
        }


        /* ----- Responsive ----- */

        @media (max-width: 992px) {

            .page-header h1 {
                font-size: 2.2rem;
            }

            .stat-card .stat-number {
                font-size: 1.6rem;
            }

        }


        @media (max-width: 768px) {

            .page-header {
                padding: 30px 0 24px;
            }

            .page-header h1 {
                font-size: 1.8rem;
            }

            .table-container {
                padding: 16px;

                border-radius: 16px;
            }

            .table-container .table-header {
                flex-direction: column;

                align-items: stretch;
            }

            .table-container .table-header .table-actions .search-box input {
                width: 100%;
            }

            .table-container .table-header .table-actions .search-box {
                width: 100%;
            }

            .table thead th {
                font-size: 0.7rem;

                padding: 10px 8px;
            }

            .table tbody td {
                padding: 10px 8px;

                font-size: 0.82rem;
            }

            .table .item-image {
                width: 50px;

                height: 40px;
            }

            .action-buttons {
                flex-direction: column;
            }

            .btn-action {
                font-size: 0.7rem;

                padding: 4px 10px;

                justify-content: center;
            }

            .stat-card {
                padding: 16px;
            }

            .stat-card .stat-number {
                font-size: 1.4rem;
            }

        }


        @media (max-width: 576px) {

            .page-header h1 {
                font-size: 1.5rem;
            }

            .page-header p {
                font-size: 0.9rem;
            }

            .table-container {
                padding: 12px;

                border-radius: 12px;
            }

            .table thead th {
                font-size: 0.65rem;

                padding: 8px 6px;
            }

            .table tbody td {
                padding: 8px 6px;

                font-size: 0.75rem;
            }

            .table .item-image {
                width: 40px;

                height: 30px;
            }

        }

    </style>

</head>

<body>


<%@ include file="header.jsp" %>


<!-- =====================================
     PAGE HEADER
===================================== -->

<section class="page-header">

    <div class="container">

        <div
            class="header-content"
            data-aos="fade-up"
        >

            <span class="header-badge">

                <i class="fa-solid fa-gauge-high"></i>

                Admin Panel

            </span>


            <h1>

                Trip

                <span>
                    Management
                </span>

            </h1>


            <p>

                Manage all bookings and trip requests

            </p>

        </div>

    </div>

</section>


<!-- =====================================
     STATS
===================================== -->

<section class="stats-row">

    <div class="container">

        <div class="row g-4">


<%

    /*
     * Database variables
     */

    Connection con = null;

    PreparedStatement ps = null;

    ResultSet rs = null;


    int totalBookings = 0;

    int pendingBookings = 0;

    int completedBookings = 0;

    int cancelledBookings = 0;


    try {


        /*
         * IMPORTANT:
         *
         * Connector.java handles the
         * database connection.
         *
         * No localhost username/password
         * is used in this JSP.
         */

        con =
            Connector.requestConnection();


        if (con == null) {

            throw new SQLException(
                "Database connection could not be established."
            );

        }


        String countSql =

            "SELECT COUNT(*) AS total, " +

            "SUM(CASE WHEN status = 'pending' THEN 1 ELSE 0 END) AS pending, " +

            "SUM(CASE WHEN status = 'completed' THEN 1 ELSE 0 END) AS completed, " +

            "SUM(CASE WHEN status = 'cancelled' THEN 1 ELSE 0 END) AS cancelled " +

            "FROM booking";


        ps =
            con.prepareStatement(
                countSql
            );


        rs =
            ps.executeQuery();


        if (rs.next()) {


            totalBookings =
                rs.getInt(
                    "total"
                );


            pendingBookings =
                rs.getInt(
                    "pending"
                );


            completedBookings =
                rs.getInt(
                    "completed"
                );


            cancelledBookings =
                rs.getInt(
                    "cancelled"
                );

        }


    }

    catch (Exception e) {


        System.out.println(
            "Booking stats error: "
            +
            e.getMessage()
        );


        e.printStackTrace();


    }

    finally {


        if (rs != null) {

            try {

                rs.close();

            }

            catch (SQLException ignored) {

            }

        }


        if (ps != null) {

            try {

                ps.close();

            }

            catch (SQLException ignored) {

            }

        }


        if (con != null) {

            try {

                con.close();

            }

            catch (SQLException ignored) {

            }

        }


        /*
         * Reset variables before
         * opening the second connection.
         */

        rs = null;

        ps = null;

        con = null;

    }

%>


            <!-- TOTAL BOOKINGS -->

            <div
                class="col-lg-3 col-6"
                data-aos="fade-up"
                data-aos-delay="100"
            >

                <div class="stat-card">

                    <div class="stat-icon blue">

                        <i class="fa-solid fa-calendar-check"></i>

                    </div>


                    <div class="stat-number">

                        <%= totalBookings %>

                    </div>


                    <div class="stat-label">

                        Total Bookings

                    </div>

                </div>

            </div>


            <!-- PENDING BOOKINGS -->

            <div
                class="col-lg-3 col-6"
                data-aos="fade-up"
                data-aos-delay="200"
            >

                <div class="stat-card">

                    <div class="stat-icon amber">

                        <i class="fa-solid fa-clock"></i>

                    </div>


                    <div class="stat-number">

                        <%= pendingBookings %>

                    </div>


                    <div class="stat-label">

                        Pending

                    </div>

                </div>

            </div>


            <!-- COMPLETED BOOKINGS -->

            <div
                class="col-lg-3 col-6"
                data-aos="fade-up"
                data-aos-delay="300"
            >

                <div class="stat-card">

                    <div class="stat-icon green">

                        <i class="fa-solid fa-check-circle"></i>

                    </div>


                    <div class="stat-number">

                        <%= completedBookings %>

                    </div>


                    <div class="stat-label">

                        Completed

                    </div>

                </div>

            </div>


            <!-- CANCELLED BOOKINGS -->

            <div
                class="col-lg-3 col-6"
                data-aos="fade-up"
                data-aos-delay="400"
            >

                <div class="stat-card">

                    <div class="stat-icon purple">

                        <i class="fa-solid fa-ban"></i>

                    </div>


                    <div class="stat-number">

                        <%= cancelledBookings %>

                    </div>


                    <div class="stat-label">

                        Cancelled

                    </div>

                </div>

            </div>


        </div>

    </div>

</section>


<!-- =====================================
     BOOKING TABLE
===================================== -->

<section
    class="table-section"
    style="padding: 20px 0 40px;"
>

    <div class="container">


        <div
            class="table-container"
            data-aos="fade-up"
        >


            <div class="table-header">


                <h2>

                    <i class="fa-regular fa-list"></i>

                    All Bookings

                </h2>


                <div class="table-actions">


                    <div class="search-box">


                        <i class="fa-solid fa-search"></i>


                        <input
                            type="text"
                            id="searchInput"
                            placeholder="Search bookings..."
                            onkeyup="filterTable()"
                        >


                    </div>


                </div>


            </div>


            <div class="table-responsive">


                <table
                    class="table"
                    id="bookingTable"
                >


                    <thead>

                        <tr>

                            <th>#ID</th>

                            <th>User</th>

                            <th>Item</th>

                            <th>Image</th>

                            <th>Persons</th>

                            <th>Total</th>

                            <th>Payment</th>

                            <th>Status</th>

                            <th>Date</th>

                            <th>Action</th>

                        </tr>

                    </thead>


                    <tbody>


<%

    try {


        /*
         * Open new connection using
         * Connector.java.
         */

        con =
            Connector.requestConnection();


        if (con == null) {

            throw new SQLException(
                "Database connection could not be established."
            );

        }


        String sql =

            "SELECT b.*, " +

            "u.user_name AS tourist_name " +

            "FROM booking b " +

            "JOIN user u " +

            "ON b.user_id = u.user_id " +

            "ORDER BY b.booked_date DESC";


        ps =
            con.prepareStatement(
                sql
            );


        rs =
            ps.executeQuery();


        boolean hasData =
            false;


        while (rs.next()) {


            hasData =
                true;


            int bookingId =
                rs.getInt(
                    "booking_id"
                );


            String status =
                rs.getString(
                    "status"
                );


            /*
             * Prevent NULL status
             * from causing errors.
             */

            if (
                status == null ||
                status.trim().isEmpty()
            ) {

                status =
                    "pending";

            }


            String statusClass =
                "pending";


            if (
                "completed".equalsIgnoreCase(
                    status
                )
            ) {

                statusClass =
                    "completed";

            }

            else if (
                "cancelled".equalsIgnoreCase(
                    status
                )
            ) {

                statusClass =
                    "cancelled";

            }

            else if (
                "confirmed".equalsIgnoreCase(
                    status
                ) ||
                "booked".equalsIgnoreCase(
                    status
                )
            ) {

                statusClass =
                    "confirmed";

            }


            String touristName =
                rs.getString(
                    "tourist_name"
                );


            String itemName =
                rs.getString(
                    "item_name"
                );


            String itemType =
                rs.getString(
                    "item_type"
                );


            String itemImage =
                rs.getString(
                    "item_image"
                );


            String paymentMode =
                rs.getString(
                    "payment_mode"
                );


            /*
             * Safe fallback values
             */

            if (
                touristName == null ||
                touristName.trim().isEmpty()
            ) {

                touristName =
                    "User";

            }


            if (
                itemName == null ||
                itemName.trim().isEmpty()
            ) {

                itemName =
                    "Wildlife Trip";

            }


            if (
                itemType == null ||
                itemType.trim().isEmpty()
            ) {

                itemType =
                    "Trip";

            }


            if (
                itemImage == null ||
                itemImage.trim().isEmpty()
            ) {

                itemImage =
                    "https://placehold.co/70x50/1a2e1a/ffffff?text=Item";

            }


            if (
                paymentMode == null ||
                paymentMode.trim().isEmpty()
            ) {

                paymentMode =
                    "N/A";

            }

%>


                        <tr>


                            <!-- BOOKING ID -->

                            <td>

                                <strong>

                                    #<%= bookingId %>

                                </strong>

                            </td>


                            <!-- USER -->

                            <td>


                                <div>

                                    <strong>

                                        <%= touristName %>

                                    </strong>

                                </div>


                                <small
                                    style="
                                        color:#6b7a6b;
                                        font-size:0.75rem;
                                    "
                                >

                                    ID:
                                    <%= rs.getInt("user_id") %>

                                </small>


                            </td>


                            <!-- ITEM -->

                            <td>


                                <div>

                                    <strong>

                                        <%= itemName %>

                                    </strong>

                                </div>


                                <small
                                    style="
                                        color:#6b7a6b;
                                        font-size:0.7rem;
                                        text-transform:capitalize;
                                    "
                                >

                                    <%= itemType %>

                                </small>


                            </td>


                            <!-- IMAGE -->

                            <td>


                                <img
                                    src="<%= itemImage %>"
                                    class="item-image"
                                    alt="Item"

                                    onerror="
                                        this.src='https://placehold.co/70x50/1a2e1a/ffffff?text=Item'
                                    "
                                >


                            </td>


                            <!-- PERSONS -->

                            <td>

                                <%= rs.getInt("num_persons") %>

                            </td>


                            <!-- PRICE -->

                            <td>

                                <strong>

                                    ₹<%= String.format(
                                        "%.2f",
                                        rs.getDouble("total_price")
                                    ) %>

                                </strong>

                            </td>


                            <!-- PAYMENT -->

                            <td>

                                <span
                                    style="
                                        font-size:0.8rem;
                                    "
                                >

                                    <%= paymentMode %>

                                </span>

                            </td>


                            <!-- STATUS -->

                            <td>


                                <span
                                    class="status-badge <%= statusClass %>"
                                >

                                    <%= status %>

                                </span>


                            </td>


                            <!-- DATE -->

                            <td
                                style="
                                    font-size:0.8rem;
                                "
                            >

                                <%= rs.getTimestamp("booked_date") %>

                            </td>


                            <!-- ACTION -->

                            <td>


                                <div class="action-buttons">


<%

    if (
        !"cancelled".equalsIgnoreCase(
            status
        )
        &&
        !"completed".equalsIgnoreCase(
            status
        )
    ) {

%>


                                    <form
                                        method="post"
                                        action="updateBookingStatus"
                                        style="display:inline;"
                                    >


                                        <input
                                            type="hidden"
                                            name="bookingId"
                                            value="<%= bookingId %>"
                                        >


                                        <button
                                            type="submit"
                                            name="action"
                                            value="completed"
                                            class="btn-action btn-done"

                                            onclick="
                                                return confirm(
                                                    'Mark this booking as completed?'
                                                );
                                            "
                                        >

                                            <i class="fa-solid fa-check"></i>

                                            Done

                                        </button>


                                        <button
                                            type="submit"
                                            name="action"
                                            value="cancelled"
                                            class="btn-action btn-cancel"

                                            onclick="
                                                return confirm(
                                                    'Are you sure you want to cancel this booking?'
                                                );
                                            "
                                        >

                                            <i class="fa-solid fa-xmark"></i>

                                            Cancel

                                        </button>


                                    </form>


<%

    }

    else {

%>


                                    <span
                                        class="btn-action btn-closed"
                                    >

                                        <i class="fa-solid fa-lock"></i>

                                        Closed

                                    </span>


<%

    }

%>


                                </div>


                            </td>


                        </tr>


<%

        }


        /*
         * No bookings found.
         */

        if (!hasData) {

%>


                        <tr>


                            <td colspan="10">


                                <div class="empty-state">


                                    <div class="empty-icon">

                                        <i class="fa-regular fa-face-frown"></i>

                                    </div>


                                    <h3>

                                        No Bookings Found

                                    </h3>


                                    <p>

                                        There are no bookings to display
                                        at the moment.

                                    </p>


                                </div>


                            </td>


                        </tr>


<%

        }

    }


    catch (Exception e) {


        System.out.println(
            "Booking table error: "
            +
            e.getMessage()
        );


        e.printStackTrace();

%>


                        <tr>


                            <td colspan="10">


                                <div class="empty-state">


                                    <div
                                        class="empty-icon"
                                        style="color:#dc2626;"
                                    >

                                        <i class="fa-regular fa-circle-exclamation"></i>

                                    </div>


                                    <h3
                                        style="color:#dc2626;"
                                    >

                                        Error Loading Bookings

                                    </h3>


                                    <p>

                                        Unable to load booking information.

                                    </p>


                                </div>


                            </td>


                        </tr>


<%

    }


    finally {


        /*
         * Close ResultSet
         */

        if (rs != null) {

            try {

                rs.close();

            }

            catch (SQLException ignored) {

            }

        }


        /*
         * Close PreparedStatement
         */

        if (ps != null) {

            try {

                ps.close();

            }

            catch (SQLException ignored) {

            }

        }


        /*
         * Close Connection
         */

        if (con != null) {

            try {

                con.close();

            }

            catch (SQLException ignored) {

            }

        }

    }

%>


                    </tbody>


                </table>


            </div>


        </div>


    </div>


</section>


<%@ include file="footer.jsp" %>


<!-- =====================================
     JAVASCRIPT
===================================== -->


<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>


<script
    src="https://unpkg.com/aos@2.3.1/dist/aos.js">
</script>


<script>


    /*
     * Initialize AOS animations
     */

    AOS.init({

        duration: 800,

        easing: 'ease-out',

        once: true,

        offset: 50

    });


    /*
     * Search booking table
     */

    function filterTable() {


        const input =
            document.getElementById(
                'searchInput'
            );


        const filter =
            input.value.toLowerCase();


        const table =
            document.getElementById(
                'bookingTable'
            );


        const rows =
            table.getElementsByTagName(
                'tr'
            );


        for (
            let i = 1;
            i < rows.length;
            i++
        ) {


            const cells =
                rows[i].getElementsByTagName(
                    'td'
                );


            let found =
                false;


            for (
                let j = 0;
                j < cells.length;
                j++
            ) {


                const text =
                    cells[j].textContent
                    ||
                    cells[j].innerText;


                if (
                    text
                    .toLowerCase()
                    .indexOf(filter)
                    >
                    -1
                ) {


                    found =
                        true;


                    break;

                }

            }


            rows[i].style.display =
                found
                ?
                ''
                :
                'none';

        }

    }


</script>


</body>
</html>