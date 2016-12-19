
<?php
	$host='localhost';
	$uname='root';
	$pwd='';
	$db="webapp";

	$con = mysql_connect($host,$uname,$pwd) or die("connection failed");
	mysql_select_db($db,$con) or die("db selection failed");
	 
	$id=$_REQUEST['id'];
	 
	$r=mysql_query("SELECT * FROM cat_usuario WHERE cve_usuario='$usu' AND password='$pas'",$con);

	while($row=mysql_fetch_array($r))
	{
		$flag['name']=$row['nombresocio'];
	}
	 
	print(json_encode($flag));
	mysql_close($con);
?>