<?php

// Connexion à la base de données
require_once('bdd.php');
//echo $_POST['title'];
if (isset($_POST['origen']) && isset($_POST['destino']) && isset($_POST['costo']) ){
	
	$origen = $_POST['origen'];
	$destino = $_POST['destino'];
	$costo = $_POST['costo'];

	$sql = "INSERT INTO tabulador(origen, destino, costo) values ('$origen', '$destino', '$costo')";
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
