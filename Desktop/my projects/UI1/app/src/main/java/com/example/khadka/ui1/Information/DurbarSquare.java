package com.example.khadka.ui1.Information;

/**
 * Created by Khadka on 11-04-2018.
 */
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.khadka.ui1.FrragmentsActivity.Route_Finder;
import com.example.khadka.ui1.FrragmentsActivity.SearchMap;
import com.example.khadka.ui1.R;

public class DurbarSquare extends AppCompatActivity implements View.OnClickListener{


    private Button FindRoutes;
    private Button ShowinMap;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_durbar_square);

        FindRoutes = (Button)findViewById(R.id.findRoute_durbarSquare);
        ShowinMap = (Button)findViewById(R.id.mapDurbar);

        FindRoutes.setOnClickListener(this);
        ShowinMap.setOnClickListener(this);



    }

    @Override
    public void onClick(View v) {
        switch (v.getId())
        {
            case R.id.findRoute_durbarSquare:
                startActivity( new Intent(this,Route_Finder.class));
                break;
            case R.id.mapDurbar:
                startActivity( new Intent(this, SearchMap.class));
                break;
        }
    }
}
