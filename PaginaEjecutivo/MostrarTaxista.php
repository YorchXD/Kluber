<?php
	session_start();
?>

<!DOCTYPE html>
<html lang="es">

	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" href="styleCrud.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



	</head>
	<body>
		<?php

		  include("conexion.php");

		  $registros=$base->query("select * from taxista")->fetchAll(PDO::FETCH_OBJ);

	  	?>


		
		<div>
			<div class="wrapper">
				<h2 >Lista de Taxistas</h2>
				<div id="divtabla" class="wrapper">
					<table class="table" class="wrapper">
					    <thead>
					      	<tr>
		  				        <th>Rut</th>
						        <th>Correo</th>
						        <th>Nombre</th>
						        <th>Apellido Paterno</th>
						        <th>Apellido Materno</th>
						        <th>Teléfono</th>
						        <th>Clave</th>
						        <th>Taxi Patente</th>
						        <th>Estado Taxista</th>
					     	</tr>
					    </thead>


						<?php foreach ($registros as $taxista):?> 



							    <tbody>    

								    <?php
									    if( $taxista->estado == 'habilitado')
					  					{
					  						$color="success";
					  						
					  					}
					  					if( $taxista->estado == 'deshabilitado')
					  					{		
					  						$color="active";
					  					}
				  					?>  
							      	<tr class=<?php echo $color ?>>
								        <td><?php echo $taxista->rut ?></td>
								        <td><?php echo $taxista->correo ?></td>
								        <td><?php echo $taxista->nombre ?></td>
								        <td><?php echo $taxista->apPaterno ?></td>
								        <td><?php echo $taxista->apMaterno ?></td>
								        <td><?php echo $taxista->telefono ?></td>
								        <td><?php echo $taxista->clave ?></td>
								        <td><?php echo $taxista->RefTaxi ?></td>
								        <td><?php echo $taxista->estado ?></td>
							      	</tr>
							    </tbody>

					    <?php endforeach; ?>

		    		</table>
		    	</div>
			</div>
		</div>		
		
		<!--este laven hace el espacio entre el contenido anterior y el footer-->
		<label></label>
		


	</body>
</html>
