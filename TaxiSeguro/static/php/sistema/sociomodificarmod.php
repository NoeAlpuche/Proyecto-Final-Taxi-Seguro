<?php 
	include("conexion.php"); 
	
	$id=$_POST['id'];
	$numerotaxi=$_POST['numerotaxi'];
	$nombresocio=$_POST['nombresocio'];
	$password=$_POST['password'];
	$edad=$_POST['edad'];
	$tiposocio=$_POST['tiposocio'];
	
	$query="UPDATE socio SET numerotaxi='$numerotaxi', nombresocio='$nombresocio', password='$password', edad='$edad', tiposocio='$tiposocio' WHERE id='$id'";
	
	$resultado=$mysqli->query($query);
	
?>

<html>
	<head>
		<title>Modificar usuario</title>
	</head>
	
	<body>
		<center>
			
			<?php 
				if($resultado>0){
				?>
				
				<h1>Usuario Modificado</h1>
				
					<?php 	}else{ ?>
				
				<h1>Error al Modificar Usuario</h1>
				
			<?php	} ?>
			
			<p></p>	
				
			<?php
				header('Location: '.$_SERVER['HTTP_REFERER']);
			?>
			
		</center>
	</body>
</html>