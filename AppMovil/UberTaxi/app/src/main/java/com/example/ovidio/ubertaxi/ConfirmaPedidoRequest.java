package com.example.ovidio.ubertaxi;

import android.util.Log;

import com.android.volley.Request;
import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by Fito on 17-03-2018.
 */

public class ConfirmaPedidoRequest extends StringRequest
{
    private static final String URL = CommandNames.url+"ConsultaConfirmaPedido.php";

    private HashMap<String,String> params;

    /**
     * Desde la clase ConfirmaPedidoRequest se envia los datos capturados que son el id
     * los cuales ses el dato de acceso para capturar el pedido desde la BD
     * @param listener
     */
    public ConfirmaPedidoRequest(String id, Response.Listener<String> listener)
    {

        super(Request.Method.POST, URL, listener, null);
        params = new HashMap<>();
        params.put("id",id);
        /*params.put("hora",pedido.getHora());
        params.put("lugarInicio",pedido.getInicio());
        params.put("lugarDestino",pedido.getFin());*/
    }

    @Override
    public HashMap<String, String> getParams()
    {
        return params;
    }
}
