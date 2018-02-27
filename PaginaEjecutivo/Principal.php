<?php
	session_start();
?>

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

	<header>
		<div class="contenedorEncabezado">
			<div class="logotipo">
				Kluber-Radio Taxi Genesis
			</div>
			<div class="loginBox">
				<div class="glass">
					<img src="Imagenes\login.png" class="user">
					<p class="bienvenida">Bienvenido: <?php echo $_SESSION['usuario'];?> </p>
					
					<div class="botones">
						<div class="btn"><a class="abtn" href=""></a>Editar</div>
						<div class="btn"><a class="abtn" href="logout.php">Salir</a></div>
					</div>
					
				
				</div>
			</div>
		</div>
		

		<nav class="menu">
			<ul>
				<li><a href="Principal.php"><span class="colorInicio"><i class="icon icon-home"></i></span>Inicio</a></li>
				<li><a href="Historial.php"><span class="colorHistorial"><i class="icon icon-open-book"></i></span>Historial</a></li>
				<li><a href="#"><span class="colorChofer"><i class="icon icon-person_pin"></i></span>Chofer</a>
					<ul>
						<li><a href="MostrarTaxista.php" class="colorChofer">Ver</a></li>
						<li><a href="RegistroTaxista.php" class="colorChofer">Registrar</a></li>
						<li><a href="EditarTaxista.php" class="colorChofer">Editar</a></li>
						<li><a href="EliminarTaxista.php" class="colorChofer">Eliminar</a></li>
					</ul>
				</li>
				<li><a href="#"><span class="colorTaxi"><i class="icon icon-local_taxi"></i></span>Taxi</a>
					<ul>
						<li><a href="MostrarTaxi.php">Ver</a></li>
						<li><a href="RegistroTaxi.php">Registrar</a></li>
						<li><a href="EditarTaxi.php">Editar</a></li>
						<li><a href="EliminarTaxi.php">Eliminar</a></li>
					</ul>
				</li>
			</ul>				
		</nav>
	</header>

	
	
	<div>
		<div class="wrapper">
			<h2 >Lista de pedido</h2>
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
						<?php } ?>
				    </tbody>

		    	<?php endforeach; ?>
			</table>
		</div>
		
		<div class="botones">
			<div class="btn"><a class="abtn" href="#"></a>Enviar</div>
			<div class="btn"><a class="abtn" href="#">Cancelar</a></div>
		</div>
		
		<div class="wrapper">
			<h2>Lista de choferes</h2>
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
					      	</tr>
					      	<?php }?>
				    </tbody>

		    	<?php endforeach; ?>
			</table>
		</div>
		
		
		<div class="wrapper">
			<h2>Historial de pedidos durante el día</h2>
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
		
		
		<div class="botones">
			<div class="btn"><a class="abtn" href="#"></a>Mostrar</div>
		</div>
	</div>

	<footer>Derechos Reservados | kable &copy</footer>

</body>
</html>
