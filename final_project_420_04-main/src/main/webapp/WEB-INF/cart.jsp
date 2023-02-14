<%@ page import="models.actions.ProductAction" %>
<%@ page import="models.entities.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    /*
    HashMap<Integer, Integer> itemsInCart = (HashMap<Integer, Integer>) session.getAttribute("itemsInCart");
    if (itemsInCart == null) itemsInCart = new HashMap<>();
     */

    HashMap<Product, Integer> products = (HashMap<Product, Integer>) session.getAttribute("itemsToDisplay");
    if (products == null) products = new HashMap<>();

    int totalNumOfProducts = 0;
    for (int p : products.values()) {
        totalNumOfProducts += p;
    }

    double total = 0;
%>

<jsp:include page="layouts/head.jsp"/>

<main id="cart-page">
    <div class="wrapper">

        <div class="content">
            <%-- MAIN --%>
            <div class="main">

                <%--                    <% for (Map.Entry<Integer, Integer> item : itemsInCart.entrySet()) { %>--%>

                <%--                    <div class="temp">--%>
                <%--                        <p><%= item.getKey() %>--%>
                <%--                        </p>--%>
                <%--                        <p><%= item.getValue() %>--%>
                <%--                        </p>--%>
                <%--                    </div>--%>

                <%--                    <% } %>--%>

                <div class="top">
                    <img src="${pageContext.request.contextPath}/img/cart.png" alt="cart">
                    <div class="title">Confirm & Pay</div>
                    <div class="title"><%= totalNumOfProducts %> Items</div>
                </div>


                <div class="cards">
                    <% for (Map.Entry<Product, Integer> product : products.entrySet()) {
                        total += product.getKey().getPrice() * product.getValue(); %>

                    <div class="card">
                        <div class="image">
                            <img src="${pageContext.request.contextPath}/img/weap/<%= product.getKey().getCategory() + '/' + product.getKey().getName() %>.png"
                                 alt="<%= product.getKey().getName() %>"/>
                        </div>
                        <div class="control">

                            <div class="quantity"><%= product.getValue() %>
                            </div>

                            <form id="add-product" action="${pageContext.request.contextPath}/cart-counter"
                                  method="post">
                                <input type="hidden" name="add" value="<%= product.getKey().getId() %>">
                            </form>
                            <button form="add-product" type="submit" name="submit">
                                <img src="${pageContext.request.contextPath}/img/plus.png" alt="remove">
                            </button>

                            <form id="remove-product" action="${pageContext.request.contextPath}/cart-counter"
                                  method="post">
                                <input type="hidden" name="remove" value="<%= product.getKey().getId() %>">
                            </form>
                            <button form="remove-product" type="submit" name="submit">
                                <img src="${pageContext.request.contextPath}/img/minus.png" alt="remove">
                            </button>

                        </div>


                        <div class="info">
                            <div class="title"><%= product.getKey().getName() %>
                            </div>

                            <div class="price"><span>$</span> <%= product.getKey().getPrice() %>
                            </div>
                        </div>

                    </div>

                    <% } %>
                </div>

            </div>
            <%-- END MAIN --%>

            <div class="checkout">
                <div class="price">
                    <div class="subtotal">
                        <span>Subtotal</span>
                        <span>$<%= Math.round(total) %></span>
                    </div>
                    <div class="taxes">
                        <span>Taxes (%15):</span>
                        <span>$<%= Math.round(total * 0.15) %></span>
                    </div>
                    <div class="total">
                        <span>Total Price:</span>
                        <span>$<%= total + total * 0.15 %></span>
                    </div>
                </div>
                <form action="${pageContext.request.contextPath}/checkout" method="POST">
                    <button type="submit">Place your order</button>
                </form>
                <div style="display:flex; justify-content:center; color:firebrick">
                    <% if(request.getAttribute("checkoutError") != null) { %>
                    <%= request.getAttribute("checkoutError") %>
                    <% } %>
                </div>
            </div>
        </div>

    </div>
</main>

<jsp:include page="layouts/footer.jsp"/>
