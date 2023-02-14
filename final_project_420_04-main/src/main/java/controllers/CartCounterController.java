package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.entities.Product;
import models.managers.ProductManager;

import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "CartProductCountController", value = "/cart-counter")
public class CartCounterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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

        if(request.getParameter("add") != null) {

            itemsInCart.merge(Integer.parseInt(request.getParameter("add")), 1, Integer::sum);

        } else if (request.getParameter("remove") != null) {

            if(itemsInCart.get(Integer.parseInt(request.getParameter("remove"))) > 1) {

                itemsInCart.merge(Integer.parseInt(request.getParameter("remove")), -1, Integer::sum);

            } else {

                itemsInCart.remove(Integer.parseInt(request.getParameter("remove")));

            }


        }

        session.setAttribute("itemsInCart", itemsInCart);

        HashMap<Product, Integer> products = new HashMap<>();

        for (Integer id : itemsInCart.keySet()) {

            products.put(ProductManager.getById(id), itemsInCart.get(id));

        }

        session.setAttribute("itemsToDisplay", products);

        request.getRequestDispatcher("WEB-INF/cart.jsp").forward(request, response);
    }
}
