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

	  include("conexion.php"); //conecta con la BD

	  $rut = "Rut";

	  $correo = "Correo";

	  $nombre = "Nombre";

	  $apPaterno = "Apellido Paterno";

	  $apMaterno = "Apellido Materno";

	  $estado = "Estado";

	  $RegistroTaxista=$base->query("select * from taxista")->fetchAll(PDO::FETCH_OBJ); //consulta Taxista para obtener sus datos

	  /* Al hacer click en el buscar busca taxista */
	  if(isset($_POST["botonBuscar"]))
	  {
	    $correo = $_POST["comboboxTaxista"];

	    $registrosTaxista2=$base->query("select * from taxista where correo='$correo'")->fetchAll(PDO::FETCH_OBJ);//consulta taxista para obtener sus datos

	    $rutTaxista2 = $registrosTaxista2[0]->rut;

	    $registros=$base->query("select * from disponibilidadchoferes where RefTaxista='$rutTaxista2'")->fetchAll(PDO::FETCH_OBJ); //consulta disponiblidadchoferes para obtener sus datos

	    if($registros!=null)
	    {
		    $rut = $registros[0]->RefTaxista;

		    $nombre = $registrosTaxista2[0]->nombre;

		    $apPaterno = $registrosTaxista2[0]->apPaterno;

		    $apMaterno = $registrosTaxista2[0]->apMaterno;

		    $estado = $registros[0]->estado;
		}
		else
		{
			$correo = "Correo";
		}

	  }

	  if(isset($_POST["botonEditar"]))
	  {

	  	$correo = $_POST["Correo"];

	  	$estado = $_POST["comboboxEstado"];

  		//$base->query("delete from taxista where correo='$correo'");

  		
		/*if($_POST["comboboxEstado"]=="Habilitado")
	    {
	    	$estado = "habilitado";
	    }
	    if ($_POST["comboboxEstado"]=="Deshabilitado")
	    {
	    	$estado = "deshabilitado";
	    }*/

		$registroTaxista = $base->query("select * from taxista where correo='$correo'")->fetchAll(PDO::FETCH_OBJ); //consulta txista para obtener sus datos

		$rutTaxista = $registroTaxista[0]->rut;

		$base->query("update disponibilidadchoferes set estado='$estado', tiempoDisponible='00:00:00' where RefTaxista='$rutTaxista'"); //consulta para editar disponibilidadchoferes

		 echo "<script>
            alert('se cambio el estado del taxista a \"$estado\" con exito');
            window.location= 'Principal.php'
		</script>";
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


	<div>
		<h2>Editar Disponibildad Chofer</h2>
		
		
  		<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">


  			<!-- Combobox para seleccionar taxista -->
		    <div class="registroTaxitaForm"> 

			    <select class="registroTaxitaForm" name="comboboxTaxista">
			    	<optgroup label="Escoja correo del taxista">

		    		<?php foreach ($RegistroTaxista as $taxista):?>
		    			<?php if($taxista->estado=="habilitado") //muestra solo taxista habilitado
	    				{?>
							<option  value=<?php echo $taxista->correo?>><?php echo $taxista->correo?></option>
						<?php }?>
					<?php endforeach; ?>
				</select> 

			</div>

		   <center>
				<button name="botonBuscar" id="botonBuscar" type="submit" class="btn btn-warning">Buscar</button>
			</center>

		      
		    <div class="registroTaxitaForm">
			    <input type="Rut" class="form-control" id="Rut" placeholder="Rut" name="Rut" value="<?php echo $rut?>" readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">
			    <input type="Nombre" class="form-control" id="Nombre" placeholder="Nombre" name="Nombre" value="<?php echo $nombre?>" readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="ApellidoPaterno" class="form-control" id="ApellidoPaterno" placeholder="Apellido Paterno" name="ApellidoPaterno" value="<?php echo $apPaterno?>" readonly="readonly">
		    </div>
		    <div class="registroTaxitaForm">         
		        <input type="ApellidoMaterno" class="form-control" id="ApellidoMaterno" placeholder="Apellido Materno" name="ApellidoMaterno" value="<?php echo $apMaterno?>" readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Correo" class="form-control" id="Correo" placeholder="Correo Electrónico" name="Correo" value="<?php echo $correo?>" readonly="readonly">
		    </div>
		
			<!-- Combobox para selccionar disponiblidad de taxista -->
		    <div class="registroTaxitaForm">
			    <select class="registroTaxitaForm" name="comboboxEstado">
			    	<optgroup label=<?php echo $estado?>>
			    	<?php if  ($estado == "ocupado")
			    	{?>
						<option  value="ocupado">ocupado</option>
						<option value="no disponible">no disponible</option>
						<option value="disponible">disponible</option>
					<?php  }?>
					<?php if  ($estado == "no disponible")
			    	{?>
						<option value="no disponible">no disponible</option>
						<option  value="ocupado">ocupado</option>
						<option value="disponible">disponible</option>
					<?php  }?>
					<?php if  ($estado == "disponible")
			    	{?>
			    		<option value="disponible">disponible</option>
						<option value="no disponible">no disponible</option>
						<option  value="ocupado">ocupado</option>						
					<?php  }?>
				</select> 
			</div>
		    
		    <center>
					<button name="botonEditar" id="botonEditar" type="submit" class="btn btn-warning">Editar Estado</button>
			</center>s
		</form>
	</div>

  	<footer>Derechos Reservados | kable &copy</footer>



</body>
</html>
