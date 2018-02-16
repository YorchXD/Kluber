<?php
	session_start();
?>

<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="stylePrincipal.css">
	<link rel="stylesheet" type="text/css" href="Imagenes\fonts.css">
</head>
<body>
	<header>
		<div class="contenedorEncabezado">
			<div class="logotipo">
				Kluber
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
				<li><a href="#"><span class="colorInicio"><i class="icon icon-home"></i></span>Inicio</a></li>
				<li><a href="#"><span class="colorHistorial"><i class="icon icon-open-book"></i></span>Historial</a></li>
				<li><a href="#"><span class="colorChofer"><i class="icon icon-person_pin"></i></span>Chofer</a>
					<ul>
						<li><a href="#" class="colorChofer">Registrar</a></li>
						<li><a href="#" class="colorChofer">Editar</a></li>
						<li><a href="#" class="colorChofer">Eliminar</a></li>
					</ul>
				</li>
				<li><a href="#"><span class="colorTaxi"><i class="icon icon-local_taxi"></i></span>Taxi</a>
					<ul>
						<li><a href="#">Registrar</a></li>
						<li><a href="#">Editar</a></li>
						<li><a href="#">Eliminar</a></li>
					</ul>
				</li>
			</ul>				
		</nav>
	</header>

	<section class="contenido wrapper">
		<p>
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat risus quis tortor bibendum sodales. Vivamus cursus rutrum tellus et scelerisque. Fusce id aliquet magna. Donec vitae ipsum nec nibh tristique malesuada eget efficitur tellus. Aliquam tristique nulla eget tortor maximus, eget vulputate massa gravida. Phasellus enim odio, iaculis eu pharetra in, convallis quis ante. Maecenas viverra ipsum in risus eleifend, non pulvinar enim lacinia. Morbi dignissim sapien hendrerit consectetur auctor. Suspendisse ac eros mi. Mauris nec luctus metus, non rhoncus urna. Duis bibendum, ante commodo egestas tempor, erat arcu ultricies augue, consectetur semper nunc lorem in eros. Etiam molestie imperdiet leo eu sollicitudin. Aliquam imperdiet odio sit amet arcu lacinia auctor. 
		</p>
		<p>
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat risus quis tortor bibendum sodales. Vivamus cursus rutrum tellus et scelerisque. Fusce id aliquet magna. Donec vitae ipsum nec nibh tristique malesuada eget efficitur tellus. Aliquam tristique nulla eget tortor maximus, eget vulputate massa gravida. Phasellus enim odio, iaculis eu pharetra in, convallis quis ante. Maecenas viverra ipsum in risus eleifend, non pulvinar enim lacinia. Morbi dignissim sapien hendrerit consectetur auctor. Suspendisse ac eros mi. Mauris nec luctus metus, non rhoncus urna. Duis bibendum, ante commodo egestas tempor, erat arcu ultricies augue, consectetur semper nunc lorem in eros. Etiam molestie imperdiet leo eu sollicitudin. Aliquam imperdiet odio sit amet arcu lacinia auctor. 
		</p>
		<p>
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat risus quis tortor bibendum sodales. Vivamus cursus rutrum tellus et scelerisque. Fusce id aliquet magna. Donec vitae ipsum nec nibh tristique malesuada eget efficitur tellus. Aliquam tristique nulla eget tortor maximus, eget vulputate massa gravida. Phasellus enim odio, iaculis eu pharetra in, convallis quis ante. Maecenas viverra ipsum in risus eleifend, non pulvinar enim lacinia. Morbi dignissim sapien hendrerit consectetur auctor. Suspendisse ac eros mi. Mauris nec luctus metus, non rhoncus urna. Duis bibendum, ante commodo egestas tempor, erat arcu ultricies augue, consectetur semper nunc lorem in eros. Etiam molestie imperdiet leo eu sollicitudin. Aliquam imperdiet odio sit amet arcu lacinia auctor. 
		</p>
		<p>
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat risus quis tortor bibendum sodales. Vivamus cursus rutrum tellus et scelerisque. Fusce id aliquet magna. Donec vitae ipsum nec nibh tristique malesuada eget efficitur tellus. Aliquam tristique nulla eget tortor maximus, eget vulputate massa gravida. Phasellus enim odio, iaculis eu pharetra in, convallis quis ante. Maecenas viverra ipsum in risus eleifend, non pulvinar enim lacinia. Morbi dignissim sapien hendrerit consectetur auctor. Suspendisse ac eros mi. Mauris nec luctus metus, non rhoncus urna. Duis bibendum, ante commodo egestas tempor, erat arcu ultricies augue, consectetur semper nunc lorem in eros. Etiam molestie imperdiet leo eu sollicitudin. Aliquam imperdiet odio sit amet arcu lacinia auctor. 
		</p>

		<p>
			Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat risus quis tortor bibendum sodales. Vivamus cursus rutrum tellus et scelerisque. Fusce id aliquet magna. Donec vitae ipsum nec nibh tristique malesuada eget efficitur tellus. Aliquam tristique nulla eget tortor maximus, eget vulputate massa gravida. Phasellus enim odio, iaculis eu pharetra in, convallis quis ante. Maecenas viverra ipsum in risus eleifend, non pulvinar enim lacinia. Morbi dignissim sapien hendrerit consectetur auctor. Suspendisse ac eros mi. Mauris nec luctus metus, non rhoncus urna. Duis bibendum, ante commodo egestas tempor, erat arcu ultricies augue, consectetur semper nunc lorem in eros. Etiam molestie imperdiet leo eu sollicitudin. Aliquam imperdiet odio sit amet arcu lacinia auctor. 
		</p>
	</section>

	<footer>Derechos Reservados | kable &copy</footer>

</body>
</html>
