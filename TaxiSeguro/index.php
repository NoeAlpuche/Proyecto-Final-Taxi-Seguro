<?php
    session_start();
    include 'static/php/login/serv.php';
    if(isset($_SESSION['numerotaxi'])){
    echo '<script> window.location="static/php/sistema/sistema.php"; </script>';
    }
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>TaxiSeguro - RNRF</title>
        <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="static/fonts/icomoon/style.css">
        <link rel="stylesheet" type="text/css" href="static/css/styleindex.css">
        <link rel="stylesheet" type="text/css" href="static/css/movilindex.css" media="handheld, only screen and (max-device-width: 640px)" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <style type="text/css">
          body{
              background-image: url("static/img/header.jpg");
              background-size: cover no-repeat;
          }
        </style>
    </head>
    <body class="container">
        <section class="principal">
            <?php
              include("static/php/index/menu.php");

              $pagina = isset($_GET['p']) ? strtolower($_GET['p']) : 'inicio';
              include("static/php/index/".$pagina.".php"); 
            ?>
    
        </section>

        
        <script src="static/js/vibrar.js"></script>         
    </body>
</html>
