package com.example.khadka.ui1.Misc;

/**
 * Created by Khadka on 04-03-2018.
 */

public class Travell {

    private String Name;
    private String Address;
    private String Contact;
    private String Email;
    private String Image;

    public Travell() {}

    public Travell(String name, String address, String contact, String email, String image) {
        Name = name;
        Address = address;
        Contact = contact;
        Email = email;
        Image = image;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public String getContact() {
        return Contact;
    }

    public void setContact(String contact) {
        Contact = contact;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String image) {
        Image = image;
    }
}