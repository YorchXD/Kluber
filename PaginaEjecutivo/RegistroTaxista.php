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

		  $taxi="";

		  if(isset($_POST["botonRegistro"]))
		  {

		    $rut = $_POST["Rut"];

		    $correo = $_POST["Correo"];

		    $nombre = $_POST["Nombre"];

		    $apPaterno = $_POST["ApellidoPaterno"];

		    $apMaterno = $_POST["ApellidoMaterno"];

		    $telefono = $_POST["Telefono"];

		    $clave = $_POST["Contrasena"];

		    $taxi = $_POST["comboboxTaxis"];

		    $estado = "habilitado";

		    if($rut=="" || $correo=="" || $nombre=="" || $apPaterno=="" || $apMaterno=="" || $telefono=="" || $clave=="" || $taxi=="" || $estado == "")
		    {
		    	echo "<script>
	                alert('Faltan campos a completar');
	    		</script>";
		    }
		    else
		    {
		    	$sql="insert into taxista (rut, correo, nombre,apPaterno, apMaterno, telefono, clave, RefTaxi, estado) values (:ru, :corr, :nom, :apPat, :apMat, :tel, :cla, :tax, :est)";

			    $resultado = $base->prepare($sql);

			    $resultado->execute(array(":ru"=>$rut, ":corr"=>$correo, ":nom"=>$nombre,":apPat"=>$apPaterno, ":apMat"=>$apMaterno, ":tel"=>$telefono, ":cla"=>$clave, ":tax"=>$taxi, ":est"=>$estado));



			    $sql2="insert into disponibilidadchoferes (RefTaxista, ubicacion, estado,tiempoDisponible) values (:rutTax, :ub, :est, :tiemDis)";

			    $resultado2 = $base->prepare($sql2);

			    $resultado2->execute(array(":rutTax"=>$rut, ":ub"=>"", ":est"=>"no disponible",":tiemDis"=>"00:00:00"));

				echo "<script>
	                alert('Se registro taxista con exito');
	                window.location= 'MostrarTaxista.php'
	    		</script>";
		    }

		    //header("Location:MostrarTaxista.php");

		  }

	?>

	
	<div>
		<h2>Registrar Chofer</h2>
		
		<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">

			<div class="registroTaxitaForm">
			    <input type="Rut" class="form-control" id="Rut" placeholder="Rut" name="Rut">
		    </div>
		
		    <div class="registroTaxitaForm">
			    <input type="Nombre" class="form-control" id="Nombre" placeholder="Nombre" name="Nombre">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="ApellidoPaterno" class="form-control" id="ApellidoPaterno" placeholder="Apellido Paterno" name="ApellidoPaterno">
		    </div>
		    <div class="registroTaxitaForm">         
		        <input type="ApellidoMaterno" class="form-control" id="ApellidoMaterno" placeholder="Apellido Materno" name="ApellidoMaterno">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Correo" class="form-control" id="Correo" placeholder="Correo Electrónico" name="Correo">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Contrasena" class="form-control" id="Contrasena" placeholder="Contraseña" name="Contrasena">
		    </div>
		
		    <div class="registroTaxitaForm">         
		        <input type="Telefono" class="form-control" id="Telefono" placeholder="Teléfono" name="Telefono">
		    </div>

		    <div class="registroTaxitaForm"> 

			    <select class="registroTaxitaForm" name="comboboxTaxis">
			    	<optgroup label="Escoja correo del taxista">

		    		<?php foreach ($registros as $taxi):?>
						<option  value=<?php echo $taxi->patente?>><?php echo $taxi->patente?></option>
					<?php endforeach; ?>
				</select> 

			</div>
		
			<center>
				<button id="botonRegistro" name="botonRegistro" type="submit" class="btn btn-warning">Registrar</button>
			</center>
		
		</form>
	</div>
	
	<<!--este laven hace el espacio entre el contenido anterior y el footer-->
	<label></label>

</body>
</html>
