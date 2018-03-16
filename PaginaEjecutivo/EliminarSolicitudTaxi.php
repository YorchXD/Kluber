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

		//-------- Captura fecha actual ---------//
		$now = time();
		$num = date("w");

		$WeekMon  = mktime(0, 0, 0, date("m", $now)  , date("d", $now), date("Y", $now));    //monday week begin calculation
		$todayh = getdate($WeekMon); //monday week begin reconvert

		$d = $todayh['mday'];
		$m = $todayh['mon'];
		$y = $todayh['year'];

		if($m<10)
		{
			$m="0$m";
		}
		else
		{
			$m="$m";
		}

		if($d<10)
		{
			$d="0$d";
		}
		else
		{
			$d="$d";
		}

		$y="$y";

		$fechaActual="$y-$m-$d";
		//-------------------------//

	  	include("conexion.php"); //conexion BD


	  	$numeroPedido = "Numero Pedido";

	  	$nombreCliente = "Nombre Cliente";

	  	$apellidoCliente = "Apellido Cliente";

	  	$direccionInicial = "Dirección Inicial";

	  	$direccionDestino = "Dirección Destino";

	  	$nombreTaxista = "Nombre Taxista";

	  	$apellidoTaxista = "Apellido Taxista";

	  	$estado = "Estado";

	  	$RegistroPedido=$base->query("select * from pedido")->fetchAll(PDO::FETCH_OBJ);//consulta para obtener datos de los pedidos

	  	/* Al hacer click en el boton Buscar buscar el pedido por ID del pedido */
	  	if(isset($_POST["botonBuscar"]))
	  	{

	  		/* Si se ecoje un pedido se busca pedido */
	  		if($_POST["comboboxPedidos"]!="Escoja")
			{
			    $numPedido = $_POST["comboboxPedidos"];

			   
			    $registros=$base->query("select * from pedido where id='$numPedido'")->fetchAll(PDO::FETCH_OBJ);//consulta para obtener datos del pedido


			    if($registros!=null)
			    {

			    	$numeroPedido = $registros[0]->id;

				 	$nombreCliente = $registros[0]->nombre;

				 	$apellidoCliente = $registros[0]->apellido;

				  	$direccionInicial = $registros[0]->direccionInicial;

		  		  	$direccionDestino = $registros[0]->direccionFinal;

		  		  	$rutTaxista = $registros[0]->RefChoferTaxista;

		  		  	$registroTaxista=$base->query("select * from taxista where rut='$rutTaxista'")->fetchAll(PDO::FETCH_OBJ);//consulta para obtener datos del taxista

				  	$nombreTaxista = $registroTaxista[0]->nombre;

				  	$apellidoTaxista = $registroTaxista[0]->apPaterno;

				  	$estado = $registros[0]->estado;

				}
				else
				{
					$numeroPedido = "$numeroPedido";
				}
			}

	  	}

	  	/* Al hacer click en el boton Eliminar se elimina pedido */
	  	if(isset($_POST["botonEliminar"]))
	  	{

		  	$numeroPedido = $_POST["NumeroPedido"];

		    echo "<script>
			if (confirm('¿Seguro que desea eliminar solicitud?')) {
			    {
			    	location.href='consultaEliminarSolicitud.php?id=$numeroPedido';

		 			alert('Solicitud fue eliminada exitosamente');
				}
			} 
			else 
			{
			    alert('No fue eliminada la solicitud');
			} 

			</script>";

	  	}

	?>

	<div class="formulariosChicos">

		<h2>Eliminar solicitud Taxi</h2>

		<h4>Escoja número de la solicitud</h4>

			<!-- Formulario para mostrar datos del pedido a eliminar -->	  		
	  		<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">

	  			<!-- ComboBox para seleccionar pedido y buscarlo -->
			    <div class="registroTaxitaForm"> 
					<center>
						<select class="registroTaxitaForm" name="comboboxPedidos">
					    	<optgroup label="Escoja id del pedido">
					    		<option  value=<Escoja>Escoja id</option>

					    		<?php foreach ($RegistroPedido as $pedidos):?>
					    			<?php if(($pedidos->fecha == $fechaActual) && ($pedidos->estado == "esperando")) 
					    			{?>
										<option  value=<?php echo $pedidos->id?>><?php echo $pedidos->id?></option>
									<?php } ?>
								<?php endforeach; ?>
						</select> 
					</center>
				    

				</div>

			    <center>
					<button name="botonBuscar" id="botonBuscar" type="submit" class="btn btn-warning">Buscar</button>
				</center>

		
				<div class="registroTaxitaForm">
			    	<tr>
				        <input type="text" class="form-control" id="NumeroPedido" name="NumeroPedido" placeholder="Numero Pedido" value="<?php echo $numeroPedido?>" readonly="readonly">
				    </tr>
			    </div>


			    <div class="registroTaxitaForm">
			    	<tr>
				        <input type="text" class="form-control" id="NombreCliente" name="NombreCliente" placeholder="Nombre Cliente" value="<?php echo $nombreCliente?>" readonly="readonly">
				    </tr>
			    </div>

			    <div class="registroTaxitaForm">
			    	<tr>
				        <input type="text" class="form-control" id="ApellidoCliente" name="ApellidoCliente" placeholder="Apellido Cliente" value="<?php echo $apellidoCliente?>" readonly="readonly">
				    </tr>
			    </div>
		
	   		    <div class="registroTaxitaForm">       
			        <input type="DireccionInicial" class="form-control" id="DireccionInicial" placeholder="Direccion Inicial" name="DireccionInicial" value="<?php echo $direccionInicial?>" readonly="readonly">
			    </div>

			     <div class="registroTaxitaForm">       
			        <input type="DireccionDestino" class="form-control" id="DireccionDestino" placeholder="DireccionDestino" name="DireccionDestino" value="<?php echo $direccionDestino?>" readonly="readonly">
			    </div>

			     <div class="registroTaxitaForm">       
			        <input type="NombreTaxista" class="form-control" id="NombreTaxista" placeholder="Nombre Taxista" name="NombreTaxista" value="<?php echo $nombreTaxista?>" readonly="readonly">
			    </div>

			    <div class="registroTaxitaForm">       
			        <input type="ApellidoTaxista" class="form-control" id="ApellidoTaxista" placeholder="Apellido Taxista" name="ApellidoTaxista" value="<?php echo $apellidoTaxista?>" readonly="readonly">
			    </div>

			    <div class="registroTaxitaForm">       
			        <input type="Estado" class="form-control" id="Estado" placeholder="Estado" name="Estado" value="<?php echo $estado?>" readonly="readonly">
			    </div>

			    
			    <center>
					<button name="botonEliminar" id="botonEliminar" type="submit" class="btn btn-warning">Eliminar</button>
				</center>
			 </form>	
	</div>

	<!-- Separador-->
	<label></label>

</body>
</html>