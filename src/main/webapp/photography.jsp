<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Kabini Wildlife Photography | Wildlife Tourism</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
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

        /* ----- Hero Section ----- */
        .hero-section {
            position: relative;
            height: 70vh;
            min-height: 500px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            overflow: hidden;
            background: url('https://thrillingtravel.in/wp-content/uploads/2021/01/Zone-B-Kabini.jpg') center/cover no-repeat;
            margin-top: 0;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(180deg,
                    rgba(10, 20, 10, 0.30) 0%,
                    rgba(10, 20, 10, 0.50) 50%,
                    rgba(10, 20, 10, 0.80) 100%);
            z-index: 1;
        }

        .hero-content {
            position: relative;
            z-index: 2;
            padding: 0 1.5rem;
            animation: fadeInUp 1s ease-out;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .hero-content .hero-badge {
            display: inline-block;
            background: rgba(46, 125, 50, 0.25);
            border: 1px solid rgba(165, 214, 167, 0.20);
            padding: 6px 20px;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: #a5d6a7;
            margin-bottom: 16px;
        }

        .hero-content h1 {
            font-size: 4rem;
            font-weight: 900;
            color: #ffffff;
            text-shadow: 0 4px 30px rgba(0, 0, 0, 0.30);
            letter-spacing: -1px;
            margin-bottom: 12px;
        }

        .hero-content h1 span {
            background: linear-gradient(135deg, #a5d6a7, #66bb6a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero-content p {
            font-size: 1.2rem;
            color: rgba(255, 255, 255, 0.80);
            max-width: 600px;
            margin: 0 auto;
            text-shadow: 0 2px 20px rgba(0, 0, 0, 0.20);
        }

        /* Scroll Indicator */
        .scroll-indicator {
            position: absolute;
            bottom: 30px;
            left: 50%;
            transform: translateX(-50%);
            z-index: 2;
            color: rgba(255, 255, 255, 0.50);
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 6px;
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

        /* ----- Gallery Section ----- */
        .gallery-section {
            padding: 60px 0;
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

        /* Gallery Grid */
        .gallery-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 24px;
            padding: 0 20px;
        }

        .gallery-item {
            position: relative;
            border-radius: 20px;
            overflow: hidden;
            cursor: pointer;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            border: 1px solid #e8eee8;
            transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            aspect-ratio: 4/3;
        }

        .gallery-item:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.10);
            border-color: #a5d6a7;
        }

        .gallery-item a {
            display: block;
            width: 100%;
            height: 100%;
            text-decoration: none;
        }

        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .gallery-item:hover img {
            transform: scale(1.08);
        }

        .gallery-item .overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 20px 24px;
            background: linear-gradient(0deg, rgba(0, 0, 0, 0.70) 0%, transparent 100%);
            color: #ffffff;
            transition: all 0.4s ease;
        }

        .gallery-item .overlay .caption {
            font-size: 1.2rem;
            font-weight: 700;
            display: block;
        }

        .gallery-item .overlay .sub-caption {
            font-size: 0.8rem;
            opacity: 0.7;
            font-weight: 400;
        }

        .gallery-item .overlay .view-icon {
            position: absolute;
            right: 20px;
            bottom: 20px;
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(8px);
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 16px;
            color: #ffffff;
            transition: all 0.4s ease;
            opacity: 0;
            transform: translateX(10px);
        }

        .gallery-item:hover .view-icon {
            opacity: 1;
            transform: translateX(0);
        }

        .gallery-item .view-icon:hover {
            background: #2e7d32;
            transform: scale(1.1);
        }

        /* ----- Activity Card ----- */
        .activity-section {
            padding: 60px 0;
            background: #ffffff;
        }

        .activity-card {
            display: flex;
            flex-wrap: wrap;
            background: #f7faf7;
            border-radius: 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            overflow: hidden;
            border: 1px solid #e8eee8;
            transition: all 0.4s ease;
        }

        .activity-card:hover {
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.06);
            border-color: #a5d6a7;
        }

        .activity-image {
            flex: 0 0 45%;
            overflow: hidden;
        }

        .activity-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .activity-card:hover .activity-image img {
            transform: scale(1.03);
        }

        .activity-content {
            flex: 1;
            padding: 40px 36px;
        }

        .activity-content .activity-badge {
            display: inline-block;
            background: #e8f5e9;
            color: #2e7d32;
            padding: 4px 14px;
            border-radius: 50px;
            font-size: 0.7rem;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            margin-bottom: 12px;
        }

        .activity-content h2 {
            font-weight: 800;
            font-size: 2rem;
            color: #1a2e1a;
            margin-bottom: 12px;
            letter-spacing: -0.5px;
        }

        .activity-content h2 span {
            color: #2e7d32;
        }

        .activity-content p {
            color: #5a6a5a;
            font-size: 1rem;
            line-height: 1.7;
            margin-bottom: 16px;
        }

        .activity-features {
            list-style: none;
            padding: 0;
            margin: 0 0 16px 0;
        }

        .activity-features li {
            padding: 8px 0;
            font-size: 0.95rem;
            color: #4a5a4a;
            display: flex;
            align-items: center;
            gap: 10px;
            border-bottom: 1px solid #e8eee8;
        }

        .activity-features li:last-child {
            border-bottom: none;
        }

        .activity-features li i {
            color: #2e7d32;
            width: 24px;
            font-size: 1.1rem;
        }

        .activity-details {
            background: #e8f5e9;
            padding: 16px 20px;
            border-radius: 12px;
            margin: 16px 0;
        }

        .activity-details p {
            margin: 4px 0;
            font-size: 0.92rem;
            color: #1a3a1e;
        }

        .activity-details p strong {
            color: #1a2e1a;
        }

        .contact-details {
            margin-top: 16px;
            padding: 16px 20px;
            background: #0a1a2e;
            border-radius: 12px;
            color: #ffffff;
            text-align: center;
        }

        .contact-details p {
            margin: 0;
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.85);
        }

        .contact-details p i {
            color: #a5d6a7;
            margin-right: 8px;
        }

        /* ----- Footer ----- */
        footer {
            margin-top: auto;
        }

        /* ----- Responsive ----- */
        @media (max-width: 992px) {
            .hero-content h1 {
                font-size: 3rem;
            }

            .page-header h1 {
                font-size: 2.2rem;
            }

            .activity-image {
                flex: 0 0 100%;
                max-height: 300px;
            }

            .activity-content {
                padding: 30px 24px;
            }

            .activity-content h2 {
                font-size: 1.7rem;
            }

            .section-header h2 {
                font-size: 2rem;
            }
        }

        @media (max-width: 768px) {
            .hero-section {
                height: 60vh;
                min-height: 400px;
            }

            .hero-content h1 {
                font-size: 2.2rem;
            }

            .hero-content p {
                font-size: 1rem;
            }

            .page-header h1 {
                font-size: 1.8rem;
            }

            .gallery-grid {
                grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
                gap: 16px;
                padding: 0 12px;
            }

            .gallery-item .overlay .caption {
                font-size: 1rem;
            }

            .section-header h2 {
                font-size: 1.7rem;
            }

            .activity-content h2 {
                font-size: 1.4rem;
            }

            .activity-content {
                padding: 24px 18px;
            }

            .scroll-indicator {
                display: none;
            }
        }

        @media (max-width: 576px) {
            .hero-content h1 {
                font-size: 1.8rem;
            }

            .hero-section {
                height: 50vh;
                min-height: 350px;
            }

            .gallery-grid {
                grid-template-columns: 1fr;
                max-width: 400px;
                margin: 0 auto;
            }

            .page-header h1 {
                font-size: 1.5rem;
            }

            .section-header h2 {
                font-size: 1.4rem;
            }

            .activity-content h2 {
                font-size: 1.2rem;
            }

            .activity-details p {
                font-size: 0.85rem;
            }

            .contact-details p {
                font-size: 0.9rem;
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
            <span class="header-badge"><i class="fa-solid fa-camera"></i> Photography</span>
            <h1>Kabini <span>Wildlife Photography</span></h1>
            <p>Capture the untamed beauty of nature through your lens</p>
        </div>
    </div>
</section>

<!-- Hero Section -->
<section class="hero-section" id="hero">
    <div class="hero-content">
        <span class="hero-badge"><i class="fa-regular fa-compass"></i> Explore & Capture</span>
        <h1>Discover the <span>Beauty</span> of Kabini</h1>
        <p>Explore stunning wildlife photography and immerse yourself in the serene landscapes of Kabini.</p>
    </div>
    <div class="scroll-indicator">
        <span>Scroll</span>
        <i class="fa-solid fa-chevron-down"></i>
    </div>
</section>

<!-- Gallery Section -->
<section class="gallery-section" id="gallery">
    <div class="container">
        <div class="section-header" data-aos="fade-up">
            <span class="section-badge"><i class="fa-regular fa-images"></i> Gallery</span>
            <h2>Wildlife <span>Photography</span></h2>
            <p>Explore our collection of stunning wildlife photographs from Kabini</p>
        </div>

        <div class="gallery-grid">
            <!-- Gallery Item 1 - Black Panther -->
            <div class="gallery-item" data-aos="fade-up" data-aos-delay="100">
                <a href="blackpanther.jsp">
                    <img src="https://i.pinimg.com/736x/f1/ac/19/f1ac1948deec3c8b9322a2271546b869.jpg"
                        alt="Black Panther">
                    <div class="overlay">
                        <span class="caption">Roaming Black Panther</span>
                        <span class="sub-caption">Kabini's majestic predator</span>
                        <span class="view-icon"><i class="fa-solid fa-arrow-right"></i></span>
                    </div>
                </a>
            </div>

            <!-- Gallery Item 2 - Elephant -->
            <div class="gallery-item" data-aos="fade-up" data-aos-delay="200">
                <a href="elephant.jsp">
                    <img src="https://www.theoutbackexperience.in/wp-content/uploads/2016/08/12_Elephant_Kabini-Gallery.jpg"
                        alt="Elephant">
                    <div class="overlay">
                        <span class="caption">Graceful Elephant</span>
                        <span class="sub-caption">Gentle giants of the jungle</span>
                        <span class="view-icon"><i class="fa-solid fa-arrow-right"></i></span>
                    </div>
                </a>
            </div>

            <!-- Gallery Item 3 - Deer -->
            <div class="gallery-item" data-aos="fade-up" data-aos-delay="300">
                <a href="deer.jsp">
                    <img src="https://redearth.in/blog/wp-content/uploads/2021/12/chital-kabini-.jpg"
                        alt="Deer">
                    <div class="overlay">
                        <span class="caption">Elegant Deer</span>
                        <span class="sub-caption">Grace in the wilderness</span>
                        <span class="view-icon"><i class="fa-solid fa-arrow-right"></i></span>
                    </div>
                </a>
            </div>

            <!-- Gallery Item 4 - Leopard -->
            <div class="gallery-item" data-aos="fade-up" data-aos-delay="400">
                <a href="leopard.jsp">
                    <img src="https://bigcatsindia.com/wp-content/uploads/2019/09/Indian-Leopard-Kabini-Wildlife.jpg"
                        alt="Leopard">
                    <div class="overlay">
                        <span class="caption">Leopard in Action</span>
                        <span class="sub-caption">Stealth and elegance</span>
                        <span class="view-icon"><i class="fa-solid fa-arrow-right"></i></span>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- Activity Section -->
<section class="activity-section">
    <div class="container">
        <div class="activity-card" data-aos="fade-up">
            <div class="activity-image">
                <img src="https://media.istockphoto.com/id/626056254/photo/clumsy-nature-photographer-dont-find-the-kingfisher-on-the-lens.jpg?s=612x612&w=0&k=20&c=USWn0BxiBMn3BDBdJJPp7DSEyvESXXQqg535lx0K0Cc=" 
                     alt="Wildlife Photography">
            </div>
            <div class="activity-content">
                <span class="activity-badge"><i class="fa-regular fa-circle-check"></i> Photography</span>
                <h2>Wildlife <span>Photography</span> Information</h2>
                <p>Capture the untamed beauty of nature through your lens! Join our guided photo safaris to shoot stunning wildlife, rare birds, and breathtaking landscapes.</p>

                <ul class="activity-features">
                    <li><i class="fa-solid fa-camera"></i> Guided photo tours with experts</li>
                    <li><i class="fa-solid fa-sun"></i> Best zones during golden hours</li>
                    <li><i class="fa-solid fa-binoculars"></i> Birdwatching & animal tracking</li>
                    <li><i class="fa-solid fa-book-open"></i> Photography tips from professionals</li>
                </ul>

                <div class="activity-details">
                    <p><strong><i class="fa-regular fa-clock"></i> Timings:</strong> 6:00 AM – 9:00 AM & 4:00 PM – 6:30 PM</p>
                    <p><strong><i class="fa-regular fa-user"></i> Ideal For:</strong> Photographers, Nature Enthusiasts, Birdwatchers</p>
                    <p><strong><i class="fa-regular fa-lightbulb"></i> Pro Tip:</strong> Carry a zoom lens (200mm+), wear earthy tones, and stay patient!</p>
                </div>

                <div class="contact-details">
                    <p><i class="fa-solid fa-phone"></i> For more details contact: <strong>+91 80456 78901</strong></p>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

<!-- Scripts -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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