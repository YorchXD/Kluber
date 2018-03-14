<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    /*Capta los datos*/
    $fecha = $_POST["fecha"];
    $hora = $_POST["hora"];
    $lugarInicio = $_POST["lugarInicio"];
    $lugarDestino = $_POST["lugarDestino"];
    $latitudInicio = $_POST["latitudInicio"];
    $longitudInicio = $_POST["longitudInicio"];
    $latitudDestino = $_POST["latitudDestino"];
    $longitudDestino = $_POST["longitudDestino"];
    $refPedido = $_POST["refPedido"];

    /*Inserta los datos*/
    $statement = mysqli_prepare($con, "INSERT INTO recorrido (fecha, hora,lugarInicio, lugarDestino,latitudInicio, longitudInicio, latitudDestino, longitudDestino, RefPedido) VALUES (?, ?, ?, ?,?,?,?,?, ?)");
    mysqli_stmt_bind_param($statement, "sssssssss", $fecha, $hora,$lugarInicio, $lugarDestino,$latitudInicio, $longitudInicio, $latitudDestino, $longitudDestino, $refPedido);
    mysqli_stmt_execute($statement);

    $response = array();
    $response["success"] = true;  
    $response["id"] = mysqli_insert_id($con);

    
    echo json_encode($response);
?>