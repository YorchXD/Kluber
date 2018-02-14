<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    
    $fecha = $_POST["fecha"];
    $hora = $_POST["hora"];
    $lugarDestino = $_POST["lugarDestino"];
    $lugarInicio = $_POST["lugarInicio"];
    $lugarDestino = $_POST["lugarDestino"];
    $statement = mysqli_prepare($con, "INSERT INTO recorrido (fecha, hora,lugarInicio, lugarDestino) VALUES (?, ?, ?, ?)");
    mysqli_stmt_bind_param($statement, "ssss", $fecha, $hora,$lugarInicio, $lugarDestino);
    mysqli_stmt_execute($statement);

    
    $response = array();
    $response["success"] = true;  

    
    echo json_encode($response);
?>