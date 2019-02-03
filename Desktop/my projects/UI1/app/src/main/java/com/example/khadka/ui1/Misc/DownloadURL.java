package com.example.khadka.ui1.Misc;

import android.util.Log;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 * Created by Khadka on 03-01-2018.
 */

public class DownloadURL {
    public String readUrl(String myUrl) throws IOException
    {
        String data = "";
        InputStream inputStream = null;
        HttpURLConnection urlConnection = null;

        try {
            URL url = new URL(myUrl);//creating url
            urlConnection=(HttpURLConnection) url.openConnection();//opening connection
            urlConnection.connect();//connect to url

            inputStream = urlConnection.getInputStream();//read data from url
            BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
            StringBuffer sb = new StringBuffer();

            String line = ""; // store each line and store each buffer
            while((line = br.readLine()) != null)
            {
                sb.append(line);//appending to string buffer
            }

            data = sb.toString();//store in the data
            br.close();

        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        finally {
            //get exectured even with exception
            try {
                if(inputStream != null) {
                    inputStream.close();
                }
            } catch (IOException ioe) {
            }

            urlConnection.disconnect();
        }
        Log.d("DownloadURL","Returning data= "+data);

        return data;
    }
}

