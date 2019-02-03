package com.example.khadka.ui1.Information;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.khadka.ui1.FrragmentsActivity.Route_Finder;
import com.example.khadka.ui1.FrragmentsActivity.SearchMap;
import com.example.khadka.ui1.R;

public class Pokhara extends AppCompatActivity implements View.OnClickListener{

    private Button FindRoutes;
    private Button ShowinMap;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_pokhara);

        FindRoutes = (Button)findViewById(R.id.findRoute_Pokhara);
        ShowinMap = (Button)findViewById(R.id.mapPokhara);

        FindRoutes.setOnClickListener(this);
        ShowinMap.setOnClickListener(this);



    }

    @Override
    public void onClick(View v) {
        switch (v.getId())
        {
            case R.id.findRoute_Pokhara:
                startActivity( new Intent(this,Route_Finder.class));
                break;
            case R.id.mapPokhara:
                startActivity( new Intent(this, SearchMap.class));
                break;
        }
    }
}

