package com.example.ovidio.ubertaxi;

import android.content.Intent;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

import java.awt.font.TextAttribute;

public class MainActivity extends AppCompatActivity {

    private TextView tv_registrar;
    private Button btnIniciar;

    private EditText etCorreo, etPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        tv_registrar=findViewById(R.id.registrar);

        tv_registrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intentReg = new Intent(MainActivity.this, Registro.class);
                MainActivity.this.startActivity(intentReg);
            }
        });

        etCorreo=(EditText) findViewById(R.id.EditT_Correo);
        etPassword=(EditText) findViewById(R.id.EditT_Contrasena);

        btnIniciar = (Button) findViewById(R.id.Btn_Iniciar);

        btnIniciar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                final String correo= etCorreo.getText().toString();
                final String clave= etPassword.getText().toString();

                Response.Listener<String> responseListener = new Response.Listener<String>(){

                    @Override
                    public void onResponse(String response) {
                        try {
                            JSONObject jsonResponse = new JSONObject(response);
                            boolean success = jsonResponse.getBoolean("success");

                            if(success)
                            {
                                String nombre = jsonResponse.getString("nombre");
                                String telefono = jsonResponse.getString("telefono");

                                Intent intent = new Intent(MainActivity.this,Home.class);

                                intent.putExtra("nombre",nombre);
                                intent.putExtra("correo",correo);
                                intent.putExtra("telefono",telefono);
                                intent.putExtra("clave",clave);

                                MainActivity.this.startActivity(intent);
                            }
                            else
                            {
                                AlertDialog.Builder builder = new AlertDialog.Builder(MainActivity.this);
                                builder.setMessage("Error Login")
                                        .setNegativeButton("Retry", null)
                                        .create().show();
                            }

                        }
                        catch (JSONException e) {
                            e.printStackTrace();
                        }
                    }
                };

                LoginRequest loginRequest = new LoginRequest(correo, clave,responseListener);

                RequestQueue queue = Volley.newRequestQueue(MainActivity.this);
                queue.add(loginRequest);
            }
        });
    }
}
