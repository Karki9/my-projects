package com.example.khadka.ui1.Pages;

import android.app.ProgressDialog;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.example.khadka.ui1.Misc.Travell;
import com.example.khadka.ui1.R;
import com.firebase.ui.database.FirebaseRecyclerAdapter;
import com.firebase.ui.database.FirebaseRecyclerOptions;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.squareup.picasso.Picasso;

public class TravelPartners extends AppCompatActivity {

    private RecyclerView mAgencylist;
    private DatabaseReference mDatabase;
    private ProgressDialog progressDialog;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_travel_partners);
        progressDialog = new ProgressDialog(this);
        mDatabase = FirebaseDatabase.getInstance().getReference().child("Agencies");
        mDatabase.keepSynced(true);

        mAgencylist = (RecyclerView) findViewById(R.id.recyclerView);
        mAgencylist.setHasFixedSize(true);
        mAgencylist.setLayoutManager(new LinearLayoutManager(this));
    }

    @Override
    protected void onStart() {


        progressDialog.setTitle("Loading Agencies");
        progressDialog.setMessage("This might take few seconds");
        progressDialog.show();

        super.onStart();
        FirebaseRecyclerOptions<Travell> options = new FirebaseRecyclerOptions.Builder<Travell>().setQuery(mDatabase, Travell.class).build();

        FirebaseRecyclerAdapter<Travell, TravelViewHolder> firebaseRecyclerAdapter = new FirebaseRecyclerAdapter<Travell, TravelViewHolder>
                (options) {

            @Override
            protected void onBindViewHolder(@NonNull TravelViewHolder holder, int position, @NonNull Travell travell) {
                progressDialog.cancel();
                holder.setImage(getApplicationContext(), travell.getImage());
                holder.setName(travell.getName());
                holder.setAddress(travell.getAddress());
                holder.setContact(travell.getContact());
                holder.setEmail(travell.getEmail());


            }

            @Override
            public TravelViewHolder onCreateViewHolder(ViewGroup parent, int viewType) {
                View view = LayoutInflater.from(parent.getContext())
                        .inflate(R.layout.agencies_row, parent, false);

                return new TravelViewHolder(view);
            }
        };
        mAgencylist.setAdapter(firebaseRecyclerAdapter);
        firebaseRecyclerAdapter.startListening();
    }

    public class TravelViewHolder extends RecyclerView.ViewHolder


            //getting string from firebase
            //initialising data in to textview
    {
        public TextView AgencyName;
        public ImageView likeImageView;
        public TextView AgencyContact;


        View mView;

        public TravelViewHolder(View itemview) {
            super(itemview);
            mView = itemview;
            AgencyName = (TextView) itemview.findViewById(R.id.agency_name);
            AgencyContact = (TextView) itemview.findViewById(R.id.agency_Contacts);
            likeImageView = (ImageView) itemview.findViewById(R.id.likeImageView);

            likeImageView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {

                    int id = (int) likeImageView.getId();
                    if (id != R.drawable.ic_like) {

                        likeImageView.setTag(R.drawable.ic_liked);
                        likeImageView.setImageResource(R.drawable.ic_liked);

                        Toast.makeText(TravelPartners.this, AgencyName.getText() + " added to favourites", Toast.LENGTH_SHORT).show();

                    } else {

                        likeImageView.setTag(R.drawable.ic_like);
                        likeImageView.setImageResource(R.drawable.ic_like);
                        Toast.makeText(TravelPartners.this, AgencyName.getText() + " removed from favourites", Toast.LENGTH_SHORT).show();


                    }

                }
            });


        }

        public void setName(String name) {
            TextView post_Name = (TextView) mView.findViewById(R.id.agency_name);
            post_Name.setText(name);
        }

        public void setAddress(String address) {
            TextView post_Address = (TextView) mView.findViewById(R.id.agency_Address);
            post_Address.setText(address);
        }

        public void setContact(String contact) {
            TextView post_Contact = (TextView) mView.findViewById(R.id.agency_Contacts);
            post_Contact.setText(contact);
        }

        public void setEmail(String email) {
            TextView post_Email = (TextView) mView.findViewById(R.id.agency_email);
            post_Email.setText(email);
        }

        public void setImage(Context context, String image) {
            ImageView post_Image = (ImageView) mView.findViewById(R.id.coverImageView);
            Picasso.with(context).load(image).into(post_Image);

        }
    }


        @Override
        public void onBackPressed () {
            super.onBackPressed();
            this.finish();
        }
    }



