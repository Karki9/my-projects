package com.example.khadka.ui1.Pages;

import android.content.Intent;
import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.CardView;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.example.khadka.ui1.AccountActivity.Login_Activity;
import com.example.khadka.ui1.AccountActivity.User;
import com.example.khadka.ui1.FrragmentsActivity.Route_Finder;
import com.example.khadka.ui1.FrragmentsActivity.SearchMap;
import com.example.khadka.ui1.R;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseUser;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.Map;

public class Home_Activity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener, View.OnClickListener {


    private ImageView NavigationPicture;
    private TextView NavigationName;
    private FirebaseAuth mAuth;
    private Toolbar mToolbar;
    private String userId;
    private WebView webView;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_home_);
        mToolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(mToolbar);
        User user= new User();
        user.getUserName();
        user.getUserImage();
        NavigationPicture =(ImageView)findViewById(R.id.imageView_Navigation);
        NavigationName= (TextView)findViewById(R.id.username_navigation);
        userId = FirebaseAuth.getInstance().getCurrentUser().getUid();
        webView = (WebView) findViewById(R.id.webView_home);
        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        webView.loadUrl(" https://travelnewsnepal.com/#nav");//providing url
        webView.setWebViewClient( new WebViewClient()); //prevents url to open in browser


        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, mToolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.addDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);


        getUserImage();
    }

    private void getUserImage() {
        DatabaseReference getUserImage = FirebaseDatabase.getInstance().getReference().child("Users").child(userId);
        getUserImage.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists()) {
                    Map<String, Object> map = (Map<String, Object>) dataSnapshot.getValue();
                    if (map.get("profileImageUrl") != null) {
                        Glide.with(getApplicationContext()).load(map.get("profileImageUrl")).load(NavigationPicture);
                    }
                }
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {

            }
        });
    }


    @Override
    public void onClick(View view) {

        }


    @Override
    public void onStart() {
        super.onStart();


    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        }

        if (webView.canGoBack())
        {
            webView.goBack();
        }
        else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.home_, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id==R.id.action_place_picker)
        {
            Intent intent = new Intent(Home_Activity.this,PlacePickerActivity.class);
            startActivity(intent);

        }

        if (id==R.id.action_Logout)
        {
            mAuth.getInstance().signOut();
            Intent intent = new Intent(Home_Activity.this, Login_Activity.class);
            startActivity(intent);
        }

        if (id==R.id.travelAgenciesbar)
        {
            Intent intent = new Intent(Home_Activity.this, TravelPartners.class);
            startActivity(intent);

        }
        if (id==R.id.mapSearch)
        {
            Intent intent = new Intent(Home_Activity.this, SearchMap.class);
            startActivity(intent);

        }
        if (id==R.id.action_Emergency)
        {
            Intent intent = new Intent(Home_Activity.this, Emergency.class);
            startActivity(intent);

        }



        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        int id = item.getItemId();
        android.support.v4.app.Fragment fragment = null;

        if (id == R.id.profile_nav) {
            Intent intent = new Intent(Home_Activity.this, Profile.class);
            startActivity(intent);
        } else if (id == R.id.findRoute_nav) {
            Intent intent = new Intent(Home_Activity.this, Route_Finder.class);
            startActivity(intent);

        } else if (id == R.id.nearby_nav) {
            Intent intent = new Intent(Home_Activity.this, SearchMap.class);
            startActivity(intent);
        } else if (id == R.id.travelTips_nav) {
            Intent intent = new Intent(Home_Activity.this, TravelTips.class);
            startActivity(intent);
        } else if (id == R.id.inBag_nav) {
            Intent intent = new Intent(Home_Activity.this, Bag.class);
            startActivity(intent);

        } else if (id == R.id.aboutUs_nav) {
            Intent intent = new Intent(Home_Activity.this, AboutUs.class);
            startActivity(intent);

        } else if (id == R.id.travelPartners_nav) {
            Intent intent = new Intent(Home_Activity.this, TravelPartners.class);
            startActivity(intent);

        } else if (id == R.id.destinations_nav) {
            Intent intent = new Intent(Home_Activity.this, InformationDestination.class);
            startActivity(intent);

        }
        else if (id == R.id.emergency_nav) {
            Intent intent = new Intent(Home_Activity.this, Emergency.class);
            startActivity(intent);

        }
        else if (id == R.id.TravelGuides_nav) {
            Intent intent = new Intent(Home_Activity.this, Travel_Guide.class);
            startActivity(intent);

        }


        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }



}
