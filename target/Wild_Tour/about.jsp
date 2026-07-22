<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>About Us - Wildlife Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
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
            overflow-x: hidden;
        }

        /* ----- Page Header ----- */
        .page-header {
            background: linear-gradient(135deg, #0a1a2e, #0d2847);
            padding: 60px 0 50px;
            position: relative;
            overflow: hidden;
        }

        .page-header::before {
            content: '';
            position: absolute;
            inset: 0;
            background: 
                radial-gradient(circle at 20% 30%, rgba(46, 125, 50, 0.06) 0%, transparent 50%),
                radial-gradient(circle at 80% 70%, rgba(165, 214, 167, 0.04) 0%, transparent 50%);
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
            font-size: 3.2rem;
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
            font-size: 1.15rem;
            margin-top: 8px;
        }

        /* ----- Main Content ----- */
        .about-section {
            padding: 60px 0;
        }

        /* ----- Image Section ----- */
        .about-image-wrapper {
            position: relative;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.10);
            transition: all 0.5s ease;
        }

        .about-image-wrapper:hover {
            transform: scale(1.01);
            box-shadow: 0 30px 80px rgba(0, 0, 0, 0.15);
        }

        .about-image-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .about-image-wrapper:hover img {
            transform: scale(1.03);
        }

        .about-image-wrapper .image-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 30px;
            background: linear-gradient(0deg, rgba(0, 0, 0, 0.60) 0%, transparent 100%);
            color: #ffffff;
        }

        .about-image-wrapper .image-overlay .overlay-icon {
            display: inline-block;
            background: rgba(46, 125, 50, 0.80);
            padding: 8px 16px;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        /* ----- About Text ----- */
        .about-text h2 {
            font-weight: 800;
            font-size: 2.5rem;
            color: #1a2e1a;
            letter-spacing: -0.5px;
            margin-bottom: 16px;
        }

        .about-text h2 span {
            background: linear-gradient(135deg, #2e7d32, #66bb6a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .about-text p {
            color: #5a6a5a;
            font-size: 1.05rem;
            line-height: 1.8;
            margin-bottom: 16px;
        }

        .about-text .about-stats {
            display: flex;
            gap: 40px;
            margin-top: 24px;
            flex-wrap: wrap;
        }

        .about-text .about-stats .stat-item {
            text-align: center;
        }

        .about-text .about-stats .stat-item .stat-number {
            font-size: 2.2rem;
            font-weight: 900;
            color: #2e7d32;
        }

        .about-text .about-stats .stat-item .stat-label {
            font-size: 0.85rem;
            color: #6b7a6b;
            font-weight: 500;
        }

        /* ----- Core Values Cards ----- */
        .values-section {
            padding: 60px 0 80px;
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
            padding: 4px 18px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .section-header h2 {
            font-weight: 800;
            font-size: 2.5rem;
            color: #1a2e1a;
            letter-spacing: -0.5px;
        }

        .section-header h2 span {
            background: linear-gradient(135deg, #2e7d32, #66bb6a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .section-header p {
            color: #6b7a6b;
            font-size: 1.05rem;
            max-width: 600px;
            margin: 8px auto 0;
        }

        .value-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 32px 24px 28px;
            text-align: center;
            border: 1px solid #e8eee8;
            transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            height: 100%;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
        }

        .value-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.06);
            border-color: #a5d6a7;
        }

        .value-card .card-icon {
            width: 72px;
            height: 72px;
            background: #e8f5e9;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 16px;
            font-size: 30px;
            color: #2e7d32;
            transition: all 0.4s ease;
        }

        .value-card:hover .card-icon {
            background: #2e7d32;
            color: #ffffff;
            transform: scale(1.05) rotate(-4deg);
        }

        .value-card h5 {
            font-weight: 700;
            font-size: 1.2rem;
            color: #1a2e1a;
            margin-bottom: 8px;
        }

        .value-card p {
            color: #6b7a6b;
            font-size: 0.95rem;
            line-height: 1.6;
            margin: 0;
        }

        /* ----- Extra Section ----- */
        .extra-section {
            padding: 60px 0;
            background: #f7faf7;
        }

        .extra-section .extra-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 36px 32px;
            border: 1px solid #e8eee8;
            height: 100%;
            transition: all 0.4s ease;
        }

        .extra-section .extra-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.04);
            border-color: #a5d6a7;
        }

        .extra-section .extra-card .extra-icon {
            font-size: 32px;
            color: #2e7d32;
            margin-bottom: 12px;
        }

        .extra-section .extra-card h3 {
            font-weight: 700;
            font-size: 1.5rem;
            color: #1a2e1a;
            margin-bottom: 12px;
        }

        .extra-section .extra-card p {
            color: #5a6a5a;
            font-size: 1rem;
            line-height: 1.7;
            margin-bottom: 0;
        }

        .extra-section .extra-card ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .extra-section .extra-card ul li {
            font-size: 1rem;
            color: #5a6a5a;
            padding: 8px 0;
            display: flex;
            align-items: center;
            gap: 12px;
            border-bottom: 1px solid #f0f5f0;
        }

        .extra-section .extra-card ul li:last-child {
            border-bottom: none;
        }

        .extra-section .extra-card ul li::before {
            content: "✦";
            font-size: 1.2rem;
            color: #2e7d32;
        }

        /* ----- Footer ----- */
        footer {
            margin-top: auto;
        }

        /* ----- Responsive ----- */
        @media (max-width: 992px) {
            .page-header h1 {
                font-size: 2.5rem;
            }

            .about-text h2 {
                font-size: 2rem;
            }

            .section-header h2 {
                font-size: 2rem;
            }

            .about-text .about-stats {
                gap: 24px;
            }
        }

        @media (max-width: 768px) {
            .page-header {
                padding: 40px 0 30px;
            }

            .page-header h1 {
                font-size: 2rem;
            }

            .page-header p {
                font-size: 1rem;
            }

            .about-section {
                padding: 40px 0;
            }

            .about-text h2 {
                font-size: 1.7rem;
            }

            .about-text .about-stats .stat-item .stat-number {
                font-size: 1.8rem;
            }

            .values-section {
                padding: 40px 0 60px;
            }

            .section-header h2 {
                font-size: 1.7rem;
            }

            .extra-section {
                padding: 40px 0;
            }

            .extra-section .extra-card {
                padding: 28px 20px;
            }

            .value-card {
                padding: 24px 16px;
            }
        }

        @media (max-width: 576px) {
            .page-header h1 {
                font-size: 1.6rem;
            }

            .about-text h2 {
                font-size: 1.4rem;
            }

            .about-text .about-stats {
                gap: 16px;
                justify-content: center;
            }

            .about-text .about-stats .stat-item .stat-number {
                font-size: 1.5rem;
            }

            .section-header h2 {
                font-size: 1.4rem;
            }

            .value-card .card-icon {
                width: 60px;
                height: 60px;
                font-size: 24px;
            }

            .extra-section .extra-card h3 {
                font-size: 1.2rem;
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
            <span class="header-badge"><i class="fa-solid fa-leaf"></i> About Us</span>
            <h1>About <span>Wildlife Tourism</span></h1>
            <p>Connecting travelers with the wonders of nature</p>
        </div>
    </div>
</section>

<!-- Main Content -->
<section class="about-section">
    <div class="container">
        <div class="row align-items-center g-5">
            <!-- Image -->
            <div class="col-lg-6" data-aos="fade-right" data-aos-delay="100">
                <div class="about-image-wrapper">
                    <img src="https://rukminim3.flixcart.com/image/850/1000/xif0q/shopsy-poster/z/g/g/medium-dm-208-wild-animals-poster-forest-animals-poster-jungle-original-imagg49ftfy5swzv.jpeg?q=20&crop=false" 
                         alt="Wildlife Tourism" class="img-fluid">
                    <div class="image-overlay">
                        <span class="overlay-icon"><i class="fa-regular fa-heart"></i> Explore the Wild</span>
                    </div>
                </div>
            </div>

            <!-- Text -->
            <div class="col-lg-6 about-text" data-aos="fade-left" data-aos-delay="200">
                <h2>About <span>Wildlife Tourism</span></h2>
                <p>
                    Wildlife tourism offers an exciting and meaningful way to engage with nature by observing animals in their natural habitats. From safaris to birdwatching and marine life exploration, wildlife tourism gives travelers a chance to witness the beauty of Earth's wildlife in an environmentally responsible manner.
                </p>
                <p>
                    This growing sector not only provides unique travel experiences but also helps fund conservation initiatives, supports local communities, and raises awareness about the importance of protecting endangered species and habitats.
                </p>
                
                <div class="about-stats">
                    <div class="stat-item">
                        <div class="stat-number">50+</div>
                        <div class="stat-label">Wildlife Species</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">10K+</div>
                        <div class="stat-label">Happy Travelers</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-number">15+</div>
                        <div class="stat-label">National Parks</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Core Values -->
<section class="values-section">
    <div class="container">
        <div class="section-header" data-aos="fade-up">
            <span class="section-badge"><i class="fa-regular fa-star"></i> Our Values</span>
            <h2>Core <span>Values</span> of Wildlife Tourism</h2>
            <p>Our commitment to responsible and sustainable wildlife tourism</p>
        </div>

        <div class="row g-4">
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
                <div class="value-card">
                    <div class="card-icon">
                        <i class="fa-solid fa-tree"></i>
                    </div>
                    <h5>Conservation Awareness</h5>
                    <p>Wildlife tourism supports conservation efforts and helps protect endangered species and ecosystems.</p>
                </div>
            </div>
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
                <div class="value-card">
                    <div class="card-icon">
                        <i class="fa-solid fa-users"></i>
                    </div>
                    <h5>Support for Local Communities</h5>
                    <p>Tourism revenue creates jobs and supports the local economy, promoting sustainable development.</p>
                </div>
            </div>
            <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
                <div class="value-card">
                    <div class="card-icon">
                        <i class="fa-solid fa-compass"></i>
                    </div>
                    <h5>Unique Experiences</h5>
                    <p>From safaris to immersive wildlife experiences, wildlife tourism offers life-changing adventures.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Extra Sections -->
<section class="extra-section">
    <div class="container">
        <div class="row g-4">
            <!-- Importance -->
            <div class="col-lg-6" data-aos="fade-up" data-aos-delay="100">
                <div class="extra-card">
                    <div class="extra-icon">
                        <i class="fa-regular fa-circle-check"></i>
                    </div>
                    <h3>Importance of Wildlife Tourism</h3>
                    <p>
                        Wildlife tourism is vital for biodiversity conservation. It generates essential revenue that helps protect natural habitats, supports eco-tourism operators, and educates the public on the importance of sustainable environmental practices. The money generated often goes directly into protecting national parks and reserves, making wildlife tourism a powerful tool for conservation.
                    </p>
                </div>
            </div>

            <!-- Benefits -->
            <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
                <div class="extra-card">
                    <div class="extra-icon">
                        <i class="fa-regular fa-face-smile"></i>
                    </div>
                    <h3>Benefits to Tourists</h3>
                    <ul>
                        <li>Immerse yourself in nature and learn about diverse ecosystems</li>
                        <li>Support conservation efforts and sustainable practices</li>
                        <li>Experience thrilling wildlife encounters in their natural habitat</li>
                        <li>Gain deeper insights into the wildlife, its behaviors, and ecological importance</li>
                    </ul>
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
</script>

</body>
</html>