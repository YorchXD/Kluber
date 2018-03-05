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
						<li><a href="EliminarTaxista.php" class="submenuChofer" target="principal">Deshabilitar</a></li>
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
						<li><a href="#" class="submenuSolicitarTaxi" target="principal">Editar</a></li>
						<li><a href="#" class="submenuSolicitarTaxi" target="principal">Eliminar</a></li>
					</ul>

				</li>
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
</body>
</html>



