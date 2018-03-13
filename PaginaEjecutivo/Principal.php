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

	<script language=JavaScript>
		function recarga()
		{
			location.href="Principal.php";
		}
		setInterval('recarga()',20000);
	</script>

</head>
<body>

	<?php

	  include("conexion.php"); //conecta con la BD

	  $contadorActual=0;

	  $contadorAnterior=0;

	  $registros=$base->query("select * from pedido")->fetchAll(PDO::FETCH_OBJ); //consulta mysql

	  $registroDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

		//---------Fecha Actual-------//
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

		//--------------------------//

		$contador=0;

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
					<ul class="submenuChofer">
						<li><a href="MostrarTaxista.php" class="submenuChofer">Ver</a></li>
						<li><a href="RegistroTaxista.php" class="submenuChofer">Registrar</a></li>
						<li><a href="EditarTaxista.php" class="submenuChofer">Editar</a></li>
						<li><a href="EliminarTaxista.php" class="submenuChofer">Eliminar</a></li>
						<li><a href="EditarTaxistaDisponibilidad.php" class="submenuChofer">Editar Disponibilidad</a></li>
					</ul>
				</li>
				<li><a href="#"><span class="colorTaxi"><i class="icon icon-local_taxi"></i></span>Taxi</a>
					<ul class="submenuTaxi">
						<li><a href="MostrarTaxi.php" class="submenuTaxi">Ver</a></li>
						<li><a href="RegistroTaxi.php" class="submenuTaxi">Registrar</a></li>
						<li><a href="EditarTaxi.php" class="submenuTaxi">Editar</a></li>
						<li><a href="EliminarTaxi.php" class="submenuTaxi">Eliminar</a></li>
					</ul>
				</li>
				<li><a href="#"><span class="colorSolicitarTaxi"><i class="icon icon-map"></i></span>Solicitar taxi</a>
					<ul class="submenuSolicitarTaxi">
						<li><a href="SolicitarTaxi.php" class="submenuSolicitarTaxi">Solicitar</a></li>
						<li><a href="#" class="submenuSolicitarTaxi">Editar</a></li>
						<li><a href="#" class="submenuSolicitarTaxi">Eliminar</a></li>
					</ul>

				</li>
			</ul>				
		</nav>
	</header>

	
	<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
	
		<div>
			<!-- TABLA PEDIDO -->
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

				  					<?php if( $pedido->estado != 'finalizado')
				  					{		
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

					if($contadorAnterior<$contadorActual)//significa que de verdad se agrego y no se elimino pedido
					{
				    	$cambios = 1;
				    }

					$base->query("delete from contadorsolicitudes where contador='$contadorAnterior'");

					$sql="insert into contadorsolicitudes (contador) values (:cont)";

				    $resultado = $base->prepare($sql);

				    $resultado->execute(array(":cont"=>$contadorActual));

							    
				}

				
			?>

			<?php  
				if($cambios==1)
				{
					$registrosPedidos=$base->query("select * from pedido")->fetchAll(PDO::FETCH_OBJ);

					$num=count($registrosPedidos);
					$num=$num-1;

					$id=$registrosPedidos[$num]->id;


					echo "<script>
			            alert('Hay nuevo pedido de taxi');

			                location.href='EnvioPedidoTiempoTranscurrido.php?id=$id';
					</script>";						

			        //$id='89';
			         		
				}

			?>

			<!-- TABLA CHOFERES -->
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
					      	</tr>
					    </thead>

					    <?php foreach ($registroDisponibilidad as $pedido):?> 

					    	<?php 
					    		//CAPTA LOS VALORES EN LA BD
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

								        <?php /*if($pedido->estado=="disponible")
							  			{?>

								        	<td class="bot"><a href="borrar.php?patente=<?php echo $taxi->patente?>"><input type='button' name='del' id='del' value='Seleccionar' enabled='true'></a></td>

								        <?php } 
								        else{ ?>
								        	<td class="bot"><a href="borrar.php?patente=<?php echo $taxi->patente?>"><input type='button' name='del' id='del' value='Seleccionar' disabled='true'></a></td>
							        	<?php }*/ ?>

							      	</tr>
							    <?php }?>
						    </tbody>

				    	<?php endforeach; ?>
					</table>
				</div>
			</div>
			
			<!-- TABLA HISTORIAL DE PEDIDOS DURANTE EL DIA DE HOY -->
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

</form>

<!-- Display the countdown timer in an element -->
	<p id="demo"></p>

	<script type="text/javascript">
		var segundos = 0;
		var minutos = 0;
		var horas = 0;

		var id=109;
		var confirma = "false";
		
	</script>

	

	<script>
		// Set the date we're counting down to
		var countDownDate = new Date("Sep 5, 2018 15:37:25").getTime();

		// Update the count down every 1 second
		var x = setInterval(function() {

			 segundos++;

			 if(segundos == 60)
			 {
			 	segundos = 0;
			 	minutos++;
			 }

			 if(minutos == 60)
			 {
			 	minutos = 0;
			 	horas++;
			 }

			 if(horas == 24)
			 {
			 	horas=0;
			 }

			 //document.getElementById("demo").innerHTML = horas + ":" + minutos + ":" + segundos;

			$.post("EditarTiempoTranscurrido.php",function (respuesta) {

			});

		}, 1000);


	</script>


	<?php  
			$registroPedidos=$base->query("select * from pedido")->fetchAll(PDO::FETCH_OBJ);

			foreach ($registroPedidos as $pedido):

				$id=$pedido->id;

				$estado=$pedido->estado;

				$fechaPedido = $pedido->fecha;

				$tiempoEstimado = $pedido->tiempoEstimado;

				$refTaxista = $pedido->RefChoferTaxista;

				$nombrePasajero =  $pedido->nombre;

				$apellidoPasajero =  $pedido->apellido;

				$tiempoEsperaComienzo = $pedido->tiempoEsperaComienzo;

				

				if(($estado=="esperando" || $estado=="viajando") && ($fechaPedido==$fechaActual))
	            {
					$registroTiempoTranscurrido=$base->query("select * from pedidotiempotranscurrido where RefPedido='$id'")->fetchAll(PDO::FETCH_OBJ);

					$tiempoTranscurrido=$registroTiempoTranscurrido[0]->TiempoTranscurrido;

					$tiempoAgotado=$registroTiempoTranscurrido[0]->tiempoAgotado;

					$hora1 = strtotime( $tiempoTranscurrido );
					$hora2 = strtotime( $tiempoEstimado );

					$hora3 = strtotime( $tiempoEsperaComienzo );

					/*echo "<script>

						alert('$hora1');

						</script>";

						echo "<script>

						alert('$hora2');

						</script>";

						echo "<script>

						alert('$tiempoAgotado');

						</script>";*/
					

					if($hora1>=$hora3 && $tiempoAgotado==0)
					{
						$registroTaxista=$base->query("select * from taxista where rut='$refTaxista'")->fetchAll(PDO::FETCH_OBJ);

						$nombreTaxista = $registroTaxista[0]->nombre;

						$apellidoTaxista = $registroTaxista[0]->apPaterno;


						
						echo "<script>
							if (confirm('¿Confirma llegada del taxista $nombreTaxista $apellidoTaxista donde pasajero $nombrePasajero $apellidoPasajero ?')) 
							{ 
									alert('Taxista comenzo recorrido');
							    	location.href='EditarTiempoAgotado.php?idPedido=$id & terminar=2';
								    ////aqui quede, falta que el taxista quede disponible y el pedido finalizado////

							}
							else 
							{
							    alert('Taxista no ha comenzado recorrido');
							    location.href='EditarTiempoAgotado.php?idPedido=$id & terminar=3';
							}  
							</script>";
					}
					if( ($hora1>=$hora2) && $tiempoAgotado==2)
					{
						$registroTaxista=$base->query("select * from taxista where rut='$refTaxista'")->fetchAll(PDO::FETCH_OBJ);

						$nombreTaxista = $registroTaxista[0]->nombre;

						$apellidoTaxista = $registroTaxista[0]->apPaterno;

						

						
						echo "<script>
							if (confirm('¿Confirma termino del recorrido del taxista $nombreTaxista $apellidoTaxista ?')) 
							{ 
									alert('Taxista termino recorrido');
							    	location.href='EditarTiempoAgotado.php?idPedido=$id & terminar=1';
								    ////aqui quede, falta que el taxista quede disponible y el pedido finalizado////

							} 
							else 
							{
							    alert('Taxista no ha terminado recorrido');
							    location.href='EditarTiempoAgotado.php?idPedido=$id & terminar=0';
							} 

							</script>";

					}

	            }

			endforeach;					

	?>

	<footer>Derechos Reservados | kable &copy</footer>

</body>
</html>
