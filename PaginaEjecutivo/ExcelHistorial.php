<html lang="es">

	<?php 
			include("conexion.php");

			$registros=$base->query("select * from pedido")->fetchAll(PDO::FETCH_OBJ);

			$registroDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

			//---------Fecha Actual------//
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

			//------------------------//

			$fechaDesde = $_GET["fechaDesde"]; //pasa FechaDesde desdeHitorial.php
	  		$fechaHasta = $_GET["fechaHasta"]; //pasa FechaHasta desdeHitorial.php

	  		/*headers para crear Excel*/

		  	header("Content-Type: application/vnd.ms-excel");

			header("Expires: 0");

			header("Cache-Control: must-revalidate, post-check=0, pre-check=0");

			header("content-disposition: attachment;filename=HistorialSolicitudes.xls");

			//header("Location:Principal.php");

	
	?>
	<!-- Crea tabla para mostrarla en el excel -->
	<table width=”200″ border=”1″>
		<thead>
	      	<tr>
		        <th>#</th>
		        <th>Nombre Cliente</th>
		        <th>Apellido Cliente</th>
		        <th>Direccion Inicial</th>
		        <th>Direccion Destino</th>
		        <th>Telefono</th>
		        <th>Rut Taxista</th>
		        <th>Nombre Taxista</th>
		        <th>Apellido Taxista</th>
		        <th>Estado</th>
		        <th>Fecha Pedido</th>
		        <th>Hora Pedido</th>
		        <th>Tiempo Transcurrido</th>
	     	</tr>
	    </thead>

		    <?php foreach ($registros as $pedido):


	    	  	$rutTaxista = $pedido->RefChoferTaxista;

			  	$RegistroTaxista=$base->query("select * from taxista where rut='$rutTaxista'")->fetchAll(PDO::FETCH_OBJ);

			  	$nombreTaxista = $RegistroTaxista[0]->nombre;

			  	$apellidoTaxista = $RegistroTaxista[0]->apPaterno;


		  		$fecha = $pedido->fecha;

				  

				$fecha2 = strtotime($fecha);
				$fechaDesde2 = strtotime($fechaDesde);
				$fechaHasta2 = strtotime($fechaHasta);
 	
 				 if( $fecha2 >= $fechaDesde2 && $fecha2<=$fechaHasta2)
				 {		
						if( $pedido->estado == "finalizado")
	  					{		
						//echo $fechaActual;
			 	?>  

	  				 	<tbody> 
					      	<tr >
						        <td><?php echo "$pedido->id" ?></td>
						        <td><?php echo "$pedido->nombre" ?></td>
						        <td><?php echo "$pedido->apellido" ?></td>
						        <td><?php echo "$pedido->direccionInicial" ?></td>
						        <td><?php echo "$pedido->direccionFinal" ?></td>
						        <td><?php echo "$pedido->telefono" ?></td>
						        <td><?php echo "$pedido->RefChoferTaxista" ?></td>
						        <td><?php echo "$nombreTaxista" ?></td>
					        	<td><?php echo "$apellidoTaxista" ?></td>
						        <td><?php echo "$pedido->estado" ?></td>
						        <td><?php echo "$fecha"  ?></td>
						        <td><?php echo "$pedido->hora" ?></td>
						        <td><?php echo "$pedido->duracion" ?></td>										        
					      	</tr>
					    </tbody>
			<?php }
						}
	        endforeach; ?>
  	</table>

</html>