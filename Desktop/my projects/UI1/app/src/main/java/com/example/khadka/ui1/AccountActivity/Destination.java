package com.example.khadka.ui1.AccountActivity;

/**
 * Created by Khadka on 25-04-2018.
 */

public class Destination {

    public String locationName;
    public double latitude;
    public double longitude;

    public Destination(String locationName, double latitude, double longtitude) {
        this.locationName = locationName;
        this.latitude = latitude;
        this.longitude = longtitude;
    }

    public String getLocationName() {
        return locationName;
    }

    public void setLocationName(String locationName) {
        locationName = locationName;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongtitude() {
        return longitude;
    }

    public void setLongtitude(double longtitude) {
        this.longitude = longtitude;
    }

    public Destination() {
    }
}
