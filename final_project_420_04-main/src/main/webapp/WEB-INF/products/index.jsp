<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>


<%@ page import="models.actions.ProductAction" %>
<%@ page import="models.entities.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%

    String[][] categories = {
            {"All Products", "all products"},
            {"Melee", "melee"},
            {"Automatic Rifles", "rifles"},
            {"Submachine Guns", "smgs"},
            {"Light Machine Guns", "lmgs"},
            {"Sniper Rifles", "snipers"},
            {"Shotguns", "shotguns"},
            {"Pistols", "pistols"},
            {"Grenades", "grenades"},
            {"Rocket Launchers", "launchers"},
            {"Ammunition", "ammunition"},
    };

    // This is the categories to send to the controller as a category parameter
    //request.setAttribute("categories", categories);

    // This is the category that comes from controller
    String category = (String) request.getAttribute("category");

    ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products");
    if (products == null) products = new ArrayList<>();


%>

<jsp:include page="../layouts/head.jsp"/>

<main id="products-page">
    <div class="wrapper">

        <div class="content">
            <%-- SIDEBAR --%>
            <div class="panel">
                <div class="title">Explore</div>
                <div class="links">

<%--                    <a href="products">--%>
<%--                        <img src="${pageContext.request.contextPath}/img/all.png" alt="all products">--%>
<%--                        New In--%>
<%--                    </a>--%>


                    <%--                    <c:forEach var="category" items="${categories}">--%>
                    <%--&lt;%&ndash;                        <form action="${pageContext.request.contextPath}/products" method="get">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                            <input name="category" value="${category[1]}" type="hidden">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                            <button type="submit">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                                <img src="${pageContext.request.contextPath}/img/${category[1]}.png"&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                                     alt="${category[0]}">&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                                    ${category[0]}&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                            </button>&ndash;%&gt;--%>
                    <%--&lt;%&ndash;                        </form>&ndash;%&gt;--%>
                    <%--                        <p>${category}</p>--%>
                    <%--                    </c:forEach>--%>


                    <% for (String[] element : categories) { %>
                    <% if (element[0].equalsIgnoreCase("all products")) { %>
                    <a href="products">
                        <img src="${pageContext.request.contextPath}/img/all.png" alt="all products">
                        All Products
                    </a>
                    <% } else {%>
                    <form action="${pageContext.request.contextPath}/products" method="get">
                        <input name="category" value="<%= element[1] %>" type="hidden">
                        <button type="submit">
                            <img src="${pageContext.request.contextPath}/img/<%= element[1] %>.png"
                                 alt="<%= element[0] %>">
                            <%= element[0] %>
                        </button>
                    </form>
                    <% } %>
                    <% } %>

                </div>

            </div>
            <%-- END SIDEBAR --%>


            <%-- MAIN --%>
            <div class="main">
                <div class="filters">
                    <div class="title">
                        <img src="${pageContext.request.contextPath}/img/<%= category %>.png" alt="">
                        <%= category.substring(0, 1).toUpperCase() + category.substring(1) %>
                    </div>
                    <div class="control">

                    </div>
                </div>
                <div class="card-list">

                    <% if (category.equalsIgnoreCase("new in")) { %>

                    <% } else { %>

                    <% for (Product product : products) { %>

                    <div class="card">
                        <div class="flex flex-col grow">
                            <div class="image">
                                <img src="${pageContext.request.contextPath}/img/weap/<%= product.getCategory() + '/' + product.getName() %>.png"
                                     alt="<%= product.getName() %>"/>
                            </div>

                            <div class="content">
                                <a href="${pageContext.request.contextPath}/products?id=<%= product.getId() %>"><%= product.getName() %>
                                </a>
                                <form id="add-item-form-<%= product.getId() %>" action="${pageContext.request.contextPath}/cart" method="post">
                                    <input name="addedItem" value="<%= product.getId() %>" type="hidden">
                                </form>
                                <button form="add-item-form-<%= product.getId() %>" class="icon-button" type="submit">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24"
                                         fill="none" stroke="currentColor" stroke-width="1.5" stroke-linecap="round"
                                         stroke-linejoin="round">
                                        <line x1="12" y1="5" x2="12" y2="19"></line>
                                        <line x1="5" y1="12" x2="19" y2="12"></line>
                                    </svg>
                                </button>

                            </div>
                        </div>

                        <div class="footer">
                            <%= product.getPrice() %>
                        </div>

                    </div>

                    <% } %>


                    <% } %>


                </div>
            </div>
            <%-- END MAIN --%>
        </div>


    </div>
</main>

<jsp:include page="../layouts/footer.jsp"/>
