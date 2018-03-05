<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="stylePrincipal.css">
	<link rel="stylesheet" type="text/css" href="Imagenes\fonts.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

	<?php

	  include("conexion.php");

	  $contadorActual=0;

	  $contadorAnterior=0;

	  $registros=$base->query("select * from pedido")->fetchAll(PDO::FETCH_OBJ);

	  $registroDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

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
		//echo $fechaActual;
		//echo "$d-$m-$y"; //getdate converted day

  	?>

	
	<div class="contenido" >
		<div class="wrapper">
			<h2 >Lista de pedido</h2>
			<div id="divtabla" class="wrapper">
				<table class="table">
				    <thead >
				      	<tr>
					        <th>#</th>
					        <th>Nombre Cliente</th>
					        <th>Apellido Cliente</th>
					        <th>Dirección Inicial</th>
					        <th>Dirección Destino</th>
					        <th>Teléfono</th>
					        <th>Rut Taxista</th>
					        <th>Nombre Taxista</th>
					        <th>Apellido Taxista</th>
					        <th>Estado</th>
					        <th>Tiempo Transcurrido</th>
					        <th>Hora Pedido</th>
				     	</tr>
				    </thead>

				    <?php foreach ($registros as $pedido):?> 

				    	<?php 

				    	  $rutTaxista = $pedido->RefChoferTaxista;

						  $RegistroTaxista=$base->query("select * from taxista where rut='$rutTaxista'")->fetchAll(PDO::FETCH_OBJ);

						  $nombreTaxista = $RegistroTaxista[0]->nombre;

						  $apellidoTaxista = $RegistroTaxista[0]->apPaterno;

						?> 


					    <tbody> 

						    <?php if( $pedido->fecha == $fechaActual)
			  					{		
			  						//echo $fechaActual;
		  				 	?>    

							    <?php
								    if( $pedido->estado == 'viajando')
				  					{
				  						$color="success";
				  						
				  					}
				  					if( $pedido->estado == 'esperando')
				  					{		
				  						$color="danger";
				  					}
				  					if( $pedido->estado == 'finalizado')
				  					{		
				  						$color="active";
				  					}
			  					?>
							      	<tr class=<?php echo $color ?>>
								        <td><?php echo $pedido->id ?></td>
								        <td><?php echo $pedido->nombre ?></td>
								        <td><?php echo $pedido->apellido ?></td>
								        <td><?php echo $pedido->direccionInicial ?></td>
								        <td><?php echo $pedido->direccionFinal ?></td>
								        <td><?php echo $pedido->telefono ?></td>
								        <td><?php echo $pedido->RefChoferTaxista ?></td>
								        <td><?php echo $nombreTaxista ?></td>
								        <td><?php echo $apellidoTaxista ?></td>
								        <td><?php echo $pedido->estado ?></td>
								        <td><?php echo $pedido->duracion ?></td>
								        <td><?php echo $pedido->hora ?></td>
							      	</tr>
							      	<?php $contadorActual++; ?>
							<?php } ?>
					    </tbody>

			    	<?php endforeach; ?>
				</table>
			</div>
		</div>

		<?php 

			$cambios=0;

			$registroContador=$base->query("select * from contadorsolicitudes")->fetchAll(PDO::FETCH_OBJ);

			$contadorAnterior = $registroContador[0]->contador;

			//echo "contador anterior $contadorAnterior, contadorActual $contadorActual";

			if($contadorAnterior!=$contadorActual)  
			{
				//echo "contador anterior $contadorAnterior, contadorActual $contadorActual";

				$base->query("delete from contadorsolicitudes where contador='$contadorAnterior'");

				$sql="insert into contadorsolicitudes (contador) values (:cont)";

			    $resultado = $base->prepare($sql);

			    $resultado->execute(array(":cont"=>$contadorActual));

			    $cambios = 1;

						    
			}

			
		?>

		<?php  
			if($cambios==1)
			{
				echo "<script>
		            alert('Hay nuevo pedido de taxi');
				</script>";	
			}
		?>

		
		<div class="wrapper">
			<h2>Lista de choferes</h2>
			<div id="divtabla" class="wrapper">
				<table class="table">
				    <thead>
				      	<tr>			      		
					        <th># Taxi</th>
					        <th>Patente Taxi</th>
					        <th>Rut</th>
					        <th>Nombre</th>
					        <th>Apellido</th>
					        <th>Ubicación</th>
					        <th>Estado</th>
					        <th>Tiempo disponible</th>
				      	</tr>
				    </thead>

				    <?php foreach ($registroDisponibilidad as $pedido):?> 

				    	<?php 

				    	  $taxista = $pedido->RefTaxista;

						  $RegistroTaxista=$base->query("select * from taxista where rut='$taxista'")->fetchAll(PDO::FETCH_OBJ);

						  
						  $rutTaxista = $RegistroTaxista[0]->rut;

						  $nombreTaxista = $RegistroTaxista[0]->nombre;

						  $apellidoTaxista = $RegistroTaxista[0]->apPaterno;

						  $taxi =$RegistroTaxista[0]->RefTaxi;

						  $RegistroTaxi=$base->query("select * from taxi where patente='$taxi'")->fetchAll(PDO::FETCH_OBJ);

						  $numeroTaxi = $RegistroTaxi[0]->numTaxi;

						  $registroDisponibilidad2=$base->query("select * from disponibilidadchoferes where RefTaxista='$taxista'")->fetchAll(PDO::FETCH_OBJ);

						  $tiempoDisponible = $registroDisponibilidad2[0]->tiempoDisponible;


						?> 

					    <tbody>  
						    <?php
							    if( $pedido->estado == 'disponible')
			  					{
			  						$color="success";
			  						
			  					}
			  					if( $pedido->estado == 'ocupado')
			  					{		
			  						$color="danger";
			  					}
			  					if( $pedido->estado == 'no disponible')
			  					{		
			  						$color="active";
			  					}
		  					?>
		  					<?php if($RegistroTaxista[0]->estado=="habilitado")
						  	{?>
						      	<tr class=<?php echo $color ?>>
						      		<td><?php echo $numeroTaxi ?></td>
							        <td><?php echo $taxi ?></td>
							        <td><?php echo $rutTaxista ?></td>
							        <td><?php echo $nombreTaxista ?></td>
							        <td><?php echo $apellidoTaxista ?></td>
							        <td><?php echo $pedido->ubicacion ?></td>
							        <td><?php echo $pedido->estado ?></td>
							        <td><?php echo $tiempoDisponible ?></td>
						      	</tr>
						      	<?php }?>
					    </tbody>

			    	<?php endforeach; ?>
				</table>
			</div>
		</div>
		
		
		<div class="wrapper">
			<h2>Historial de pedidos durante el día</h2>
			<div id="divtabla" class="wrapper">
			  	<table class="table">
			    	<thead>
				      	<tr>
					        <th>#</th>
					        <th>Nombre Cliente</th>
					        <th>Apellido Cliente</th>
					        <th>Dirección Inicial</th>
					        <th>Dirección Destino</th>
					        <th>Teléfono</th>
					        <th>Rut Taxista</th>
					        <th>Nombre Taxista</th>
					        <th>Apellido Taxista</th>
					        <th>Estado</th>
					        <th>Tiempo Transcurrido</th>
					        <th>Hora Pedido</th>
				     	</tr>
				    </thead>
				   
				   <?php foreach ($registros as $pedido):?> 


				   		<?php 

				    	  $rutTaxista = $pedido->RefChoferTaxista;

						  $RegistroTaxista=$base->query("select * from taxista where rut='$rutTaxista'")->fetchAll(PDO::FETCH_OBJ);

						  $nombreTaxista = $RegistroTaxista[0]->nombre;

						  $apellidoTaxista = $RegistroTaxista[0]->apPaterno;

						?> 


						<?php if( $pedido->fecha == $fechaActual)
			  					{		
			  						//echo $fechaActual;
		  				 	?>  

		  					<?php if( $pedido->estado == 'finalizado')
			  					{		
			  						$color="active";
		  				 	?> 

			  				 	<tbody> 
							      	<tr class=<?php echo $color ?>>
								        <td><?php echo $pedido->id ?></td>
								        <td><?php echo $pedido->nombre ?></td>
								        <td><?php echo $pedido->apellido ?></td>
								        <td><?php echo $pedido->direccionInicial ?></td>
								        <td><?php echo $pedido->direccionFinal ?></td>
								        <td><?php echo $pedido->telefono ?></td>
								        <td><?php echo $pedido->RefChoferTaxista ?></td>
								        <td><?php echo $nombreTaxista ?></td>
							        	<td><?php echo $apellidoTaxista ?></td>
								        <td><?php echo $pedido->estado ?></td>
								        <td><?php echo $pedido->duracion ?></td>
								        <td><?php echo $pedido->hora ?></td>
							      	</tr>
							    </tbody>

							<?php } ?>
						<?php } ?>
			    	<?php endforeach; ?>
			  	</table>
			  </div>
		</div>
		
	</div>
	
	<!--este laven hace el espacio entre el contenido anterior y el footer-->
	<label></label>
</body>
</html>
