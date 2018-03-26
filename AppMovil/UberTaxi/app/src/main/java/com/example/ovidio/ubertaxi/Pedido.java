package com.example.ovidio.ubertaxi;

/**
 * Created by YorchXD on 09-03-2018.
 */

/**
 * Clase encargada de guardar los datos principales de un pedido para luego ser enviados a la base de datos
 */
public class Pedido
{
    private String nombre;
    private String apellido;
    private String inicio;
    private String fin;
    private String telefono;
    private String fecha;
    private String hora;
    private String latitudInicial;
    private String longitudInicial;
    private String latitudFinal;
    private String longitudFinal;
    private String distanciaEstimada;
    private String tiempoEstimado;
    private String segundosEstimados;
    private String costoEstimado;
    private String estado;

    /**
     * Constructor
     * @param nombre
     * @param apellido
     * @param inicio
     * @param fin
     * @param telefono
     * @param fecha
     * @param hora
     * @param latitudInicial
     * @param longitudInicial
     * @param latitudFinal
     * @param longitudFinal
     * @param distanciaEstimada
     * @param tiempoEstimado
     * @param segundosEstimados
     * @param costoEstimado
     */
    public Pedido(String nombre, String apellido, String inicio, String fin, String telefono, String fecha, String hora, String latitudInicial, String longitudInicial, String latitudFinal, String longitudFinal, String distanciaEstimada, String tiempoEstimado, int segundosEstimados,String costoEstimado)
    {
        this.nombre = nombre;
        this.apellido = apellido;
        this.inicio = inicio;
        this.fin = fin;
        this.telefono = telefono;
        this.fecha = fecha;
        this.hora = hora;
        this.latitudInicial = latitudInicial;
        this.longitudInicial = longitudInicial;
        this.latitudFinal = latitudFinal;
        this.longitudFinal = longitudFinal;
        this.distanciaEstimada = distanciaEstimada;
        this.tiempoEstimado = tiempoEstimado;
        this.segundosEstimados = String.valueOf(segundosEstimados);
        this.costoEstimado = costoEstimado;
        this.estado="esperando";

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
     * Devuelve el apellido de la persona responsable del pedido
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
     * Devuelve la direccion de origen de la trayectoria que desea la persona responsable del pedido
     * @return inicio
     */
    public String getInicio()
    {
        return inicio;
    }

    /**
     * Devuelve la direccion de origen de la trayectoria que desea la persona responsable del pedido
     * @param  inicio
     */
    public void setInicio(String inicio)
    {
        this.inicio = inicio;
    }

    /**
     * Devuelve la direccion de destino de la trayectoria que desea la persona responsable del pedido
     * @return fin
     */
    public String getFin()
    {
        return fin;
    }

    /**
     * Modifica la direccion de destino de la trayectoria que desea la persona responsable del pedido
     * @param  fin
     */
    public void setFin(String fin)
    {
        this.fin = fin;
    }

    /**
     * Devuelve el telefono de la persona responsable del pedido
     * @return telefono
     */
    public String getTelefono()
    {
        return telefono;
    }

    /**
     * Modifica el telefono de la persona responsable del pedido
     * @param  telefono
     */
    public void setTelefono(String telefono)
    {
        this.telefono = telefono;
    }

    /**
     * Devuelve la fecha en que se realiza la solicitud
     * @return fecha
     */
    public String getFecha()
    {
        return fecha;
    }

    /**
     * Modifica la fecha en que se realiza la solicitud
     * @param fecha
     */
    public void setFecha(String fecha)
    {
        this.fecha = fecha;
    }

    /**
     * Devuelve la hora en que se realiza la solicitud
     * @return hora
     */
    public String getHora()
    {
        return hora;
    }

    /**
     * Modifica la fecha en que se realiza la solicitud
     * @param hora
     */
    public void setHora(String hora)
    {
        this.hora = hora;
    }

    /**
     * Devueleve la latitud del punto de origen de la trayectoria
     * @return latitudInicial
     */
    public String getLatitudInicial()
    {
        return latitudInicial;
    }

    /**
     * Modifica la latitud del punto de origen de la trayectoria
     * @param latitudInicial
     */
    public void setLatitudInicial(String latitudInicial)
    {
        this.latitudInicial = latitudInicial;
    }

    /**
     * Muestra la longitud del punto de origen de la trayectoria
     * @return latitudInicial
     */
    public String getLongitudInicial()
    {
        return longitudInicial;
    }

    /**
     * Modifica la longitud del punto de origen de la trayectoria
     * @param longitudInicial
     */
    public void setLongitudInicial(String longitudInicial)
    {
        this.longitudInicial = longitudInicial;
    }

    /**
     * Muestra la latitud del punto de destino de la trayectoria
     * @return latitudFinal
     */
    public String getLatitudFinal()
    {
        return latitudFinal;
    }

    /**
     * Modifica la latitud del punto de destino de la trayectoria
     * @param latitudFinal
     */
    public void setLatitudFinal(String latitudFinal)
    {
        this.latitudFinal = latitudFinal;
    }

    /**
     * Muestra la longitud del punto de destino de la trayectoria
     * @return longitudFinal
     */
    public String getLongitudFinal()
    {
        return longitudFinal;
    }

    /**
     * Modifica la ongitud del punto de destino de la trayectoria
     * @param longitudFinal
     */
    public void setLongitudFinal(String longitudFinal)
    {
        this.longitudFinal = longitudFinal;
    }

    /**
     * Muestra la distancia estimada de la trayectoria
     * @return distanciaEstimada
     */
    public String getDistanciaEstimada()
    {
        return distanciaEstimada;
    }

    /**
     * Modifica la distancia estimada de la trayectoria
     * @param distanciaEstimada
     */
    public void setDistanciaEstimada(String distanciaEstimada)
    {
        this.distanciaEstimada = distanciaEstimada;
    }

    /**
     * Muestra el tiempo estimado en  que el taxista se demoraria en realizar la trayectoria. E
     * @return tiempoEstimado
     */
    public String getTiempoEstimado()
    {
        return tiempoEstimado;
    }

    /**
     * Modifica el tiempo estimado de una trayectoria
     * @param tiempoEstimado
     */
    public void setTiempoEstimado(String tiempoEstimado)
    {
        this.tiempoEstimado = tiempoEstimado;
    }

    /**
     * Muestra el tiempo estimado en que el taxista se demoraria en realizar la trayectoria (el tiempo esta en segundos).
     * Este tiempo incluye inicialmente el tiempo aproximado en que el taxista demoraria en llegar al punto de encuentro
     * ademas de lo que demoraria en realizar la carrera
     * @return segundosEstimados
     */
    public String getSegundosEstimados()
    {
        return segundosEstimados;
    }

    /**
     * Modifica el tiempo que se encuentra en segundos, el cual el taxista demora en llegar al lugar de origen
     * junto con el tiempo en que demora en realizar la trayectoria
     * @param segundosEstimados
     */
    public void setSegundosEstimados(String segundosEstimados)
    {
        this.segundosEstimados = segundosEstimados;
    }

    /**
     * Muestra el costo Estimado que puede tener una trayectoria
     * @return costoEstimado
     */
    public String getCostoEstimado()
    {
        return costoEstimado;
    }

    /**
     * Modifica el costo estimado que puede tener una trayectoria
     * @param costoEstimado
     */
    public void setCostoEstimado(String costoEstimado)
    {
        this.costoEstimado = costoEstimado;
    }

    /**
     * Muestra el estado en que se encuentra un pedido
     * @return estado
     */
    public String getEstado()
    {
        return estado;
    }

    /**
     * Modifica el estado en que se encuentra un pedido
     * @param estado
     */
    public void setEstado(String estado)
    {
        this.estado = estado;
    }
}
