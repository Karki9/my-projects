package com.example.khadka.ui1.AccountActivity;
/**
 * Created by Khadka on 06-04-2018.
 */
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Patterns;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.khadka.ui1.Pages.Home_Activity;
import com.example.khadka.ui1.R;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;

public class Login_Activity extends AppCompatActivity {

    private EditText mEmailField, mPasswordField;
    private TextView mResetPassword;
    private Button mRegisterButton, mLoginButton, mLearnMore, buttonOk;
    private FirebaseAuth mAuth;
    private ProgressDialog progressDialog;
    private static Context context;


    private FirebaseAuth.AuthStateListener mAuthListener;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login_);
        mEmailField = (EditText) findViewById(R.id.Name_field);
        mPasswordField = (EditText) findViewById(R.id.Password_field);
        mRegisterButton = (Button) findViewById(R.id.btnRegister);
        mLoginButton = (Button) findViewById(R.id.btnLogin);
        mLearnMore = (Button) findViewById(R.id.learnmore);
        mResetPassword = (TextView) findViewById(R.id.resetpassword);
        //check already session
        mAuth = FirebaseAuth.getInstance();
        context=this;
        progressDialog = new ProgressDialog(this);

        //check user logged in
        mAuthListener = new FirebaseAuth.AuthStateListener() {
            @Override

            public void onAuthStateChanged(@NonNull FirebaseAuth firebaseAuth) {

                if (firebaseAuth.getCurrentUser() != null) {
                    startActivity(new Intent(Login_Activity.this, Home_Activity.class));
                }
                else
                {
                    Toast.makeText(Login_Activity.this, "Register your account first", Toast.LENGTH_LONG).show();                }
            }
        };


        //for User Regiatration
        mRegisterButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Login_Activity.this, Register_Activity.class));
                finish();
            }
        });

        //for learn more Activity
        mLearnMore.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                openDialog();

            }
        });

        //for password Reset
        mResetPassword.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                startActivity(new Intent(Login_Activity.this, ResetPasswordActivity.class));
                finish();
            }
        });

        //for user login
        mLoginButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                loginUser();

            }
        });
    }
    public void openDialog() {

        final Dialog dialog = new Dialog(context); // Context, this, etc.
        dialog.setContentView(R.layout.dialog_intro);
        dialog.setTitle("About Smart Traveller");
        dialog.show();

    }

    @Override
    protected void onStart() {
        super.onStart();
        mAuth.addAuthStateListener(mAuthListener);
    }

    private void loginUser() {
        String email = mEmailField.getText().toString();
        final String password = mPasswordField.getText().toString();

        if (TextUtils.isEmpty(email)) {
            Toast.makeText(getApplicationContext(), "Enter Email Address", Toast.LENGTH_SHORT).show();
            return;
        }
        if (email.length() > 25 || !Patterns.EMAIL_ADDRESS.matcher(email).matches()) {
            mEmailField.setError("Please Enter valid email Address");
        }
        if (password.isEmpty())
        {
            mPasswordField.setError("Email is Required");
            mPasswordField.requestFocus();
            return;
        }
        if (password.length()<6)
        {
            mPasswordField.setError("Minimum length of password should be 6");
            mPasswordField.requestFocus();
            return;
        }
        progressDialog.setTitle("Logging In");
        progressDialog.setMessage("Please Wait");
        progressDialog.show();

        //authenticate user
        mAuth.signInWithEmailAndPassword(email, password)
                .addOnCompleteListener(Login_Activity.this, new OnCompleteListener<AuthResult>() {
                    @Override
                    public void onComplete(@NonNull Task<AuthResult> task) {

                        if (!task.isSuccessful()) {
                                Toast.makeText(Login_Activity.this, getString(R.string.auth_failed), Toast.LENGTH_LONG).show();
                                progressDialog.cancel();
                            }
                         else {
                            Intent intent = new Intent(Login_Activity.this, Home_Activity.class);
                            startActivity(intent);
                            progressDialog.cancel();

                        }
                    }
                });

    }
}







