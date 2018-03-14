<?php

    include("conexion.php");

    $numeroPedido = $_POST["idPedido"];
	$nombreCliente = $_POST["nombre"];
    $apellidoCliente = $_POST["apellido"];
    $telefono = $_POST["telefono"];
    $direccionInicial = $_POST["direccionOrigen"];
    $direccionDestino = $_POST["direccionDestino"];
    $distancia = $_POST["distancia"];
    $fecha = $_POST["fecha"];
    $hora = $_POST["hora"];
    $estado = "esperando";
    $latitudInicial=$_POST["latOrigen"];
    $longitudInicial=$_POST["lngOrigen"];
    $latitudFinal=$_POST["latDestino"];
    $longitudFinal=$_POST["lngDestino"];
    $correoTaxista=$_POST["taxista"]; 
    $distancia=$_POST["distancia"];
    $tiempo=$_POST["tiempo"];
    $costo=$_POST["costo"];
    $segundosEstimados=$_POST["segundosEstimados"];

    $registroPedido=$base->query("select * from pedido where id='$numeroPedido'")->fetchAll(PDO::FETCH_OBJ);

    $taxistaAnterior = $registroPedido[0]->RefChoferTaxista;

    $registroTaxista=$base->query("select * from taxista where correo='$correoTaxista'")->fetchAll(PDO::FETCH_OBJ);

    $taxistaNuevo = $registroTaxista[0]->rut;

    


    $sql="update pedido set nombre=:nomCli, apellido=:apell, direccionInicial=:dirIni, direccionFinal=:dirDes, telefono=:tel, latitudInicial=:latIn, longitudInicial=:lonIn, latitudFinal=:latFin, longitudFinal=:lonFin, RefChoferTaxista=:taxista, distanciaEstimada=:dist, tiempoEstimado=:tiem, costoEstimado=:cost, segundosEstimados=:seg where id=:numPed";

        $resultado = $base->prepare($sql);

        $resultado->execute(array(":numPed"=>$numeroPedido, ":nomCli"=>$nombreCliente, ":apell"=>$apellidoCliente,":dirIni"=>$direccionInicial, ":dirDes"=>$direccionDestino, ":tel"=>$telefono, ":latIn"=>$latitudInicial, ":lonIn"=>$longitudInicial, ":latFin"=>$latitudFinal, ":lonFin"=>$longitudFinal, ":taxista"=>$taxistaNuevo, ":dist"=>$distancia, ":tiem"=>$tiempo, ":cost"=>$costo, ":seg"=>$segundosEstimados));

        $base->query("update disponibilidadchoferes set estado='disponible' where RefTaxista='$taxistaAnterior'");

        $base->query("update disponibilidadchoferes set estado='ocupado' where RefTaxista='$taxistaNuevo'");

        echo "$numeroPedido";



?>