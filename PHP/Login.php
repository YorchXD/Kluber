<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    
    $correo = $_POST["correo"];
    $clave = $_POST["clave"];
    
    $statement = mysqli_prepare($con, "SELECT * FROM persona WHERE correo = ? AND clave = ?");
    mysqli_stmt_bind_param($statement, "ss", $correo, $clave);
    mysqli_stmt_execute($statement);
    
    mysqli_stmt_store_result($statement);
    mysqli_stmt_bind_result($statement, $correo, $nombre, $apPaterno, $apMaterno, $direccion,$telefono, $clave);
    
    $response = array();
    $response["success"] = false;  
    
    while(mysqli_stmt_fetch($statement)){
        $response["success"] = true;  
        $response["nombre"] = $nombre;
        $response["telefono"] = $telefono;
        $response["correo"] = $correo;
        $response["clave"] = $clave;
    }
    
    echo json_encode($response);
?>