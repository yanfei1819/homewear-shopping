package org.shopping.web.dto;

import org.shopping.entity.User;

public class UserDTO {
    private String userId;

    private String name;

    private String age;

    private String role;

    private String password;

    private String mobile;

    private String address;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User toUser(){
        User u = new User();
        u.setName(this.name);
        try {
            u.setAge(Integer.parseInt(this.age));
        } catch (NumberFormatException e) {
        }
        u.setMobile(this.mobile);
        u.setPassword(this.password);
        u.setRole(this.role);
        try {
            u.setUserId(Integer.parseInt(this.userId));
        } catch (NumberFormatException e) {
        }
        return u;
    }
}
