<?php
	require("bd.php");

	$usuario = $_POST['nnombre'];
	$clave = $_POST['npassword'];

	if(empty($usuario) || empty($clave))
	{
		header("Location: index.html");
		exit();
	}

	$statement = mysqli_prepare($conexion, "SELECT * FROM admin WHERE usuario = ? AND clave = ?");
    mysqli_stmt_bind_param($statement, "ss", $usuario, $clave);
    mysqli_stmt_execute($statement);
    
    mysqli_stmt_store_result($statement);
    mysqli_stmt_bind_result($statement, $usuario, $clave);

	if(mysqli_stmt_fetch($statement))
	{
		session_start();
		$_SESSION['usuario'] = $usuario;
		header("Location: Principal.php");
	}
	else
	{
		header("Location: index.html");
		exit();
	}
?>