<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    
    /*Capta los datos*/
    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $fecha = $_POST["fecha"];
    $hora = $_POST["hora"];
    $lugarInicio = $_POST["lugarInicio"];
    $lugarDestino = $_POST["lugarDestino"];
    $latitudInicio = $_POST["latitudInicio"];
    $longitudInicio = $_POST["longitudInicio"];
    $latitudDestino = $_POST["latitudDestino"];
    $longitudDestino = $_POST["longitudDestino"];
    $distanciaEstimada = $_POST["distanciaEstimada"];
    $tiempoEstimado = $_POST["tiempoEstimado"];
    $segundosEstimados = $_POST["segundosEstimados"];
    $costoEstimado = $_POST["costoEstimado"];
    $estado = $_POST["estado"];
    $telefono = $_POST["telefono"];
    $tiempoEsperaComienzo = "00:10:00"; 
    $duracion = "00:00:00"; 
    $segundosEsperaComienzo = 600;
    $refTaxista ="1";


    /*Inserta los datos*/
    $statement = mysqli_prepare($con, "INSERT INTO pedido (nombre, apellido, fecha, hora, direccionInicial, direccionFinal, latitudInicial, longitudInicial, latitudFinal, longitudFinal, distanciaEstimada, tiempoEstimado, segundosEstimados, costoEstimado, estado, telefono, tiempoEsperaComienzo, segundosEsperaComienzo , RefChoferTaxista, duracion ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ?, ?)");
    mysqli_stmt_bind_param($statement, "ssssssssssssssssssss", $nombre, $apellido, $fecha, $hora, $lugarInicio, $lugarDestino, $latitudInicio, $longitudInicio, $latitudDestino, $longitudDestino, $distanciaEstimada, $tiempoEstimado, $segundosEstimados , $costoEstimado, $estado, $telefono, $tiempoEsperaComienzo, $segundosEsperaComienzo, $refTaxista, $duracion);
    mysqli_stmt_execute($statement);

    $response = array();
    $response["success"] = true;  
    $response["id"] = mysqli_insert_id($con);

    
    echo json_encode($response);
?>