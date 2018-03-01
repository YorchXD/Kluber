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



    $registrosDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

    $tiempoDisponible1="00:00:00";

    $taxista="";

    foreach ($registrosDisponibilidad as $disponibilidad):
        if($disponibilidad->estado=="disponible")
        {
            $tiempoDisponible2=$disponibilidad->tiempoDisponible;

            if($tiempoDisponible2>=$tiempoDisponible1)
            {
                $taxista = $disponibilidad->RefTaxista;
                $tiempoDisponible1=$tiempoDisponible2;
            }
        }
    endforeach;

    if($taxista!="")
    {

        $sql="insert into pedido (nombre, apellido, direccionInicial, direccionFinal, telefono, RefChoferTaxista, estado, fecha, hora, latitudInicial, longitudInicial, latitudFinal, longitudFinal) values (:nom, :apell, :dirIni, :dirFin, :tel, :chofer, :est, :fech, :hor, :latIn, :lonIn, :latFin, :lonFin)";

        $resultado = $base->prepare($sql);

        $resultado->execute(array(":nom"=>$nombre, ":apell"=>$apellido, ":dirIni"=>$origen,":dirFin"=>$destino, ":tel"=>$telefono, ":chofer"=>$taxista, ":est"=>$estado, ":fech"=>$fecha, ":hor"=>$hora, ":latIn"=>$latitudInicial, ":lonIn"=>$longitudInicial, ":latFin"=>$latitudFinal, ":lonFin"=>$longitudFinal));


        $base->query("update disponibilidadchoferes set estado='ocupado', tiempoDisponible='00:00:00' where RefTaxista='$taxista'");

        //echo "La solicitud fue hecha exitosamente";

        //return true;

        echo "true";

    }
    else
    {
        //return false;
        //echo "No se pude enviar solicitud por que no hay taxista disponible";
        echo "false";
    }


?>