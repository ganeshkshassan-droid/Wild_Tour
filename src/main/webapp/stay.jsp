<%@ page import="java.sql.*" %>
<%@ page import="com.wild_tour.connection.Connector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Accommodation Services | Wildlife Tourism</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
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

        /* ---------- Page Header ---------- */

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
                    rgba(37, 99, 235, 0.08) 0%,
                    transparent 60%
                ),
                radial-gradient(
                    circle at 70% 50%,
                    rgba(96, 165, 250, 0.05) 0%,
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
                #2563eb,
                #60a5fa,
                #93c5fd,
                #60a5fa,
                #2563eb
            );

            background-size: 200% 100%;
            animation: gradientMove 4s ease-in-out infinite;
        }

        @keyframes gradientMove {
            0%, 100% {
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
            background: rgba(37, 99, 235, 0.20);
            border: 1px solid rgba(96, 165, 250, 0.15);
            padding: 6px 20px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: #93c5fd;
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
            background: linear-gradient(135deg, #93c5fd, #60a5fa);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .page-header p {
            color: rgba(255, 255, 255, 0.60);
            font-size: 1.05rem;
            margin-top: 8px;
        }

        /* ---------- Stats Bar ---------- */

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
            color: #2563eb;
        }

        .stats-bar .stat-item .stat-label {
            font-size: 0.85rem;
            color: #6b7a6b;
            font-weight: 500;
        }

        /* ---------- Stay Grid ---------- */

        .stay-grid {
            padding: 40px 0 60px;
        }

        .stay-grid .grid-wrapper {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 30px;
            padding: 0 20px;
        }

        /* ---------- Stay Card ---------- */

        .stay-card {
            background: #ffffff;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            border: 1px solid #e8eee8;
            transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            position: relative;
        }

        .stay-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.10);
            border-color: #93c5fd;
        }

        .stay-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #2563eb, #60a5fa);
            transform: scaleX(0);
            transition: transform 0.5s ease;
            transform-origin: left;
            z-index: 2;
        }

        .stay-card:hover::before {
            transform: scaleX(1);
        }

        .stay-card .card-image-wrapper {
            position: relative;
            overflow: hidden;
        }

        .stay-card .card-image {
            width: 100%;
            height: 240px;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .stay-card:hover .card-image {
            transform: scale(1.05);
        }

        .stay-card .card-image-wrapper .card-badge {
            position: absolute;
            top: 16px;
            right: 16px;
            background: rgba(37, 99, 235, 0.85);
            backdrop-filter: blur(8px);
            padding: 4px 14px;
            border-radius: 50px;
            color: #ffffff;
            font-size: 0.7rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            z-index: 1;
        }

        .stay-card .card-body {
            padding: 24px;
        }

        .stay-card .card-body .card-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 10px;
        }

        .stay-card .card-body h3 {
            font-weight: 700;
            font-size: 1.3rem;
            color: #1a2e1a;
            margin: 0;
        }

        .stay-card .card-body .card-price {
            font-size: 1.3rem;
            font-weight: 800;
            color: #2563eb;
        }

        .stay-card .card-body .card-price small {
            font-size: 0.75rem;
            font-weight: 400;
            color: #6b7a6b;
        }

        .stay-card .card-body .card-description {
            color: #6b7a6b;
            font-size: 0.92rem;
            line-height: 1.6;
            margin-bottom: 18px;

            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .stay-card .card-body .card-actions {
            display: flex;
            gap: 12px;
        }

        .stay-card .card-body .card-actions .btn {
            flex: 1;
            padding: 12px 20px;
            border-radius: 14px;
            font-weight: 700;
            font-size: 0.92rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.35s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            border: none;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-book {
            background: linear-gradient(145deg, #2563eb, #1d4ed8);
            color: #ffffff;
            box-shadow: 0 8px 30px rgba(37, 99, 235, 0.25);
        }

        .btn-book:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(37, 99, 235, 0.35);
            background: linear-gradient(145deg, #3b82f6, #2563eb);
            color: #ffffff;
        }

        .btn-book i {
            transition: transform 0.3s ease;
        }

        .btn-book:hover i {
            transform: translateX(4px);
        }

        /* ---------- Empty / Error State ---------- */

        .empty-state {
            text-align: center;
            padding: 80px 20px;
            grid-column: 1 / -1;
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

        /* ---------- Responsive ---------- */

        @media (max-width: 992px) {
            .page-header h1 {
                font-size: 2.2rem;
            }

            .stay-grid .grid-wrapper {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 24px;
            }
        }

        @media (max-width: 768px) {
            .page-header {
                padding: 30px 0 24px;
            }

            .page-header h1 {
                font-size: 1.8rem;
            }

            .stats-bar .stats-wrapper {
                gap: 30px;
            }

            .stats-bar .stat-item .stat-number {
                font-size: 1.6rem;
            }

            .stay-grid .grid-wrapper {
                grid-template-columns: 1fr 1fr;
                gap: 16px;
                padding: 0 12px;
            }

            .stay-card .card-body {
                padding: 18px;
            }

            .stay-card .card-image {
                height: 180px;
            }

            .stay-card .card-body h3 {
                font-size: 1.1rem;
            }

            .stay-card .card-body .card-price {
                font-size: 1.1rem;
            }

            .stay-card .card-body .card-actions .btn {
                font-size: 0.8rem;
                padding: 10px 14px;
            }
        }

        @media (max-width: 576px) {
            .stay-grid .grid-wrapper {
                grid-template-columns: 1fr;
                max-width: 400px;
                margin: 0 auto;
            }

            .stay-card .card-image {
                height: 200px;
            }

            .stats-bar .stats-wrapper {
                gap: 20px;
            }

            .stats-bar .stat-item .stat-number {
                font-size: 1.4rem;
            }

            .page-header h1 {
                font-size: 1.5rem;
            }

            .page-header p {
                font-size: 0.9rem;
            }

            .stay-card .card-body .card-header {
                flex-direction: column;
                gap: 4px;
            }
        }
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<!-- Page Header -->
<section class="page-header">
    <div class="container">

        <div class="header-content" data-aos="fade-up">

            <span class="header-badge">
                <i class="fa-solid fa-hotel"></i>
                Accommodation
            </span>

            <h1>
                Wildlife <span>Accommodation</span>
            </h1>

            <p>
                Find your perfect stay in the heart of nature
            </p>

        </div>

    </div>
</section>


<!-- Stats Bar -->
<section class="stats-bar"
         data-aos="fade-up"
         data-aos-delay="100">

    <div class="container">

        <div class="stats-wrapper">

            <div class="stat-item">

                <div class="stat-number"
                     id="totalStays">
                    0
                </div>

                <div class="stat-label">
                    <i class="fa-regular fa-building"></i>
                    Total Stays
                </div>

            </div>


            <div class="stat-item">

                <div class="stat-number"
                     id="avgPrice">
                    ₹0
                </div>

                <div class="stat-label">
                    <i class="fa-regular fa-currency-sign"></i>
                    Avg Price
                </div>

            </div>


            <div class="stat-item">

                <div class="stat-number"
                     id="locations">
                    0
                </div>

                <div class="stat-label">
                    <i class="fa-regular fa-location-dot"></i>
                    Locations
                </div>

            </div>

        </div>

    </div>
</section>


<!-- Stay Grid -->
<section class="stay-grid">

<div class="container">

<div class="grid-wrapper" id="stayGrid">

<%

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    int count = 0;
    double totalPrice = 0;


    try {

        /*
         * IMPORTANT:
         * We no longer connect to:
         *
         * jdbc:mysql://localhost:3306/wildlife
         *
         * Connector.java handles the
         * Render -> Aiven connection.
         */

        conn = Connector.requestConnection();


        if (conn == null) {

            throw new SQLException(
                "Database connection could not be established."
            );

        }


        String sql =
            "SELECT name, description, price_per_night, image_url FROM stay";


        ps = conn.prepareStatement(sql);

        rs = ps.executeQuery();


        while (rs.next()) {


            String name =
                rs.getString("name");


            String desc =
                rs.getString("description");


            double price =
                rs.getDouble("price_per_night");


            String image =
                rs.getString("image_url");


            count++;

            totalPrice += price;

%>


<div class="stay-card"
     data-aos="fade-up"
     data-aos-delay="<%= (count % 4) * 100 + 100 %>">


    <div class="card-image-wrapper">


        <img
            src="<%= image %>"
            alt="<%= name %>"
            class="card-image"

            onerror="
                this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Accommodation'
            "
        >


        <span class="card-badge">

            <i class="fa-regular fa-star"></i>

            Available

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


        <p class="card-description">

            <%= desc %>

        </p>


        <div class="card-actions">


            <a
                href="booking.jsp?itemType=Stay&itemName=<%= name %>&price=<%= price %>&imageURL=<%= image %>"
                class="btn btn-book"
            >

                <i class="fa-solid fa-calendar-check"></i>

                Book Now

            </a>


        </div>


    </div>


</div>


<%

        }


        if (count == 0) {

%>


<div class="empty-state">


    <div class="empty-icon">

        <i class="fa-regular fa-face-frown"></i>

    </div>


    <h3>
        No Accommodations Available
    </h3>


    <p>
        Check back later for exciting stay options.
    </p>


</div>


<%

        }


    } catch (Exception e) {


        System.out.println(
            "Stay page database error: "
            + e.getMessage()
        );


        e.printStackTrace();

%>


<div class="empty-state">


    <div class="empty-icon">

        <i
            class="fa-solid fa-circle-exclamation"
            style="color:#dc2626;">
        </i>

    </div>


    <h3 style="color:#dc2626;">
        Error Loading Accommodations
    </h3>


    <p>
        Unable to load accommodation information
        from the database.
    </p>


</div>


<%

    } finally {


        if (rs != null) {

            try {

                rs.close();

            } catch (SQLException e) {

                e.printStackTrace();

            }

        }


        if (ps != null) {

            try {

                ps.close();

            } catch (SQLException e) {

                e.printStackTrace();

            }

        }


        if (conn != null) {

            try {

                conn.close();

            } catch (SQLException e) {

                e.printStackTrace();

            }

        }

    }

%>

</div>

</div>

</section>


<%@ include file="footer.jsp" %>


<!-- Scripts -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>


<script>

    AOS.init({
        duration: 800,
        easing: 'ease-out',
        once: true,
        offset: 50
    });


    document.addEventListener(
        'DOMContentLoaded',
        function() {


            const stayCards =
                document.querySelectorAll(
                    '.stay-card'
                );


            const totalStays =
                stayCards.length;


            document.getElementById(
                'totalStays'
            ).textContent =
                totalStays;


            if (totalStays > 0) {


                let totalPrice = 0;


                stayCards.forEach(
                    function(card) {


                        const priceText =
                            card.querySelector(
                                '.card-price'
                            ).textContent;


                        const price =
                            parseFloat(
                                priceText
                                .replace('₹', '')
                                .replace('/night', '')
                            );


                        if (!isNaN(price)) {

                            totalPrice += price;

                        }

                    }
                );


                const avgPrice =
                    totalPrice /
                    totalStays;


                document.getElementById(
                    'avgPrice'
                ).textContent =
                    '₹' +
                    avgPrice.toFixed(0);


                document.getElementById(
                    'locations'
                ).textContent =
                    totalStays;

            }

        }
    );

</script>

</body>
</html>