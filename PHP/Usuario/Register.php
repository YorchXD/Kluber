<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    
    $nombre = $_POST["nombre"];
    $apPaterno = $_POST["apPaterno"];
    $apMaterno = $_POST["apMaterno"];
    $correo = $_POST["correo"];
    $telefono = $_POST["telefono"];
    $direccion = $_POST["direccion"];
    $clave = $_POST["clave"];
    $statement = mysqli_prepare($con, "INSERT INTO persona (nombre, correo, telefono, direccion, clave, apPaterno, apMaterno) VALUES (?, ?, ?, ?, ?, ?, ?)");
    mysqli_stmt_bind_param($statement, "sssssss", $nombre, $correo, $telefono, $direccion, $clave, $apPaterno, $apMaterno);
    mysqli_stmt_execute($statement);
    
    $response = array();
    $response["success"] = true;  
    
    echo json_encode($response);
?>