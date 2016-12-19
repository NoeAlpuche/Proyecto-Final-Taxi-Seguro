<section class="principalinfo">
<h2>Socios</h2>

<?php
    include("conexion.php"); 

    if($_SESSION['tiposocio']=="administrador") {
        $query="SELECT id, numerotaxi, nombresocio, password, edad, tiposocio FROM socio";
    }else if($_SESSION['tiposocio']=="socio") {
        $query="SELECT id, numerotaxi, nombresocio, password, edad, tiposocio FROM socio WHERE numerotaxi LIKE '$numerotaxi%'";
    }else{
        $query="SELECT id, numerotaxi, nombresocio, password, edad, tiposocio FROM socio WHERE numerotaxi LIKE '$numerotaxi%'";
    }

    $resultado=$mysqli->query($query);
?>

<?php
    if($_SESSION['tiposocio']=="administrador") {
        echo'<button class="btn btn-primary btn-block boton1" type="button" data-toggle="modal" data-target="#ModalAdd"><span class="icon-plus"></span> Agregar nuevo socio</button>';
    }else if($_SESSION['tiposocio']=="socio") {
        echo'<button class="btn btn-primary btn-block boton1" type="button" data-toggle="modal" data-target="#ModalAdd"><span class="icon-plus"></span> Agregar nuevo socio</button>';
    }else{
    }
?>

<div class="table-responsive tabla11" id="tabledefinida">
    <table class="table table-hover tabla2">
        <thead>
        <?php while($socio=$resultado->fetch_assoc()){ ?>
        <tr class="encabezadotabla">
            <th>Numero de taxi</th>
            <td><?php echo $socio['numerotaxi'];?></td>
        </tr>
        <tr class="encabezadotabla">
            <th>Nombre</th>
            <td><?php echo $socio['nombresocio'];?></td>
        </tr>
        <tr class="encabezadotabla">
            <th>Edad</th>
            <td><?php echo $socio['edad'];?></td>
        </tr>
        <tr class="encabezadotabla">
            <th>TipoSocio</th>
            <td><?php echo $socio['tiposocio'];?></td>
        </tr>
        <tr class="encabezadotabla">
            <?php
                if($_SESSION['tiposocio']=="administrador") {
                    echo'<th>Opcion</th>';
                }else if($_SESSION['tiposocio']=="socio") {
                    echo'<th>Opcion</th>';
                }else{
                }
            ?>
            <?php
                if($_SESSION['tiposocio']=="administrador") {
                    echo'<td>';
                        echo'<a class="btn btn-warning btn-xs" href="sociomodificar.php?id=';?><?php echo $socio['id'];?><?php echo'"  type="button" data-toggle="modal" data-target="#ModalVer"><span class="icon-pencil2"></span> Editar</a>';
                    echo'</td>';
                }else if($_SESSION['tiposocio']=="socio") {
                    echo'<td>';
                    echo'<a class="btn btn-warning btn-xs" href="sociomodificar.php?id=';?><?php echo $socio['id'];?><?php echo'"  type="button" data-toggle="modal" data-target="#ModalVer"><span class="icon-pencil2"></span> Editar</a>';
                    echo'</td>';
                }else{
                }
            ?>
        </tr>
        <tr class="encabezadotabla">
            <?php
                if($_SESSION['tiposocio']=="administrador") {
                    echo'<th></th>';
                }else if($_SESSION['tiposocio']=="socio") {
                    echo'<th></th>';
                }else{
                }
            ?>
            <?php
                if($_SESSION['tiposocio']=="administrador") {
                    echo'<td>';
                        echo'<a class="btn btn-danger btn-xs" href="socioeliminar.php?id=';?><?php echo $socio['id'];?><?php echo'"  type="button" data-toggle="modal" data-target="#ModalVer"><span class="icon-minus"></span> Eliminar</a>';
                    echo'</td>';
                }else if($_SESSION['tiposocio']=="socio") {
                    echo'<td>';
                    echo'<a class="btn btn-danger btn-xs" href="socioeliminar.php?id=';?><?php echo $socio['id'];?><?php echo'"  type="button" data-toggle="modal" data-target="#ModalVer"><span class="icon-minus"></span> Eliminar</a>';
                    echo'</td>';
                }else{
                }
            ?>
        </tr>
        <?php } ?>
        </thead>
    </table>
</div>


            

<!-- Modal -->
<div class="modal fade" id="ModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal" method="POST" action="socioagregar.php">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Agregar Socio</h4>
                </div>
                
                <div class="modal-body">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">Foto</label>
                        <div class="col-sm-10">
                            <video autoplay="true" id="videoElement"></video>
                            <canvas id="canvas" width="150%" height="206%"></canvas>
                            <input type=button value="Tomar Foto" onClick="foto()">
                            <input type=button value="Guardar Foto" onClick="sendToServer()">
                        </div>
                    </div>
                    <!--
                    <div class="form-group">
                        <label for="numerotaxi" class="col-sm-2 control-label">No. de Taxi</label>
                        <div class="col-sm-10">
                            <input type="text" name="numerotaxi" class="form-control" id="numerotaxi" required>
                        </div>
                    </div>
                    -->
                    <div class="form-group">
                        <label for="numerotaxi" class="col-sm-2 control-label">No. de Taxi</label>
                        <div class="col-sm-10">
                            <?php
                                if($_SESSION['tiposocio']=="administrador") {
                                    echo'<input type="text" name="numerotaxi" class="form-control" id="numerotaxi" required>';
                                }else if($_SESSION['tiposocio']=="socio") {
                                    echo'<input type="text" name="numerotaxi" class="form-control" id="numerotaxi" value="';?><?php echo $_SESSION['numerotaxi']; ?><?php echo'"required readonly="readonly">';
                                }else{
                                    echo'<input type="text" name="numerotaxi" class="form-control" id="numerotaxi" required disabled>';
                                }
                            ?>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="nombresocio" class="col-sm-2 control-label">Nombre</label>
                        <div class="col-sm-10">
                            <input type="text" name="nombresocio" class="form-control" id="nombresocio" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-10">
                            <input type="text" name="password" class="form-control" id="password">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="edad" class="col-sm-2 control-label">Edad</label>
                        <div class="col-sm-10">
                            <input type="text" name="edad" class="form-control" id="edad">
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="tiposocio" class="col-sm-2 control-label">Tipo usuario</label>
                        <div class="col-sm-10">
                            <select name="tiposocio" class="form-control" id="tiposocio" required>
                                <option value="">Seleccione una opcion</option>
                                <option value="socio">Socio</option>
                                <option value="conductor">Conductor</option> 
                            </select>
                        </div>
                    </div>
                    
                </div>
              
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary">Guardar cambios</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="ModalVer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            
        </div>
    </div>
</div>


</section>