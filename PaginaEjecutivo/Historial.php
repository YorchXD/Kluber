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
	<meta name="viewport" content="width=device-width, initial-scale=1">



	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-1.5.js"></script> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script data-require="jquery@2.1.3" data-semver="2.1.3" src="http://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="moment-2.10.3.js"></script>
    <script src="bootstrap-datetimepicker.js"></script>


</head>
<body>


	<?php

	  include("conexion.php");

	  $registros=$base->query("select * from pedido")->fetchAll(PDO::FETCH_OBJ);

	  $registroDisponibilidad=$base->query("select * from disponibilidadchoferes")->fetchAll(PDO::FETCH_OBJ);

		//--------- CAPTURA FECHA ACTUAL ---------//
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
		//--------------------------//

		$fechaDesde="";

		$fechaHasta="";

		$fechaD = "";
		$fechaH="";


	  	if(isset($_POST["botonExcel"])) //SI HACE CLICK EN EL BOTON BOTONEXCEL GENERA EL HISTORIAL EN EXCEL
	    {
	    	
	    	if($_POST["Fecha1"]!="" && $_POST["Fecha2"]!="") //SI NO ESTAN VACIAS LAS FECHAS GENERA EL EXCEL
			{

				$fechaD = $_POST["Fecha1"];
		  		$fechaH = $_POST["Fecha2"];

		  		// SE DIRIJE AL PHP EXCELHISTORIAL //
			  	echo "<script>
			    		location.href='ExcelHistorial.php?fechaDesde=$fechaD & fechaHasta=$fechaH';
		 			</script>";
	 		}


	    }  

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
					
					<div class="botones">
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

	    <!-- CAPTURA FECHAS -->
	    <script type="text/javascript">
	        $(function () {
	            $('#datetimepicker6').datetimepicker({format: 'DD-MM-YYYY'});
	            $('#datetimepicker7').datetimepicker({format: 'DD-MM-YYYY'});	  
	        });
	    </script>
	    
	    <!-- BOTON PARA BUSCAR LOS DATOS -->
		<div class="botones">
			<button name="botonMostrar" id="botonMostrar" type="submit" class="btn btn-warning">Mostrar</button>
		</div>

		<!-- TABLA HISTORIAL DEL PEDIDO DURANTE EL DIA -->
		<div class="wrapper">
				<h2>Historial de pedidos </h2>


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

								$fecha2 = strtotime($fecha);
								$fechaDesde2 = strtotime($fechaDesde);
								$fechaHasta2 = strtotime($fechaHasta);

								?> 


								<?php if( $fecha2 >= $fechaDesde2 && $fecha2<=$fechaHasta2)
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

			<!-- BOTON PARA PASAR A EXCEL LA TABLA CON LA INFORMACION -->
			<div class="botones">
				<button name="botonExcel" id="botonExcel" type="submit" class="btn btn-warning">Excel</button>
			</div>

		</div>

		<input  type="hidden" class="form-control" name='Fecha1' value="<?php echo $fechaDesde ?>">

	    <input  type="hidden" class="form-control" name='Fecha2' value="<?php echo $fechaHasta ?>">

	</form>
	
	<footer>Derechos Reservados | kable &copy</footer>
</body>
</html>

<!--<script>
	var fechaIni="";
	var fechaFin="";
	function capturarFechas() 
	{
		fechaIni= document.getElementById('datetimepicker6');
		fechaFin= document.getElementById('datetimepicker7');

	}
	function enviaDatos() 
	{
	    //$.post("Prueba.php",{fechaDesde: fechaIni, fechaHasta: fechaFin},function(){});

	}

</script>-->
