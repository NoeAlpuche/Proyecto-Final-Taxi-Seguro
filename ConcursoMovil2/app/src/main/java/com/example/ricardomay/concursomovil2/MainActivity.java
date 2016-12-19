package com.example.ricardomay.concursomovil2;
/*
    Numero de control:12390214
    Nombre del alumno: Noe Jesús Alpuche Villanueva
    Correo electronico: alvi619@hotmail.com
    Numero de control: 12390221
    Nombre del alumno: Ruxandra Azucely Caamal Sánchez
    Correo electronico: ruxandracammalsanchez94@gmail.com
    Numero de control: 12390230
    Nombre del alumno: Fermi Altair Durán Gorocica
    Correo electronico: fermidurn@yahoo.com.mx
    Numero de control:12390243
    Nombre del alumno: Ricardo Jesús May Chalé
    Correo electronico:Ricardo.chalheeziithoo@hotmail.com

    Aula: V09
    Semestre: 9no.
    Descripción del problema: Debido a la inseguridad sufrida en Chetumal
    se desea desarrollar una app, en la cual se brinde a los usuarios la información generale del taxi,
    así como el de su conductor, los cuales podrán ser enviados a través de un mensaje de texto al
    contacto que el usuario desee.

 */
import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import org.json.JSONArray;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;


//Clase principal Main Activity
public class MainActivity extends AppCompatActivity implements View.OnClickListener{

    Button btnIngresar;
    EditText txtUsu, txtPas;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtUsu=(EditText)findViewById(R.id.txtusu);
        txtPas=(EditText)findViewById(R.id.txtpas);
        btnIngresar=(Button)findViewById(R.id.btnIngresar);

        btnIngresar.setOnClickListener(this);
    }
    /*
    public void tarifa(View view){
        Intent i = new Intent (this, registro.class);
        startActivity(i);
    }
    ¨*/

    @Override
    public void onClick(View v) {
        Thread tr=new Thread(){
            @Override
            public void run() {
                final String resultado=enviarDatosGET(txtUsu.getText().toString(), txtPas.getText().toString());
                runOnUiThread(new Runnable() {
                    @Override
                    public void run() {
                        int r=obtDatosJSON(resultado);
                        if (r>0){
                            Intent i=new Intent(getApplicationContext(),MainSistema.class);
                            startActivity(i);
                        }else{
                            Toast.makeText(getApplicationContext(),"Usuario o Pass incorrectos", Toast.LENGTH_LONG).show();
                        }
                    }
                });
            }

        };
        tr.start();
    }

    public String enviarDatosGET(String usu, String pas){
        URL url=null;
        String linea="";
        int respuesta=0;
        StringBuilder resul=null;

        try{
            url=new URL("http://192.168.43.171/webservice/valida.php?usu="+usu+"&pas="+pas);
            HttpURLConnection conection=(HttpURLConnection)url.openConnection();
            respuesta=conection.getResponseCode();

            resul=new StringBuilder();

            if(respuesta==HttpURLConnection.HTTP_OK){
                InputStream in=new BufferedInputStream(conection.getInputStream());
                BufferedReader reader=new BufferedReader(new InputStreamReader(in));

                while((linea=reader.readLine())!=null){
                    resul.append(linea);
                }
            }
        }catch (Exception e){

        }
        return resul.toString();
    }

    public int obtDatosJSON(String response){
        int res=0;

        try{
            JSONArray json=new JSONArray(response);
            if(json.length()>0){
                res=1;
            }
        }catch (Exception e){
        }
        return res;
    }

    public void registro(View v) {
        Intent i = new Intent(this, MainRegistro.class);
        startActivity(i);
    }
    /*
    //Variables globales
    EditText editTextUsuario, editTextPassword;
    //Metodo encargado de inicializar la actividad
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //Obtenemos una referencia a los controles de la interfaz
        editTextUsuario=(EditText) findViewById(R.id.editTextUsuario);
        editTextPassword=(EditText) findViewById(R.id.editTextPassword);

    }
    //llamamos al método ingresar de la clase Intent. Tiene dos parámetros de tipo String, en el primero indicamos el nombre del dato y en el segundo el valor del dato:
    public void ingresar(View v) {
        if(editTextUsuario.getText().toString().equals("admin") && editTextPassword.getText().toString().equals("admin")){
            Intent i = new Intent(this, MainSistema.class );
            //Creamos la información a pasar entre actividades
            i.putExtra("Usuario", editTextUsuario.getText().toString());
            startActivity(i);
            //Envio de mensajes en la pantalla
            Toast.makeText(getApplicationContext(),"Iniciando sistema...", Toast.LENGTH_SHORT).show();
        }else {
            Toast.makeText(getApplicationContext(), "Error de inicio de sistema...", Toast.LENGTH_SHORT).show();
        }
    }
    //llamamos al método registro de la clase Intent. Tiene dos parámetros de tipo String, en el primero indicamos el nombre del dato y en el segundo el valor del dato:
    public void registro(View v) {
        Intent i = new Intent(this, MainRegistro.class);
        startActivity(i);
    }*/
}
