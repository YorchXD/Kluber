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


	  $patente = "Patente";

	  $marca = "Marca";

	  $modelo = "Modelo";

	  $numTaxi = "Número_Taxi";

	  $anio = "Año";

	  if(isset($_POST["botonBuscar"]))
	  {
	    $patente = $_POST["patente"];

	   
	    $registros=$base->query("select * from taxi where patente='$patente'")->fetchAll(PDO::FETCH_OBJ);

	    if($registros!=null)
	    {

		    $marca = $registros[0]->marca;

		    $modelo = $registros[0]->modelo;

		    $numTaxi = $registros[0]->numTaxi;

		    $anio = $registros[0]->anio;
		}
		else
		{
			$patente = "Patente";
		}

	  }

	  if(isset($_POST["botonEliminar"]))
	  {

	  	$patente = $_POST["Patente"];

  		$base->query("delete from taxi where patente='$patente'");

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

	<div class="formulariosChicos">

		<h2>Eliminar Taxi</h2>

		<h4>Ingrese patente del Taxi</h4>
	  		
	  		<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
	  		
	  			<div class="registroTaxitaForm">
			       		<input type="text" class="form-control" id="patente" placeholder="Patente" name="patente">
			   </div>

			   <center>
					<button name="botonBuscar" id="botonBuscar" type="submit" class="btn btn-warning">Buscar</button>
				</center>

		
	
			    <div class="registroTaxitaForm">
			    	<tr>
				        <input type="text" class="form-control" id="Patente" name="Patente" placeholder="Patente" value=<?php echo $patente?> readonly="readonly">
				    </tr>
			    </div>
		
	   		    <div class="registroTaxitaForm">       
			        <input type="Marca" class="form-control" id="Marca" placeholder="Marca" name="Marca" value=<?php echo $marca?> readonly="readonly">
			    </div>

			     <div class="registroTaxitaForm">       
			        <input type="modelo" class="form-control" id="Modelo" placeholder="Modelo" name="Marca" value=<?php echo $modelo?> readonly="readonly">
			    </div>

			     <div class="registroTaxitaForm">       
			        <input type="NumeroTaxi" class="form-control" id="NumeroTaxi" placeholder="Número Taxi" name="NumeroTaxi" value=<?php echo $numTaxi?> readonly="readonly">
			    </div>

			    <div class="registroTaxitaForm">       
			        <input type="Anio" class="form-control" id="Anio" placeholder="Año" name="Anio" value=<?php echo $anio?> readonly="readonly">
			    </div>

			    
			    <center>
					<button name="botonEliminar" id="botonEliminar" type="submit" class="btn btn-warning">Eliminar</button>
				</center>
			 </form>	
	</div>

	<footer>Derechos Reservados | kable &copy</footer>

</body>
</html>
