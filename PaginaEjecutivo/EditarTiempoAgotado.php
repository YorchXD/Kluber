<?php

   include("conexion.php");

    $idPedido = $_GET["idPedido"];
    $terminar = $_GET["terminar"];

    $registroTiempoTranscurrido=$base->query("select * from pedidotiempotranscurrido where RefPedido='$idPedido'")->fetchAll(PDO::FETCH_OBJ);

    //$tiempoAgotado = $registroTiempoTranscurrido[0]->tiempoAgotado;

    if($terminar==1)//terminar Recorrido
    {
        /*Tiempo agotado*/
        $sql="update pedidotiempotranscurrido set tiempoAgotado=1, estado='finalizado' where RefPedido=:rped";

        $resultado = $base->prepare($sql);

        //$resultado->execute(array(":rped"=>$idPedido));

        $resultado->execute(array(":rped"=>$idPedido));


        /*Finaliza pedido*/
        $sql2="update pedido set estado='finalizado' where id=:rped";

        $resultado2 = $base->prepare($sql2);

        //$resultado->execute(array(":rped"=>$idPedido));

        $resultado2->execute(array(":rped"=>$idPedido));


        /*Taxista del reccorido queda disponible*/

        $registroTaxista=$base->query("select * from pedido where id='$idPedido'")->fetchAll(PDO::FETCH_OBJ);

        $taxista = $registroTaxista[0]->RefChoferTaxista;

        $sql3="update disponibilidadchoferes set estado='disponible' where RefTaxista=:rtax";

        $resultado3 = $base->prepare($sql3);

        $resultado3->execute(array(":rtax"=>$taxista));

    }
    else if($terminar==0)
    {

        $registroPedido=$base->query("select * from pedido where id='$idPedido'")->fetchAll(PDO::FETCH_OBJ);

        $segundosEstimados = $registroPedido[0]->segundosEstimados;

        $segundosEstimados += 300;

        $horas = floor(($segundosEstimados % (60 * 60 * 24)) / (60 * 60));
        $minutos = floor(($segundosEstimados % (60 * 60)) / (60));
        $segundos = round($segundosEstimados % 60);
            
        if($horas<10){
            $horas="0$horas";
        } 
        if($minutos<10){
            $minutos="0$minutos";
        }
        if($segundos<10){
            $segundos="0$segundos";
        }
  

        $tiempo ="$horas:$minutos:$segundos";

        $base->query("update pedido set tiempoEstimado='$tiempo',segundosEstimados='$segundosEstimados' where id='$idPedido'");



        //$sql="update pedido set tiempoEstimado=0 where RefPedido=:rped";

        //$resultado = $base->prepare($sql);

        //$resultado->execute(array(":rped"=>$idPedido));
    }
    elseif ($terminar == 2)//Empezar Recorrido 
    {

        /*Tiempo agotado*/
        $sql="update pedidotiempotranscurrido set tiempoAgotado=2 where RefPedido=:rped";

        $resultado = $base->prepare($sql);

        //$resultado->execute(array(":rped"=>$idPedido));

        $resultado->execute(array(":rped"=>$idPedido));


        /*Finaliza pedido*/
        $sql2="update pedido set estado='viajando' where id=:rped";

        $resultado2 = $base->prepare($sql2);

        //$resultado->execute(array(":rped"=>$idPedido));

        $resultado2->execute(array(":rped"=>$idPedido));

    }
    else if($terminar==3)
    {

        $registroPedido=$base->query("select * from pedido where id='$idPedido'")->fetchAll(PDO::FETCH_OBJ);

        $segundosEsperaComienzo = $registroPedido[0]->segundosEsperaComienzo;

        $segundosEsperaComienzo += 300;

        $horas = floor(($segundosEsperaComienzo % (60 * 60 * 24)) / (60 * 60));
        $minutos = floor(($segundosEsperaComienzo % (60 * 60)) / (60));
        $segundos = round($segundosEsperaComienzo % 60);
            
        if($horas<10){
            $horas="0$horas";
        } 
        if($minutos<10){
            $minutos="0$minutos";
        }
        if($segundos<10){
            $segundos="0$segundos";
        }
  

        $tiempoComienzo ="$horas:$minutos:$segundos";


        $segundosEstimados = $registroPedido[0]->segundosEstimados;

        $segundosEstimados += 300;

        $horasEst = floor(($segundosEstimados % (60 * 60 * 24)) / (60 * 60));
        $minutosEst = floor(($segundosEstimados % (60 * 60)) / (60));
        $segundosEst = round($segundosEstimados % 60);
            
        if($horasEst<10){
            $horasEst="0$horas";
        } 
        if($minutosEst<10){
            $minutosEst="0$minutos";
        }
        if($segundosEst<10){
            $segundosEst="0$segundos";
        }
  

        $tiempo ="$horasEst:$minutosEst:$segundosEst";

        $base->query("update pedido set tiempoEstimado='$tiempo',segundosEstimados='$segundosEstimados' where id='$idPedido'");

        $base->query("update pedido set tiempoEsperaComienzo='$tiempoComienzo',segundosEsperaComienzo='$segundosEsperaComienzo', tiempoEstimado='$tiempo',segundosEstimados='$segundosEstimados' where id='$idPedido'");



        //$sql="update pedido set tiempoEstimado=0 where RefPedido=:rped";

        //$resultado = $base->prepare($sql);

        //$resultado->execute(array(":rped"=>$idPedido));
    }


    header("Location:Principal.php");

    /*$registrosDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

    $registroTaxista=$base->query("select * from taxista where correo='$correoTaxista'")->fetchAll(PDO::FETCH_OBJ);

    $taxista = $registroTaxista[0]->rut;*/


    /*$sql="insert into pedido (RefPedido, TiempoTranscurrido) values (:rPed, :tiemp)";

    $resultado = $base->prepare($sql);*/

        
        


?>