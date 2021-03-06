package com.example.ovidio.ubertaxi;

import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by Fito on 12-02-2018.
 */

public class RecorridoRequest extends StringRequest {

    private static final String REGISTER_REQUEST_URL = CommandNames.url+"Recorrido.php";

    private HashMap<String,String> params;

    public RecorridoRequest(String fecha, String hora, String lugarInicio, String lugarDestino,
                            String latitudInicio, String longitudInicio, String latitudDestino, String longitudDestino,
                            Response.Listener<String> listener)
    {
        super(Method.POST, REGISTER_REQUEST_URL, listener, null);
        params = new HashMap<>();
        params.put("fecha",fecha);
        params.put("hora",hora);
        params.put("lugarInicio",lugarInicio);
        params.put("lugarDestino",lugarDestino);
        params.put("latitudInicio",latitudInicio);
        params.put("longitudInicio",longitudInicio);
        params.put("latitudDestino",latitudDestino);
        params.put("longitudDestino",longitudDestino);
    }

    @Override
    public HashMap<String, String> getParams() {
        return params;
    }
}
