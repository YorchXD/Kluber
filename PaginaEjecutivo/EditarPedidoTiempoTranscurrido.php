<?php

    include("conexion.php");

	$idPedido = $_POST["idPedido"];

    /*$registrosDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

    $registroTaxista=$base->query("select * from taxista where correo='$correoTaxista'")->fetchAll(PDO::FETCH_OBJ);

    $taxista = $registroTaxista[0]->rut;*/


        /*$sql="insert into pedido (RefPedido, TiempoTranscurrido) values (:rPed, :tiemp)";

        $resultado = $base->prepare($sql);*/

        $registroTiempoTranscurrido=$base->query("select * from pedidotiempotranscurrido where RefPedido='$idPedido'")->fetchAll(PDO::FETCH_OBJ);

        $tiempo = $registroTiempoTranscurrido[0]->TiempoTranscurrido;

        $contador = $registroTiempoTranscurrido[0]->contador;

        $contador++;

        /*echo"<script>

                    var tiempoTrans = new Date($tiempo).getTime();                

                    var hours = Math.floor((tiempoTrans % (60 * 60 * 24)) / (60 * 60));
                    var minutes = Math.floor((tiempoTrans % (60 * 60)) / (60));
                    var seconds = Math.floor(tiempoTrans % 60);
                    seconds++;

                    if(hours<10){
                            hours='0'+hours;
                        } 
                        if(minutes<10){
                            minutes='0'+minutes;
                        }
                        if(seconds<10){
                            seconds='0'+seconds;
                        }


                        $tiempo =hours+":"+minutes+":"+seconds;
            </script>";*/

       $sql="update pedidotiempotranscurrido set TiempoTranscurrido=:tiemp, contador=:cont where RefPedido=:rped";

        $resultado = $base->prepare($sql);

        //$resultado = $base->query("update pedidotiempotranscurrido set TiempoTranscurrido=:tiemp, contador=:cont where RefPedido=:rPed");

        //$resultado->execute(array(":pat"=>$patente, ":mar"=>$marca, ":mod"=>$modelo, ":numT"=>$numTaxi, ":an"=>$anio));

        $resultado->execute(array(":rped"=>$idPedido, ":tiemp"=>$tiempo, ":cont"=>$contador));

        //$resultado->execute(array(":rped"=>$idPedido, ":tiemp"=>$tiempo, ":cont"=>$contador));

        //echo "La solicitud fue hecha exitosamente";

        //return true;

        echo "true";

    /*}
    else
    {
        //return false;
        //echo "No se pude enviar solicitud por que no hay taxista disponible";
        echo "false";
    }*/


?>