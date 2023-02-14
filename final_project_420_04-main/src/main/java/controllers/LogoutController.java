package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.entities.User;
import models.managers.UserManager;

import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "LogoutController", value = "/logout")
public class LogoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();

        if(session.getAttribute("user") != null) {

            session.removeAttribute("user");
            request.getRequestDispatcher("WEB-INF/home.jsp").forward(request, response);

        }

        request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
    }
}
