package com.example.khadka.ui1.AccountActivity;
/**
 * Created by Khadka on 06-04-2018.
 */
import android.app.ProgressDialog;
import android.content.Intent;
import android.provider.ContactsContract;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.util.Patterns;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import com.example.khadka.ui1.Pages.AddTravelGuide;
import com.example.khadka.ui1.Pages.Home_Activity;
import com.example.khadka.ui1.Pages.Travel_Guide;
import com.example.khadka.ui1.R;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.OnFailureListener;
import com.google.android.gms.tasks.OnSuccessListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class Register_Activity extends AppCompatActivity implements View.OnClickListener {

    private EditText mEmailField, mPasswordField;
    private Button mRegisterBtn, mLoginButton;
    private FirebaseAuth mAuth;
    private DatabaseReference mUserDatabase;
    private ProgressDialog progressDialog;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register_);

        mEmailField = (EditText) findViewById(R.id.etEmail);
        mPasswordField = (EditText) findViewById(R.id.etPassword);
        mRegisterBtn = (Button) findViewById(R.id.ButtonRegister);
        mLoginButton = (Button) findViewById(R.id.loginButton);


        //Get Firebase auth instance
        mAuth = FirebaseAuth.getInstance();
        mUserDatabase = FirebaseDatabase.getInstance().getReference("Users");
        if (mAuth.getCurrentUser() != null) {
            startActivity(new Intent(Register_Activity.this, Home_Activity.class));
            finish();
        }




        progressDialog = new ProgressDialog(this);
        mRegisterBtn.setOnClickListener(this);
        mLoginButton.setOnClickListener(this);




    }

    @Override
    public void onClick(View v) {

        switch (v.getId())
        {
            case R.id.ButtonRegister:
                registerUser();
                break;
            case R.id.loginButton:
                startActivity( new Intent(this, Login_Activity.class));
                break;
        }


    }

        private void registerUser() {

            final String email = mEmailField.getText().toString().trim();
            String password = mPasswordField.getText().toString().trim();

            if (email.isEmpty()) {
                mEmailField.setError("Email is Required");
                mEmailField.requestFocus();
                return;
            }
            if (email.length() > 25 || !Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
                mEmailField.setError("Please Enter valid email Address");
            }
            if (TextUtils.isEmpty(password)) {
                Toast.makeText(getApplicationContext(), "Enter password!", Toast.LENGTH_SHORT).show();
                return;
            }

            if (password.isEmpty()) {
                mPasswordField.setError("Email is Required");
                mPasswordField.requestFocus();
                return;
            }
            if (password.length() < 6) {
                mPasswordField.setError("Minimum length of password should be 6");
                mPasswordField.requestFocus();
                return;
            }
            progressDialog.setMessage("Registering ....");
            progressDialog.show();

            mAuth.createUserWithEmailAndPassword(email, password)
                    .addOnSuccessListener(new OnSuccessListener<AuthResult>() {
                        @Override
                        public void onSuccess(AuthResult authResult) {
                            User user = new User();
                            user.setUserName("");
                            user.setUserEmail(email);
                            user.setUserAddress("");
                            user.setUserNumber("");
                            user.setUserStatus("");
                            user.setUserImage("");
                            progressDialog.dismiss();

                            mUserDatabase.child(FirebaseAuth.getInstance().getCurrentUser().getUid())
                                    .setValue(user)
                                    .addOnSuccessListener(new OnSuccessListener<Void>() {
                                        @Override
                                        public void onSuccess(Void aVoid) {
                                            Toast.makeText(Register_Activity.this, "Username Registerd", Toast.LENGTH_SHORT).show();
                                            startActivity(new Intent(Register_Activity.this, Login_Activity.class));
                                        }


                                    }).addOnFailureListener(new OnFailureListener() {
                                @Override
                                public void onFailure(@NonNull Exception e) {
                                    Toast.makeText(Register_Activity.this, "Registration failed" + e.getMessage(), Toast.LENGTH_SHORT).show();

                                }
                            });
                        }
                    });


    }

}

