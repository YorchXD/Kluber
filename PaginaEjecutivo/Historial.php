<!DOCTYPE html>
<html lang="es">



<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="stylePrincipal.css">
	<link rel="stylesheet" type="text/css" href="Imagenes\fonts.css">


	<title>Bootstrap Example</title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
		<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
		<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
		<script src="jquery.ui.datepicker-es.js"></script>

		<script>
			$(function () {
				$.datepicker.setDefaults($.datepicker.regional["es"]);
				$("#datepicker").datepicker();
			});
		</script>

		<script>
			$(function () {
				$.datepicker.setDefaults($.datepicker.regional["es"]);
				$("#datepicker2").datepicker();
			});
		</script>

</head>
<body>
	<header>
		<nav class="Historial">
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


	<div id="div1">
		<h4 style="text-align: initial;">Desde:</h4>
		<div id="datepicker"></div>
	</div>

	<div id="div2">
		<h4 style="text-align: initial;">Hasta:</h4>
		<div id="datepicker2"></div>
	</div>

	<div id="divBoton" class="container" style="text-align: center;">
			  <button id="Boton1" type="button" class="btn btn-warning">Mostrar</button>  
			  <button id="Boton2" type="button" class="btn">Cancelar</button> 
	</div>


	<div id="div3">
	  <h3 style="text-align: center;">Historial de pedidos durante el dd/mm/yyyy hasta el dd/mm/yyyy</h3>
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

		<div class="container" style="text-align: center;">
			  <button id="Boton3" type="button" class="btn btn-warning">Excel</button>  
		</div>

	</div>

	

	

</body>
</html>
