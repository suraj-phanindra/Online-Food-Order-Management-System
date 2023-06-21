package com.dms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MenuItemRepository {
    private Connection connection;

    public MenuItemRepository(Connection connection) {
        this.connection = connection;
    }

    public List<MenuItem> getMenuItemsByRestaurantId(int restaurantId) throws SQLException {
        List<MenuItem> menuItems = new ArrayList<>();

        String query = "SELECT * FROM menu_items WHERE restaurant_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, restaurantId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                MenuItem menuItem = new MenuItem(
                    rs.getInt("item_id"),
                    rs.getInt("restaurant_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price")
                );
                menuItems.add(menuItem);
            }
        }
        return menuItems;
    }

    public MenuItem getMenuItemById(int menuItemId) throws SQLException {
        String query = "SELECT * FROM menu_items WHERE item_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, menuItemId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new MenuItem(
                    rs.getInt("item_id"),
                    rs.getInt("restaurant_id"),
                    rs.getString("name"),
                    rs.getString("description"),
                    rs.getDouble("price")
                );
            } else {
                return null;
            }
        }
    }

    public void createMenuItem(MenuItem menuItem) throws SQLException {
        String query = "INSERT INTO menu_items (restaurant_id, name, description, price) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, menuItem.getRestaurantId());
            statement.setString(2, menuItem.getName());
            statement.setString(3, menuItem.getDescription());
            statement.setDouble(4, menuItem.getPrice());
            statement.executeUpdate();
        }
    }

    public void updateMenuItem(MenuItem menuItem) throws SQLException {
        String query = "UPDATE menu_items SET restaurant_id = ?, name = ?, description = ?, price = ? WHERE item_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, menuItem.getRestaurantId());
            statement.setString(2, menuItem.getName());
            statement.setString(3, menuItem.getDescription());
            statement.setDouble(4, menuItem.getPrice());
            statement.setInt(5, menuItem.getItemId());
            statement.executeUpdate();
        }
    }

    public void deleteMenuItem(int menuItemId) throws SQLException {
        String query = "DELETE FROM menu_items WHERE item_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, menuItemId);
            statement.executeUpdate();
        }
    }
}


