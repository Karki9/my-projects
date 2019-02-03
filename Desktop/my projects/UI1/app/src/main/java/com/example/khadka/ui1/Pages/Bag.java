package com.example.khadka.ui1.Pages;

import android.content.Context;
import android.support.design.widget.CollapsingToolbarLayout;
import android.support.design.widget.CoordinatorLayout;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.Toolbar;
import android.widget.GridView;


import com.example.khadka.ui1.Misc.CustomAndroidGridViewAdapter;
import com.example.khadka.ui1.R;

import java.util.ArrayList;

public class Bag extends AppCompatActivity {

    Toolbar toolbar;
    CollapsingToolbarLayout collapsingToolbarLayoutAndroid;
    CoordinatorLayout rootLayoutAndroid;
    GridView gridView;
    Context context;
    ArrayList arrayList;

    public static String[] gridViewStrings = {
            "Sunglasses and Hat",
            "Camera",
            "Chargers",
            "Medicines",
            "FirstAid",
            "Passports and Documents",
            "Wallet",
            "mask",
            "Code",

    };
    public static int[] gridViewImages = {
            R.drawable.hatandglass,
            R.drawable.camera,
            R.drawable.charger,
            R.drawable.medicines,
            R.drawable.hospital,
            R.drawable.passport,
            R.drawable.wallet,
            R.drawable.mask,
            R.drawable.user
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_bag);

        toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        gridView = (GridView) findViewById(R.id.gridView_Bag);
        gridView.setAdapter(new CustomAndroidGridViewAdapter(this, gridViewStrings, gridViewImages));

        initInstances();
    }


    private void initInstances() {
        rootLayoutAndroid = (CoordinatorLayout) findViewById(R.id.android_coordinator_layout);
        collapsingToolbarLayoutAndroid = (CollapsingToolbarLayout) findViewById(R.id.collapsing_toolbar_android_layout);
        collapsingToolbarLayoutAndroid.setTitle("In Yor Bag");
    }

}
