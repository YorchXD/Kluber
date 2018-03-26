package com.example.ovidio.ubertaxi;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.toolbox.Volley;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Esta clase es la que controla el layout de acceso a la cuenta, lo que realiza es, una vez que el usuario ingresa su correo
 * y contraseña, seguido de eso presiona el boton iniciar, se envia estos datos a LoginRequest para que realice la consulta
 * si el cliente esta registra. En caso de que este procede a pasar a la pagina principal. Ademas, en caso de que no este registrado,
 * puede hacerlo desde el link que se encuentra en la parte inferior que dice "Registrese aquí", pasando al layout de registro.
 */
public class MainActivity extends AppCompatActivity
{

    private TextView tv_registrar;
    private Button btnIniciar;
    private EditText etCorreo, etPassword;

    /**
     * Inicializa los datos y obtiene el correo y la contraseña para enviarlo a LoginRequest
     *
     * @param savedInstanceState
     */
    @Override
    protected void onCreate(Bundle savedInstanceState)
    {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);


        tv_registrar = findViewById(R.id.registrar);

        tv_registrar.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {
                Intent intentReg = new Intent(MainActivity.this, Registro.class);
                MainActivity.this.startActivity(intentReg);
            }
        });

        etCorreo = (EditText) findViewById(R.id.EditT_Correo);
        etPassword = (EditText) findViewById(R.id.EditT_Contrasena);
        btnIniciar = (Button) findViewById(R.id.Btn_Iniciar);

        btnIniciar.setOnClickListener(new View.OnClickListener()
        {
            @Override
            public void onClick(View view)
            {

                final String correo = etCorreo.getText().toString();
                final String clave = etPassword.getText().toString();

                Response.Listener<String> responseListener = new Response.Listener<String>()
                {

                    @Override
                    public void onResponse(String response)
                    {
                        try
                        {
                            JSONObject jsonResponse = new JSONObject(response);
                            boolean success = jsonResponse.getBoolean("success");

                            if (success)
                            {
                                String nombre = jsonResponse.getString("nombre");
                                String telefono = jsonResponse.getString("telefono");

                                Log.d("Nombre", "" + nombre);

                                Intent intent = new Intent(MainActivity.this, Home.class);

                                /*Para pasar los datos(nombre,correo,telefono,clave) al otro activity (Home)*/
                                intent.putExtra("nombre", nombre);
                                intent.putExtra("correo", correo);
                                intent.putExtra("telefono", telefono);
                                intent.putExtra("clave", clave);

                                MainActivity.this.startActivity(intent);
                            }
                            else
                            {
                                CommandNames.alerta(MainActivity.this, "Error Login", "Intente nuevamente");
                            }
                        }
                        catch (JSONException e)
                        {
                            e.printStackTrace();
                        }
                    }
                };

                LoginRequest loginRequest = new LoginRequest(correo, clave, responseListener);
                RequestQueue queue = Volley.newRequestQueue(MainActivity.this);
                queue.add(loginRequest);
            }
        });
    }
}
