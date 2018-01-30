package com.example.ovidio.ubertaxi;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class Usuario extends AppCompatActivity {

    TextView tvNombre, tvCorreo, tvTelefono, tvPassword;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_usuario);

        tvNombre = findViewById(R.id.textV_Nombre);
        tvCorreo = findViewById(R.id.textV_Correo);
        tvTelefono = findViewById(R.id.textV_Telefono);
        tvPassword = findViewById(R.id.textV_Contrasena);

        Intent intent = getIntent();
        String nombre = intent.getStringExtra("nombre");
        String correo = intent.getStringExtra("correo");
        String telefono = intent.getStringExtra("telefono");
        String password = intent.getStringExtra("clave");

        tvNombre.setText(nombre);
        tvCorreo.setText(correo);
        tvTelefono.setText(telefono);
        tvPassword.setText(password);

    }
}
