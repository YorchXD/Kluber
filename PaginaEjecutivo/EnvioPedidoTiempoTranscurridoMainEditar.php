<?php

    include("conexion.php");

	$idPedido = $_GET["id"];
    $tiempo = "00:00:00";
    $estado = "esperando";



    /*$registrosDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

    $registroTaxista=$base->query("select * from taxista where correo='$correoTaxista'")->fetchAll(PDO::FETCH_OBJ);

    $taxista = $registroTaxista[0]->rut;*/


        $sql="insert into pedidotiempotranscurrido (RefPedido, TiempoTranscurrido, estado) values (:rPed, :tiemp, :est)";

        $resultado = $base->prepare($sql);

        $resultado->execute(array(":rPed"=>$idPedido, ":tiemp"=>$tiempo, ":est"=>$estado));

        //$base->query("update pedidotiempoestimado set estado='ocupado', tiempoDisponible='00:00:00' where RefTaxista='$taxista'");

        //echo "La solicitud fue hecha exitosamente";

        //return true;

        echo true;
        //header("Location:Principal.php");

    /*}
    else
    {
        //return false;
        //echo "No se pude enviar solicitud por que no hay taxista disponible";
        echo "false";
    }*/


?>