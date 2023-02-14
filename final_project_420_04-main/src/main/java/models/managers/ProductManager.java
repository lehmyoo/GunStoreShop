package models.managers;

import models.entities.Product;
import services.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class ProductManager {

    public static ArrayList<Product> getAll() {

        ArrayList<Product> products = new ArrayList<>();

        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery("SELECT * FROM products")) {

            populateProducts(products, preparedStatement);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }

        return products;
    }

    public static Product getById(Integer id) {

        Product product = null;

        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery("SELECT * FROM products WHERE id = ?")) {

            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()){
                String category = resultSet.getString("category");
                String name = resultSet.getString("name");
                String description = resultSet.getString("description");
                String origin = resultSet.getString("origin");
                float price = resultSet.getFloat("price");

                product = new Product(id, name, category, description, origin, price);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }

        return product;
    }

    public static ArrayList<Product> getByCategory(String category) {

        ArrayList<Product> products = new ArrayList<>();

        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery("SELECT * FROM products WHERE LOWER(category) = ?")) {

            preparedStatement.setString(1, category.toLowerCase());

            populateProducts(products, preparedStatement);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }

        return products;
    }

    public static ArrayList<Product> getByName(String name) {

        ArrayList<Product> products = new ArrayList<>();

        try (PreparedStatement preparedStatement = DBConnection.getInstance().preparedQuery("SELECT * FROM products WHERE LOWER(name) LIKE ?")) {

            preparedStatement.setString(1, "%" + name.toLowerCase() + "%");

            populateProducts(products, preparedStatement);

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }

        return products;
    }

    private static void populateProducts(ArrayList<Product> products, PreparedStatement preparedStatement) throws SQLException {

        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()){
            int id = resultSet.getInt("id");
            String category = resultSet.getString("category");
            String name = resultSet.getString("name");
            String description = resultSet.getString("description");
            String origin = resultSet.getString("origin");
            float price = resultSet.getFloat("price");

            products.add(new Product(id, name, category, description, origin, price));
        }
    }
}


