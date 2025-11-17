<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placed Successfully!</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Reset and Base Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #fff5ed 0%, #ffe8d6 50%, #ffd4b3 100%);
            color: #333;
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Main content container */
        .order-success-container {
            flex-grow: 1;
            max-width: 650px;
            margin: 60px auto;
            padding: 60px 40px;
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(252, 128, 25, 0.15);
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
        }

        /* Decorative background circles */
        .order-success-container::before {
            content: '';
            position: absolute;
            top: -100px;
            right: -100px;
            width: 300px;
            height: 300px;
            background: linear-gradient(135deg, #fc8019 0%, #e67312 100%);
            border-radius: 50%;
            opacity: 0.05;
            z-index: 0;
        }

        .order-success-container::after {
            content: '';
            position: absolute;
            bottom: -80px;
            left: -80px;
            width: 250px;
            height: 250px;
            background: linear-gradient(135deg, #48c479 0%, #3ab066 100%);
            border-radius: 50%;
            opacity: 0.05;
            z-index: 0;
        }

        /* All content should be above decorative circles */
        .order-success-container > * {
            position: relative;
            z-index: 1;
        }

        /* Success icon styling with circular background */
        .success-icon-wrapper {
            width: 120px;
            height: 120px;
            margin: 0 auto 24px;
            background: linear-gradient(135deg, #48c479 0%, #3ab066 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 8px 24px rgba(72, 196, 121, 0.3);
            animation: bounceIn 0.8s ease-out;
        }

        .success-icon {
            font-size: 60px;
            color: #fff;
        }

        /* Heading for success message */
        .success-heading {
            font-size: 32px;
            color: #282c3f;
            margin-bottom: 16px;
            font-weight: 700;
            letter-spacing: -0.5px;
        }

        /* Sub-text message */
        .success-message {
            font-size: 16px;
            color: #686b78;
            margin-bottom: 32px;
            line-height: 1.8;
            max-width: 500px;
        }

        /* Order ID display with special styling */
        .order-id-box {
            background: linear-gradient(135deg, #fff5ed 0%, #ffe8d6 100%);
            border: 2px dashed #fc8019;
            border-radius: 12px;
            padding: 20px 32px;
            margin-bottom: 40px;
            display: inline-block;
        }

        .order-id-label {
            font-size: 14px;
            color: #686b78;
            margin-bottom: 6px;
            display: block;
        }

        .order-id {
            font-size: 24px;
            color: #fc8019;
            font-weight: 700;
            letter-spacing: 1px;
        }

        /* Info cards section */
        .info-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
            margin-bottom: 40px;
            width: 100%;
        }

        .info-card {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 16px;
            text-align: center;
        }

        .info-card i {
            font-size: 24px;
            color: #fc8019;
            margin-bottom: 8px;
            display: block;
        }

        .info-card-title {
            font-size: 12px;
            color: #686b78;
            margin-bottom: 4px;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .info-card-value {
            font-size: 16px;
            color: #282c3f;
            font-weight: 700;
        }

        /* Action buttons container */
        .action-buttons {
            display: flex;
            gap: 16px;
            flex-wrap: wrap;
            justify-content: center;
            width: 100%;
        }

        /* Button styling */
        .btn {
            display: inline-block;
            padding: 16px 32px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 600;
            font-size: 15px;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            flex: 1;
            min-width: 200px;
        }

        .primary-btn {
            background-color: #fc8019;
            color: #fff;
            box-shadow: 0 4px 12px rgba(252, 128, 25, 0.3);
        }

        .primary-btn:hover {
            background-color: #e67312;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(252, 128, 25, 0.4);
        }

        .secondary-btn {
            background-color: #fff;
            color: #fc8019;
            border: 2px solid #fc8019;
        }

        .secondary-btn:hover {
            background-color: #fc8019;
            color: #fff;
            transform: translateY(-2px);
        }

        /* Animations */
        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.3);
            }
            50% {
                opacity: 1;
                transform: scale(1.05);
            }
            70% {
                transform: scale(0.9);
            }
            100% {
                transform: scale(1);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .success-heading {
            animation: fadeInUp 0.6s ease-out 0.3s both;
        }

        .success-message {
            animation: fadeInUp 0.6s ease-out 0.5s both;
        }

        .order-id-box {
            animation: fadeInUp 0.6s ease-out 0.7s both;
        }

        .info-cards {
            animation: fadeInUp 0.6s ease-out 0.9s both;
        }

        .action-buttons {
            animation: fadeInUp 0.6s ease-out 1.1s both;
        }

        /* Confetti effect (optional decorative elements) */
        .confetti {
            position: absolute;
            width: 10px;
            height: 10px;
            background: #fc8019;
            opacity: 0;
            animation: confettiFall 3s linear infinite;
        }

        @keyframes confettiFall {
            0% {
                opacity: 1;
                transform: translateY(-100px) rotate(0deg);
            }
            100% {
                opacity: 0;
                transform: translateY(600px) rotate(720deg);
            }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            body {
                background: linear-gradient(135deg, #fff5ed 0%, #ffe8d6 100%);
            }

            .order-success-container {
                margin: 40px 20px;
                padding: 40px 24px;
                border-radius: 16px;
            }

            .success-icon-wrapper {
                width: 100px;
                height: 100px;
                margin-bottom: 20px;
            }

            .success-icon {
                font-size: 50px;
            }

            .success-heading {
                font-size: 26px;
                margin-bottom: 12px;
            }

            .success-message {
                font-size: 15px;
                margin-bottom: 24px;
            }

            .order-id {
                font-size: 20px;
            }

            .order-id-box {
                padding: 16px 24px;
                margin-bottom: 32px;
            }

            .info-cards {
                grid-template-columns: 1fr;
                gap: 12px;
                margin-bottom: 32px;
            }

            .action-buttons {
                flex-direction: column;
                gap: 12px;
            }

            .btn {
                width: 100%;
                min-width: unset;
                padding: 14px 24px;
                font-size: 14px;
            }
        }

        @media (max-width: 480px) {
            .order-success-container {
                margin: 24px 16px;
                padding: 32px 20px;
            }

            .success-heading {
                font-size: 22px;
            }

            .success-message {
                font-size: 14px;
            }

            .order-id {
                font-size: 18px;
            }

            .info-card {
                padding: 12px;
            }

            .info-card i {
                font-size: 20px;
            }

            .info-card-value {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <main class="order-success-container">
        <div class="success-icon-wrapper">
            <i class="fas fa-check success-icon"></i>
        </div>

        <h1 class="success-heading">Order Placed Successfully! 🎉</h1>
        
        <p class="success-message">
            Thank you for your order! We've received your request and your delicious food is now being prepared. You'll receive updates on your order status.
        </p>

        <div class="order-id-box">
            <span class="order-id-label">Your Order ID</span>
            <div class="order-id">#FF<%= String.format("%06d", (int)(Math.random() * 1000000)) %></div>
        </div>

        <div class="info-cards">
            <div class="info-card">
                <i class="fas fa-clock"></i>
                <div class="info-card-title">Est. Time</div>
                <div class="info-card-value">30-40 min</div>
            </div>
            <div class="info-card">
                <i class="fas fa-box"></i>
                <div class="info-card-title">Status</div>
                <div class="info-card-value">Confirmed</div>
            </div>
            <div class="info-card">
                <i class="fas fa-credit-card"></i>
                <div class="info-card-title">Payment</div>
                <div class="info-card-value">COD</div>
            </div>
        </div>

        <div class="action-buttons">
            <a href="home" class="btn secondary-btn">Continue Shopping</a>
            <a href="orders" class="btn primary-btn">Track Order</a>
        </div>
    </main>
</body>
</html>