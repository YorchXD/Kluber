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
	<script>
	    $(document).on("click","#botonSolicitar", mostrarAlerta);
	    function mostrarAlerta(){
	        mostrarAlerta2();          //aquí estamos activando la función del otro archivo
	        setTimeout(console.log('esperando'),10000);
	    }
	</script>

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
				<li><a href="Principal.php"><span class="colorInicio"><i class="icon icon-home"></i></span>Inicio</a></li>
				<li><a href="Historial.php"><span class="colorHistorial"><i class="icon icon-open-book"></i></span>Historial</a></li>
				<li><a href="#"><span class="colorChofer"><i class="icon icon-person_pin"></i></span>Chofer</a>
					<ul>
						<li><a href="RegistroTaxista.php" class="colorChofer">Registrar</a></li>
						<li><a href="EditarTaxista.php" class="colorChofer">Editar</a></li>
						<li><a href="EliminarTaxista.php" class="colorChofer">Eliminar</a></li>
					</ul>
				</li>
				<li><a href="#"><span class="colorTaxi"><i class="icon icon-local_taxi"></i></span>Taxi</a>
					<ul>
						<li><a href="RegistroTaxi.php">Registrar</a></li>
						<li><a href="EditarTaxi.php">Editar</a></li>
						<li><a href="EliminarTaxi.php">Eliminar</a></li>
					</ul>
				</li>
				<li><a href="SolicitarTaxi.php"><span class="colorSolicitarTaxi"><i class="icon icon-map"></i></span>Solicitar taxi</a></li>
			</ul>				
		</nav>
	</header>

	<div class="wrapper">
		<center>
			<div class="formulario">
				<h2>Solicitar taxi</h2>
				
				<form>
				
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

	<div class="footer">Derechos Reservados | kable &copy</div>


</body>
</html>