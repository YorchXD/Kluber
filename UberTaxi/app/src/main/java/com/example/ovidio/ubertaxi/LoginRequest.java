package com.example.ovidio.ubertaxi;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by ovidio on 29/01/2018.
 */

public class LoginRequest extends StringRequest{
    private static final String lOGIN_REQUEST_URL = "http://192.168.0.13/Login.php";

    private HashMap<String,String> params;

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
