<?php


	include("conexion.php");


	$patente = $_GET["rut"];

	$base->query("delete from taxi where rut='$rut'");

	header("Location:MostrarTaxista.php");
	//echo "patente: ".$_POST["patente"];


?>

