<!DOCTYPE html>
<html lang="es">



<head>
	<meta charset="utf-8">
	<title></title>
	<link rel="stylesheet" href="stylePrincipal.css">
	<link rel="stylesheet" type="text/css" href="Imagenes\fonts.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">



	<link data-require="bootstrap@3.3.2" data-semver="3.3.2" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
    <script data-require="bootstrap@3.3.2" data-semver="3.3.2" src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script data-require="jquery@2.1.3" data-semver="2.1.3" src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="moment-2.10.3.js"></script>
    <script src="bootstrap-datetimepicker.js"></script>


</head>
<body>


	<?php

	  include("conexion.php");

	  $registros=$base->query("select * from pedido")->fetchAll(PDO::FETCH_OBJ);

	  $registroDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

		//-----------------------------
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
		//echo $fechaActual;
		//echo "$d-$m-$y"; //getdate converted day

  	?>

	<form action="<?php echo $_SERVER['PHP_SELF'] ?>" method="post">

		<div class="container">
	        <div class='fechaDesde'>
	            <div class="form-group">
	                <label>Desde:</label>
	                <div class='input-group date' id='datetimepicker6' >
	                    <input type='text' class="form-control" name='datetimepicker6'/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	            </div>
	        </div>
	        <div class='fechaHasta'>
	            <div class="form-group">
	                <label>Hasta:</label>
	                <div class='input-group date' id='datetimepicker7' >
	                    <input type='text' class="form-control" name='datetimepicker7'/>
	                    <span class="input-group-addon">
	                        <span class="glyphicon glyphicon-calendar"></span>
	                    </span>
	                </div>
	            </div>
	        </div> 
	    </div>

	    <script type="text/javascript">
	        $(function () {
	            $('#datetimepicker6').datetimepicker({format: 'DD-MM-YYYY'});
	            $('#datetimepicker7').datetimepicker({format: 'DD-MM-YYYY'});	  
	        });
	    </script>
	    
		<center>
			<button name="botonMostrar" id="botonMostrar" type="submit" class="btn btn-warning">Mostrar</button>
		</center>


		<div class="wrapper">
				<h2>Historial de pedidos durante el día</h2>


				<div id="divtabla" class="wrapper">
				  	<table class="table">
				    	<thead>
					      	<tr>
						        <th>#</th>
						        <th>Nombre Cliente</th>
						        <th>Apellido Cliente</th>
						        <th>Dirección Inicial</th>
						        <th>Dirección Destino</th>
						        <th>Teléfono</th>
						        <th>Rut Taxista</th>
						        <th>Nombre Taxista</th>
						        <th>Apellido Taxista</th>
						        <th>Estado</th>
						        <th>Fecha Pedido</th>
						        <th>Hora Pedido</th>
						        <th>Tiempo Transcurrido</th>
					     	</tr>
					    </thead>
					   
					   	<?php if(isset($_POST["botonMostrar"]))
			  				  {
			  				  		$fechaDesde = date('Y-m-d', strtotime($_POST["datetimepicker6"]));
			  				  		$fechaHasta = date('Y-m-d', strtotime($_POST["datetimepicker7"]));

			  				  		//echo "fecha Desde $fechaDesde y fecha Hasta $fechaHasta";

			  			?>  

						    <?php foreach ($registros as $pedido):?> 

						   		<?php 

						    	  $rutTaxista = $pedido->RefChoferTaxista;

								  $RegistroTaxista=$base->query("select * from taxista where rut='$rutTaxista'")->fetchAll(PDO::FETCH_OBJ);

								  $nombreTaxista = $RegistroTaxista[0]->nombre;

								  $apellidoTaxista = $RegistroTaxista[0]->apPaterno;


								  $fecha = $pedido->fecha;

								  //echo "fecha $fecha";

								?> 


								<?php if( $fecha >= $fechaDesde && $fecha<=$fechaHasta)
					  					{		
					  						//echo $fechaActual;
				  				 	?>  

				  					<?php if( $pedido->estado == 'finalizado')
					  					{		
					  						$color="active";
				  				 	?> 

					  				 	<tbody> 
									      	<tr class=<?php echo $color ?>>
										        <td><?php echo $pedido->id ?></td>
										        <td><?php echo $pedido->nombre ?></td>
										        <td><?php echo $pedido->apellido ?></td>
										        <td><?php echo $pedido->direccionInicial ?></td>
										        <td><?php echo $pedido->direccionFinal ?></td>
										        <td><?php echo $pedido->telefono ?></td>
										        <td><?php echo $pedido->RefChoferTaxista ?></td>
										        <td><?php echo $nombreTaxista ?></td>
									        	<td><?php echo $apellidoTaxista ?></td>
										        <td><?php echo $pedido->estado ?></td>
										        <td><?php echo $fecha  ?></td>
										        <td><?php echo $pedido->hora ?></td>
										        <td><?php echo $pedido->duracion ?></td>										        
									      	</tr>
									    </tbody>

									<?php } ?>
								<?php } ?>
					    	<?php endforeach; ?>
						<?php } ?>
				  	</table>
			  	</div>				
			</div>

			<!--este laven hace el espacio entre el contenido anterior y el boton-->
			<label></label>

			<center>
				<button name="botonExcel" id="botonExcel" class="btn btn-warning">Excel</button>
			</center>

		</div>
	</form>

	<!--este laven hace el espacio entre el contenido anterior y el footer-->
	<label></label>
</body>
</html>
