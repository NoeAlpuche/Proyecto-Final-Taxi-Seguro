<?php 
	include("conexion.php"); 
	
	$id=$_POST['id'];
	$origen=$_POST['origen'];
	$destino=$_POST['destino'];
	$costo=$_POST['costo'];
	
	$query="UPDATE tabulador SET origen='$origen', destino='$destino', costo='$costo' WHERE id='$id'";
	
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