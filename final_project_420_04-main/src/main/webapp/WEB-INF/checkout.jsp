<%@ page import="models.entities.User" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    User user = (User) session.getAttribute("user");
%>

<jsp:include page="layouts/head.jsp"/>

<main id="checkout-page">
    <div class="wrapper">


        <div class="message">
            An Invoice has been sent to <%= user.getEmail() %> Please check your email for confirmation.
        </div>

    </div>
</main>

<jsp:include page="layouts/footer.jsp"/>
