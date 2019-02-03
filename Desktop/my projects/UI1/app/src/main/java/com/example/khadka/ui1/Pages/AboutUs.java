package com.example.khadka.ui1.Pages;
/**
 * Created by Khadka on 21-02-2018.
 */
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Patterns;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.khadka.ui1.Misc.FeedbackInformation;
import com.example.khadka.ui1.R;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import butterknife.BindView;
import butterknife.ButterKnife;

public class AboutUs extends AppCompatActivity {

    private EditText Fullname, Email, Message;
    private Button Submit;
    private DatabaseReference databaseReference;
    private FirebaseAuth firebaseAuth;





    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_about_us);
        ButterKnife.bind(this);
        databaseReference = FirebaseDatabase.getInstance().getReference();

        Fullname = (EditText)findViewById(R.id.fullname_Aboutus);
        Email = (EditText)findViewById(R.id.email_Aboutus);
        Message = (EditText)findViewById(R.id.message_Aboutss);
        Submit = (Button) findViewById(R.id.button_Aboutus);

        Submit.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                saveFeedbackInformation();
            }
        });
        firebaseAuth = FirebaseAuth.getInstance();
    }



    private void saveFeedbackInformation(){
        String Name = Fullname.getText().toString().trim();
        String emailAddress = Email.getText().toString().trim();
        String Feedback = Message.getText().toString().trim();



        if (TextUtils.isEmpty(Name)) {
            Toast.makeText(getApplicationContext(), "please enter you name", Toast.LENGTH_SHORT).show();
            return;
        }

        if (emailAddress.length() > 25|| emailAddress.isEmpty() || !Patterns.EMAIL_ADDRESS.matcher(emailAddress).matches()) {
            Email.setError("Invalid Email");
            Toast.makeText(this, "Please Check your email", Toast.LENGTH_SHORT).show();
        }
        else {
            FeedbackInformation feedbackInformation = new FeedbackInformation(Name, emailAddress, Feedback);
            FirebaseUser user = firebaseAuth.getCurrentUser();
            databaseReference.child(user.getUid()).setValue(feedbackInformation);

            Toast.makeText(this, "Thank you For Your Feedback..", Toast.LENGTH_SHORT).show();
            Fullname.setText(" ");
            Email.setText(" ");
            Message.setText(" ");

        }

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
    public void onBackPressed() {
        this.finish();
        super.onBackPressed();
        Intent intent = new Intent(AboutUs.this,Home_Activity.class);
        startActivity(intent);
    }


}
