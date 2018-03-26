package com.example.ovidio.ubertaxi;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by YorchXD on 13-03-2018.
 */

/**
 * Esta clase se encarga de obtener los precios de un recorrido
 */
public class ConsultarPreciosRequest extends StringRequest
{
    private static final String REGISTER_REQUEST_URL = CommandNames.url+"ConsultarPrecios.php";

    private HashMap<String,String> params;

    /**
     * Constructor
     * En este caso como los precios siempre se guardan en una sola fila de la tabla precios en la base
     * de datos, el id donde se encuentran los precios siempre es 1
     * @param listener
     */
    public ConsultarPreciosRequest(Response.Listener<String> listener)
    {
        super(Request.Method.POST, REGISTER_REQUEST_URL, listener, null);
        params = new HashMap<>();
        params.put("id","1"); //1 es el id donde se encuentran los precios en la tabla de la base de datos llamada precios
    }

    @Override
    public HashMap<String, String> getParams() {
        return params;
    }
}
