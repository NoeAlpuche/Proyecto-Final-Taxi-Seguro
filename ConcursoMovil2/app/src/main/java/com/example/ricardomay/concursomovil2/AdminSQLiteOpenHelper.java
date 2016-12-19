package com.example.ricardomay.concursomovil2;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;

import java.util.ArrayList;

/**
 * Created by NOJE on 16/12/2016.
 */

public class AdminSQLiteOpenHelper extends SQLiteOpenHelper {


    public static final String Table_tab = "tabulador";

    public AdminSQLiteOpenHelper(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
        super(context, name, factory, version);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        db.execSQL("create table servicio(numtaxi text,calificacion int,comentario text)");
        db.execSQL("create table tabulador(origen text,destino text,costo int)");
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    }

    public void insertTabulador(String origen, String destino, int costo){
        SQLiteDatabase db = this.getWritableDatabase();
        //db.beginTransaction();
        ContentValues values = new ContentValues();
        values.put("origen",origen);
        values.put("destino",destino);
        values.put("costo",costo);

        db.insert(Table_tab, null, values);
    }
}