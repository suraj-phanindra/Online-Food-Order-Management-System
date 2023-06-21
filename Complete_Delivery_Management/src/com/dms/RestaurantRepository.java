package com.dms;

import java.sql.*;
import java.util.*;

public class RestaurantRepository {
	private final Connection connection;

	public RestaurantRepository(Connection connection) {
		this.connection = connection;
	}

//	public List<Restaurant> searchRestaurants(String location, String cuisine) throws SQLException 
	public List<Restaurant> searchRestaurants(String location) throws SQLException {
//    	System.out.print("Hi");
		List<Restaurant> restaurants = new ArrayList<>();
//		String sql = "SELECT * FROM restaurants NATURAL JOIN restaurant_cuisines WHERE (restaurants.restaurant_id = restaurant_cuisines.restaurant_id ) AND restaurants.address LIKE ? AND restaurant_cuisines.cuisine_id IN (SELECT cuisine_id FROM cuisines WHERE name LIKE ? )";
//        String sql = "SELECT * FROM restaurants Natural Join cuisines WHERE address LIKE ? AND cuisines.name LIKE ?";
		String sql="SELECT * FROM restaurants WHERE address LIKE ?";
		try (PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, "%" + location + "%");
//			statement.setString(2, "%" + cuisine + "%");
			try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					int id = resultSet.getInt("restaurant_id");
					String name = resultSet.getString("name");
					String address = resultSet.getString("address");
					String phone = resultSet.getString("phone_number");
					double rating = resultSet.getDouble("rating");
//					String cuisineType = resultSet.getString("cuisine");
//					Restaurant restaurant = new Restaurant(id, name, address, phone, rating, cuisineType);
					Restaurant restaurant = new Restaurant(id, name, address, phone, rating);
					restaurants.add(restaurant);
				}
			}
		}
		return restaurants;
	}
	public List<Restaurant> searchRestaurantsByName(String rname) throws SQLException {
//    	System.out.print("Hi");
		List<Restaurant> restaurants = new ArrayList<>();
//		String sql = "SELECT * FROM restaurants NATURAL JOIN restaurant_cuisines WHERE (restaurants.restaurant_id = restaurant_cuisines.restaurant_id ) AND restaurants.address LIKE ? AND restaurant_cuisines.cuisine_id IN (SELECT cuisine_id FROM cuisines WHERE name LIKE ? )";
//        String sql = "SELECT * FROM restaurants Natural Join cuisines WHERE address LIKE ? AND cuisines.name LIKE ?";
		String sql="SELECT * FROM restaurants WHERE name LIKE ?";
		try (PreparedStatement statement = connection.prepareStatement(sql)) {
			statement.setString(1, "%" + rname + "%");
//			statement.setString(2, "%" + cuisine + "%");
			try (ResultSet resultSet = statement.executeQuery()) {
				while (resultSet.next()) {
					int id = resultSet.getInt("restaurant_id");
					String name = resultSet.getString("name");
					String address = resultSet.getString("address");
					String phone = resultSet.getString("phone_number");
					double rating = resultSet.getDouble("rating");
//					String cuisineType = resultSet.getString("cuisine");
//					Restaurant restaurant = new Restaurant(id, name, address, phone, rating, cuisineType);
					Restaurant restaurant = new Restaurant(id, name, address, phone, rating);
					restaurants.add(restaurant);
				}
			}
		}
		return restaurants;
	}

	public Restaurant getRestaurantById(int id) throws SQLException {
		String sql = "SELECT * FROM restaurants WHERE restaurant_id = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, id);
		ResultSet resultSet = statement.executeQuery();
		if (resultSet.next()) {
			String name = resultSet.getString("name");
			String address = resultSet.getString("address");
			String phone = resultSet.getString("phone_number");
			double rating = resultSet.getDouble("rating");
//			String cuisineType = resultSet.getString("cuisine");
			return new Restaurant(id, name, address, phone, rating);
//			return new Restaurant(id, name, address, phone, rating, cuisineType);
		}
		return null;
	}

	public List<MenuItem> getMenuItemsForRestaurant(int restaurantId) throws SQLException {
		List<MenuItem> menuItems = new ArrayList<>();
		String sql = "SELECT * FROM menu_items WHERE restaurant_id = ?";
		PreparedStatement statement = connection.prepareStatement(sql);
		statement.setInt(1, restaurantId);
		ResultSet resultSet = statement.executeQuery();
		while (resultSet.next()) {
			int id = resultSet.getInt("item_id");
			String name = resultSet.getString("name");
			String description = resultSet.getString("description");
			double price = resultSet.getDouble("price");
			MenuItem menuItem = new MenuItem(id, restaurantId, name, description, price);
			menuItems.add(menuItem);
		}
		return menuItems;
	}
}

//public List<Restaurant> searchRestaurants(String location, String cuisine) throws SQLException {
//System.out.println("1");
//List<Restaurant> restaurants = new ArrayList<>();
//String sql = "SELECT * FROM restaurants WHERE address LIKE ? AND cuisine LIKE ?";
////System.out.println("2");
//PreparedStatement statement = connection.prepareStatement(sql);
////System.out.println("3");
//statement.setString(1, "%" + location + "%");
////System.out.println("4");
//statement.setString(2, "%" + cuisine + "%");
////System.out.println("5");
//ResultSet resultSet = statement.executeQuery();
////System.out.println("6");
//while (resultSet.next()) {
////	System.out.println("7");
//    int id = resultSet.getInt("restaurant_id");
//    String name = resultSet.getString("name");
//    String address = resultSet.getString("address");
//    String phone = resultSet.getString("phone_number");
//    double rating = resultSet.getDouble("rating");
//    String cuisineType = resultSet.getString("cuisine");
////    System.out.println("8");
//    Restaurant restaurant = new Restaurant(id, name, address, phone, rating, cuisineType);
////    System.out.println("9");
//    restaurants.add(restaurant);
////    System.out.println("10");
//}
////System.out.println("11");
//return restaurants;
//}
