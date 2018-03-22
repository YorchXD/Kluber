<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    
    $id = $_POST["id"];
    /*$hora = $_POST["hora"];
    $lugarInicio = $_POST["lugarInicio"];
    $lugarDestino = $_POST["lugarDestino"];*/
    $statement = mysqli_prepare($con, "SELECT duracion FROM pedido WHERE id = ?");
    mysqli_stmt_bind_param($statement, "s",$id);
    mysqli_stmt_execute($statement);
    
    mysqli_stmt_store_result($statement);
    mysqli_stmt_bind_result($statement, $duracion);
    
    $response = array();
    $response["success"] = false;  

     while(mysqli_stmt_fetch($statement)){
        $response["success"] = true;  
        $response["duracion"] = $duracion;
    }
    
    echo json_encode($response);
?>