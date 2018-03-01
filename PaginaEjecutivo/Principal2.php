<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="stylePrincipal2.css">
	<link rel="stylesheet" type="text/css" href="Imagenes\fonts.css">

	<title>Bootstrap Example</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
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

	<div class="container">
		  <h2 align="center">Radio Taxi Genesis</h2>
		  <h3 >Lista de pedido</h3>
		  <table class="table">
		    <thead>
		      <tr>
		        <th>#</th>
		        <th>Nombre</th>
		        <th>Apellido</th>
		        <th>Dirección Inicial</th>
		        <th>Dirección Destino</th>
		        <th>Teléfono</th>
		        <th>Taxista</th>
		        <th>Estado</th>
		        <th>Tiempo</th>
		      </tr>
		    </thead>
		    <tbody>      
		      <tr class="success">
		        <td>Success</td>
		        <td>Doe</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		      </tr>
		      <tr class="success">
		        <td>Success</td>
		        <td>Doe</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		      </tr>
		      <tr class="danger">
		        <td>Danger</td>
		        <td>Moe</td>
		        <td>mary@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		      </tr>
		    </tbody>
		  </table>
	</div>

	<div class="container" style="text-align: center;">
	  <button type="button" class="btn btn-warning">Enviar</button>  
	  <button type="button" class="btn btn-default">Cancelar</button>
	</div>

	<div class="container">
		  <h3 >Lista de choferes</h3>
		  <table class="table">
		    <thead>
		      <tr>
		        <th># Taxi</th>
		        <th>Nombre</th>
		        <th>Apellido</th>
		        <th>Ubicación</th>
		        <th>Estado</th>
		      </tr>
		    </thead>
		    <tbody>    
		      <tr class="success">
		        <td>Success</td>
		        <td>Doe</td>
		        <td>john@example.com</td>
		        <td>23 Norte</td>
		        <td>Disponible</td>
		      </tr>
		      <tr class="danger">
		        <td>Danger</td>
		        <td>Moe</td>
		        <td>mary@example.com</td>
		        <td>23 Norte</td>
		        <td>Ocupado</td>
		      </tr>
		      <tr class="active">
		        <td>Active</td>
		        <td>Activeson</td>
		        <td>act@example.com</td>
		        <td>23 Norte</td>
		        <td>No Disponible</td>
		      </tr>
		    </tbody>
		  </table>
	</div>


		<div class="container">
		  <h3 style="text-align: center;">Historial de pedidos durante el día</h3>
		  <table class="table">
		    <thead>
		      <tr>
		        <th>#</th>
		        <th>Nombre</th>
		        <th>Apellido</th>
		        <th>Dirección Inicial</th>
		        <th>Dirección Destino</th>
		        <th>Teléfono</th>
		        <th>Taxista</th>
		        <th>Estado</th>
		        <th>Tiempo</th>
		      </tr>
		    </thead>
		    <tbody>      
		      <tr class="active">
		        <td>Success</td>
		        <td>Doe</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		      </tr>
		      <tr class="active">
		        <td>Success</td>
		        <td>Doe</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		      </tr>
		      <tr class="active">
		        <td>Danger</td>
		        <td>Moe</td>
		        <td>mary@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		        <td>john@example.com</td>
		      </tr>
		    </tbody>
		  </table>
	</div>

	<div class="container" style="text-align: center;">
	  <button type="button" class="btn btn-warning">Mostrar</button>  
	</div>

	<footer>Derechos Reservados | kable &copy</footer>

</body>
</html>
