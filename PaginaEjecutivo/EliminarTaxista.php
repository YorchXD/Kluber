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


	  $rut = "Rut";

	  $correo = "Correo";

	  $nombre = "Nombre";

	  $apPaterno = "ApellidoPaterno";

	  $apMaterno = "ApellidoMaterno";

	  $telefono = "Telefono";

	  $clave = "Clave";

	  $taxi = "PatenteTaxi";

	  if(isset($_POST["botonBuscar"]))
	  {
	    $correo = $_POST["correo"];

	    $registros=$base->query("select * from taxista where correo='$correo'")->fetchAll(PDO::FETCH_OBJ);

	    if($registros!=null)
	    {
		    $rut = $registros[0]->rut;

		    $nombre = $registros[0]->nombre;

		    $apPaterno = $registros[0]->apPaterno;

		    $apMaterno = $registros[0]->apMaterno;

		    $telefono = $registros[0]->telefono;

		    $clave = $registros[0]->clave;

		    $taxi = $registros[0]->RefTaxi;
		}
		else
		{
			$correo = "Correo";
		}

	  }

	  if(isset($_POST["botonEliminar"]))
	  {

	  	$correo = $_POST["Correo"];

  		$base->query("delete from taxista where correo='$correo'");

	    header("Location:MostrarTaxista.php");

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
					<ul>
						<li><a href="MostrarTaxista.php" class="colorChofer">Ver</a></li>
						<li><a href="RegistroTaxista.php" class="colorChofer">Registrar</a></li>
						<li><a href="EditarTaxista.php" class="colorChofer">Editar</a></li>
						<li><a href="EliminarTaxista.php" class="colorChofer">Eliminar</a></li>
					</ul>
				</li>
				<li><a href="#"><span class="colorTaxi"><i class="icon icon-local_taxi"></i></span>Taxi</a>
					<ul>
						<li><a href="MostrarTaxi.php">Ver</a></li>
						<li><a href="RegistroTaxi.php">Registrar</a></li>
						<li><a href="EditarTaxi.php">Editar</a></li>
						<li><a href="EliminarTaxi.php">Eliminar</a></li>
					</ul>
				</li>
			</ul>				
		</nav>
	</header>


	<div>
		<h2>Eliminar Chofer</h2>
		
		
  		<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
  		
  			<div class="registroTaxitaForm">
		       		<input type="text" class="form-control" id="correo" placeholder="Correo Electrónico" name="correo">
		   </div>

		   <center>
				<button name="botonBuscar" id="botonBuscar" type="submit" class="btn btn-warning">Buscar</button>
			</center>

		      
		    <div class="registroTaxitaForm">
			    <input type="Rut" class="form-control" id="Rut" placeholder="Rut" name="Rut" value=<?php echo $rut?> readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">
			    <input type="Nombre" class="form-control" id="Nombre" placeholder="Nombre" name="Nombre" value=<?php echo $nombre?> readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="ApellidoPaterno" class="form-control" id="ApellidoPaterno" placeholder="Apellido Paterno" name="ApellidoPaterno" value=<?php echo $apPaterno?> readonly="readonly">
		    </div>
		    <div class="registroTaxitaForm">         
		        <input type="ApellidoMaterno" class="form-control" id="ApellidoMaterno" placeholder="Apellido Materno" name="ApellidoMaterno" value=<?php echo $apMaterno?> readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Correo" class="form-control" id="Correo" placeholder="Correo Electrónico" name="Correo" value=<?php echo $correo?> readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Contrasena" class="form-control" id="Contrasena" placeholder="Contraseña" name="Contrasena" value=<?php echo $clave?> readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Telefono" class="form-control" id="Telefono" placeholder="Teléfono" name="Telefono" value=<?php echo $telefono?> readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="NumeroTaxi" class="form-control" id="NumeroTaxi" placeholder="Patente Taxi" name="NumeroTaxi" value=<?php echo $taxi?> readonly="readonly">
		    </div>
		    
		    <center>
					<button name="botonEliminar" id="botonEliminar" type="submit" class="btn btn-warning">Eliminar</button>
				</center>
		</form>
	</div>

  	<footer>Derechos Reservados | kable &copy</footer>



</body>
</html>
