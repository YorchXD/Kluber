package com.example.ovidio.ubertaxi;

import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

public class Registro extends AppCompatActivity implements View.OnClickListener {

    private EditText etNombre, etUsuario, etPassword, etEdad;
    private Button btnRegistrar;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_registro);

        etNombre = (EditText) findViewById(R.id.editT_Nombre);
        etUsuario = (EditText) findViewById(R.id.editT_Usuario);
        etPassword = (EditText) findViewById(R.id.editT_Contrasena);
        etEdad = (EditText) findViewById(R.id.editT_Edad);

        btnRegistrar = (Button) findViewById(R.id.Btn_Registrar);

        btnRegistrar.setOnClickListener(this);
        /*btnRegistrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(Registro.this,MainActivity.class);
                Registro.this.startActivity(intent);

            }
        });*/

    }

    @Override
    public void onClick(View view)
    {
        final String name= etNombre.getText().toString();
        final String userName= etUsuario.getText().toString();
        final String password= etPassword.getText().toString();
        final int age= Integer.parseInt(etEdad.getText().toString());

        Response.Listener<String> responseListener = new Response.Listener<String>(){

            @Override
            public void onResponse(String response) {
                try {
                    JSONObject jsonResponse = new JSONObject(response);
                    boolean success = jsonResponse.getBoolean("success");

                    if(success)
                    {
                        Intent intent = new Intent(Registro.this,MainActivity.class);
                        Registro.this.startActivity(intent);
                    }
                    else
                    {
                        AlertDialog.Builder builder = new AlertDialog.Builder(Registro.this);
                        builder.setMessage("Error Registro")
                                .setNegativeButton("Retry", null)
                                .create().show();
                    }

                } catch (JSONException e) {
                    e.printStackTrace();
                }
            }
        };

        RegisterRequest registerRequest = new RegisterRequest(name, userName,age, password, responseListener);

        RequestQueue queue = Volley.newRequestQueue(Registro.this);
        queue.add(registerRequest);
    }
}
