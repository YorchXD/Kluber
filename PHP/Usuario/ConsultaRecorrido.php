<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    
    $fecha = $_POST["fecha"];
    $hora = $_POST["hora"];
    $lugarInicio = $_POST["lugarInicio"];
    $lugarDestino = $_POST["lugarDestino"];
    $statement = mysqli_prepare($con, "SELECT * FROM recorrido WHERE fecha = ? AND hora = ? AND lugarInicio = ? AND lugarDestino = ?");
    mysqli_stmt_bind_param($statement, "ssss",$fecha,$hora,$lugarInicio,$lugarDestino);
    mysqli_stmt_execute($statement);


    mysqli_stmt_store_result($statement);
    mysqli_stmt_bind_result($statement, $id, $fecha, $hora, $lugarInicio, $lugarDestino, $latitudInicio, $longitudInicio, $latitudDestino, $longitudDestino);
    
    $response = array();
    $response["success"] = false;  

     while(mysqli_stmt_fetch($statement)){
        $response["success"] = true;  
        $response["id"] = $id;
    }
    
    echo json_encode($response);
?>