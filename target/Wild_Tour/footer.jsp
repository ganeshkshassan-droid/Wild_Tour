<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Footer</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .footer {
        background: linear-gradient(145deg, #0a1a2e, #0d2847);
        color: rgba(255, 255, 255, 0.85);
        padding: 70px 0 30px;
        font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
        position: relative;
        overflow: hidden;
    }

    /* Decorative top border */
    .footer::before {
        content: '';
        position: absolute;
        top: 0;
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

    /* Subtle background pattern */
    .footer::after {
        content: '';
        position: absolute;
        inset: 0;
        background: radial-gradient(circle at 20% 30%, rgba(46, 125, 50, 0.03) 0%, transparent 50%),
                    radial-gradient(circle at 80% 70%, rgba(165, 214, 167, 0.03) 0%, transparent 50%);
        pointer-events: none;
        z-index: 0;
    }

    .footer .container {
        position: relative;
        z-index: 1;
    }

    /* Logo & Brand */
    .footer .brand-wrapper {
        display: flex;
        align-items: center;
        gap: 14px;
        margin-bottom: 16px;
    }

    .footer .brand-wrapper img {
        width: 52px;
        height: 52px;
        border-radius: 50%;
        border: 2px solid rgba(165, 214, 167, 0.25);
        padding: 3px;
        transition: all 0.4s ease;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.20);
    }

    .footer .brand-wrapper img:hover {
        transform: rotate(-8deg) scale(1.05);
        border-color: #66bb6a;
        box-shadow: 0 8px 30px rgba(46, 125, 50, 0.30);
    }

    .footer .brand-wrapper h4 {
        font-weight: 800;
        font-size: 1.5rem;
        color: #ffffff;
        letter-spacing: -0.3px;
        margin: 0;
        background: linear-gradient(135deg, #ffffff, #a5d6a7);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
    }

    .footer .brand-description {
        font-size: 0.95rem;
        line-height: 1.7;
        color: rgba(255, 255, 255, 0.65);
        margin-bottom: 20px;
        max-width: 320px;
    }

    /* Social Icons */
    .footer .social-icons {
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
    }

    .footer .social-icons a {
        width: 44px;
        height: 44px;
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(255, 255, 255, 0.06);
        border-radius: 12px;
        font-size: 18px;
        color: rgba(255, 255, 255, 0.70);
        transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
        border: 1px solid rgba(255, 255, 255, 0.06);
        text-decoration: none;
    }

    .footer .social-icons a:hover {
        background: linear-gradient(145deg, #2e7d32, #1b5e20);
        color: #ffffff;
        transform: translateY(-4px) scale(1.05);
        box-shadow: 0 8px 25px rgba(46, 125, 50, 0.35);
        border-color: rgba(165, 214, 167, 0.30);
    }

    .footer .social-icons a:nth-child(1):hover { background: linear-gradient(145deg, #1877f2, #0d65d9); }
    .footer .social-icons a:nth-child(2):hover { background: linear-gradient(145deg, #e4405f, #c13584); }
    .footer .social-icons a:nth-child(3):hover { background: linear-gradient(145deg, #e60023, #c0001a); }
    .footer .social-icons a:nth-child(4):hover { background: linear-gradient(145deg, #1da1f2, #0d8bd9); }

    /* Section Headings */
    .footer h5 {
        font-weight: 700;
        font-size: 1.1rem;
        color: #ffffff;
        margin-bottom: 20px;
        letter-spacing: 0.5px;
        position: relative;
        padding-bottom: 12px;
    }

    .footer h5::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        width: 35px;
        height: 3px;
        background: linear-gradient(90deg, #66bb6a, #2e7d32);
        border-radius: 4px;
        transition: width 0.3s ease;
    }

    .footer .col-md-3:hover h5::after {
        width: 55px;
    }

    /* Links */
    .footer .links-wrapper {
        display: flex;
        flex-direction: column;
        gap: 6px;
    }

    .footer .links-wrapper a {
        color: rgba(255, 255, 255, 0.65);
        text-decoration: none;
        font-weight: 400;
        font-size: 0.92rem;
        transition: all 0.3s ease;
        padding: 4px 0;
        position: relative;
        padding-left: 0;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .footer .links-wrapper a::before {
        content: '→';
        opacity: 0;
        transform: translateX(-10px);
        transition: all 0.3s ease;
        color: #66bb6a;
        font-weight: 700;
    }

    .footer .links-wrapper a:hover {
        color: #ffffff;
        transform: translateX(6px);
    }

    .footer .links-wrapper a:hover::before {
        opacity: 1;
        transform: translateX(0);
    }

    /* Contact Info */
    .footer .contact-info {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }

    .footer .contact-info p {
        display: flex;
        align-items: flex-start;
        gap: 12px;
        margin: 0;
        font-size: 0.92rem;
        color: rgba(255, 255, 255, 0.65);
        transition: all 0.3s ease;
        padding: 6px 0;
    }

    .footer .contact-info p:hover {
        color: #ffffff;
        transform: translateX(4px);
    }

    .footer .contact-info p i {
        width: 20px;
        color: #66bb6a;
        font-size: 1rem;
        margin-top: 2px;
        transition: transform 0.3s ease;
    }

    .footer .contact-info p:hover i {
        transform: scale(1.15);
    }

    /* Gallery */
    .footer .gallery {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 6px;
        max-width: 220px;
    }

    .footer .gallery .gallery-item {
        position: relative;
        border-radius: 10px;
        overflow: hidden;
        cursor: pointer;
        aspect-ratio: 1/1;
    }

    .footer .gallery .gallery-item img {
        width: 100%;
        height: 100%;
        object-fit: cover;
        transition: all 0.5s ease;
        border-radius: 10px;
    }

    .footer .gallery .gallery-item:hover img {
        transform: scale(1.12);
    }

    .footer .gallery .gallery-item::after {
        content: '🔍';
        position: absolute;
        inset: 0;
        background: rgba(0, 0, 0, 0.40);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 24px;
        opacity: 0;
        transition: opacity 0.4s ease;
        backdrop-filter: blur(2px);
    }

    .footer .gallery .gallery-item:hover::after {
        opacity: 1;
    }

    /* Footer Bottom */
    .footer .footer-bottom {
        margin-top: 40px;
        padding-top: 24px;
        border-top: 1px solid rgba(255, 255, 255, 0.06);
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 16px;
    }

    .footer .footer-bottom .copyright {
        font-size: 0.85rem;
        color: rgba(255, 255, 255, 0.40);
    }

    .footer .footer-bottom .copyright i {
        color: #e74c3c;
        animation: heartBeat 1.5s ease-in-out infinite;
    }

    @keyframes heartBeat {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.2); }
    }

    .footer .footer-bottom .footer-links {
        display: flex;
        gap: 20px;
    }

    .footer .footer-bottom .footer-links a {
        color: rgba(255, 255, 255, 0.40);
        text-decoration: none;
        font-size: 0.82rem;
        transition: color 0.3s ease;
    }

    .footer .footer-bottom .footer-links a:hover {
        color: #a5d6a7;
    }

    /* Back to Top Button */
    .footer .back-to-top {
        position: absolute;
        right: 40px;
        bottom: 80px;
        width: 44px;
        height: 44px;
        background: rgba(255, 255, 255, 0.06);
        border: 1px solid rgba(255, 255, 255, 0.08);
        border-radius: 50%;
        color: rgba(255, 255, 255, 0.50);
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 18px;
        cursor: pointer;
        transition: all 0.4s ease;
        text-decoration: none;
        backdrop-filter: blur(8px);
    }

    .footer .back-to-top:hover {
        background: linear-gradient(145deg, #2e7d32, #1b5e20);
        color: #ffffff;
        transform: translateY(-6px);
        box-shadow: 0 8px 30px rgba(46, 125, 50, 0.30);
        border-color: rgba(165, 214, 167, 0.30);
    }

    /* Responsive */
    @media (max-width: 992px) {
        .footer .gallery {
            max-width: 100%;
        }
        
        .footer .back-to-top {
            right: 20px;
            bottom: 20px;
            width: 40px;
            height: 40px;
            font-size: 16px;
        }
    }

    @media (max-width: 768px) {
        .footer {
            padding: 50px 0 20px;
        }

        .footer .brand-description {
            max-width: 100%;
        }

        .footer .footer-bottom {
            flex-direction: column;
            text-align: center;
        }

        .footer .footer-bottom .footer-links {
            justify-content: center;
            flex-wrap: wrap;
        }

        .footer h5::after {
            left: 50%;
            transform: translateX(-50%);
        }

        .footer .col-md-3:hover h5::after {
            width: 45px;
        }

        .footer .links-wrapper a {
            justify-content: center;
        }

        .footer .links-wrapper a::before {
            display: none;
        }

        .footer .links-wrapper a:hover {
            transform: none;
        }

        .footer .contact-info p {
            justify-content: center;
        }

        .footer .gallery {
            max-width: 280px;
            margin: 0 auto;
        }

        .footer .social-icons {
            justify-content: center;
        }

        .footer .brand-wrapper {
            justify-content: center;
        }

        .footer .brand-description {
            text-align: center;
        }

        .footer .back-to-top {
            right: 16px;
            bottom: 16px;
            width: 38px;
            height: 38px;
            font-size: 14px;
        }
    }

    @media (max-width: 576px) {
        .footer .gallery {
            grid-template-columns: repeat(3, 1fr);
            gap: 4px;
            max-width: 200px;
        }

        .footer .brand-wrapper h4 {
            font-size: 1.2rem;
        }

        .footer .brand-wrapper img {
            width: 40px;
            height: 40px;
        }
    }
</style>
</head>
<body>

<footer class="footer">
    <div class="container">
        <div class="row gy-5">
            
            <!-- Logo & Description -->
            <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
                <div class="brand-wrapper">
                    <img src="https://tse4.mm.bing.net/th?id=OIP.vNrNrjSGanab468Bks6zNAAAAA&pid=Api&P=0&h=180" alt="WildLife Tourism Logo">
                    <h4>WildLife Tourism</h4>
                </div>
                <p class="brand-description">
                    Wildlife tourism offers travelers the unique opportunity to explore natural habitats, observe wild animals in their environment, and support conservation efforts while enjoying unforgettable adventures.
                </p>
                <div class="social-icons">
                    <a href="#" aria-label="Facebook"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#" aria-label="Pinterest"><i class="fa-brands fa-pinterest"></i></a>
                    <a href="#" aria-label="Twitter"><i class="fa-brands fa-twitter"></i></a>
                </div>
            </div>

            <!-- Links -->
            <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
                <h5>Quick Links</h5>
                <div class="links-wrapper">
                    <a href="about.jsp">About Us</a>
                    <a href="photography.jsp">Our Gallery</a>
                    <a href="safari.jsp">Safari</a>
                    <a href="stay.jsp">Accommodation</a>
                    <a href="package.jsp">Wildlife Packages</a>
                    <a href="guide.jsp">Guide Service</a>
                </div>
            </div>

            <!-- Contact Info -->
            <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="300">
                <h5>Contact Us</h5>
                <div class="contact-info">
                    <p><i class="fas fa-phone"></i> 666-888-0000</p>
                    <p><i class="fas fa-envelope"></i> needhelp@company.com</p>
                    <p><i class="fas fa-map-marker-alt"></i> 66 Brooklyn Golden Street Line, Bangalore</p>
                </div>
            </div>

            <!-- Gallery -->
            <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="400">
                <h5>Gallery</h5>
                <div class="gallery">
                    <div class="gallery-item">
                        <img src="https://images.pexels.com/photos/3777200/pexels-photo-3777200.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500" alt="Wildlife 1">
                    </div>
                    <div class="gallery-item">
                        <img src="https://t4.ftcdn.net/jpg/02/75/68/23/360_F_275682379_DGTncKA0ydnvu2epbLmWVhsFGPrQ7uwA.jpg" alt="Wildlife 2">
                    </div>
                    <div class="gallery-item">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoeDUQNwoG1LMyx32vZ2uwhXERU0XhvWsOJw&s" alt="Wildlife 3">
                    </div>
                    <div class="gallery-item">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSbl9sxBhiIuk4axoNdWQlqqVShhqd774Ctw&s" alt="Wildlife 4">
                    </div>
                    <div class="gallery-item">
                        <img src="https://img.freepik.com/free-photo/closeup-shot-beautiful-african-elephant_181624-13558.jpg" alt="Wildlife 5">
                    </div>
                    <div class="gallery-item">
                        <img src="https://t4.ftcdn.net/jpg/04/59/68/91/360_F_459689140_SF4G5fizLpJhhy8pu93rQk53PL43EwVd.jpg" alt="Wildlife 6">
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Bottom -->
        <div class="footer-bottom" data-aos="fade-up" data-aos-delay="500">
            <div class="copyright">
                &copy; 2026 <span style="color: #a5d6a7;">WildLife Tourism</span>. All Rights Reserved. Made with <i class="fas fa-heart"></i> for nature
            </div>
            <div class="footer-links">
                <a href="#">Privacy Policy</a>
                <a href="#">Terms of Service</a>
                <a href="#">Sitemap</a>
            </div>
        </div>
    </div>

    <!-- Back to Top Button -->
    <a href="#" class="back-to-top" aria-label="Back to top">
        <i class="fas fa-arrow-up"></i>
    </a>
</footer>

<!-- Smooth Back to Top -->
<script>
    document.querySelector('.back-to-top')?.addEventListener('click', function(e) {
        e.preventDefault();
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
</script>

</body>
</html>