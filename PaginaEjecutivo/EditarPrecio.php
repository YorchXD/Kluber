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


		/*$costoInicial = "Costo Inicial";

		$costoMetro = "Costo por metro de recorrido";

		$costoTiempo = "Costo por cada minuto de espera";*/
	   
	    $registros=$base->query("select * from precios")->fetchAll(PDO::FETCH_OBJ);

	    if($registros!=null)
	    {

		    $costoInicial = $registros[0]->costoInicial;

		    $costoMetro = $registros[0]->costoMetro;

		    $costoTiempo = $registros[0]->costoTiempo;
		}

		if(isset($_POST["botonEditar"]))
		{

		  	$costoInicial = $_POST["CostoInicial"];

	      	$costoMetro = $_POST["CostoMetro"];

	      	$costoTiempo = $_POST["CostoTiempo"];

	      	if($costoInicial=="" || $costoMetro=="Patente" || $costoTiempo=="")
		    {
		    	echo "<script>
	                alert('Faltan campos a completar');
	    		</script>";
		    }
		    else
		    {

		     	$sql="update precios set costoInicial=:costIni, costoMetro=:cosMet, costoTiempo=:costTiem";

		      	$resultado = $base->prepare($sql);

		      	$resultado->execute(array(":costIni"=>$costoInicial, ":cosMet"=>$costoMetro, ":costTiem"=>$costoTiempo));

		      	echo "<script>
		                alert('Se han editado precios con exito');
		                //window.location= 'MostrarTaxista.php';
		    		</script>";

			    //header("Location:MostrarTaxi.php");
			}

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
						<li><a href="EditarTaxistaDisponibilidad.php" class="submenuChofer">Editar Disponibilidad</a></li>
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
				<li><a href="#"><span class="colorSolicitarTaxi"><i class="icon icon-map"></i></span>Solicitar taxi</a>
					<ul class="submenuSolicitarTaxi">
						<li><a href="SolicitarTaxi.php" class="submenuSolicitarTaxi">Solicitar</a></li>
						<li><a href="#" class="submenuSolicitarTaxi">Editar</a></li>
						<li><a href="#" class="submenuSolicitarTaxi">Eliminar</a></li>
					</ul>

				</li>
			</ul>				
		</nav>
	</header>

	<div class="formulariosChicos">

		<h2>Editar Precio</h2>

		<h4>Escoja patente del Taxi</h4>
	  		
	  		<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
		
	
		    <div class="registroTaxitaForm">
		    	<tr>
			        <input type="CostoInicial" class="form-control" id="CostoInicial" name="CostoInicial" placeholder="Costo inicial" value="<?php echo $costoInicial?>">
			    </tr>
		    </div>
	
   		    <div class="registroTaxitaForm">       
		        <input type="CostoMetro" class="form-control" id="CostoMetro" placeholder="Costo por metro de recorrido" name="CostoMetro" value="<?php echo $costoMetro?>">
		    </div>

		     <div class="registroTaxitaForm">       
		        <input type="CostoTiempo" class="form-control" id="CostoTiempo" placeholder="Costo por cada minuto de espera" name="CostoTiempo" value="<?php echo $costoTiempo?>">
		    </div>
		    
		    <center>
				<button name="botonEditar" id="botonEditar" type="submit" class="btn btn-warning">Editar</button>
			</center>
		 </form>	
	</div>

	<footer>Derechos Reservados | kable &copy</footer>

	</body>
</html>
