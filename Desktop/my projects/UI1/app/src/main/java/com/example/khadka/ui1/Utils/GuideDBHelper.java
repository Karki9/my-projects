package com.example.khadka.ui1.Utils;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.widget.Toast;

import com.example.khadka.ui1.AccountActivity.Guide;

import java.util.LinkedList;
import java.util.List;

/**
 * Created by Khadka on 08-04-2018.
 */

public class GuideDBHelper extends SQLiteOpenHelper {

    public static final String DATABASE_NAME = "guide.db";
    private static final int DATABASE_VERSION = 3 ;
    public static final String TABLE_NAME = "Guide";
    public static final String COLUMN_ID = "_id";
    public static final String COLUMN_GUIDE_NAME = "name";
    public static final String COLUMN_GUIDE_AGE = "age";
    public static final String COLUMN_GUIDE_ADDRESS = "address";
    public static final String COLUMN_GUIDE_CONTACT = "contact";
    public static final String COLUMN_PERSON_IMAGE = "image";


    public GuideDBHelper(Context context) {
        super(context, DATABASE_NAME , null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(" CREATE TABLE " + TABLE_NAME + " (" +
                COLUMN_ID + " INTEGER PRIMARY KEY AUTOINCREMENT, " +
                COLUMN_GUIDE_NAME + " TEXT NOT NULL, " +
                COLUMN_GUIDE_AGE + " NUMBER NOT NULL, " +
                COLUMN_GUIDE_ADDRESS + " TEXT NOT NULL, " +
                COLUMN_GUIDE_CONTACT + " NUMBER NOT NULL, " +
                COLUMN_PERSON_IMAGE + " BLOB NOT NULL);"
        );

    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        // you can implement here migration process
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_NAME);
        this.onCreate(db);
    }
    /**create record**/
    public void saveNewGuide(Guide guide) {

        SQLiteDatabase db = this.getWritableDatabase();
        ContentValues values = new ContentValues();
        values.put(COLUMN_GUIDE_NAME, guide.getName());
        values.put(COLUMN_GUIDE_AGE, guide.getAge());
        values.put(COLUMN_GUIDE_ADDRESS, guide.getAddress());
        values.put(COLUMN_GUIDE_CONTACT, guide.getContact());
        values.put(COLUMN_PERSON_IMAGE, guide.getImage());

        // insert
        db.insert(TABLE_NAME,null, values);
        db.close();
    }

    /**Query records, give options to filter results**/
    public List<Guide> guideList(String filter) {
        String query;
        if(filter.equals("")){
            //regular query
            query = "SELECT  * FROM " + TABLE_NAME;
        }else{
            //filter results by filter option provided
            query = "SELECT  * FROM " + TABLE_NAME + " ORDER BY "+ filter;
        }

        List<Guide> personLinkedList = new LinkedList<>();
        SQLiteDatabase db = this.getWritableDatabase();
        Cursor cursor = db.rawQuery(query, null);
        Guide guide;

        if (cursor.moveToFirst()) {
            do {
                guide = new Guide();

                guide.setId(cursor.getLong(cursor.getColumnIndex(COLUMN_ID)));
                guide.setName(cursor.getString(cursor.getColumnIndex(COLUMN_GUIDE_NAME)));
                guide.setAge(cursor.getString(cursor.getColumnIndex(COLUMN_GUIDE_AGE)));
                guide.setAddress(cursor.getString(cursor.getColumnIndex(COLUMN_GUIDE_ADDRESS)));
                guide.setContact(cursor.getString(cursor.getColumnIndex(COLUMN_GUIDE_CONTACT)));
                guide.setImage(cursor.getString(cursor.getColumnIndex(COLUMN_PERSON_IMAGE)));
                personLinkedList.add(guide);
            } while (cursor.moveToNext());
        }


        return personLinkedList;
    }

    /**Query only 1 record**/
    public Guide getGuide(long id){
        SQLiteDatabase db = this.getWritableDatabase();
        String query = "SELECT  * FROM " + TABLE_NAME + " WHERE _id="+ id;
        Cursor cursor = db.rawQuery(query, null);

        Guide receivedPerson = new Guide();
        if(cursor.getCount() > 0) {
            cursor.moveToFirst();

            receivedPerson.setName(cursor.getString(cursor.getColumnIndex(COLUMN_GUIDE_NAME)));
            receivedPerson.setAge(cursor.getString(cursor.getColumnIndex(COLUMN_GUIDE_AGE)));
            receivedPerson.setAddress(cursor.getString(cursor.getColumnIndex(COLUMN_GUIDE_ADDRESS)));
            receivedPerson.setContact(cursor.getString(cursor.getColumnIndex(COLUMN_GUIDE_CONTACT)));
            receivedPerson.setImage(cursor.getString(cursor.getColumnIndex(COLUMN_PERSON_IMAGE)));
        }



        return receivedPerson;


    }


    /**delete record**/
    public void deleteGuideRecord(long id, Context context) {
        SQLiteDatabase db = this.getWritableDatabase();

        db.execSQL("DELETE FROM "+TABLE_NAME+" WHERE _id='"+id+"'");
        Toast.makeText(context, "Deleted successfully.", Toast.LENGTH_SHORT).show();

    }

    /**update record**/
    public void updateGuideRecord(long guideId, Context context, Guide updatedGuide) {
        SQLiteDatabase db = this.getWritableDatabase();
        //you can use the constants above instead of typing the column names
        db.execSQL("UPDATE  "+TABLE_NAME+" SET name ='"+ updatedGuide.getName() + "', age ='" + updatedGuide.getAge()+ "', address ='"+ updatedGuide.getAddress() + "', contact ='"+ updatedGuide.getContact() + "', image ='"+ updatedGuide.getImage() + "'  WHERE _id='" + guideId
                + "'");
        Toast.makeText(context, "Updated successfully.", Toast.LENGTH_SHORT).show();


    }




}
