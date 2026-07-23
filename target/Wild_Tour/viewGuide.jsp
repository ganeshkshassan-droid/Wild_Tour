<%@ page import="java.sql.*" %>
<%@ page import="com.wild_tour.connection.Connector" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Guide Services | Wildlife Tourism</title>

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
                radial-gradient(circle at 30% 50%, rgba(245,158,11,0.08) 0%, transparent 60%),
                radial-gradient(circle at 70% 50%, rgba(251,191,36,0.05) 0%, transparent 60%);
            pointer-events: none;
        }

        .page-header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(
                90deg,
                #f59e0b,
                #fbbf24,
                #fcd34d,
                #fbbf24,
                #f59e0b
            );
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
            background: rgba(245,158,11,0.20);
            border: 1px solid rgba(251,191,36,0.15);
            padding: 6px 20px;
            border-radius: 50px;
            font-size: 0.75rem;
            font-weight: 600;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            color: #fcd34d;
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
            background: linear-gradient(135deg, #fcd34d, #fbbf24);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .page-header p {
            color: rgba(255,255,255,0.60);
            font-size: 1.05rem;
            margin-top: 8px;
        }

        .stats-bar {
            background: #ffffff;
            padding: 20px 0;
            border-bottom: 1px solid #e8eee8;
            box-shadow: 0 2px 12px rgba(0,0,0,0.02);
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
            color: #f59e0b;
        }

        .stats-bar .stat-item .stat-label {
            font-size: 0.85rem;
            color: #6b7a6b;
            font-weight: 500;
        }

        .guide-grid {
            padding: 40px 0 60px;
        }

        .guide-grid .grid-wrapper {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
            padding: 0 20px;
        }

        .guide-card {
            background: #ffffff;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.04);
            border: 1px solid #e8eee8;
            transition: all 0.4s cubic-bezier(0.34,1.56,0.64,1);
            position: relative;
            text-align: center;
        }

        .guide-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 60px rgba(0,0,0,0.08);
            border-color: #fcd34d;
        }

        .guide-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, #f59e0b, #fbbf24);
            transform: scaleX(0);
            transition: transform 0.5s ease;
            transform-origin: left;
            z-index: 2;
        }

        .guide-card:hover::before {
            transform: scaleX(1);
        }

        .guide-card .card-image-wrapper {
            position: relative;
            padding-top: 20px;
        }

        .guide-card .card-image {
            width: 140px;
            height: 140px;
            border-radius: 50%;
            object-fit: cover;
            margin: 0 auto;
            border: 4px solid #f3edfc;
            transition: all 0.6s ease;
            display: block;
        }

        .guide-card:hover .card-image {
            transform: scale(1.05);
            border-color: #fbbf24;
            box-shadow: 0 8px 30px rgba(245,158,11,0.20);
        }

        .guide-card .card-image-wrapper .card-badge {
            position: absolute;
            top: 30px;
            right: 24px;
            background: rgba(245,158,11,0.90);
            backdrop-filter: blur(8px);
            padding: 4px 14px;
            border-radius: 50px;
            color: #ffffff;
            font-size: 0.7rem;
            font-weight: 600;
            z-index: 1;
        }

        .guide-card .card-body {
            padding: 20px 24px 24px;
        }

        .guide-card .card-body h3 {
            font-weight: 700;
            font-size: 1.3rem;
            color: #1a2e1a;
            margin-bottom: 4px;
        }

        .guide-title {
            font-size: 0.85rem;
            color: #f59e0b;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .card-bio {
            color: #6b7a6b;
            font-size: 0.92rem;
            line-height: 1.6;
            margin-bottom: 16px;
        }

        .card-price {
            display: flex;
            align-items: baseline;
            justify-content: center;
            gap: 6px;
            margin-bottom: 18px;
        }

        .card-price .amount {
            font-size: 1.5rem;
            font-weight: 800;
            color: #f59e0b;
        }

        .card-price .per {
            font-size: 0.85rem;
            color: #6b7a6b;
        }

        .card-actions {
            display: flex;
            gap: 12px;
        }

        .card-actions .btn {
            flex: 1;
            padding: 10px 16px;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.85rem;
            transition: all 0.35s ease;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            border: none;
            text-decoration: none;
        }

        .btn-update {
            background: #fef9e8;
            color: #f59e0b;
        }

        .btn-update:hover {
            background: #f59e0b;
            color: white;
            transform: translateY(-2px);
        }

        .btn-delete {
            background: #fde8e8;
            color: #dc2626;
        }

        .btn-delete:hover {
            background: #dc2626;
            color: white;
            transform: translateY(-2px);
        }

        .delete-modal-overlay {
            display: none;
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.50);
            backdrop-filter: blur(8px);
            z-index: 9999;
            align-items: center;
            justify-content: center;
        }

        .delete-modal-overlay.active {
            display: flex;
        }

        .delete-modal {
            background: #ffffff;
            border-radius: 24px;
            padding: 40px 36px 32px;
            max-width: 440px;
            width: 90%;
            text-align: center;
            box-shadow: 0 40px 80px rgba(0,0,0,0.30);
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
        }

        .delete-modal h3 {
            font-weight: 800;
            color: #1a2e1a;
        }

        .delete-modal p {
            color: #6b7a6b;
        }

        .delete-modal .item-name {
            font-weight: 700;
            color: #dc2626;
            display: block;
            margin: 8px 0 16px;
            padding: 8px 16px;
            background: #fef2f2;
            border-radius: 10px;
        }

        .modal-actions {
            display: flex;
            gap: 12px;
            margin-top: 24px;
        }

        .modal-actions .btn {
            flex: 1;
            padding: 12px;
            border-radius: 14px;
            font-weight: 700;
            border: none;
        }

        .btn-modal-cancel {
            background: #f7faf7;
            color: #1a2e1a;
        }

        .btn-modal-confirm {
            background: #dc2626;
            color: white;
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
            background: #f59e0b;
            color: white;
            text-decoration: none;
            font-weight: 600;
            margin-top: 16px;
        }

        @media (max-width: 768px) {
            .guide-grid .grid-wrapper {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 576px) {
            .guide-grid .grid-wrapper {
                grid-template-columns: 1fr;
            }

            .modal-actions {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

<%@ include file="header.jsp" %>

<section class="page-header">
    <div class="container">

        <div class="header-content" data-aos="fade-up">

            <span class="header-badge">
                <i class="fa-solid fa-compass"></i>
                Expert Guides
            </span>

            <h1>
                Wildlife <span>Guide</span> Services
            </h1>

            <p>
                Meet our expert guides for an unforgettable wildlife experience
            </p>

        </div>

    </div>
</section>


<section class="stats-bar">

    <div class="container">

        <div class="stats-wrapper">

            <div class="stat-item">

                <div class="stat-number" id="totalGuides">
                    0
                </div>

                <div class="stat-label">
                    Total Guides
                </div>

            </div>


            <div class="stat-item">

                <div class="stat-number" id="avgPrice">
                    ₹0
                </div>

                <div class="stat-label">
                    Avg Price
                </div>

            </div>


            <div class="stat-item">

                <div class="stat-number" id="experience">
                    0
                </div>

                <div class="stat-label">
                    Years Experience
                </div>

            </div>

        </div>

    </div>

</section>


<section class="guide-grid">

<div class="container">

<div class="grid-wrapper" id="guideGrid">

<%

Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

int count = 0;
double totalPrice = 0;


try {

    /*
     * IMPORTANT:
     * Connector.java handles the
     * Render -> Aiven database connection.
     */

    conn = Connector.requestConnection();


    if (conn == null) {

        throw new SQLException(
            "Database connection could not be established."
        );

    }


    String query =
        "SELECT id, name, bio, price, image FROM guides";


    ps = conn.prepareStatement(query);

    rs = ps.executeQuery();


    while (rs.next()) {


        int id =
            rs.getInt("id");


        String name =
            rs.getString("name");


        String bio =
            rs.getString("bio");


        double price =
            rs.getDouble("price");


        String image =
            rs.getString("image");


        count++;

        totalPrice += price;


        String guideTitle =
            "Wildlife Expert";


        if (name != null) {

            String lowerName =
                name.toLowerCase();


            if (
                lowerName.contains("raj") ||
                lowerName.contains("singh")
            ) {

                guideTitle =
                    "Senior Naturalist";

            }

            else if (
                lowerName.contains("sharma") ||
                lowerName.contains("verma")
            ) {

                guideTitle =
                    "Wildlife Photographer";

            }

            else if (
                lowerName.contains("patel")
            ) {

                guideTitle =
                    "Jungle Specialist";

            }

            else if (
                lowerName.contains("kumar")
            ) {

                guideTitle =
                    "Birding Expert";

            }

            else {

                guideTitle =
                    "Wildlife Guide";

            }

        }

%>


<div class="guide-card"
     data-aos="fade-up"
     data-aos-delay="<%= (count % 4) * 100 + 100 %>">


    <div class="card-image-wrapper">


        <img
            src="<%= image %>"
            alt="<%= name %>"
            class="card-image"
            onerror="this.src='https://placehold.co/200x200/1a2e1a/ffffff?text=Guide'"
        >


        <span class="card-badge">

            <i class="fa-regular fa-certificate"></i>

            Expert

        </span>


    </div>


    <div class="card-body">


        <h3>
            <%= name %>
        </h3>


        <div class="guide-title">

            <i class="fa-regular fa-star"></i>

            <%= guideTitle %>

        </div>


        <p class="card-bio">

            <%=
                bio != null && !bio.isEmpty()
                ? bio
                : "Experienced wildlife guide with deep knowledge of the jungle."
            %>

        </p>


        <div class="card-price">

            <span class="amount">

                ₹<%= String.format("%.2f", price) %>

            </span>


            <span class="per">

                / per day

            </span>

        </div>


        <div class="card-actions">


            <a
                href="updateGuide.jsp?id=<%= id %>"
                class="btn btn-update"
            >

                <i class="fa-regular fa-pen-to-square"></i>

                Update

            </a>


            <button
                type="button"
                class="btn btn-delete"
                onclick="openDeleteModal(<%= id %>, '<%= name %>', 'guide')"
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
        No Guides Found
    </h3>


    <p>
        Start by adding your first wildlife guide.
    </p>


    <a
        href="add_guide.jsp"
        class="btn-add"
    >

        <i class="fa-solid fa-plus"></i>

        Add Guide

    </a>

</div>


<%

    }


}

catch (Exception e) {


    System.out.println(
        "View Guide Error: "
        + e.getMessage()
    );


    e.printStackTrace();

%>


<div class="empty-state">

    <div class="empty-icon">

        <i
            class="fa-solid fa-circle-exclamation"
            style="color:#dc2626;">
        </i>

    </div>


    <h3 style="color:#dc2626;">
        Error Loading Guides
    </h3>


    <p>
        Unable to load guide information
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


        <p style="font-size:0.85rem;">

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

                Cancel

            </button>


            <button
                class="btn btn-modal-confirm"
                id="confirmDeleteBtn"
            >

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


        const guideCards =
            document.querySelectorAll(
                '.guide-card'
            );


        const totalGuides =
            guideCards.length;


        document.getElementById(
            'totalGuides'
        ).textContent =
            totalGuides;


        if (totalGuides > 0) {


            let totalPrice = 0;


            guideCards.forEach(
                function(card) {


                    const priceText =
                        card.querySelector(
                            '.card-price .amount'
                        ).textContent;


                    const price =
                        parseFloat(
                            priceText.replace('₹', '')
                        );


                    if (!isNaN(price)) {

                        totalPrice += price;

                    }

                }
            );


            const avgPrice =
                totalPrice /
                totalGuides;


            document.getElementById(
                'avgPrice'
            ).textContent =
                '₹' +
                avgPrice.toFixed(0);


            document.getElementById(
                'experience'
            ).textContent =
                Math.floor(
                    Math.random() * 10 + 5
                ) + '+';

        }

    }
);


let deleteItemId = null;
let deleteItemType = null;


function openDeleteModal(
    id,
    name,
    type
) {

    deleteItemId = id;

    deleteItemType = type;


    document.getElementById(
        'deleteItemName'
    ).textContent =
        name;


    document.getElementById(
        'deleteModal'
    ).classList.add(
        'active'
    );


    document.body.style.overflow =
        'hidden';

}


function closeDeleteModal() {


    document.getElementById(
        'deleteModal'
    ).classList.remove(
        'active'
    );


    document.body.style.overflow =
        '';


    deleteItemId = null;

    deleteItemType = null;

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


            form.action =
                deleteItemType === 'guide'
                ? 'GuideAction'
                : deleteItemType === 'safari'
                ? 'SafariAction'
                : deleteItemType === 'stay'
                ? 'StayAction'
                : 'PackageAction';


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


            idInput.name =
                deleteItemType === 'guide'
                ? 'guideId'
                : deleteItemType === 'safari'
                ? 'safariId'
                : deleteItemType === 'stay'
                ? 'stayId'
                : 'packageId';


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


        if (e.target === this) {

            closeDeleteModal();

        }

    }
);


document.addEventListener(
    'keydown',
    function(e) {


        if (e.key === 'Escape') {

            closeDeleteModal();

        }

    }
);

</script>

</body>
</html>