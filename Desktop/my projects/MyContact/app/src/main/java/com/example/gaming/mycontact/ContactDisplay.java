package com.example.gaming.mycontact;

import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.net.ConnectivityManager;
import android.os.AsyncTask;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.telecom.ConnectionService;
import android.util.Log;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class ContactDisplay extends AppCompatActivity {

    String json_url, JSON_STRING, json_string;
    JSONObject jsonObject;
    JSONArray jsonArray;
    EditText editText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_contact_display);

        //if (((ConnectivityManager) getSystemService(CONNECTIVITY_SERVICE)).getActiveNetworkInfo() != null) {
        BackgroundTask obj = new BackgroundTask();
        obj.execute("test", "hello");
        //} else {
//            Toast.makeText(getApplicationContext(), "No internet", Toast.LENGTH_LONG).show();
//        }

    }


    class BackgroundTask extends AsyncTask<String, Void, String> {
        String json_string, res;
        DatabaseInserter inserter;
        JSONObject jsonObject;
        JSONArray jsonArray;
        SQLiteDatabase db;


        @Override
        protected String doInBackground(String... voids) {

            String res = "";
            try {
                ///////////////////////////////////
                URL url = new URL(json_url);
                HttpURLConnection httpURLConnection = (HttpURLConnection) url.openConnection();
                httpURLConnection.setConnectTimeout(7000);
                httpURLConnection.setReadTimeout(7000);
                httpURLConnection.connect();
                if (httpURLConnection.getResponseCode() == 200) {
                    InputStream inputStream = httpURLConnection.getInputStream();
                    BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
                    StringBuilder stringBuilder = new StringBuilder();
                    while ((JSON_STRING = bufferedReader.readLine()) != null) {

                        stringBuilder.append(JSON_STRING + "\n");

                    }

                    bufferedReader.close();
                    inputStream.close();
                    httpURLConnection.disconnect();
                    res = stringBuilder.toString().trim();
                    Log.i("ContactDisplay", res);
                } else {
                    res = null;
                    Log.i("ContactDisplay", "Data Cannot Be Fetched");
                }
                return res;
                ////////////////////////////////////

            } catch (Exception e) {
                e.printStackTrace();
            }

            return res;
        }

        @Override
        protected void onPreExecute() {
            json_url = "http://192.168.49.179/mycontact/dataservice.php";
            //http://192.168.43.179/mycontact/dataService.php
            //https://api.myjson.com/bins/wrl4r"
        }

        @Override
        protected void onPostExecute(String reasult) {
            json_string = reasult;
            if (json_string != null && !json_string.isEmpty()) {
                Thread thread = new Thread() {
                    @Override
                    public void run() {
                        try {
                            int count = 0;
                            String empID, empName, mobileNo, officeNo, homeNo, email;

                            jsonObject = new JSONObject(json_string);
                            jsonArray = jsonObject.getJSONArray("server_response");



                            inserter = new DatabaseInserter(ContactDisplay.this);
                            //inserter.deleteData();
                            db = inserter.getWritableDatabase();
                            inserter.deleteData(db);
                            db.beginTransaction();

                            while (count < jsonArray.length()) {
                                JSONObject row = jsonArray.getJSONObject(count);
                                empID = row.getString("empID");
                                empName = row.getString("empName");
                                mobileNo = row.getString("mobileNo");
                                homeNo = row.getString("homeNo");
                                officeNo = row.getString("officeNo");
                                email = row.getString("email");
                                inserter.insertData(db, empID, empName, mobileNo, homeNo, officeNo, email);
                                count++;
                            }

                            db.setTransactionSuccessful();
                            Log.i("Status:", "Inserted Sucessfully");

                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            db.endTransaction();
                            db.close();
                        }

                    }
                };
                thread.start();
            }

            Intent intent = new Intent(getApplicationContext(), ContactDisplayView.class);
            startActivity(intent);
            finish();

        }
    }

    private static final String TAG = "ContactDisplay";
}