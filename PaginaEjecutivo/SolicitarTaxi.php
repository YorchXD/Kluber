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
	<script src="main.js"></script>

	<!-- Se ingresa ala funcion mostrarAlerta2 para pasar los datos y registrar pedido -->
	<script>
	    //$(document).on("click","#botonSolicitar", mostrarAlerta);
	    
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

	<script type="text/javascript">
		function mostrarDatos(numeroPedido, nombreCliente , apellidoCliente ,direccionInicial, direccionDestino, telefono, latitudInicial, longitudInicial, latitudFinal, longitudFinal,tiempoEst, segundosEst, distanciaEst, costoEst, fecha, hora)		{
			//alert("direccion inicicial: " + direccionInicial);
			mostrarDatos2(numeroPedido, nombreCliente, apellidoCliente, direccionInicial, direccionDestino, telefono, latitudInicial, longitudInicial, latitudFinal, longitudFinal, tiempoEst, segundosEst, distanciaEst, costoEst, fecha, hora);
		}
	</script>

</head>
<body>

	<?php 

		include("conexion.php"); //conexió con la BD

		$taxi = "";

		$RegistroTaxista=$base->query("select * from taxista inner join disponibilidadchoferes on taxista.rut = disponibilidadchoferes.RefTaxista where disponibilidadchoferes.estado='disponible'")->fetchAll(PDO::FETCH_OBJ); //consulta para obtener los datos del taxista que este disponible



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
				<h2>Solicitar taxi</h2>

				<!-- Formulario para ingresar al campo los datos de la solicitud -->				
				<form action="Principal.php" onsubmit="return mostrarAlerta()">
				
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

				    <!-- Combobox para seleccionar al taxista que va a hacer el recorrido de la solicitud -->
				    <div class="registroTaxistaForm"> 

					    <select class="registroTaxistaForm" name="comboboxTaxista" id="comboboxTaxista">
					    	<optgroup label="Escoja correo del taxista">
				    		<option  value="Correo">Correo</option>
				    		<?php foreach ($RegistroTaxista as $taxista):?>
								<option  value=<?php echo $taxista->correo?>><?php echo $taxista->correo?></option>
							<?php endforeach; ?>
						</select> 

					</div>
					
					<!-- Separador-->
					<label></label>
					
					<center>
						<button id="botonSolicitar" type="submit" class="btn btn-warning" >Enviar solicitud</button>
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

</body>
</html>
