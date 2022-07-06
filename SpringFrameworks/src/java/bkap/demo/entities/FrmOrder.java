/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bkap.demo.entities;

/**
 *
 * @author LuongHoang
 */
public class FrmOrder {

    private int orderId;
    private String orderName;
    private String orderNumber;
    private int productId;
    private String totalAmount;
    private String productName;
    private String price;
    private int quantity;
    private String phone;
    private String email;
    private String Address;
    private String userName;
    private String phoneBuy;
    private String emailBuy;
    private String addressBuy;
    private int status;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPhoneBuy() {
        return phoneBuy;
    }

    public void setPhoneBuy(String phoneBuy) {
        this.phoneBuy = phoneBuy;
    }

    public String getEmailBuy() {
        return emailBuy;
    }

    public void setEmailBuy(String emailBuy) {
        this.emailBuy = emailBuy;
    }

    public String getAddressBuy() {
        return addressBuy;
    }

    public void setAddressBuy(String addressBuy) {
        this.addressBuy = addressBuy;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
