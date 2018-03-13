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
	<script src="http://code.jquery.com/jquery-1.5.js"></script> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


	<script src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAbHrKUT1z_--ipu2ioG5QNWx_AB_hgOOk&libraries=places"></script>

	<script src="localizacion.js"></script>
	<script src="mainEditar.js"></script>
	
	<!-- Se ingresa ala funcion mostrarAlerta2 para pasar los datos y editar pedido -->
	<script>
		//al hacer click en el boton Solicitar se edita Pedido
	    $(document).on("click","#botonEditar", mostrarAlerta);    

		function mostrarAlerta(){
			nombreValue = document.getElementById('Nombre').value;
			apellidoValue = document.getElementById('Apellido').value;
			telefonoValue = document.getElementById('Telefono').value;
			direccionOrigen= document.getElementById('autocompleteInicio').value;
			direccionDestino= document.getElementById('autocompleteDestino').value;

			if(nombreValue!='' && apellidoValue!='' && telefonoValue!='' && direccionOrigen!='' && direccionDestino!='')
			{
				return mostrarAlerta2();
			}
			else
			{
				alert("Verifica que los campos no esten vacios");
				return false;
			}

	    }
	                  
	</script>

</head>
<body>
	<?php 

		//-------- Captura fecha actual ---------//
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
		//-------------------------//

		$taxi = "";

		include("conexion.php");//conexion BD

		$RegistroTaxis=$base->query("select * from taxi")->fetchAll(PDO::FETCH_OBJ);		

		$numeroPedido = "Numero Pedido";

		$nombreCliente = "Nombre Cliente";

		$apellidoCliente = "Apellido Cliente";

		$direccionInicial = "Dirección Inicial";

		$direccionDestino = "Dirección Destino";

		$nombreTaxista = "Nombre Taxista";

		$apellidoTaxista = "Apellido Taxista";

		$estado = "Estado";

		$telefono = "Teléfono";

		$correoTaxista = "Correo";

		$RegistroPedido=$base->query("select * from pedido")->fetchAll(PDO::FETCH_OBJ);//consulta para obtener datos de los pedidos

		/* Al hacer click en el boton Buscar buscar el pedido por ID del pedido */
		if(isset($_POST["botonBuscar"]))
		{
			/* Si se ecoje un pedido se busca pedido */
			if($_POST["comboboxPedidos"]!="Escoja")
			{
			    $numPedido = $_POST["comboboxPedidos"];

			    //echo $numPedido;
			    $registros=$base->query("select * from pedido where id='$numPedido'")->fetchAll(PDO::FETCH_OBJ);//consulta para obtener datos del pedido
		

			    if($registros!=null)
			    {
			    	$rutTaxista = $registros[0]->RefChoferTaxista;

					$RegistroTaxista=$base->query("select * from taxista inner join disponibilidadchoferes on taxista.rut = disponibilidadchoferes.RefTaxista where disponibilidadchoferes.estado='disponible' or disponibilidadchoferes.RefTaxista='$rutTaxista'")->fetchAll(PDO::FETCH_OBJ); //consulta par aobtener los datos del taxista que este disponible y el que se haya seleccionado

			    	$numeroPedido = $registros[0]->id;

				 	$nombreCliente = $registros[0]->nombre;

				 	$apellidoCliente = $registros[0]->apellido;

				  	$direccionInicial = $registros[0]->direccionInicial;

		  		  	$direccionDestino = $registros[0]->direccionFinal;

		  		  	$telefono = $registros[0]->telefono;

		  		  	$registroTaxista2=$base->query("select * from taxista where rut='$rutTaxista'")->fetchAll(PDO::FETCH_OBJ);//consulta para obtener datos del taxista

		  		  	$correoTaxista = $registroTaxista2[0]->correo;
			
				}
				else
				{
					$numeroPedido = "$numeroPedido";
				}
			}
		}


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
						<li><a href="EditarSolicitarTaxi.php" class="submenuSolicitarTaxi">Editar</a></li>
						<li><a href="EliminarSolicitudTaxi.php" class="submenuSolicitarTaxi">Eliminar</a></li>
					</ul>

				</li>
			</ul>				
		</nav>
	</header>

	<div class="wrapper">
		<center>
			<div class="formulario">
				<h2>Editar solicitud taxi</h2>

				<!-- Formulario para ingresar campos a modificar pedido -->
				<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">

					<div class="registroTaxitaForm"> 

						<!-- ComboBox para seleccionar pedido y buscarlo -->
					    <select class="registroTaxitaForm" name="comboboxPedidos" id="comboboxPedidos">
					    	<optgroup label="Escoja id del pedido">

				    			<option  value=<Escoja>Escoja id</option>

					    		<?php foreach ($RegistroPedido as $pedidos):?>
					    			<?php if(($pedidos->fecha == $fechaActual) && ($pedidos->estado == "esperando")) 
					    			{?>
										<option  value=<?php echo $pedidos->id?>><?php echo $pedidos->id?></option>
									<?php } ?>
								<?php endforeach; ?>
							</optgroup>
						</select> 
					</div>

					<center>
						<button name="botonBuscar" id="botonBuscar" type="submit" class="btn btn-warning">Buscar</button>
					</center>

					<div class="solicitud">
					    <input type="NumeroPedido" class="form-control" id="NumeroPedido" placeholder="Numero Pedido" name="NumeroPedido" value="<?php echo $numeroPedido?>" readonly="readonly">
				    </div>
				
				    <div class="solicitud">
					    <input type="Nombre" class="form-control" id="Nombre" placeholder="Nombre" name="Nombre" value="<?php echo $nombreCliente?>">
				    </div>
				
				    <div class="solicitud">         
				        <input type="ApellidoPaterno" class="form-control" id="Apellido" placeholder="Apellido Paterno" name="ApellidoPaterno" value="<?php echo $apellidoCliente?>">
				    </div>
				
				    <div class="solicitud">         
				        <input type="Telefono" class="form-control" id="Telefono" placeholder="Teléfono" name="Telefono" value="<?php echo $telefono?>">
				    </div>
				
				    <div class="solicitud">         
				    	<input type="text" class="form-control" id="autocompleteInicio" placeholder="Origen" name="Origen" value="<?php echo $direccionInicial?>">
				    </div>
				
				    <div class="solicitud">
				    	<input type="text" class="form-control" id="autocompleteDestino" placeholder="Destino" name="Destino" value="<?php echo $direccionDestino?>">
				    </div>

				    <!-- Combobox para seleccionar el taxista que va a  realizar el pedido -->
				     <div class="registroTaxistaForm"> 

					    <select class="registroTaxistaForm" name="comboboxTaxista" id="comboboxTaxista">
					    	<optgroup label="Escoja correo del taxista">
					    	<option  value=<?php echo $correoTaxista?>><?php echo $correoTaxista?></option>
				    		<?php foreach ($RegistroTaxista as $taxista):?>
				    			<?php if($correoTaxista!=$taxista->correo) 
		    					{?>
									<option  value=<?php echo $taxista->correo?>><?php echo $taxista->correo?></option>
								<?php  }?>
							<?php endforeach; ?>
						</select> 

					</div>
				
					<center>
						<button id="botonEditar" name="botonEditar" type="submit" class="btn btn-warning" >Editar solicitud</button>
					</center>

				</form>
			</div>
			<div class="mapa">
				<div class="contInfoTrayecto">
					<ul>
						<li><span><i class="icon icon-road"></i></span><div id="distancia">0 km</div></li>
						<li><span><i class="icon icon-clock"></i></span><div id="tiempo">0 min</div></li>
						<li><span><i class="icon icon-banknote"></i></span><div id="dinero">$0</div></li>
					</ul>				
				</div>
				
				<div id="map"></div>
			</div>
			
		</center>
		
	</div>

	<footer>Derechos Reservados | kable &copy</footer>


</body>
</html>
