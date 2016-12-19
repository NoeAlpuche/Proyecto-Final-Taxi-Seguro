<?php
  define('HOST','localhost');
  define('USER','root');
  define('PASS','');
  define('DB','webapp');
  $con = mysqli_connect(HOST,USER,PASS,DB);

   $name = $_POST['name'];
  $address = $_POST['address'];

  $sql = "insert into retrofit_users (name,address) values ('$name','$address')";
  if(mysqli_query($con,$sql)){
    echo 'success';
  }
  else{
    echo 'failure';
  }
  mysqli_close($con);
?>