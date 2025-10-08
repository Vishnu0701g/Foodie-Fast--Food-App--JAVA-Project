<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Placed Successfully!</title>
    <!-- Include Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Universal box-sizing for consistent layout */
        *, *::before, *::after {
            box-sizing: border-box;
        }

        /* General body styling */
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
            background-image:url(images/2.jpg);
            background-size: cover;
            margin: 0;
            padding: 0;
            line-height: 1.6;
            color: #333;
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ensures footer stays at the bottom */
            overflow-x: hidden; /* Prevents horizontal scrolling */
        }

        /* Main content container */
        .order-success-container {
            flex-grow: 1; /* Allows container to take available space, pushing footer down */
            max-width: 700px;
            margin: 3rem auto;
            padding: 2.5rem;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        /* Success icon styling */
        .success-icon {
            font-size: 5rem;
            color: #28a745; /* Green color for success */
            margin-bottom: 1.5rem;
            animation: bounceIn 0.8s ease-out; /* Simple entry animation */
        }

        /* Heading for success message */
        .success-heading {
            font-size: 2.8rem;
            color: #28a745;
            margin-bottom: 1rem;
            font-weight: 700;
        }

        /* Sub-text message */
        .success-message {
            font-size: 1.15rem;
            color: #555;
            margin-bottom: 2rem;
            line-height: 1.7;
        }

        /* Order ID display */
        .order-id {
            font-size: 1.2rem;
            color: #6c63ff; /* Primary color for order ID */
            font-weight: 600;
            margin-bottom: 2.5rem;
        }

        /* Action buttons container */
        .action-buttons {
            display: flex;
            gap: 1.5rem;
            flex-wrap: wrap; /* Allow buttons to wrap on smaller screens */
            justify-content: center;
        }

        /* Button styling */
        .btn {
            display: inline-block;
            padding: 0.9rem 1.8rem;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            text-align: center;
            transition: background-color 0.3s ease, transform 0.2s ease;
            cursor: pointer;
            font-size: 1rem;
            border: none;
        }

        .primary-btn {
            background-color: #6c63ff;
            color: #fff;
            border: 1px solid #6c63ff;
        }

        .primary-btn:hover {
            background-color: #554dff;
            transform: translateY(-2px);
        }

        .secondary-btn {
            background-color: #f0f2f5;
            color: #6c63ff;
            border: 1px solid #6c63ff;
        }

        .secondary-btn:hover {
            background-color: #e0e2e5;
            transform: translateY(-2px);
        }

        /* Animations */
        @keyframes bounceIn {
            0%, 20%, 40%, 60%, 80%, 100% {
                transition-timing-function: cubic-bezier(0.215, 0.610, 0.355, 1.000);
            }
            0% {
                opacity: 0;
                transform: scale3d(0.3, 0.3, 0.3);
            }
            20% {
                transform: scale3d(1.1, 1.1, 1.1);
            }
            40% {
                transform: scale3d(0.9, 0.9, 0.9);
            }
            60% {
                opacity: 1;
                transform: scale3d(1.03, 1.03, 1.03);
            }
            80% {
                transform: scale3d(0.97, 0.97, 0.97);
            }
            100% {
                opacity: 1;
                transform: scale3d(1, 1, 1);
            }
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .order-success-container {
                padding: 1.5rem;
                margin: 2rem auto;
            }
            .success-icon {
                font-size: 4rem;
            }
            .success-heading {
                font-size: 2.2rem;
            }
            .success-message {
                font-size: 1rem;
            }
            .order-id {
                font-size: 1.1rem;
            }
            .action-buttons {
                flex-direction: column;
                gap: 1rem;
            }
            .btn {
                width: 80%; /* Make buttons wider on small screens */
                margin: 0 auto; /* Center buttons */
            }
        }
        @media (max-width: 480px) {
             .btn {
                width: 95%; /* Make buttons almost full width on very small screens */
             }
        }

        /* Footer placeholder styles - ensure it stays at bottom */
        footer {
            margin-top: auto; /* Pushes footer to the bottom */
            /* You would replace this with your actual footer.jsp include */
            height: 80px; background-color: #333; color: #fff; display: flex; align-items: center; justify-content: center;
        }
    </style>
</head>
<body>
<body>

    <main class="order-success-container">
        <i class="fas fa-check-circle success-icon"></i>
        <h1 class="success-heading">Order Placed Successfully! 🎉</h1>
        <p class="success-message">
            Thank you for your order! We've received your request and your delicious food is now being prepared.
            
        </p>
        <p class="order-id">
            Your Order ID: <strong>#FOODIEFAST<%= (int)(Math.random() * 1000000) %></strong>
            <!-- In a real application, replace the random ID with the actual order ID from your servlet -->
        </p>

        <div class="action-buttons">
            <a href="home" class="btn primary-btn">Continue</a>
            <a href="orders" class="btn secondary-btn">View My Orders</a>
        </div>
    </main>



</body>
</html>

