<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Wildlife Tourism</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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

        /* ----- Contact Section ----- */
        .contact-section {
            padding: 40px 0 60px;
        }

        /* ----- Map and Info Container ----- */
        .map-wrapper {
            position: relative;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            border: 1px solid #e8eee8;
            background: #ffffff;
            margin-bottom: 40px;
        }

        .map-wrapper iframe {
            width: 100%;
            height: 450px;
            border: none;
            display: block;
        }

        .map-wrapper .map-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 20px 30px;
            background: linear-gradient(0deg, rgba(0, 0, 0, 0.70) 0%, transparent 100%);
            pointer-events: none;
        }

        .map-wrapper .map-overlay .map-text {
            color: #ffffff;
            font-weight: 600;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .map-wrapper .map-overlay .map-text i {
            color: #a5d6a7;
        }

        /* ----- Contact Info Cards ----- */
        .contact-info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 40px;
        }

        .contact-info-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 24px 20px;
            text-align: center;
            border: 1px solid #e8eee8;
            transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
        }

        .contact-info-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.06);
            border-color: #a5d6a7;
        }

        .contact-info-card .card-icon {
            width: 56px;
            height: 56px;
            background: #e8f5e9;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 12px;
            font-size: 24px;
            color: #2e7d32;
            transition: all 0.4s ease;
        }

        .contact-info-card:hover .card-icon {
            background: #2e7d32;
            color: #ffffff;
            transform: scale(1.05) rotate(-4deg);
        }

        .contact-info-card h5 {
            font-weight: 700;
            font-size: 0.95rem;
            color: #1a2e1a;
            margin-bottom: 4px;
        }

        .contact-info-card p {
            color: #6b7a6b;
            font-size: 0.9rem;
            margin: 0;
        }

        .contact-info-card .timing-badge {
            display: inline-block;
            background: #fef9e8;
            color: #f59e0b;
            padding: 2px 12px;
            border-radius: 50px;
            font-size: 0.7rem;
            font-weight: 600;
            margin-top: 6px;
        }

        /* ----- Form Section ----- */
        .form-wrapper {
            background: #ffffff;
            border-radius: 20px;
            padding: 40px 36px;
            border: 1px solid #e8eee8;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
        }

        .form-wrapper .form-header {
            text-align: center;
            margin-bottom: 28px;
        }

        .form-wrapper .form-header .form-badge {
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

        .form-wrapper .form-header h2 {
            font-weight: 800;
            font-size: 1.8rem;
            color: #1a2e1a;
            letter-spacing: -0.5px;
            margin: 0;
        }

        .form-wrapper .form-header h2 span {
            background: linear-gradient(135deg, #2e7d32, #66bb6a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .form-wrapper .form-header p {
            color: #6b7a6b;
            font-size: 0.95rem;
            margin-top: 4px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            font-size: 0.88rem;
            color: #1a2e1a;
            margin-bottom: 6px;
        }

        .form-group label i {
            color: #2e7d32;
            font-size: 0.95rem;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 1.5px solid #dce4dc;
            border-radius: 12px;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            color: #1a2e1a;
            background: #fafcfa;
            transition: all 0.3s ease;
            outline: none;
        }

        .form-control::placeholder {
            color: #a0b0a0;
            font-weight: 400;
        }

        .form-control:hover {
            border-color: #b0c8b0;
            background: #ffffff;
        }

        .form-control:focus {
            border-color: #2e7d32;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(46, 125, 50, 0.08);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
            font-family: 'Inter', sans-serif;
        }

        .btn-submit {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(145deg, #2e7d32, #1b5e20);
            color: #ffffff;
            font-weight: 700;
            font-size: 1rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.35s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            cursor: pointer;
            box-shadow: 0 8px 30px rgba(46, 125, 50, 0.25);
        }

        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(46, 125, 50, 0.35);
            background: linear-gradient(145deg, #388e3c, #2e7d32);
        }

        .btn-submit i {
            transition: transform 0.3s ease;
        }

        .btn-submit:hover i {
            transform: translateX(4px);
        }

        /* ----- Success Toast ----- */
        .toast-container {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 99999;
        }

        .toast-custom {
            background: #ffffff;
            border-radius: 16px;
            padding: 20px 24px;
            box-shadow: 0 12px 48px rgba(0, 0, 0, 0.15);
            border-left: 4px solid #2e7d32;
            display: none;
            align-items: center;
            gap: 14px;
            min-width: 320px;
            animation: slideInRight 0.5s ease;
        }

        .toast-custom.show {
            display: flex;
        }

        @keyframes slideInRight {
            from { opacity: 0; transform: translateX(100px); }
            to { opacity: 1; transform: translateX(0); }
        }

        .toast-custom .toast-icon {
            font-size: 28px;
            color: #2e7d32;
        }

        .toast-custom .toast-content h5 {
            font-weight: 700;
            font-size: 1rem;
            color: #1a2e1a;
            margin: 0;
        }

        .toast-custom .toast-content p {
            font-size: 0.85rem;
            color: #6b7a6b;
            margin: 0;
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

            .map-wrapper iframe {
                height: 350px;
            }

            .form-wrapper {
                padding: 30px 24px;
            }

            .form-wrapper .form-header h2 {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 768px) {
            .page-header {
                padding: 30px 0 24px;
            }

            .page-header h1 {
                font-size: 1.8rem;
            }

            .map-wrapper iframe {
                height: 280px;
            }

            .contact-info-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 14px;
            }

            .contact-info-card {
                padding: 18px 14px;
            }

            .contact-info-card .card-icon {
                width: 44px;
                height: 44px;
                font-size: 18px;
            }

            .form-wrapper {
                padding: 24px 18px;
                border-radius: 16px;
            }

            .form-wrapper .form-header h2 {
                font-size: 1.3rem;
            }

            .toast-custom {
                min-width: 280px;
                padding: 16px 20px;
            }
        }

        @media (max-width: 576px) {
            .page-header h1 {
                font-size: 1.5rem;
            }

            .page-header p {
                font-size: 0.9rem;
            }

            .contact-info-grid {
                grid-template-columns: 1fr 1fr;
                gap: 10px;
            }

            .contact-info-card {
                padding: 14px 10px;
            }

            .contact-info-card .card-icon {
                width: 40px;
                height: 40px;
                font-size: 16px;
            }

            .contact-info-card h5 {
                font-size: 0.8rem;
            }

            .contact-info-card p {
                font-size: 0.78rem;
            }

            .form-wrapper {
                padding: 20px 14px;
            }

            .btn-submit {
                padding: 12px;
                font-size: 0.9rem;
            }

            .toast-custom {
                min-width: 240px;
                padding: 14px 16px;
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
            <span class="header-badge"><i class="fa-regular fa-message"></i> Contact Us</span>
            <h1>Get In <span>Touch</span></h1>
            <p>We'd love to hear from you. Reach out to us anytime.</p>
        </div>
    </div>
</section>

<!-- Contact Section -->
<section class="contact-section">
    <div class="container">

        <!-- Map -->
        <div class="map-wrapper" data-aos="fade-up">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3886.807646478183!2d76.37667801529379!3d12.001515890135058!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3baf691f443abcc1%3A0x168b42f52f5b2d6e!2sKabini%20Forest%20Reserve!5e0!3m2!1sen!2sin!4v1640635202295!5m2!1sen!2sin" 
                    allowfullscreen="" loading="lazy" title="Kabini Forest Reserve Map">
            </iframe>
            <div class="map-overlay">
                <span class="map-text">
                    <i class="fa-solid fa-location-dot"></i> 
                    Kabini Forest Reserve, Karnataka, India
                </span>
            </div>
        </div>

        <!-- Contact Info Cards -->
        <div class="contact-info-grid" data-aos="fade-up" data-aos-delay="100">
            <div class="contact-info-card">
                <div class="card-icon">
                    <i class="fa-solid fa-phone"></i>
                </div>
                <h5>Phone</h5>
                <p>+91 92-666-888-0000</p>
            </div>
            <div class="contact-info-card">
                <div class="card-icon">
                    <i class="fa-regular fa-envelope"></i>
                </div>
                <h5>Email</h5>
                <p>needhelp@company.com</p>
            </div>
            <div class="contact-info-card">
                <div class="card-icon">
                    <i class="fa-solid fa-location-dot"></i>
                </div>
                <h5>Address</h5>
                <p>60 Brooklyn Street, Bangalore</p>
            </div>
            <div class="contact-info-card">
                <div class="card-icon">
                    <i class="fa-regular fa-clock"></i>
                </div>
                <h5>Working Hours</h5>
                <p>Mon - Sun: 9:00 AM - 6:00 PM</p>
                <span class="timing-badge"><i class="fa-regular fa-circle-check"></i> Open Now</span>
            </div>
        </div>

        <!-- Contact Form -->
        <div class="form-wrapper" data-aos="fade-up" data-aos-delay="200">
            <div class="form-header">
                <span class="form-badge"><i class="fa-regular fa-pen-to-square"></i> Get In Touch</span>
                <h2>Have a Question? <span>Drop a Line</span></h2>
                <p>Fill in the form and we'll get back to you as soon as possible.</p>
            </div>

            <form id="contactForm">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="fullName"><i class="fa-regular fa-user"></i> Full Name</label>
                            <input type="text" id="fullName" class="form-control" placeholder="Enter your full name" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="email"><i class="fa-regular fa-envelope"></i> Email Address</label>
                            <input type="email" id="email" class="form-control" placeholder="Enter your email" required>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="phone"><i class="fa-solid fa-phone"></i> Phone Number</label>
                            <input type="tel" id="phone" class="form-control" placeholder="Enter your phone number" required>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="subject"><i class="fa-regular fa-tag"></i> Subject</label>
                            <input type="text" id="subject" class="form-control" placeholder="Enter subject" required>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="message"><i class="fa-regular fa-file-lines"></i> Message</label>
                    <textarea id="message" class="form-control" rows="4" placeholder="Write your message here..." required></textarea>
                </div>
                <button type="submit" class="btn-submit">
                    <i class="fa-regular fa-paper-plane"></i> Send Message
                </button>
            </form>
        </div>

    </div>
</section>

<!-- Success Toast -->
<div class="toast-container">
    <div class="toast-custom" id="successToast">
        <div class="toast-icon">
            <i class="fa-regular fa-circle-check"></i>
        </div>
        <div class="toast-content">
            <h5>Message Sent Successfully!</h5>
            <p>Thank you for reaching out. We'll get back to you soon.</p>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

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

    // Contact Form Submission
    document.getElementById('contactForm').addEventListener('submit', function(event) {
        event.preventDefault();
        
        // Show success toast
        const toast = document.getElementById('successToast');
        toast.classList.add('show');
        
        // Reset form
        this.reset();
        
        // Hide toast after 5 seconds
        setTimeout(function() {
            toast.classList.remove('show');
        }, 5000);
    });

    // Close toast on click
    document.getElementById('successToast').addEventListener('click', function() {
        this.classList.remove('show');
    });
</script>

</body>
</html>