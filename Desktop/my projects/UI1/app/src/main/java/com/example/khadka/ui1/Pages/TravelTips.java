package com.example.khadka.ui1.Pages;

import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.design.widget.BottomNavigationView;
import android.support.v7.app.AppCompatActivity;
import android.view.MenuItem;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.TextView;

import com.example.khadka.ui1.R;

public class TravelTips extends AppCompatActivity {

    private WebView webView;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_travel_1);

        webView = (WebView) findViewById(R.id.webview_tips);
        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        webView.loadUrl("https://www.nepalhikingteam.com/top-7-travel-tips-for-visiting-nepal/");//providing url
        webView.setWebViewClient( new WebViewClient()); //prevents url to open in browser


    }

    @Override
    public void onBackPressed() {
        super.onBackPressed();
        this.finish();

    }

}
