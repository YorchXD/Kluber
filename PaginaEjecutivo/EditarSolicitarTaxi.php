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

		function mostrarAlerta()
		{
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

	<script type="text/javascript">
		function mostrarDatos(numeroPedido, nombreCliente , apellidoCliente ,direccionInicial, direccionDestino, telefono, latitudInicial, longitudInicial, latitudFinal, longitudFinal,tiempoEst, segundosEst, distanciaEst, costoEst, fecha, hora)		{
			//alert("direccion inicicial: " + direccionInicial);

			
			mostrarDatos2(numeroPedido, nombreCliente, apellidoCliente, direccionInicial, direccionDestino, telefono, latitudInicial, longitudInicial, latitudFinal, longitudFinal, tiempoEst, segundosEst, distanciaEst, costoEst, fecha, hora);
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

		

	    /*if($_POST["comboboxPedidos"] == "Escoja id")
	  	{
		  	$numeroPedido = "Numero Pedido";
		}
		else
		{
			$numeroPedido =  $_GET["id"];
		}*/
		/*echo "<script>

        	alert($_POST['idCaptura']);
		</script>";	*/

		//$prueba = $_POST["idCaptura"];
		$RegistroTaxista=$base->query("select * from taxista inner join disponibilidadchoferes on taxista.rut = disponibilidadchoferes.RefTaxista where disponibilidadchoferes.estado='disponible'")->fetchAll(PDO::FETCH_OBJ); //consulta par aobtener los datos del taxista que este disponible y el que se haya seleccionado

		$editar = 0;

		if (isset($_GET['id']) && !empty($_GET['id'])) 
		{
		  	// assign value to local variable
			


		  	$numeroPedido = $_GET['id'];
		  	$nombreCliente =  $_GET["nombreCliente"];
			$apellidoCliente =  $_GET["apellidoCliente"];
			$direccionInicial =  $_GET["direccionInicial"];
			$direccionDestino =  $_GET["direccionDestino"];
			$telefono =  $_GET["telefono"];
			$latitudInicial = $_GET["latitudInicial"];
			$longitudInicial = $_GET["longitudInicial"];
			$latitudFinal = $_GET["latitudFinal"];
			$longitudFinal = $_GET["longitudFinal"];

			$tiempoEst = $_GET["tiempo"];
			$segundosEst = $_GET["segundos"];
			$distanciaEst = $_GET["distancia"];
			$costoEst = $_GET["costo"];
			$fecha = $_GET["fecha"];
			$hora = $_GET["hora"];

			$editar = 1;

		} 
		else 
		{

		  	$numeroPedido = "Numero Pedido";
		  	$nombreCliente = "Nombre Cliente";
			$apellidoCliente = "Apellido Cliente";
			$direccionInicial = "Dirección Inicial";
			$direccionDestino = "Dirección Destino";
			$nombreTaxista = "Nombre Taxista";
			$apellidoTaxista = "Apellido Taxista";
			$estado = "Estado";
			$telefono = "Teléfono";

		}
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

					$latitudInicial =  $registros[0]->latitudInicial;
					$longitudInicial = $registros[0]->longitudInicial;
					$latitudFinal = $registros[0]->latitudFinal;
					$longitudFinal = $registros[0]->longitudFinal;

					$tiempoEst = $registros[0]->tiempoEstimado;
					$segundosEst = $registros[0]->segundosEstimados;
					$distanciaEst = $registros[0]->distanciaEstimada;
					$costoEst = $registros[0]->costoEstimado;
					$fecha = $registros[0]->fecha;
					$hora = $registros[0]->hora;

		  		  	$registroTaxista2=$base->query("select * from taxista where rut='$rutTaxista'")->fetchAll(PDO::FETCH_OBJ);//consulta para obtener datos del taxista
		  		  	$correoTaxista = $registroTaxista2[0]->correo;
		  		  	$editar = 1;
			
				}
				else
				{
					$numeroPedido = "$numeroPedido";
				}
			}
		}


	 ?>

	 <script type="text/javascript">
	 	if('<?php echo $editar; ?>'==1)
	 	{

			var numeroPedido = '<?php echo $numeroPedido; ?>';
			var nombreCliente = '<?php echo $nombreCliente; ?>';
			var apellidoCliente = '<?php echo $apellidoCliente; ?>';
			var direccionInicial = '<?php echo $direccionInicial; ?>';
			var direccionDestino = '<?php echo $direccionDestino; ?>';
			var telefono = '<?php echo $telefono; ?>';
			var latitudInicial = '<?php echo $latitudInicial; ?>';
			var longitudInicial = '<?php echo $longitudInicial; ?>';
			var latitudFinal = '<?php echo $latitudFinal; ?>';
			var longitudFinal = '<?php echo $longitudFinal; ?>';
			var tiempoEst = '<?php echo $tiempoEst; ?>';
			var segundosEst = '<?php echo $segundosEst; ?>';
			var distanciaEst = '<?php echo $distanciaEst; ?>';
			var costoEst = '<?php echo $costoEst; ?>';
			var fecha = '<?php echo $fecha; ?>';
			var hora = '<?php echo $hora; ?>';

			

			mostrarDatos(numeroPedido, nombreCliente , apellidoCliente ,direccionInicial, direccionDestino, telefono, latitudInicial, longitudInicial,
				latitudFinal, longitudFinal,tiempoEst, segundosEst, distanciaEst, costoEst, fecha, hora);
		}
		
	</script>

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

				    			<option  value=Escoja>Escoja id</option>

					    		<?php foreach ($RegistroPedido as $pedidos):?>
					    			<?php if(($pedidos->fecha == $fechaActual) && ($pedidos->estado == "esperando")) 
					    			{?>
										<option  value=<?php echo $pedidos->id?>><?php echo $pedidos->id?></option>
									<?php } ?>
								<?php endforeach; ?>
							</optgroup>
						</select> 
					</div>
					
					<!-- Separador-->
					<label></label>
					<center>
						<button name="botonBuscar" id="botonBuscar" type="submit" class="btn btn-warning">Buscar</button>
					</center>
					<!-- Separador-->
					<label></label>
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
				    		<?php if($correoTaxista!="1") 
	    					{?>
					    		<option  value=<?php echo $correoTaxista?>><?php echo $correoTaxista?></option>
				    		<?php  }?>
				    		<?php foreach ($RegistroTaxista as $taxista):?>
				    			<?php if($correoTaxista!=$taxista->correo) 
		    					{?>
									<option  value=<?php echo $taxista->correo?>><?php echo $taxista->correo?></option>
								<?php  }?>
							<?php endforeach; ?>
						</select> 

					</div>
					
					<!-- Separador-->
					<label></label>
					<center>
						<button id="botonEditar" name="botonEditar" type="submit" class="btn btn-warning" >Editar solicitud</button>
					</center>

					<input  type="hidden" class="form-control" name="idCaptura" value="">


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

</body>
</html>
