package com.example.khadka.ui1.Pages;

/**
 * Created by Khadka on 21-04-2018.
 *
 */
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.CardView;
import android.view.View;

import com.example.khadka.ui1.Information.Bhaktapur;
import com.example.khadka.ui1.Information.DurbarSquare;
import com.example.khadka.ui1.Information.Ghandruk;
import com.example.khadka.ui1.Information.Ghorepani;
import com.example.khadka.ui1.Information.Kathmandu;
import com.example.khadka.ui1.Information.Lumbini;
import com.example.khadka.ui1.Information.Manang;
import com.example.khadka.ui1.Information.Nagarkot;
import com.example.khadka.ui1.Information.Patan;
import com.example.khadka.ui1.Information.Pokhara;
import com.example.khadka.ui1.R;

public class InformationDestination extends AppCompatActivity implements View.OnClickListener {
    private CardView lumbini, pokhara, kathmandu, nagarkot, patan, bhaktapur , durbarSquare,manang,ghandruk,ghorepani;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_information_destination);
        lumbini = (CardView) findViewById(R.id.lumbini_card);
        pokhara = (CardView) findViewById(R.id.pokhara_card);
        kathmandu = (CardView) findViewById(R.id.kathmandu_card);
        nagarkot = (CardView) findViewById(R.id.nagarkot_card);
        patan = (CardView) findViewById(R.id.patan_card);
        bhaktapur = (CardView) findViewById(R.id.bhaktapur_card);
        durbarSquare = (CardView)findViewById(R.id.durbar_square);
        manang = (CardView)findViewById(R.id.manang_card);
        ghandruk=(CardView)findViewById(R.id.ghandruk_card);
        ghorepani=(CardView)findViewById(R.id.ghorepani_card);

        lumbini.setOnClickListener(this);
        kathmandu.setOnClickListener(this);
        pokhara.setOnClickListener(this);
        nagarkot.setOnClickListener(this);
        patan.setOnClickListener(this);
        bhaktapur.setOnClickListener(this);
        durbarSquare.setOnClickListener(this);
        manang.setOnClickListener(this);
        ghorepani.setOnClickListener(this);


    }


    @Override
    public void onClick(View view) {
        Intent i;
        switch (view.getId()) {

            case R.id.pokhara_card:
                i = new Intent(this, Pokhara.class);
                startActivity(i);
                break;


            case R.id.lumbini_card:
                i = new Intent(this, Lumbini.class);
                startActivity(i);
                break;


            case R.id.kathmandu_card:
                i = new Intent(this, Kathmandu.class);
                startActivity(i);
                break;
            case R.id.nagarkot_card:
                i = new Intent(this, Nagarkot.class);
                startActivity(i);
                break;
            case R.id.patan_card:
                    i = new Intent(this, Patan.class);
                startActivity(i);
                break;
            case R.id.bhaktapur_card:
                i = new Intent(this, Bhaktapur.class);
                startActivity(i);
                break;
            case R.id.durbar_square:
                i = new Intent(this, DurbarSquare.class);
                startActivity(i);
                break;
            case R.id.manang_card:
                i = new Intent(this, Manang.class);
                startActivity(i);
                break;
            case R.id.ghorepani_card:
                i = new Intent(this, Ghorepani.class);
                startActivity(i);
                break;
                default:break;


        }
    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        this.finish();
    }
}
