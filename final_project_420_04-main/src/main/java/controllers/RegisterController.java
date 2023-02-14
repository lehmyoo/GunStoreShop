package controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import models.actions.ProductAction;
import models.entities.User;
import models.managers.UserManager;

import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/auth/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HashMap<String, String> formData = new HashMap<>();
        formData.put("username", request.getParameter("username"));
        formData.put("email", request.getParameter("email"));
        formData.put("password", request.getParameter("password"));

        formData.forEach((key, value) -> {
            if(formData.get(key).isEmpty()) {
                throw new IllegalArgumentException("Error! Fields are invalid");
            }
        });

        HttpSession session = request.getSession();
        User user = UserManager.newUser(formData);
        session.setAttribute("user", user);

        request.getRequestDispatcher("WEB-INF/profile.jsp").forward(request, response);


    }
}
