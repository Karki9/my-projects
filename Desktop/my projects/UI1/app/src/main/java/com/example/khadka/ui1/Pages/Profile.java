package com.example.khadka.ui1.Pages;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.example.khadka.ui1.R;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.Map;

public class Profile extends AppCompatActivity{
    private ImageView EditIcon,UserImage;
    private  TextView Username, UserStatus, UserNumber, UserAddress;

    private String userId;





    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_profile);
        EditIcon = (ImageView)findViewById(R.id.edit_UserProfile);
        UserImage = (ImageView)findViewById(R.id.profileImage);
        Username =(TextView)findViewById(R.id.username);
        UserStatus = (TextView)findViewById(R.id.status);
        UserNumber = (TextView)findViewById(R.id.contact_field);
        UserAddress = (TextView)findViewById(R.id.address_field);



        userId = FirebaseAuth.getInstance().getCurrentUser().getUid();
        EditIcon.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(Profile.this, EditProfile.class));
                finish();
            }
        });

        getUserDetails();


    }

    public void getUserDetails(){
        DatabaseReference userDatabase = FirebaseDatabase.getInstance().getReference().child("Users").child(userId);
        userDatabase.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists()){
                    Map<String, Object> map = (Map<String,Object>)dataSnapshot.getValue();

                    if (map.get("userName") != null){
                        Username.setText(map.get("userName").toString());
                    }
                    if (map.get("userStatus") != null){
                        UserStatus.setText(map.get("userStatus").toString());
                    }
                    if (map.get("userNumber") != null){
                        UserNumber.setText(map.get("userNumber").toString());
                    }
                    if (map.get("userAddress") != null){
                        UserAddress.setText(map.get("userAddress").toString());
                    }
                    if (map.get("profileImageUrl")!= null){
                        Glide.with(getApplicationContext()).load(map.get("profileImageUrl")).into(UserImage);
                    }
                }
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {

            }
        });
    }

    @Override
    public boolean onKeyDown(int keyCode, KeyEvent event)
    {
        if ((keyCode == KeyEvent.KEYCODE_BACK))
        {
            finish();
        }
        return super.onKeyDown(keyCode, event);
    }

    @Override
    protected void onStart() {
        super.onStart();

    }
}
