package com.example.khadka.ui1.Utils;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.support.v7.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.khadka.ui1.AccountActivity.Guide;
import com.example.khadka.ui1.Pages.Update_Travel_Guide;
import com.example.khadka.ui1.R;
import com.squareup.picasso.Picasso;

import java.util.List;

/**
 * Created by Khadka on 08-04-2018.
 */

    public class GuideAdapter extends RecyclerView.Adapter<GuideAdapter.ViewHolder> {
    private List<Guide> mGuideList;
    private Context mContext;
    private RecyclerView mRecyclerV;


    // Provide a reference to the views for each data item
    // Complex data items may need more than one view per item, and
    // you provide access to all the views for a data item in a view holder
    public class ViewHolder extends RecyclerView.ViewHolder {
        // each data item is just a string in this case
        public TextView guideNameTxtV;
        public TextView guideAgeTxtV;
        public TextView guideAddressTxtV;
        public TextView guideContactTxtV;

        public ImageView personImageImgV;


        public View layout;

        public ViewHolder(View v) {
            super(v);
            layout = v;
            guideNameTxtV = (TextView) v.findViewById(R.id.name);
            guideAgeTxtV = (TextView) v.findViewById(R.id.age);
            guideAddressTxtV = (TextView) v.findViewById(R.id.address);
            guideContactTxtV = (TextView) v.findViewById(R.id.contact);
            personImageImgV = (ImageView) v.findViewById(R.id.image);




        }
    }

    public void add(int position, Guide guide) {
        mGuideList.add(position, guide);
        notifyItemInserted(position);
    }

    public void remove(int position) {
        mGuideList.remove(position);
        notifyItemRemoved(position);
    }



    // Provide a suitable constructor (depends on the kind of dataset)
    public GuideAdapter(List<Guide> myDataset, Context context, RecyclerView recyclerView) {
        mGuideList = myDataset;
        mContext = context;
        mRecyclerV = recyclerView;
    }

    // Create new views (invoked by the layout manager)
    @Override
    public GuideAdapter.ViewHolder onCreateViewHolder(ViewGroup parent,
                                                       int viewType) {
        // create a new view
        LayoutInflater inflater = LayoutInflater.from(
                parent.getContext());
        View v =
                inflater.inflate(R.layout.single_row_guide, parent, false);
        // set the view's size, margins, paddings and layout parameters
        ViewHolder vh = new ViewHolder(v);
        return vh;
    }

    // Replace the contents of a view (invoked by the layout manager)
    @Override
    public void onBindViewHolder(ViewHolder holder, final int position) {
        // - get element from your dataset at this position
        // - replace the contents of the view with that element



        final Guide guide = mGuideList.get(position);
        holder.guideNameTxtV.setText("Name: " + guide.getName());
        holder.guideAgeTxtV.setText("Age: " + guide.getAge());
        holder.guideAddressTxtV.setText("Address: " + guide.getAddress());
        holder.guideContactTxtV.setText("Contact: " + guide.getContact());
        if (guide.getImage().isEmpty()) {
            guide.setImage(" ");
        } else{
            Picasso.with(mContext).load(guide.getImage()).placeholder(R.mipmap.ic_launcher).into(holder.personImageImgV);
        }



        //listen to single view layout click
        holder.layout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                AlertDialog.Builder builder = new AlertDialog.Builder(mContext);
                builder.setTitle("Choose option");
                builder.setMessage("Update or delete Guide?");
                builder.setPositiveButton("Update", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                        //go to update activity
                        goToUpdateActivity(guide.getId());

                    }
                });
                builder.setNeutralButton("Delete", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        GuideDBHelper dbHelper = new GuideDBHelper(mContext);
                        dbHelper.deleteGuideRecord(guide.getId(), mContext);

                        mGuideList.remove(position);
                        mRecyclerV.removeViewAt(position);
                        notifyItemRemoved(position);
                        notifyItemRangeChanged(position, mGuideList.size());
                        notifyDataSetChanged();
                    }
                });
                builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        dialog.dismiss();
                    }
                });
                builder.create().show();
            }
        });


    }

    private void goToUpdateActivity(long personId){
        Intent goToUpdate = new Intent(mContext, Update_Travel_Guide.class);
        goToUpdate.putExtra("USER_ID", personId);
        mContext.startActivity(goToUpdate);
    }



    // Return the size of your dataset (invoked by the layout manager)
    @Override
    public int getItemCount() {
        return mGuideList.size();
    }



}
