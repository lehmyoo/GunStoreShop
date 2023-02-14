package models.managers;

import models.entities.Order;
import models.entities.Product;
import models.entities.User;
import services.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class OrderManager {

    private static float total;

    public static Order newOrder(int customerId, HashMap<Product, Integer> products) {

        Order order = null;


        products.forEach((key, value) -> {
            total += key.getPrice() * value;
        });


        try (PreparedStatement ps = DBConnection.getInstance().preparedQueryWithGeneratedKeys("INSERT INTO orders (user_id, total_price) VALUES (?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, customerId);
            ps.setFloat(2, total);

            if (ps.executeUpdate() == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }

            int rowAffected = ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int orderId = 0;

            if(rs.next())
                orderId = rs.getInt(1);

            if(rowAffected == 1) {

                products.forEach((key, value) -> {


                    try {

                        ps.executeQuery("INSERT INTO orders_products (order_id, product_id, quantity) VALUES (?, ?, ?)");
                        ps.setInt(1, customerId);
                        ps.setInt(2, key.getId());
                        ps.setInt(2, value);
                        ps.executeUpdate();

                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }

                });

            }




        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }





        return order;

    }
}
