package com.example.ovidio.ubertaxi;

import android.content.Context;
import android.support.v7.app.AlertDialog;

/**
 * Created by YorchXD on 30-01-2018.
 */

/**
 * Esta clase sirve para crear tanto metodos como variables generales.
 */
public class CommandNames
{
    public static final String url = "http://192.168.0.14/Usuario/";

    /**
     * Sirve para crear cualquier alerta
     * @param context sirve para que el mensaje se cree sobre el layout que lo mando a llamar
     * @param titulo
     * @param msj
     */
    public static void alerta(Context context, String titulo, String msj)
    {
        AlertDialog.Builder builder = new AlertDialog.Builder(context);
        builder.setMessage(titulo)
                .setNegativeButton(msj, null)
                .create().show();
    }
}
