package com.example.ovidio.ubertaxi;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by Fito on 14-02-2018.
 */

public class ConsultaRecorridoRequest extends StringRequest {

    private static final String REGISTER_REQUEST_URL = CommandNames.url+"ConsultaRecorrido.php";

    private HashMap<String,String> params;

    public ConsultaRecorridoRequest(String fecha,String hora,String lugarInicio,String lugarDestino, Response.Listener<String> listener)
    {
        super(Method.POST, REGISTER_REQUEST_URL, listener, null);
        params = new HashMap<>();
        params.put("fecha",fecha);
        params.put("hora",hora);
        params.put("lugarInicio",lugarInicio);
        params.put("lugarDestino",lugarDestino);
    }

    @Override
    public HashMap<String, String> getParams() {
        return params;
    }
}
