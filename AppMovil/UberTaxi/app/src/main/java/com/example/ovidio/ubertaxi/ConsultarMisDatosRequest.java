package com.example.ovidio.ubertaxi;

import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

import com.android.volley.Response;

/**
 * Created by YorchXD on 09-03-2018.
 */

/**
 * Esta clase se encarga de realizar consultar los datos del usuario que se requieren para el pedido
 */
public class ConsultarMisDatosRequest extends StringRequest
{
    private static final String REGISTER_REQUEST_URL = CommandNames.url+"ConsultarMisDatos.php";

    private HashMap<String,String> params;

    /**
     * Para solicitar los datos del usuario se requiere del id que en este caso es el correo
     * luego la bd nos devolvera el nombre, apellido y el telefono
     * @param id
     * @param listener
     */
    public ConsultarMisDatosRequest(String id, Response.Listener<String> listener)
    {
        super(Method.POST, REGISTER_REQUEST_URL, listener, null);
        params = new HashMap<>();
        params.put("id",id);
    }

    @Override
    public HashMap<String, String> getParams() {
        return params;
    }
}



