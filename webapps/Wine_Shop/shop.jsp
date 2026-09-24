<%@ page
    import="java.util.*,dao.ProductDAO,dto.ProductDTO,utility.DBConnection,java.sql.*"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Shop</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* Body with dusky whiskey vibe */
body {
    font-family: "Segoe UI", sans-serif;
    margin: 0;
    /* Whiskey-inspired shades */
    background: linear-gradient(160deg, #3b2314 0%, #5a3825 35%, #8c5a38 70%, #2d1b14 100%);
    color: #fff;
}



/* Title */
h2 {
    text-align: center;
    padding: 20px;
    font-size: 32px;
    color: #f5c46a;
    text-shadow: 2px 2px 6px rgba(0,0,0,0.8);
    letter-spacing: 1px;
}

/* Product card container */
.product {
    display: inline-block;
    width: 240px;
    margin: 20px;
    padding: 18px;
    border-radius: 14px;
    background: rgba(30, 20, 15, 0.95);
    border: 1px solid rgba(245, 196, 106, 0.2);
    text-align: center;
    box-shadow: 0 4px 10px rgba(0,0,0,0.6);
    transition: all 0.3s ease-in-out;
    position: relative;
    overflow: hidden;
}

/* Glow hover effect */
.product:hover {
    transform: translateY(-8px) scale(1.03);
    box-shadow: 0 0 25px rgba(245, 196, 106, 0.6), 0 0 40px rgba(245, 196, 106, 0.4);
    border-color: #f5c46a;
}

/* Product image */
.product img {
    width: 180px;
    height: 180px;
    object-fit: contain;
    background: #fff;
    padding: 10px;
    border-radius: 10px;
    margin-bottom: 12px;
    transition: transform 0.3s ease-in-out;
}
.product:hover img {
    transform: scale(1.08);
}

/* Product name */
.product h3 {
    font-size: 18px;
    color: #f5c46a;
    margin: 10px 0 5px;
}

/* Description */
.product p {
    font-size: 14px;
    color: #ddd;
    margin: 5px 0;
    line-height: 1.4em;
}

/* Price */
.product p b {
    color: #ffb347;
    font-size: 17px;
    font-weight: bold;
}

/* Add to Cart button */
.btn {
    background: linear-gradient(135deg, #8c4a24, #a65b2a);
    color: #fff;
    padding: 8px 14px;
    border: none;
    cursor: pointer;
    border-radius: 6px;
    transition: all 0.3s ease-in-out;
    font-weight: bold;
}
.btn:hover {
    background: linear-gradient(135deg, #f5c46a, #a65b2a);
    color: #000;
    box-shadow: 0 0 12px rgba(245, 196, 106, 0.8);
}

/* Message text */
#msg {
    text-align: center;
    margin: 10px 0;
    color: #f5c46a;
    font-weight: bold;
    font-size: 16px;
}
</style>
</head>
<body>

    <h2>Shop - Products</h2>

    <div id="msg"></div>

    <%
    Connection con = DBConnection.getConnection();
    ProductDAO dao = new ProductDAO(con);
    List<ProductDTO> products = dao.getAllProducts();
    con.close();
    for (ProductDTO p : products) {
    %>

    <div class="product">
        <img src="<%=p.getImageUrl()%>" alt="product"><br>
        <h3><%=p.getName()%></h3>
        <p><%=p.getDescription()%></p>
        <p><b>₹ <%=p.getPrice()%></b></p>
        <a href="cart.jsp"><button class="btn addToCart" data-id="<%=p.getId()%>">Add to Cart</button></a>
    </div>
    <%
    }
    %>

    <script>
        $(document).ready(function() {
            $(".addToCart").click(function() {
                var pid = $(this).data("id");
                $.ajax({
                    url : "cart.jsp",
                    type : "POST",
                    data : {
                        action : "add",
                        id : pid
                    },
                    success : function(res) {
                        $("#msg").text(res);
                    },
                    error : function() {
                        $("#msg").text("Error adding to cart");
                    }
                });
            });
        });
    </script>

</body>
</html>
