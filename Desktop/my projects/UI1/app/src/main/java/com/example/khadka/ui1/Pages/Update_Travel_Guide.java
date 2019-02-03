package com.example.khadka.ui1.Pages;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.khadka.ui1.AccountActivity.Guide;
import com.example.khadka.ui1.R;
import com.example.khadka.ui1.Utils.GuideDBHelper;

public class Update_Travel_Guide extends AppCompatActivity {

    private EditText mNameEditText;
    private EditText mAgeEditText;
    private EditText mAddressEditText;
    private EditText mContactEditText;
    private EditText mImageEditText;
    private Button mUpdateBtn;

    private GuideDBHelper dbHelper;
    private long receivedGuideId;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_update__travel__guide);


        //init
        mNameEditText = (EditText)findViewById(R.id.guideNameUpdate);
        mAgeEditText = (EditText)findViewById(R.id.guideAgeUpdate);
        mAddressEditText = (EditText)findViewById(R.id.guideAddressUpdate);
        mContactEditText = (EditText)findViewById(R.id.guideContactUpdate);
        mImageEditText = (EditText)findViewById(R.id.guideProfileImageLinkUpdate);
        mUpdateBtn = (Button)findViewById(R.id.updateGuideButton);

        dbHelper = new GuideDBHelper(this);

        try {
            //get intent to get person id
            receivedGuideId = getIntent().getLongExtra("USER_ID", 1);
        } catch (Exception e) {
            e.printStackTrace();
        }

        /***populate user data before update***/
        Guide queriedGuide = dbHelper.getGuide(receivedGuideId);
        //set field to this user data
        mNameEditText.setText(queriedGuide.getName());
        mAgeEditText.setText(queriedGuide.getAge());
        mAddressEditText.setText(queriedGuide.getAddress());
        mContactEditText.setText(queriedGuide.getContact());
        mImageEditText.setText(queriedGuide.getImage());



        //listen to add button click to update
        mUpdateBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //call the save person method
                updateGuide();
            }
        });





    }

    private void updateGuide(){
        String name = mNameEditText.getText().toString().trim();
        String age = mAgeEditText.getText().toString().trim();
        String address = mAddressEditText.getText().toString().trim();
        String contact = mContactEditText.getText().toString().trim();
        String image = mImageEditText.getText().toString().trim();


        if(name.isEmpty()){
            //error name is empty
            Toast.makeText(this, "You must enter a name", Toast.LENGTH_SHORT).show();
        }

        if(age.isEmpty()){
            //error name is empty
            Toast.makeText(this, "You must enter an age", Toast.LENGTH_SHORT).show();
        }

        if(address.isEmpty()){
            //error name is empty
            Toast.makeText(this, "You must enter an occupation", Toast.LENGTH_SHORT).show();
        }

        if(contact.isEmpty()){
            //error name is empty
            Toast.makeText(this, "You must enter an Contact", Toast.LENGTH_SHORT).show();
        }

        if(image.isEmpty()){
            //error name is empty
            Toast.makeText(this, "You must enter an image link", Toast.LENGTH_SHORT).show();
        }

        //create updated person
        Guide updatedPerson = new Guide(name, age, address,contact, image);

        //call dbhelper update
        dbHelper.updateGuideRecord(receivedGuideId, this, updatedPerson);

        //finally redirect back home
        // NOTE you can implement an sqlite callback then redirect on success delete
        goBackHome();

    }

    private void goBackHome(){
        startActivity(new Intent(this, MainActivity.class));
    }
}
