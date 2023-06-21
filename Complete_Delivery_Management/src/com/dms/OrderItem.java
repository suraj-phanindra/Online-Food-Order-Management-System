package com.dms;

public class OrderItem {
    private int orderItemId;
    private int orderId;
    private MenuItem menuItem;
    private int quantity;

    public OrderItem(int orderItemId, int orderId, MenuItem menuItem, int quantity) {
        this.orderItemId = orderItemId;
        this.orderId = orderId;
        this.menuItem = menuItem;
        this.quantity = quantity;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public MenuItem getMenuItem() {
        return menuItem;
    }

    public void setMenuItem(MenuItem menuItem) {
        this.menuItem = menuItem;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public double getPrice() {
    	return menuItem.getPrice()*quantity;
    }
}
