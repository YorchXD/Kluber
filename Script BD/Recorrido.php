<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    
    $fecha = $_POST["fecha"];
    $hora = $_POST["hora"];
    $lugarInicio = $_POST["lugarInicio"];
    $lugarDestino = $_POST["lugarDestino"];
    $latitudInicio = $_POST["latitudInicio"];
    $longitudInicio = $_POST["longitudInicio"];
    $latitudDestino = $_POST["latitudDestino"];
    $longitudDestino = $_POST["longitudDestino"];

    $statement = mysqli_prepare($con, "INSERT INTO recorrido (fecha, hora,lugarInicio, lugarDestino,latitudInicio, longitudInicio, latitudDestino, longitudDestino) VALUES (?, ?, ?, ?,?,?,?,?)");
    mysqli_stmt_bind_param($statement, "ssssssss", $fecha, $hora,$lugarInicio, $lugarDestino,$latitudInicio, $longitudInicio, $latitudDestino, $longitudDestino);
    mysqli_stmt_execute($statement);

    
    $response = array();
    $response["success"] = true;  

    
    echo json_encode($response);
?>