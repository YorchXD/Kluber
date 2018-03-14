package com.example.ovidio.ubertaxi;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by ovidio on 29/01/2018.
 */

/**
 * Esta clase se encarga de consultar si el usuario se encuentra registrado y si los datos de acceso son los correctos
 */
public class LoginRequest extends StringRequest{
    private static final String lOGIN_REQUEST_URL = CommandNames.url+"Login.php";

    private HashMap<String,String> params;

    /**
     * Desde la clase MainActivity se envia los datos capturados que son el correo y la contraseñña
     * los cuales son los datos de acceso para preguntar si la persona esta registrada o no.
     * @param correo
     * @param password
     * @param listener
     */
    public LoginRequest(String correo,String password, Response.Listener<String> listener)
    {
        super(Request.Method.POST, lOGIN_REQUEST_URL, listener, null);
        params = new HashMap<>();
        params.put("correo",correo);
        params.put("clave",password);
    }

    @Override
    public HashMap<String, String> getParams() {
        return params;
    }
}
