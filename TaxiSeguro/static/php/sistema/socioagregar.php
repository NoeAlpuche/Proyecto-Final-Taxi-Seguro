<?php

// Connexion à la base de données
require_once('bdd.php');
//echo $_POST['title'];
if (isset($_POST['numerotaxi']) && isset($_POST['nombresocio']) && isset($_POST['password']) && isset($_POST['edad']) && isset($_POST['tiposocio']) ){
	
	$numerotaxi = $_POST['numerotaxi'];
	$nombresocio = $_POST['nombresocio'];
	$password = $_POST['password'];
	$edad = $_POST['edad'];
	$tiposocio = $_POST['tiposocio'];

	$sql = "INSERT INTO socio(numerotaxi, nombresocio, password, edad, tiposocio) values ('$numerotaxi', '$nombresocio', '$password', '$edad', '$tiposocio')";
	//$req = $bdd->prepare($sql);
	//$req->execute();
	
	echo $sql;
	
	$query = $bdd->prepare( $sql );
	if ($query == false) {
	 print_r($bdd->errorInfo());
	 die ('Erreur prepare');
	}
	$sth = $query->execute();
	if ($sth == false) {
	 print_r($query->errorInfo());
	 die ('Erreur execute');
	}

}
header('Location: '.$_SERVER['HTTP_REFERER']);
//header('Location: ../sistema.php');	
?>
