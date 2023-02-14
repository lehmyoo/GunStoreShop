<%@ page import="models.entities.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<% User user = (User) session.getAttribute("user"); %>

<jsp:include page="layouts/head.jsp"/>

<main id="profile-page">

    <div class="wrapper">

        <div class="top">
            <img src="${pageContext.request.contextPath}/img/hat.png" alt="cart">
            <div class="title"><%= user.getUsername()%>'s Profile Page</div>
            <div class="title"><%= user.getEmail() %></div>
        </div>



    </div>


</main>

<%--<jsp:include page="layouts/footer.jsp"/>--%>
