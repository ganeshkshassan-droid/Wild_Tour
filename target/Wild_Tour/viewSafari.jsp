<%@ page import="java.sql.*" %>
<%@ page import="com.wild_tour.connection.Connector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wildlife Safari Services | Wildlife Tourism</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #f7faf7;
            color: #1a2e1a;
            min-height: 100vh;
        }

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
            background:
                radial-gradient(circle at 30% 50%, rgba(46, 125, 50, 0.08) 0%, transparent 60%),
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
            0%, 100% {
                background-position: 0% 50%;
            }

            50% {
                background-position: 100% 50%;
            }
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

        .safari-grid {
            padding: 40px 0 60px;
        }

        .safari-grid .grid-wrapper {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 30px;
            padding: 0 20px;
        }

        .safari-card {
            background: #ffffff;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            border: 1px solid #e8eee8;
            transition: all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            position: relative;
        }

        .safari-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.08);
            border-color: #a5d6a7;
        }

        .safari-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #2e7d32, #66bb6a);
            transform: scaleX(0);
            transition: transform 0.5s ease;
            transform-origin: left;
            z-index: 2;
        }

        .safari-card:hover::before {
            transform: scaleX(1);
        }

        .safari-card .card-image {
            width: 100%;
            height: 240px;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .safari-card:hover .card-image {
            transform: scale(1.03);
        }

        .safari-card .card-image-wrapper {
            position: relative;
            overflow: hidden;
        }

        .safari-card .card-image-wrapper .card-badge {
            position: absolute;
            top: 16px;
            right: 16px;
            background: rgba(0, 0, 0, 0.60);
            backdrop-filter: blur(8px);
            padding: 4px 14px;
            border-radius: 50px;
            color: #ffffff;
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 0.5px;
            z-index: 1;
        }

        .safari-card .card-body {
            padding: 24px;
        }

        .safari-card .card-body h3 {
            font-weight: 700;
            font-size: 1.3rem;
            color: #1a2e1a;
            margin-bottom: 8px;
        }

        .safari-card .card-body .card-description {
            color: #6b7a6b;
            font-size: 0.92rem;
            line-height: 1.6;
            margin-bottom: 16px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .safari-card .card-body .card-price {
            display: flex;
            align-items: baseline;
            gap: 6px;
            margin-bottom: 18px;
        }

        .safari-card .card-body .card-price .amount {
            font-size: 1.6rem;
            font-weight: 800;
            color: #2e7d32;
        }

        .safari-card .card-body .card-price .per {
            font-size: 0.85rem;
            color: #6b7a6b;
            font-weight: 500;
        }

        .safari-card .card-body .card-actions {
            display: flex;
            gap: 12px;
        }

        .safari-card .card-body .card-actions .btn {
            flex: 1;
            padding: 10px 16px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.85rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.35s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            border: none;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-update {
            background: #e8f4fd;
            color: #2563eb;
        }

        .btn-update:hover {
            background: #2563eb;
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(37, 99, 235, 0.25);
        }

        .btn-delete {
            background: #fde8e8;
            color: #dc2626;
        }

        .btn-delete:hover {
            background: #dc2626;
            color: #ffffff;
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(220, 38, 38, 0.25);
        }

        .delete-modal-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.50);
            backdrop-filter: blur(8px);
            z-index: 9999;
            align-items: center;
            justify-content: center;
            animation: fadeIn 0.3s ease;
        }

        .delete-modal-overlay.active {
            display: flex;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        .delete-modal {
            background: #ffffff;
            border-radius: 24px;
            padding: 40px 36px 32px;
            max-width: 440px;
            width: 90%;
            text-align: center;
            animation: slideUp 0.4s cubic-bezier(0.34, 1.56, 0.64, 1);
            box-shadow: 0 40px 80px rgba(0, 0, 0, 0.30);
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(40px) scale(0.96);
            }

            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .delete-modal .modal-icon {
            width: 80px;
            height: 80px;
            background: #fde8e8;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 16px;
            font-size: 36px;
            color: #dc2626;
            animation: pulseIcon 1.5s ease-in-out infinite;
        }

        @keyframes pulseIcon {
            0%, 100% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.05);
            }
        }

        .delete-modal .modal-icon i {
            animation: shakeIcon 0.6s ease-in-out;
        }

        @keyframes shakeIcon {
            0%, 100% {
                transform: rotate(0deg);
            }

            25% {
                transform: rotate(-8deg);
            }

            75% {
                transform: rotate(8deg);
            }
        }

        .delete-modal h3 {
            font-weight: 800;
            font-size: 1.4rem;
            color: #1a2e1a;
            margin-bottom: 8px;
        }

        .delete-modal p {
            color: #6b7a6b;
            font-size: 0.95rem;
            line-height: 1.6;
            margin-bottom: 4px;
        }

        .delete-modal .item-name {
            font-weight: 700;
            color: #dc2626;
            font-size: 1.05rem;
            display: block;
            margin: 8px 0 16px;
            padding: 8px 16px;
            background: #fef2f2;
            border-radius: 10px;
            border: 1px solid #fde8e8;
        }

        .delete-modal .modal-actions {
            display: flex;
            gap: 12px;
            margin-top: 24px;
        }

        .delete-modal .modal-actions .btn {
            flex: 1;
            padding: 12px 20px;
            border-radius: 14px;
            font-weight: 700;
            font-size: 0.92rem;
            font-family: 'Inter', sans-serif;
            transition: all 0.35s ease;
            border: none;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-modal-cancel {
            background: #f7faf7;
            color: #1a2e1a;
            border: 1px solid #dce4dc;
        }

        .btn-modal-cancel:hover {
            background: #e8eee8;
            transform: translateY(-2px);
        }

        .btn-modal-confirm {
            background: #dc2626;
            color: #ffffff;
            box-shadow: 0 8px 30px rgba(220, 38, 38, 0.25);
        }

        .btn-modal-confirm:hover {
            background: #b91c1c;
            transform: translateY(-2px);
            box-shadow: 0 12px 40px rgba(220, 38, 38, 0.35);
        }

        .empty-state {
            text-align: center;
            padding: 80px 20px;
            grid-column: 1 / -1;
        }

        .empty-state .empty-icon {
            font-size: 4rem;
            color: #dce4dc;
            margin-bottom: 16px;
        }

        .empty-state h3 {
            color: #1a2e1a;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .empty-state p {
            color: #6b7a6b;
        }

        .empty-state .btn-add {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 12px 32px;
            border-radius: 50px;
            background: #2e7d32;
            color: #ffffff;
            text-decoration: none;
            font-weight: 600;
            margin-top: 16px;
            transition: all 0.3s ease;
            border: none;
        }

        .empty-state .btn-add:hover {
            background: #1b5e20;
            transform: translateY(-3px);
            box-shadow: 0 8px 30px rgba(46, 125, 50, 0.30);
        }

        footer {
            margin-top: auto;
        }

        @media (max-width: 992px) {
            .page-header h1 {
                font-size: 2.2rem;
            }

            .safari-grid .grid-wrapper {
                grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
                gap: 24px;
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

            .safari-grid .grid-wrapper {
                grid-template-columns: 1fr 1fr;
                gap: 16px;
                padding: 0 12px;
            }

            .safari-card .card-body {
                padding: 18px;
            }

            .safari-card .card-image {
                height: 180px;
            }

            .safari-card .card-body h3 {
                font-size: 1.1rem;
            }

            .safari-card .card-body .card-price .amount {
                font-size: 1.3rem;
            }

            .safari-card .card-body .card-actions .btn {
                font-size: 0.78rem;
                padding: 8px 12px;
            }

            .delete-modal {
                padding: 32px 24px 28px;
            }

            .delete-modal .modal-actions {
                flex-direction: column;
            }
        }

        @media (max-width: 576px) {
            .safari-grid .grid-wrapper {
                grid-template-columns: 1fr;
                max-width: 400px;
                margin: 0 auto;
            }

            .safari-card .card-image {
                height: 200px;
            }

            .stats-bar .stats-wrapper {
                gap: 20px;
            }

            .stats-bar .stat-item .stat-number {
                font-size: 1.4rem;
            }

            .page-header h1 {
                font-size: 1.5rem;
            }

            .page-header p {
                font-size: 0.9rem;
            }

            .delete-modal {
                padding: 28px 20px 24px;
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

            <span class="header-badge">
                <i class="fa-solid fa-tree"></i>
                Safari Services
            </span>

            <h1>
                Wildlife <span>Safari</span> Services
            </h1>

            <p>
                Explore our curated safari experiences in the wild
            </p>

        </div>
    </div>
</section>


<!-- Stats Bar -->
<section class="stats-bar" data-aos="fade-up" data-aos-delay="100">

    <div class="container">

        <div class="stats-wrapper">

            <div class="stat-item">

                <div class="stat-number" id="totalSafaris">
                    0
                </div>

                <div class="stat-label">
                    <i class="fa-regular fa-compass"></i>
                    Total Safaris
                </div>

            </div>


            <div class="stat-item">

                <div class="stat-number" id="avgPrice">
                    ₹0
                </div>

                <div class="stat-label">
                    <i class="fa-regular fa-currency-sign"></i>
                    Avg Price
                </div>

            </div>


            <div class="stat-item">

                <div class="stat-number" id="locations">
                    0
                </div>

                <div class="stat-label">
                    <i class="fa-regular fa-location-dot"></i>
                    Locations
                </div>

            </div>

        </div>

    </div>

</section>


<!-- Safari Grid -->
<section class="safari-grid">

<div class="container">

<div class="grid-wrapper" id="safariGrid">

<%

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    int count = 0;
    double totalPrice = 0;


    try {

        /*
         * IMPORTANT:
         * No localhost database connection here.
         *
         * Connector.java handles the connection
         * to the Aiven MySQL database.
         */

        conn = Connector.requestConnection();


        if (conn == null) {

            throw new SQLException(
                "Database connection could not be established."
            );

        }


        String query =
            "SELECT safari_id, name, description, price_per_seat, image_url FROM safari";


        ps = conn.prepareStatement(query);


        rs = ps.executeQuery();


        while (rs.next()) {


            int id =
                rs.getInt("safari_id");


            String name =
                rs.getString("name");


            String desc =
                rs.getString("description");


            double price =
                rs.getDouble("price_per_seat");


            String image =
                rs.getString("image_url");


            count++;

            totalPrice += price;


            /*
             * Fallback values to avoid broken
             * UI if database values are NULL.
             */

            if (name == null || name.trim().isEmpty()) {

                name = "Wildlife Safari";

            }


            if (desc == null || desc.trim().isEmpty()) {

                desc =
                    "Explore an exciting wildlife safari experience.";

            }


            if (image == null || image.trim().isEmpty()) {

                image =
                    "https://placehold.co/600x400/1a2e1a/ffffff?text=Wildlife+Safari";

            }

%>


<div
    class="safari-card"
    data-aos="fade-up"
    data-aos-delay="<%= (count % 4) * 100 + 100 %>"
>


    <div class="card-image-wrapper">


        <img
            src="<%= image %>"
            alt="<%= name %>"
            class="card-image"

            onerror="
                this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Wildlife+Safari'
            "
        >


        <span class="card-badge">

            <i class="fa-regular fa-clock"></i>

            Available

        </span>


    </div>


    <div class="card-body">


        <h3>
            <%= name %>
        </h3>


        <p class="card-description">
            <%= desc %>
        </p>


        <div class="card-price">


            <span class="amount">

                ₹<%= String.format("%.2f", price) %>

            </span>


            <span class="per">

                / per seat

            </span>


        </div>


        <div class="card-actions">


            <a
                href="updateSafari.jsp?id=<%= id %>"
                class="btn btn-update"
            >

                <i class="fa-regular fa-pen-to-square"></i>

                Update

            </a>


            <button
                type="button"
                class="btn btn-delete"
                onclick="openDeleteModal(<%= id %>, '<%= name %>', 'safari')"
            >

                <i class="fa-regular fa-trash-can"></i>

                Delete

            </button>


        </div>


    </div>


</div>


<%

        }


        if (count == 0) {

%>


<div class="empty-state">


    <div class="empty-icon">

        <i class="fa-regular fa-face-frown"></i>

    </div>


    <h3>
        No Safaris Found
    </h3>


    <p>
        Start by adding your first safari experience.
    </p>


    <a
        href="addsafari.jsp"
        class="btn-add"
    >

        <i class="fa-solid fa-plus"></i>

        Add Safari

    </a>


</div>


<%

        }

    }

    catch (Exception e) {


        System.out.println(
            "Safari page database error: "
            + e.getMessage()
        );


        e.printStackTrace();

%>


<div class="empty-state">


    <div class="empty-icon">

        <i
            class="fa-solid fa-circle-exclamation"
            style="color:#dc2626;"
        ></i>

    </div>


    <h3 style="color:#dc2626;">

        Error Loading Safaris

    </h3>


    <p>

        Unable to load safari information
        from the database.

    </p>


</div>


<%

    }

    finally {


        if (rs != null) {

            try {

                rs.close();

            }

            catch (SQLException ignored) {

            }

        }


        if (ps != null) {

            try {

                ps.close();

            }

            catch (SQLException ignored) {

            }

        }


        if (conn != null) {

            try {

                conn.close();

            }

            catch (SQLException ignored) {

            }

        }

    }

%>

</div>

</div>

</section>


<!-- Delete Confirmation Modal -->
<div
    class="delete-modal-overlay"
    id="deleteModal"
>

    <div class="delete-modal">


        <div class="modal-icon">

            <i class="fa-solid fa-triangle-exclamation"></i>

        </div>


        <h3>
            Delete Confirmation
        </h3>


        <p>
            Are you sure you want to delete this item?
        </p>


        <p
            style="
                font-size:0.85rem;
                color:#6b7a6b;
            "
        >

            This action cannot be undone.

        </p>


        <span
            class="item-name"
            id="deleteItemName"
        >

            Item Name

        </span>


        <div class="modal-actions">


            <button
                class="btn btn-modal-cancel"
                onclick="closeDeleteModal()"
            >

                <i class="fa-solid fa-xmark"></i>

                Cancel

            </button>


            <button
                class="btn btn-modal-confirm"
                id="confirmDeleteBtn"
            >

                <i class="fa-solid fa-trash-can"></i>

                Delete

            </button>


        </div>


    </div>

</div>


<%@ include file="footer.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>


<script>

    AOS.init({
        duration: 800,
        easing: 'ease-out',
        once: true,
        offset: 50
    });


    document.addEventListener(
        'DOMContentLoaded',
        function() {


            const safariCards =
                document.querySelectorAll(
                    '.safari-card'
                );


            const totalSafaris =
                safariCards.length;


            document.getElementById(
                'totalSafaris'
            ).textContent =
                totalSafaris;


            if (totalSafaris > 0) {


                let totalPrice =
                    0;


                safariCards.forEach(
                    function(card) {


                        const priceText =
                            card.querySelector(
                                '.card-price .amount'
                            ).textContent;


                        const price =
                            parseFloat(
                                priceText.replace(
                                    '₹',
                                    ''
                                )
                            );


                        if (!isNaN(price)) {

                            totalPrice +=
                                price;

                        }

                    }
                );


                const avgPrice =
                    totalPrice /
                    totalSafaris;


                document.getElementById(
                    'avgPrice'
                ).textContent =
                    '₹' +
                    avgPrice.toFixed(0);


                document.getElementById(
                    'locations'
                ).textContent =
                    totalSafaris;

            }

        }
    );


    let deleteItemId =
        null;


    let deleteItemType =
        null;


    function openDeleteModal(
        id,
        name,
        type
    ) {


        deleteItemId =
            id;


        deleteItemType =
            type;


        document.getElementById(
            'deleteItemName'
        ).textContent =
            name;


        const modal =
            document.getElementById(
                'deleteModal'
            );


        modal.classList.add(
            'active'
        );


        document.body.style.overflow =
            'hidden';

    }


    function closeDeleteModal() {


        const modal =
            document.getElementById(
                'deleteModal'
            );


        modal.classList.remove(
            'active'
        );


        document.body.style.overflow =
            '';


        deleteItemId =
            null;


        deleteItemType =
            null;

    }


    document.getElementById(
        'confirmDeleteBtn'
    ).addEventListener(
        'click',
        function() {


            if (
                deleteItemId &&
                deleteItemType
            ) {


                const form =
                    document.createElement(
                        'form'
                    );


                form.method =
                    'POST';


                if (
                    deleteItemType ===
                    'safari'
                ) {

                    form.action =
                        'SafariAction';

                }

                else if (
                    deleteItemType ===
                    'stay'
                ) {

                    form.action =
                        'StayAction';

                }

                else if (
                    deleteItemType ===
                    'package'
                ) {

                    form.action =
                        'PackageAction';

                }

                else if (
                    deleteItemType ===
                    'guide'
                ) {

                    form.action =
                        'GuideAction';

                }


                const actionInput =
                    document.createElement(
                        'input'
                    );


                actionInput.type =
                    'hidden';


                actionInput.name =
                    'action';


                actionInput.value =
                    'delete';


                form.appendChild(
                    actionInput
                );


                const idInput =
                    document.createElement(
                        'input'
                    );


                idInput.type =
                    'hidden';


                if (
                    deleteItemType ===
                    'safari'
                ) {

                    idInput.name =
                        'safariId';

                }

                else if (
                    deleteItemType ===
                    'stay'
                ) {

                    idInput.name =
                        'stayId';

                }

                else if (
                    deleteItemType ===
                    'package'
                ) {

                    idInput.name =
                        'packageId';

                }

                else if (
                    deleteItemType ===
                    'guide'
                ) {

                    idInput.name =
                        'guideId';

                }


                idInput.value =
                    deleteItemId;


                form.appendChild(
                    idInput
                );


                document.body.appendChild(
                    form
                );


                form.submit();

            }

        }
    );


    document.getElementById(
        'deleteModal'
    ).addEventListener(
        'click',
        function(e) {


            if (
                e.target === this
            ) {

                closeDeleteModal();

            }

        }
    );


    document.addEventListener(
        'keydown',
        function(e) {


            if (
                e.key ===
                'Escape'
            ) {

                closeDeleteModal();

            }

        }
    );

</script>


</body>
</html>