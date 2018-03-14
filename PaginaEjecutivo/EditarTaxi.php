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

	  $patente = "Patente";

	  $marca = "Marca";

	  $modelo = "Modelo";

	  $numTaxi = "Número Taxi";

	  $anio = "Año";

	  $RegistroTaxis=$base->query("select * from taxi")->fetchAll(PDO::FETCH_OBJ);

	  /* Al hacer click en el boton Buscar busca el taxi seleccionado */
	  if(isset($_POST["botonBuscar"]))
	  {
	    $patente = $_POST["comboboxTaxis"];
	   
	    $registros=$base->query("select * from taxi where patente='$patente'")->fetchAll(PDO::FETCH_OBJ); //consulta para obtener datos del taxi

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

	  /* Al hacer click en el boton Editar se edita los datos del taxi seleccionado */
	  if(isset($_POST["botonEditar"]))
	  {

	  	$patente = $_POST["Patente"];

      	$marca = $_POST["Marca"];

      	$modelo = $_POST["Modelo"];

      	$numTaxi = $_POST["NumeroTaxi"];

      	$anio = $_POST["Anio"];

      	/* Comprueba que los campos no esten vacios */
      	if($patente=="" || $patente=="Patente" || $marca=="" || $modelo=="" || $numTaxi=="" || $anio=="")
	    {
	    	echo "<script>
                alert('Faltan campos a completar');
    		</script>";
	    }
	    else
	    {

	     	$sql="update taxi set marca=:mar, modelo=:mod, numTaxi=:numT, anio=:an where patente=:pat";//consulta par actualizar datos del taxi

	      	$resultado = $base->prepare($sql);

	      	$resultado->execute(array(":pat"=>$patente, ":mar"=>$marca, ":mod"=>$modelo, ":numT"=>$numTaxi, ":an"=>$anio));

	      	echo "<script>
	                alert('Se ha editado taxi con exito');
	                window.location= 'MostrarTaxista.php'
	    		</script>";

		    //header("Location:MostrarTaxi.php");
		}

	  }

	?>

	<!-- campos a completar para editar taxi -->
	<div class="formulariosChicos">

		<h2>Editar Taxi</h2>

		<h4>Escoja patente del Taxi</h4>
	  		
	  	<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">


	  		<!-- Combobox para seleccionar taxi a editar -->
		    <div class="registroTaxitaForm"> 

			    <select class="registroTaxitaForm" name="comboboxTaxis">
			    	<optgroup label="Escoja Pantente del taxi">

		    		<?php foreach ($RegistroTaxis as $taxis):?>
						<option  value=<?php echo $taxis->patente?>><?php echo $taxis->patente?></option>
					<?php endforeach; ?>
				</select> 

			</div>

		    <center>
				<button name="botonBuscar" id="botonBuscar" type="submit" class="btn btn-warning">Buscar</button>
			</center>

		
	
		    <div class="registroTaxitaForm">
		    	<tr>
			        <input type="text" class="form-control" id="Patente" name="Patente" placeholder="Patente" value="<?php echo $patente?>" readonly="readonly">
			    </tr>
		    </div>
	
   		    <div class="registroTaxitaForm">       
		        <input type="Marca" class="form-control" id="Marca" placeholder="Marca" name="Marca" value="<?php echo $marca?>">
		    </div>

		     <div class="registroTaxitaForm">       
		        <input type="modelo" class="form-control" id="Modelo" placeholder="Modelo" name="Modelo" value="<?php echo $modelo?>">
		    </div>

		     <div class="registroTaxitaForm">       
		        <input type="NumeroTaxi" class="form-control" id="NumeroTaxi" placeholder="Número Taxi" name="NumeroTaxi" value="<?php echo $numTaxi?>">
		    </div>

		     <div class="registroTaxitaForm">       
		        <input type="Anio" class="form-control" id="Anio" placeholder="Año" name="Anio" value="<?php echo $anio?>">
		    </div>

		    
		    <center>
				<button name="botonEditar" id="botonEditar" type="submit" class="btn btn-warning">Editar</button>
			</center>
		</form>	
	</div>

	</body>
</html>
