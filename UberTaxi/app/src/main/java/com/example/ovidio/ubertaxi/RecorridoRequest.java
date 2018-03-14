package com.example.ovidio.ubertaxi;

import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by Fito on 12-02-2018.
 */

/**
 * Esta clase se encarga de enviar los datos de un recorrido a la base de dato junto con el id del pedido,
 * la cual es la referencia del pedido realizado por el usuario. Estos datos son registrados en la tabla recorrido
 */
public class RecorridoRequest extends StringRequest {

    private static final String REGISTER_REQUEST_URL = CommandNames.url+"Recorrido.php";

    private HashMap<String,String> params;

    /**
     * Los datos se obtienen de una instancia llamada recorrido que se envia desde la clase Home. Aqui se encuentran los datos
     * de un recorrido.
     * @param recorrido
     * @param refPedido
     * @param listener
     */
    public RecorridoRequest(Recorrido recorrido, String refPedido, Response.Listener<String> listener)
    {
        super(Method.POST, REGISTER_REQUEST_URL, listener, null);
        params = new HashMap<>();
        params.put("fecha",recorrido.getFecha());
        params.put("hora",recorrido.getHora());
        params.put("lugarInicio",recorrido.getInicio());
        params.put("lugarDestino",recorrido.getDestino());
        params.put("latitudInicio",recorrido.getLatitudOrig());
        params.put("longitudInicio",recorrido.getLongitudOrig());
        params.put("latitudDestino",recorrido.getLatitudDes());
        params.put("longitudDestino",recorrido.getLongitudDes());
        params.put("refPedido",refPedido);
    }

    @Override
    public HashMap<String, String> getParams() {
        return params;
    }
}
