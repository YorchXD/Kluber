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

		  $registros=$base->query("select * from taxista")->fetchAll(PDO::FETCH_OBJ);

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


		
		<footer>Derechos Reservados | kable &copy</footer>


	</body>
</html>
