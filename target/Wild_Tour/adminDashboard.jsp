<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | Wildlife Tourism</title>
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
            display: flex;
            flex-direction: column;
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

        /* ----- Navigation Bar (Action Buttons) ----- */
        .action-nav {
            background: #ffffff;
            padding: 20px 0;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            border-bottom: 1px solid #e8eee8;
            position: sticky;
            top: 0;
            z-index: 100;
            backdrop-filter: blur(12px);
            background: rgba(255, 255, 255, 0.92);
        }

        .action-nav .nav-wrapper {
            display: flex;
            justify-content: center;
            gap: 16px;
            flex-wrap: wrap;
        }

        .action-nav .nav-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 12px 28px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.92rem;
            transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
            border: 1px solid #e0e8e0;
            color: #1a2e1a;
            background: #f7faf7;
        }

        .action-nav .nav-btn i {
            font-size: 1rem;
            transition: transform 0.3s ease;
        }

        .action-nav .nav-btn:hover {
            background: #2e7d32;
            color: #ffffff;
            border-color: #2e7d32;
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(46, 125, 50, 0.25);
        }

        .action-nav .nav-btn:hover i {
            transform: rotate(-8deg) scale(1.1);
        }

        /* ----- Dashboard Cards ----- */
        .dashboard-section {
            padding: 50px 0 60px;
            flex: 1;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 30px;
            padding: 0 20px;
        }

        .dashboard-card {
            background: #ffffff;
            border-radius: 24px;
            padding: 36px 24px 32px;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            border: 1px solid #e8eee8;
            position: relative;
            overflow: hidden;
            cursor: pointer;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
        }

        .dashboard-card::before {
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
        }

        .dashboard-card:hover::before {
            transform: scaleX(1);
        }

        .dashboard-card:hover {
            transform: translateY(-10px) scale(1.01);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
            border-color: #a5d6a7;
        }

        /* Card Icon - Large Minimal Icon */
        .dashboard-card .card-icon {
            width: 100px;
            height: 100px;
            margin: 0 auto 20px;
            border-radius: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 42px;
            transition: all 0.4s ease;
            background: #e8f5e9;
            color: #2e7d32;
            position: relative;
        }

        .dashboard-card:hover .card-icon {
            background: #2e7d32;
            color: #ffffff;
            transform: translateY(-4px) scale(1.05);
            box-shadow: 0 8px 30px rgba(46, 125, 50, 0.25);
        }

        .dashboard-card .card-icon i {
            transition: transform 0.4s ease;
        }

        .dashboard-card:hover .card-icon i {
            transform: scale(1.1) rotate(-4deg);
        }

        /* Card content */
        .dashboard-card h2 {
            font-weight: 800;
            font-size: 1.5rem;
            color: #1a2e1a;
            margin-bottom: 4px;
        }

        .dashboard-card .card-count {
            font-size: 2.4rem;
            font-weight: 900;
            color: #2e7d32;
            margin: 4px 0 6px;
        }

        .dashboard-card .card-count .count-label {
            font-size: 0.85rem;
            font-weight: 400;
            color: #6b7a6b;
        }

        .dashboard-card p {
            color: #6b7a6b;
            font-size: 0.92rem;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        .dashboard-card .card-btn {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 10px 24px;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.88rem;
            transition: all 0.35s ease;
            border: 1px solid #e0e8e0;
            color: #1a2e1a;
            background: #f7faf7;
        }

        .dashboard-card .card-btn i {
            transition: transform 0.3s ease;
        }

        .dashboard-card .card-btn:hover {
            background: #2e7d32;
            color: #ffffff;
            border-color: #2e7d32;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(46, 125, 50, 0.20);
        }

        .dashboard-card .card-btn:hover i {
            transform: translateX(4px);
        }

        /* Card decorative dot pattern */
        .dashboard-card .card-pattern {
            position: absolute;
            bottom: -20px;
            right: -20px;
            width: 120px;
            height: 120px;
            background: radial-gradient(circle at 30% 30%, rgba(46, 125, 50, 0.04) 0%, transparent 60%);
            border-radius: 50%;
            pointer-events: none;
            transition: all 0.5s ease;
        }

        .dashboard-card:hover .card-pattern {
            transform: scale(1.2);
            opacity: 0.5;
        }

        /* ----- Footer spacing ----- */
        footer {
            margin-top: auto;
        }

        /* ----- Responsive ----- */
        @media (max-width: 992px) {
            .page-header h1 {
                font-size: 2.2rem;
            }

            .action-nav .nav-wrapper {
                gap: 12px;
            }

            .action-nav .nav-btn {
                padding: 10px 20px;
                font-size: 0.85rem;
            }

            .dashboard-grid {
                grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
                gap: 20px;
            }
        }

        @media (max-width: 768px) {
            .page-header {
                padding: 30px 0 24px;
            }

            .page-header h1 {
                font-size: 1.8rem;
            }

            .action-nav {
                padding: 14px 0;
            }

            .action-nav .nav-wrapper {
                gap: 8px;
            }

            .action-nav .nav-btn {
                padding: 8px 16px;
                font-size: 0.8rem;
                gap: 6px;
            }

            .action-nav .nav-btn i {
                font-size: 0.85rem;
            }

            .dashboard-section {
                padding: 30px 0 40px;
            }

            .dashboard-grid {
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 16px;
                padding: 0 12px;
            }

            .dashboard-card {
                padding: 28px 16px 24px;
                border-radius: 18px;
            }

            .dashboard-card .card-icon {
                width: 80px;
                height: 80px;
                font-size: 32px;
                border-radius: 20px;
            }

            .dashboard-card h2 {
                font-size: 1.2rem;
            }

            .dashboard-card .card-count {
                font-size: 2rem;
            }

            .dashboard-card .card-btn {
                padding: 8px 18px;
                font-size: 0.8rem;
            }
        }

        @media (max-width: 480px) {
            .page-header h1 {
                font-size: 1.5rem;
            }

            .page-header p {
                font-size: 0.9rem;
            }

            .action-nav .nav-btn {
                padding: 6px 14px;
                font-size: 0.75rem;
                gap: 4px;
            }

            .action-nav .nav-btn i {
                font-size: 0.75rem;
            }

            .dashboard-grid {
                grid-template-columns: 1fr 1fr;
                gap: 12px;
            }

            .dashboard-card {
                padding: 20px 12px 18px;
            }

            .dashboard-card .card-icon {
                width: 64px;
                height: 64px;
                font-size: 26px;
                border-radius: 16px;
                margin-bottom: 12px;
            }

            .dashboard-card h2 {
                font-size: 1rem;
            }

            .dashboard-card .card-count {
                font-size: 1.6rem;
            }

            .dashboard-card p {
                font-size: 0.8rem;
                margin-bottom: 14px;
            }

            .dashboard-card .card-btn {
                padding: 6px 14px;
                font-size: 0.75rem;
            }
        }

        @media (max-width: 380px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
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
            <span class="header-badge"><i class="fa-solid fa-gauge-high"></i> Admin Panel</span>
            <h1>Wildlife <span>Tourism</span> Dashboard</h1>
            <p>Manage your wildlife tourism content efficiently</p>
        </div>
    </div>
</section>

<!-- Action Navigation -->
<section class="action-nav">
    <div class="container">
        <div class="nav-wrapper" data-aos="fade-up" data-aos-delay="100">
            <a href="addsafari.jsp" class="nav-btn">
                <i class="fa-solid fa-plus"></i> Add Safari
            </a>
            <a href="add_stay.jsp" class="nav-btn">
                <i class="fa-solid fa-plus"></i> Add Stay
            </a>
            <a href="add_packages.jsp" class="nav-btn">
                <i class="fa-solid fa-plus"></i> Add Packages
            </a>
            <a href="add_guide.jsp" class="nav-btn">
                <i class="fa-solid fa-plus"></i> Add Guides
            </a>
        </div>
    </div>
</section>

<!-- Dashboard Cards -->
<section class="dashboard-section">
    <div class="container">
        <div class="dashboard-grid">
            
            <!-- Safari Card -->
            <div class="dashboard-card" data-aos="fade-up" data-aos-delay="100">
                <div class="card-pattern"></div>
                <div class="card-icon">
                    <i class="fa-solid fa-tree"></i>
                </div>
                <h2>Safari</h2>
                <div class="card-count">12 <span class="count-label">total</span></div>
                <p>View and manage safari details</p>
                <a href="viewSafari.jsp" class="card-btn">
                    View Safari <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>

            <!-- Stay Card -->
            <div class="dashboard-card" data-aos="fade-up" data-aos-delay="200">
                <div class="card-pattern"></div>
                <div class="card-icon">
                    <i class="fa-solid fa-hotel"></i>
                </div>
                <h2>Stay</h2>
                <div class="card-count">8 <span class="count-label">total</span></div>
                <p>View and manage stay options</p>
                <a href="viewStay.jsp" class="card-btn">
                    View Stay <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>

            <!-- Packages Card -->
            <div class="dashboard-card" data-aos="fade-up" data-aos-delay="300">
                <div class="card-pattern"></div>
                <div class="card-icon">
                    <i class="fa-solid fa-suitcase"></i>
                </div>
                <h2>Packages</h2>
                <div class="card-count">15 <span class="count-label">total</span></div>
                <p>View and manage tour packages</p>
                <a href="viewPackage.jsp" class="card-btn">
                    View Packages <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>

            <!-- Guides Card -->
            <div class="dashboard-card" data-aos="fade-up" data-aos-delay="400">
                <div class="card-pattern"></div>
                <div class="card-icon">
                    <i class="fa-solid fa-compass"></i>
                </div>
                <h2>Guides</h2>
                <div class="card-count">6 <span class="count-label">total</span></div>
                <p>View and manage guides</p>
                <a href="viewGuide.jsp" class="card-btn">
                    View Guides <i class="fa-solid fa-arrow-right"></i>
                </a>
            </div>

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

    // Add click functionality to entire card
    document.querySelectorAll('.dashboard-card').forEach(card => {
        card.addEventListener('click', function(e) {
            if (!e.target.closest('.card-btn')) {
                const btn = this.querySelector('.card-btn');
                if (btn) {
                    window.location.href = btn.href;
                }
            }
        });
    });
</script>

</body>
</html>