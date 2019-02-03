package com.example.khadka.ui1.Pages;

import android.app.ProgressDialog;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;


import com.example.khadka.ui1.AccountActivity.Destination;
import com.example.khadka.ui1.R;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.location.places.ui.PlacePicker;
import com.google.android.gms.maps.model.LatLng;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.util.HashMap;

public class PlacePickerActivity extends AppCompatActivity {

    int PLACE_PICKER_REQUEST = 1;
    TextView TvPlace;
    String userID;
    String locationName;
    double latitude;
    double longitude;
    private Button Picker_Button, ShowPlaces_Button;
    private ProgressDialog progressDialog;
    private FirebaseAuth mAuth;
    private DatabaseReference mPickerDatabase;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_place_picker);
        TvPlace = (TextView)findViewById(R.id.tvplace);
        Picker_Button =(Button)findViewById(R.id.placePicker_btn);
        ShowPlaces_Button =(Button)findViewById(R.id.list_place_btn);
        mAuth = FirebaseAuth.getInstance();
        userID = mAuth.getCurrentUser().getUid();
        mPickerDatabase = FirebaseDatabase.getInstance().getReference("Users").child(userID).child("Places");

        Picker_Button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                //create the place picker function
                PlacePicker.IntentBuilder builder= new PlacePicker.IntentBuilder();
                try{
                    startActivityForResult(builder.build(PlacePickerActivity.this), PLACE_PICKER_REQUEST);


                }catch (GooglePlayServicesRepairableException e)
                {
                    e.printStackTrace();
                } catch (GooglePlayServicesNotAvailableException e) {
                    e.printStackTrace();
                }

            }
        });

        ShowPlaces_Button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(PlacePickerActivity.this, Maps_Picker.class);
                startActivity(intent);
            }
        });

    }



    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {

        if(requestCode== PLACE_PICKER_REQUEST)
        {
            if (resultCode == RESULT_OK){

                Place place = PlacePicker.getPlace(PlacePickerActivity.this,data);
                TvPlace.setText(place.getAddress());
                String pl = place.getAddress().toString();
                LatLng placeLatLng= place.getLatLng();
                DatabaseReference placeRef = FirebaseDatabase.getInstance().getReference().child("Places");
                String placeID = placeRef.push().getKey();
                mPickerDatabase.child(placeID).setValue(true);

                HashMap map = new HashMap();
                map.put("Place Name",pl);

                map.put("Place Latitude",placeLatLng.latitude);

                map.put("Place Longitude",placeLatLng.longitude);


                placeRef.child(placeID).updateChildren(map);


            }
        }

    }
}
