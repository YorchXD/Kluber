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

		  if(isset($_POST["botonRegistro"]))
		  {

		    $patente = $_POST["patente"];

		    $marca = $_POST["marca"];

		    $modelo = $_POST["modelo"];

		    $numTaxi = $_POST["numTaxi"];

		    $anio = $_POST["anio"];

		   	$sql="insert into taxi (patente, marca, modelo, numTaxi, anio) values (:pat, :mar, :mod, :numT, :anio)";

		    $resultado = $base->prepare($sql);

		    $resultado->execute(array(":pat"=>$patente, ":mar"=>$marca, ":mod"=>$modelo, ":numT"=>$numTaxi, ":anio"=>$anio));

		    header("Location:MostrarTaxi.php");

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
			<h2>Registrar Taxi</h2>
			
			<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
			
			    <div class="registroTaxitaForm">
			        <input type="Patente" class="form-control" id="patente" placeholder="patente" name="patente">
			    </div>
			    <div class="registroTaxitaForm">         
			        <input type="Marca" class="form-control" id="marca" placeholder="marca" name="marca">
			    </div>
			    <div class="registroTaxitaForm">         
			        <input type="Modelo" class="form-control" id="modelo" placeholder="modelo" name="modelo">
			    </div>
			
			    <div class="registroTaxitaForm">         
			        <input type="NumeroTaxi" class="form-control" id="numTaxi" placeholder="número Taxi" name="numTaxi">
			    </div>

			    <div class="registroTaxitaForm">         
			        <input type="anio" class="form-control" id="anio" placeholder="Año" name="anio">
			    </div>
			    
				<center>
					<button name="botonRegistro" id="botonRegistro" type="submit" class="btn btn-warning">Registrar</button>
				</center>
			</form>
		</div>

		<div class="footer">Derechos Reservados | kable &copy</div>


	</body>
</html>

					