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

	  $estado = "Estado";

	  $RegistroTaxista=$base->query("select * from taxista")->fetchAll(PDO::FETCH_OBJ);

	  $RegistroTaxis=$base->query("select * from taxi")->fetchAll(PDO::FETCH_OBJ);


	  if(isset($_POST["botonBuscar"]))
	  {
	    $correo = $_POST["comboboxTaxista"];

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

		    $estado = $registros[0]->estado;
		}
		else
		{
			$correo = "Correo";
		}

	  }

	  if(isset($_POST["botonEditar"]))
	  {

	  		$rut = $_POST["Rut"];

		    $correo = $_POST["Correo"];

		    $nombre = $_POST["Nombre"];

		    $apPaterno = $_POST["ApellidoPaterno"];

		    $apMaterno = $_POST["ApellidoMaterno"];

		    $telefono = $_POST["Telefono"];

		    $clave = $_POST["Contrasena"];

		    $taxi = $_POST["comboboxTaxis"];


		    


		    if($rut=="" || $correo=="" || $correo=="Correo" || $nombre=="" || $apPaterno=="" || $apMaterno=="" || $telefono=="" || $clave=="" || $taxi=="" || $estado == "")
		    {
		    	echo "<script>
	                alert('Faltan campos a completar');
	    		</script>";
		    }
		    else
		    {		    

		    	if($_POST["comboboxEstado"]=="Habilitado")
			    {
			    	$estado = "habilitado";
			    }
			    if ($_POST["comboboxEstado"]=="Deshabilitado")
			    {
			    	$estado = "deshabilitado";
			    }
			    
			    $sql="update taxista set rut=:ru, correo=:corr, nombre=:nom, apPaterno=:apPat, apMaterno=:apMat, telefono=:tel, clave=:cla, RefTaxi=:tax, estado=:est  where correo=:corr";

			    $resultado = $base->prepare($sql);

			    $resultado->execute(array(":ru"=>$rut, ":corr"=>$correo, ":nom"=>$nombre,":apPat"=>$apPaterno, ":apMat"=>$apMaterno, ":tel"=>$telefono, ":cla"=>$clave, ":tax"=>$taxi, ":est"=>$estado));

			    echo "<script>
	                alert('Se ha editado taxista con exito');
	                window.location= 'MostrarTaxista.php'
	    		</script>";

			    //header("Location:MostrarTaxista.php");
			}

	  }


	  if(isset($_POST["botonMenu"]))
	  {
	  	//$estado = $_POST["Estado"];
	  	$estado="Habilitado";

	  	echo "prueba";
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
	  	<h2>Editar Chofer</h2>
	  	
	  	<h4>Escoja Correo del Chofer</h4>
	  	
	  	<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">
  		
		    <div class="registroTaxitaForm"> 

			    <select class="registroTaxitaForm" name="comboboxTaxista">
			    	<optgroup label="Escoja correo">

		    		<?php foreach ($RegistroTaxista as $taxista):?>
						<option  value=<?php echo $taxista->correo?>><?php echo $taxista->correo?></option>
					<?php endforeach; ?>
				</select> 

			</div>

		   <center>
				<button name="botonBuscar" id="botonBuscar" type="submit" class="btn btn-warning">Buscar</button>
			</center>

		      
		    <div class="registroTaxitaForm">
			    <input type="Rut" class="form-control" id="Rut" placeholder="Rut" name="Rut" value=<?php echo $rut?>>
		    </div>
		
		    <div class="registroTaxitaForm">
			    <input type="Nombre" class="form-control" id="Nombre" placeholder="Nombre" name="Nombre" value=<?php echo $nombre?>>
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="ApellidoPaterno" class="form-control" id="ApellidoPaterno" placeholder="Apellido Paterno" name="ApellidoPaterno" value=<?php echo $apPaterno?>>
		    </div>
		    <div class="registroTaxitaForm">         
		        <input type="ApellidoMaterno" class="form-control" id="ApellidoMaterno" placeholder="Apellido Materno" name="ApellidoMaterno" value=<?php echo $apMaterno?>>
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Correo" class="form-control" id="Correo" placeholder="Correo Electrónico" name="Correo" value=<?php echo $correo?> readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Contrasena" class="form-control" id="Contrasena" placeholder="Contraseña" name="Contrasena" value=<?php echo $clave?>>
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Telefono" class="form-control" id="Telefono" placeholder="Teléfono" name="Telefono" value=<?php echo $telefono?>>
		    </div>

		    <div class="registroTaxitaForm"> 

			    <select class="registroTaxitaForm" name="comboboxTaxis">
			    	<optgroup label="Escoja Pantente del taxi">

		    		<option  value=<?php echo $taxi?>><?php echo $taxi?></option>

		    		<?php foreach ($RegistroTaxis as $taxis):?>
		    			<?php if($taxi!=$taxis->patente) 
		    			{?>
							<option  value=<?php echo $taxis->patente?>><?php echo $taxis->patente?></option>
						<?php  }?>
					<?php endforeach; ?>
				</select> 

			</div>

			<div class="registroTaxitaForm"> 

			    <select class="registroTaxitaForm" name="comboboxEstado">
			    	<optgroup label=<?php echo $estado?>>
			    	<?php if  ($estado == "habilitado")
			    	{?>
						<option  value="Habilitado">habilitado</option>
						<option value="Deshabilitado">deshabilitado</option>
					<?php  }?>
					<?php if  ($estado == "deshabilitado")
			    	{?>
						<option value="Deshabilitado">deshabilitado</option>
						<option  value="Habilitado">habilitado</option>
					<?php  }?>
				</select> 
			</div>
					    
		    <center>
					<button name="botonEditar" id="botonEditar" type="submit" class="btn btn-warning">Editar</button>
			</center>
		</form>
	  </div>


		<footer>Derechos Reservados | kable &copy</footer>

	

</body>
</html>
