<?php
	session_start(); 
?>
<!DOCTYPE html>
<html>
<head>
<head>
	<title>Validando...</title>
	<meta charset="utf-8">
</head>
</head>
<body>
	
		<?php
		
			include 'serv.php';
			if(isset($_POST['login'])){
				$numerotaxi = $_POST['numerotaxi'];
				$pw = $_POST['password'];
				$log = mysql_query("SELECT * FROM socio WHERE numerotaxi='$numerotaxi' AND password='$pw'");
				if (mysql_num_rows($log)>0) {
					$row = mysql_fetch_array($log);
					$_SESSION["numerotaxi"] = $row['numerotaxi']; 
					$_SESSION["nombresocio"] = $row['nombresocio']; 
					$_SESSION["tiposocio"] = $row['tiposocio']; 
				  	echo 'Iniciando sesión para '.$_SESSION['numerotaxi'].' <p>';
					echo '<script> window.location="../sistema/sistema.php"; </script>';
				}
				else{
					echo '<script> alert("Usuario o contraseña incorrectos.");</script>';
					echo '<script> window.location="../../../index.php"; </script>';
				}
			}
		?>

		<?php
		/*
		mysql_connect("localhost","root","");
		mysql_select_db("webapp");
		$numerotaxi=strtolower($_POST["numerotaxi"]);
		$password=$_POST["password"];
		if ($numerotaxi!="" && $password="") {
			$sql=mysql_query("SELECT * FROM socio WHERE numerotaxi='.$numerotaxi'");
			if($f=mysql_fetch_array($sql)){
				if ($f["password"] == $password) {
					$_SESSION["numerotaxi"]= $f['numerotaxi'];
					echo 'Iniciando sesión para '.$_SESSION['numerotaxi'].' <p>';
					echo '<script> window.location="../sistema/sistema.php"; </script>';
				}
				else{
					echo '<script> alert("Usuario o contraseña incorrectos.");</script>';
					echo '<script> window.location="../../../index.php"; </script>';
				}
			}
		}
		*/
		?>
</body>
</html>