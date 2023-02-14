package models.managers;

import models.entities.Product;
import models.entities.User;
import services.DBConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class UserManager {

    public static User authenticateUser(HashMap<String, String> formData) {

        User user = null;

        try (PreparedStatement ps = DBConnection.getInstance().preparedQuery("SELECT * FROM users WHERE email = ?")) {

            ps.setString(1, formData.get("email").toLowerCase());

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                if (rs.getString("password").equals(formData.get("password"))) {
                    user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("email"));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }

        return user;
    }

    public static User newUser(HashMap<String, String> formData) {

        User user = null;

        try (PreparedStatement ps = DBConnection.getInstance().preparedQueryWithGeneratedKeys("INSERT INTO users (username, email, password) VALUES (?, ?, ?)", Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, formData.get("username").toLowerCase());
            ps.setString(2, formData.get("email").toLowerCase());
            ps.setString(3, formData.get("password"));

            if (ps.executeUpdate() == 0) {
                throw new SQLException("Creating user failed, no rows affected.");
            }

            ResultSet rs = ps.executeQuery("SELECT * FROM users ORDER BY id DESC LIMIT 1");

            while (rs.next()) {
                user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("email"));
            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            DBConnection.getInstance().close();
        }

        return user;

    }

}
