<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    
    $id = $_POST["id"];
    $statement = mysqli_prepare($con, "SELECT nombre, apPaterno, telefono FROM persona WHERE correo = ? ");
    mysqli_stmt_bind_param($statement, "s",$id);
    mysqli_stmt_execute($statement);


    mysqli_stmt_store_result($statement);
    mysqli_stmt_bind_result($statement, $nombre, $apPaterno, $telefono);
    
    $response = array();
    $response["success"] = false;  

     while(mysqli_stmt_fetch($statement)){
        $response["success"] = true;  
        $response["nombre"] = $nombre;
        $response["apPaterno"] = $apPaterno;
        $response["telefono"] = $telefono;
    }
    
    echo json_encode($response);
?>