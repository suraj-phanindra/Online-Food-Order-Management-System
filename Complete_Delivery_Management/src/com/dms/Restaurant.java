package com.dms;
import java.util.*;
public class Restaurant {
    private int id;
    private String name;
    private String address;
    private String phoneNumber;
    private double rating;
//    private String cuisine;
    private List<MenuItem> menuItems;

//    public Restaurant(int id, String name, String address, String phoneNumber, double rating,String cuisine) 
    public Restaurant(int id, String name, String address, String phoneNumber, double rating){
        this.id = id;
        this.name = name;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.rating = rating;
//        this.cuisine=cuisine;
        this.menuItems = new ArrayList<>();
    }

//    public String getCuisine() {
//		return cuisine;
//	}
//
//	public void setCuisine(String cuisine) {
//		this.cuisine = cuisine;
//	}

	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public List<MenuItem> getMenuItems() {
        return menuItems;
    }

    public void setMenuItems(List<MenuItem> menuItems) {
        this.menuItems = menuItems;
    }

    public void addMenuItem(MenuItem menuItem) {
        this.menuItems.add(menuItem);
    }
}

