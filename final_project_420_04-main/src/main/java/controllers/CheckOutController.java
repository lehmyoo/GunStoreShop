package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.entities.Order;
import models.entities.Product;
import models.entities.User;
import models.managers.OrderManager;
import models.managers.ProductManager;

import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "CheckOut", value = "/checkout")
public class CheckOutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        if(session.getAttribute("user") != null && session.getAttribute("itemsInCart") != null)
        {

            /*HashMap<Integer, Integer> itemsInCart = (HashMap<Integer, Integer>)session.getAttribute("itemsInCart");

            HashMap<Product, Integer> products = new HashMap<>();

            for (Integer id : itemsInCart.keySet()) {
                products.put(ProductManager.getById(id), itemsInCart.get(id));
            }

            Order order = OrderManager.newOrder(((User)session.getAttribute("user")).getId(), products);*/

            session.removeAttribute("itemsInCart");
            session.removeAttribute("itemsToDisplay");
            request.getRequestDispatcher("WEB-INF/checkout.jsp").forward(request, response);

        } else {

            request.setAttribute("checkoutError", "You need to log / create / add items to cart");
            request.getRequestDispatcher("WEB-INF/cart.jsp").forward(request, response);

        }
    }
}
