<%@ page import="java.sql.*" %>
<%@ page import="com.wild_tour.connection.Connector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Safari Services | Wildlife Tourism</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

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

        /* ================= HEADER ================= */

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
                    rgba(46,125,50,0.08) 0%,
                    transparent 60%
                ),
                radial-gradient(
                    circle at 70% 50%,
                    rgba(165,214,167,0.05) 0%,
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

            background: rgba(46,125,50,0.20);

            border: 1px solid rgba(165,214,167,0.15);

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
            color: rgba(255,255,255,0.60);
            font-size: 1.05rem;
            margin-top: 8px;
        }

        /* ================= STATS ================= */

        .stats-bar {
            background: #ffffff;

            padding: 20px 0;

            border-bottom: 1px solid #e8eee8;

            box-shadow: 0 2px 12px rgba(0,0,0,0.02);
        }

        .stats-wrapper {
            display: flex;
            justify-content: center;

            gap: 60px;

            flex-wrap: wrap;
        }

        .stat-item {
            text-align: center;
        }

        .stat-number {
            font-size: 2rem;
            font-weight: 800;
            color: #2e7d32;
        }

        .stat-label {
            font-size: 0.85rem;
            color: #6b7a6b;
            font-weight: 500;
        }

        /* ================= GRID ================= */

        .safari-grid {
            padding: 40px 0 60px;
        }

        .grid-wrapper {

            display: grid;

            grid-template-columns:
                repeat(auto-fill, minmax(320px,1fr));

            gap: 30px;

            padding: 0 20px;
        }

        /* ================= CARD ================= */

        .safari-card {

            background: #ffffff;

            border-radius: 24px;

            overflow: hidden;

            box-shadow:
                0 4px 20px rgba(0,0,0,0.04);

            border: 1px solid #e8eee8;

            transition: all 0.4s
                cubic-bezier(0.34,1.56,0.64,1);

            position: relative;
        }

        .safari-card:hover {

            transform: translateY(-10px);

            box-shadow:
                0 20px 60px rgba(0,0,0,0.10);

            border-color: #a5d6a7;
        }

        .card-image-wrapper {
            position: relative;
            overflow: hidden;
        }

        .card-image {

            width: 100%;
            height: 240px;

            object-fit: cover;

            transition: transform 0.6s ease;
        }

        .safari-card:hover .card-image {
            transform: scale(1.05);
        }

        .card-badge {

            position: absolute;

            top: 16px;
            right: 16px;

            background: rgba(46,125,50,0.85);

            padding: 4px 14px;

            border-radius: 50px;

            color: #ffffff;

            font-size: 0.7rem;
            font-weight: 600;
        }

        .safari-card .card-body {
            padding: 24px;
        }

        .card-header {

            display: flex;

            justify-content: space-between;

            align-items: flex-start;

            margin-bottom: 10px;
        }

        .card-header h3 {

            font-weight: 700;

            font-size: 1.3rem;

            color: #1a2e1a;

            margin: 0;
        }

        .card-price {

            font-size: 1.3rem;

            font-weight: 800;

            color: #2e7d32;
        }

        .card-price small {

            font-size: 0.75rem;

            font-weight: 400;

            color: #6b7a6b;
        }

        .card-description {

            color: #6b7a6b;

            font-size: 0.92rem;

            line-height: 1.6;

            margin-bottom: 18px;

            display: -webkit-box;

            -webkit-line-clamp: 3;

            -webkit-box-orient: vertical;

            overflow: hidden;
        }

        /* ================= BUTTON ================= */

        .card-actions {
            display: flex;
            gap: 12px;
        }

        .card-actions .btn {

            flex: 1;

            padding: 12px 20px;

            border-radius: 14px;

            font-weight: 700;

            font-size: 0.92rem;

            transition: all 0.35s ease;

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 10px;

            border: none;

            text-decoration: none;
        }

        .btn-book {

            background:
                linear-gradient(
                    145deg,
                    #2e7d32,
                    #1b5e20
                );

            color: white;

            box-shadow:
                0 8px 30px rgba(46,125,50,0.25);
        }

        .btn-book:hover {

            transform: translateY(-3px);

            background:
                linear-gradient(
                    145deg,
                    #388e3c,
                    #2e7d32
                );

            color: white;
        }

        /* ================= EMPTY / ERROR ================= */

        .empty-state {

            text-align: center;

            padding: 80px 20px;

            grid-column: 1 / -1;
        }

        .empty-icon {

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

        /* ================= RESPONSIVE ================= */

        @media(max-width:768px) {

            .page-header h1 {
                font-size: 1.8rem;
            }

            .grid-wrapper {

                grid-template-columns:
                    1fr 1fr;

                gap: 16px;
            }
        }

        @media(max-width:576px) {

            .grid-wrapper {

                grid-template-columns:1fr;

                max-width:400px;

                margin:auto;
            }

            .page-header h1 {
                font-size:1.5rem;
            }
        }

    </style>

</head>

<body>

<%@ include file="header.jsp" %>


<!-- ================= PAGE HEADER ================= -->

<section class="page-header">

    <div class="container">

        <div class="header-content"
             data-aos="fade-up">

            <span class="header-badge">

                <i class="fa-solid fa-tree"></i>
                Safari Services

            </span>

            <h1>

                Explore the Best
                <span>Wildlife Safaris</span>

            </h1>

            <p>

                Discover thrilling safari experiences
                in the heart of nature

            </p>

        </div>

    </div>

</section>


<!-- ================= STATS ================= -->

<section class="stats-bar">

    <div class="container">

        <div class="stats-wrapper">

            <div class="stat-item">

                <div
                    class="stat-number"
                    id="totalSafaris">

                    0

                </div>

                <div class="stat-label">

                    <i class="fa-regular fa-compass"></i>

                    Total Safaris

                </div>

            </div>


            <div class="stat-item">

                <div
                    class="stat-number"
                    id="avgPrice">

                    ₹0

                </div>

                <div class="stat-label">

                    Average Price

                </div>

            </div>


            <div class="stat-item">

                <div
                    class="stat-number"
                    id="locations">

                    0

                </div>

                <div class="stat-label">

                    Locations

                </div>

            </div>

        </div>

    </div>

</section>


<!-- ================= SAFARI DATA ================= -->

<section class="safari-grid">

<div class="container">

<div class="grid-wrapper" id="safariGrid">

<%

Connection conn = null;

PreparedStatement ps = null;

ResultSet rs = null;

int count = 0;

double totalPrice = 0;


try {

    /*
     * IMPORTANT:
     *
     * Do NOT use:
     *
     * jdbc:mysql://localhost:3306/wildlife
     *
     * Render cannot connect to your
     * laptop localhost.
     *
     * Connector.java now handles
     * the Aiven connection.
     */

    conn = Connector.requestConnection();


    if (conn == null) {

        throw new SQLException(
            "Database connection could not be established."
        );

    }


    String query =
        "SELECT safari_id, name, description, " +
        "price_per_seat, image_url FROM safari";


    ps = conn.prepareStatement(query);


    rs = ps.executeQuery();


    while (rs.next()) {


        int id =
            rs.getInt("safari_id");


        String name =
            rs.getString("name");


        String desc =
            rs.getString("description");


        double price =
            rs.getDouble("price_per_seat");


        String image =
            rs.getString("image_url");


        count++;


        totalPrice += price;

%>


<div class="safari-card"
     data-aos="fade-up">


    <div class="card-image-wrapper">


        <img
            src="<%= image %>"
            alt="<%= name %>"
            class="card-image"

            onerror="
                this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Wildlife+Safari'
            "
        >


        <span class="card-badge">

            <i class="fa-regular fa-clock"></i>

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
                    /seat
                </small>

            </div>


        </div>


        <p class="card-description">

            <%= desc %>

        </p>


        <div class="card-actions">


            <a
                href="booking.jsp?itemType=Safari&itemName=<%= name %>&price=<%= price %>&imageURL=<%= image %>"

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
        No Safaris Available
    </h3>


    <p>

        Check back later for exciting
        safari experiences.

    </p>


</div>


<%

    }


} catch (Exception e) {


    System.out.println(
        "Safari page database error: "
        + e.getMessage()
    );


    e.printStackTrace();

%>


<div class="empty-state">


    <div
        class="empty-icon"
        style="color:#dc2626;"
    >

        <i class="fa-solid fa-circle-exclamation"></i>

    </div>


    <h3 style="color:#dc2626;">

        Error Loading Safaris

    </h3>


    <p>

        Unable to load safari information
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


<!-- ================= JAVASCRIPT ================= -->


<script
src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
</script>


<script
src="https://unpkg.com/aos@2.3.1/dist/aos.js">
</script>


<script>

AOS.init({

    duration:800,

    easing:'ease-out',

    once:true,

    offset:50

});


document.addEventListener(
'DOMContentLoaded',
function() {


    const safariCards =
        document.querySelectorAll(
            '.safari-card'
        );


    const totalSafaris =
        safariCards.length;


    document.getElementById(
        'totalSafaris'
    ).textContent =
        totalSafaris;


    if (totalSafaris > 0) {


        let totalPrice = 0;


        safariCards.forEach(
            function(card) {


                const priceText =
                    card.querySelector(
                        '.card-price'
                    ).textContent;


                const price =
                    parseFloat(
                        priceText
                        .replace('₹','')
                        .replace('/seat','')
                    );


                if (!isNaN(price)) {

                    totalPrice += price;

                }

            }
        );


        const avgPrice =
            totalPrice /
            totalSafaris;


        document.getElementById(
            'avgPrice'
        ).textContent =
            '₹' +
            avgPrice.toFixed(0);


        document.getElementById(
            'locations'
        ).textContent =
            totalSafaris;

    }

});

</script>


</body>

</html>