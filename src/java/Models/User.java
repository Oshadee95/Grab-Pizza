/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.Date;

/**
 *
 *
 */
public class User {

    private int id;
    private String email;
    private String role;
    private String first_name;
    private String last_name;
    private String avatar;
    private String gender;
    private String address;
    private String contact;
    private Date registered_on;
    private String password;

    public User() {
    }

    public User(String email, String role, String first_name, String last_name, String avatar, String gender, String address, String contact, String password) {
        this.email = email;
        this.role = role;
        this.first_name = first_name;
        this.last_name = last_name;
        this.avatar = avatar;
        this.gender = gender;
        this.address = address;
        this.contact = contact;
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getFirstName() {
        return first_name;
    }

    public void setFirstName(String first_name) {
        this.first_name = first_name;
    }

    public String getLastName() {
        return last_name;
    }

    public void setLastName(String last_name) {
        this.last_name = last_name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public Date getRegisteredOn() {
        return registered_on;
    }

    public void setRegisteredOn(Date registeredOn) {
        this.registered_on = registeredOn;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
