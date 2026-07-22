<%@ page import="java.sql.*" %>
<%@ page import="com.wild_tour.connection.Connector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>WildLife Tour Packages | Wildlife Tourism</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet"
    />

    <link
        href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap"
        rel="stylesheet"
    >

    <link
        rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
    >

    <link
        href="https://unpkg.com/aos@2.3.1/dist/aos.css"
        rel="stylesheet"
    >


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        body {
            font-family: 'Inter', sans-serif;
            background: #f7faf7;
            color: #1a2e1a;
            min-height: 100vh;
        }


        /* =========================
           PAGE HEADER
        ========================= */

        .page-header {
            background: linear-gradient(
                135deg,
                #0a1a2e,
                #0d2847
            );

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
                    rgba(139, 92, 246, 0.08) 0%,
                    transparent 60%
                ),

                radial-gradient(
                    circle at 70% 50%,
                    rgba(167, 139, 250, 0.05) 0%,
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
                #8b5cf6,
                #a78bfa,
                #c4b5fd,
                #a78bfa,
                #8b5cf6
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

            background: rgba(139, 92, 246, 0.20);

            border: 1px solid rgba(167, 139, 250, 0.15);

            padding: 6px 20px;

            border-radius: 50px;

            font-size: 0.75rem;

            font-weight: 600;

            letter-spacing: 1.5px;

            text-transform: uppercase;

            color: #c4b5fd;

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
                #c4b5fd,
                #a78bfa
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


        /* =========================
           STATS BAR
        ========================= */

        .stats-bar {

            background: #ffffff;

            padding: 20px 0;

            border-bottom: 1px solid #e8eee8;

            box-shadow: 0 2px 12px rgba(0, 0, 0, 0.02);
        }


        .stats-bar .stats-wrapper {

            display: flex;

            justify-content: center;

            gap: 60px;

            flex-wrap: wrap;
        }


        .stats-bar .stat-item {

            text-align: center;
        }


        .stats-bar .stat-item .stat-number {

            font-size: 2rem;

            font-weight: 800;

            color: #8b5cf6;
        }


        .stats-bar .stat-item .stat-label {

            font-size: 0.85rem;

            color: #6b7a6b;

            font-weight: 500;
        }


        /* =========================
           PACKAGE GRID
        ========================= */

        .package-grid {

            padding: 40px 0 60px;
        }


        .package-grid .grid-wrapper {

            display: grid;

            grid-template-columns:
                repeat(
                    auto-fill,
                    minmax(340px, 1fr)
                );

            gap: 30px;

            padding: 0 20px;
        }


        /* =========================
           PACKAGE CARD
        ========================= */

        .package-card {

            background: #ffffff;

            border-radius: 24px;

            overflow: hidden;

            box-shadow:
                0 4px 20px
                rgba(0, 0, 0, 0.04);

            border:
                1px solid
                #e8eee8;

            transition:
                all 0.4s
                cubic-bezier(
                    0.34,
                    1.56,
                    0.64,
                    1
                );

            position: relative;
        }


        .package-card:hover {

            transform: translateY(-8px);

            box-shadow:
                0 20px 60px
                rgba(0, 0, 0, 0.08);

            border-color: #c4b5fd;
        }


        .package-card::before {

            content: '';

            position: absolute;

            top: 0;
            left: 0;
            right: 0;

            height: 4px;

            background:
                linear-gradient(
                    90deg,
                    #8b5cf6,
                    #a78bfa
                );

            transform: scaleX(0);

            transition:
                transform
                0.5s ease;

            transform-origin: left;

            z-index: 2;
        }


        .package-card:hover::before {

            transform: scaleX(1);
        }


        .package-card .card-image-wrapper {

            position: relative;

            overflow: hidden;
        }


        .package-card .card-image {

            width: 100%;

            height: 220px;

            object-fit: cover;

            transition:
                transform
                0.6s ease;
        }


        .package-card:hover .card-image {

            transform: scale(1.03);
        }


        .package-card
        .card-image-wrapper
        .card-badge {

            position: absolute;

            top: 16px;

            right: 16px;

            background:
                rgba(
                    139,
                    92,
                    246,
                    0.85
                );

            backdrop-filter:
                blur(8px);

            padding:
                4px 14px;

            border-radius:
                50px;

            color:
                #ffffff;

            font-size:
                0.75rem;

            font-weight:
                600;

            letter-spacing:
                0.5px;

            z-index:
                1;
        }


        .package-card .card-body {

            padding: 24px;
        }


        .package-card
        .card-body
        .card-header {

            display: flex;

            justify-content:
                space-between;

            align-items:
                flex-start;

            margin-bottom:
                10px;
        }


        .package-card
        .card-body h3 {

            font-weight:
                700;

            font-size:
                1.3rem;

            color:
                #1a2e1a;

            margin:
                0;
        }


        .package-card
        .card-body
        .card-price {

            font-size:
                1.3rem;

            font-weight:
                800;

            color:
                #8b5cf6;
        }


        .package-card
        .card-body
        .card-price small {

            font-size:
                0.8rem;

            font-weight:
                400;

            color:
                #6b7a6b;
        }


        /* =========================
           AMENITIES
        ========================= */

        .package-card
        .card-body
        .amenities {

            display:
                flex;

            flex-wrap:
                wrap;

            gap:
                8px;

            margin-bottom:
                18px;
        }


        .package-card
        .card-body
        .amenities
        .amenity-tag {

            background:
                #f3edfc;

            color:
                #8b5cf6;

            padding:
                4px 12px;

            border-radius:
                50px;

            font-size:
                0.75rem;

            font-weight:
                500;

            display:
                inline-flex;

            align-items:
                center;

            gap:
                4px;
        }


        /* =========================
           BUTTONS
        ========================= */

        .package-card
        .card-body
        .card-actions {

            display:
                flex;

            gap:
                12px;
        }


        .package-card
        .card-body
        .card-actions
        .btn {

            flex:
                1;

            padding:
                10px 16px;

            border-radius:
                12px;

            font-weight:
                600;

            font-size:
                0.85rem;

            font-family:
                'Inter',
                sans-serif;

            transition:
                all
                0.35s ease;

            display:
                inline-flex;

            align-items:
                center;

            justify-content:
                center;

            gap:
                8px;

            border:
                none;

            cursor:
                pointer;

            text-decoration:
                none;
        }


        .btn-update {

            background:
                #f3edfc;

            color:
                #8b5cf6;
        }


        .btn-update:hover {

            background:
                #8b5cf6;

            color:
                #ffffff;

            transform:
                translateY(-2px);

            box-shadow:
                0 8px 25px
                rgba(
                    139,
                    92,
                    246,
                    0.25
                );
        }


        .btn-delete {

            background:
                #fde8e8;

            color:
                #dc2626;
        }


        .btn-delete:hover {

            background:
                #dc2626;

            color:
                #ffffff;

            transform:
                translateY(-2px);

            box-shadow:
                0 8px 25px
                rgba(
                    220,
                    38,
                    38,
                    0.25
                );
        }


        /* =========================
           DELETE MODAL
        ========================= */

        .delete-modal-overlay {

            display:
                none;

            position:
                fixed;

            inset:
                0;

            background:
                rgba(
                    0,
                    0,
                    0,
                    0.50
                );

            backdrop-filter:
                blur(8px);

            z-index:
                9999;

            align-items:
                center;

            justify-content:
                center;

            animation:
                fadeIn
                0.3s ease;
        }


        .delete-modal-overlay.active {

            display:
                flex;
        }


        @keyframes fadeIn {

            from {
                opacity:
                    0;
            }

            to {
                opacity:
                    1;
            }
        }


        .delete-modal {

            background:
                #ffffff;

            border-radius:
                24px;

            padding:
                40px 36px 32px;

            max-width:
                440px;

            width:
                90%;

            text-align:
                center;

            animation:
                slideUp
                0.4s
                cubic-bezier(
                    0.34,
                    1.56,
                    0.64,
                    1
                );

            box-shadow:
                0 40px 80px
                rgba(
                    0,
                    0,
                    0,
                    0.30
                );
        }


        @keyframes slideUp {

            from {

                opacity:
                    0;

                transform:
                    translateY(40px)
                    scale(0.96);
            }

            to {

                opacity:
                    1;

                transform:
                    translateY(0)
                    scale(1);
            }
        }


        .delete-modal
        .modal-icon {

            width:
                80px;

            height:
                80px;

            background:
                #fde8e8;

            border-radius:
                50%;

            display:
                flex;

            align-items:
                center;

            justify-content:
                center;

            margin:
                0 auto 16px;

            font-size:
                36px;

            color:
                #dc2626;

            animation:
                pulseIcon
                1.5s
                ease-in-out
                infinite;
        }


        @keyframes pulseIcon {

            0%,
            100% {

                transform:
                    scale(1);
            }

            50% {

                transform:
                    scale(1.05);
            }
        }


        .delete-modal h3 {

            font-weight:
                800;

            font-size:
                1.4rem;

            color:
                #1a2e1a;

            margin-bottom:
                8px;
        }


        .delete-modal p {

            color:
                #6b7a6b;

            font-size:
                0.95rem;

            line-height:
                1.6;

            margin-bottom:
                4px;
        }


        .delete-modal
        .item-name {

            font-weight:
                700;

            color:
                #dc2626;

            font-size:
                1.05rem;

            display:
                block;

            margin:
                8px 0 16px;

            padding:
                8px 16px;

            background:
                #fef2f2;

            border-radius:
                10px;

            border:
                1px solid
                #fde8e8;
        }


        .delete-modal
        .modal-actions {

            display:
                flex;

            gap:
                12px;

            margin-top:
                24px;
        }


        .delete-modal
        .modal-actions
        .btn {

            flex:
                1;

            padding:
                12px 20px;

            border-radius:
                14px;

            font-weight:
                700;

            font-size:
                0.92rem;

            font-family:
                'Inter',
                sans-serif;

            transition:
                all
                0.35s ease;

            border:
                none;

            cursor:
                pointer;

            display:
                inline-flex;

            align-items:
                center;

            justify-content:
                center;

            gap:
                8px;
        }


        .btn-modal-cancel {

            background:
                #f7faf7;

            color:
                #1a2e1a;

            border:
                1px solid
                #dce4dc !important;
        }


        .btn-modal-cancel:hover {

            background:
                #e8eee8;

            transform:
                translateY(-2px);
        }


        .btn-modal-confirm {

            background:
                #dc2626;

            color:
                #ffffff;

            box-shadow:
                0 8px 30px
                rgba(
                    220,
                    38,
                    38,
                    0.25
                );
        }


        .btn-modal-confirm:hover {

            background:
                #b91c1c;

            transform:
                translateY(-2px);

            box-shadow:
                0 12px 40px
                rgba(
                    220,
                    38,
                    38,
                    0.35
                );
        }


        /* =========================
           EMPTY / ERROR STATE
        ========================= */

        .empty-state {

            text-align:
                center;

            padding:
                80px 20px;

            grid-column:
                1 / -1;
        }


        .empty-state
        .empty-icon {

            font-size:
                4rem;

            color:
                #dce4dc;

            margin-bottom:
                16px;
        }


        .empty-state h3 {

            color:
                #1a2e1a;

            font-weight:
                700;

            margin-bottom:
                8px;
        }


        .empty-state p {

            color:
                #6b7a6b;
        }


        .empty-state
        .btn-add {

            display:
                inline-flex;

            align-items:
                center;

            gap:
                10px;

            padding:
                12px 32px;

            border-radius:
                50px;

            background:
                #8b5cf6;

            color:
                #ffffff;

            text-decoration:
                none;

            font-weight:
                600;

            margin-top:
                16px;

            transition:
                all
                0.3s ease;

            border:
                none;
        }


        .empty-state
        .btn-add:hover {

            background:
                #7c3aed;

            transform:
                translateY(-3px);

            box-shadow:
                0 8px 30px
                rgba(
                    139,
                    92,
                    246,
                    0.30
                );
        }


        footer {

            margin-top:
                auto;
        }


        /* =========================
           RESPONSIVE
        ========================= */

        @media (max-width: 992px) {

            .page-header h1 {

                font-size:
                    2.2rem;
            }


            .package-grid
            .grid-wrapper {

                grid-template-columns:
                    repeat(
                        auto-fill,
                        minmax(
                            300px,
                            1fr
                        )
                    );

                gap:
                    24px;
            }
        }


        @media (max-width: 768px) {

            .page-header {

                padding:
                    30px 0 24px;
            }


            .page-header h1 {

                font-size:
                    1.8rem;
            }


            .stats-bar
            .stats-wrapper {

                gap:
                    30px;
            }


            .stats-bar
            .stat-item
            .stat-number {

                font-size:
                    1.6rem;
            }


            .package-grid
            .grid-wrapper {

                grid-template-columns:
                    1fr 1fr;

                gap:
                    16px;

                padding:
                    0 12px;
            }


            .package-card
            .card-body {

                padding:
                    18px;
            }


            .package-card
            .card-image {

                height:
                    180px;
            }


            .package-card
            .card-body h3 {

                font-size:
                    1.1rem;
            }


            .package-card
            .card-body
            .card-price {

                font-size:
                    1.1rem;
            }


            .package-card
            .card-body
            .card-actions
            .btn {

                font-size:
                    0.78rem;

                padding:
                    8px 12px;
            }


            .delete-modal {

                padding:
                    32px 24px 28px;
            }


            .delete-modal
            .modal-actions {

                flex-direction:
                    column;
            }
        }


        @media (max-width: 576px) {

            .package-grid
            .grid-wrapper {

                grid-template-columns:
                    1fr;

                max-width:
                    400px;

                margin:
                    0 auto;
            }


            .package-card
            .card-image {

                height:
                    200px;
            }


            .stats-bar
            .stats-wrapper {

                gap:
                    20px;
            }


            .stats-bar
            .stat-item
            .stat-number {

                font-size:
                    1.4rem;
            }


            .page-header h1 {

                font-size:
                    1.5rem;
            }


            .page-header p {

                font-size:
                    0.9rem;
            }


            .delete-modal {

                padding:
                    28px 20px 24px;
            }
        }

    </style>

</head>


<body>


<%@ include file="header.jsp" %>


<!-- =========================
     PAGE HEADER
========================= -->

<section class="page-header">

    <div class="container">

        <div
            class="header-content"
            data-aos="fade-up"
        >

            <span class="header-badge">

                <i class="fa-solid fa-suitcase"></i>

                Tour Packages

            </span>


            <h1>

                Wildlife

                <span>
                    Packages
                </span>

            </h1>


            <p>

                Choose your perfect wildlife
                adventure package

            </p>

        </div>

    </div>

</section>


<!-- =========================
     STATS BAR
========================= -->

<section
    class="stats-bar"
    data-aos="fade-up"
    data-aos-delay="100"
>

    <div class="container">

        <div class="stats-wrapper">


            <div class="stat-item">

                <div
                    class="stat-number"
                    id="totalPackages"
                >
                    0
                </div>

                <div class="stat-label">

                    <i class="fa-regular fa-suitcase"></i>

                    Total Packages

                </div>

            </div>


            <div class="stat-item">

                <div
                    class="stat-number"
                    id="avgPrice"
                >
                    ₹0
                </div>

                <div class="stat-label">

                    <i class="fa-regular fa-currency-sign"></i>

                    Avg Price

                </div>

            </div>


            <div class="stat-item">

                <div
                    class="stat-number"
                    id="amenities"
                >
                    0
                </div>

                <div class="stat-label">

                    <i class="fa-regular fa-star"></i>

                    Amenities

                </div>

            </div>


        </div>

    </div>

</section>


<!-- =========================
     PACKAGE GRID
========================= -->

<section class="package-grid">

<div class="container">

<div
    class="grid-wrapper"
    id="packageGrid"
>


<%

    Connection conn = null;

    PreparedStatement ps = null;

    ResultSet rs = null;


    int count = 0;

    double totalPrice = 0;

    int totalAmenities = 0;


    try {


        /*
         * IMPORTANT:
         *
         * No localhost connection here.
         *
         * Connector.java handles the
         * connection to the Aiven MySQL
         * database when deployed on Render.
         */

        conn =
            Connector.requestConnection();


        if (conn == null) {

            throw new SQLException(
                "Database connection could not be established."
            );

        }


        String sql =
            "SELECT * FROM packages";


        ps =
            conn.prepareStatement(sql);


        rs =
            ps.executeQuery();


        while (rs.next()) {


            int id =
                rs.getInt(
                    "package_id"
                );


            String name =
                rs.getString(
                    "name"
                );


            double price =
                rs.getDouble(
                    "price"
                );


            String imageUrl =
                rs.getString(
                    "image_url"
                );


            count++;

            totalPrice +=
                price;


            String[] amenities =
                {};


            String badgeText =
                "Premium";


            if (
                name != null &&
                name.equalsIgnoreCase(
                    "Maharaja Package"
                )
            ) {


                amenities =
                    new String[] {

                        "Luxury Cottage",

                        "All Meals",

                        "2 Jeep Safaris",

                        "Coracle Ride",

                        "GST Included"

                    };


                badgeText =
                    "Luxury";

            }


            else if (
                name != null &&
                name.equalsIgnoreCase(
                    "Viceroy Package"
                )
            ) {


                amenities =
                    new String[] {

                        "North/East Bungalow",

                        "All Meals",

                        "Boat + Jeep Safari",

                        "Coracle Ride",

                        "GST Included"

                    };


                badgeText =
                    "Premium";

            }


            else if (
                name != null &&
                name.equalsIgnoreCase(
                    "Kabini Tent Package"
                )
            ) {


                amenities =
                    new String[] {

                        "Tented Cottage",

                        "All Meals",

                        "Boat + Jeep Safari",

                        "Forest Entry",

                        "GST Included"

                    };


                badgeText =
                    "Adventure";

            }


            else if (
                name != null &&
                name.equalsIgnoreCase(
                    "Dormitory Package"
                )
            ) {


                amenities =
                    new String[] {

                        "Shared Dormitory",

                        "All Meals",

                        "Boat + Van Safari",

                        "Forest Entry",

                        "GST Included"

                    };


                badgeText =
                    "Budget";

            }


            totalAmenities +=
                amenities.length;

%>


<!-- PACKAGE CARD -->

<div
    class="package-card"
    data-aos="fade-up"
    data-aos-delay="<%= (count % 4) * 100 + 100 %>"
>


    <div class="card-image-wrapper">


        <img
            src="<%= imageUrl %>"
            alt="<%= name %>"
            class="card-image"

            onerror="
                this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Tour+Package'
            "
        >


        <span class="card-badge">

            <i class="fa-regular fa-crown"></i>

            <%= badgeText %>

        </span>


    </div>


    <div class="card-body">


        <div class="card-header">


            <h3>

                <%= name %>

            </h3>


            <div class="card-price">

                ₹<%= String.format("%.2f", price) %>

                <small>
                    /night
                </small>

            </div>


        </div>


        <!-- AMENITIES -->

        <div class="amenities">


            <%

                for (
                    String amenity :
                    amenities
                ) {

            %>


            <span class="amenity-tag">

                <i class="fa-solid fa-check"></i>

                <%= amenity %>

            </span>


            <%

                }

            %>


        </div>


        <!-- ACTION BUTTONS -->

        <div class="card-actions">


            <a
                href="updatePackage.jsp?id=<%= id %>"
                class="btn btn-update"
            >

                <i class="fa-regular fa-pen-to-square"></i>

                Update

            </a>


            <button
                type="button"
                class="btn btn-delete"

                onclick="openDeleteModal(
                    <%= id %>,
                    '<%= name %>',
                    'package'
                )"
            >

                <i class="fa-regular fa-trash-can"></i>

                Delete

            </button>


        </div>


    </div>


</div>


<%

        }


        /*
         * If no packages exist.
         */

        if (count == 0) {

%>


<div class="empty-state">


    <div class="empty-icon">

        <i class="fa-regular fa-face-frown"></i>

    </div>


    <h3>

        No Packages Found

    </h3>


    <p>

        Start by adding your first
        tour package.

    </p>


    <a
        href="add_packages.jsp"
        class="btn-add"
    >

        <i class="fa-solid fa-plus"></i>

        Add Package

    </a>


</div>


<%

        }


    }


    catch (Exception e) {


        System.out.println(
            "Package page database error: "
            +
            e.getMessage()
        );


        e.printStackTrace();

%>


<!-- ERROR STATE -->

<div class="empty-state">


    <div class="empty-icon">

        <i
            class="fa-solid fa-circle-exclamation"
            style="color:#dc2626;"
        ></i>

    </div>


    <h3
        style="color:#dc2626;"
    >

        Error Loading Packages

    </h3>


    <p>

        Unable to load package
        information from the database.

    </p>


</div>


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

            catch (
                SQLException ignored
            ) {

            }

        }


        /*
         * Close PreparedStatement
         */

        if (ps != null) {

            try {

                ps.close();

            }

            catch (
                SQLException ignored
            ) {

            }

        }


        /*
         * Close Connection
         */

        if (conn != null) {

            try {

                conn.close();

            }

            catch (
                SQLException ignored
            ) {

            }

        }

    }

%>


</div>

</div>

</section>


<!-- =========================
     DELETE MODAL
========================= -->

<div
    class="delete-modal-overlay"
    id="deleteModal"
>


    <div class="delete-modal">


        <div class="modal-icon">

            <i class="fa-solid fa-triangle-exclamation"></i>

        </div>


        <h3>

            Delete Confirmation

        </h3>


        <p>

            Are you sure you want
            to delete this item?

        </p>


        <p
            style="
                font-size:0.85rem;
                color:#6b7a6b;
            "
        >

            This action cannot be undone.

        </p>


        <span
            class="item-name"
            id="deleteItemName"
        >

            Item Name

        </span>


        <div class="modal-actions">


            <button
                class="btn btn-modal-cancel"
                onclick="closeDeleteModal()"
            >

                <i class="fa-solid fa-xmark"></i>

                Cancel

            </button>


            <button
                class="btn btn-modal-confirm"
                id="confirmDeleteBtn"
            >

                <i class="fa-solid fa-trash-can"></i>

                Delete

            </button>


        </div>


    </div>


</div>


<%@ include file="footer.jsp" %>


<!-- =========================
     JAVASCRIPT
========================= -->

<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>


<script
    src="https://unpkg.com/aos@2.3.1/dist/aos.js">
</script>


<script>


    /* =========================
       AOS
    ========================= */

    AOS.init({

        duration:
            800,

        easing:
            'ease-out',

        once:
            true,

        offset:
            50

    });


    /* =========================
       STATS
    ========================= */

    document.addEventListener(
        'DOMContentLoaded',
        function() {


            const packageCards =
                document.querySelectorAll(
                    '.package-card'
                );


            const totalPackages =
                packageCards.length;


            document.getElementById(
                'totalPackages'
            ).textContent =
                totalPackages;


            if (
                totalPackages > 0
            ) {


                let totalPrice =
                    0;


                let amenitiesCount =
                    0;


                packageCards.forEach(
                    function(card) {


                        const priceText =
                            card
                            .querySelector(
                                '.card-price'
                            )
                            .textContent;


                        const price =
                            parseFloat(

                                priceText

                                .replace(
                                    '₹',
                                    ''
                                )

                                .replace(
                                    '/night',
                                    ''
                                )

                            );


                        if (
                            !isNaN(price)
                        ) {

                            totalPrice +=
                                price;

                        }


                        const amenityTags =
                            card
                            .querySelectorAll(
                                '.amenity-tag'
                            );


                        amenitiesCount +=
                            amenityTags.length;


                    }
                );


                const avgPrice =
                    totalPrice /
                    totalPackages;


                document.getElementById(
                    'avgPrice'
                ).textContent =
                    '₹'
                    +
                    avgPrice.toFixed(0);


                document.getElementById(
                    'amenities'
                ).textContent =
                    amenitiesCount;

            }

        }
    );


    /* =========================
       DELETE MODAL
    ========================= */


    let deleteItemId =
        null;


    let deleteItemType =
        null;


    function openDeleteModal(
        id,
        name,
        type
    ) {


        deleteItemId =
            id;


        deleteItemType =
            type;


        document.getElementById(
            'deleteItemName'
        ).textContent =
            name;


        document.getElementById(
            'deleteModal'
        ).classList.add(
            'active'
        );


        document.body.style.overflow =
            'hidden';

    }


    function closeDeleteModal() {


        document.getElementById(
            'deleteModal'
        ).classList.remove(
            'active'
        );


        document.body.style.overflow =
            '';


        deleteItemId =
            null;


        deleteItemType =
            null;

    }


    document.getElementById(
        'confirmDeleteBtn'
    ).addEventListener(
        'click',
        function() {


            if (
                deleteItemId &&
                deleteItemType
            ) {


                const form =
                    document.createElement(
                        'form'
                    );


                form.method =
                    'POST';


                form.action =

                    deleteItemType ===
                    'package'

                    ? 'PackageAction'

                    :

                    deleteItemType ===
                    'safari'

                    ? 'SafariAction'

                    :

                    deleteItemType ===
                    'stay'

                    ? 'StayAction'

                    :

                    'GuideAction';


                /*
                 * ACTION INPUT
                 */

                const actionInput =
                    document.createElement(
                        'input'
                    );


                actionInput.type =
                    'hidden';


                actionInput.name =
                    'action';


                actionInput.value =
                    'delete';


                form.appendChild(
                    actionInput
                );


                /*
                 * ID INPUT
                 */

                const idInput =
                    document.createElement(
                        'input'
                    );


                idInput.type =
                    'hidden';


                idInput.name =

                    deleteItemType ===
                    'package'

                    ? 'packageId'

                    :

                    deleteItemType ===
                    'safari'

                    ? 'safariId'

                    :

                    deleteItemType ===
                    'stay'

                    ? 'stayId'

                    :

                    'guideId';


                idInput.value =
                    deleteItemId;


                form.appendChild(
                    idInput
                );


                document.body.appendChild(
                    form
                );


                form.submit();

            }

        }
    );


    /*
     * Close modal when clicking
     * outside the modal.
     */

    document.getElementById(
        'deleteModal'
    ).addEventListener(
        'click',
        function(e) {


            if (
                e.target === this
            ) {

                closeDeleteModal();

            }

        }
    );


    /*
     * Close modal with ESC key.
     */

    document.addEventListener(
        'keydown',
        function(e) {


            if (
                e.key ===
                'Escape'
            ) {

                closeDeleteModal();

            }

        }
    );


</script>


</body>

</html>