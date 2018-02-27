<?php


	include("conexion.php");


	$patente = $_GET["patente"];

	$base->query("delete from taxi where patente='$patente'");

	header("Location:MostrarTaxi.php");
	//echo "patente: ".$_POST["patente"];


?>

