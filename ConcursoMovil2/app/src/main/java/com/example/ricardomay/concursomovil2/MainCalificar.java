package com.example.ricardomay.concursomovil2;

import android.app.Activity;
import android.content.ContentValues;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.database.sqlite.SQLiteDatabase;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.RatingBar;
import android.widget.TextView;
import android.widget.Toast;

import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

//Clase principal Main Calificar
public class MainCalificar extends AppCompatActivity {

    TextView TextCon ,insertar;
    Button btncons ;
    private EditText et1, et2,et3;
    private RatingBar RBar;
    private String datoNumero;





    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        setContentView(R.layout.activity_main_calificar);

        TextCon= (TextView) findViewById(R.id.editTextCon);
        btncons = (Button) findViewById(R.id.buttonCon);
        et1=(EditText)findViewById(R.id.editTextEnviar);
        et2=(EditText)findViewById(R.id.editTextCon);
        et3=(EditText)findViewById(R.id.editTextNum);
        RBar = (RatingBar) findViewById (R.id.ratingBar);
        Date date = new Date();
        DateFormat hourFormat = new SimpleDateFormat("HH:mm:ss");
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");

        String comentario = et1.getText().toString();
        String estrella = RBar.toString();
        if(comentario.equals("") & estrella.equals("")){
            Toast.makeText(this, "Inserte datos", Toast.LENGTH_LONG).show();
            return;
        }

        Intent i=getIntent();
        Bundle extras =i.getExtras();

        if (extras != null) {//ver si contiene datos
            datoNumero=(String)extras.get("numero");//Obtengo el nombre
            et3.setText("No. Taxi: "+datoNumero);
        }


        btncons.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new consulta().execute();
            }
        });

        setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT);

        //Insertamos los datos de la persona.
        insertar=(Button)findViewById(R.id.buttonEnviar);
        insertar.setOnClickListener(new View.OnClickListener(){

            @Override
            public void onClick(View v) {
                new Insertar(MainCalificar.this).execute();

            }

        });
    }


    //Inserta los datos de las Personas en el servidor.
    private boolean insertar(){
        HttpClient httpclient;
        List<NameValuePair> nameValuePairs;
        HttpPost httppost;
        httpclient=new DefaultHttpClient();
        httppost= new HttpPost("http://192.168.43.171/webservice/cali.php"); // Url del Servidor
        //Añadimos nuestros datos
        nameValuePairs = new ArrayList<NameValuePair>(3);
        nameValuePairs.add(new BasicNameValuePair("num_taxi",datoNumero));
        nameValuePairs.add(new BasicNameValuePair("calificacion",String.valueOf(RBar.getRating())));
        nameValuePairs.add(new BasicNameValuePair("comentario",et1.getText().toString()));




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
                        Toast.makeText(context, "datos insertados", Toast.LENGTH_LONG).show();
                        RBar.setRating(0);
                        et1.setText("");

                    }
                });
            else
                context.runOnUiThread(new Runnable(){
                    @Override
                    public void run() {
                        // TODO Auto-generated method stub
                        Toast.makeText(context, "fallo", Toast.LENGTH_LONG).show();
                    }
                });
            return null;
        }
    }

    public void alta(View v) throws IOException {
        AdminSQLiteOpenHelper admin = new AdminSQLiteOpenHelper(this,
                "servicio", null, 1);
        SQLiteDatabase bd = admin.getWritableDatabase();

        String calificacion = String.valueOf(RBar.getRating());
        String com = et1.getText().toString();
        String num = datoNumero;


        ContentValues registro = new ContentValues();
        registro.put("numtaxi",num);
        registro.put("calificacion",calificacion);
        registro.put("comentario", com);
        bd.insert("servicio", null, registro);

        bd.close();

        et1.setText("");
        RBar.setRating(0);
        Toast.makeText(this, "Se cargaron los datos",
                Toast.LENGTH_SHORT).show();
    }


    private class consulta extends AsyncTask<Void, Void, String> {

        @Override
        protected String doInBackground(Void... params) {
            // These two need to be declared outside the try/catch
            // so that they can be closed in the finally block.
            HttpURLConnection urlConnection = null;
            BufferedReader reader = null;

            // Will contain the raw JSON response as a string.
            String forecastJsonStr = null;

            try {

                URL url = new URL("http://192.168.43.171/webservice/consulta.php?num_taxi="+datoNumero);

                urlConnection = (HttpURLConnection) url.openConnection();
                urlConnection.setRequestMethod("GET");
                urlConnection.connect();

                // Read the input stream into a String
                InputStream inputStream = urlConnection.getInputStream();
                StringBuffer buffer = new StringBuffer();
                if (inputStream == null) {
                    // Nothing to do.


                    return null;
                }
                reader = new BufferedReader(new InputStreamReader(inputStream));

                String line;
                while ((line = reader.readLine()) != null) {
                    // Since it's JSON, adding a newline isn't necessary (it won't affect parsing)
                    // But it does make debugging a *lot* easier if you print out the completed
                    // buffer for debugging.
                    buffer.append(line + "\n");
                }

                if (buffer.length() == 0) {
                    // Stream was empty.  No point in parsing.
                    return null;
                }
                forecastJsonStr = buffer.toString();
                return forecastJsonStr;
            } catch (IOException e) {
                Log.e("PlaceholderFragment", "Error ", e);


                // If the code didn't successfully get the weather data, there's no point in attemping
                // to parse it.
                return null;
            } finally{
                if (urlConnection != null) {
                    urlConnection.disconnect();
                }
                if (reader != null) {
                    try {
                        reader.close();
                    } catch (final IOException e) {
                        Log.e("PlaceholderFragment", "Error closing stream", e);


                    }
                }
            }
        }

        @Override
        protected void onPostExecute(String s) {
            super.onPostExecute(s);
            TextCon.setText(s);
            Log.i("json", s);
        }
    }
}
