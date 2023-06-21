package com.dms;
import java.sql.*;


public class CustomerRepository {

    private final Connection conn;

   
    public CustomerRepository(Connection conn) {
        this.conn = conn;
    }

    public Customer getCustomerById(int id) {
        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customers WHERE customer_id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
//                User user = getUserById(rs.getInt("user_id"));
                return new Customer(rs.getInt("customer_id"), rs.getString("name"), rs.getString("address"), rs.getString("payment_method"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Customer getCustomerByUserId(int userId) {
        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM customers WHERE user_id = ?");
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getInt("customer_id"), rs.getString("name"), rs.getString("address"), rs.getString("payment_method"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void createCustomer(Customer customer) {
        try {
            PreparedStatement stmt = conn.prepareStatement("INSERT INTO customers (name, address, payment_method) VALUES (?, ?, ?)");
            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getAddress());
            stmt.setString(3, customer.getPaymentMethod());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateCustomer(Customer customer) {
        try {
            PreparedStatement stmt = conn.prepareStatement("UPDATE customers SET name = ?, address = ?, payment_method = ? WHERE customer_id = ?");
            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getAddress());
            stmt.setString(3, customer.getPaymentMethod());
            stmt.setInt(4, customer.getCustomerId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

//    @SuppressWarnings("unused")
//	private User getUserById(int id) {
//        try {
//            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE user_id = ?");
//            stmt.setInt(1, id);
//            ResultSet rs = stmt.executeQuery();
//            if (rs.next()) {
//                return new User(rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("phone_number"));
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }

}
