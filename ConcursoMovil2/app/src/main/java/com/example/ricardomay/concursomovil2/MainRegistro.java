package com.example.ricardomay.concursomovil2;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import android.app.Activity;
import android.content.pm.ActivityInfo;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.Toast;
//Clase secundaria Main Registro
public class MainRegistro extends AppCompatActivity {
    //Variables globales
    private EditText txtnombre;
    private EditText txtapellidop;
    private EditText txtapellidom;
    private EditText txtcorreo;
    private EditText txtpassword;
    private Button btnregistro;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT);
        setContentView(R.layout.activity_main_registro);

        txtnombre=(EditText)findViewById(R.id.txtnombre);
        txtapellidop=(EditText)findViewById(R.id.txtapellidop);
        txtapellidom=(EditText)findViewById(R.id.txtapellidom);
        txtcorreo=(EditText)findViewById(R.id.txtcorreo);
        txtpassword=(EditText)findViewById(R.id.txtpassword);

        //Insertamos los datos de la persona.
        btnregistro=(Button)findViewById(R.id.btnregistro);
        btnregistro.setOnClickListener(new OnClickListener(){

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                if(!txtnombre.getText().toString().trim().equalsIgnoreCase("")||
                        !txtapellidop.getText().toString().trim().equalsIgnoreCase("")||
                        !txtapellidom.getText().toString().trim().equalsIgnoreCase("")||
                        !txtcorreo.getText().toString().trim().equalsIgnoreCase("")||
                        !txtpassword.getText().toString().trim().equalsIgnoreCase(""))
                    new Insertar(MainRegistro.this).execute();

                else
                    Toast.makeText(MainRegistro.this, "Hay información por rellenar", Toast.LENGTH_LONG).show();
            }

        });
    }

    //Inserta los datos de las Personas en el servidor.
    private boolean insertar(){
        HttpClient httpclient;
        List<NameValuePair> nameValuePairs;
        HttpPost httppost;
        httpclient=new DefaultHttpClient();
        httppost= new HttpPost("http://192.168.43.171/webservice/insert.php"); // Url del Servidor
        //Añadimos nuestros datos
        nameValuePairs = new ArrayList<NameValuePair>(4);
        nameValuePairs.add(new BasicNameValuePair("nombre_usuario",txtnombre.getText().toString().trim()));
        nameValuePairs.add(new BasicNameValuePair("apPaterno_usuario",txtapellidop.getText().toString().trim()));
        nameValuePairs.add(new BasicNameValuePair("apMaterno_usuario",txtapellidom.getText().toString().trim()));
        nameValuePairs.add(new BasicNameValuePair("correo",txtcorreo.getText().toString().trim()));
        nameValuePairs.add(new BasicNameValuePair("password",txtpassword.getText().toString().trim()));

        try {
            httppost.setEntity(new UrlEncodedFormEntity(nameValuePairs));
            httpclient.execute(httppost);
            return true;
        } catch (UnsupportedEncodingException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }
    //AsyncTask para insertar Personas
    class Insertar extends AsyncTask<String,String,String>{

        private Activity context;

        Insertar(Activity context){
            this.context=context;
        }
        @Override
        protected String doInBackground(String... params) {
            // TODO Auto-generated method stub
            if(insertar())
                context.runOnUiThread(new Runnable(){
                    @Override
                    public void run() {
                        // TODO Auto-generated method stub
                        Toast.makeText(context, "Persona insertada con éxito", Toast.LENGTH_LONG).show();
                        txtnombre.setText("");
                        txtapellidop.setText("");
                        txtapellidom.setText("");
                        txtcorreo.setText("");
                        txtpassword.setText("");
                    }
                });
            else
                context.runOnUiThread(new Runnable(){
                    @Override
                    public void run() {
                        // TODO Auto-generated method stub
                        Toast.makeText(context, "Persona no insertada con éxito", Toast.LENGTH_LONG).show();
                    }
                });
            return null;
        }
    }



}
