package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.entities.Product;
import models.managers.ProductManager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 1st Integer is the id of the product
        // 2nd Integer is the quantity of the product
        HashMap<Integer, Integer> itemsInCart = new HashMap<>();

        if (session.getAttribute("itemsInCart") != null) {
            itemsInCart = (HashMap<Integer, Integer>) session.getAttribute("itemsInCart");
        }

        // check if key already exists then simply sum up the values by adding a 1
        // if key does not exist then add it and give it value 1
        itemsInCart.merge(Integer.parseInt(request.getParameter("addedItem")), 1, Integer::sum);

        session.setAttribute("itemsInCart", itemsInCart);

        HashMap<Product, Integer> products = new HashMap<>();

        for (Integer id : itemsInCart.keySet()) {
            products.put(ProductManager.getById(id), itemsInCart.get(id));
        }


        session.setAttribute("itemsToDisplay", products);


        request.getRequestDispatcher("WEB-INF/cart.jsp").forward(request, response);
    }
}
