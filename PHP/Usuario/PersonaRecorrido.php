<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    
    $refRecorrido = $_POST["refRecorrido"];
    $refPersona = $_POST["refPersona"];
    $statement = mysqli_prepare($con, "INSERT INTO personarecorrido (refRecorrido, refPersona) VALUES (?, ?)");
    mysqli_stmt_bind_param($statement, "ss", $refRecorrido,$refPersona);
    mysqli_stmt_execute($statement);
    
    $response = array();
    $response["success"] = true;  
    
    echo json_encode($response);
?>