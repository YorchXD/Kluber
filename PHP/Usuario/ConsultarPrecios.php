<?php
    $con = mysqli_connect("localhost", "root", "", "kluber");
    
    $id = $_POST["id"];
    $statement = mysqli_prepare($con, "SELECT costoInicial, costoMetro, costoTiempo FROM precios WHERE id = ? ");
    mysqli_stmt_bind_param($statement, "s",$id);
    mysqli_stmt_execute($statement);


    mysqli_stmt_store_result($statement);
    mysqli_stmt_bind_result($statement, $costoInicial, $costoMetro, $costoTiempo);
    
    $response = array();
    $response["success"] = false;  

     while(mysqli_stmt_fetch($statement)){
        $response["success"] = true;  
        $response["costoInicial"] = $costoInicial;
        $response["costoMetro"] = $costoMetro;
        $response["costoTiempo"] = $costoTiempo;
    }
    
    echo json_encode($response);
?>