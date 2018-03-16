<?php
	session_start();
?>

<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="encabezado.css">
	<link rel="stylesheet" type="text/css" href="Imagenes\fonts.css">
	<meta name="viewport" content="width=device-width, user-scalable=no">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

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
				<li><a href="Principal.php" target="principal"><span class="colorInicio"><i class="icon icon-home"></i></span>Inicio</a></li>
				<li><a href="Historial.php" target="principal"><span class="colorHistorial"><i class="icon icon-open-book"></i></span>Historial</a></li>
				<li><a href="#"><span class="colorChofer"><i class="icon icon-person_pin"></i></span>Chofer</a>
					<ul class="submenuChofer">
						<li><a href="MostrarTaxista.php" class="submenuChofer" target="principal">Ver</a></li>
						<li><a href="RegistroTaxista.php" class="submenuChofer" target="principal">Registrar</a></li>
						<li><a href="EditarTaxista.php" class="submenuChofer" target="principal">Editar</a></li>
						<li><a href="EliminarTaxista.php" class="submenuChofer" target="principal">Eliminar</a></li>
						<li><a href="EditarTaxistaDisponibilidad.php" class="submenuChofer" target="principal">Editar Disponibilidad</a></li>
					</ul>
				</li>
				<li><a href="#"><span class="colorTaxi"><i class="icon icon-local_taxi"></i></span>Taxi</a>
					<ul class="submenuTaxi">
						<li><a href="MostrarTaxi.php" class="submenuTaxi" target="principal">Ver</a></li>
						<li><a href="RegistroTaxi.php" class="submenuTaxi" target="principal">Registrar</a></li>
						<li><a href="EditarTaxi.php" class="submenuTaxi" target="principal">Editar</a></li>
						<li><a href="EliminarTaxi.php" class="submenuTaxi" target="principal">Eliminar</a></li>
					</ul>
				</li>
				<li><a href="#"><span class="colorSolicitarTaxi"><i class="icon icon-map"></i></span>Solicitar taxi</a>
					<ul class="submenuSolicitarTaxi">
						<li><a href="SolicitarTaxi.php" class="submenuSolicitarTaxi" target="principal">Solicitar</a></li>
						<li><a href="EditarSolicitarTaxi.php" class="submenuSolicitarTaxi" target="principal">Editar</a></li>
						<li><a href="EliminarSolicitudTaxi.php" class="submenuSolicitarTaxi" target="principal">Eliminar</a></li>
					</ul>
				</li>

				<li><a href="EditarPrecio.php" target="principal"><span class="colorEditarPrecio"><i class="icon icon-banknote"></i></span>Editar Precio</a></li>

			</ul>				
		</nav>
	</header>

	
	<main>
		<div class="contenido">
			<iframe src="Principal.php" id="mainframe" scrolling="yes" name="principal" allowfullscreen="" frameborder="0">

				Tu navegador no acepta iframes

			</iframe>
			<footer>Derechos Reservados | kable &copy</footer>
		</div>
	</main>

	<?php  
		include("conexion.php"); //conecta con la BD
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

	<!-- Importante!!! esta etiqueta inicializa el cronometro ¡¡¡NO BORRAR!!! -->
	<p id="demo"></p>

	<script type="text/javascript">
		var segundos = 0;
		var minutos = 0;
		var horas = 0;

		var id=109;
		var confirma = "false";

		//alert("aers");
		
	</script>

	
	<!-- Contador por segundo (cronometro) -->
	<script>

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

			 //alert("prueba");

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
</body>
</html>





