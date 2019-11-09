package Models;

import java.sql.Time;

public class Booking {

    private int id;
    private String order_details;
    private String order_status;
    private Double order_cost;
    private String addtional_info;
    private String booked_on;
    private String booked_by;
    private String confirmed_by;
    private String delivery_address;
    private String delivered_by;
    private Time time;

    public Booking() {
    }

    public Booking(String order_details, String order_status, Double order_cost, Time delivery_time, String addtional_info, String booked_by, String delivery_address) {
        this.order_details = order_details;
        this.order_status = order_status;
        this.order_cost = order_cost;
        this.time = delivery_time;
        this.addtional_info = addtional_info;
        this.booked_by = booked_by;
        this.delivery_address = delivery_address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrder_details() {
        return order_details;
    }

    public void setOrder_details(String order_details) {
        this.order_details = order_details;
    }

    public String getOrderStatus() {
        return order_status;
    }

    public void setOrderStatus(String order_status) {
        this.order_status = order_status;
    }

    public Double getOrderCost() {
        return order_cost;
    }

    public void setOrderCost(Double order_cost) {
        this.order_cost = order_cost;
    }

    public String getAddtionalInfo() {
        return addtional_info;
    }

    public void setAddtionalInfo(String addtional_info) {
        this.addtional_info = addtional_info;
    }

    public String getBookedOn() {
        return booked_on;
    }

    public void setBookedOn(String booked_on) {
        this.booked_on = booked_on;
    }

    public String getBookedBy() {
        return booked_by;
    }

    public void setBookedBy(String booked_by) {
        this.booked_by = booked_by;
    }

    public String getConfirmedBy() {
        return confirmed_by;
    }

    public void setConfirmedBy(String confirmed_by) {
        this.confirmed_by = confirmed_by;
    }

    public String getDeliveryAddress() {
        return delivery_address;
    }

    public void setDeliveryAddress(String delivery_address) {
        this.delivery_address = delivery_address;
    }

    public String getDeliveredBy() {
        return delivered_by;
    }

    public void setDeliveredBy(String delivered_by) {
        this.delivered_by = delivered_by;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

}
