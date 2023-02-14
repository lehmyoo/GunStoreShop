package services;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnection {

    //region singleton
    private static DBConnection instance;

    private DBConnection() {
    }

    public static DBConnection getInstance() {
        if (instance == null)
            instance = new DBConnection();
        return instance;
    }
    //endregion

    private Connection connection = null;

    public PreparedStatement preparedQuery(String query) {
        PreparedStatement ps = null;

        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project_420_db", "root", "");
                ps = connection.prepareStatement(query);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return ps;
    }
    public PreparedStatement preparedQueryWithGeneratedKeys(String query, int returnGeneratedKeys) {
        PreparedStatement ps = null;

        try {
            if (connection == null || connection.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/final_project_420_db", "root", "");
                ps = connection.prepareStatement(query, returnGeneratedKeys);
            }

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return ps;
    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}