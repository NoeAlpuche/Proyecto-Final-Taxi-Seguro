<section class="menu">
  <nav class="nav navprimero">
      <ul class="nav2">
          <li class="<?php echo $pagina == 'inicio' ? 'active' : ''; ?>"><a href="?p=inicio"><span class="icon-home"></span>Inicio</a></li>
          <li class="<?php echo $pagina == 'sociolista' ? 'active' : ''; ?>"><a href="?p=sociolista"><span class="icon-profile"></span>Lista de Socios</a></li>
          <li class="<?php echo $pagina == 'tarifalista' ? 'active' : ''; ?>"><a href="?p=tarifalista"><span class="icon-coin-dollar"></span>Tabulador</a></li>
          <li class="<?php echo $pagina == 'comentariolista' ? 'active' : ''; ?>"><a href="?p=comentariolista"><span class="icon-envelop"></span>Comentarios</a></li>
          <li><a><span class="icon-info"></span> Acerca de <span class="caret"></span></a>
            <ul>
                <li><a href="">Contacto</a></li>
                <li><a href="">Informacion</a></li>
            </ul>
        </li>
        <li><a href="../login/logout.php"><span class="icon-user"></span>Salir</a></li>

        <?php
          echo "<a><h3>No. de Taxi: ".$_SESSION['numerotaxi']."</h3></a>";
          echo "<a><h4>Nombre: ".$_SESSION['nombresocio']."</h4></a>";
          echo "<a><h4>Tipo: ".$_SESSION['tiposocio']."</h4></a>";
        
        ?>

      

      </ul>
  </nav>

  <div class="row navsegundo">
    <div class="col-sm-12">
      <div class="dropdown">
        <button class="btn btnmenu dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"><span class="icon-menu"></span></button>
        <h1 class="h2menu">Menu</h1>
        <ul class="dropdown-menu nav2" role="menu" aria-labelledby="dropdownMenu1">
            <li class="<?php echo $pagina == 'inicio' ? 'active' : ''; ?>"><a href="?p=inicio"><span class="icon-home"></span>Inicio</a></li>
            <li class="<?php echo $pagina == 'sociolistamovil' ? 'active' : ''; ?>"><a href="?p=sociolistamovil"><span class="icon-profile"></span>Lista de Socios</a></li>
            <li class="<?php echo $pagina == 'tarifalistamovil' ? 'active' : ''; ?>"><a href="?p=tarifalistamovil"><span class="icon-coin-dollar"></span>Tabulador</a></li>
            <li class="<?php echo $pagina == 'comentariolistamovil' ? 'active' : ''; ?>"><a href="?p=comentariolistamovil"><span class="icon-envelop"></span>Comentarios</a></li>
            
            <li class="<?php echo $pagina == 'usuariolistamovil' ? 'active' : ''; ?>"><a href="?p=usuariolistamovil"><span class="icon-envelop"></span>Usuarios</a></li>
            <li><a href=""><span class="icon-info"></span> Acerca de </a>
            </li>
            <li><a href="../login/logout.php"><span class="icon-user"></span>Salir</a></li>
        </ul>
      </div>
    <?php
          echo "<h3>No. de Taxi: ".$_SESSION['numerotaxi']."</h3>";
          echo "<h4>Nombre: ".$_SESSION['nombresocio']."</h4>";
          echo "<h4>Tipo: ".$_SESSION['tiposocio']."</h4>";
        ?>
    </div>
  </div>  
</section>