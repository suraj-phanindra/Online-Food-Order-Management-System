package com.dms;
import java.time.LocalDateTime;

public class Order {
    private int orderId;
    private int customerId;
    private int restaurantId;
    private double totalPrice;
    private int menuItemId;
    private int quantity;
    private LocalDateTime dateTime;

    public Order(int restaurantId, int menuItemId,int customerId,int quantity,double totalPrice) {
        this.restaurantId = restaurantId;
        this.menuItemId = menuItemId;
        this.customerId=customerId;
        this.quantity=quantity;
        this.totalPrice=totalPrice;
        if(this.dateTime==null) {
        this.dateTime=LocalDateTime.now();
        }
    }
    public int getMenuItemId() {
		return menuItemId;
	}
	public void setMenuItemId(int menuItemId) {
		this.menuItemId = menuItemId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Order(int customerId, int restaurantId, double totalPrice, LocalDateTime dateTime) {
        this.customerId = customerId;
        this.restaurantId = restaurantId;
        this.totalPrice = totalPrice;
        this.dateTime = dateTime;
        
    }
    Order(int orderId,int restaurantId,int menuItemId,double totalPrice){
    	this.orderId=orderId;
    	this.restaurantId=restaurantId;
    	this.menuItemId=menuItemId;
    	this.totalPrice=totalPrice;
    	if(this.dateTime==null) {
    	this.dateTime=LocalDateTime.now();
    	}
    }
    public Order(int orderId, int customerId, int restaurantId, double totalPrice, LocalDateTime dateTime) {
        this.orderId = orderId;
        this.customerId = customerId;
        this.restaurantId = restaurantId;
        this.totalPrice = totalPrice;
        this.dateTime = dateTime;
    }

    // Getter and setter methods for all the fields

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public LocalDateTime getDateTime() {
        return dateTime;
    }

    public void setDateTime(LocalDateTime dateTime) {
        this.dateTime = dateTime;
    }

    // Override the equals() and hashCode() methods

//    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
//
//        Order order = (Order) o;
//
//        if (customerId != order.customerId) return false;
//        if (restaurantId != order.restaurantId) return false;
//        if (Double.compare(order.totalPrice, totalPrice) != 0) return false;
//        if (orderId != order.orderId) return false;
//        return dateTime.equals(order.dateTime);
//    }

//    @Override
//    public int hashCode() {
//        int result;
//        long temp;
//        result = orderId;
//        result = 31 * result + customerId;
//        result = 31 * result + restaurantId;
//        temp = Double.doubleToLongBits(totalPrice);
//        result = 31 * result + (int) (temp ^ (temp >>> 32));
//        result = 31 * result + dateTime.hashCode();
//        return result;
//    }

    // Override the toString() method

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", customerId=" + customerId +
                ", restaurantId=" + restaurantId +
                ", totalPrice=" + totalPrice +
                ", dateTime=" + dateTime +
                '}';
    }
}
