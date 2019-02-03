package com.example.khadka.ui1.Pages;
/**
 * Created by Khadka on 14-03-2018.
 */
import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.provider.MediaStore;
import android.support.annotation.NonNull;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Patterns;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.khadka.ui1.R;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.storage.FirebaseStorage;
import com.google.firebase.storage.StorageReference;
import com.google.firebase.storage.UploadTask;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import butterknife.BindView;
import butterknife.ButterKnife;

public class EditProfile extends AppCompatActivity {
    @BindView(R.id.usernameChange)
    EditText UsernameChange;
    @BindView(R.id.numberChange)
    EditText NumberChange;
    @BindView(R.id.messageChange)
    EditText MessageChange;
    @BindView(R.id.changeImage)
    ImageView ImageChange;
    @BindView(R.id.Address_change)
    EditText addressChange;
    @BindView(R.id.buttonBack)
    Button mBack;
    @BindView(R.id.buttonSave)
    Button mSave;
    private String userId;
    private String username;
    private String userNumber;
    private String userStatus;
    private String userAddress;
    private FirebaseAuth mAuth;
    private DatabaseReference mUserDatabase;
    private Uri resultUri;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_edit_profile);
        ButterKnife.bind(this);

        ImageChange = (ImageView) findViewById(R.id.changeImage);
        UsernameChange = (EditText)findViewById(R.id.usernameChange);
        NumberChange = (EditText)findViewById(R.id.numberChange);
        MessageChange = (EditText)findViewById(R.id.messageChange);
        addressChange = (EditText)findViewById(R.id.Address_change);
        mBack =(Button) findViewById(R.id.buttonBack);
        mSave = (Button)findViewById(R.id.buttonSave);

        mAuth = FirebaseAuth.getInstance();
        userId = mAuth.getCurrentUser().getUid();
        mUserDatabase = FirebaseDatabase.getInstance().getReference().child("Users").child(userId);
        getUserInfo();

        ImageChange.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_PICK);
                intent.setType("image/*");
                startActivityForResult(intent,1);
                AlertDialog.Builder builder = new AlertDialog.Builder(EditProfile.this);
                builder.setTitle("Set a Profile Photo");
                builder.setCancelable(true);
                //builder.setView(list);
                AlertDialog alert = builder.create();
                alert.show();
            }


        });

        mBack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();

            }
        });
        mSave.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                saveUserInformation();
            }
        });

    }






    private void getUserInfo(){
        mUserDatabase.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists() && dataSnapshot.getChildrenCount()>0)
                {
                    Map<String, Object> map = (Map<String, Object>) dataSnapshot.getValue();
                    if (map.get("userName") != null)
                    {
                        username = map.get("userName").toString();

                    }

                    if (map.get("userNumber") != null)
                    {
                        userNumber = map.get("userNumber").toString();

                    }

                    if (map.get("userStatus") != null)
                    {
                        userStatus = map.get("userStatus").toString();

                    }
                    if (map.get("userAddress") != null)
                    {
                        userAddress = map.get("userAddress").toString();

                    }
                }

            }

            @Override
            public void onCancelled(DatabaseError databaseError) {

            }
        });
    }

    private void saveUserInformation() {

        final ProgressDialog progressDialog = new ProgressDialog(this);
        progressDialog.setTitle("Loading Profile");
        progressDialog.setMessage("Please wait for a moment");

        username = UsernameChange.getText().toString();
        userNumber = NumberChange.getText().toString();
        userStatus = MessageChange.getText().toString();
        userAddress = addressChange.getText().toString();

        if (TextUtils.isEmpty(username)) {
            Toast.makeText(getApplicationContext(), "please enter you name", Toast.LENGTH_SHORT).show();
            return;
        }


        if (userNumber.length() > 25|| userNumber.isEmpty() || !Patterns.PHONE.matcher(userNumber).matches()) {
            NumberChange.setError("Invalid Number");
            Toast.makeText(getApplicationContext(), "Invalid Mobile Number", Toast.LENGTH_SHORT).show();

        }
        else {
            Map userInfo = new HashMap();
            userInfo.put("userName", username);
            userInfo.put("userNumber", userNumber);
            userInfo.put("userStatus", userStatus);
            userInfo.put("userAddress", userAddress);
            mUserDatabase.updateChildren(userInfo);


            if (resultUri != null) {
                StorageReference filepath = FirebaseStorage.getInstance().getReference().child("profile_images").child(userId);
                Bitmap bitmap = null;

                try {
                    bitmap = MediaStore.Images.Media.getBitmap(getApplication().getContentResolver(), resultUri);
                } catch (IOException e) {
                    e.printStackTrace();
                }

                ByteArrayOutputStream boas = new ByteArrayOutputStream();
                bitmap.compress(Bitmap.CompressFormat.JPEG, 20, boas);

                byte[] data = boas.toByteArray();
                UploadTask uploadTask = filepath.putBytes(data);

                uploadTask.addOnFailureListener(new OnFailureListener() {
                    @Override
                    public void onFailure(@NonNull Exception e) {
                        finish();
                        return;
                    }
                });
                uploadTask.addOnSuccessListener(new OnSuccessListener<UploadTask.TaskSnapshot>() {
                    @Override
                    public void onSuccess(UploadTask.TaskSnapshot taskSnapshot) {
                        Uri downloadUri = taskSnapshot.getDownloadUrl();
                        Map newImage = new HashMap();
                        newImage.put("profileImageUrl", downloadUri.toString());
                        mUserDatabase.updateChildren(newImage);
                        progressDialog.dismiss();
                        Intent intent = new Intent(EditProfile.this, Profile.class);
                        startActivity(intent);
                        return;
                    }
                });

            } else {
                finish();
            }
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == 1 && resultCode == Activity.RESULT_OK){
            final Uri imageUri = data.getData();
            resultUri = imageUri;
            ImageChange.setImageURI(resultUri);
        }
    }

    }

