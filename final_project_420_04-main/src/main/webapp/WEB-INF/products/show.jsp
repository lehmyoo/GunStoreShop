<%--<%@ taglib prefix="c" uri="jakarta.tags.core" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>--%>


<%@ page import="models.actions.ProductAction" %>
<%@ page import="models.entities.Product" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%

  Product product = (Product) request.getAttribute("product");

%>

<jsp:include page="../layouts/head.jsp"/>

<main id="product-single-page">
  <div class="wrapper">

    <div class="content">
      <%-- SIDEBAR --%>


        <div class="show-card">

          <div class="flex flex-col grow">
            <div class="image">
              <img src="${pageContext.request.contextPath}/img/weap/<%= product.getCategory() + '/' + product.getName() %>.png"
                   alt="<%= product.getName() %>"/>
            </div>
          </div>

        </div>
        <div class="show-card-info">
<%--          <div class="info">--%>
<%--            <img src="${pageContext.request.contextPath}/img/info.png" alt="info">--%>
<%--            <span>Details</span>--%>
<%--          </div>--%>
          <div class="name">
              <span><%= product.getName() %></span>
              <span><%= product.getPrice() %></span>
          </div>
          <h2><%= product.getDescription() %></h2>



          <div>

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
                      <span>Add to cart</span>
                  </button>

          </div>

        </div>

      <%-- END SIDEBAR --%>


      <%-- MAIN --%>
      <div class="main">

      </div>
      <%-- END MAIN --%>

    </div>


  </div>
</main>

<jsp:include page="../layouts/footer.jsp"/>
