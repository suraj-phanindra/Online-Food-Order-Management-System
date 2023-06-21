package com.dms;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class OrderRepository {
    private Connection connection;

    public OrderRepository(Connection connection) {
        this.connection = connection;
    }

    public List<Order> getOrdersByCustomerId(int customerId) throws SQLException {
        List<Order> orders = new ArrayList<>();

        String query = "SELECT * FROM orders WHERE customer_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, customerId);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Order order = new Order(
                    rs.getInt("order_id"),
                    rs.getInt("customer_id"),
                    rs.getInt("restaurant_id"),
                    rs.getDouble("total_price"),
                    LocalDateTime.parse(rs.getString("date_time"))
                );
                orders.add(order);
            }
        }
        return orders;
    }

    public Order getOrderById(int orderId) throws SQLException {
        String query = "SELECT * FROM orders WHERE order_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, orderId);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                return new Order(
                    rs.getInt("order_id"),
                    rs.getInt("customer_id"),
                    rs.getInt("restaurant_id"),
                    rs.getDouble("total_price"),
                    LocalDateTime.parse(rs.getString("date_time"))
                );
            } else {
                return null;
            }
        }
    }

//    public void createOrder(Order order) throws SQLException {
//        String query = "INSERT INTO orders (customer_id, restaurant_id, total_price, date_time) VALUES (?, ?, ?, ?)";
//        try (PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
//            statement.setInt(1, order.getCustomerId());
//            statement.setInt(2, order.getRestaurantId());
//            statement.setDouble(3, order.getTotalPrice());
//            statement.setString(4, order.getDateTime().toString());
//            statement.executeUpdate();
//            ResultSet rs = statement.getGeneratedKeys();
//            if (rs.next()) {
//                order.setOrderId(rs.getInt(1));
//            }
//        }
//    }
    public void createOrder(Order order) throws SQLException {
        String query = "INSERT INTO orders (customer_id,order_time,order_status,restaurant_id,menu_item_id,quantity,total_price) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement statement = connection.prepareStatement(query);
        statement.setInt(1, order.getCustomerId());
//        statement.setInt(2, order.getRestaurantId());
        statement.setString(2, order.getDateTime().toString());
        statement.setString(3, "New");
        statement.setInt(4, order.getRestaurantId());
        statement.setInt(5, order.getMenuItemId());
        statement.setInt(6, order.getQuantity());
        statement.setDouble(7, order.getTotalPrice());
//        statement.setDouble(4, order.getTotalPrice());

        statement.executeUpdate();
        statement.close();
    }
    public List<Order> getOrdersByRestaurantId(int restaurantId) throws SQLException {
        String sql = "SELECT * FROM orders WHERE restaurant_id = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setInt(1, restaurantId);
        ResultSet result = statement.executeQuery();

        List<Order> orders = new ArrayList<>();
        while (result.next()) {
            int orderId = result.getInt("order_id");
            int menuItemId = result.getInt("menu_item_id");
            double totalPrice = result.getInt("total_price");
        
            orders.add(new com.dms.Order(orderId, restaurantId, menuItemId, totalPrice));
            
           
        }

        return orders;
    }
    public void updateOrder(Order order) throws SQLException {
        String query = "UPDATE orders SET customer_id = ?, restaurant_id = ?, total_price = ?, date_time = ? WHERE order_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, order.getCustomerId());
            statement.setInt(2, order.getRestaurantId());
            statement.setDouble(3, order.getTotalPrice());
            statement.setString(4, order.getDateTime().toString());
            statement.setInt(5, order.getOrderId());
            statement.executeUpdate();
        }
    }

    public void deleteOrder(int orderId) throws SQLException {
        String query = "DELETE FROM orders WHERE order_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, orderId);
            statement.executeUpdate();
        }
    }
}
