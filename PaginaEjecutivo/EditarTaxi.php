<?php
	session_start();
?>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="styleCrud.css">
		<link rel="stylesheet" type="text/css" href="Imagenes\fonts.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
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
						
						<div class="botonesPerfil">
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


	  	<div>
	  		<h2>Editar Taxi</h2>
	  		
	  		<h4>Ingrese patente del Taxi</h4>
	  		
	  		<form action="/action_page.php">
	  		
	  					  	<div class="registroTaxitaForm">
	  					       		<input type="patente" class="form-control" id="patente" placeholder="Patente" name="patente">
	  					   </div>
	  		
	  					   <center>
	  							<button id="botonRegistro" type="submit" class="btn btn-warning">Buscar</button>
	  						</center>
	  		
	  					</form>
	  		
	  		
	  		<h4>Ingrese nuevos datos a modificar</h4>
	  		
	  					<form action="/action_page.php">
	  					    <div class="registroTaxitaForm">
	  				       		<input type="Patente" class="form-control" id="Patente" placeholder="Patente" name="Patente">
	  					    </div>
	  					    <div class="registroTaxitaForm">         
	  				        	<input type="Marca" class="form-control" id="Marca" placeholder="Marca Paterno" name="Marca">
	  					    </div>
	  					    <div class="registroTaxitaForm">        
	  					        <input type="Modelo" class="form-control" id="Modelo" placeholder="Modelo" name="Modelo">
	  					    </div>
	  		
	  					    <div class="registroTaxitaForm">          
	  					        <input type="NumeroTaxi" class="form-control" id="NumeroTaxi" placeholder="Número Taxi" name="NumeroTaxi">
	  					    </div>
	  					    
	  					    <center>
	  							<button id="botonRegistro" type="submit" class="btn btn-warning">Editar</button>
	  						</center>
	  				 	</form>
	  	</div>

	 	<div class="footer">Derechos Reservados | kable &copy</div>

	</body>
</html>
