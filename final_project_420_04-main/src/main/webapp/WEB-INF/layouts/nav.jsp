<%@ page import="models.entities.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="models.entities.User" %>

<%
    HashMap<Product, Integer> products = (HashMap<Product, Integer>) session.getAttribute("itemsToDisplay");
    if (products == null) products = new HashMap<>();

    int totalNumOfProducts = 0;
    for (int p : products.values()) {
        totalNumOfProducts += p;
    }

    User user = (User) session.getAttribute("user");
    if(user == null) user = new User();
%>

<nav class="nav">
    <div class="wrapper">
        <div class="content">
            <div class="logo">
                <a href="home">
                    <img src="${pageContext.request.contextPath}/img/logo.png" alt=""/>
                </a>
            </div>

            <div class="search">
                <form action="${pageContext.request.contextPath}/products" method="get">
                    <img src="${pageContext.request.contextPath}/img/search.png" alt="">
                    <input class="search-box" name="search" placeholder="Search for any keyword" autocomplete="off">
                </form>
            </div>


            <div class="actions">

                <div>
                    <a href="products" class="shop">
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M6 2L3 6v14c0 1.1.9 2 2 2h14a2 2 0 0 0 2-2V6l-3-4H6zM3.8 6h16.4M16 10a4 4 0 1 1-8 0"/>
                        </svg>
                        Shop
                    </a>

                    <a href="cart" class="cart">
                        <% if (products.size() > 0) { %>
                            <span class="cart-icon-items"><%= totalNumOfProducts %></span>
                        <% } %>
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="10" cy="20.5" r="1"/>
                            <circle cx="18" cy="20.5" r="1"/>
                            <path d="M2.5 2.5h3l2.7 12.4a2 2 0 0 0 2 1.6h7.7a2 2 0 0 0 2-1.6l1.6-8.4H7.1"/>
                        </svg>
                        cart
                    </a>
                </div>

                <% if(user.getEmail() == null) { %>

                    <a href="login" class="avatar">
                        <%--                    <img src="${pageContext.request.contextPath}/img/user.png" alt="" />--%>
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M5.52 19c.64-2.2 1.84-3 3.22-3h6.52c1.38 0 2.58.8 3.22 3"/>
                            <circle cx="12" cy="10" r="3"/>
                            <circle cx="12" cy="12" r="10"/>
                        </svg>
                        Sign in
                    </a>

                <% } else { %>

                    <a href="profile" class="avatar">
                        <%--                    <img src="${pageContext.request.contextPath}/img/user.png" alt="" />--%>
                        <svg xmlns="http://www.w3.org/2000/svg" width="22" height="22" viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M5.52 19c.64-2.2 1.84-3 3.22-3h6.52c1.38 0 2.58.8 3.22 3"/>
                            <circle cx="12" cy="10" r="3"/>
                            <circle cx="12" cy="12" r="10"/>
                        </svg>
                        <%= user.getUsername() %>
                        <div class="logout">
                            <form action="${pageContext.request.contextPath}/logout" method="post">
                                <button type="submit">Logout</button>
                            </form>
                        </div>
                    </a>

                <% } %>
            </div>
        </div>
    </div>
</nav>