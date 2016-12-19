<?php 
	include("conexion.php"); 

	if (isset($_POST["delete"]) && isset($_POST["id"])){
	
	$id=$_POST['id'];
	$query="DELETE FROM comentario WHERE id='$id'";
	
	$resultado=$mysqli->query($query);
	}
?>

<html>
	<head>
		<title>Eliminar usuario</title>
	</head>
	
	<body>
		<center>
			<?php 
				if($resultado>0){
				?>
				
				<h1>Usuario Eliminado</h1>
				
				<?php 	}else{ ?>
				
				<h1>Error al Eliminar Usuario</h1>
				
			<?php	} ?>
			<p></p>		
			<?php
				header('Location: '.$_SERVER['HTTP_REFERER']);
			?>
        
		</center>
	</body>
</html>