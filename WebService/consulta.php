<?php

$mysqli=new mysqli("localhost","root","","webapp");

if(mysqli_connect_errno()){
	echo 'conecxion fallida: ',mysqli_connect_errno();
	exit();
}

$id=$_REQUEST['num_taxi'];

$query="SELECT * FROM servicio WHERE num_taxi='$id'";

$resultado=$mysqli->query($query);

while($socio=$resultado->fetch_assoc()){
	echo $socio['calificacion'];
	echo "   ";
	echo $socio['comentario'];
	echo "\n";
	
}

?>