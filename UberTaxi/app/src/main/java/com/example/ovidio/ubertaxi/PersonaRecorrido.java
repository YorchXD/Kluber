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

public class PersonaRecorrido extends AppCompatActivity {

    private EditText etRecorrido, etPersona;
    private String recorrido, persona;
    private Button btnRegistrar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        recorrido="";
        persona ="";
    }

    public PersonaRecorrido(String recorrido, String persona)
    {
        this.recorrido = recorrido;
        this.persona = persona;

        AgregarDatos();

    }

    public void AgregarDatos()
    {
        Response.Listener<String> responseListener = new Response.Listener<String>(){

            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    if(success)
                    {
                        Intent intent = new Intent(PersonaRecorrido.this,Home.class); //abre otro activiy (MainActivity)
                        PersonaRecorrido.this.startActivity(intent);
                    }
                    else
                    {
                        AlertDialog.Builder builder = new AlertDialog.Builder(PersonaRecorrido.this);
                        builder.setMessage("Error Registro")
                                .setNegativeButton("Retry", null)
                                .create().show();
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };

        PersonaRecorridoRequest personaRecorridoRequest = new PersonaRecorridoRequest(recorrido,persona,responseListener);

        RequestQueue queue = Volley.newRequestQueue(PersonaRecorrido.this);

        queue.add(personaRecorridoRequest);
    }

    public void setRecorrido(String recorrido)
    {
        this.recorrido = recorrido;
    }

    public void setPersona(String persona)
    {
        this.persona = persona;
    }

    /*@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_persona_recorrido);
        etRecorrido = (EditText) findViewById(R.id.editT_recorrido);
        etPersona = (EditText) findViewById(R.id.editT_persona);


        btnRegistrar = (Button) findViewById(R.id.Btn_RegistrarPersonaRecorrido);

       btnRegistrar.setOnClickListener(this);

    }*/


    /*@Override
    public void onClick(View view)
    {
        final String recorrido= etRecorrido.getText().toString();
        final String persona= etPersona.getText().toString();


        Response.Listener<String> responseListener = new Response.Listener<String>(){

            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    if(success)
                    {
                        Intent intent = new Intent(PersonaRecorrido.this,Home.class); //abre otro activiy (MainActivity)
                        PersonaRecorrido.this.startActivity(intent);
                    }
                    else
                    {
                        AlertDialog.Builder builder = new AlertDialog.Builder(PersonaRecorrido.this);
                        builder.setMessage("Error Registro")
                                .setNegativeButton("Retry", null)
                                .create().show();
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };

        PersonaRecorridoRequest personaRecorridoRequest = new PersonaRecorridoRequest(recorrido,persona,responseListener);

        RequestQueue queue = Volley.newRequestQueue(PersonaRecorrido.this);

        queue.add(personaRecorridoRequest);
    }*/
}
