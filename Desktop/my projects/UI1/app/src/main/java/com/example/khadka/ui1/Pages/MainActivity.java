package com.example.khadka.ui1.Pages;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.khadka.ui1.AccountActivity.Login_Activity;
import com.example.khadka.ui1.R;

public class MainActivity extends AppCompatActivity {

    private TextView tv;
    private ImageView iv;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tv = (TextView)findViewById(R.id.tv);
        iv = (ImageView)findViewById(R.id.iv);
        Animation myanim = AnimationUtils.loadAnimation(this,R.anim.transition);
        tv.startAnimation(myanim);
        Thread timer= new Thread(){
            public void run()
            {
                try
                {
                    sleep(5000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                finally {
                    Intent intent= new Intent(MainActivity.this, Login_Activity.class);
                    startActivity(intent);
                    finish();

                }
            }
        };

        timer.start();




    }
}
