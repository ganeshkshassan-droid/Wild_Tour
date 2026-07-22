<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="Explore the elusive leopards of Kabini through this stunning wildlife gallery." />
    <title>Leopard Gallery | Wildlife Tourism</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&family=Playfair+Display:wght@700&display=swap" rel="stylesheet"/>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

    <!-- AOS Animation -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"/>

    <!-- Use the same styles as above -->
    <style>
        /* Copy all styles from deer.jsp above - they are identical */
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: #f7faf7; font-family: 'Inter', sans-serif; color: #1a2e1a; overflow-x: hidden; }
        
        .page-header { background: linear-gradient(135deg, #0a1a2e, #0d2847); padding: 40px 0 30px; position: relative; overflow: hidden; }
        .page-header::before { content: ''; position: absolute; inset: 0; background: radial-gradient(circle at 30% 50%, rgba(46, 125, 50, 0.08) 0%, transparent 60%), radial-gradient(circle at 70% 50%, rgba(165, 214, 167, 0.05) 0%, transparent 60%); pointer-events: none; }
        .page-header::after { content: ''; position: absolute; bottom: 0; left: 0; right: 0; height: 4px; background: linear-gradient(90deg, #2e7d32, #66bb6a, #a5d6a7, #66bb6a, #2e7d32); background-size: 200% 100%; animation: gradientMove 4s ease-in-out infinite; }
        @keyframes gradientMove { 0%, 100% { background-position: 0% 50%; } 50% { background-position: 100% 50%; } }
        .page-header .header-content { position: relative; z-index: 1; text-align: center; }
        .page-header .header-badge { display: inline-block; background: rgba(46, 125, 50, 0.20); border: 1px solid rgba(165, 214, 167, 0.15); padding: 6px 20px; border-radius: 50px; font-size: 0.75rem; font-weight: 600; letter-spacing: 1.5px; text-transform: uppercase; color: #a5d6a7; margin-bottom: 12px; }
        .page-header h1 { font-weight: 900; font-size: 2.8rem; color: #ffffff; letter-spacing: -0.5px; margin: 0; }
        .page-header h1 span { background: linear-gradient(135deg, #a5d6a7, #66bb6a); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .page-header p { color: rgba(255, 255, 255, 0.60); font-size: 1.05rem; margin-top: 8px; }

        .hero-section { position: relative; height: 75vh; min-height: 500px; display: flex; align-items: center; justify-content: center; text-align: center; overflow: hidden; background: linear-gradient(to bottom, rgba(0,0,0,0.3), rgba(0,0,0,0.6)), url('https://bigcatsindia.com/wp-content/uploads/2019/09/Indian-Leopard-Kabini-Wildlife.jpg') center/cover no-repeat; margin-top: 0; }
        .hero-section::before { content: ''; position: absolute; inset: 0; background: radial-gradient(circle at 30% 50%, rgba(46, 125, 50, 0.10) 0%, transparent 60%); z-index: 1; }
        .hero-content { position: relative; z-index: 2; padding: 0 1.5rem; animation: fadeInUp 1s ease-out; }
        @keyframes fadeInUp { from { opacity: 0; transform: translateY(30px); } to { opacity: 1; transform: translateY(0); } }
        .hero-content .hero-badge { display: inline-block; background: rgba(46, 125, 50, 0.25); border: 1px solid rgba(165, 214, 167, 0.20); padding: 6px 20px; border-radius: 50px; font-size: 0.8rem; font-weight: 600; letter-spacing: 1.5px; text-transform: uppercase; color: #a5d6a7; margin-bottom: 16px; }
        .hero-content h1 { font-size: 4.5rem; font-weight: 900; color: #ffffff; text-shadow: 0 4px 30px rgba(0, 0, 0, 0.30); letter-spacing: -1px; margin-bottom: 12px; }
        .hero-content h1 span { background: linear-gradient(135deg, #a5d6a7, #66bb6a); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .hero-content p { font-size: 1.3rem; color: rgba(255, 255, 255, 0.80); max-width: 600px; margin: 0 auto; text-shadow: 0 2px 20px rgba(0, 0, 0, 0.20); }
        .scroll-indicator { position: absolute; bottom: 30px; left: 50%; transform: translateX(-50%); z-index: 2; color: rgba(255, 255, 255, 0.50); display: flex; flex-direction: column; align-items: center; gap: 6px; font-size: 0.7rem; letter-spacing: 2px; text-transform: uppercase; animation: bounceDown 2s infinite; }
        @keyframes bounceDown { 0%, 100% { transform: translateX(-50%) translateY(0); } 50% { transform: translateX(-50%) translateY(10px); } }
        .scroll-indicator i { font-size: 1.2rem; }

        .gallery-section { padding: 60px 0 80px; background: #f7faf7; }
        .section-header { text-align: center; margin-bottom: 48px; }
        .section-header .section-badge { display: inline-block; background: #e8f5e9; color: #2e7d32; padding: 4px 18px; border-radius: 50px; font-size: 0.75rem; font-weight: 600; letter-spacing: 1.5px; text-transform: uppercase; margin-bottom: 8px; }
        .section-header h2 { font-weight: 800; font-size: 2.5rem; color: #1a2e1a; letter-spacing: -0.5px; }
        .section-header h2 span { background: linear-gradient(135deg, #2e7d32, #66bb6a); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text; }
        .section-header p { color: #6b7a6b; font-size: 1.05rem; max-width: 600px; margin: 8px auto 0; }

        .gallery-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 25px; padding: 0 20px; }
        .gallery-card { position: relative; overflow: hidden; border-radius: 20px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04); border: 1px solid #e8eee8; cursor: pointer; transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1); aspect-ratio: 4/3; background: #ffffff; }
        .gallery-card:hover { transform: scale(1.03); box-shadow: 0 20px 60px rgba(0, 0, 0, 0.10); border-color: #a5d6a7; z-index: 10; }
        .gallery-card img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.6s ease; }
        .gallery-card:hover img { transform: scale(1.08); }
        .gallery-card .card-overlay { position: absolute; bottom: 0; left: 0; right: 0; padding: 20px 24px; background: linear-gradient(0deg, rgba(0, 0, 0, 0.70) 0%, transparent 100%); color: #ffffff; transition: all 0.4s ease; }
        .gallery-card .card-overlay .caption { font-size: 1.1rem; font-weight: 700; display: block; }
        .gallery-card .card-overlay .sub-caption { font-size: 0.8rem; opacity: 0.7; font-weight: 400; }
        .gallery-card .card-overlay .view-icon { position: absolute; right: 20px; bottom: 20px; background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(8px); width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 16px; color: #ffffff; transition: all 0.4s ease; opacity: 0; transform: translateX(10px); }
        .gallery-card:hover .view-icon { opacity: 1; transform: translateX(0); }
        .gallery-card .view-icon:hover { background: #2e7d32; transform: scale(1.1); }

        /* Enhanced Modal Styles - same as deer.jsp */
        .modal-content { border-radius: 24px; border: none; background: #ffffff; overflow: hidden; box-shadow: 0 40px 80px rgba(0, 0, 0, 0.30); animation: modalZoomIn 0.5s cubic-bezier(0.34, 1.56, 0.64, 1); }
        @keyframes modalZoomIn { from { opacity: 0; transform: scale(0.9) translateY(20px); } to { opacity: 1; transform: scale(1) translateY(0); } }
        .modal-header { border-bottom: none; padding: 20px 28px; background: linear-gradient(135deg, #0a1a2e, #0d2847); position: relative; }
        .modal-header::after { content: ''; position: absolute; bottom: 0; left: 0; right: 0; height: 3px; background: linear-gradient(90deg, #2e7d32, #66bb6a, #a5d6a7, #66bb6a, #2e7d32); background-size: 200% 100%; animation: gradientMove 2s ease-in-out infinite; }
        .modal-header .modal-title-group { display: flex; align-items: center; gap: 14px; }
        .modal-header .modal-title-group .title-icon { width: 44px; height: 44px; background: rgba(46, 125, 50, 0.20); border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 20px; color: #a5d6a7; border: 1px solid rgba(165, 214, 167, 0.15); }
        .modal-header .modal-title-group .title-text { color: #ffffff; }
        .modal-header .modal-title-group .title-text h5 { font-weight: 700; font-size: 1.3rem; color: #ffffff; margin: 0; letter-spacing: -0.3px; }
        .modal-header .modal-title-group .title-text small { color: rgba(255, 255, 255, 0.60); font-size: 0.85rem; display: block; margin-top: 2px; }
        .modal-header .btn-close { background: rgba(255, 255, 255, 0.10); border-radius: 50%; padding: 10px; opacity: 1; transition: all 0.3s ease; width: 44px; height: 44px; display: flex; align-items: center; justify-content: center; border: 1px solid rgba(255, 255, 255, 0.10); }
        .modal-header .btn-close:hover { background: rgba(220, 38, 38, 0.20); transform: rotate(90deg); border-color: rgba(220, 38, 38, 0.30); }
        .modal-header .btn-close::before { content: '\f00d'; font-family: 'Font Awesome 6 Free'; font-weight: 900; color: #ffffff; font-size: 1.2rem; }
        .modal-header .btn-close:focus { box-shadow: none; }
        .modal-body { padding: 0; background: #0d1a0d; position: relative; }
        .modal-body .image-wrapper { position: relative; width: 100%; max-height: 70vh; overflow: hidden; display: flex; align-items: center; justify-content: center; background: #0d1a0d; }
        .modal-body .image-wrapper img { width: 100%; height: auto; max-height: 70vh; object-fit: contain; transition: transform 0.6s ease; }
        .modal-body .image-wrapper .image-badge { position: absolute; top: 20px; right: 20px; background: rgba(0, 0, 0, 0.70); backdrop-filter: blur(8px); padding: 6px 16px; border-radius: 50px; color: #a5d6a7; font-size: 0.7rem; font-weight: 600; letter-spacing: 0.5px; border: 1px solid rgba(165, 214, 167, 0.15); display: flex; align-items: center; gap: 8px; }
        .modal-body .image-wrapper .image-badge i { font-size: 0.8rem; }
        .modal-body .image-wrapper .image-counter { position: absolute; bottom: 20px; right: 20px; background: rgba(0, 0, 0, 0.60); backdrop-filter: blur(8px); padding: 4px 14px; border-radius: 50px; color: rgba(255, 255, 255, 0.70); font-size: 0.75rem; font-weight: 600; }
        .modal-footer { border-top: 1px solid #e8eee8; padding: 20px 28px; background: #ffffff; border-radius: 0 0 24px 24px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 12px; }
        .modal-footer .footer-info { display: flex; align-items: center; gap: 16px; flex-wrap: wrap; }
        .modal-footer .footer-info .info-divider { width: 1px; height: 30px; background: #e8eee8; }
        .modal-footer .footer-info .info-item { display: flex; align-items: center; gap: 10px; }
        .modal-footer .footer-info .info-item i { color: #2e7d32; font-size: 1.1rem; width: 20px; text-align: center; }
        .modal-footer .footer-info .info-item .info-label { font-size: 0.75rem; color: #8a9a8a; font-weight: 400; display: block; }
        .modal-footer .footer-info .info-item .info-value { font-size: 0.9rem; font-weight: 600; color: #1a2e1a; display: block; }
        .modal-footer .btn-close-custom { background: #f7faf7; color: #1a2e1a; border: 1px solid #dce4dc; padding: 8px 24px; border-radius: 12px; font-weight: 600; font-size: 0.85rem; transition: all 0.3s ease; cursor: pointer; display: inline-flex; align-items: center; gap: 8px; font-family: 'Inter', sans-serif; }
        .modal-footer .btn-close-custom:hover { background: #2e7d32; color: #ffffff; border-color: #2e7d32; transform: translateY(-2px); box-shadow: 0 8px 25px rgba(46, 125, 50, 0.20); }
        .modal-footer .btn-close-custom i { transition: transform 0.3s ease; }
        .modal-footer .btn-close-custom:hover i { transform: rotate(90deg); }

        footer { margin-top: auto; }

        @media (max-width: 992px) { .hero-content h1 { font-size: 3.5rem; } .page-header h1 { font-size: 2.2rem; } .section-header h2 { font-size: 2rem; } .gallery-grid { grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); gap: 20px; } .modal-footer { flex-direction: column; align-items: stretch; text-align: center; } .modal-footer .footer-info { justify-content: center; } .modal-header .modal-title-group .title-text h5 { font-size: 1.1rem; } }
        @media (max-width: 768px) { .hero-section { height: 60vh; min-height: 400px; } .hero-content h1 { font-size: 2.5rem; } .hero-content p { font-size: 1rem; } .page-header h1 { font-size: 1.8rem; } .section-header h2 { font-size: 1.7rem; } .gallery-grid { grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 16px; padding: 0 12px; } .gallery-card .card-overlay .caption { font-size: 0.95rem; } .scroll-indicator { display: none; } .modal-content { border-radius: 16px; } .modal-header { padding: 16px 20px; } .modal-header .modal-title-group .title-text h5 { font-size: 1rem; } .modal-body .image-wrapper { max-height: 50vh; } .modal-body .image-wrapper img { max-height: 50vh; } .modal-footer { padding: 16px 20px; } .modal-footer .footer-info .info-divider { display: none; } .modal-header .btn-close { width: 36px; height: 36px; } }
        @media (max-width: 576px) { .hero-content h1 { font-size: 2rem; } .hero-section { height: 50vh; min-height: 350px; } .page-header h1 { font-size: 1.5rem; } .section-header h2 { font-size: 1.4rem; } .gallery-grid { grid-template-columns: 1fr 1fr; gap: 12px; padding: 0 10px; } .gallery-card .card-overlay .caption { font-size: 0.8rem; } .gallery-card .card-overlay .sub-caption { font-size: 0.65rem; } .gallery-card .card-overlay { padding: 12px 14px; } .gallery-card .card-overlay .view-icon { width: 30px; height: 30px; font-size: 12px; right: 12px; bottom: 12px; } .modal-header .modal-title-group .title-icon { width: 34px; height: 34px; font-size: 16px; } .modal-header .modal-title-group .title-text h5 { font-size: 0.9rem; } .modal-header .modal-title-group .title-text small { font-size: 0.7rem; } .modal-body .image-wrapper { max-height: 40vh; } .modal-body .image-wrapper img { max-height: 40vh; } .modal-footer .btn-close-custom { padding: 6px 16px; font-size: 0.8rem; } }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<!-- Page Header -->
<section class="page-header">
    <div class="container">
        <div class="header-content" data-aos="fade-up">
            <span class="header-badge"><i class="fa-solid fa-camera"></i> Wildlife Gallery</span>
            <h1>Leopard <span>Gallery</span></h1>
            <p>Explore the elusive leopards of Kabini</p>
        </div>
    </div>
</section>

<!-- Hero Section -->
<section class="hero-section">
    <div class="hero-content">
        <span class="hero-badge"><i class="fa-regular fa-compass"></i> Explore & Discover</span>
        <h1>The <span>Stealth Stalkers</span></h1>
        <p>Explore the elusive leopards of Kabini</p>
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
            <h2>Leopard <span>Gallery</span></h2>
            <p>Explore the stunning collection of leopard photographs from Kabini</p>
        </div>

        <div class="gallery-grid">
            <!-- Gallery Card 1 - Tree Watch -->
            <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal" 
                 data-bs-img="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDioR-ZXki93gzT_Q2XMIrVIY5-Sr3Td6Myw&s"
                 data-bs-title="Tree Watch"
                 data-bs-desc="A leopard perched on a tree branch, scanning the surroundings"
                 data-bs-sub="On the lookout"
                 data-bs-index="1"
                 data-bs-total="4">
                <img loading="lazy" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDioR-ZXki93gzT_Q2XMIrVIY5-Sr3Td6Myw&s" alt="Tree Watch"/>
                <div class="card-overlay">
                    <span class="caption">Tree Watch</span>
                    <span class="sub-caption">On the lookout</span>
                    <span class="view-icon"><i class="fa-solid fa-expand"></i></span>
                </div>
            </div>

            <!-- Gallery Card 2 - Spotted Beauty -->
            <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal" 
                 data-bs-img="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfqW43DYpEw3XD6v6ffvcEXUfj4sQeEl7pAw&s"
                 data-bs-title="Spotted Beauty"
                 data-bs-desc="The beautiful spotted coat of a leopard in the wild"
                 data-bs-sub="Beautiful markings"
                 data-bs-index="2"
                 data-bs-total="4">
                <img loading="lazy" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfqW43DYpEw3XD6v6ffvcEXUfj4sQeEl7pAw&s" alt="Spotted Beauty"/>
                <div class="card-overlay">
                    <span class="caption">Spotted Beauty</span>
                    <span class="sub-caption">Beautiful markings</span>
                    <span class="view-icon"><i class="fa-solid fa-expand"></i></span>
                </div>
            </div>

            <!-- Gallery Card 3 - In the Shadows -->
            <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal" 
                 data-bs-img="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAM6V2zzLhfr_Cst8KBmcGkDiwKN2Y8401lsym48OUoYKeqIt8b_nph7ZC&s=10"
                 data-bs-title="In the Shadows"
                 data-bs-desc="A leopard lurking in the shadows of the forest"
                 data-bs-sub="Master of camouflage"
                 data-bs-index="3"
                 data-bs-total="4">
                <img loading="lazy" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAM6V2zzLhfr_Cst8KBmcGkDiwKN2Y8401lsym48OUoYKeqIt8b_nph7ZC&s=10" alt="In the Shadows"/>
                <div class="card-overlay">
                    <span class="caption">In the Shadows</span>
                    <span class="sub-caption">Master of camouflage</span>
                    <span class="view-icon"><i class="fa-solid fa-expand"></i></span>
                </div>
            </div>

            <!-- Gallery Card 4 - Jungle Lurker -->
            <div class="gallery-card" data-bs-toggle="modal" data-bs-target="#photoModal" 
                 data-bs-img="https://media.istockphoto.com/id/1279091687/photo/indian-wild-male-leopard-or-panther-walking-head-on-with-an-eye-contact-in-natural-green.jpg?s=612x612&w=0&k=20&c=WGP5IxfOZwyQZrMfERiY-9nUM_zkL3mA2NYr5GCfT9A="
                 data-bs-title="Jungle Lurker"
                 data-bs-desc="A leopard moving stealthily through the jungle"
                 data-bs-sub="Silent and powerful"
                 data-bs-index="4"
                 data-bs-total="4">
                <img loading="lazy" src="https://media.istockphoto.com/id/1279091687/photo/indian-wild-male-leopard-or-panther-walking-head-on-with-an-eye-contact-in-natural-green.jpg?s=612x612&w=0&k=20&c=WGP5IxfOZwyQZrMfERiY-9nUM_zkL3mA2NYr5GCfT9A=" alt="Jungle Lurker"/>
                <div class="card-overlay">
                    <span class="caption">Jungle Lurker</span>
                    <span class="sub-caption">Silent and powerful</span>
                    <span class="view-icon"><i class="fa-solid fa-expand"></i></span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Enhanced Photo Modal -->
<div class="modal fade" id="photoModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content">
            <!-- Header -->
            <div class="modal-header">
                <div class="modal-title-group">
                    <div class="title-icon">
                        <i class="fas fa-paw"></i>
                    </div>
                    <div class="title-text">
                        <h5 id="modalTitle">Tree Watch</h5>
                        <small id="modalDesc">A leopard perched on a tree branch, scanning the surroundings</small>
                    </div>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- Body -->
            <div class="modal-body">
                <div class="image-wrapper">
                    <img id="modalImage" src="" alt="Leopard" class="loaded"/>
                    <span class="image-badge">
                        <i class="fas fa-image"></i> <span id="modalIndex">1</span> of <span id="modalTotal">4</span>
                    </span>
                    <span class="image-counter">
                        <i class="fas fa-camera"></i> Wildlife Photography
                    </span>
                </div>
            </div>

            <!-- Footer -->
            <div class="modal-footer">
                <div class="footer-info">
                    <div class="info-item">
                        <i class="fas fa-tag"></i>
                        <span>
                            <span class="info-label">Category</span>
                            <span class="info-value" id="modalCategory">Wildlife</span>
                        </span>
                    </div>
                    <div class="info-divider"></div>
                    <div class="info-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>
                            <span class="info-label">Location</span>
                            <span class="info-value">Kabini Forest</span>
                        </span>
                    </div>
                    <div class="info-divider"></div>
                    <div class="info-item">
                        <i class="fas fa-star"></i>
                        <span>
                            <span class="info-label">Rating</span>
                            <span class="info-value">⭐ 4.8</span>
                        </span>
                    </div>
                </div>
                <button type="button" class="btn-close-custom" data-bs-dismiss="modal">
                    <i class="fas fa-times"></i> Close
                </button>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<script>
    AOS.init({ duration: 800, easing: 'ease-out', once: true, offset: 50 });

    document.addEventListener('DOMContentLoaded', function() {
        const modal = document.getElementById('photoModal');
        const modalImage = document.getElementById('modalImage');
        const modalTitle = document.getElementById('modalTitle');
        const modalDesc = document.getElementById('modalDesc');
        const modalIndex = document.getElementById('modalIndex');
        const modalTotal = document.getElementById('modalTotal');
        const modalCategory = document.getElementById('modalCategory');

        modal.addEventListener('show.bs.modal', function(event) {
            const card = event.relatedTarget;
            const imgSrc = card.getAttribute('data-bs-img');
            const title = card.getAttribute('data-bs-title');
            const desc = card.getAttribute('data-bs-desc');
            const sub = card.getAttribute('data-bs-sub');
            const index = card.getAttribute('data-bs-index');
            const total = card.getAttribute('data-bs-total');

            modalImage.src = imgSrc;
            modalTitle.textContent = title || 'Leopard';
            modalDesc.textContent = desc || 'Wildlife photography';
            modalIndex.textContent = index || '1';
            modalTotal.textContent = total || '4';
            modalCategory.textContent = sub || 'Wildlife';
        });
    });
</script>

</body>
</html>