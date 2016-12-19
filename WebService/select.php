<?php
	$mysqli=new mysqli("localhost","root","","webapp"); //servidor, usuario de base de datos, contraseña del usuario, nombre de base de datos
	
	if(mysqli_connect_errno()){
		echo 'Conexion Fallida : ', mysqli_connect_error();
		exit();
	}

	$id=$_REQUEST['id'];

	$query="SELECT * FROM socio WHERE id='$id'";

	$resultado=$mysqli->query($query);

	while($socio=$resultado->fetch_assoc()){ 
        echo $socio['nombresocio'];
        echo "<br>";
    }


?>