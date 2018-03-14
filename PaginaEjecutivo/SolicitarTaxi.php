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

</head>
<body>

	<?php 

		include("conexion.php"); //conexió con la BD

		$taxi = "";

		$RegistroTaxista=$base->query("select * from taxista inner join disponibilidadchoferes on taxista.rut = disponibilidadchoferes.RefTaxista where disponibilidadchoferes.estado='disponible'")->fetchAll(PDO::FETCH_OBJ); //consulta para obtener los datos del taxista que este disponible

	?>

	<div class="wrapper">
		<center>
			<div class="formulario">
				<h2>Solicitar taxi</h2>

				<!-- Formulario para ingresar al campo los datos de la solicitud -->				
				<form action="Principal.php" onsubmit="return mostrarAlerta()">
				
				    <div class="solicitud">
					    <input type="Nombre" class="form-control" id="Nombre" placeholder="Nombre" name="Nombre">
				    </div>
				
				    <div class="solicitud">         
				        <input type="ApellidoPaterno" class="form-control" id="Apellido" placeholder="Apellido Paterno" name="ApellidoPaterno">
				    </div>
				
				    <div class="solicitud">         
				        <input type="Telefono" class="form-control" id="Telefono" placeholder="Teléfono" name="Telefono">
				    </div>
				
				    <div class="solicitud">         
				    	<input type="text" class="form-control" id="autocompleteInicio" placeholder="Origen" name="Origen">
				    </div>
				
				    <div class="solicitud">
				    	<input type="text" class="form-control" id="autocompleteDestino" placeholder="Destino" name="Destino">
				    </div>

				    <!-- Combobox para seleccionar al taxista que va a hacer el recorrido de la solicitud -->
				    <div class="registroTaxistaForm"> 

					    <select class="registroTaxistaForm" name="comboboxTaxista" id="comboboxTaxista">
					    	<optgroup label="Escoja correo del taxista">
				    		<?php foreach ($RegistroTaxista as $taxista):?>
								<option  value=<?php echo $taxista->correo?>><?php echo $taxista->correo?></option>
							<?php endforeach; ?>
						</select> 

					</div>
				
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
