<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Wildlife Experience</title>

  <!-- Bootstrap CSS 5.3.2 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  
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

    /* ----- Hero Section (Welcome) ----- */
    .hero-section {
      padding: 80px 0 60px;
      position: relative;
      overflow: hidden;
      background: linear-gradient(135deg, #f7faf7 0%, #e8f5e9 100%);
    }

    .hero-section::before {
      content: '';
      position: absolute;
      top: -50%;
      right: -20%;
      width: 600px;
      height: 600px;
      background: radial-gradient(circle, rgba(46, 125, 50, 0.04) 0%, transparent 70%);
      border-radius: 50%;
      pointer-events: none;
    }

    .hero-img {
      width: 100%;
      border-radius: 50%;
      object-fit: cover;
      aspect-ratio: 1/1;
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
      transition: transform 0.5s ease, box-shadow 0.5s ease;
    }

    .hero-img:hover {
      transform: scale(1.02);
      box-shadow: 0 30px 80px rgba(0, 0, 0, 0.20);
    }

    .img-wrapper {
      position: relative;
      display: inline-block;
      cursor: pointer;
    }

    .img-overlay {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      border-radius: 50%;
      background: linear-gradient(135deg, rgba(46, 125, 50, 0.20), rgba(27, 94, 32, 0.40));
      opacity: 0;
      transition: opacity 0.5s ease;
      pointer-events: none;
    }

    .img-overlay.active {
      opacity: 1;
    }

    .icon-overlay {
      position: absolute;
      bottom: 30px;
      right: 30px;
      background: linear-gradient(145deg, #fbbf24, #f59e0b);
      color: white;
      font-size: 28px;
      padding: 18px;
      border-radius: 50%;
      box-shadow: 0 8px 30px rgba(251, 191, 36, 0.40);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      animation: pulseIcon 2s infinite;
    }

    @keyframes pulseIcon {
      0%, 100% { transform: scale(1); }
      50% { transform: scale(1.08); }
    }

    .icon-overlay:hover {
      transform: scale(1.1) rotate(-10deg);
      box-shadow: 0 12px 40px rgba(251, 191, 36, 0.50);
    }

    .hero-title {
      font-size: 3.2rem;
      font-weight: 900;
      color: #0d0d24;
      line-height: 1.1;
      letter-spacing: -1px;
    }

    .hero-title span {
      background: linear-gradient(135deg, #2e7d32, #66bb6a);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .hero-highlight {
      color: #fc4c2f;
      font-size: 1.1rem;
      margin-top: 16px;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .hero-highlight i {
      color: #fbbf24;
    }

    .hero-text {
      color: #5a6a5a;
      margin: 16px 0;
      line-height: 1.7;
      font-size: 1.05rem;
    }

    .hero-list {
      list-style: none;
      padding: 0;
    }

    .hero-list li {
      margin-bottom: 12px;
      font-weight: 500;
      color: #1a2e1a;
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 8px 12px;
      background: rgba(46, 125, 50, 0.04);
      border-radius: 10px;
      transition: all 0.3s ease;
    }

    .hero-list li:hover {
      background: rgba(46, 125, 50, 0.08);
      transform: translateX(6px);
    }

    .hero-list i {
      color: #fbbf24;
      font-size: 1.1rem;
      width: 24px;
      text-align: center;
    }

    .btn-discover {
      background: linear-gradient(145deg, #fc4c2f, #e63e22);
      color: #fff;
      padding: 14px 36px;
      font-weight: 700;
      letter-spacing: 0.5px;
      border: none;
      border-radius: 50px;
      text-decoration: none;
      display: inline-flex;
      align-items: center;
      gap: 12px;
      transition: all 0.3s ease;
      box-shadow: 0 8px 30px rgba(252, 76, 47, 0.30);
    }

    .btn-discover:hover {
      transform: translateY(-3px);
      box-shadow: 0 12px 40px rgba(252, 76, 47, 0.40);
      color: #fff;
    }

    .btn-discover i {
      transition: transform 0.3s ease;
    }

    .btn-discover:hover i {
      transform: translateX(6px);
    }

    /* ----- Highlight Section (Why Choose) ----- */
    .highlight-section {
      display: flex;
      justify-content: space-between;
      align-items: stretch;
      padding: 60px 50px;
      background: linear-gradient(135deg, #0f1f12, #1a3a1e);
      background-size: cover;
      background-position: center;
      position: relative;
      margin: 40px 0;
      border-radius: 24px;
      gap: 40px;
      overflow: hidden;
    }

    .highlight-section::before {
      content: '';
      position: absolute;
      inset: 0;
      background: linear-gradient(135deg, rgba(15, 31, 18, 0.92), rgba(26, 58, 30, 0.88));
      z-index: 1;
    }

    .highlight-section > * {
      position: relative;
      z-index: 2;
    }

    .text-section {
      flex: 1;
      padding: 20px 30px 20px 0;
    }

    .text-section h1 {
      font-size: 2.8rem;
      font-weight: 800;
      color: #ffffff;
      line-height: 1.2;
      letter-spacing: -0.5px;
    }

    .text-section h1 span {
      color: #fbbf24;
    }

    .text-section p {
      font-size: 1.05rem;
      color: rgba(255, 255, 255, 0.70);
      margin-bottom: 24px;
      line-height: 1.7;
    }

    .benefits-list {
      list-style: none;
      padding: 0;
    }

    .benefits-list li {
      display: flex;
      align-items: center;
      gap: 14px;
      font-size: 1rem;
      margin-bottom: 12px;
      color: rgba(255, 255, 255, 0.85);
      padding: 10px 16px;
      background: rgba(255, 255, 255, 0.04);
      border-radius: 12px;
      transition: all 0.3s ease;
      border: 1px solid rgba(255, 255, 255, 0.04);
    }

    .benefits-list li:hover {
      background: rgba(255, 255, 255, 0.08);
      transform: translateX(6px);
      border-color: rgba(251, 191, 36, 0.20);
    }

    .benefits-list li::before {
      content: '✦';
      color: #fbbf24;
      font-size: 1.2rem;
    }

    .membership-card {
      width: 340px;
      background: linear-gradient(145deg, #fbbf24, #f59e0b);
      padding: 36px 30px;
      border-radius: 20px;
      color: #fff;
      flex-shrink: 0;
      box-shadow: 0 20px 60px rgba(251, 191, 36, 0.30);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .membership-card::before {
      content: '';
      position: absolute;
      top: -50%;
      right: -50%;
      width: 200px;
      height: 200px;
      background: rgba(255, 255, 255, 0.05);
      border-radius: 50%;
      pointer-events: none;
    }

    .membership-card:hover {
      transform: translateY(-6px);
      box-shadow: 0 30px 80px rgba(251, 191, 36, 0.40);
    }

    .membership-card h2 {
      font-weight: 800;
      font-size: 2.2rem;
      line-height: 1.2;
      margin-bottom: 8px;
    }

    .membership-card .price {
      font-size: 3.2rem;
      font-weight: 900;
      margin: 12px 0 8px;
    }

    .membership-card .price small {
      font-size: 1.2rem;
      font-weight: 400;
      opacity: 0.8;
    }

    .membership-card .btn-dark {
      margin-top: 20px;
      font-weight: 700;
      letter-spacing: 0.5px;
      padding: 12px 32px;
      border-radius: 50px;
      background: #1a2e1a;
      border: none;
      transition: all 0.3s ease;
    }

    .membership-card .btn-dark:hover {
      background: #0d1a0d;
      transform: scale(1.02);
    }

    /* ----- Section Titles ----- */
    .section-title-wrapper {
      text-align: center;
      margin-bottom: 48px;
    }

    .section-title-wrapper .badge-top {
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

    .section-title-wrapper h1 {
      font-size: 2.8rem;
      font-weight: 900;
      color: #1a2e1a;
      letter-spacing: -0.5px;
    }

    .section-title-wrapper h1 span {
      background: linear-gradient(135deg, #2e7d32, #66bb6a);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      background-clip: text;
    }

    .section-title-wrapper p {
      color: #6b7a6b;
      font-size: 1.05rem;
      max-width: 600px;
      margin: 8px auto 0;
    }

    /* ========================================
       INFINITE HORIZONTAL SCROLL - ANIMALS
       ======================================== */
    .scroll-section {
      padding: 40px 0;
      background: #ffffff;
      overflow: hidden;
      position: relative;
    }

    .scroll-track {
      display: flex;
      gap: 20px;
      width: max-content;
      animation: scrollLeft var(--scroll-duration, 40s) linear infinite;
    }

    .scroll-track:hover {
      animation-play-state: paused;
    }

    .scroll-item {
      flex-shrink: 0;
      width: 280px;
      height: 380px;
      border-radius: 20px;
      overflow: hidden;
      position: relative;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.06);
      transition: all 0.4s ease;
    }

    .scroll-item:hover {
      transform: scale(1.05);
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
      z-index: 10;
    }

    .scroll-item img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.6s ease;
    }

    .scroll-item:hover img {
      transform: scale(1.08);
    }

    .scroll-item .info {
      position: absolute;
      bottom: 0;
      left: 0;
      right: 0;
      padding: 20px 24px;
      background: linear-gradient(0deg, rgba(0, 0, 0, 0.80) 0%, transparent 100%);
      color: white;
      text-align: center;
    }

    .scroll-item .info .animal-name {
      display: block;
      font-size: 1.3rem;
      font-weight: 800;
      letter-spacing: 0.5px;
    }

    .scroll-item .info .animal-sub {
      font-size: 0.8rem;
      font-weight: 400;
      opacity: 0.7;
      margin-top: 4px;
    }

    .scroll-item .hover-icon {
      position: absolute;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%) scale(0);
      background: rgba(255, 255, 255, 0.90);
      width: 60px;
      height: 60px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 24px;
      color: #2e7d32;
      transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
      opacity: 0;
    }

    .scroll-item:hover .hover-icon {
      transform: translate(-50%, -50%) scale(1);
      opacity: 1;
    }

    /* ========================================
       INFINITE HORIZONTAL SCROLL - TESTIMONIALS
       ======================================== */
    .testimonial-scroll-section {
      padding: 40px 0 60px;
      background: #f7faf7;
      overflow: hidden;
      position: relative;
    }

    .testimonial-scroll-track {
      display: flex;
      gap: 24px;
      width: max-content;
      animation: scrollRight var(--testimonial-duration, 45s) linear infinite;
    }

    .testimonial-scroll-track:hover {
      animation-play-state: paused;
    }

    .testimonial-item {
      flex-shrink: 0;
      width: 320px;
      min-height: 280px;
      padding: 80px 24px 24px;
      text-align: center;
      background: #ffffff;
      border-radius: 20px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
      border: 1px solid #e8eee8;
      position: relative;
      transition: all 0.4s ease;
    }

    .testimonial-item:hover {
      transform: translateY(-6px);
      box-shadow: 0 16px 48px rgba(0, 0, 0, 0.08);
      border-color: #a5d6a7;
    }

    .testimonial-item::before {
      content: '"';
      position: absolute;
      top: 20px;
      left: 24px;
      font-size: 4rem;
      color: #e8f5e9;
      font-family: Georgia, serif;
      line-height: 1;
    }

    .testimonial-item img {
      width: 80px;
      height: 80px;
      border-radius: 50%;
      object-fit: cover;
      position: absolute;
      top: -40px;
      left: 50%;
      transform: translateX(-50%);
      border: 4px solid #ffffff;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.10);
    }

    .testimonial-item p {
      font-size: 0.95rem;
      color: #4a5a4a;
      line-height: 1.6;
      margin: 12px 0 8px;
      font-style: italic;
    }

    .testimonial-item strong {
      color: #1a2e1a;
      font-weight: 700;
      font-size: 0.95rem;
    }

    .testimonial-item .stars {
      color: #fbbf24;
      font-size: 0.9rem;
      margin-top: 4px;
      letter-spacing: 2px;
    }

    /* ----- News Section ----- */
    .news-section {
      padding: 60px 0;
      background: #ffffff;
    }

    .news-container {
      display: flex;
      justify-content: center;
      gap: 30px;
      flex-wrap: wrap;
    }

    .news-card {
      background: #ffffff;
      width: 370px;
      border-radius: 20px;
      overflow: hidden;
      transition: all 0.4s ease;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
      border: 1px solid #e8eee8;
    }

    .news-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
      border-color: #a5d6a7;
    }

    .news-img {
      position: relative;
      overflow: hidden;
      height: 260px;
    }

    .news-img img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: transform 0.6s ease;
    }

    .news-card:hover .news-img img {
      transform: scale(1.05);
    }

    .date-tag {
      position: absolute;
      top: 16px;
      left: 16px;
      background: linear-gradient(145deg, #fc4c2f, #e63e22);
      color: white;
      padding: 6px 14px;
      font-size: 0.75rem;
      font-weight: 700;
      border-radius: 8px;
      letter-spacing: 0.5px;
    }

    .news-content {
      padding: 24px;
    }

    .admin-info {
      font-size: 0.82rem;
      color: #8a9a8a;
      margin-bottom: 8px;
    }

    .admin-info i {
      margin-right: 4px;
    }

    .news-title {
      font-size: 1.2rem;
      font-weight: 700;
      color: #1a2e1a;
      cursor: pointer;
      transition: color 0.3s ease;
      margin-bottom: 10px;
    }

    .news-title:hover {
      color: #2e7d32;
    }

    .news-description {
      color: #6b7a6b;
      font-size: 0.92rem;
      line-height: 1.6;
      margin-bottom: 16px;
    }

    .read-more {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      font-weight: 600;
      color: #2e7d32;
      text-decoration: none;
      transition: all 0.3s ease;
    }

    .read-more i {
      transition: transform 0.3s ease;
    }

    .read-more:hover {
      color: #1b5e20;
    }

    .read-more:hover i {
      transform: translateX(4px);
    }

    /* ========================================
       SCROLL ANIMATIONS
       ======================================== */
    @keyframes scrollLeft {
      0% {
        transform: translateX(0);
      }
      100% {
        transform: translateX(-50%);
      }
    }

    @keyframes scrollRight {
      0% {
        transform: translateX(-50%);
      }
      100% {
        transform: translateX(0);
      }
    }

    /* ----- Scroll Top Button ----- */
    .scroll-top {
      position: fixed;
      bottom: 30px;
      right: 30px;
      background: linear-gradient(145deg, #fbbf24, #f59e0b);
      color: white;
      padding: 16px 18px;
      border-radius: 50%;
      font-size: 20px;
      cursor: pointer;
      display: none;
      z-index: 1000;
      border: none;
      box-shadow: 0 8px 30px rgba(251, 191, 36, 0.40);
      transition: all 0.3s ease;
    }

    .scroll-top:hover {
      transform: translateY(-4px) scale(1.05);
      box-shadow: 0 12px 40px rgba(251, 191, 36, 0.50);
    }

    /* ----- Responsive ----- */
    @media (max-width: 992px) {
      .hero-title {
        font-size: 2.4rem;
      }

      .highlight-section {
        flex-direction: column;
        padding: 40px 30px;
      }

      .membership-card {
        width: 100%;
        max-width: 400px;
      }

      .text-section {
        padding-right: 0;
      }

      .scroll-item {
        width: 220px;
        height: 320px;
      }

      .testimonial-item {
        width: 280px;
        min-height: 260px;
      }

      .news-card {
        width: 320px;
      }
    }

    @media (max-width: 768px) {
      .hero-section {
        padding: 40px 0;
      }

      .hero-title {
        font-size: 2rem;
      }

      .highlight-section {
        padding: 30px 20px;
        border-radius: 16px;
      }

      .text-section h1 {
        font-size: 2rem;
      }

      .scroll-item {
        width: 180px;
        height: 260px;
      }

      .scroll-item .info .animal-name {
        font-size: 1rem;
      }

      .testimonial-item {
        width: 260px;
        min-height: 250px;
      }

      .membership-card h2 {
        font-size: 1.8rem;
      }

      .membership-card .price {
        font-size: 2.6rem;
      }

      .news-card {
        cursor: pointer;
        width: 100%;
        max-width: 400px;
      }
    }

    @media (max-width: 576px) {
      .hero-title {
        font-size: 1.6rem;
      }

      .section-title-wrapper h1 {
        font-size: 2rem;
      }

      .btn-discover {
        padding: 12px 24px;
        font-size: 0.9rem;
      }

      .icon-overlay {
        font-size: 20px;
        padding: 14px;
        bottom: 20px;
        right: 20px;
      }

      .membership-card {
        padding: 24px 20px;
      }

      .scroll-item {
        width: 160px;
        height: 230px;
      }

      .testimonial-item {
        width: 240px;
        min-height: 240px;
        padding: 70px 16px 16px;
      }

      .testimonial-item img {
        width: 60px;
        height: 60px;
        top: -30px;
      }
    }
  </style>
</head>
<body>

  <!-- Hero Section (Welcome) -->
  <section class="container hero-section" data-aos="fade-up">
    <div class="row align-items-center">
      <!-- Image Section -->
      <div class="col-md-6 position-relative text-center" data-aos="fade-right" data-aos-delay="100">
        <div class="img-wrapper" onclick="toggleOverlay()">
          <img src="https://media.istockphoto.com/id/158357821/photo/red-deer.jpg?s=612x612&w=0&k=20&c=_ytvQ9-Ey2CmleK2fG7pwvjMHQm78oaO6J0sX0nm0S4=" alt="Deer" class="hero-img">
          <div class="img-overlay" id="imgOverlay"></div>
        </div>
        <div class="icon-overlay">
          <i class="fas fa-paw"></i>
        </div>
      </div>

      <!-- Text Content -->
      <div class="col-md-6" data-aos="fade-left" data-aos-delay="200">
        <h1 class="hero-title">Welcome to <span>WildTour</span><br>Exploring Nature's Wonders</h1>
        <p class="hero-highlight">
          <i class="fa-solid fa-leaf"></i> Join us in the adventure of a lifetime while preserving the wild.
        </p>
        <p class="hero-text">
          Embark on a journey to the heart of nature. Experience the thrill of witnessing wildlife in their natural habitat, and support conservation efforts aimed at protecting endangered species around the world.
        </p>
        <ul class="hero-list">
          <li><i class="fas fa-arrow-right"></i> Explore exotic wildlife from around the globe</li>
          <li><i class="fas fa-arrow-right"></i> Support eco-friendly tourism practices</li>
          <li><i class="fas fa-arrow-right"></i> Experience guided safaris and immersive nature tours</li>
        </ul>
        <a href="about.jsp" class="btn-discover">
          DISCOVER MORE <i class="fa-solid fa-arrow-right"></i>
        </a>
      </div>
    </div>
  </section>

  <!-- Highlight Section (Why Choose) -->
  <div class="container-fluid highlight-section" data-aos="fade-up" data-aos-delay="100">
    <div class="text-section">
      <h1>Why You Should <span>Choose</span><br>Our Zoo Visit?</h1>
      <p>There are many variations of passages but the majority have alteration in some form by injected humour or which don't look even slightly believe.</p>
      <ul class="benefits-list">
        <li>Embark on thrilling safaris to witness wildlife in their natural habitat</li>
        <li>Explore diverse ecosystems from lush jungles to expansive savannahs</li>
        <li>Support sustainable tourism that helps conserve endangered species</li>
        <li>Enjoy expert-guided tours and insightful wildlife education</li>
        <li>Make unforgettable memories while protecting the planet's wildlife</li>
      </ul>
    </div>

    <div class="membership-card" data-aos="fade-left" data-aos-delay="200">
      <h2>FAMILY<br>MEMBERSHIP</h2>
      <p style="color: rgba(255,255,255,0.80); margin-top: 4px;">Yearly Package</p>
      <div class="price">₹1200 <small>/yr</small></div>
      <button class="btn btn-dark">Join Now <i class="fa-solid fa-arrow-right"></i></button>
    </div>
  </div>

  <!-- ========================================
       INFINITE HORIZONTAL SCROLL - ANIMALS
       ======================================== -->
  <section class="scroll-section" style="cursor: pointer;">
    <div class="container">
      <div class="section-title-wrapper" data-aos="fade-up">
        <span class="badge-top"><i class="fa-solid fa-paw"></i> Our Residents</span>
        <h1>Amazing <span>Animals</span> in Our Zoo</h1>
        <p>Meet our incredible wildlife ambassadors from around the world</p>
      </div>
    </div>

    <div class="scroll-track" id="animalTrack" style="--scroll-duration: 40s;">
      <!-- Original 5 animals -->
      <div class="scroll-item" style="cursor: pointer;">
        <img src="https://c4.wallpaperflare.com/wallpaper/984/487/746/african-lion-king-lion-animal-wallpaper-preview.jpg" alt="Lion">
        <div class="info">
          <span class="animal-name">LION</span>
          <span class="animal-sub">The Majestic King</span>
        </div>
        <div class="hover-icon"><i class="fa-solid fa-eye"></i></div>
      </div>
      <div class="scroll-item">
        <img src="https://media.istockphoto.com/id/177794699/photo/grey-wolf-portrait.jpg?s=612x612&w=0&k=20&c=vEUo0UKAKeCIIm35zU0zR7XDOf-4AKXvJWLZGx4BVws=" alt="Wolf">
        <div class="info">
          <span class="animal-name">WOLF</span>
          <span class="animal-sub">The Fearless Hunter</span>
        </div>
        <div class="hover-icon"><i class="fa-solid fa-eye"></i></div>
      </div>
      <div class="scroll-item">
        <img src="https://i.pinimg.com/736x/46/40/9a/46409a4e12a5fa90b462c86f82010a19.jpg" alt="Deer">
        <div class="info">
          <span class="animal-name">DEER</span>
          <span class="animal-sub">The Gentle Grazer</span>
        </div>
        <div class="hover-icon"><i class="fa-solid fa-eye"></i></div>
      </div>
      <div class="scroll-item">
        <img src="https://us.images.westend61.de/0001635422pw/side-view-of-monkey-sitting-on-against-tree-in-sri-lanka-forest-on-sunny-day-ADSF33030.jpg" alt="Monkey">
        <div class="info">
          <span class="animal-name">MONKEY</span>
          <span class="animal-sub">The Clever Climber</span>
        </div>
        <div class="hover-icon"><i class="fa-solid fa-eye"></i></div>
      </div>
      <div class="scroll-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyA7UmOikzdS2lt5Jfl65gfFMAYqzeqpe9Vw&s" alt="Giraffe">
        <div class="info">
          <span class="animal-name">GIRAFFE</span>
          <span class="animal-sub">The Towering Beauty</span>
        </div>
        <div class="hover-icon"><i class="fa-solid fa-eye"></i></div>
      </div>
      <!-- Duplicate for seamless infinite scroll -->
      <div class="scroll-item">
        <img src="https://c4.wallpaperflare.com/wallpaper/984/487/746/african-lion-king-lion-animal-wallpaper-preview.jpg" alt="Lion">
        <div class="info">
          <span class="animal-name">LION</span>
          <span class="animal-sub">The Majestic King</span>
        </div>
        <div class="hover-icon"><i class="fa-solid fa-eye"></i></div>
      </div>
      <div class="scroll-item">
        <img src="https://media.istockphoto.com/id/177794699/photo/grey-wolf-portrait.jpg?s=612x612&w=0&k=20&c=vEUo0UKAKeCIIm35zU0zR7XDOf-4AKXvJWLZGx4BVws=" alt="Wolf">
        <div class="info">
          <span class="animal-name">WOLF</span>
          <span class="animal-sub">The Fearless Hunter</span>
        </div>
        <div class="hover-icon"><i class="fa-solid fa-eye"></i></div>
      </div>
      <div class="scroll-item">
        <img src="https://i.pinimg.com/736x/46/40/9a/46409a4e12a5fa90b462c86f82010a19.jpg" alt="Deer">
        <div class="info">
          <span class="animal-name">DEER</span>
          <span class="animal-sub">The Gentle Grazer</span>
        </div>
        <div class="hover-icon"><i class="fa-solid fa-eye"></i></div>
      </div>
      <div class="scroll-item">
        <img src="https://us.images.westend61.de/0001635422pw/side-view-of-monkey-sitting-on-against-tree-in-sri-lanka-forest-on-sunny-day-ADSF33030.jpg" alt="Monkey">
        <div class="info">
          <span class="animal-name">MONKEY</span>
          <span class="animal-sub">The Clever Climber</span>
        </div>
        <div class="hover-icon"><i class="fa-solid fa-eye"></i></div>
      </div>
      <div class="scroll-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyA7UmOikzdS2lt5Jfl65gfFMAYqzeqpe9Vw&s" alt="Giraffe">
        <div class="info">
          <span class="animal-name">GIRAFFE</span>
          <span class="animal-sub">The Towering Beauty</span>
        </div>
        <div class="hover-icon"><i class="fa-solid fa-eye"></i></div>
      </div>
    </div>
  </section>


   <!-- News Section -->
  <section class="news-section" style="cursor: pointer;">
    <div class="container">
      <div class="section-title-wrapper" data-aos="fade-up">
        <span class="badge-top"><i class="fa-regular fa-newspaper"></i> Stay Informed</span>
        <h1>Latest <span>News</span> & Articles</h1>
        <p>Stay updated with the latest wildlife conservation news and stories</p>
      </div>

      <div class="news-container">
        <!-- Card 1 -->
        <div class="news-card" data-aos="fade-up" data-aos-delay="100">
          <div class="news-img">
            <img src="https://e0.pxfuel.com/wallpapers/416/58/desktop-wallpaper-white-tailed-deer-on-whitetail-deer.jpg" alt="Deer">
            <span class="date-tag">10 MAY</span>
          </div>
          <div class="news-content">
            <p class="admin-info"><i class="fa-regular fa-user"></i> admin &nbsp;|&nbsp; <i class="fa-regular fa-comment"></i> 2,030 Comments</p>
            <h3 class="news-title">The Importance of Protecting Endangered Species</h3>
            <p class="news-description">Learn about the vital conservation efforts being made to protect endangered species like the white-tailed deer and other wildlife.</p>
            <a href="#" class="read-more">Read More <i class="fa-solid fa-arrow-right"></i></a>
          </div>
        </div>

        <!-- Card 2 -->
        <div class="news-card" data-aos="fade-up" data-aos-delay="200">
          <div class="news-img">
            <img src="https://tse2.mm.bing.net/th?id=OIP.3KWDOsDycOfAiBxY5VHv7AHaE7&pid=Api&P=0&h=180" alt="Parrot">
            <span class="date-tag">15 JUNE</span>
          </div>
          <div class="news-content">
            <p class="admin-info"><i class="fa-regular fa-user"></i> admin &nbsp;|&nbsp; <i class="fa-regular fa-comment"></i> 0 Comments</p>
            <h3 class="news-title">How Ecotourism Can Save Our Rainforests</h3>
            <p class="news-description">Ecotourism helps preserve the delicate ecosystems of rainforests, providing opportunities to engage with nature supporting practices.</p>
            <a href="#" class="read-more">Read More <i class="fa-solid fa-arrow-right"></i></a>
          </div>
        </div>

        <!-- Card 3 -->
        <div class="news-card" data-aos="fade-up" data-aos-delay="300">
          <div class="news-img">
            <img src="https://wallpaperaccess.com/full/196890.png" alt="Monkey">
            <span class="date-tag">10 MAY</span>
          </div>
          <div class="news-content">
            <p class="admin-info"><i class="fa-regular fa-user"></i> admin &nbsp;|&nbsp; <i class="fa-regular fa-comment"></i> 0 Comments</p>
            <h3 class="news-title">Why Wildlife Sanctuaries Matter for Biodiversity</h3>
            <p class="news-description">Wildlife sanctuaries are crucial in protecting biodiversity. Discover how these safe havens are contributing to the survival of countless species.</p>
            <a href="#" class="read-more">Read More <i class="fa-solid fa-arrow-right"></i></a>
          </div>
        </div>
      </div>
    </div>
  </section>


  <!-- ========================================
       INFINITE HORIZONTAL SCROLL - TESTIMONIALS
       ======================================== -->
  <section class="testimonial-scroll-section" style="cursor: pointer;">
    <div class="container">
      <div class="section-title-wrapper" data-aos="fade-up">
        <span class="badge-top"><i class="fa-regular fa-star"></i> Testimonials</span>
        <h1>What Our <span>Visitors</span> Say</h1>
        <p>Real experiences from real people who explored the wild with us</p>
      </div>
    </div>

    <div class="testimonial-scroll-track" id="testimonialTrack" style="--testimonial-duration: 45s;">
      <!-- Original 6 testimonials -->
      <div class="testimonial-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyHVknd3Rm-dRHG1AeUOLYVaMRJ99F5IfIEQ&s" alt="Person">
        <p>"Amazing service, highly recommended! The safari experience was unforgettable."</p>
        <strong>Rahul Verma</strong>
        <div class="stars">★★★★★</div>
      </div>
      <div class="testimonial-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm0jhxD5aOdCoW-TsNm4zM17zrho6DNlXCVg&s" alt="Person">
        <p>"Very satisfied with the experience! The guides were knowledgeable and friendly."</p>
        <strong>Gautam Patel</strong>
        <div class="stars">★★★★★</div>
      </div>
      <div class="testimonial-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ3zBs0geInf3Bft5zglH95C6p6PpLpHvf-g&s" alt="Person">
        <p>"Would use again, great quality! The wildlife photography tour was exceptional."</p>
        <strong>Sanjay V. M</strong>
        <div class="stars">★★★★☆</div>
      </div>
      <div class="testimonial-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTboBzY7WU7_U0j0wZ9gdsjaNRxxMHXut_gQw&s" alt="Person">
        <p>"A fantastic experience! My family loved every moment of the jungle safari."</p>
        <strong>Geeta Sharma</strong>
        <div class="stars">★★★★★</div>
      </div>
      <div class="testimonial-item">
        <img src="https://media.istockphoto.com/id/1562983249/photo/portrait-of-happy-and-successful-businessman-indian-man-smiling-and-looking-at-camera.jpg?s=612x612&w=0&k=20&c=tfBv6taG9nTidFwENcrvEEvRHABN5gDAmg-K1G1Etnc=" alt="Person">
        <p>"Exceptional service and support. The team went above and beyond to make our trip memorable."</p>
        <strong>Amith Chowgule</strong>
        <div class="stars">★★★★★</div>
      </div>
      <div class="testimonial-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcwM3L5adB0qTMZC6kKv5U2QyVXJ96vwf_Vw&s" alt="Person">
        <p>"Loved the entire process! From booking to the actual safari, everything was perfect."</p>
        <strong>Shivani Patil</strong>
        <div class="stars">★★★★★</div>
      </div>
      <!-- Duplicate for seamless infinite scroll -->
      <div class="testimonial-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyHVknd3Rm-dRHG1AeUOLYVaMRJ99F5IfIEQ&s" alt="Person">
        <p>"Amazing service, highly recommended! The safari experience was unforgettable."</p>
        <strong>Rahul Verma</strong>
        <div class="stars">★★★★★</div>
      </div>
      <div class="testimonial-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm0jhxD5aOdCoW-TsNm4zM17zrho6DNlXCVg&s" alt="Person">
        <p>"Very satisfied with the experience! The guides were knowledgeable and friendly."</p>
        <strong>Gautam Patel</strong>
        <div class="stars">★★★★★</div>
      </div>
      <div class="testimonial-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZ3zBs0geInf3Bft5zglH95C6p6PpLpHvf-g&s" alt="Person">
        <p>"Would use again, great quality! The wildlife photography tour was exceptional."</p>
        <strong>Sanjay V. M</strong>
        <div class="stars">★★★★☆</div>
      </div>
      <div class="testimonial-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTboBzY7WU7_U0j0wZ9gdsjaNRxxMHXut_gQw&s" alt="Person">
        <p>"A fantastic experience! My family loved every moment of the jungle safari."</p>
        <strong>Geeta Sharma</strong>
        <div class="stars">★★★★★</div>
      </div>
      <div class="testimonial-item">
        <img src="https://media.istockphoto.com/id/1562983249/photo/portrait-of-happy-and-successful-businessman-indian-man-smiling-and-looking-at-camera.jpg?s=612x612&w=0&k=20&c=tfBv6taG9nTidFwENcrvEEvRHABN5gDAmg-K1G1Etnc=" alt="Person">
        <p>"Exceptional service and support. The team went above and beyond to make our trip memorable."</p>
        <strong>Amith Chowgule</strong>
        <div class="stars">★★★★★</div>
      </div>
      <div class="testimonial-item">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcwM3L5adB0qTMZC6kKv5U2QyVXJ96vwf_Vw&s" alt="Person">
        <p>"Loved the entire process! From booking to the actual safari, everything was perfect."</p>
        <strong>Shivani Patil</strong>
        <div class="stars">★★★★★</div>
      </div>
    </div>
  </section>



  <!-- Scroll Top Button -->
  <button class="scroll-top" id="scrollTopBtn">
    <i class="fas fa-arrow-up"></i>
  </button>

  <!-- Scripts -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

  <script>
    // Initialize AOS
    AOS.init({
      duration: 800,
      easing: 'ease-out',
      once: true,
      offset: 50
    });

    // Toggle image overlay
    function toggleOverlay() {
      const overlay = document.getElementById('imgOverlay');
      overlay.classList.toggle('active');
    }

    // Scroll to Top Button
    const scrollBtn = document.getElementById('scrollTopBtn');

    window.addEventListener('scroll', function() {
      if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
        scrollBtn.style.display = 'block';
      } else {
        scrollBtn.style.display = 'none';
      }
    });

    scrollBtn.addEventListener('click', function() {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });

    // Adjust animation duration based on content width for consistent speed
    document.addEventListener('DOMContentLoaded', function() {
      const animalTrack = document.getElementById('animalTrack');
      const testimonialTrack = document.getElementById('testimonialTrack');
      
      function setScrollSpeed(track, baseDuration) {
        if (!track) return;
        const trackWidth = track.scrollWidth / 2;
        const viewportWidth = window.innerWidth;
        const durationMultiplier = Math.max(1, trackWidth / (viewportWidth * 2));
        const finalDuration = Math.round(baseDuration * durationMultiplier);
        track.style.setProperty('--scroll-duration', finalDuration + 's');
      }

      setTimeout(() => {
        setScrollSpeed(animalTrack, 40);
        setScrollSpeed(testimonialTrack, 45);
      }, 100);

      let resizeTimeout;
      window.addEventListener('resize', function() {
        clearTimeout(resizeTimeout);
        resizeTimeout = setTimeout(() => {
          setScrollSpeed(animalTrack, 40);
          setScrollSpeed(testimonialTrack, 45);
        }, 250);
      });
    });
  </script>

</body>
</html>