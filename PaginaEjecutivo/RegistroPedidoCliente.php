<!DOCTYPE html>
<html lang="es">



<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="styleRegistroTaxista.css">
	<link rel="stylesheet" type="text/css" href="Imagenes\fonts.css">


	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>


	<div id="div1" class="container" style="text-align: center;">
	  <h2 style="text-align: center;">Registro Pedido Cliente</h2>


	  
	</div>

	<div id="div2" class="container" style="text-align: center;">

		<h4 style="text-align: center;">Ingrese datos</h4>

		<form class="form-horizontal" action="/action_page.php">
	    <div class="form-group">
	      
	      <div class="col-sm-15">
	        <input type="Nombre" class="form-control" id="Nombre" placeholder="Nombre" name="Nombre">
	      </div>
	    </div>
	    <div class="form-group">
	      <div class="col-sm-15">          
	        <input type="ApellidoPaterno" class="form-control" id="ApellidoPaterno" placeholder="Apellido Paterno" name="ApellidoPaterno">
	      </div>
	    </div>
	    <div class="form-group">
	      <div class="col-sm-15">          
	        <input type="ApellidoMaterno" class="form-control" id="ApellidoMaterno" placeholder="Apellido Materno" name="ApellidoMaterno">
	      </div>
	    </div>

	    <div class="form-group">
	      <div class="col-sm-15">          
	        <input type="DireccionInicial" class="form-control" id="DireccionInicial" placeholder="Direccion Inicial" name="DireccionInicial">
	      </div>
	    </div>

	    <div class="form-group">
	      <div class="col-sm-15">          
	        <input type="DireccionFinal" class="form-control" id="DireccionFinal" placeholder="Direccion Final" name="DireccionFinal">
	      </div>
	    </div>

	    <div class="form-group">
	      <div class="col-sm-15">          
	        <input type="Telefono" class="form-control" id="Telefono" placeholder="Teléfono" name="Telefono">
	      </div>
	    </div>
	    
	    <div class="form-group" id="div3">        
	      <div class="col-sm-offset-2 col-sm-10">
	        <button id="Boton1" type="submit" class="btn btn-warning">Registrar</button>
	      </div>
	    </div>
	  </form>


	</div>
	<!--este laven hace el espacio entre el contenido anterior y el footer-->
	<label></label>

</body>
</html>
