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

    $registroPedidos=$base->query("select * from pedido where id='$idActual' ")->fetchAll(PDO::FETCH_OBJ);
    $contador =0;
    $comprueba = 0;
    $idPedido = 0;


   

    if($registroPedidos!=null)
    {
        $idPedido = $registroPedidos[0]->id;
        $estado = $registroPedidos[0]->estado;
        $fecha = $registroPedidos[0]->fecha;

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
                
                    $comprueba = 1;

                    echo "true";
                //}
            //}
        }

    }

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