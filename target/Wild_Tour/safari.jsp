<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Safari Services | Wildlife Tourism</title>
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
            background: radial-gradient(circle at 30% 50%, rgba(46, 125, 50, 0.08) 0%, transparent 60%),
                        radial-gradient(circle at 70% 50%, rgba(165, 214, 167, 0.05) 0%, transparent 60%);
            pointer-events: none;
        }

        .page-header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #2e7d32, #66bb6a, #a5d6a7, #66bb6a, #2e7d32);
            background-size: 200% 100%;
            animation: gradientMove 4s ease-in-out infinite;
        }

        @keyframes gradientMove {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
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
            background: linear-gradient(135deg, #a5d6a7, #66bb6a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .page-header p {
            color: rgba(255, 255, 255, 0.60);
            font-size: 1.05rem;
            margin-top: 8px;
        }

        /* ----- Stats Bar ----- */
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
            color: #2e7d32;
        }

        .stats-bar .stat-item .stat-label {
            font-size: 0.85rem;
            color: #6b7a6b;
            font-weight: 500;
        }

        /* ----- Safari Grid ----- */
        .safari-grid {
            padding: 40px 0 60px;
        }

        .safari-grid .grid-wrapper {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 30px;
            padding: 0 20px;
        }

        /* ----- Safari Card ----- */
        .safari-card {
            background: #ffffff;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            border: 1px solid #e8eee8;
            transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            position: relative;
        }

        .safari-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.10);
            border-color: #a5d6a7;
        }

        .safari-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #2e7d32, #66bb6a);
            transform: scaleX(0);
            transition: transform 0.5s ease;
            transform-origin: left;
            z-index: 2;
        }

        .safari-card:hover::before {
            transform: scaleX(1);
        }

        .safari-card .card-image-wrapper {
            position: relative;
            overflow: hidden;
        }

        .safari-card .card-image {
            width: 100%;
            height: 240px;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .safari-card:hover .card-image {
            transform: scale(1.05);
        }

        .safari-card .card-image-wrapper .card-badge {
            position: absolute;
            top: 16px;
            right: 16px;
            background: rgba(46, 125, 50, 0.85);
            backdrop-filter: blur(8px);
            padding: 4px 14px;
            border-radius: 50px;
            color: #ffffff;
            font-size: 0.7rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            z-index: 1;
        }

        .safari-card .card-body {
            padding: 24px;
        }

        .safari-card .card-body .card-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 10px;
        }

        .safari-card .card-body h3 {
            font-weight: 700;
            font-size: 1.3rem;
            color: #1a2e1a;
            margin: 0;
        }

        .safari-card .card-body .card-price {
            font-size: 1.3rem;
            font-weight: 800;
            color: #2e7d32;
        }

        .safari-card .card-body .card-price small {
            font-size: 0.75rem;
            font-weight: 400;
            color: #6b7a6b;
        }

        .safari-card .card-body .card-description {
            color: #6b7a6b;
            font-size: 0.92rem;
            line-height: 1.6;
            margin-bottom: 18px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .safari-card .card-body .card-actions {
            display: flex;
            gap: 12px;
        }

        .safari-card .card-body .card-actions .btn {
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
            background: linear-gradient(145deg, #2e7d32, #1b5e20);
            color: #ffffff;
            box-shadow: 0 8px 30px rgba(46, 125, 50, 0.25);
        }

        .btn-book:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(46, 125, 50, 0.35);
            background: linear-gradient(145deg, #388e3c, #2e7d32);
            color: #ffffff;
        }

        .btn-book i {
            transition: transform 0.3s ease;
        }

        .btn-book:hover i {
            transform: translateX(4px);
        }

        /* ----- Empty State ----- */
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

        /* ----- Footer ----- */
        footer {
            margin-top: auto;
        }

        /* ----- Responsive ----- */
        @media (max-width: 992px) {
            .page-header h1 {
                font-size: 2.2rem;
            }

            .safari-grid .grid-wrapper {
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

            .safari-grid .grid-wrapper {
                grid-template-columns: 1fr 1fr;
                gap: 16px;
                padding: 0 12px;
            }

            .safari-card .card-body {
                padding: 18px;
            }

            .safari-card .card-image {
                height: 180px;
            }

            .safari-card .card-body h3 {
                font-size: 1.1rem;
            }

            .safari-card .card-body .card-price {
                font-size: 1.1rem;
            }

            .safari-card .card-body .card-actions .btn {
                font-size: 0.8rem;
                padding: 10px 14px;
            }
        }

        @media (max-width: 576px) {
            .safari-grid .grid-wrapper {
                grid-template-columns: 1fr;
                max-width: 400px;
                margin: 0 auto;
            }

            .safari-card .card-image {
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

            .safari-card .card-body .card-header {
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
            <span class="header-badge"><i class="fa-solid fa-tree"></i> Safari Services</span>
            <h1>Explore the Best <span>Wildlife Safaris</span></h1>
            <p>Discover thrilling safari experiences in the heart of nature</p>
        </div>
    </div>
</section>

<!-- Stats Bar -->
<section class="stats-bar" data-aos="fade-up" data-aos-delay="100">
    <div class="container">
        <div class="stats-wrapper">
            <div class="stat-item">
                <div class="stat-number" id="totalSafaris">0</div>
                <div class="stat-label"><i class="fa-regular fa-compass"></i> Total Safaris</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="avgPrice">₹0</div>
                <div class="stat-label"><i class="fa-regular fa-currency-sign"></i> Avg Price</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="locations">0</div>
                <div class="stat-label"><i class="fa-regular fa-location-dot"></i> Locations</div>
            </div>
        </div>
    </div>
</section>

<!-- Safari Grid -->
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
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/wildlife", "root", "ganesh@123");

                    String query = "SELECT safari_id, name, description, price_per_seat, image_url FROM safari";
                    ps = conn.prepareStatement(query);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        int id = rs.getInt("safari_id");
                        String name = rs.getString("name");
                        String desc = rs.getString("description");
                        double price = rs.getDouble("price_per_seat");
                        String image = rs.getString("image_url");
                        count++;
                        totalPrice += price;
            %>
                        <div class="safari-card" data-aos="fade-up" data-aos-delay="<%= (count % 4) * 100 + 100 %>">
                            <div class="card-image-wrapper">
                                <img src="<%= image %>" alt="<%= name %>" class="card-image" 
                                     onerror="this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Wildlife+Safari'">
                                <span class="card-badge"><i class="fa-regular fa-clock"></i> Available</span>
                            </div>
                            <div class="card-body">
                                <div class="card-header">
                                    <h3><%= name %></h3>
                                    <div class="card-price">₹<%= String.format("%.2f", price) %><small>/seat</small></div>
                                </div>
                                <p class="card-description"><%= desc %></p>
                                <div class="card-actions">
                                    <a href="booking.jsp?itemType=Safari&itemName=<%= name %>&price=<%= price %>&imageURL=<%= image %>" 
                                       class="btn btn-book">
                                        <i class="fa-solid fa-calendar-check"></i> Book Now
                                    </a>
                                </div>
                            </div>
                        </div>
            <%
                    }

                    if (count == 0) {
            %>
                        <div class="empty-state">
                            <div class="empty-icon"><i class="fa-regular fa-face-frown"></i></div>
                            <h3>No Safaris Available</h3>
                            <p>Check back later for exciting safari experiences.</p>
                        </div>
            <%
                    }
                } catch (Exception e) {
                    out.println("<div class='empty-state'>");
                    out.println("<div class='empty-icon'><i class='fa-regular fa-circle-exclamation' style='color: #dc2626;'></i></div>");
                    out.println("<h3 style='color: #dc2626;'>Error Loading Safaris</h3>");
                    out.println("<p>" + e.getMessage() + "</p>");
                    out.println("</div>");
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException e) {}
                    if (ps != null) try { ps.close(); } catch (SQLException e) {}
                    if (conn != null) try { conn.close(); } catch (SQLException e) {}
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
    // Initialize AOS animations
    AOS.init({
        duration: 800,
        easing: 'ease-out',
        once: true,
        offset: 50
    });

    // Update stats dynamically
    document.addEventListener('DOMContentLoaded', function() {
        const safariCards = document.querySelectorAll('.safari-card');
        const totalSafaris = safariCards.length;
        
        if (totalSafaris > 0) {
            document.getElementById('totalSafaris').textContent = totalSafaris;
            
            let totalPrice = 0;
            safariCards.forEach(card => {
                const priceText = card.querySelector('.card-price').textContent;
                const price = parseFloat(priceText.replace('₹', '').replace('/seat', ''));
                totalPrice += price;
            });
            const avgPrice = totalPrice / totalSafaris;
            document.getElementById('avgPrice').textContent = '₹' + avgPrice.toFixed(0);
            document.getElementById('locations').textContent = totalSafaris;
        }
    });
</script>

</body>
</html>