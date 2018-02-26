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

	
	
	<div>
		<div class="wrapper">
			<h2 >Lista de pedido</h2>
			<table class="table">
			    <thead>
			      	<tr>
				        <th>#</th>
				        <th>Nombre</th>
				        <th>Apellido</th>
				        <th>Dirección Inicial</th>
				        <th>Dirección Destino</th>
				        <th>Teléfono</th>
				        <th>Taxista</th>
				        <th>Estado</th>
				        <th>Tiempo</th>
			     	</tr>
			    </thead>
			    <tbody>      
			      	<tr class="success">
				        <td>Success</td>
				        <td>Doe</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
			      	</tr>
			      	<tr class="success">
				        <td>Success</td>
				        <td>Doe</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
			      	</tr>
			      	<tr class="danger">
				        <td>Danger</td>
				        <td>Moe</td>
				        <td>mary@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
			      	</tr>
			    </tbody>
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
				        <th>Nombre</th>
				        <th>Apellido</th>
				        <th>Ubicación</th>
				        <th>Estado</th>
			      	</tr>
			    </thead>
			    <tbody>    
			      	<tr class="success">
				        <td>Success</td>
				        <td>Doe</td>
				        <td>john@example.com</td>
				        <td>23 Norte</td>
				        <td>Disponible</td>
			      	</tr>
			      	<tr class="danger">
				        <td>Danger</td>
				        <td>Moe</td>
				        <td>mary@example.com</td>
				        <td>23 Norte</td>
				        <td>Ocupado</td>
			      	</tr>
			      	<tr class="active">
				        <td>Active</td>
				        <td>Activeson</td>
				        <td>act@example.com</td>
				        <td>23 Norte</td>
				        <td>No Disponible</td>
			      	</tr>
			    </tbody>
			</table>
		</div>
		
		
		<div class="wrapper">
			<h2>Historial de pedidos durante el día</h2>
		  	<table class="table">
		    	<thead>
		      		<tr>
				        <th>#</th>
				        <th>Nombre</th>
				        <th>Apellido</th>
				        <th>Dirección Inicial</th>
				        <th>Dirección Destino</th>
				        <th>Teléfono</th>
				        <th>Taxista</th>
				        <th>Estado</th>
				        <th>Tiempo</th>
		     	 	</tr>
		    	</thead>
			    <tbody>      
				    <tr class="active">
				        <td>Success</td>
				        <td>Doe</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				    </tr>
				    <tr class="active">
				        <td>Success</td>
				        <td>Doe</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				    </tr>
				    <tr class="active">
				        <td>Danger</td>
				        <td>Moe</td>
				        <td>mary@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				        <td>john@example.com</td>
				    </tr>
			    </tbody>
		  	</table>
		</div>
		
		
		<div class="botones">
			<div class="btn"><a class="abtn" href="#"></a>Mostrar</div>
		</div>
	</div>

	<footer>Derechos Reservados | kable &copy</footer>

</body>
</html>
