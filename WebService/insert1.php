<?php

	$con = mysql_connect('localhost','root','') or die("connection failed");
	mysql_select_db("webapp",$con) or die("db selection failed");
	 
	$id=$_REQUEST['id'];
	$calificacion=$_REQUEST['calificacion'];

	$flag['code']=0;

	if($r=mysql_query("INSERT INTO comentario(id, calificacion) values ('$id', '$calificacion')",$con))
	{
		$flag['code']=1;
		echo"hi";
	}

	print(json_encode($flag));
	mysql_close($con);
?>