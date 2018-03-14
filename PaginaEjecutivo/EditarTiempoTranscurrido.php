<?php

    //-----------------------------
    $now = time();
    $num = date("w");

    $WeekMon  = mktime(0, 0, 0, date("m", $now)  , date("d", $now), date("Y", $now));    //monday week begin calculation
    $todayh = getdate($WeekMon); //monday week begin reconvert

    $d = $todayh['mday'];
    $m = $todayh['mon'];
    $y = $todayh['year'];

    if($m<10)
    {
        $m="0$m";
    }
    else
    {
        $m="$m";
    }

    if($d<10)
    {
        $d="0$d";
    }
    else
    {
        $d="$d";
    }

    $y="$y";

    $fechaActual="$y-$m-$d";
    //---------------------------

    include("conexion.php");

    $idActual = $_POST["idPedido"];

    /*$registrosDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

    $registroTaxista=$base->query("select * from taxista where correo='$correoTaxista'")->fetchAll(PDO::FETCH_OBJ);

    $taxista = $registroTaxista[0]->rut;*/


    /*$sql="insert into pedido (RefPedido, TiempoTranscurrido) values (:rPed, :tiemp)";

    $resultado = $base->prepare($sql);*/

    $registroPedidos=$base->query("select * from pedido")->fetchAll(PDO::FETCH_OBJ);
    $contador =0;
    $comprueba = 0;
    $idPedido = 0;


        
        foreach ($registroPedidos as $pedido):

            $idPedido = $pedido->id;
            $estado = $pedido->estado;
            $fecha = $pedido->fecha;

            $cantidadPedido = count($registroPedidos);

            if(($estado=="esperando" || $estado=="viajando") && ($fecha==$fechaActual))
            {
                //if($idActual!=$idPedido)
                //{
                    //$registroTiempoTrnascurrido=$base->query("select * from pedidotiempotranscurrido where RefPedido='$idPedido'")->fetchAll(PDO::FETCH_OBJ);
                    //$contador = $registroTiempoTrnascurrido[0]->contador;
                    //if($contador==0 || $contador==null)
                    //{
                        //echo $idPedido;

                    $registroTiempoTranscurrido=$base->query("select * from pedidotiempotranscurrido where RefPedido='$idPedido'")->fetchAll(PDO::FETCH_OBJ);

                    //$tiempo = $registroTiempoTranscurrido[0]->TiempoTranscurrido;

                    $contador = $registroTiempoTranscurrido[0]->contador;

                    $contador++;



                    $horas = floor(($contador % (60 * 60 * 24)) / (60 * 60));
                    $minutos = floor(($contador % (60 * 60)) / (60));
                    $segundos = round($contador % 60);
                        
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


                    $sql="update pedidotiempotranscurrido set TiempoTranscurrido=:tiemp, contador=:cont where RefPedido=:rped";

                    $resultado = $base->prepare($sql);

                    $resultado->execute(array(":rped"=>$idPedido, ":tiemp"=>$tiempo, ":cont"=>$contador));



                    $sql2="update pedido set duracion=:tiemp where id=:rped";

                    $resultado2 = $base->prepare($sql2);

                    $resultado2->execute(array(":rped"=>$idPedido, ":tiemp"=>$tiempo));

                    
                    $comprueba = 1;

                    echo "true";
                    //}
                //}
            }
        endforeach;


    /*foreach ($registroPedidos as $pedido):
        $idPedido = $pedido->id;
        $estado = $pedido->estado;
        $fecha = $pedido->fecha;

        if(($estado=="esperando" || $estado=="viajando") && ($fecha==$fechaActual))
        {
            //if($idActual!=$idPedido)
            //{
                //$registroTiempoTrnascurrido=$base->query("select * from pedidotiempotranscurrido where RefPedido='$idPedido'")->fetchAll(PDO::FETCH_OBJ);
                //$contador = $registroTiempoTrnascurrido[0]->contador;
                //if($contador==0 || $contador==null)
                //{
                    //echo $idPedido;
            if ($comprueba==0)
            {
                    $comprueba = 1;
                    echo $idPedido;
            }
                //}
            //}
        }

   endforeach;*/
   if($registroPedidos==null)
   {
        echo "esUltimo";
   }
    else if($comprueba==0)
    {
       echo "false";
    }
        /*if($registroPedidos==null)
        {
            echo $idPedido;
        }*/

        

    //}


?>