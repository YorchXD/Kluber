package com.example.ovidio.ubertaxi;

import android.util.Log;

import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by YorchXD on 09-03-2018.
 */

/**
 * Esta clase se encarga de registrar un pedido en la base de datos
 */
public class PedidoRequest extends StringRequest
{
    private static final String REGISTER_REQUEST_URL = CommandNames.url+"Pedido.php";

    private HashMap<String,String> params;

    /**
     * Aqui se solicitan los datos de un nuevo pedido para registrarlo en la base de datos y a su vez se devuelve el id
     * de este obtenido desde la base de datos.
     * @param pedido
     * @param listener
     */
    public PedidoRequest(Pedido pedido, Response.Listener<String> listener)
    {
        super(Method.POST, REGISTER_REQUEST_URL, listener, null);
        params = new HashMap<>();
        params.put("nombre",pedido.getNombre());
        params.put("apellido",pedido.getApellido());
        params.put("fecha",pedido.getFecha());
        params.put("hora",pedido.getHora());
        params.put("lugarInicio",pedido.getInicio());
        params.put("lugarDestino",pedido.getFin());
        params.put("latitudInicio",pedido.getLatitudInicial());
        params.put("longitudInicio",pedido.getLongitudInicial());
        params.put("latitudDestino",pedido.getLatitudFinal());
        params.put("longitudDestino",pedido.getLongitudFinal());
        params.put("distanciaEstimada",pedido.getDistanciaEstimada());
        params.put("tiempoEstimado",pedido.getTiempoEstimado());
        params.put("segundosEstimados", pedido.getSegundosEstimados());
        params.put("costoEstimado",pedido.getCostoEstimado());
        params.put("estado",pedido.getEstado());
        params.put("telefono",pedido.getTelefono());

        /*Se realizó solo para verifica si los datos se estaban enviando a esta clase*/
        /*Log.d("nombre: ", pedido.getNombre());
        Log.d("nombre: ", pedido.getApellido());
        Log.d("nombre: ", pedido.getFecha());
        Log.d("nombre: ", pedido.getHora());
        Log.d("nombre: ", pedido.getInicio());
        Log.d("nombre: ", pedido.getFin());
        Log.d("nombre: ", pedido.getLatitudInicial());
        Log.d("nombre: ", pedido.getLongitudInicial());
        Log.d("nombre: ", pedido.getLatitudFinal());
        Log.d("nombre: ", pedido.getLongitudFinal());
        Log.d("nombre: ", pedido.getDistanciaEstimada());
        Log.d("nombre: ", pedido.getTiempoEstimado());
        Log.d("nombre: ", pedido.getSegundosEstimados());
        Log.d("nombre: ", pedido.getCostoEstimado());
        Log.d("nombre: ", pedido.getEstado());
        Log.d("nombre: ", pedido.getTelefono());*/
    }

    @Override
    public HashMap<String, String> getParams() {
        return params;
    }
}
