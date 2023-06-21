package com.dms;

public class Customer {
    private int customerId;
    private String name;
    private String address;
    private String paymentMethod;

    public Customer(int customerId, String name, String address, String paymentMethod) {
        this.customerId = customerId;
        this.name = name;
        this.address = address;
        this.paymentMethod = paymentMethod;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
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

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}

