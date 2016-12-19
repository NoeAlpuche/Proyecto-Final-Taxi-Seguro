<section class="principalinfo">
<h2>Tarifas</h2>

<?php
    include("conexion.php"); 

    $query="SELECT id, origen, destino, costo FROM tabulador";
    
    $resultado=$mysqli->query($query);
?>
<?php
    if($_SESSION['tiposocio']=="administrador") {
        echo'<button class="btn btn-primary btn-block boton1" type="button" data-toggle="modal" data-target="#ModalAdd"><span class="icon-plus"></span> Agregar nueva tarifa</button>';
    }else{
    }
?>



<div class="table-responsive tabla22" id="tabledefinida">
    <table class="table table-hover tabla1">
        <thead>
        <tr class="encabezadotabla">
            <th>Lugar de Origen</th>
            <th>Lugar de Destino</th>
            <th>Costo</th>
            <?php
                if($_SESSION['tiposocio']=="administrador") {
                    echo'<th>Opcion</th>';
                }else{
                }
            ?>
        </tr>
        </thead>
        <tbody>
        <?php while($socio=$resultado->fetch_assoc()){ ?>
                <tr>
                    <td><?php echo $socio['origen'];?></td>
                    <td><?php echo $socio['destino'];?></td>
                    <td><?php echo $socio['costo'];?></td>
                        <?php
                            if($_SESSION['tiposocio']=="administrador") {
                                echo'<td>';
                                    echo'<a class="btn btn-warning btn-xs" href="tarifamodificar.php?id=';?><?php echo $socio['id'];?><?php echo'"  type="button" data-toggle="modal" data-target="#ModalVer"><span class="icon-pencil2"></span> Editar</a>';
                                    echo'<a class="btn btn-danger btn-xs" href="tarifaeliminar.php?id=';?><?php echo $socio['id'];?><?php echo'"  type="button" data-toggle="modal" data-target="#ModalVer"><span class="icon-minus"></span> Eliminar</a>';
                                echo'</td>';
                            }else{
                            }
                        ?>
                    </td>
                </tr>
                <?php } ?>
        </tbody>
    </table>
</div>

            

<!-- Modal -->
<div class="modal fade" id="ModalAdd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal" method="POST" action="tarifaagregar.php">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Agregar Socio</h4>
                </div>
                
                <div class="modal-body">                  
                    <div class="form-group">
                        <label for="origen" class="col-sm-2 control-label">Lugar de Origen</label>
                        <div class="col-sm-10">
                            <select name="origen" class="form-control" id="origen" required>
                                <option value="">Seleccione una opcion</option>
                                <option value="Centro">Centro</option>
                                <option value="Dina">Dina</option>
                                <option value="Fovissste 5 Etapa">Fovissste 5 Etapa</option>
                                <option value="Clinica de la mujer">Clinica de la mujer</option>
                                <option value="Expofer">Expofer</option>
                                <option value="Residencial Marsella">Residencial Marsella</option>
                                <option value="Forjadores">Forjadores</option>
                                <option value="Jardines">Jardines</option>
                                <option value="8 Octubre">8 Octubre</option>
                                <option value="Las casitas">Las casitas</option>
                                <option value="Lopez Mateos">Lopez Mateos</option>
                                <option value="Proterritorio">Proterritorio</option>
                                <option value="Solidaridad">Solidaridad</option>
                                <option value="Magisterial">Magisterial</option>
                                <option value="Payo Obispo">Payo Obispo</option>
                                <option value="Lagunitas los monos">Lagunitas los monos</option>
                                <option value="Nuevo Progreso">Nuevo Progreso</option>
                                <option value="Lazaro Cardenas">Lazaro Cardenas</option>
                                <option value="Arboledas">Arboledas</option>
                                <option value="Santa Maria">Santa Maria</option>
                                <option value="Caribe">Caribe</option>
                                <option value="Las Americas 1 y 2">Las Americas 1 y 2</option>
                                <option value="Las Americas 3 y 4">Las Americas 3 y 4</option>
                                <option value="Pacto Obrero">Pacto Obrero</option>
                                <option value="Calderitas">Calderitas</option>
                            </select>
                        </div>
                    </div> 
                  
                    <div class="form-group">
                        <label for="destino" class="col-sm-2 control-label">Lugar de Destino</label>
                        <div class="col-sm-10">
                            <select name="destino" class="form-control" id="destino" required>
                                <option value="">Seleccione una opcion</option>
                                <option value="Centro">Centro</option>
                                <option value="Dina">Dina</option>
                                <option value="Fovissste 5 Etapa">Fovissste 5 Etapa</option>
                                <option value="Clinica de la mujer">Clinica de la mujer</option>
                                <option value="Expofer">Expofer</option>
                                <option value="Residencial Marsella">Residencial Marsella</option>
                                <option value="Forjadores">Forjadores</option>
                                <option value="Jardines">Jardines</option>
                                <option value="8 Octubre">8 Octubre</option>
                                <option value="Las casitas">Las casitas</option>
                                <option value="Lopez Mateos">Lopez Mateos</option>
                                <option value="Proterritorio">Proterritorio</option>
                                <option value="Solidaridad">Solidaridad</option>
                                <option value="Magisterial">Magisterial</option>
                                <option value="Payo Obispo">Payo Obispo</option>
                                <option value="Lagunitas los monos">Lagunitas los monos</option>
                                <option value="Nuevo Progreso">Nuevo Progreso</option>
                                <option value="Lazaro Cardenas">Lazaro Cardenas</option>
                                <option value="Arboledas">Arboledas</option>
                                <option value="Santa Maria">Santa Maria</option>
                                <option value="Caribe">Caribe</option>
                                <option value="Las Americas 1 y 2">Las Americas 1 y 2</option>
                                <option value="Las Americas 3 y 4">Las Americas 3 y 4</option>
                                <option value="Pacto Obrero">Pacto Obrero</option>
                                <option value="Calderitas">Calderitas</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="costo" class="col-sm-2 control-label">Costo</label>
                        <div class="col-sm-10">
                            <input type="text" name="costo" class="form-control" id="costo">
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