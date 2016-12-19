<?php
	$usu=$_REQUEST['usu'];
	$pas=$_REQUEST['pas'];

	$cnx=new PDO("mysql:host=localhost;dbname=webapp;charset=utf8","root","");
	$res=$cnx->query("SELECT * FROM cat_usuario WHERE cve_usuario='$usu' AND password='$pas'");

	$datos=array();

	foreach ($res as $row) {
		$datos[]=$row;
	}

	echo json_encode($datos);
?>
