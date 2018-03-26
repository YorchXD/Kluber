package com.example.ovidio.ubertaxi;

/**
 * Created by YorchXD on 09-03-2018.
 */


/**
 * Esta clase se encarga de guardar los datos de un recorrido los cuales seran utilizado para ser registrados en la base de datos
 * Esta instancia es creada en el metodo iniciarProceso que se encuentra en la clase Home
 */
public class Recorrido
{
    private String fecha;
    private String hora;
    private String inicio;
    private String destino;
    private String latitudOrig;
    private String longitudOrig;
    private String latitudDes;
    private String longitudDes;

    /**
     * Constructor
     * @param fecha
     * @param hora
     * @param inicio
     * @param destino
     * @param latitudOrig
     * @param longitudOrig
     * @param latitudDes
     * @param longitudDes
     */
    public Recorrido(String fecha, String hora, String inicio, String destino, String latitudOrig, String longitudOrig, String latitudDes, String longitudDes)
    {
        this.fecha = fecha;
        this.hora = hora;
        this.inicio = inicio;
        this.destino = destino;
        this.latitudOrig = latitudOrig;
        this.longitudOrig = longitudOrig;
        this.latitudDes = latitudDes;
        this.longitudDes = longitudDes;
    }

    /**
     * Muestra la fecha en que se solicita el recorrido
     * @return fecha
     */
    public String getFecha()
    {
        return fecha;
    }

    /**
     * Modifica la fecha en que se solicita el recorrido
     * @param fecha
     */
    public void setFecha(String fecha)
    {
        this.fecha = fecha;
    }

    /**
     * Muestra la hora en que se solicita el recorrido
     * @return hora
     */
    public String getHora()
    {
        return hora;
    }

    /**
     * Modifica la hora en que se solicita el recorrido
     * @param hora
     */
    public void setHora(String hora)
    {
        this.hora = hora;
    }

    /**
     * Muestra la el lugar de origen de la solicitud de recorrido
     * @return inicio
     */
    public String getInicio()
    {
        return inicio;
    }

    /**
     * Modifica el lugar de inicio de la solicitud del recorrido
     * @param inicio
     */
    public void setInicio(String inicio)
    {
        this.inicio = inicio;
    }

    /**
     * Muestra el lugar de destino de la solicitud de recorrido
     * @return destino
     */
    public String getDestino()
    {
        return destino;
    }

    /**
     * Modifica el lugar de destino de la solicitud del recorrido
     * @param destino
     */
    public void setDestino(String destino)
    {
        this.destino = destino;
    }

    /**
     * Muestra la latitud de origen de la solicitud de recorrido
     * @return latitudOrig
     */
    public String getLatitudOrig()
    {
        return latitudOrig;
    }

    /**
     * Modifica la latitud de origen de la solicitud de recorrido
     * @param latitudOrig
     */
    public void setLatitudOrig(String latitudOrig)
    {
        this.latitudOrig = latitudOrig;
    }

    /**
     * Muestra la longitud de origen de la solicitud de recorrido
     * @return longitudOrig
     */
    public String getLongitudOrig()
    {
        return longitudOrig;
    }

    /**
     * Modifica la longitud de origen de la solicitud de recorrido
     * @param longitudOrig
     */
    public void setLongitudOrig(String longitudOrig)
    {
        this.longitudOrig = longitudOrig;
    }

    /**
     * Muestra la latitud de destino de la solicitud de recorrido
     * @return latitudDes
     */
    public String getLatitudDes()
    {
        return latitudDes;
    }

    /**
     * Modifica la latitud de destino de la solicitud de recorrido
     * @param latitudDes
     */
    public void setLatitudDes(String latitudDes)
    {
        this.latitudDes = latitudDes;
    }

    /**
     * Muestra la longitud de destino de la solicitud de recorrido
     * @return longitudDes
     */
    public String getLongitudDes()
    {
        return longitudDes;
    }

    /**
     * Modifica la longitud de destino de la solicitud de recorrido
     * @param longitudDes
     */
    public void setLongitudDes(String longitudDes)
    {
        this.longitudDes = longitudDes;
    }
}
