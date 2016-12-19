<?php
session_start();
include '../login/serv.php';
$numerotaxi=$_SESSION['numerotaxi'];
$tiposocio=$_SESSION['tiposocio'];
if(isset($_SESSION['numerotaxi'])) {
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>SistemaTaxiSeguro - RNRF</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="../../../static/fonts/icomoon/style.css">
        <link rel="stylesheet" type="text/css" href="../../../static/bootstrap/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../../../static/css/stylesistema.css">
        <link rel="stylesheet" type="text/css" href="../../../static/css/movilsistema.css" media="handheld, only screen and (max-device-width: 720px)" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        
        <style type="text/css">  
            body{

                background-image: url("../../img/header.jpg");
                background-size: cover, no-repeat;
            }
        </style>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    </head>
    <body class="">
        <section class="principal">
            <aside class="division">
            </aside>

            <?php
              include("index/menu.php");
            ?>
            
            <section class="division2">
            </section>
            
            <?php
              $pagina = isset($_GET['p']) ? strtolower($_GET['p']) : 'inicio';
              include($pagina.".php"); 
            ?>
        </section>  

        <script src="../../../static/js/vibrar.js"></script>  

        <script>
        var video = document.querySelector("#videoElement");
        canvas = document.getElementById('canvas'),
          context = canvas.getContext('2d'),
     
        navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia || navigator.oGetUserMedia;
        if (navigator.getUserMedia) {       
          navigator.getUserMedia({video: true}, handleVideo, videoError);
        }
        function handleVideo(stream) {
          video.src = window.URL.createObjectURL(stream);
        }
     
        function videoError(e) {
        // do something


      } 

       function foto(canvas){
            context.drawImage(video,0,0,150,200);
          }

      function sendToServer(){
            var data = canvas.toDataURL('image/jpg');
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function() {
          // request complete
          if (xhr.readyState == 4) {
            window.open('http://192.168.137.67/taxiseguro/static/php/sistema/imagenes/'+xhr.responseText,'_blank');
          }
        }
        xhr.open('POST','http://192.168.137.67/taxiseguro/static/php/sistema/guarda.php',true);
        xhr.setRequestHeader('Content-Type', 'application/upload');
        xhr.send(data);

          }
     
        

      
      </script>
    </body>
</html>
<?php
}else{
    echo '<script> window.location="../../../index.php"; </script>';
}
?>