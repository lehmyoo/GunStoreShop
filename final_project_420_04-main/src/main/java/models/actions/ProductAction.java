package models.actions;

import jakarta.servlet.http.HttpServletRequest;
import models.managers.ProductManager;

public class ProductAction {
    public static final String PRODUCTS_PARAM = "products";

    public static void getAll(HttpServletRequest request){
        request.setAttribute(PRODUCTS_PARAM, ProductManager.getAll());
    }

    public static void getByCategory(HttpServletRequest request, String category){
        request.setAttribute(PRODUCTS_PARAM, ProductManager.getByCategory(category));
    }
}
