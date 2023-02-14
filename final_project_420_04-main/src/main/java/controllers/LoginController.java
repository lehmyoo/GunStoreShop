package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.entities.User;
import models.managers.UserManager;

import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/auth/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HashMap<String, String> formData = new HashMap<>();
        formData.put("email", request.getParameter("email"));
        formData.put("password", request.getParameter("password"));

        User user = UserManager.authenticateUser(formData);

        if(user != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            request.getRequestDispatcher("WEB-INF/profile.jsp").forward(request, response);
        }

        request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);

    }
}
