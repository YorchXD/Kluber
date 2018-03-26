package com.example.ovidio.ubertaxi;

import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by Fito on 12-02-2018.
 */

/**
 * Esta clase se encarga de enviar los id del usuario y del recorrido recien creado a la base de datos
 * a la tabla persona recorrido.
 */
public class PersonaRecorridoRequest extends StringRequest {

    private static final String REGISTER_REQUEST_URL = CommandNames.url+"PersonaRecorrido.php";

    private HashMap<String,String> params;

    /**
     * Para completar la solicitud se necesita el id del recorrido y el id de la persona
     * Al concretarse estos datos en la base de datos se da por finalizado el proceso de solicitud y se espera a que el ejecutivo
     * le asigne un taxi
     * @param refRecorrido
     * @param refPersona
     * @param listener
     */
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
