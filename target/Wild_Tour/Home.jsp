<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wildlife Dashboard</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700;800&display=swap" rel="stylesheet">
    
    <style>
        /* ----- global reset & base ----- */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            flex-direction: column;
            background: #0b1a0e;
            color: #f0f7ee;
            overflow-x: hidden;
        }

        /* ----- hero section – full cinematic feel ----- */
        .hero {
            position: relative;
            height: 85vh;
            min-height: 560px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            overflow: hidden;
            background: url('https://constructive-voices.com/wp-content/uploads/2024/02/South-Sudan-wildlife-tourism-1170x669.jpg') center/cover no-repeat;
            margin-top: 0;
            border-radius: 0 0 3rem 3rem;
            box-shadow: 0 20px 40px rgba(0,0,0,0.6);
        }

        /* animated gradient overlay – richer depth */
        .hero::before {
            content: "";
            position: absolute;
            inset: 0;
            background: linear-gradient(
                160deg,
                rgba(8, 28, 12, 0.75) 0%,
                rgba(10, 30, 14, 0.35) 50%,
                rgba(3, 15, 6, 0.80) 100%
            );
            z-index: 1;
            backdrop-filter: brightness(1.05) saturate(1.1);
        }

        /* subtle floating particles (animated) */
        .hero::after {
            content: "";
            position: absolute;
            inset: 0;
            z-index: 1;
            background: radial-gradient(circle at 20% 30%, rgba(255, 215, 140, 0.08) 0%, transparent 50%),
                        radial-gradient(circle at 80% 70%, rgba(200, 230, 180, 0.06) 0%, transparent 50%);
            pointer-events: none;
        }

        .hero-content {
            position: relative;
            z-index: 3;
            padding: 0 2rem;
            animation: fadeInUp 1s cubic-bezier(0.23, 1, 0.32, 1) forwards;
            opacity: 0;
            animation-delay: 0.2s;
        }

        /* badge – glassmorphism refined */
        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.65rem;
            background: rgba(245, 245, 220, 0.12);
            border: 1px solid rgba(245, 245, 220, 0.30);
            backdrop-filter: blur(12px) saturate(1.4);
            -webkit-backdrop-filter: blur(12px) saturate(1.4);
            color: #f5f5dc;
            padding: 0.5rem 1.6rem;
            border-radius: 60px;
            font-size: 0.8rem;
            font-weight: 500;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin-bottom: 1.8rem;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
        }

        .hero-badge i {
            color: #e8d5b5;
            font-size: 1rem;
        }

        .hero-badge:hover {
            background: rgba(245, 245, 220, 0.22);
            border-color: rgba(245, 245, 220, 0.6);
            transform: scale(1.02);
        }

        .hero h1 {
            font-size: 4.2rem;
            font-weight: 800;
            line-height: 1.1;
            text-shadow: 0 8px 30px rgba(0, 0, 0, 0.7);
            color: #fcf9ed;
            margin-bottom: 0.8rem;
            letter-spacing: -0.5px;
        }

        .hero h1 span {
            background: linear-gradient(135deg, #f5e6c8, #fcf3e0);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero p {
            font-size: 1.35rem;
            font-weight: 300;
            text-shadow: 0 4px 18px rgba(0,0,0,0.7);
            color: #e2edda;
            max-width: 600px;
            margin: 0 auto 2.2rem;
            opacity: 0.95;
            letter-spacing: 0.3px;
            backdrop-filter: blur(2px);
            padding: 0 0.5rem;
        }

        .hero-actions {
            display: flex;
            gap: 1.2rem;
            justify-content: center;
            flex-wrap: wrap;
        }

        /* buttons – elevated with glow */
        .btn-hero-primary {
            background: linear-gradient(145deg, #f5f5dc, #e8e3c6);
            color: #1a3a1e;
            border: none;
            padding: 0.85rem 2.8rem;
            border-radius: 60px;
            font-weight: 700;
            font-size: 1.05rem;
            letter-spacing: 0.6px;
            transition: all 0.3s cubic-bezier(0.23, 1, 0.32, 1);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.4),
                        0 0 0 2px rgba(245, 245, 220, 0.2) inset;
            text-transform: uppercase;
        }

        .btn-hero-primary:hover {
            transform: translateY(-4px) scale(1.02);
            box-shadow: 0 16px 40px rgba(0, 0, 0, 0.5),
                        0 0 0 4px rgba(245, 245, 220, 0.3) inset;
            background: linear-gradient(145deg, #fcf9ed, #ede8d0);
            color: #0f2a13;
        }

        .btn-hero-outline {
            background: rgba(255, 255, 255, 0.06);
            color: #f5f5dc;
            border: 1.5px solid rgba(245, 245, 220, 0.5);
            padding: 0.85rem 2.8rem;
            border-radius: 60px;
            font-weight: 600;
            font-size: 1.05rem;
            letter-spacing: 0.6px;
            backdrop-filter: blur(6px);
            text-transform: uppercase;
            transition: all 0.3s cubic-bezier(0.23, 1, 0.32, 1);
            box-shadow: 0 4px 16px rgba(0,0,0,0.2);
        }

        .btn-hero-outline:hover {
            background: rgba(245, 245, 220, 0.18);
            border-color: #f5f5dc;
            color: #fcf9ed;
            transform: translateY(-4px) scale(1.02);
            box-shadow: 0 12px 36px rgba(0,0,0,0.4);
        }

        /* scroll cue – elegant pulse */
        .scroll-cue {
            position: absolute;
            bottom: 2.4rem;
            left: 50%;
            transform: translateX(-50%);
            z-index: 3;
            color: #f5f5dc;
            opacity: 0.7;
            animation: floatDown 2.6s infinite ease-in-out;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 0.2rem;
            font-size: 0.7rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            background: rgba(0,0,0,0.2);
            padding: 0.4rem 1rem;
            border-radius: 40px;
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255,255,240,0.1);
        }

        .scroll-cue i {
            font-size: 1.2rem;
        }

        /* ----- animations ----- */
        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(40px) scale(0.96);
            }
            100% {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        @keyframes floatDown {
            0%, 100% {
                transform: translate(-50%, 0);
            }
            50% {
                transform: translate(-50%, 12px);
            }
        }

        /* ----- responsive finesse ----- */
        @media (max-width: 768px) {
            .hero {
                height: 80vh;
                min-height: 500px;
                border-radius: 0 0 2rem 2rem;
            }

            .hero h1 {
                font-size: 2.8rem;
            }

            .hero p {
                font-size: 1.1rem;
                max-width: 90%;
            }

            .btn-hero-primary,
            .btn-hero-outline {
                padding: 0.65rem 2rem;
                font-size: 0.9rem;
            }
        }

        @media (max-width: 480px) {
            .hero h1 {
                font-size: 2.1rem;
            }

            .hero-badge {
                font-size: 0.7rem;
                padding: 0.3rem 1rem;
            }

            .hero-actions {
                gap: 0.8rem;
            }

            .scroll-cue {
                display: none;
            }
        }

        /* extra polish – smooth scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: #142114;
        }

        ::-webkit-scrollbar-thumb {
            background: #4f6b4a;
            border-radius: 12px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #6d8f66;
        }
    </style>
</head>

<body>
    
    <!-- header.jsp is included exactly as before – no logic changes -->
    <%@ include file="header.jsp" %>

    <!-- Hero Section -->
    <div class="hero">

        <div class="hero-content">

            <h1>
                Welcome to Your <span>Wildlife Adventure</span>
            </h1>

            <p>Experience the wild like never before</p>

            <!-- <div class="hero-actions">
                <button class="btn btn-hero-primary">Start Exploring</button>
            </div> -->

        </div>

    </div>

    <!-- Bootstrap JS (unchanged) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>