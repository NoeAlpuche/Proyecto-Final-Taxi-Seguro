<?php

$mysqli=new mysqli("localhost","root","","webapp");

if(mysqli_connect_errno()){
	echo 'conecxion fallida: ',mysqli_connect_errno();
	exit();
}

$id=$_REQUEST['num_taxi'];

$query="SELECT * FROM socio WHERE numerotaxi='$numerotaxi'";

$resultado=$mysqli->query($query);

while($socio=$resultado->fetch_assoc()){
	echo $socio['nombresocio'];
	echo "   ";
	echo $socio['edad'];
	echo "\n";
	
}

?>