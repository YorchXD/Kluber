package com.example.ovidio.ubertaxi;

/**
 * Created by YorchXD on 09-03-2018.
 */

/**
 * Esta clase se encarga de guardar los datos principales de una persona para realizar un pedido.
 * Esta clase, para este proyecto es ocupada por el metodo inciarProceso que se encuentra en la clase Home
 * para guardar los datos de la persona responsable de la solicitud. Estos datos quedan regitrados en la
 * tabla pedido de la base de datos.
 */
public class Persona
{
    private String nombre;
    private String apellido;
    private String telefono;

    /**
     * Constructor
     * @param nombre
     * @param apellido
     * @param telefono
     */
    public Persona(String nombre, String apellido, String telefono)
    {
        this.nombre = nombre;
        this.apellido = apellido;
        this.telefono = telefono;
    }


    /**
     * Devuelve el nombre de la persona responsable del pedido
     * @return nombre
     */
    public String getNombre()
    {
        return nombre;
    }

    /**
     * Modifica el nombre de la persona responsable del pedido
     * @param nombre
     */
    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    /**
     * Muestra el paellido de la persona responsable del pedido
     * @return apellido
     */
    public String getApellido()
    {
        return apellido;
    }

    /**
     * Modifica el apellido de la persona responsable del pedido
     * @param apellido
     */
    public void setApellido(String apellido)
    {
        this.apellido = apellido;
    }

    /**
     * Muestra el telefono de la persona responsable del pedido
     * @return telefono
     */
    public String getTelefono()
    {
        return telefono;
    }

    /**
     * Modifica el telefono de la persona responable del pedido
     * @param telefono
     */
    public void setTelefono(String telefono)
    {
        this.telefono = telefono;
    }
}
