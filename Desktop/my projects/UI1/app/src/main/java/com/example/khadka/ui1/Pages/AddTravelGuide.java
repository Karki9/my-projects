package com.example.khadka.ui1.Pages;

/**
 * Created by Khadka on 06-04-2018.
 */

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.khadka.ui1.AccountActivity.Guide;
import com.example.khadka.ui1.R;
import com.example.khadka.ui1.Utils.GuideDBHelper;



public class AddTravelGuide extends AppCompatActivity {

    private EditText mNameEditText,mAgeEditText,mAddressEditText,mContactEditText,mImageEditText;
    private Button mAddBtn , cancelbtn;
    private GuideDBHelper dbHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_add_travel_guide);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        //init
        mNameEditText = (EditText)findViewById(R.id.guideName);
        mAgeEditText = (EditText)findViewById(R.id.guideAge);
        mAddressEditText = (EditText)findViewById(R.id.guideAddress);
        mContactEditText = (EditText)findViewById(R.id.guideContact);
        mImageEditText = (EditText)findViewById(R.id.guideProfileImageLink);
        mAddBtn = (Button)findViewById(R.id.addNewUserButton);
        cancelbtn = (Button)findViewById(R.id.cancelButton);

        //listen to add button click
        mAddBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                //call the save person method
                saveGuide();
            }
        });
        cancelbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

    }

    private void saveGuide(){
        String name = mNameEditText.getText().toString().trim();
        String age = mAgeEditText.getText().toString().trim();
        String address = mAddressEditText.getText().toString().trim();
        String contact = mContactEditText.getText().toString().trim();
        String image = mImageEditText.getText().toString().trim();
        dbHelper = new GuideDBHelper(this);

        if(name.isEmpty()){
            //if error name is empty
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
            Toast.makeText(this, "You must enter an Contact number", Toast.LENGTH_SHORT).show();
        }

        if(image.isEmpty()){
            //error name is empty
            Toast.makeText(this, "You must enter an image link", Toast.LENGTH_SHORT).show();
        }

        //create new person
        Guide guide = new Guide(name, age, address, contact,  image);
        dbHelper.saveNewGuide(guide);

        //finally redirect back home
        // NOTE you can implement an sqlite callback then redirect on success delete
        goBackHome();

    }

    private void goBackHome(){
        startActivity(new Intent(AddTravelGuide.this, Travel_Guide.class));
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
}
