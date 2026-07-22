<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Wildlife Sightings | Wildlife Tourism</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>

    <style>
        /* ----- Reset & Base ----- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: #f7faf7;
            font-family: 'Inter', sans-serif;
            color: #1a2e1a;
            overflow-x: hidden;
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

        /* ----- Sighting Cards ----- */
        .sightings-container {
            padding: 40px 0 60px;
        }

        .sighting-card {
            background: #ffffff;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            border: 1px solid #e8eee8;
            margin-bottom: 30px;
            transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            position: relative;
        }

        .sighting-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 4px;
            height: 100%;
            background: linear-gradient(180deg, #2e7d32, #66bb6a);
            opacity: 0;
            transition: opacity 0.4s ease;
        }

        .sighting-card:hover::before {
            opacity: 1;
        }

        .sighting-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
            border-color: #a5d6a7;
        }

        .sighting-card .card-body {
            padding: 28px 32px;
            display: flex;
            gap: 30px;
            align-items: stretch;
        }

        .sighting-card .card-image-wrapper {
            flex: 0 0 40%;
            position: relative;
            overflow: hidden;
            border-radius: 16px;
            min-height: 250px;
        }

        .sighting-card .card-image-wrapper img {
            width: 100%;
            height: 100%;
            min-height: 250px;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .sighting-card:hover .card-image-wrapper img {
            transform: scale(1.05);
        }

        .sighting-card .card-image-wrapper .species-badge {
            position: absolute;
            top: 14px;
            right: 14px;
            background: rgba(0, 0, 0, 0.70);
            backdrop-filter: blur(8px);
            padding: 6px 16px;
            border-radius: 50px;
            color: #ffffff;
            font-size: 0.7rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .sighting-card .card-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .sighting-card .card-content .content-header {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            flex-wrap: wrap;
            gap: 8px;
            margin-bottom: 12px;
        }

        .sighting-card .card-content .content-header h4 {
            font-weight: 700;
            font-size: 1.4rem;
            color: #1a2e1a;
            margin: 0;
        }

        .sighting-card .card-content .content-header h4 i {
            color: #2e7d32;
            margin-right: 8px;
        }

        .sighting-card .card-content .content-header .sighting-date {
            font-size: 0.8rem;
            color: #6b7a6b;
            background: #f7faf7;
            padding: 4px 14px;
            border-radius: 50px;
            font-weight: 500;
        }

        .sighting-card .card-content .details-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 8px 20px;
            margin: 8px 0 14px;
        }

        .sighting-card .card-content .details-grid .detail-item {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 0.92rem;
            color: #4a5a4a;
        }

        .sighting-card .card-content .details-grid .detail-item i {
            color: #2e7d32;
            width: 18px;
            font-size: 0.9rem;
        }

        .sighting-card .card-content .details-grid .detail-item .label {
            color: #8a9a8a;
            font-weight: 400;
        }

        .sighting-card .card-content .details-grid .detail-item .value {
            font-weight: 500;
            color: #1a2e1a;
        }

        .sighting-card .card-content .description {
            color: #5a6a5a;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 16px;
        }

        .sighting-card .card-content .card-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .sighting-card .card-content .card-actions .btn {
            padding: 10px 24px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.85rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.35s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
            border: none;
            cursor: pointer;
        }

        .btn-map {
            background: #e8f5e9;
            color: #2e7d32;
        }

        .btn-map:hover {
            background: #2e7d32;
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(46, 125, 50, 0.25);
        }

        .btn-share {
            background: #e8f4fd;
            color: #2563eb;
        }

        .btn-share:hover {
            background: #2563eb;
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(37, 99, 235, 0.25);
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

            .sighting-card .card-body {
                flex-direction: column;
                padding: 20px;
            }

            .sighting-card .card-image-wrapper {
                flex: 0 0 auto;
                width: 100%;
                min-height: 200px;
            }

            .sighting-card .card-image-wrapper img {
                min-height: 200px;
            }

            .sighting-card .card-content .details-grid {
                grid-template-columns: 1fr 1fr;
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

            .sighting-card .card-body {
                padding: 16px;
            }

            .sighting-card .card-image-wrapper {
                min-height: 180px;
            }

            .sighting-card .card-image-wrapper img {
                min-height: 180px;
            }

            .sighting-card .card-content .content-header h4 {
                font-size: 1.2rem;
            }

            .sighting-card .card-content .details-grid {
                grid-template-columns: 1fr;
                gap: 6px;
            }

            .sighting-card .card-content .card-actions {
                flex-direction: column;
            }

            .sighting-card .card-content .card-actions .btn {
                justify-content: center;
            }
        }

        @media (max-width: 576px) {
            .page-header h1 {
                font-size: 1.5rem;
            }

            .page-header p {
                font-size: 0.9rem;
            }

            .stats-bar .stats-wrapper {
                gap: 20px;
            }

            .stats-bar .stat-item .stat-number {
                font-size: 1.4rem;
            }

            .sighting-card .card-image-wrapper {
                min-height: 160px;
            }

            .sighting-card .card-image-wrapper img {
                min-height: 160px;
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
            <span class="header-badge"><i class="fa-regular fa-eye"></i> Wildlife Sightings</span>
            <h1>Wildlife <span>Sightings</span></h1>
            <p>Discover and explore the incredible wildlife of Kabini</p>
        </div>
    </div>
</section>

<!-- Stats Bar -->
<section class="stats-bar" data-aos="fade-up" data-aos-delay="100">
    <div class="container">
        <div class="stats-wrapper">
            <div class="stat-item">
                <div class="stat-number" id="totalSightings">6</div>
                <div class="stat-label"><i class="fa-regular fa-eye"></i> Total Sightings</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="speciesCount">6</div>
                <div class="stat-label"><i class="fa-regular fa-paw"></i> Species</div>
            </div>
            <div class="stat-item">
                <div class="stat-number" id="locations">1</div>
                <div class="stat-label"><i class="fa-regular fa-location-dot"></i> Locations</div>
            </div>
        </div>
    </div>
</section>

<!-- Sightings Container -->
<section class="sightings-container">
    <div class="container">

        <!-- Sighting 1 - Elephant -->
        <div class="sighting-card" data-aos="fade-up" data-aos-delay="100">
            <div class="card-body">
                <div class="card-image-wrapper">
                    <img src="https://t4.ftcdn.net/jpg/09/74/18/45/360_F_974184522_CWKIQGcWe1duHe1u6AYBIXbF9E792iNf.jpg" 
                         alt="Elephant" onerror="this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Elephant'"/>
                    <span class="species-badge"><i class="fa-regular fa-clock"></i> Recent</span>
                </div>
                <div class="card-content">
                    <div>
                        <div class="content-header">
                            <h4><i class="fa-solid fa-paw"></i> Elephant</h4>
                            <span class="sighting-date"><i class="fa-regular fa-calendar"></i> April 7, 2025</span>
                        </div>
                        <div class="details-grid">
                            <div class="detail-item">
                                <i class="fa-regular fa-clock"></i>
                                <span class="label">Time:</span>
                                <span class="value">8:30 AM</span>
                            </div>
                            <div class="detail-item">
                                <i class="fa-regular fa-location-dot"></i>
                                <span class="label">Location:</span>
                                <span class="value">Kabini Wildlife Sanctuary</span>
                            </div>
                        </div>
                        <p class="description">A majestic elephant was spotted feeding peacefully near the riverbank, surrounded by lush greenery.</p>
                    </div>
                    <div class="card-actions">
                        <a href="https://www.google.com/maps?q=12.3482,76.2183" target="_blank" class="btn btn-map">
                            <i class="fa-solid fa-map-location-dot"></i> View on Map
                        </a>
                        <button class="btn btn-share" onclick="shareSighting('Elephant')">
                            <i class="fa-regular fa-share-from-square"></i> Share
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sighting 2 - Bengal Tiger -->
        <div class="sighting-card" data-aos="fade-up" data-aos-delay="150">
            <div class="card-body">
                <div class="card-image-wrapper">
                    <img src="https://d22eux7aqicogj.cloudfront.net/assets/blogs/kabini-safari.webp" 
                         alt="Bengal Tiger" onerror="this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Bengal+Tiger'"/>
                    <span class="species-badge"><i class="fa-regular fa-clock"></i> Recent</span>
                </div>
                <div class="card-content">
                    <div>
                        <div class="content-header">
                            <h4><i class="fa-solid fa-paw"></i> Bengal Tiger</h4>
                            <span class="sighting-date"><i class="fa-regular fa-calendar"></i> April 6, 2025</span>
                        </div>
                        <div class="details-grid">
                            <div class="detail-item">
                                <i class="fa-regular fa-clock"></i>
                                <span class="label">Time:</span>
                                <span class="value">6:00 AM</span>
                            </div>
                            <div class="detail-item">
                                <i class="fa-regular fa-location-dot"></i>
                                <span class="label">Location:</span>
                                <span class="value">Kabini Wildlife Sanctuary</span>
                            </div>
                        </div>
                        <p class="description">A magnificent Bengal tiger was seen stalking prey in the dense forest, showcasing its incredible hunting skills.</p>
                    </div>
                    <div class="card-actions">
                        <a href="https://www.google.com/maps?q=12.3628,76.1913" target="_blank" class="btn btn-map">
                            <i class="fa-solid fa-map-location-dot"></i> View on Map
                        </a>
                        <button class="btn btn-share" onclick="shareSighting('Bengal Tiger')">
                            <i class="fa-regular fa-share-from-square"></i> Share
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sighting 3 - Bison (Gaur) -->
        <div class="sighting-card" data-aos="fade-up" data-aos-delay="200">
            <div class="card-body">
                <div class="card-image-wrapper">
                    <img src="https://cdn.britannica.com/66/6666-159-45D860FF/American-bison-plains-buffalo.jpg" 
                         alt="Bison" onerror="this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Bison'"/>
                    <span class="species-badge"><i class="fa-regular fa-clock"></i> Recent</span>
                </div>
                <div class="card-content">
                    <div>
                        <div class="content-header">
                            <h4><i class="fa-solid fa-paw"></i> Bison (Gaur)</h4>
                            <span class="sighting-date"><i class="fa-regular fa-calendar"></i> April 5, 2025</span>
                        </div>
                        <div class="details-grid">
                            <div class="detail-item">
                                <i class="fa-regular fa-clock"></i>
                                <span class="label">Time:</span>
                                <span class="value">7:15 AM</span>
                            </div>
                            <div class="detail-item">
                                <i class="fa-regular fa-location-dot"></i>
                                <span class="label">Location:</span>
                                <span class="value">Kabini Wildlife Sanctuary</span>
                            </div>
                        </div>
                        <p class="description">A herd of Indian Bison (Gaur) was observed grazing peacefully in the early morning mist, creating a serene atmosphere.</p>
                    </div>
                    <div class="card-actions">
                        <a href="https://www.google.com/maps?q=12.3105,76.3087" target="_blank" class="btn btn-map">
                            <i class="fa-solid fa-map-location-dot"></i> View on Map
                        </a>
                        <button class="btn btn-share" onclick="shareSighting('Bison')">
                            <i class="fa-regular fa-share-from-square"></i> Share
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sighting 4 - Black Panther -->
        <div class="sighting-card" data-aos="fade-up" data-aos-delay="250">
            <div class="card-body">
                <div class="card-image-wrapper">
                    <img src="https://images.moneycontrol.com/static-mcnews/2024/09/20240912064740_1.jpg" 
                         alt="Black Panther" onerror="this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Black+Panther'"/>
                    <span class="species-badge"><i class="fa-regular fa-clock"></i> Recent</span>
                </div>
                <div class="card-content">
                    <div>
                        <div class="content-header">
                            <h4><i class="fa-solid fa-paw"></i> Black Panther</h4>
                            <span class="sighting-date"><i class="fa-regular fa-calendar"></i> April 8, 2025</span>
                        </div>
                        <div class="details-grid">
                            <div class="detail-item">
                                <i class="fa-regular fa-clock"></i>
                                <span class="label">Time:</span>
                                <span class="value">5:45 AM</span>
                            </div>
                            <div class="detail-item">
                                <i class="fa-regular fa-location-dot"></i>
                                <span class="label">Location:</span>
                                <span class="value">Kabini Backwaters Trail</span>
                            </div>
                        </div>
                        <p class="description">The elusive black panther was seen stealthily crossing a dirt trail near the backwaters, a rare and unforgettable sighting.</p>
                    </div>
                    <div class="card-actions">
                        <a href="https://www.google.com/maps?q=12.3070,76.2715" target="_blank" class="btn btn-map">
                            <i class="fa-solid fa-map-location-dot"></i> View on Map
                        </a>
                        <button class="btn btn-share" onclick="shareSighting('Black Panther')">
                            <i class="fa-regular fa-share-from-square"></i> Share
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sighting 5 - Peacock -->
        <div class="sighting-card" data-aos="fade-up" data-aos-delay="300">
            <div class="card-body">
                <div class="card-image-wrapper">
                    <img src="https://assets.simplotel.com/simplotel/image/upload/w_5000,h_3333/x_0,y_260,w_5000,h_2813,r_0,c_crop,q_90,fl_progressive/w_500,f_auto,c_fit/the-serai-kabini/Peacock" 
                         alt="Peacock" onerror="this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Peacock'"/>
                    <span class="species-badge"><i class="fa-regular fa-clock"></i> Recent</span>
                </div>
                <div class="card-content">
                    <div>
                        <div class="content-header">
                            <h4><i class="fa-solid fa-paw"></i> Peacock</h4>
                            <span class="sighting-date"><i class="fa-regular fa-calendar"></i> April 8, 2025</span>
                        </div>
                        <div class="details-grid">
                            <div class="detail-item">
                                <i class="fa-regular fa-clock"></i>
                                <span class="label">Time:</span>
                                <span class="value">9:00 AM</span>
                            </div>
                            <div class="detail-item">
                                <i class="fa-regular fa-location-dot"></i>
                                <span class="label">Location:</span>
                                <span class="value">Near The Serai, Kabini</span>
                            </div>
                        </div>
                        <p class="description">A group of peacocks was observed dancing gracefully during an early morning drizzle, displaying their vibrant plumage.</p>
                    </div>
                    <div class="card-actions">
                        <a href="https://www.google.com/maps?q=12.3078,76.2812" target="_blank" class="btn btn-map">
                            <i class="fa-solid fa-map-location-dot"></i> View on Map
                        </a>
                        <button class="btn btn-share" onclick="shareSighting('Peacock')">
                            <i class="fa-regular fa-share-from-square"></i> Share
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sighting 6 - Wolf -->
        <div class="sighting-card" data-aos="fade-up" data-aos-delay="350">
            <div class="card-body">
                <div class="card-image-wrapper">
                    <img src="https://w0.peakpx.com/wallpaper/274/721/HD-wallpaper-wolf-jungle-forest-animal.jpg" 
                         alt="Wolf" onerror="this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Wolf'"/>
                    <span class="species-badge"><i class="fa-regular fa-clock"></i> Recent</span>
                </div>
                <div class="card-content">
                    <div>
                        <div class="content-header">
                            <h4><i class="fa-solid fa-paw"></i> Wolf</h4>
                            <span class="sighting-date"><i class="fa-regular fa-calendar"></i> April 8, 2025</span>
                        </div>
                        <div class="details-grid">
                            <div class="detail-item">
                                <i class="fa-regular fa-clock"></i>
                                <span class="label">Time:</span>
                                <span class="value">6:30 PM</span>
                            </div>
                            <div class="detail-item">
                                <i class="fa-regular fa-location-dot"></i>
                                <span class="label">Location:</span>
                                <span class="value">Dry Forest Edge, Kabini</span>
                            </div>
                        </div>
                        <p class="description">A lone wolf was seen resting under shade, alert and observing the surroundings with its piercing gaze.</p>
                    </div>
                    <div class="card-actions">
                        <a href="https://www.google.com/maps?q=12.2989,76.2257" target="_blank" class="btn btn-map">
                            <i class="fa-solid fa-map-location-dot"></i> View on Map
                        </a>
                        <button class="btn btn-share" onclick="shareSighting('Wolf')">
                            <i class="fa-regular fa-share-from-square"></i> Share
                        </button>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>

<%@ include file="footer.jsp" %>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
    // Initialize AOS animations
    AOS.init({
        duration: 800,
        easing: 'ease-out',
        once: true,
        offset: 50
    });

    // Share function
    function shareSighting(species) {
        if (navigator.share) {
            navigator.share({
                title: 'Wildlife Sighting',
                text: `I spotted a ${species} at Kabini Wildlife Sanctuary! 🐾🌿`,
                url: window.location.href
            }).catch(() => {
                copyToClipboard(species);
            });
        } else {
            copyToClipboard(species);
        }
    }

    function copyToClipboard(species) {
        const text = `I spotted a ${species} at Kabini Wildlife Sanctuary! 🐾🌿`;
        navigator.clipboard.writeText(text).then(() => {
            showToast(`${species} sighting shared! 📋`);
        }).catch(() => {
            showToast(`Share: ${text}`);
        });
    }

    // Toast notification
    function showToast(message) {
        const existingToast = document.querySelector('.toast-custom');
        if (existingToast) {
            existingToast.remove();
        }

        const toast = document.createElement('div');
        toast.className = 'toast-custom';
        toast.innerHTML = `
            <div style="display:flex; align-items:center; gap:12px; padding:12px 20px; background:#ffffff; border-radius:12px; box-shadow:0 12px 48px rgba(0,0,0,0.15); border-left:4px solid #2e7d32; min-width:280px;">
                <i class="fa-regular fa-circle-check" style="font-size:24px; color:#2e7d32;"></i>
                <div>
                    <strong style="color:#1a2e1a; font-size:0.95rem;">${message}</strong>
                </div>
            </div>
        `;
        toast.style.cssText = `
            position: fixed;
            bottom: 30px;
            right: 30px;
            z-index: 99999;
            animation: slideUp 0.4s ease;
            font-family: 'Inter', sans-serif;
        `;

        document.body.appendChild(toast);

        // Add animation styles if not present
        if (!document.getElementById('toastStyles')) {
            const style = document.createElement('style');
            style.id = 'toastStyles';
            style.textContent = `
                @keyframes slideUp {
                    from { opacity: 0; transform: translateY(20px); }
                    to { opacity: 1; transform: translateY(0); }
                }
            `;
            document.head.appendChild(style);
        }

        setTimeout(() => {
            toast.style.opacity = '0';
            toast.style.transform = 'translateY(20px)';
            toast.style.transition = 'opacity 0.3s ease, transform 0.3s ease';
            setTimeout(() => toast.remove(), 300);
        }, 3000);
    }
</script>

</body>
</html>