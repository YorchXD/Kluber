<?php
    
    //Datos para la conexión con el servidor
    $servidor   = "localhost";
    $nombreBD   = "kluber";
    $usuario    = "root";
    $contrasena = "";

    //Creando la conexión, nuevo objeto mysqli
    $conexion = new mysqli($servidor,$usuario,$contrasena,$nombreBD);
    //Si sucede algún error la función muere e imprimir el error

    if($conexion->connect_error)
    {
        die("Error en la conexion : ".$conexion->connect_errno."-".$conexion->connect_error);
    }

?>