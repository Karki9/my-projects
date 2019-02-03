package com.example.khadka.ui1.AccountActivity;

/**
 * Created by Khadka on 08-04-2018.
 */

public class Guide {
    private long id;
    private String name;
    private String age;
    private String address;
    private String contact;
    private String image;

    public Guide() {
    }

    public Guide(String name, String age, String address, String contact, String image) {
        this.name = name;
        this.age = age;
        this.address = address;
        this.contact = contact;
        this.image = image;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}
