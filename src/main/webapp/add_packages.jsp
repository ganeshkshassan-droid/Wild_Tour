<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Package | Wildlife Tourism</title>
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
            background: #f0f5f0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            position: relative;
        }

        /* Background with gradient and pattern */
        body::before {
            content: '';
            position: fixed;
            inset: 0;
            background: 
                radial-gradient(circle at 20% 50%, rgba(46, 125, 50, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 80% 50%, rgba(165, 214, 167, 0.05) 0%, transparent 50%),
                linear-gradient(135deg, #f0f5f0 0%, #e8f0e8 100%);
            z-index: -1;
        }

        /* ----- Form Container ----- */
        .form-wrapper {
            width: 100%;
            max-width: 520px;
            animation: fadeInUp 0.8s cubic-bezier(0.23, 1, 0.32, 1) forwards;
            opacity: 0;
        }

        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px) scale(0.96); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        .form-container {
            background: #ffffff;
            border-radius: 28px;
            padding: 40px 36px 36px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.06);
            border: 1px solid #e8eee8;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #8b5cf6, #a78bfa, #c4b5fd, #a78bfa, #8b5cf6);
            background-size: 200% 100%;
            animation: gradientMove 4s ease-in-out infinite;
        }

        @keyframes gradientMove {
            0%, 100% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
        }

        /* ----- Header ----- */
        .form-header {
            text-align: center;
            margin-bottom: 32px;
        }

        .form-header .icon-wrapper {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 72px;
            height: 72px;
            background: #f3edfc;
            border-radius: 50%;
            margin-bottom: 14px;
            transition: all 0.4s ease;
        }

        .form-header .icon-wrapper i {
            font-size: 32px;
            color: #8b5cf6;
            transition: transform 0.4s ease;
        }

        .form-header .icon-wrapper:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 30px rgba(139, 92, 246, 0.15);
        }

        .form-header .icon-wrapper:hover i {
            transform: rotate(-8deg) scale(1.1);
        }

        .form-header h2 {
            font-weight: 800;
            font-size: 1.8rem;
            color: #1a2e1a;
            letter-spacing: -0.5px;
            margin: 0;
        }

        .form-header h2 span {
            background: linear-gradient(135deg, #8b5cf6, #a78bfa);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .form-header p {
            color: #6b7a6b;
            font-size: 0.95rem;
            margin-top: 4px;
        }

        /* ----- Form Elements ----- */
        .form-group {
            margin-bottom: 20px;
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
            color: #8b5cf6;
            font-size: 0.95rem;
            width: 18px;
        }

        .form-group label .required {
            color: #e74c3c;
            font-weight: 700;
            font-size: 1.1rem;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 1.5px solid #dce4dc;
            border-radius: 14px;
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
            border-color: #8b5cf6;
            background: #ffffff;
            box-shadow: 0 0 0 4px rgba(139, 92, 246, 0.08);
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
            font-family: 'Inter', sans-serif;
        }

        /* ----- Button Group ----- */
        .btn-group-wrapper {
            display: flex;
            gap: 12px;
            margin-top: 8px;
        }

        .btn-group-wrapper .btn {
            flex: 1;
            padding: 14px 20px;
            border-radius: 14px;
            font-weight: 700;
            font-size: 0.95rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            border: none;
            cursor: pointer;
        }

        .btn-submit {
            background: linear-gradient(145deg, #8b5cf6, #7c3aed);
            color: #ffffff;
            box-shadow: 0 8px 30px rgba(139, 92, 246, 0.25);
        }

        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(139, 92, 246, 0.35);
            background: linear-gradient(145deg, #a78bfa, #8b5cf6);
        }

        .btn-submit:active {
            transform: scale(0.97);
        }

        .btn-submit i {
            transition: transform 0.3s ease;
        }

        .btn-submit:hover i {
            transform: translateX(4px);
        }

        .btn-back {
            background: #f7faf7;
            color: #1a2e1a;
            border: 1px solid #dce4dc;
        }

        .btn-back:hover {
            background: #e8eee8;
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.04);
        }

        .btn-back i {
            transition: transform 0.3s ease;
        }

        .btn-back:hover i {
            transform: translateX(-4px);
        }

        /* ----- Decorative Elements ----- */
        .form-container .deco-circle {
            position: absolute;
            border-radius: 50%;
            pointer-events: none;
            opacity: 0.03;
        }

        .form-container .deco-circle.d1 {
            width: 200px;
            height: 200px;
            top: -60px;
            right: -60px;
            background: #8b5cf6;
        }

        .form-container .deco-circle.d2 {
            width: 150px;
            height: 150px;
            bottom: -40px;
            left: -40px;
            background: #a78bfa;
        }

        /* ----- Responsive ----- */
        @media (max-width: 576px) {
            body {
                padding: 20px 12px;
            }

            .form-container {
                padding: 28px 20px 24px;
                border-radius: 20px;
            }

            .form-header h2 {
                font-size: 1.5rem;
            }

            .form-header .icon-wrapper {
                width: 60px;
                height: 60px;
            }

            .form-header .icon-wrapper i {
                font-size: 26px;
            }

            .form-control {
                padding: 10px 14px;
                font-size: 0.9rem;
            }

            .btn-group-wrapper {
                flex-direction: column;
            }

            .btn-group-wrapper .btn {
                padding: 12px 16px;
                font-size: 0.9rem;
            }
        }

        @media (max-width: 380px) {
            .form-container {
                padding: 20px 14px 20px;
                border-radius: 16px;
            }

            .form-header h2 {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>

<div class="form-wrapper" data-aos="fade-up">
    <div class="form-container">
        
        <!-- Decorative Circles -->
        <div class="deco-circle d1"></div>
        <div class="deco-circle d2"></div>

        <!-- Header -->
        <div class="form-header">
            <div class="icon-wrapper">
                <i class="fa-solid fa-suitcase"></i>
            </div>
            <h2>Add New <span>Package</span></h2>
            <p>Fill in the details to add a new tour package</p>
        </div>

        <!-- Form -->
        <form action="PackageAction" method="post">
            <input type="hidden" name="action" value="add">

            <!-- Package Name -->
            <div class="form-group">
                <label for="name">
                    <i class="fa-solid fa-tag"></i> Package Name <span class="required">*</span>
                </label>
                <input type="text" name="name" id="name" class="form-control" 
                       placeholder="Enter package name" required>
            </div>

            <!-- Image URL -->
            <div class="form-group">
                <label for="image_url">
                    <i class="fa-regular fa-image"></i> Image URL
                </label>
                <input type="text" name="image_url" id="image_url" class="form-control" 
                       placeholder="https://example.com/image.jpg">
            </div>

            <!-- Price -->
            <div class="form-group">
                <label for="price">
                    <i class="fa-solid fa-currency-sign"></i> Price <span class="required">*</span>
                </label>
                <input type="number" step="0.01" name="price" id="price" 
                       class="form-control" placeholder="Enter package price" required>
            </div>

            <!-- Description -->
            <div class="form-group">
                <label for="description">
                    <i class="fa-regular fa-file-lines"></i> Description
                </label>
                <textarea name="description" id="description" class="form-control" 
                          rows="5" placeholder="Enter package details here..."></textarea>
            </div>

            <!-- Buttons -->
            <div class="btn-group-wrapper">
                <button type="submit" class="btn btn-submit">
                    <i class="fa-solid fa-plus"></i> Add Package
                </button>
                <a href="adminDashboard.jsp" class="btn btn-back">
                    <i class="fa-solid fa-arrow-left"></i> Back
                </a>
            </div>

        </form>
    </div>
</div>

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

    // Auto-focus on first input
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('name').focus();
    });
</script>

</body>
</html>