package com.example.ovidio.ubertaxi;

import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by Fito on 12-02-2018.
 */

public class PersonaRecorridoRequest extends StringRequest {

    private static final String REGISTER_REQUEST_URL = CommandNames.url+"PersonaRecorrido.php";

    private HashMap<String,String> params;

    public PersonaRecorridoRequest(String refRecorrido, String refPersona, Response.Listener<String> listener)
    {
        super(Method.POST, REGISTER_REQUEST_URL, listener, null);
        params = new HashMap<>();
        params.put("refRecorrido",refRecorrido);
        params.put("refPersona",refPersona);
    }

    @Override
    public HashMap<String, String> getParams() {
        return params;
    }
}
