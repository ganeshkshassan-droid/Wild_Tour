<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wildlife Experience Dashboard</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    
    <!-- AOS Animation Library -->
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
            overflow-x: hidden;
        }

        /* ----- Hero Carousel Section ----- */
        .hero-carousel-wrapper {
            position: relative;
            margin-top: 0;
            overflow: hidden;
        }

        .hero-carousel {
            position: relative;
        }

        .hero-carousel .carousel-item {
            height: 92vh;
            min-height: 500px;
            overflow: hidden;
        }

        .hero-carousel .carousel-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transform: scale(1);
            transition: transform 8s ease-in-out;
        }

        .hero-carousel .carousel-item.active img {
            transform: scale(1.08);
        }

        /* Gradient overlay */
        .hero-carousel .carousel-item::after {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(
                180deg,
                rgba(6, 18, 8, 0.20) 0%,
                rgba(6, 18, 8, 0.40) 40%,
                rgba(3, 10, 5, 0.80) 100%
            );
            z-index: 1;
        }

        /* Carousel Caption - Enhanced */
        .hero-carousel .carousel-caption {
            position: absolute;
            bottom: 20%;
            left: 8%;
            right: 8%;
            z-index: 2;
            text-align: left;
            animation: fadeInUp 1s ease forwards;
            opacity: 0;
        }

        .hero-carousel .carousel-item.active .carousel-caption {
            animation: fadeInUp 1s ease 0.3s forwards;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero-carousel .carousel-caption .badge-top {
            display: inline-block;
            background: rgba(46, 125, 50, 0.25);
            backdrop-filter: blur(8px);
            padding: 6px 18px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: #a5d6a7;
            border: 1px solid rgba(165, 214, 167, 0.20);
            margin-bottom: 16px;
        }

        .hero-carousel .carousel-caption h1 {
            font-size: 4.2rem;
            font-weight: 900;
            line-height: 1.1;
            color: #ffffff;
            text-shadow: 0 4px 30px rgba(0, 0, 0, 0.30);
            letter-spacing: -1px;
            margin-bottom: 12px;
        }

        .hero-carousel .carousel-caption h1 span {
            background: linear-gradient(135deg, #a5d6a7, #66bb6a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-carousel .carousel-caption p {
            font-size: 1.15rem;
            font-weight: 300;
            color: rgba(255, 255, 255, 0.80);
            max-width: 500px;
            margin-bottom: 20px;
            text-shadow: 0 2px 20px rgba(0, 0, 0, 0.20);
        }

        .hero-carousel .carousel-caption .btn-explore {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 14px 32px;
            background: #2e7d32;
            color: white;
            border: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1rem;
            transition: all 0.3s ease;
            text-decoration: none;
            box-shadow: 0 8px 30px rgba(46, 125, 50, 0.30);
        }

        .hero-carousel .carousel-caption .btn-explore:hover {
            background: #1b5e20;
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(46, 125, 50, 0.40);
        }

        .hero-carousel .carousel-caption .btn-explore i {
            transition: transform 0.3s ease;
        }

        .hero-carousel .carousel-caption .btn-explore:hover i {
            transform: translateX(6px);
        }

        /* Carousel Indicators - Custom */
        .hero-carousel .carousel-indicators {
            bottom: 30px;
            gap: 10px;
        }

        .hero-carousel .carousel-indicators button {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            border: 2px solid rgba(255, 255, 255, 0.40);
            background: transparent;
            transition: all 0.3s ease;
        }

        .hero-carousel .carousel-indicators button.active {
            background: #a5d6a7;
            border-color: #a5d6a7;
            transform: scale(1.2);
        }

        /* Scroll Indicator */
        .scroll-indicator {
            position: absolute;
            bottom: 80px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 2;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 6px;
            color: rgba(255, 255, 255, 0.50);
            font-size: 0.7rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            animation: bounceDown 2s infinite;
        }

        @keyframes bounceDown {
            0%, 100% { transform: translateX(-50%) translateY(0); }
            50% { transform: translateX(-50%) translateY(10px); }
        }

        .scroll-indicator i {
            font-size: 1.2rem;
        }

        /* ----- Responsive Carousel ----- */
        @media (max-width: 992px) {
            .hero-carousel .carousel-item {
                height: 80vh;
                min-height: 400px;
            }

            .hero-carousel .carousel-caption h1 {
                font-size: 3rem;
            }

            .hero-carousel .carousel-caption {
                bottom: 15%;
            }
        }

        @media (max-width: 576px) {
            .hero-carousel .carousel-item {
                height: 70vh;
                min-height: 350px;
            }

            .hero-carousel .carousel-caption h1 {
                font-size: 2rem;
            }

            .hero-carousel .carousel-caption p {
                font-size: 0.95rem;
            }

            .hero-carousel .carousel-caption .btn-explore {
                padding: 10px 24px;
                font-size: 0.9rem;
            }

            .hero-carousel .carousel-caption .badge-top {
                font-size: 0.65rem;
                padding: 4px 14px;
            }

            .scroll-indicator {
                display: none;
            }
        }

        /* ----- Dashboard Extra Section - Styled ----- */
        .dashboard-extra {
            padding: 60px 0;
            background: #ffffff;
        }

        .section-header {
            text-align: center;
            margin-bottom: 48px;
        }

        .section-header .section-badge {
            display: inline-block;
            background: #e8f5e9;
            color: #2e7d32;
            padding: 4px 16px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .section-header h2 {
            font-size: 2.4rem;
            font-weight: 800;
            color: #1a2e1a;
            letter-spacing: -0.5px;
        }

        .section-header h2 span {
            color: #2e7d32;
        }

        .section-header p {
            color: #6b7a6b;
            font-size: 1.05rem;
            max-width: 600px;
            margin: 8px auto 0;
        }

        /* Stats Cards */
        .stat-card {
            background: #f7faf7;
            border-radius: 16px;
            padding: 30px 20px;
            text-align: center;
            transition: all 0.3s ease;
            border: 1px solid #e8eee8;
            height: 100%;
        }

        .stat-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.06);
            border-color: #a5d6a7;
        }

        .stat-card .stat-icon {
            width: 60px;
            height: 60px;
            background: #e8f5e9;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            color: #2e7d32;
            margin-bottom: 16px;
        }

        .stat-card h3 {
            font-size: 2.2rem;
            font-weight: 800;
            color: #1a2e1a;
            margin: 0;
        }

        .stat-card p {
            color: #6b7a6b;
            font-size: 0.95rem;
            margin: 4px 0 0;
        }

        /* Feature Cards */
        .feature-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 28px 24px;
            border: 1px solid #e8eee8;
            transition: all 0.3s ease;
            height: 100%;
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #2e7d32, #66bb6a);
            transform: scaleX(0);
            transition: transform 0.4s ease;
        }

        .feature-card:hover::before {
            transform: scaleX(1);
        }

        .feature-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.06);
            border-color: #a5d6a7;
        }

        .feature-card .feature-icon {
            font-size: 32px;
            color: #2e7d32;
            margin-bottom: 14px;
        }

        .feature-card h5 {
            font-weight: 700;
            color: #1a2e1a;
            margin-bottom: 8px;
        }

        .feature-card p {
            color: #6b7a6b;
            font-size: 0.92rem;
            margin: 0;
            line-height: 1.6;
        }

        .feature-card .learn-more {
            display: inline-block;
            margin-top: 12px;
            color: #2e7d32;
            font-weight: 600;
            font-size: 0.88rem;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .feature-card .learn-more i {
            transition: transform 0.3s ease;
        }

        .feature-card .learn-more:hover i {
            transform: translateX(4px);
        }

        /* ----- Footer Styling ----- */
        .site-footer {
            background: #0f1f12;
            color: rgba(255, 255, 255, 0.70);
            padding: 40px 0 24px;
        }

        .site-footer h5 {
            color: #ffffff;
            font-weight: 700;
            margin-bottom: 16px;
        }

        .site-footer a {
            color: rgba(255, 255, 255, 0.60);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .site-footer a:hover {
            color: #a5d6a7;
        }

        .site-footer .footer-divider {
            border-color: rgba(255, 255, 255, 0.05);
            margin: 20px 0;
        }

        .site-footer .copyright {
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.40);
        }

        /* ----- Responsive Adjustments ----- */
        @media (max-width: 768px) {
            .dashboard-extra {
                padding: 40px 0;
            }

            .section-header h2 {
                font-size: 1.8rem;
            }

            .stat-card h3 {
                font-size: 1.8rem;
            }
        }
    </style>
</head>
<body>

    <!-- Header -->
    <%@ include file="header.jsp" %>

    <!-- Hero Carousel Section -->
    <section class="hero-carousel-wrapper">
        <div id="heroCarousel" class="hero-carousel carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="4000">
            
            <!-- Indicators -->
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="0" class="active" aria-label="Slide 1"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="3" aria-label="Slide 4"></button>
                <button type="button" data-bs-target="#heroCarousel" data-bs-slide-to="4" aria-label="Slide 5"></button>
            </div>

            <!-- Slides -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://redearth.in/blog/wp-content/uploads/2021/03/dsc-1324-1-denoiseai-denoise-1-2000x2801-1.jpeg" alt="Wildlife Experience">
                    <div class="carousel-caption">
                        <span class="badge-top"><i class="fa-solid fa-paw"></i> Discover the Wild</span>
                        <h1>The Best <span>Experience</span><br>of Joy</h1>
                        <p>Immerse yourself in nature's finest moments and create memories that last a lifetime.</p>
                        <a href="photography.jsp" class="btn-explore">
                            Explore Now <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
                
                <div class="carousel-item">
                    <img src="https://bsmedia.business-standard.com/_media/bs/img/article/2024-06/04/full/1717494477-7858.jpg" alt="Wildlife Safari">
                    <div class="carousel-caption">
                        <span class="badge-top"><i class="fa-solid fa-binoculars"></i> Safari Adventure</span>
                        <h1>Explore <span>Wildlife</span><br>Up Close</h1>
                        <p>Witness majestic creatures in their natural habitat with our expert-guided safaris.</p>
                        <a href="safari.jsp" class="btn-explore">
                            Book Safari <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
                
                <div class="carousel-item">
                    <img src="https://www.holidaymonk.com/wp-content/uploads/2022/05/Black-Panther-in-Kabini-Forest-of-India.webp" alt="Black Panther">
                    <div class="carousel-caption">
                        <span class="badge-top"><i class="fa-solid fa-camera"></i> Photo Moments</span>
                        <h1><span>Adventure</span> Awaits<br>In the Wild</h1>
                        <p>Capture breathtaking moments and experience the thrill of the untamed wilderness.</p>
                        <a href="wildlifeSighting.jsp" class="btn-explore">
                            Start Adventure <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
                
                <div class="carousel-item">
                    <img src="https://cdn.prod.website-files.com/65aa483b5ed7ebb96ac699bd/67286ca186705e69a6ef444a_65f043c2529f3eeb65e13f73_chital-kabini.jpeg" alt="Chital Deer">
                    <div class="carousel-caption">
                        <span class="badge-top"><i class="fa-solid fa-tree"></i> Nature's Beauty</span>
                        <h1><span>Wild</span> Encounters<br>Await You</h1>
                        <p>From majestic deer to exotic birds, experience the diversity of wildlife like never before.</p>
                        <a href="about.jsp" class="btn-explore">
                            Learn More <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
                
                <div class="carousel-item">
                    <img src="https://cdn.prod.website-files.com/65aa483b5ed7ebb96ac699bd/67286ca186705e69a6ef446a_65f043526343cbb813332585_gaur-male.jpeg" alt="Gaur">
                    <div class="carousel-caption">
                        <span class="badge-top"><i class="fa-solid fa-mountain"></i> Wildlife Giants</span>
                        <h1><span>Majestic</span> Creatures<br>Of the Wild</h1>
                        <p>Encounter the gentle giants of the forest and discover the wonders of the animal kingdom.</p>
                        <a href="guide.jsp" class="btn-explore">
                            Discover More <i class="fa-solid fa-arrow-right"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Scroll Indicator -->
            <div class="scroll-indicator">
                <span>Scroll</span>
                <i class="fa-solid fa-chevron-down"></i>
            </div>
        </div>
    </section>

    <!-- Dashboard Extra Section -->
    <%@ include file="dashboardExtra.jsp" %>

    <!-- Footer -->
    <%@ include file="footer.jsp" %>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- AOS Animation Library -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        // Initialize AOS animations
        AOS.init({
            duration: 800,
            easing: 'ease-out',
            once: true,
            offset: 50
        });

        // Optional: Auto-play pause on hover for better UX
        document.addEventListener('DOMContentLoaded', function() {
            const carousel = document.getElementById('heroCarousel');
            const bsCarousel = new bootstrap.Carousel(carousel, {
                interval: 2000,
                pause: 'hover',
                wrap: true
            });
        });
    </script>
</body>
</html>