<%@ page import="java.util.*,dao.ProductDAO,dto.ProductDTO,utility.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    HttpSession sess = request.getSession();

    // Cart stored as Map<productId, quantity>
    Map<Integer, Integer> cart = (Map<Integer, Integer>) sess.getAttribute("cart");
    if(cart == null){
        cart = new LinkedHashMap<>();
        sess.setAttribute("cart", cart);
    }

    // Saved for Later stored as Set<productId>
    Set<Integer> saved = (Set<Integer>) sess.getAttribute("saved");
    if(saved == null){
        saved = new LinkedHashSet<>();
        sess.setAttribute("saved", saved);
    }

    ProductDAO dao = new ProductDAO(DBConnection.getConnection());
    List<ProductDTO> products = dao.getAllProducts();

    String action = request.getParameter("action");
    if(action != null){
        int id = Integer.parseInt(request.getParameter("id"));

        if("add".equals(action)){
            cart.put(id, cart.getOrDefault(id, 0) + 1);
            out.print("Added!");
            return;
        }
        else if("minus".equals(action)){
            if(cart.containsKey(id)){
                int qty = cart.get(id);
                if(qty > 1) cart.put(id, qty - 1);
                else cart.remove(id);
            }
            out.print("Reduced!");
            return;
        }
        else if("delete".equals(action)){
            cart.remove(id);
            out.print("Deleted!");
            return;
        }
        else if("save".equals(action)){
            if(cart.containsKey(id)){
                cart.remove(id);
                saved.add(id);
            }
            out.print("Saved for later!");
            return;
        }
        else if("moveCart".equals(action)){
            if(saved.contains(id)){
                saved.remove(id);
                cart.put(id, 1);
            }
            out.print("Moved to cart!");
            return;
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Your Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body { 
            background: #4B2E2B; /* Dusky Whiskey */
            color: #F5EBDD;
        }
        .cart-container { max-width: 1000px; margin: 40px auto; }
        .cart-item, .saved-item { 
            background: #6E4A41; 
            border-radius: 8px; 
            padding: 15px; 
            margin-bottom: 15px; 
            box-shadow: 0 2px 6px rgba(0,0,0,0.2); 
            color: #F5EBDD;
        }
        .cart-item img, .saved-item img { width: 120px; height: 120px; object-fit: contain; }
        .cart-item-title { font-size: 1.2rem; font-weight: bold; }
        .cart-item-price { font-size: 1.1rem; color: #FFD700; font-weight: bold; }
        .summary-box { background: #6E4A41; border-radius: 8px; padding: 20px; box-shadow: 0 2px 6px rgba(0,0,0,0.2); position: sticky; top: 20px; }
        .checkout-btn { background: #FFD700; border: 1px solid #FCD200; font-weight: bold; color: #4B2E2B; }
        .checkout-btn:hover { background: #FFC300; }
        .save-btn, .move-btn { background: #A67C52; color: #fff; border: none; padding: 5px 10px; border-radius: 5px; }
        .save-btn:hover, .move-btn:hover { background: #D4A373; color: #000; }
    </style>
</head>
<body>

<div class="container cart-container">
    <div class="row">
        <!-- Cart Items -->
        <div class="col-md-8">
            <h4>Your Shopping Cart</h4>
            <div id="cart-list">
            <%
                double total = 0;
                int totalItems = 0;
                for(Map.Entry<Integer, Integer> entry : cart.entrySet()){
                    int pid = entry.getKey();
                    int qty = entry.getValue();

                    ProductDTO product = null;
                    for(ProductDTO p : products){
                        if(p.getId() == pid){ product = p; break; }
                    }
                    if(product == null) continue;

                    total += product.getPrice() * qty;
                    totalItems += qty;
            %>
            <div class="cart-item row" data-id="<%=product.getId()%>">
                <div class="col-md-3 text-center">
                    <img src="<%=product.getImageUrl()%>" alt="<%=product.getName()%>">
                </div>
                <div class="col-md-9">
                    <div class="cart-item-title"><%=product.getName()%></div>
                    <div><%=product.getDescription()%></div>
                    <div class="cart-item-price">₹ <%=product.getPrice()%> x <%=qty%> = ₹ <%=product.getPrice() * qty%></div>
                    <div class="mt-2">
                        <button class="btn btn-sm btn-outline-light minus-btn">−</button>
                        <span class="mx-2"><%=qty%></span>
                        <button class="btn btn-sm btn-outline-light add-btn">+</button>
                    </div>
                    <div class="mt-2">
                        <button class="save-btn" style="margin-right:10px;">Save for Later</button>
                        <button class="btn btn-link text-danger p-0 delete-btn">Delete</button>
                    </div>
                </div>
            </div>
            <% } %>
            </div>

            <!-- Saved for Later Section -->
            <%
                if(!saved.isEmpty()){
            %>
            <h4 class="mt-4">Saved for Later</h4>
            <div id="saved-list">
                <%
                    for(int pid : saved){
                        ProductDTO product = null;
                        for(ProductDTO p : products){
                            if(p.getId() == pid){ product = p; break; }
                        }
                        if(product == null) continue;
                %>
                <div class="saved-item row" data-id="<%=product.getId()%>">
                    <div class="col-md-3 text-center">
                        <img src="<%=product.getImageUrl()%>" alt="<%=product.getName()%>">
                    </div>
                    <div class="col-md-9">
                        <div class="cart-item-title"><%=product.getName()%></div>
                        <div><%=product.getDescription()%></div>
                        <div class="cart-item-price">₹ <%=product.getPrice()%></div>
                        <div class="mt-2">
                            <button class="move-btn">Move to Cart</button>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <% } %>

        </div>

        <!-- Summary -->
        <div class="col-md-4">
            <div class="summary-box">
                <h5>Subtotal (<%=totalItems%> items): 
                    <span class="text-warning">₹ <%=total%></span>
                </h5>
               <a href="payment.jsp?amount=<%= total %>" class="btn checkout-btn w-100 mt-3">Proceed to Buy</a>

            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){
    $(".add-btn").click(function(){
        var id = $(this).closest(".cart-item").data("id");
        $.post("cart.jsp", { action:"add", id:id }, function(){
            location.reload();
        });
    });

    $(".minus-btn").click(function(){
        var id = $(this).closest(".cart-item").data("id");
        $.post("cart.jsp", { action:"minus", id:id }, function(){
            location.reload();
        });
    });

    $(".delete-btn").click(function(){
        var id = $(this).closest(".cart-item").data("id");
        $.post("cart.jsp", { action:"delete", id:id }, function(){
            location.reload();
        });
    });

    $(".save-btn").click(function(){
        var id = $(this).closest(".cart-item").data("id");
        $.post("cart.jsp", { action:"save", id:id }, function(){
            location.reload();
        });
    });

    $(".move-btn").click(function(){
        var id = $(this).closest(".saved-item").data("id");
        $.post("cart.jsp", { action:"moveCart", id:id }, function(){
            location.reload();
        });
    });
});
</script>

</body>
</html>
