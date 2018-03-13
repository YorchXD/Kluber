<?php


	include("conexion.php");

	$numero = $_POST["numer"];

	$registroCostoInicial=$base->query("select * from precios")->fetchAll(PDO::FETCH_OBJ);

	if($numero==1)
	{
		$costoInicial = $registroCostoInicial[0]->costoInicial;

		echo $costoInicial;
	}

	if($numero==2)
	{
		$costoMetro = $registroCostoInicial[0]->costoMetro;

		echo $costoMetro;
	}

	//echo "patente: ".$_POST["patente"];


?>

