package com.example.khadka.ui1.Pages;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.CardView;
import android.view.View;
import android.widget.ImageView;

import com.example.khadka.ui1.Information.Lumbini;
import com.example.khadka.ui1.R;

public class Emergency extends AppCompatActivity implements View.OnClickListener {
    private CardView NepalPolice, ForeignPolice, BirHospital, PatanHosptital, TeachingHosptal, BandBHospital, TekuHospital, AlpineRescue, SarathiClub, OnvertTaxi, Redcross, Paropakar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_emergency);

        NepalPolice = (CardView) findViewById(R.id.nepal_police);
        ForeignPolice = (CardView) findViewById(R.id.tourist_police);
        BirHospital = (CardView) findViewById(R.id.bir_hospital);
        PatanHosptital = (CardView) findViewById(R.id.patan_hospital);
        TeachingHosptal = (CardView) findViewById(R.id.teaching_hospital);
        BandBHospital = (CardView) findViewById(R.id.bandb_hospital);
        TekuHospital = (CardView) findViewById(R.id.teku_hospital);
        AlpineRescue = (CardView) findViewById(R.id.alpine_rescue);
        SarathiClub = (CardView) findViewById(R.id.sarathi_club);
        OnvertTaxi = (CardView) findViewById(R.id.onvert_taxi);
        Redcross = (CardView) findViewById(R.id.redCross);
        Paropakar = (CardView) findViewById(R.id.paropakar);

        NepalPolice.setOnClickListener(this);
        ForeignPolice.setOnClickListener(this);
        BirHospital.setOnClickListener(this);
        PatanHosptital.setOnClickListener(this);
        TeachingHosptal.setOnClickListener(this);
        BandBHospital.setOnClickListener(this);
        TekuHospital.setOnClickListener(this);
        AlpineRescue.setOnClickListener(this);
        SarathiClub.setOnClickListener(this);
        OnvertTaxi.setOnClickListener(this);
        Redcross.setOnClickListener(this);
        Paropakar.setOnClickListener(this);




    }

    @Override
    public void onClick(View view) {


        switch (view.getId()) {
            case R.id.nepal_police:
                String nepalPolice= " 100";
               dialPhoneNumber(nepalPolice);
               break;
            case R.id.tourist_police:
                String foreignPolice = "01-4226359";
                dialPhoneNumber(foreignPolice);
                break;
            case R.id.bir_hospital:
                String birHospital = "01-221988";
                dialPhoneNumber(birHospital);
                break;

            case R.id.patan_hospital:
                String patanHospital = "01-221988";
                dialPhoneNumber(patanHospital);
                break;

            case R.id.teaching_hospital:
                String teachingHospital = "01-4412707";
               dialPhoneNumber(teachingHospital);
                break;


            case R.id.bandb_hospital:
                String bbHospital = "01-4351930";
                dialPhoneNumber(bbHospital);
                break;


            case R.id.teku_hospital:
                String tekuHospital = "01-4253396";
                dialPhoneNumber(tekuHospital);
                break;


            case R.id.alpine_rescue:
                String alpineRescue = "+977-1-4362652";
                dialPhoneNumber(alpineRescue);
                break;



            case R.id.sarathi_club:
                String sarathiClub = "981-0100600";
                dialPhoneNumber(sarathiClub);
                break;


            case R.id.onvert_taxi:
                String onvertTaxi = "01-4111812";
               dialPhoneNumber(onvertTaxi);
                break;


            case R.id.redCross:
                String redcross = "01-4228094";
                dialPhoneNumber(redcross);
                break;


            case R.id.paropakar:
                String paropakar= "01-4251614";
               dialPhoneNumber(paropakar);
                break;


            default:break;

        }



    }
    public void dialPhoneNumber(String phoneNumber) {
        Intent intent = new Intent(Intent.ACTION_DIAL);
        intent.setData(Uri.parse("tel:" + phoneNumber));
        if (ActivityCompat.checkSelfPermission(this, android.Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return;
        }
        if (intent.resolveActivity(getPackageManager()) != null) {
            startActivity(intent);
        }
    }
    @Override
    public void onBackPressed() {
        this.finish();
        super.onBackPressed();
        Intent intent = new Intent(Emergency.this,Home_Activity.class);
        startActivity(intent);
    }
}
