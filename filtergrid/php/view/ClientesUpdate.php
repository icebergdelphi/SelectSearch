<?php

// Conexion a la Bd
require '../MvcClientesDatabase.php';
mysql_select_db($db_name,$connection) or die("Error de conexion a la base de datos");

	$info = $_POST["data"];

	$data = json_decode(stripslashes($info));

	$Cliente = $data->Cliente;
	$Sexo = $data->Sexo;
	$Edad = $data->Edad;
	$id = $data->idcliente;
	
	 $SqlUpdate ="UPDATE `Clientes` SET `Cliente`='$Cliente',`Sexo`='$Sexo',`Edad`='$Edad' WHERE idcliente=$id;";
			
	$rs = mysql_query($SqlUpdate) ;

	echo json_encode(array(
		"success" 	=>  true,
		"msg"		=> mysql_errno() == 0?"Datos Actualizados formalmente Joe":mysql_error()
	));