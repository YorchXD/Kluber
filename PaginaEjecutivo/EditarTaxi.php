<!DOCTYPE html>
<html lang="es">



<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="styleRegistroTaxista.css">
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


	<div id="div1" class="container" style="text-align: center;">
	  <h2 style="text-align: center;">Editar Taxi</h2>

	  <div class="container" style="text-align: center;">
	  	<h4 style="text-align: center;">Ingrese patente del Taxi</h4>

	  </div>

	  <form class="form-horizontal" action="/action_page.php">

		  <div class="form-group">
		      
		      <div id="div5" class="col-sm-15">
		        <input type="patente" class="form-control" id="patente" placeholder="Patente" name="patente">
		      </div>
		   </div>

		</form>

	  <div class="form-group" id="div4">     

	    <div class="col-sm-offset-2 col-sm-10">
	        <button id="Boton1" type="submit" class="btn btn-warning">Buscar</button>
	      </div>
	    </div>


	  <div id="div2" class="container" style="text-align: center;">

	  	<h4 style="text-align: center;">Ingrese nuevos datos a modificar</h4>

		<form class="form-horizontal" action="/action_page.php">
	    <div class="form-group">
	      
	      <div class="col-sm-15">
	        <input type="Patente" class="form-control" id="Patente" placeholder="Patente" name="Patente">
	      </div>
	    </div>
	    <div class="form-group">
	      <div class="col-sm-15">          
	        <input type="Marca" class="form-control" id="Marca" placeholder="Marca Paterno" name="Marca">
	      </div>
	    </div>
	    <div class="form-group">
	      <div class="col-sm-15">          
	        <input type="Modelo" class="form-control" id="Modelo" placeholder="Modelo" name="Modelo">
	      </div>
	    </div>

	    <div class="form-group">
	      <div class="col-sm-15">          
	        <input type="NumeroTaxi" class="form-control" id="NumeroTaxi" placeholder="Número Taxi" name="NumeroTaxi">
	      </div>
	    </div>
	    
	    <div class="form-group" id="div3">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button id="Boton1" type="submit" class="btn btn-warning">Registrar</button>
	      </div>
	    </div>
	  </form>


	</div>
	

	</div>


	

	

	

</body>
</html>
