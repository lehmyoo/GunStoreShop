package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.actions.ProductAction;
import models.managers.ProductManager;

import java.io.IOException;

@WebServlet(name = "ProductsController", value = "/products")
public class ProductsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if(request.getParameter("id") != null)
        {
            request.setAttribute("product", ProductManager.getById(Integer.valueOf(request.getParameter("id"))));
            request.getRequestDispatcher("WEB-INF/products/show.jsp").forward(request, response);
        }

        String category = request.getParameter("category");

        if (request.getParameter("search") != null)
        {

            request.setAttribute("category", "result");
            request.setAttribute("products", ProductManager.getByName(request.getParameter("search")));

        } else if (category != null)
        {

            request.setAttribute("category", category);
            request.setAttribute("products", ProductManager.getByCategory(category));

        } else
        {

            request.setAttribute("category", "all");
            request.setAttribute("products", ProductManager.getAll());

        }

        request.getRequestDispatcher("WEB-INF/products/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    
}
