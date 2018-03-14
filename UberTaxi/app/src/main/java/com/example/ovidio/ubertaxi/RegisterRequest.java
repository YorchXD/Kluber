package com.example.ovidio.ubertaxi;

import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by ovidio on 24/01/2018.
 */

/**
 * Esta clase se encarga de enviar los datos de un nuevo usuario a la base de datos, registrando en la tabla usuario
 */
public class RegisterRequest extends StringRequest {

    private static final String REGISTER_REQUEST_URL = CommandNames.url+"Register.php";

    private HashMap<String,String> params;

    /**
     * Obtiene los datos de un nuevo usuario para registrarlo en la base de datos
     * @param nombre
     * @param correo
     * @param telefono
     * @param clave
     * @param direccion
     * @param apPaterno
     * @param apMaterno
     * @param listener
     */
    public RegisterRequest(String nombre, String correo, String telefono, String clave, String direccion,String apPaterno,
                           String apMaterno,Response.Listener<String> listener)
    {
        super(Method.POST, REGISTER_REQUEST_URL, listener, null);
        params = new HashMap<>();
        params.put("nombre",nombre);
        params.put("correo",correo);
        params.put("telefono",telefono);//el +"" es para transformar un int en String
        params.put("direccion",direccion);
        params.put("clave",clave);
        params.put("apPaterno",apPaterno);
        params.put("apMaterno",apMaterno);
    }

    @Override
    public HashMap<String, String> getParams() {
        return params;
    }
}
