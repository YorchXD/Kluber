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

		  include("conexion.php"); //conexion BD

		  $registros=$base->query("select * from taxi")->fetchAll(PDO::FETCH_OBJ); //consulta para obtener datos de los taxis

	  	?>

		<!-- Tabla con lista de taxis -->
		<div>
			<div class="wrapper">
				<h2 >Lista de Taxis</h2>
				<div id="divtabla" class="wrapper">
					<table class="table">
					    <thead>
					      	<tr>
		  				        <th>Patente</th>
						        <th>Marca</th>
						        <th>Modelo</th>
						        <th>Número Taxi</th>
						        <th>Año</th>
					     	</tr>
					    </thead>


						<?php foreach ($registros as $taxi):?> 

							<?php if($taxi->patente!="1") 
    						{?>
							    <tbody>      
							      	<tr class="success">
								        <td><?php echo $taxi->patente ?></td>
								        <td><?php echo $taxi->marca ?></td>
								        <td><?php echo $taxi->modelo ?></td>
								        <td><?php echo $taxi->numTaxi ?></td>
								        <td><?php echo $taxi->anio ?></td>
							      	</tr>
							    </tbody>
							<?php } ?>
					    <?php endforeach; ?>

		    		</table>
		    	</div>
			</div>
		</div>

	</body>
</html>
