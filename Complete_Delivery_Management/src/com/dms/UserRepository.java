package com.dms;

import java.sql.*;

public class UserRepository {
    private  Connection connection;

    public UserRepository(){
    	
    }
    public UserRepository(Connection connection) {
    	this.connection=connection;
    }
    	
    // Constructor
//    public UserRepository() {
//        try {
//            Class.forName("com.mysql.jdbc.Driver");
//            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    // Method to authenticate a user given a username and password
    public User authenticateUser(String username, String password) throws SQLException {
    	   try {
               Class.forName("com.mysql.jdbc.Driver");
               connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
           } catch (Exception e) {
               e.printStackTrace();
           }
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();
           
            if (resultSet.next()) {
                String email = resultSet.getString("email");
                String phoneNumber = resultSet.getString("phone_number");
                return new User(username, password, email, phoneNumber);
                
            } else {
                return null;
            }
         
            
            
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
//        finally {
//        	connection.close();
//        }
    }

    // Method to reset a user's password given their email and new password
    public boolean resetPassword(String email, String newPassword) {
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE users SET password = ? WHERE email = ?");
            statement.setString(1, newPassword);
            statement.setString(2, email);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
	public User getUserById(int id) throws SQLException {
		   try {
	            Class.forName("com.mysql.jdbc.Driver");
	            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/food_delivery_system", "root", "MySQL@411681");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM users WHERE user_id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(rs.getString("username"), rs.getString("password"), rs.getString("email"), rs.getString("phone_number"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        finally {
        	connection.close();
        }
        return null;
    }
	
    public void updateUser(com.dms.User user) {
        try {
            PreparedStatement stmt = connection.prepareStatement("UPDATE users SET  email = ?,phone_number=? WHERE username= ?");
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getPhoneNumber());
            stmt.setString(3, user.getUsername());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

