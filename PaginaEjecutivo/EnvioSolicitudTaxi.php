<?php

    include("conexion.php");

    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $telefono = $_POST["telefono"];
    $origen = $_POST["direccionOrigen"];
    $destino = $_POST["direccionDestino"];
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

    if (isset($_GET['id']) && !empty($_GET['id'])) 
    {
        
        $numeroPedido = $_POST["idPedido"];

        $registroPedido=$base->query("select * from pedido where id='$numeroPedido'")->fetchAll(PDO::FETCH_OBJ);

        $taxistaAnterior = $registroPedido[0]->RefChoferTaxista;

        $registroTaxista=$base->query("select * from taxista where correo='$correoTaxista'")->fetchAll(PDO::FETCH_OBJ);

        $taxistaNuevo = $registroTaxista[0]->rut;

        $sql="update pedido set nombre=:nomCli, apellido=:apell, direccionInicial=:dirIni, direccionFinal=:dirDes, telefono=:tel, latitudInicial=:latIn, longitudInicial=:lonIn, latitudFinal=:latFin, longitudFinal=:lonFin, RefChoferTaxista=:taxista, distanciaEstimada=:dist, tiempoEstimado=:tiem, costoEstimado=:cost, segundosEstimados=:seg where id=:numPed";

        $resultado = $base->prepare($sql);

        $resultado->execute(array(":numPed"=>$numeroPedido, ":nomCli"=>$nombreCliente, ":apell"=>$apellidoCliente,":dirIni"=>$direccionInicial, ":dirDes"=>$direccionDestino, ":tel"=>$telefono, ":latIn"=>$latitudInicial, ":lonIn"=>$longitudInicial, ":latFin"=>$latitudFinal, ":lonFin"=>$longitudFinal, ":taxista"=>$taxistaNuevo, ":dist"=>$distancia, ":tiem"=>$tiempo, ":cost"=>$costo, ":seg"=>$segundosEstimados));

        $base->query("update disponibilidadchoferes set estado='disponible' where RefTaxista='$taxistaAnterior'");

        $base->query("update disponibilidadchoferes set estado='ocupado' where RefTaxista='$taxistaNuevo'");

        header("Location:EnvioPedidoTiempoTranscurrido.php?id=$numeroPedido");

        echo "$numeroPedido";
    }
    else
    {
        $registrosDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

        $registroTaxista=$base->query("select * from taxista where correo='$correoTaxista'")->fetchAll(PDO::FETCH_OBJ);

        $taxista = $registroTaxista[0]->rut;

        $TiempoComienzo="00:10:00";
        $segundosComienzo=600;

        $sql="insert into pedido (nombre, apellido, direccionInicial, direccionFinal, telefono, RefChoferTaxista, estado, fecha, hora, latitudInicial, longitudInicial, latitudFinal, longitudFinal, distanciaEstimada, tiempoEstimado, costoEstimado, segundosEstimados, tiempoEsperaComienzo, segundosEsperaComienzo) values (:nom, :apell, :dirIni, :dirFin, :tel, :chofer, :est, :fech, :hor, :latIn, :lonIn, :latFin, :lonFin, :dis, :tiem, :cost, :seg, :tiemCom, :segCom)";

        $resultado = $base->prepare($sql);

        $resultado->execute(array(":nom"=>$nombre, ":apell"=>$apellido, ":dirIni"=>$origen,":dirFin"=>$destino, ":tel"=>$telefono, ":chofer"=>$taxista, ":est"=>$estado, ":fech"=>$fecha, ":hor"=>$hora, ":latIn"=>$latitudInicial, ":lonIn"=>$longitudInicial, ":latFin"=>$latitudFinal, ":lonFin"=>$longitudFinal, ":dis"=>$distancia, ":tiem"=>$tiempo,":cost"=>$costo, ":seg"=>$segundosEstimados, ":tiemCom"=>$TiempoComienzo, ":segCom"=>$segundosComienzo));


        $base->query("update disponibilidadchoferes set estado='ocupado', tiempoDisponible='00:00:00' where RefTaxista='$taxista'");

        echo "true";
    }

	

?>