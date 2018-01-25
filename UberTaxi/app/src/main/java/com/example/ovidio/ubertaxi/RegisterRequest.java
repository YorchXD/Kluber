package com.example.ovidio.ubertaxi;

import com.android.volley.Response;
import com.android.volley.toolbox.StringRequest;

import java.util.HashMap;

/**
 * Created by ovidio on 24/01/2018.
 */

public class RegisterRequest extends StringRequest {

    private static final String REGISTER_REQUEST_URL = "http://localhost/Register.php";

    private HashMap<String,String> params;

    public RegisterRequest(String name, String username, int age, String password, Response.Listener<String> listener)
    {
        super(Method.POST, REGISTER_REQUEST_URL, listener, null);
        params = new HashMap<>();
        params.put("name",name);
        params.put("username",username);
        params.put("edad",age+"");//el +"" es para transformar un int en String
        params.put("password",password);
    }

    @Override
    public HashMap<String, String> getParams() {
        return params;
    }
}
