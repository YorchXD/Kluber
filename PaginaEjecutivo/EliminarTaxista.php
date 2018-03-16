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

	  $apPaterno = "Apellido Paterno";

	  $apMaterno = "Apellido Materno";

	  $telefono = "Telefono";

	  $clave = "Clave";

	  $taxi = "Patente Taxi";

	  $estado = "Estado";

	  $RegistroTaxista=$base->query("select * from taxista")->fetchAll(PDO::FETCH_OBJ);

	  /*BOTON PARA BUSCAR TAXISTA*/
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

	  /* AL HACER CLICK EN EL BOTON ELIMINAR SE DESHABILITA AL TAXISTA */
	  if(isset($_POST["botonEliminar"]))
	  {

	  	$correo = $_POST["Correo"];

	  	 $estado = $_POST["Estado"];

  		//$base->query("delete from taxista where correo='$correo'");

  		if($estado=="habilitado")
  		{

  			$base->query("update taxista set estado='deshabilitado'  where correo='$correo'");

  			$registroTaxista = $base->query("select * from taxista where correo='$correo'")->fetchAll(PDO::FETCH_OBJ);

  			$rutTaxista = $registroTaxista[0]->rut;

  			$base->query("update disponibilidadchoferes set estado='no disponible'  where RefTaxista='$rutTaxista'");

  			 echo "<script>
	                alert('taxista deshabilitado con exito');
	                window.location= 'MostrarTaxista.php'
	    		</script>";
  		}

	  }

	?>

	<div>
		<h2>Deshabiltar Chofer</h2>
		
		<h4>Escoja correo del chofer</h4>
		
  		<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">

  			<!-- Combobox paara seleccionar al taxista a deshabilitar -->
		   <div class="registroTaxitaForm"> 

			    <select class="registroTaxitaForm" name="comboboxTaxista">
			    	<optgroup label="Escoja correo del taxista">

		    		<?php foreach ($RegistroTaxista as $taxista):?>
		    			<?php if($taxista->estado=="habilitado") //muestra para ecojer solo a los taxistas habilitados
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
		
		    <div class="registroTaxitaForm">         
		        <input type="Contrasena" class="form-control" id="Contrasena" placeholder="Contraseña" name="Contrasena" value="<?php echo $clave?>" readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Telefono" class="form-control" id="Telefono" placeholder="Teléfono" name="Telefono" value="<?php echo $telefono?>" readonly="readonly">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="NumeroTaxi" class="form-control" id="NumeroTaxi" placeholder="Patente Taxi" name="NumeroTaxi" value="<?php echo $taxi?>" readonly="readonly">
		    </div>

		    <div class="registroTaxitaForm">         
		        <input type="Estado" class="form-control" id="Estado" placeholder="Estado Taxista" name="Estado" value="<?php echo $estado?>" readonly="readonly">
		    </div>
		    
		    <center>
				<button name="botonEliminar" id="botonEliminar" type="submit" class="btn btn-warning">Deshabilitar</button>
			</center>
		</form>
	</div>

	<!-- Separador-->
	<label></label>

</body>
</html>
