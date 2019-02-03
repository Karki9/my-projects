package com.example.khadka.ui1.AccountActivity;

/**
 * Created by Khadka on 06-04-2018.
 */

public class User {

    private String UserName;
    private String UserAddress;
    private String UserNumber;
    private String UserEmail;
    private String UserStatus;
    private String UserImage;


    public User() {}

    public User(String userName, String userAddress, String userEmail, String userStatus , String userNumber ,String userImage) {
        UserName = userName;
        UserAddress = userAddress;
        UserEmail = userEmail;
        UserStatus = userStatus;
        UserNumber = userNumber;
        UserImage = userImage;
    }

    public User(String userStatus) {
        UserStatus = userStatus;
    }

    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getUserAddress() {
        return UserAddress;
    }

    public void setUserAddress(String userAddress) {
        UserAddress = userAddress;
    }

    public String getUserEmail() {
        return UserEmail;
    }

    public void setUserEmail(String userEmail) {
        UserEmail = userEmail;
    }

    public String getUserStatus() {
        return UserStatus;
    }

    public void setUserStatus(String userStatus) {
        UserStatus = userStatus;
    }

    public String getUserNumber() {
        return UserNumber;
    }

    public void setUserNumber(String userNumber) {
        UserNumber = userNumber;
    }

    public String getUserImage() {
        return UserImage;
    }

    public void setUserImage(String userImage) {
        UserImage = userImage;
    }
}
