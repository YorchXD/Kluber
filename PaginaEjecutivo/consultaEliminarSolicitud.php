<?php


	include("conexion.php");


	$id = $_GET["id"];

	$registroPedido=$base->query("select * from pedido where id='$id'")->fetchAll(PDO::FETCH_OBJ);

	$taxista = $registroPedido[0]->RefChoferTaxista;

	$base->query("delete from pedido where id='$id'");

	$base->query("update disponibilidadchoferes set estado='disponible' where RefTaxista='$taxista'");

	sleep(3);

	header("Location:Principal.php");
	//echo "patente: ".$_POST["patente"];


?>

