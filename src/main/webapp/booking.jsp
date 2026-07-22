<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wild_tour.dto.User" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<%
    String itemType = request.getParameter("itemType");
    String itemName = request.getParameter("itemName");
    String priceStr = request.getParameter("price");
    String image = request.getParameter("imageURL");

    double pricePerPerson = 0;
    if (priceStr != null && !priceStr.isEmpty()) {
        pricePerPerson = Double.parseDouble(priceStr);
    }

    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    LocalDate tomorrow = LocalDate.now().plusDays(1);
    String minDate = tomorrow.toString();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Booking Form | Wildlife Tourism</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
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
            max-width: 560px;
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
            padding: 36px 32px 32px;
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
            background: linear-gradient(90deg, #2e7d32, #66bb6a, #a5d6a7, #66bb6a, #2e7d32);
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
            margin-bottom: 24px;
        }

        .form-header .icon-wrapper {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 72px;
            height: 72px;
            background: #e8f5e9;
            border-radius: 50%;
            margin-bottom: 14px;
            transition: all 0.4s ease;
        }

        .form-header .icon-wrapper i {
            font-size: 32px;
            color: #2e7d32;
            transition: transform 0.4s ease;
        }

        .form-header .icon-wrapper:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 30px rgba(46, 125, 50, 0.15);
        }

        .form-header .icon-wrapper:hover i {
            transform: rotate(-8deg) scale(1.1);
        }

        .form-header h2 {
            font-weight: 800;
            font-size: 1.6rem;
            color: #1a2e1a;
            letter-spacing: -0.5px;
            margin: 0;
        }

        .form-header h2 span {
            background: linear-gradient(135deg, #2e7d32, #66bb6a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .form-header p {
            color: #6b7a6b;
            font-size: 0.9rem;
            margin-top: 4px;
        }

        /* ----- Image Preview ----- */
        .image-preview {
            position: relative;
            border-radius: 16px;
            overflow: hidden;
            margin-bottom: 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            border: 1px solid #e8eee8;
        }

        .image-preview img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
        }

        .image-preview .image-badge {
            position: absolute;
            top: 12px;
            right: 12px;
            background: rgba(46, 125, 50, 0.85);
            backdrop-filter: blur(8px);
            padding: 4px 14px;
            border-radius: 50px;
            color: #ffffff;
            font-size: 0.7rem;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        /* ----- Messages ----- */
        .message-container {
            margin-bottom: 16px;
        }

        .message {
            padding: 12px 16px;
            border-radius: 12px;
            font-size: 0.88rem;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 12px;
            animation: slideMessage 0.4s ease forwards;
        }

        @keyframes slideMessage {
            from { opacity: 0; transform: translateY(-8px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .message.error {
            background: #ffebee;
            border-left: 4px solid #c62828;
            color: #8e1a1a;
        }

        .message.error i {
            color: #c62828;
        }

        /* ----- Form Elements ----- */
        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 600;
            font-size: 0.85rem;
            color: #1a2e1a;
            margin-bottom: 5px;
        }

        .form-group label i {
            color: #2e7d32;
            font-size: 0.9rem;
            width: 18px;
        }

        .form-group label .required {
            color: #e74c3c;
            font-weight: 700;
            font-size: 1.1rem;
        }

        .form-control {
            width: 100%;
            padding: 11px 16px;
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

        .form-control:disabled,
        .form-control[readonly] {
            background: #f0f5f0;
            color: #4a5a4a;
            cursor: not-allowed;
        }

        select.form-control {
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='12' viewBox='0 0 12 12'%3E%3Cpath fill='%236b7a6b' d='M6 8L1 3h10z'/%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 14px center;
            padding-right: 40px;
            cursor: pointer;
        }

        /* ----- Total Price Section ----- */
        .total-wrapper {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .total-wrapper .total-display {
            flex: 1;
            background: #e8f5e9;
            border: 2px solid #2e7d32;
            color: #1a5e1a;
            font-weight: 700;
            font-size: 1.1rem;
            padding: 11px 16px;
            border-radius: 12px;
            font-family: 'Inter', sans-serif;
            outline: none;
        }

        .total-wrapper .currency-icon {
            font-size: 1.2rem;
            color: #2e7d32;
            font-weight: 700;
        }

        /* ----- Submit Button ----- */
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
            transition: all 0.35s cubic-bezier(0.34, 1.56, 0.64, 1);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            cursor: pointer;
            box-shadow: 0 8px 30px rgba(46, 125, 50, 0.25);
            margin-top: 4px;
        }

        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(46, 125, 50, 0.35);
            background: linear-gradient(145deg, #388e3c, #2e7d32);
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
            background: #2e7d32;
        }

        .form-container .deco-circle.d2 {
            width: 150px;
            height: 150px;
            bottom: -40px;
            left: -40px;
            background: #66bb6a;
        }

        /* ----- Responsive ----- */
        @media (max-width: 576px) {
            body {
                padding: 20px 12px;
            }

            .form-container {
                padding: 24px 18px 20px;
                border-radius: 20px;
            }

            .form-header h2 {
                font-size: 1.3rem;
            }

            .form-header .icon-wrapper {
                width: 56px;
                height: 56px;
            }

            .form-header .icon-wrapper i {
                font-size: 24px;
            }

            .form-control {
                padding: 10px 14px;
                font-size: 0.9rem;
            }

            .image-preview img {
                height: 160px;
            }

            .btn-submit {
                padding: 12px;
                font-size: 0.9rem;
            }

            .total-wrapper .total-display {
                font-size: 0.95rem;
                padding: 10px 14px;
            }
        }

        @media (max-width: 380px) {
            .form-container {
                padding: 18px 12px 16px;
                border-radius: 16px;
            }

            .form-header h2 {
                font-size: 1.1rem;
            }

            .form-control {
                font-size: 0.85rem;
                padding: 8px 12px;
            }

            .image-preview img {
                height: 140px;
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
                <i class="fa-regular fa-calendar-check"></i>
            </div>
            <h2><%= itemType %> <span>Booking</span></h2>
            <p>Confirm your <%= itemType.toLowerCase() %> booking</p>
        </div>

        <!-- Error Messages -->
        <div class="message-container">
            <%
                String eMessage = (String) request.getAttribute("error");  
                if (eMessage != null) { 
            %>
                <div class="message error">
                    <i class="fa-solid fa-circle-exclamation"></i>
                    <%= eMessage %>
                </div>
            <%
                } 
            %>
        </div>

        <!-- Image Preview -->
        <div class="image-preview">
            <img src="<%= image %>" alt="<%= itemName %>" 
                 onerror="this.src='https://placehold.co/600x400/1a2e1a/ffffff?text=Image+Not+Available'"/>
            <span class="image-badge"><i class="fa-regular fa-image"></i> <%= itemType %></span>
        </div>

        <!-- Form -->
        <form action="BookingServlet" method="post">

            <!-- Tourist Name -->
            <div class="form-group">
                <label for="touristName"><i class="fa-regular fa-user"></i> Tourist Name</label>
                <input type="text" id="touristName" name="touristName" class="form-control" 
                       value="<%= user.getUser_name() %>" readonly />
            </div>

            <!-- Item Type -->
            <div class="form-group">
                <label for="itemType"><i class="fa-regular fa-tag"></i> Type</label>
                <input type="text" id="itemType" name="itemType" class="form-control" 
                       value="<%= itemType %>" readonly />
            </div>

            <!-- Item Name -->
            <div class="form-group">
                <label for="itemName"><i class="fa-regular fa-suitcase"></i> Name</label>
                <input type="text" id="itemName" name="itemName" class="form-control" 
                       value="<%= itemName %>" readonly />
            </div>

            <!-- Number of Persons -->
            <div class="form-group">
                <label for="numPersons"><i class="fa-regular fa-users"></i> Number of Persons <span class="required">*</span></label>
                <input type="number" id="numPersons" name="numPersons" class="form-control" 
                       value="1" min="1" max="10" onchange="updateTotalPrice()" required />
            </div>

            <!-- Booking Dates -->
            <% if ("Safari".equalsIgnoreCase(itemType) || "Guide".equalsIgnoreCase(itemType)) { %>
                <div class="form-group">
                    <label for="bookingDate"><i class="fa-regular fa-calendar"></i> Booking Date <span class="required">*</span></label>
                    <input type="date" id="bookingDate" name="bookingDate" class="form-control" 
                           min="<%= minDate %>" required />
                </div>
            <% } else if ("Stay".equalsIgnoreCase(itemType) || "Package".equalsIgnoreCase(itemType)) { %>
                <div class="form-group">
                    <label for="fromDate"><i class="fa-regular fa-calendar-plus"></i> From Date <span class="required">*</span></label>
                    <input type="date" id="fromDate" name="fromDate" class="form-control" 
                           min="<%= minDate %>" onchange="updateTotalPrice()" required />
                </div>
                <div class="form-group">
                    <label for="toDate"><i class="fa-regular fa-calendar-minus"></i> To Date <span class="required">*</span></label>
                    <input type="date" id="toDate" name="toDate" class="form-control" 
                           min="<%= minDate %>" onchange="updateTotalPrice()" required />
                </div>
            <% } %>

            <!-- Total Price -->
            <div class="form-group">
                <label><i class="fa-regular fa-currency-sign"></i> Total Price</label>
                <div class="total-wrapper">
                    <input type="text" id="totalPriceDisplay" class="total-display" 
                           value="₹ <%= String.format("%.2f", pricePerPerson) %>" readonly />
                    <input type="hidden" name="totalPrice" id="totalPrice" value="<%= pricePerPerson %>" />
                </div>
            </div>

            <!-- Payment Mode -->
            <div class="form-group">
                <label for="paymentMode"><i class="fa-regular fa-credit-card"></i> Payment Mode <span class="required">*</span></label>
                <select id="paymentMode" name="paymentMode" class="form-control" required>
                    <option value="" disabled selected>Select payment mode</option>
                    <option value="Cash">Cash</option>
                </select>
            </div>

            <!-- Hidden Fields -->
            <input type="hidden" name="imageURL" value="<%= image %>" />

            <!-- Submit Button -->
            <button type="submit" class="btn-submit">
                <i class="fa-regular fa-circle-check"></i> Confirm Booking
            </button>

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

    // Update total price function
    function updateTotalPrice() {
        const pricePerPerson = parseFloat(<%= pricePerPerson %>);
        const persons = parseInt(document.getElementById("numPersons").value) || 0;
        let total = 0;
        const itemType = "<%= itemType %>";

        if (itemType === "Stay" || itemType === "Package") {
            const from = document.getElementById("fromDate")?.value;
            const to = document.getElementById("toDate")?.value;
            if (from && to) {
                const fromDate = new Date(from);
                const toDate = new Date(to);
                const days = (toDate - fromDate) / (1000 * 60 * 60 * 24);
                if (days > 0) {
                    total = pricePerPerson * persons * days;
                } else {
                    total = 0;
                }
            }
        } else {
            total = pricePerPerson * persons;
        }

        document.getElementById("totalPriceDisplay").value = "₹ " + total.toFixed(2);
        document.getElementById("totalPrice").value = total.toFixed(2);
    }

    // Auto-focus on first input
    document.addEventListener('DOMContentLoaded', function() {
        const firstInput = document.querySelector('input:not([readonly])');
        if (firstInput) {
            firstInput.focus();
        }
        updateTotalPrice();
    });

    // Date validation for Stay/Package
    document.addEventListener('DOMContentLoaded', function() {
        const fromDate = document.getElementById('fromDate');
        const toDate = document.getElementById('toDate');
        
        if (fromDate && toDate) {
            fromDate.addEventListener('change', function() {
                const fromVal = this.value;
                if (fromVal) {
                    toDate.min = fromVal;
                    if (toDate.value && toDate.value < fromVal) {
                        toDate.value = fromVal;
                    }
                }
                updateTotalPrice();
            });
            
            toDate.addEventListener('change', updateTotalPrice);
        }
    });
</script>

</body>
</html>