<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple Payment Gateway</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: #4B2E2B; /* Dusky Whiskey background */
            color: #F5EBDD;
        }
        .container {
            max-width: 450px;
            margin: 60px auto;
            background: #6E4A41;
            padding: 30px 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.3);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #FFD700;
        }
        input {
            width: 100%;
            padding: 12px 10px;
            margin: 10px 0;
            border: none;
            border-radius: 8px;
            background: #F5EBDD;
            color: #4B2E2B;
            font-size: 1rem;
        }
        input:focus {
            outline: 2px solid #FFD700;
        }
        button {
            padding: 12px;
            background: #FFD700;
            color: #4B2E2B;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: 0.3s;
            width: 100%;
            font-size: 1rem;
        }
        button:hover {
            background: #FFC300;
        }
        #response {
            margin-top: 20px;
            font-weight: bold;
            text-align: center;
            font-size: 1rem;
        }
        .form-label {
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Payment Gateway</h2>
    <form id="paymentForm">
        <label class="form-label">Card Number</label>
        <input type="text" name="cardNumber" placeholder="1234 5678 9012 3456" required>

        <label class="form-label">Expiry (MM/YY)</label>
        <input type="text" name="expiry" placeholder="MM/YY" required>

        <label class="form-label">CVV</label>
        <input type="text" name="cvv" placeholder="123" required>

        <label class="form-label">Amount</label>
        <input type="text" name="amount" value="<%= request.getParameter("amount") %>" readonly>

        <button type="submit">Pay Now</button>
    </form>
    <div id="response"></div>
</div>

<script>
$(document).ready(function(){
    $("#paymentForm").on("submit", function(e){
        e.preventDefault();

       
        $("#response").css("color","green").text("✅ Payment Successful! Thank you for your purchase.");

     
        $.post("clearCart.jsp", {}, function(){
        	 window.location.href = "orderConfirmation.jsp";
        	
        	

        });

        
        $(this).find("input, button").prop("disabled", true);
    });
});
</script>
</body>
</html>