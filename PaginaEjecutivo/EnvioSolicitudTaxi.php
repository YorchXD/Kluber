<?php

    include("conexion.php");

	$nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $telefono = $_POST["telefono"];
    $origen = $_POST["direccionOrigen"];
    $destino = $_POST["direccionDestino"];
    $distancia = $_POST["distancia"];
    $fecha = $_POST["fecha"];
    $hora = $_POST["hora"];
    $estado = "esperando";
    $latitudInicial=$_POST["latOrigen"];
    $longitudInicial=$_POST["lngOrigen"];
    $latitudFinal=$_POST["latDestino"];
    $longitudFinal=$_POST["lngDestino"];



    $taxista="1234";

    $sql="insert into pedido (nombre, apellido, direccionInicial, direccionFinal, telefono, RefChoferTaxista, estado, fecha, hora, latitudInicial, longitudInicial, latitudFinal, longitudFinal) values (:nom, :apell, :dirIni, :dirFin, :tel, :chofer, :est, :fech, :hor, :latIn, :lonIn, :latFin, :lonFin)";

    $resultado = $base->prepare($sql);

    $resultado->execute(array(":nom"=>$nombre, ":apell"=>$apellido, ":dirIni"=>$origen,":dirFin"=>$destino, ":tel"=>$telefono, ":chofer"=>$taxista, ":est"=>$estado, ":fech"=>$fecha, ":hor"=>$hora, ":latIn"=>$latitudInicial, ":lonIn"=>$longitudInicial, ":latFin"=>$latitudFinal, ":lonFin"=>$longitudFinal));

    header("Location:Principal.php");

    echo "Datos ".$_POST["nombre"];

?>