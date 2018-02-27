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
		<?php

		  include("conexion.php");

		  $registros=$base->query("select * from taxi")->fetchAll(PDO::FETCH_OBJ);

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
					<ul class="submenuChofer">
						<li><a href="MostrarTaxista.php" class="submenuChofer">Ver</a></li>
						<li><a href="RegistroTaxista.php" class="submenuChofer">Registrar</a></li>
						<li><a href="EditarTaxista.php" class="submenuChofer">Editar</a></li>
						<li><a href="EliminarTaxista.php" class="submenuChofer">Eliminar</a></li>
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
				<li><a href="SolicitarTaxi.php"><span class="colorSolicitarTaxi"><i class="icon icon-map"></i></span>Solicitar taxi</a></li>
			</ul>				
		</nav>
		</header>

		<div>
			<div class="wrapper">
				<h2 >Lista de Taxis</h2>
				<table class="table">
				    <thead>
				      	<tr>
	  				        <th>Patente</th>
					        <th>Marca</th>
					        <th>Modelo</th>
					        <th>Número Taxi</th>
					        <th>Año</th>
				     	</tr>
				    </thead>


			<?php foreach ($registros as $taxi):?> 



				    <tbody>      
				      	<tr class="success">
					        <td><?php echo $taxi->patente ?></td>
					        <td><?php echo $taxi->marca ?></td>
					        <td><?php echo $taxi->modelo ?></td>
					        <td><?php echo $taxi->numTaxi ?></td>
					        <td><?php echo $taxi->anio ?></td>
				      	</tr>
				    </tbody>

		    <?php endforeach; ?>

	    	</table>

			</div>
		</div>


		
		<footer>Derechos Reservados | kable &copy</footer>


	</body>
</html>
