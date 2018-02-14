package com.example.ovidio.ubertaxi;

import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Recorrido extends AppCompatActivity implements View.OnClickListener{

    private EditText etFecha, etHora, etInicio, etDestino;
    private Button btnRegistrar;
    private Date Fecha;
    private DateFormat hourFormat, dateFormat;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_recorrido);

        //PersonaRecorrido personaRecorrido = new PersonaRecorrido("3","f");
        etFecha = (EditText) findViewById(R.id.editT_Fecha);
        etHora = (EditText) findViewById(R.id.editT_Hora);
        etInicio = (EditText) findViewById(R.id.editT_LugarInicio);
        etDestino = (EditText) findViewById(R.id.editT_LugarDestino);

        Fecha = new Date();

        hourFormat = new SimpleDateFormat("HH:mm:ss");

        //String hora = String.valueOf(Fecha.getDate());

        Log.d("Fecha","Hora: "+hourFormat.format(Fecha));

        dateFormat = new SimpleDateFormat("yyyy/MM/dd");

        Log.d("Fecha","Fecha: "+dateFormat.format(Fecha));

        AgregarDatos();


        btnRegistrar = (Button) findViewById(R.id.Btn_RegistrarRecorrido);

        btnRegistrar.setOnClickListener(this);

    }

    public void AgregarDatos()
    {
        final String fecha= dateFormat.format(Fecha);
        final String hora= hourFormat.format(Fecha);
        //final String inicio= etInicio.getText().toString();
        //final String destino= etDestino.getText().toString();
        final String inicio="pruebaS";
        final String destino="pruebaS";


        Response.Listener<String> responseListener = new Response.Listener<String>(){

            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    if(success)
                    {

                        //personaRecorrido.setRecorrido("3");
                        //personaRecorrido.setPersona("f");

                        Intent intent = new Intent(Recorrido.this,Home.class); //abre otro activiy (MainActivity)
                        Recorrido.this.startActivity(intent);
                    }
                    else
                    {
                        AlertDialog.Builder builder = new AlertDialog.Builder(Recorrido.this);
                        builder.setMessage("Error Registro")
                                .setNegativeButton("Retry", null)
                                .create().show();
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };

        RecorridoRequest recorridoRequest = new RecorridoRequest(fecha, hora,inicio, destino,responseListener);



        RequestQueue queue = Volley.newRequestQueue(Recorrido.this);
        queue.add(recorridoRequest);

    }

    @Override
    public void onClick(View view)
    {
        final String fecha= dateFormat.format(Fecha);
        final String hora= hourFormat.format(Fecha);
        final String inicio= etInicio.getText().toString();
        final String destino= etDestino.getText().toString();


        Response.Listener<String> responseListener = new Response.Listener<String>(){

            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    if(success)
                    {

                        //personaRecorrido.setRecorrido("3");
                        //personaRecorrido.setPersona("f");

                        Intent intent = new Intent(Recorrido.this,Home.class); //abre otro activiy (MainActivity)
                        Recorrido.this.startActivity(intent);
                    }
                    else
                    {
                        AlertDialog.Builder builder = new AlertDialog.Builder(Recorrido.this);
                        builder.setMessage("Error Registro")
                                .setNegativeButton("Retry", null)
                                .create().show();
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };

        RecorridoRequest recorridoRequest = new RecorridoRequest(fecha, hora,inicio, destino,responseListener);



        RequestQueue queue = Volley.newRequestQueue(Recorrido.this);
        queue.add(recorridoRequest);




        /*PersonaRecorridoRequest personaRecorridoRequest = new PersonaRecorridoRequest("4","2",responseListener);

        RequestQueue queue2 = Volley.newRequestQueue(Recorrido.this);

        queue2.add(personaRecorridoRequest);*/



    }

    public void setRecorrido(String recorrido)
    {

    }
}
