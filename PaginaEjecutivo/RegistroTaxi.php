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

		  include("conexion.php"); //conexión BD

		  /* Al hacer click en el boton Registro se registra taxi */
		  if(isset($_POST["botonRegistro"]))
		  {

		    $patente = $_POST["patente"];

		    $marca = $_POST["marca"];

		    $modelo = $_POST["modelo"];

		    $numTaxi = $_POST["numTaxi"];

		    $anio = $_POST["anio"];

		    if($patente=="" || $marca=="" || $modelo=="" || $numTaxi=="" || $anio=="") //confirma que los campos no esten vacios
		    {
		    	echo "<script>
	                alert('Faltan campos a completar');
	    		</script>";
		    }
		    else
		    {
		    	//consulta ´para insertar datos del taxi
			   	$sql="insert into taxi (patente, marca, modelo, numTaxi, anio) values (:pat, :mar, :mod, :numT, :anio)";

			    $resultado = $base->prepare($sql);

			    $resultado->execute(array(":pat"=>$patente, ":mar"=>$marca, ":mod"=>$modelo, ":numT"=>$numTaxi, ":anio"=>$anio));

			    echo "<script>
	                alert('Se registro taxi con exito');
	                window.location= 'MostrarTaxi.php';
	    		</script>";
	    	}
		  }

		?>

		<!-- Campos a llenar para registrar taxi -->
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

	</body>
</html>
